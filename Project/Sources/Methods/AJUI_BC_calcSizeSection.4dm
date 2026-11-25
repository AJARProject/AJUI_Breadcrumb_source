//%attributes = {"invisible":true}
  // AJUI_BC_calcSizeSection ( $1 { ; $2 ; $3 ;$4} ) -> return
  //
  // $1 : (object) section to calc
  // $2 : (text) (optional) arrow width (px/%)
  // $3 : (longint) (optional) padding horizontal
  // $4 : (longint) (optional) maxHeight
  // $5 : (boolean) (optionnal) arrowWidth = 0 if activate
  //
  // This method will calculate the size of a section

#DECLARE($param1 : Object; $param2 : Text; $param3 : Integer; $param4 : Integer; $param5 : Boolean)

var $section : Object
var $fontSize; $arrowWidth; $maxHeight : Integer
var $label : Text
var $fontName : Text
var $fontColor : Text
var $fontStyle : Text
var $posOpacity : Integer
var $fontOpacity : Text
var $fontOpacityNum : Real
var $svgCalcRef : Text
var $style_definition : Text
var $textCalcID : Text
var $pict : Picture
var $width : Integer
var $height : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 16.09.19, 14:57:35
	  // ----------------------------------------------------
	  // Method: AJUI_BC_calcSizeSection
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



$section:=$param1

  //text
$label:=$section.label
$fontName:=$section.currentState.fontName
$fontSize:=$section.currentState.fontSize
$fontColor:=$section.currentState.fontColor
$fontStyle:=$section.currentState.fontStyle


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
$svgCalcRef:=SVG_New 
$style_definition:="{font-size:"+String($fontSize)+";fill:"+$fontColor+";font-family:"+$fontName+";fill-opacity:"+$fontOpacity+";text-align:center}"
$textCalcID:=SVG_New_textArea ($svgCalcRef;$label;0;0;0;0;$style_definition)
SVG_SET_FONT_STYLE ($svgCalcRef;Utl_fontStyle2Constant ($fontStyle))

  //debug only
If (False)
	SVGTool_SHOW_IN_VIEWER ($svgCalcRef)
End if 

$pict:=SVG_Export_to_picture ($svgCalcRef)
PICTURE PROPERTIES($pict;$width;$height)

SVG_CLEAR ($svgCalcRef)

  //add arrow width
If (Count parameters>1)
	$width:=$width+($param3*2)  //add paddingH
	$maxHeight:=$param4
	
	
	
	If ($param5)
		  //value in pixel
		If ($param2="@px")
			$arrowWidth:=Num(Replace string($param2;"px";""))
		End if 
		
		  //value in percent
		If ($param2="@%")
			$arrowWidth:=Round($maxHeight*Num(Replace string($param2;"%";""))/100;0)
		End if 
	Else 
		$arrowWidth:=0
	End if 
	
	$section.sectionArrowWidth:=$arrowWidth
	$width:=$width+$arrowWidth  //arrow width include in the total width
	
End if 

  //store data
$section.sectionAreaWidth:=$width
$section.sectionAreaHeight:=$height

