#!/usr/bin/env bash
# Importe les styles SLD (dossier styles/) dans GeoServer et les associe aux couches.
#
# Usage (bash / Git Bash, depuis la racine du dépôt) :
#   bash scripts/importer-styles.sh [fichier_de_config=styles/styles.conf]
#
# Le fichier de config liste, une ligne par couche :
#   espace_de_travail|couche|style_par_defaut|style_alt1,style_alt2
# Chaque style correspond au fichier styles/<style>.sld (SLD 1.0 ou 1.1/SE).
#
# Pour un style venant de QGIS : export SLD dans styles/export-qgis/<nom>.sld,
# puis python scripts/corriger-sld.py <projet.qgs>, puis ce script.
# Relançable sans risque : les styles existants sont mis à jour.
set -euo pipefail
cd "$(dirname "$0")/.."
set -a; . ./.env; set +a
CONF="${1:-styles/styles.conf}"
GS="${GEOSERVER_URL:-http://127.0.0.1:8096/geoserver}/rest"
AUTH="$GEOSERVER_ADMIN_USER:$GEOSERVER_ADMIN_PASSWORD"

# Crée ou met à jour un style d'espace de travail à partir de styles/<nom>.sld
upload_style() {
  local ws=$1 name=$2 file="styles/$2.sld" ct="application/vnd.ogc.se+xml"
  [ -f "$file" ] || { echo "  !! $file introuvable"; return 1; }
  grep -q 'version="1.0.0"' "$file" && ct="application/vnd.ogc.sld+xml"
  local c
  c=$(curl -s -u "$AUTH" -o /dev/null -w "%{http_code}" "$GS/workspaces/$ws/styles/$name.json")
  if [ "$c" = 200 ]; then
    c=$(curl -s -u "$AUTH" -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: $ct" --data-binary @"$file" "$GS/workspaces/$ws/styles/$name")
  else
    c=$(curl -s -u "$AUTH" -o /dev/null -w "%{http_code}" -X POST -H "Content-Type: $ct" --data-binary @"$file" "$GS/workspaces/$ws/styles?name=$name")
  fi
  echo "  style $ws:$name -> HTTP $c"
}

grep -v -E '^\s*(#|$)' "$CONF" | tr -d '\r' | while IFS='|' read -r ws layer def alts; do
  echo "$ws:$layer"
  upload_style "$ws" "$def"
  xml="<layer><defaultStyle><name>$def</name><workspace>$ws</workspace></defaultStyle><styles>"
  if [ -n "$alts" ]; then
    for s in ${alts//,/ }; do
      upload_style "$ws" "$s"
      xml="$xml<style><name>$s</name><workspace>$ws</workspace></style>"
    done
  fi
  xml="$xml</styles></layer>"
  c=$(curl -s -u "$AUTH" -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: text/xml" --data-binary "$xml" "$GS/layers/$ws:$layer")
  echo "  -> couche configurée : HTTP $c"
done
