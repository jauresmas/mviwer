<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink">
 <NamedLayer>
  <se:Name>ind_conso_1121</se:Name>
  <UserStyle>
   <se:Name>default</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>≤ 2,1 ha</se:Name>
     <se:Description>
      <se:Title>≤ 2,1 ha</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsLessThanOrEqualTo>
       <ogc:PropertyName>conso_1121_ha</ogc:PropertyName>
       <ogc:Literal>2.06230000000000002</ogc:Literal>
      </ogc:PropertyIsLessThanOrEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#fde7da</se:SvgParameter>
       <se:SvgParameter name="fill-opacity"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>0.16</ogc:Literal><ogc:Literal>0.8</ogc:Literal></ogc:Function></se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>#52514e</ogc:Literal><ogc:Literal>#ffffff</ogc:Literal></ogc:Function></se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.98</se:SvgParameter><se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>2,1 ha – 5,2 ha</se:Name>
     <se:Description>
      <se:Title>2,1 ha – 5,2 ha</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:And>
       <ogc:PropertyIsGreaterThan>
        <ogc:PropertyName>conso_1121_ha</ogc:PropertyName>
        <ogc:Literal>2.06230000000000002</ogc:Literal>
       </ogc:PropertyIsGreaterThan>
       <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>conso_1121_ha</ogc:PropertyName>
        <ogc:Literal>5.24139999999999961</ogc:Literal>
       </ogc:PropertyIsLessThanOrEqualTo>
      </ogc:And>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f8c3a4</se:SvgParameter>
       <se:SvgParameter name="fill-opacity"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>0.16</ogc:Literal><ogc:Literal>0.8</ogc:Literal></ogc:Function></se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>#52514e</ogc:Literal><ogc:Literal>#ffffff</ogc:Literal></ogc:Function></se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.98</se:SvgParameter><se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>5,2 ha – 8,5 ha</se:Name>
     <se:Description>
      <se:Title>5,2 ha – 8,5 ha</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:And>
       <ogc:PropertyIsGreaterThan>
        <ogc:PropertyName>conso_1121_ha</ogc:PropertyName>
        <ogc:Literal>5.24139999999999961</ogc:Literal>
       </ogc:PropertyIsGreaterThan>
       <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>conso_1121_ha</ogc:PropertyName>
        <ogc:Literal>8.45609999999999928</ogc:Literal>
       </ogc:PropertyIsLessThanOrEqualTo>
      </ogc:And>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f19a71</se:SvgParameter>
       <se:SvgParameter name="fill-opacity"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>0.16</ogc:Literal><ogc:Literal>0.8</ogc:Literal></ogc:Function></se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>#52514e</ogc:Literal><ogc:Literal>#ffffff</ogc:Literal></ogc:Function></se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.98</se:SvgParameter><se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>8,5 ha – 12,3 ha</se:Name>
     <se:Description>
      <se:Title>8,5 ha – 12,3 ha</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:And>
       <ogc:PropertyIsGreaterThan>
        <ogc:PropertyName>conso_1121_ha</ogc:PropertyName>
        <ogc:Literal>8.45609999999999928</ogc:Literal>
       </ogc:PropertyIsGreaterThan>
       <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>conso_1121_ha</ogc:PropertyName>
        <ogc:Literal>12.31879999999999953</ogc:Literal>
       </ogc:PropertyIsLessThanOrEqualTo>
      </ogc:And>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e5714a</se:SvgParameter>
       <se:SvgParameter name="fill-opacity"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>0.16</ogc:Literal><ogc:Literal>0.8</ogc:Literal></ogc:Function></se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>#52514e</ogc:Literal><ogc:Literal>#ffffff</ogc:Literal></ogc:Function></se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.98</se:SvgParameter><se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>> 12,3 ha</se:Name>
     <se:Description>
      <se:Title>> 12,3 ha</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsGreaterThan>
       <ogc:PropertyName>conso_1121_ha</ogc:PropertyName>
       <ogc:Literal>12.31879999999999953</ogc:Literal>
      </ogc:PropertyIsGreaterThan>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#9f3a1e</se:SvgParameter>
       <se:SvgParameter name="fill-opacity"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>0.16</ogc:Literal><ogc:Literal>0.8</ogc:Literal></ogc:Function></se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke"><ogc:Function name="if_then_else"><ogc:Function name="lessEqualThan"><ogc:Function name="env"><ogc:Literal>wms_scale_denominator</ogc:Literal><ogc:Literal>1000000000</ogc:Literal></ogc:Function><ogc:Literal>50000</ogc:Literal></ogc:Function><ogc:Literal>#52514e</ogc:Literal><ogc:Literal>#ffffff</ogc:Literal></ogc:Function></se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.98</se:SvgParameter><se:SvgParameter name="stroke-width">1</se:SvgParameter>
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
