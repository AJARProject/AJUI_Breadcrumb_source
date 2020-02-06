//%attributes = {"invisible":true}
  // AJUI_BC_calcSizeSimpleDivider ( $divider ) -> return
  //
  // $1 : (object) $divider object
  // $0 : (object) (return) width and height of a divider
  //
  // This method will caculate the size used by a divider for the model simple

If (False:C215)
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

C_OBJECT:C1216($0;$1;$divider)
C_LONGINT:C283($fontSize;$margin)

$divider:=$1

  //divider
$string:=$divider.string
$fontName:=$divider.font.name
$fontSize:=$divider.font.size
$fontColor:=$divider.font.color
$fontStyle:=$divider.font.style
$margin:=$divider.margin


$posOpacity:=Position:C15(":";$fontColor)
If ($posOpacity>0)
	$fontOpacity:=Delete string:C232($fontColor;0;$posOpacity)
	$fontColor:=Delete string:C232($fontColor;$posOpacity;Length:C16($fontColor))
	$fontOpacityNum:=Num:C11($fontOpacity)/100
	$fontOpacity:=String:C10($fontOpacityNum)
Else 
	$fontOpacity:="1"
End if 

  //text size calculation
$svgDividerRef:=SVG_New 
$style_definition:="{font-size:"+String:C10($fontSize)+";fill:"+$fontColor+";font-family:"+$fontName+";fill-opacity:"+$fontOpacity+";text-align:center}"
$tdivCalcID:=SVG_New_textArea ($svgDividerRef;$string;0;0;0;0;$style_definition)
SVG_SET_FONT_STYLE ($svgDividerRef;Utl_fontStyle2Constant ($fontStyle))

If (False:C215)
	SVGTool_SHOW_IN_VIEWER ($svgDividerRef)
End if 

$pict:=SVG_Export_to_picture ($svgDividerRef)
PICTURE PROPERTIES:C457($pict;$width;$height)

SVG_CLEAR ($svgDividerRef)

$0:=New object:C1471("width";$width+($margin*2);"height";$height)

