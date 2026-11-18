"""
Corrige les SLD exportés depuis QGIS pour que GeoServer dessine comme QGIS.

Entrée  : styles/export-qgis/<nom>.sld  (export brut de QGIS, jamais modifié)
Sortie  : styles/<nom>.sld              (version corrigée, importée dans GeoServer)

L'export SLD de QGIS perd ou déforme quatre choses que ce script rétablit à partir du projet QGIS :
  1. Les épaisseurs de contour et tailles de symboles : l'export arrondit au 0,5 px
     (0,2 mm -> 1 px au lieu de 0,76 px), d'où des traits trop épais et trop sombres.
  2. Les traits de moins d'1 px : GeoServer (Java2D) les élargit à 1 px plein alors que QGIS les
     dessine en partie transparents. On les passe à 1 px avec une opacité égale à leur largeur.
  3. Les expressions d'échelle (@map_scale) sur la couleur de remplissage et de contour :
     traduites en env('wms_scale_denominator'), que GeoServer évalue à chaque rendu.
  4. Le motif Qt « dense6 », inconnu de GeoServer : remplacé par un semis de points équivalent.

Usage :  python scripts/corriger-sld.py <projet.qgs|projet.qgz>
   ou :  QGIS_PROJECT=<projet.qgs> python scripts/corriger-sld.py
Puis :   bash scripts/importer-styles.sh

Les fichiers SLD sont associés aux couches QGIS par leur « nom court » (Propriétés de la couche >
QGIS Server > Nom court) : styles/export-qgis/<nom_court>.sld.
Le script se relance sans risque (il repart toujours de l'export brut).
Les fichiers SLD écrits à la main (marqués « SLD manuel ») ne sont pas touchés.
"""
import os
import pathlib
import re
import sys
import zipfile
import xml.etree.ElementTree as ET

ROOT = pathlib.Path(__file__).resolve().parent.parent
STYLES = ROOT / "styles"
EXPORT = STYLES / "export-qgis"
MM_TO_PX = 96 / 25.4  # QGIS rend à 96 dpi : 1 mm = 3,78 px

SCALE_ENV = (
    '<ogc:Function name="lessEqualThan">'
    '<ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal>'
    "<ogc:Literal>1000000000</ogc:Literal></ogc:Function>"
    "<ogc:Literal>{scale}</ogc:Literal></ogc:Function>"
)


def fmt(x: float) -> str:
    return f"{x:.2f}".rstrip("0").rstrip(".")


def if_scale(scale: str, near: str, far: str) -> str:
    """Valeur 'near' si échelle <= scale (zoom avant), sinon 'far'."""
    return (
        '<ogc:Function name="if_then_else">' + SCALE_ENV.format(scale=scale)
        + f"<ogc:Literal>{near}</ogc:Literal><ogc:Literal>{far}</ogc:Literal></ogc:Function>"
    )


def rgb_hex(r, g, b) -> str:
    return "#{:02x}{:02x}{:02x}".format(int(r), int(g), int(b))


def load_project(path: pathlib.Path) -> ET.Element:
    """Lit un projet .qgs, ou le .qgs contenu dans un .qgz."""
    if path.suffix.lower() == ".qgz":
        with zipfile.ZipFile(path) as z:
            name = next(n for n in z.namelist() if n.lower().endswith(".qgs"))
            return ET.fromstring(z.read(name))
    return ET.parse(path).getroot()


def qgis_layers(qgs: pathlib.Path):
    root = load_project(qgs)
    for ml in root.iter("maplayer"):
        sn = ml.findtext("shortname")
        rd = ml.find("renderer-v2")
        if not sn or rd is None or rd.find("symbols") is None:
            continue
        widths, sizes, dd = set(), set(), {}
        for sl in rd.find("symbols").iter("layer"):
            o = {x.get("name"): x.get("value") for x in sl.findall("Option/Option")}
            for k in ("outline_width", "line_width"):
                if k in o and o.get(k + "_unit", "MM") == "MM":
                    widths.add(float(o[k]))
            if sl.get("class") == "SimpleMarker" and o.get("size_unit", "MM") == "MM":
                sizes.add(float(o["size"]))
            for opt in sl.iter("Option"):
                if opt.get("type") == "Map" and opt.get("name") in ("fillColor", "outlineColor"):
                    d = {x.get("name"): x.get("value") for x in opt.findall("Option")}
                    if d.get("active") == "true" and d.get("expression"):
                        dd[opt.get("name")] = d["expression"]
        yield sn, widths, sizes, dd


