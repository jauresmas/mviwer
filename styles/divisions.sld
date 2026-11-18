<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink">
 <NamedLayer>
  <se:Name>divisions</se:Name>
  <UserStyle>
   <se:Name>default</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>Zone U à dominante habitat</se:Name>
     <se:Description>
      <se:Title>Zone U à dominante habitat</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>categorie</ogc:PropertyName>
       <ogc:Literal>U habitat</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e5714a</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.85</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#e5714a</se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.85</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1.13</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Autre zone U</se:Name>
     <se:Description>
      <se:Title>Autre zone U</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>categorie</ogc:PropertyName>
       <ogc:Literal>U autre</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#7b3fa0</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.85</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#7b3fa0</se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.85</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1.13</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Zone à urbaniser (AU)</se:Name>
     <se:Description>
      <se:Title>Zone à urbaniser (AU)</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>categorie</ogc:PropertyName>
       <ogc:Literal>AU</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#d4a03a</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.85</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#d4a03a</se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.85</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1.13</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Zone agricole ou naturelle</se:Name>
     <se:Description>
      <se:Title>Zone agricole ou naturelle</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>categorie</ogc:PropertyName>
       <ogc:Literal>A ou N</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#1f6f3f</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.85</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#1f6f3f</se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.85</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1.13</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
