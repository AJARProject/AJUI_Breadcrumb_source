//%attributes = {"invisible":true}
  // AJUI_BC_calcSizeSimpleDivider ( $divider ) -> return
  //
  // $1 : (object) $divider object
  // $0 : (object) (return) width and height of a divider
  //
  // This method will caculate the size used by a divider for the model simple

#DECLARE($param1 : Object) -> $result : Object

var $divider : Object
var $fontSize; $margin : Integer
var $string : Text
var $fontName : Text
var $fontColor : Text
var $fontStyle : Text
var $posOpacity : Integer
var $fontOpacity : Text
var $fontOpacityNum : Real
var $svgDividerRef : Text
var $style_definition : Text
var $tdivCalcID : Text
var $pict : Picture
var $width : Integer
var $height : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 17.09.19, 10:31:22
	  // ----------------------------------------------------
	  // Method: AJUI_BC_calcSizeSimpleDivider
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$divider:=$param1

  //divider
$string:=$divider.string
$fontName:=$divider.font.name
$fontSize:=$divider.font.size
$fontColor:=$divider.font.color
$fontStyle:=$divider.font.style
$margin:=$divider.margin


$posOpacity:=Position(":";$fontColor)
If ($posOpacity>0)
	$fontOpacity:=Delete string($fontColor;0;$posOpacity)
	$fontColor:=Delete string($fontColor;$posOpacity;Length($fontColor))
	$fontOpacityNum:=Num($fontOpacity)/100
	$fontOpacity:=String($fontOpacityNum)
Else 
	$fontOpacity:="1"
End if 

  //text size calculation
$svgDividerRef:=SVG_New 
$style_definition:="{font-size:"+String($fontSize)+";fill:"+$fontColor+";font-family:"+$fontName+";fill-opacity:"+$fontOpacity+";text-align:center}"
$tdivCalcID:=SVG_New_textArea ($svgDividerRef;$string;0;0;0;0;$style_definition)
SVG_SET_FONT_STYLE ($svgDividerRef;Utl_fontStyle2Constant ($fontStyle))

If (False)
	SVGTool_SHOW_IN_VIEWER ($svgDividerRef)
End if 

$pict:=SVG_Export_to_picture ($svgDividerRef)
PICTURE PROPERTIES($pict;$width;$height)

SVG_CLEAR ($svgDividerRef)

$result:=New object("width";$width+($margin*2);"height";$height)

