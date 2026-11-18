<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink">
 <NamedLayer>
  <se:Name>ind_div_deja_artif</se:Name>
  <UserStyle>
   <se:Name>default</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>≤ 54 %</se:Name>
     <se:Description>
      <se:Title>≤ 54 %</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsLessThanOrEqualTo>
       <ogc:PropertyName>part_artif_pct</ogc:PropertyName>
       <ogc:Literal>53.79999999999999716</ogc:Literal>
      </ogc:PropertyIsLessThanOrEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#fde7da</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.8</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#ffffff</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>54 % – 74 %</se:Name>
     <se:Description>
      <se:Title>54 % – 74 %</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:And>
       <ogc:PropertyIsGreaterThan>
        <ogc:PropertyName>part_artif_pct</ogc:PropertyName>
        <ogc:Literal>53.79999999999999716</ogc:Literal>
       </ogc:PropertyIsGreaterThan>
       <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>part_artif_pct</ogc:PropertyName>
        <ogc:Literal>74.29999999999999716</ogc:Literal>
       </ogc:PropertyIsLessThanOrEqualTo>
      </ogc:And>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f8c3a4</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.8</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#ffffff</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>74 % – 81 %</se:Name>
     <se:Description>
      <se:Title>74 % – 81 %</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:And>
       <ogc:PropertyIsGreaterThan>
        <ogc:PropertyName>part_artif_pct</ogc:PropertyName>
        <ogc:Literal>74.29999999999999716</ogc:Literal>
       </ogc:PropertyIsGreaterThan>
       <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>part_artif_pct</ogc:PropertyName>
        <ogc:Literal>81.20000000000000284</ogc:Literal>
       </ogc:PropertyIsLessThanOrEqualTo>
      </ogc:And>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f19a71</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.8</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#ffffff</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>81 % – 87 %</se:Name>
     <se:Description>
      <se:Title>81 % – 87 %</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:And>
       <ogc:PropertyIsGreaterThan>
        <ogc:PropertyName>part_artif_pct</ogc:PropertyName>
        <ogc:Literal>81.20000000000000284</ogc:Literal>
       </ogc:PropertyIsGreaterThan>
       <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>part_artif_pct</ogc:PropertyName>
        <ogc:Literal>86.70000000000000284</ogc:Literal>
       </ogc:PropertyIsLessThanOrEqualTo>
      </ogc:And>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e5714a</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.8</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#ffffff</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>> 87 %</se:Name>
     <se:Description>
      <se:Title>> 87 %</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsGreaterThan>
       <ogc:PropertyName>part_artif_pct</ogc:PropertyName>
       <ogc:Literal>86.70000000000000284</ogc:Literal>
      </ogc:PropertyIsGreaterThan>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#9f3a1e</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.8</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#ffffff</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:MinScaleDenominator>0</se:MinScaleDenominator>
     <se:MaxScaleDenominator>150000</se:MaxScaleDenominator>
     <se:TextSymbolizer>
      <se:Label>
       <ogc:PropertyName>nom</ogc:PropertyName>
      </se:Label>
      <se:Font>
       <se:SvgParameter name="font-family">Segoe UI</se:SvgParameter>
       <se:SvgParameter name="font-size">10</se:SvgParameter>
      </se:Font>
      <se:LabelPlacement>
       <se:PointPlacement>
        <se:AnchorPoint>
         <se:AnchorPointX>0.5</se:AnchorPointX>
         <se:AnchorPointY>0.5</se:AnchorPointY>
        </se:AnchorPoint>
       </se:PointPlacement>
      </se:LabelPlacement>
      <se:Halo>
       <se:Radius>1.5</se:Radius>
       <se:Fill>
        <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
       </se:Fill>
      </se:Halo>
      <se:Fill>
       <se:SvgParameter name="fill">#2b2a27</se:SvgParameter>
      </se:Fill>
     </se:TextSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