def fix_strokes(sld: str, px: float):
    """Met chaque <se:Stroke> à la bonne épaisseur ; sous 1 px : 1 px avec opacité = largeur."""
    def repl(m):
        block = m.group(0)
        if px >= 1:
            return re.sub(r'(name="stroke-width">)[^<]*(<)', rf"\g<1>{fmt(px)}\g<2>", block)
        op = re.search(r'name="stroke-opacity">([0-9.]+)<', block)
        new_op = fmt((float(op.group(1)) if op else 1.0) * px)
        block = re.sub(r'(name="stroke-width">)[^<]*(<)', r"\g<1>1\g<2>", block)
        if op:
            return re.sub(r'(name="stroke-opacity">)[^<]*(<)', rf"\g<1>{new_op}\g<2>", block)
        return block.replace('<se:SvgParameter name="stroke-width">',
                             f'<se:SvgParameter name="stroke-opacity">{new_op}</se:SvgParameter>'
                             '<se:SvgParameter name="stroke-width">', 1)
    return re.subn(r"<se:Stroke>.*?</se:Stroke>", repl, sld, flags=re.S)


def fix(sn, widths, sizes, dd):
    src, path = EXPORT / f"{sn}.sld", STYLES / f"{sn}.sld"
    if not src.exists():
        return
    if path.exists() and "SLD manuel" in path.read_text(encoding="utf-8"):
        return
    sld = src.read_text(encoding="utf-8")
    notes = []

    # 1-2. Épaisseurs exactes (une seule épaisseur par couche dans ce projet ; 0 = trait fin QGIS, on garde)
    w = [x for x in widths if x > 0]
    if len(w) == 1:
        px = w[0] * MM_TO_PX
        sld, n = fix_strokes(sld, px)
        notes.append(f"contour {w[0]} mm -> {fmt(px)} px ({n})")
    if len(sizes) == 1:
        px = fmt(sizes.pop() * MM_TO_PX)
        sld, n = re.subn(r"(<se:Size>)[0-9.]+(</se:Size>)", rf"\g<1>{px}\g<2>", sld)
        notes.append(f"taille symbole -> {px} px ({n})")

    # 2. Expressions d'échelle QGIS -> env('wms_scale_denominator') GeoServer
    m = re.search(r"@map_scale\s*<=\s*(\d+)\s*THEN\s*(\d+)\s*ELSE\s*(\d+)", dd.get("fillColor", ""))
    if m:
        scale, near, far = m.group(1), fmt(int(m.group(2)) / 255), fmt(int(m.group(3)) / 255)
        sld, n = re.subn(
            r'(<se:SvgParameter name="fill-opacity">)[^<]*(</se:SvgParameter>)',
            lambda mm: mm.group(1) + if_scale(scale, near, far) + mm.group(2), sld)
        notes.append(f"opacité {near} sous 1:{scale}, {far} au-dessus ({n})")
    m = re.search(r"@map_scale\s*<=\s*(\d+)\s*THEN\s*'(\d+),(\d+),(\d+),\d+'\s*ELSE\s*'(\d+),(\d+),(\d+),\d+'",
                  dd.get("outlineColor", ""))
    if m:
        scale = m.group(1)
        near, far = rgb_hex(*m.group(2, 3, 4)), rgb_hex(*m.group(5, 6, 7))
        sld, n = re.subn(
            r'(<se:SvgParameter name="stroke">)#[0-9a-fA-F]{6}(</se:SvgParameter>)',
            lambda mm: mm.group(1) + if_scale(scale, near, far) + mm.group(2), sld)
        notes.append(f"contour {near} sous 1:{scale}, {far} au-dessus ({n})")

    # 3. Motif Qt dense6 (~12 % de points) -> point de 1 px tous les 3 px
    if "brush://dense6" in sld:
        sld = sld.replace("<se:WellKnownName>brush://dense6</se:WellKnownName>",
                          "<se:WellKnownName>square</se:WellKnownName>")
        sld = re.sub(r"(</se:Mark>)(\s*</se:Graphic>\s*</se:GraphicFill>)", r"\1<se:Size>1</se:Size>\2", sld)
        sld = re.sub(r"(\s*)(</se:PolygonSymbolizer>)",
                     r'\1 <se:VendorOption name="graphic-margin">2</se:VendorOption>\1\2', sld, count=1)
        notes.append("motif dense6 -> semis de points")

    path.write_text(sld, encoding="utf-8")
    print(f"{sn:24} " + ("; ".join(notes) or "rien à corriger"))


if __name__ == "__main__":
    arg = sys.argv[1] if len(sys.argv) > 1 else os.environ.get("QGIS_PROJECT")
    if not arg or not pathlib.Path(arg).is_file():
        sys.exit("Usage : python scripts/corriger-sld.py <projet.qgs|projet.qgz>  (ou variable QGIS_PROJECT)")
    for layer in qgis_layers(pathlib.Path(arg)):
        fix(*layer)
