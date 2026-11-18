<?xml version="1.0" encoding="UTF-8"?>
<!--
  SLD manuel (non écrasé par corriger-sld.py) : l'export QGIS perd toutes les expressions de ce style.
  Reproduit la couche QGIS « Consommation d'ENAF 2011-2021 (cercles) » :
    - diamètre = 16 mm x racine(conso_1121_ha / 82.2372)  (méthode « surface » de QGIS), 16 mm = 60.47 px
    - couleur selon dominante_1121, contour blanc 0,3 mm
    - gros cercles dessous, petits dessus
    - étiquette « nom + conso en ha » si conso >= 14 ha ou Rouen
-->
<StyledLayerDescriptor version="1.0.0"
    xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>conso_enaf_cercles</Name>
    <UserStyle>
      <Name>conso_enaf_cercles</Name>
      <Title>Consommation d'ENAF 2011-2021 (cercles)</Title>
      <FeatureTypeStyle>
        <Rule>
          <Name>hab</Name><Title>Habitat</Title>
          <ogc:Filter><ogc:PropertyIsEqualTo><ogc:PropertyName>dominante_1121</ogc:PropertyName><ogc:Literal>hab</ogc:Literal></ogc:PropertyIsEqualTo></ogc:Filter>
          <PointSymbolizer><Graphic><Mark><WellKnownName>circle</WellKnownName>
            <Fill><CssParameter name="fill">#e5714a</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#ffffff</CssParameter><CssParameter name="stroke-width">1.13</CssParameter></Stroke>
          </Mark>
          <Size><ogc:Mul><ogc:Literal>60.47</ogc:Literal><ogc:Function name="sqrt"><ogc:Div><ogc:PropertyName>conso_1121_ha</ogc:PropertyName><ogc:Literal>82.2372</ogc:Literal></ogc:Div></ogc:Function></ogc:Mul></Size>
          </Graphic></PointSymbolizer>
        </Rule>
        <Rule>
          <Name>act</Name><Title>Activité économique</Title>
          <ogc:Filter><ogc:PropertyIsEqualTo><ogc:PropertyName>dominante_1121</ogc:PropertyName><ogc:Literal>act</ogc:Literal></ogc:PropertyIsEqualTo></ogc:Filter>
          <PointSymbolizer><Graphic><Mark><WellKnownName>circle</WellKnownName>
            <Fill><CssParameter name="fill">#7b3fa0</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#ffffff</CssParameter><CssParameter name="stroke-width">1.13</CssParameter></Stroke>
          </Mark>
          <Size><ogc:Mul><ogc:Literal>60.47</ogc:Literal><ogc:Function name="sqrt"><ogc:Div><ogc:PropertyName>conso_1121_ha</ogc:PropertyName><ogc:Literal>82.2372</ogc:Literal></ogc:Div></ogc:Function></ogc:Mul></Size>
          </Graphic></PointSymbolizer>
        </Rule>
        <Rule>
          <Name>mix</Name><Title>Mixte habitat / activité</Title>
          <ogc:Filter><ogc:PropertyIsEqualTo><ogc:PropertyName>dominante_1121</ogc:PropertyName><ogc:Literal>mix</ogc:Literal></ogc:PropertyIsEqualTo></ogc:Filter>
          <PointSymbolizer><Graphic><Mark><WellKnownName>circle</WellKnownName>
            <Fill><CssParameter name="fill">#d4a03a</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#ffffff</CssParameter><CssParameter name="stroke-width">1.13</CssParameter></Stroke>
          </Mark>
          <Size><ogc:Mul><ogc:Literal>60.47</ogc:Literal><ogc:Function name="sqrt"><ogc:Div><ogc:PropertyName>conso_1121_ha</ogc:PropertyName><ogc:Literal>82.2372</ogc:Literal></ogc:Div></ogc:Function></ogc:Mul></Size>
          </Graphic></PointSymbolizer>
        </Rule>
        <Rule>
          <Name>inf</Name><Title>Infrastructures</Title>
          <ogc:Filter><ogc:PropertyIsEqualTo><ogc:PropertyName>dominante_1121</ogc:PropertyName><ogc:Literal>inf</ogc:Literal></ogc:PropertyIsEqualTo></ogc:Filter>
          <PointSymbolizer><Graphic><Mark><WellKnownName>circle</WellKnownName>
            <Fill><CssParameter name="fill">#6f6f6f</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#ffffff</CssParameter><CssParameter name="stroke-width">1.13</CssParameter></Stroke>
          </Mark>
          <Size><ogc:Mul><ogc:Literal>60.47</ogc:Literal><ogc:Function name="sqrt"><ogc:Div><ogc:PropertyName>conso_1121_ha</ogc:PropertyName><ogc:Literal>82.2372</ogc:Literal></ogc:Div></ogc:Function></ogc:Mul></Size>
          </Graphic></PointSymbolizer>
        </Rule>
        <Rule>
          <Name>inc</Name><Title>Destination inconnue</Title>
          <ogc:Filter><ogc:PropertyIsEqualTo><ogc:PropertyName>dominante_1121</ogc:PropertyName><ogc:Literal>inc</ogc:Literal></ogc:PropertyIsEqualTo></ogc:Filter>
          <PointSymbolizer><Graphic><Mark><WellKnownName>circle</WellKnownName>
            <Fill><CssParameter name="fill">#c3c2bb</CssParameter></Fill>
            <Stroke><CssParameter name="stroke">#ffffff</CssParameter><CssParameter name="stroke-width">1.13</CssParameter></Stroke>
          </Mark>
          <Size><ogc:Mul><ogc:Literal>60.47</ogc:Literal><ogc:Function name="sqrt"><ogc:Div><ogc:PropertyName>conso_1121_ha</ogc:PropertyName><ogc:Literal>82.2372</ogc:Literal></ogc:Div></ogc:Function></ogc:Mul></Size>
          </Graphic></PointSymbolizer>
        </Rule>
        <VendorOption name="sortBy">conso_1121_ha D</VendorOption>
      </FeatureTypeStyle>
      <FeatureTypeStyle>
        <Rule>
          <Name>etiquettes</Name><Title>Communes &gt;= 14 ha et Rouen</Title>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsGreaterThanOrEqualTo><ogc:PropertyName>conso_1121_ha</ogc:PropertyName><ogc:Literal>14</ogc:Literal></ogc:PropertyIsGreaterThanOrEqualTo>
              <ogc:PropertyIsEqualTo><ogc:PropertyName>nom</ogc:PropertyName><ogc:Literal>Rouen</ogc:Literal></ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <TextSymbolizer>
            <Label><ogc:PropertyName>nom</ogc:PropertyName><![CDATA[
]]><ogc:Function name="numberFormat"><ogc:Literal>0</ogc:Literal><ogc:PropertyName>conso_1121_ha</ogc:PropertyName></ogc:Function><![CDATA[ ha]]></Label>
            <Font>
              <CssParameter name="font-family">Segoe UI</CssParameter>
              <CssParameter name="font-size">10</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement><PointPlacement>
              <AnchorPoint><AnchorPointX>0</AnchorPointX><AnchorPointY>0.5</AnchorPointY></AnchorPoint>
              <Displacement>
                <DisplacementX><ogc:Add><ogc:Literal>3</ogc:Literal><ogc:Mul><ogc:Literal>30.24</ogc:Literal><ogc:Function name="sqrt"><ogc:Div><ogc:PropertyName>conso_1121_ha</ogc:PropertyName><ogc:Literal>82.2372</ogc:Literal></ogc:Div></ogc:Function></ogc:Mul></ogc:Add></DisplacementX>
                <DisplacementY>0</DisplacementY>
              </Displacement>
            </PointPlacement></LabelPlacement>
            <Halo><Radius>2</Radius><Fill><CssParameter name="fill">#ffffff</CssParameter></Fill></Halo>
            <Fill><CssParameter name="fill">#000000</CssParameter></Fill>
            <VendorOption name="spaceAround">2</VendorOption>
          </TextSymbolizer>
          <VendorOption name="inclusion">mapOnly</VendorOption>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
