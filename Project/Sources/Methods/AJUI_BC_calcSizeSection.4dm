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

If (False:C215)
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

C_OBJECT:C1216($1;$section;$pict_obj)
C_TEXT:C284($2)
C_LONGINT:C283($3;$4;$fontSize;$arrowWidth;$maxHeight)
C_BOOLEAN:C305($5)
C_PICTURE:C286($picture)


$section:=$1

  //text
$label:=$section.label
$fontName:=$section.currentState.fontName
$fontSize:=$section.currentState.fontSize
$fontColor:=$section.currentState.fontColor
$fontStyle:=$section.currentState.fontStyle


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
$svgCalcRef:=SVG_New 
$style_definition:="{font-size:"+String:C10($fontSize)+";fill:"+$fontColor+";font-family:"+$fontName+";fill-opacity:"+$fontOpacity+";text-align:center}"
$textCalcID:=SVG_New_textArea ($svgCalcRef;$label;0;0;0;0;$style_definition)
SVG_SET_FONT_STYLE ($svgCalcRef;Utl_fontStyle2Constant ($fontStyle))

  //debug only
If (False:C215)
	SVGTool_SHOW_IN_VIEWER ($svgCalcRef)
End if 

$pict:=SVG_Export_to_picture ($svgCalcRef)
PICTURE PROPERTIES:C457($pict;$width;$height)

SVG_CLEAR ($svgCalcRef)

  //add arrow width
If (Count parameters:C259>1)
	$width:=$width+($3*2)  //add paddingH
	$maxHeight:=$4
	
	
	
	If ($5)
		  //value in pixel
		If ($2="@px")
			$arrowWidth:=Num:C11(Replace string:C233($2;"px";""))
		End if 
		
		  //value in percent
		If ($2="@%")
			$arrowWidth:=Round:C94($maxHeight*Num:C11(Replace string:C233($2;"%";""))/100;0)
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

