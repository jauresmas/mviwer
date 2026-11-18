<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink">
 <NamedLayer>
  <se:Name>prescriptions_plui</se:Name>
  <UserStyle>
   <se:Name>default</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>Single symbol</se:Name>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>square</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#4f8f4a</se:SvgParameter>
           <se:SvgParameter name="fill-opacity">0.7</se:SvgParameter>
          </se:Fill>
         </se:Mark><se:Size>1</se:Size>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#4f8f4a</se:SvgParameter>
       <se:SvgParameter name="stroke-opacity">0.53</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
      <se:VendorOption name="graphic-margin">2</se:VendorOption>
     </se:PolygonSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
