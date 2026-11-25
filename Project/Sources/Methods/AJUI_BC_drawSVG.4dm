//%attributes = {"invisible":true}
  // AJUI_BC_drawSVG ( $toDraw_obj  ) -> return
  //
  // $1 : (object) instance obj to draw
  // $0 : (picture) (return) result of the draw
  //
  // This methode will draw a picture based on the properties of the instance with the SVG methods of 4D

#DECLARE($param1 : Object) -> $result : Picture

var $toDraw_obj; $currentSection; $divSize_obj; $section : Object
var $pict; $pict_section : Picture
var $model; $bgColor; $boxBorderColor; $image_txt; $arrowColor; $divFontColor; $divFontName; $divFontStyle; $divString : Text
var $dynamicSize; $rtl; $lastSectionWithArrow; $svgPrevRelativeCoordinate : Boolean
var $boxWidth; $boxHeight; $cRadiusLeft; $cRadiusRight; $fontSize; $maxSectionToDraw; $LastSectionBorderArrowH; $boxPaddingH; $boxPaddingV; $divFontSize; $divMargin; $boxBorderSize; $arrowBorderSize; $lastArrowWidth; $compensate : Integer
var $startX; $startY; $pictX; $pictY : Real
var $nbSections : Integer
var $counter : Integer
var $svgAreaX : Integer
var $svgAreaY : Integer
var $svgRef : Text
var $Txt_groupReference_ID : Text
var $tipTextRectRef_ID : Text
var $boxRef : Text
var $currentSectionNumber : Integer
var $sizeAvailableH : Real
var $sizeAvailableV : Real
var $nextElemX : Real
var $posOpacity : Integer
var $divFontOpacity : Text
var $divFontOpacityNum : Real
var $divPaddingV : Real
var $style_definition : Text
var $divID : Text
var $label : Text
var $fontName : Text
var $fontColor : Text
var $fontStyle : Text
var $fontOpacity : Text
var $fontOpacityNum : Real
var $textPaddingV : Real
var $nextElemTextX : Real
var $pictureOpacityText : Text
var $picturePath : Text
var $importPath : Text
var $file : 4D.File
var $pict_blob : Blob
var $dom_image : Text
var $textID : Text
var $nextElemY : Real
var $sizeAvailableVWithBorder : Real
var $currentSectionAreaWidth : Real
var $sectionBgColor : Text
var $sectionBorderColor : Text
var $sectionBorderArrowH : Real
var $sectionBorderSize : Real
var $sectCRadiusLeft : Real
var $sectCRadiusRight : Real
var $compensateSectionBorderValue : Integer
var $applyLastItemRadius : Boolean
var $cRadiusStart : Real
var $cRadiusEnd : Real
var $sectionRef : Text
var $arrowRef : Text
var $pictureMargin : Real
var $pictureWidht : Real

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 12.09.19, 14:25:25
	  // ----------------------------------------------------
	  // Method: AJUI_BC_drawSVG
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



$toDraw_obj:=$param1

  //global properties
$model:=$toDraw_obj.breadCrumb.global.model
$rtl:=$toDraw_obj.breadCrumb.global.rtl
$maxSectionToDraw:=$toDraw_obj.breadCrumb.global.maxSectionToDraw

  //box properties
$dynamicSize:=$toDraw_obj.breadCrumb.box.dynamicSize

$bgColor:=$toDraw_obj.breadCrumb.box.bgColor
$cRadiusRight:=$toDraw_obj.breadCrumb.box.cornerRadius.right
$cRadiusLeft:=$toDraw_obj.breadCrumb.box.cornerRadius.left
$boxBorderColor:=$toDraw_obj.breadCrumb.box.border.color
$boxBorderSize:=$toDraw_obj.breadCrumb.box.border.size
$boxPaddingH:=$toDraw_obj.breadCrumb.box.padding.horizontal
$boxPaddingV:=$toDraw_obj.breadCrumb.box.padding.vertical

  //divider
$divMargin:=$toDraw_obj.breadCrumb.divider.margin

If ($model="arrow")
	$arrowColor:=$toDraw_obj.breadCrumb.divider.arrow.color
	$lastSectionWithArrow:=$toDraw_obj.breadCrumb.divider.arrow.lastSectionWithArrow
	
Else 
	$divString:=$toDraw_obj.breadCrumb.divider.string
	$divFontSize:=$toDraw_obj.breadCrumb.divider.font.size
	$divFontColor:=$toDraw_obj.breadCrumb.divider.font.color
	$divFontName:=$toDraw_obj.breadCrumb.divider.font.name
	$divFontStyle:=$toDraw_obj.breadCrumb.divider.font.style
End if 

  //calc size divider
If ($model="simple")
	$divSize_obj:=AJUI_BC_calcSizeSimpleDivider ($toDraw_obj.breadCrumb.divider)
End if 

  //number of section
$nbSections:=$toDraw_obj.breadCrumb.sectionList.count()
If ($maxSectionToDraw>=0) & ($maxSectionToDraw<$nbSections)
	$nbSections:=$maxSectionToDraw
End if 

  //last section with arrow case
If ($model="arrow") | ($model="groupedButtons")
	If (Not($lastSectionWithArrow))
		If ($nbSections>0)
			$toDraw_obj.breadCrumb.sectionList[$nbSections-1].sectionAreaWidth:=$toDraw_obj.breadCrumb.sectionList[$nbSections-1].sectionAreaWidth-$toDraw_obj.breadCrumb.sectionList[$nbSections-1].sectionArrowWidth
			$toDraw_obj.breadCrumb.sectionList[$nbSections-1].sectionArrowWidth:=0
		End if 
	End if 
End if 

  //Calc Box
If ($dynamicSize)  //dynamic
	$counter:=1
	$boxWidth:=$boxPaddingH*2
	$boxHeight:=$toDraw_obj.breadCrumb.box.height
	For each ($section;$toDraw_obj.breadCrumb.sectionList)
		If ($counter<=$nbSections)
			
			  //add the margin 
			If ($model="simple")  //model simple
				
				If ($nbSections>1) & ($counter#$nbSections)
					$boxWidth:=$boxWidth+$divSize_obj.width
				End if 
			Else   //model arrow
				If ($nbSections>1) & ($counter#$nbSections)
					$boxWidth:=$boxWidth+$divMargin
				End if 
				  //total compensate
				If ($section.currentState.borderSize>0) & ($section.currentState.borderSize>$compensate)
					$compensate:=$section.currentState.borderSize
				End if 
				
			End if 
			
			  //add section area width
			$boxWidth:=$boxWidth+$section.sectionAreaWidth
		End if 
		$counter:=$counter+1
	End for each 
	$boxWidth:=$boxWidth+$boxBorderSize+($compensate/2)
Else   //fix
	$boxHeight:=$toDraw_obj.breadCrumb.box.height
	$boxWidth:=$toDraw_obj.breadCrumb.box.width
End if 




$svgAreaX:=$boxWidth+$boxBorderSize
$svgAreaY:=$boxHeight+$boxBorderSize


  //Draw svg
$svgRef:=DOM Create XML Ref("svg";"http://www.w3.org/2000/svg")
DOM SET XML ATTRIBUTE($svgRef;"width";$svgAreaX;"height";$svgAreaY)  // svg area

$startX:=0+($boxBorderSize/2)+$cRadiusLeft
$startY:=0+($boxBorderSize/2)

If (False)  //only for debug
	$Txt_groupReference_ID:=DOM Create XML element($svgRef;"g";"id";"text1")
	
	$tipTextRectRef_ID:=SVG_New_rect ($Txt_groupReference_ID;0;0;$svgAreaX;$svgAreaY)
	SVG_SET_STROKE_DASHARRAY ($tipTextRectRef_ID;2)
End if 

$boxRef:=SVG_New_path ($svgRef;$startX;$startY;$boxBorderColor;$bgColor;$boxBorderSize)

$svgPrevRelativeCoordinate:=(SVG_Get_options  ?? 4)  //Change to relative coordinates
SVG_SET_OPTIONS (SVG_Get_options  ?- 4)  //Change to relative coordinates

  //draw svg
SVG_PATH_LINE_TO ($boxRef;Round($svgAreaX-$cRadiusRight-$cRadiusLeft-$boxBorderSize;0))
SVG_PATH_ARC ($boxRef;$cRadiusRight;$cRadiusRight;$cRadiusRight;$cRadiusRight)

SVG_PATH_LINE_TO ($boxRef;0;Round($svgAreaY-($cRadiusRight*2)-$boxBorderSize;0))
SVG_PATH_ARC ($boxRef;$cRadiusRight;$cRadiusRight;-$cRadiusRight;$cRadiusRight)

SVG_PATH_LINE_TO ($boxRef;Round(-$svgAreaX+$cRadiusRight+$cRadiusLeft+$boxBorderSize;0))
SVG_PATH_ARC ($boxRef;$cRadiusLeft;$cRadiusLeft;-$cRadiusLeft;-$cRadiusLeft)

SVG_PATH_LINE_TO ($boxRef;0;Round(-$svgAreaY+($cRadiusLeft*2)+$boxBorderSize;0))
SVG_PATH_ARC ($boxRef;$cRadiusLeft;$cRadiusLeft;$cRadiusLeft;-$cRadiusLeft)

SVG_PATH_CLOSE ($boxRef)

  //Draw section
If ($nbSections>0)
	$currentSectionNumber:=1
	$sizeAvailableH:=$boxWidth-($boxPaddingH*2)
	$sizeAvailableV:=$boxHeight-$boxBorderSize-($boxPaddingV*2)
	If ($rtl)
		$nextElemX:=$svgAreaX-$boxBorderSize-$boxPaddingH
	Else 
		$nextElemX:=$boxBorderSize+$boxPaddingH
	End if 
	
	Case of 
		: ($model="simple")  //model simple
			Repeat 
				  //add divider
				If (Not($currentSectionNumber=1)) & (Not($currentSectionNumber>$nbSections))
					If (($toDraw_obj.breadCrumb.sectionList[$currentSectionNumber-1].sectionAreaWidth+$divSize_obj.width)<=$sizeAvailableH)
						
						$posOpacity:=Position(":";$divFontColor)
						If ($posOpacity>0)
							$divFontOpacity:=Delete string($divFontColor;0;$posOpacity)
							$divFontColor:=Delete string($divFontColor;$posOpacity;Length($divFontColor))
							$divFontOpacityNum:=Num($divFontOpacity)/100
							$divFontOpacity:=String($divFontOpacityNum)
						Else 
							$divFontOpacity:="1"
						End if 
						
						  //check max height
						If ($divSize_obj.height>$sizeAvailableV)
							$divSize_obj.height:=$sizeAvailableV
						End if 
						
						$divPaddingV:=($svgAreaY/2)-($divSize_obj.height/2)
						
						If ($rtl)
							$nextElemX:=$nextElemX-$divSize_obj.width
						End if 
						
						  //draw divider
						$style_definition:="{font-size:"+String($divFontSize)+";fill:"+$divFontColor+";font-family:"+$divFontName+";fill-opacity:"+$divFontOpacity+";text-align:center}"
						$divID:=SVG_New_textArea ($svgRef;$divString;$nextElemX;$divPaddingV;$divSize_obj.width;$divSize_obj.height;$style_definition)
						SVG_SET_FONT_STYLE ($divID;Utl_fontStyle2Constant ($divFontStyle))
						
						
						If (Not($rtl))
							$nextElemX:=$nextElemX+$divSize_obj.width
						End if 
						
						$sizeAvailableH:=$sizeAvailableH-$divSize_obj.width
					Else 
						$sizeAvailableH:=0
					End if 
				End if 
				
				  //add section
				$currentSection:=$toDraw_obj.breadCrumb.sectionList[$currentSectionNumber-1]
				If ($currentSection.sectionAreaWidth<=$sizeAvailableH)
					
					$label:=$currentSection.label
					$fontName:=$currentSection.currentState.fontName
					$fontSize:=$currentSection.currentState.fontSize
					$fontColor:=$currentSection.currentState.fontColor
					$fontStyle:=$currentSection.currentState.fontStyle
					
					$posOpacity:=Position(":";$fontColor)
					If ($posOpacity>0)
						$fontOpacity:=Delete string($fontColor;0;$posOpacity)
						$fontColor:=Delete string($fontColor;$posOpacity;Length($fontColor))
						$fontOpacityNum:=Num($fontOpacity)/100
						$fontOpacity:=String($fontOpacityNum)
					Else 
						$fontOpacity:="1"
					End if 
					
					  //check max height
					If ($currentSection.sectionAreaHeight>$sizeAvailableV)
						$currentSection.sectionAreaHeight:=$sizeAvailableV
					End if 
					
					$textPaddingV:=($svgAreaY/2)-($currentSection.sectionAreaHeight/2)
					
					  //nextElement calculate before for rtl
					If ($rtl)
						$nextElemX:=$nextElemX-$currentSection.sectionAreaWidth
					End if 
					
					
					  //draw picture with text area
					If ($currentSection.drawPicture)
						$nextElemTextX:=$nextElemX
						Case of 
							: ($label="")
								$pictX:=$nextElemTextX+($currentSection.pictureWidht/2)-($currentSection.pictureWidht/2)
							: ($currentSection.picturePosition="left")
								$pictX:=$nextElemTextX
								$nextElemTextX:=$nextElemTextX+$currentSection.pictureWidht+$currentSection.pictureMargin
								
							: ($currentSection.picturePosition="right")
								$pictX:=$nextElemTextX+$currentSection.sectionAreaWidth-$currentSection.pictureWidht
						End case 
						
						$pictureOpacityText:=String($currentSection.currentState.pictureOpacity)+"%"
						
						$pictY:=($svgAreaY/2)-($currentSection.pictureHeight/2)
						
						$picturePath:=$currentSection.picturePath
						
						$importPath:=String($toDraw_obj.breadCrumb.global.importPath)
						If ($picturePath="#@")
							If ($importPath="")
								$picturePath:=Replace string($picturePath;"#";Get 4D folder(Current resources folder;*))
							Else 
								$picturePath:=Replace string($picturePath;"#";$importPath)
							End if 
						Else 
							$picturePath:=Get 4D folder(Current resources folder;*)+$picturePath
						End if 
						
						$picturePath:=Replace string($picturePath;"/";Folder separator)
						
						$file:=File($picturePath;fk platform path)
						$pict_section:=$currentSection.picture
						PICTURE TO BLOB($pict_section;$pict_blob;$file.extension)
						BASE64 ENCODE($pict_blob;$image_txt)
						$image_txt:="data:image/svg+xml;base64,"+$image_txt
						
						  //add picture to SVG
						$dom_image:=DOM Create XML element($svgRef;"image";\
							"xlink:href";$image_txt;\
							"opacity";$pictureOpacityText;\
							"x";$pictX;\
							"y";$pictY;\
							"width";$currentSection.pictureWidht;\
							"height";$currentSection.pictureHeight)
						
						
						  //draw text area
						If ($label#"")
							$style_definition:="{font-size:"+String($fontSize)+";fill:"+$fontColor+";font-family:"+$fontName+";fill-opacity:"+$fontOpacity+";text-align:center}"
							$textID:=SVG_New_textArea ($svgRef;$label;$nextElemTextX;$textPaddingV;$currentSection.sectionAreaWidth-$currentSection.pictureWidht-$currentSection.pictureMargin;$currentSection.sectionAreaHeight;$style_definition)
							SVG_SET_ID ($dom_image;$currentSection.id+"_AJUI_BC_bindedPicture")
							
							SVG_SET_FONT_STYLE ($textID;Utl_fontStyle2Constant ($fontStyle))
							SVG_SET_ID ($textID;$currentSection.id)
						End if 
						
					Else 
						  //draw text area
						$style_definition:="{font-size:"+String($fontSize)+";fill:"+$fontColor+";font-family:"+$fontName+";fill-opacity:"+$fontOpacity+";text-align:center}"
						$textID:=SVG_New_textArea ($svgRef;$label;$nextElemX;$textPaddingV;$currentSection.sectionAreaWidth;$currentSection.sectionAreaHeight;$style_definition)
						
						SVG_SET_FONT_STYLE ($textID;Utl_fontStyle2Constant ($fontStyle))
						SVG_SET_ID ($textID;$currentSection.id)
					End if 
					
					
					
					  //calculate nextElement and size available
					If (Not($rtl))
						$nextElemX:=$nextElemX+$currentSection.sectionAreaWidth
					End if 
					
					$sizeAvailableH:=$sizeAvailableH-$currentSection.sectionAreaWidth
				Else 
					$sizeAvailableH:=0
				End if 
				
				$currentSectionNumber:=$currentSectionNumber+1
			Until ($currentSectionNumber>$nbSections) | ($sizeAvailableH<=0)
			
		: ($model="arrow") | ($model="groupedButtons")  //model arrow or groupedButtons
			$nextElemY:=$startY+($boxBorderSize/2)+$boxPaddingV
			$sizeAvailableVWithBorder:=$sizeAvailableV
			
			Repeat 
				  //add section
				$currentSection:=$toDraw_obj.breadCrumb.sectionList[$currentSectionNumber-1]
				$currentSectionAreaWidth:=$currentSection.sectionAreaWidth
				If ($currentSectionAreaWidth<=$sizeAvailableH)
					
					$label:=$currentSection.label
					$fontName:=$currentSection.currentState.fontName
					$fontSize:=$currentSection.currentState.fontSize
					$fontColor:=$currentSection.currentState.fontColor
					$fontStyle:=$currentSection.currentState.fontStyle
					$sectionBgColor:=$currentSection.currentState.bgColor
					$sectionBorderColor:=$currentSection.currentState.borderColor
					
					$arrowBorderSize:=AJUI_BC_borderArrowH ($currentSection.sectionArrowWidth;$sizeAvailableVWithBorder;$toDraw_obj.breadCrumb.divider.arrow.borderSize)
					$LastSectionBorderArrowH:=$sectionBorderArrowH
					$sectionBorderSize:=$currentSection.currentState.borderSize
					$sizeAvailableV:=$sizeAvailableVWithBorder-$sectionBorderSize
					$sectCRadiusLeft:=$cRadiusLeft*($sizeAvailableVWithBorder/$svgAreaY)
					$sectCRadiusRight:=$cRadiusRight*($sizeAvailableVWithBorder/$svgAreaY)
					If ($nbSections=$currentSectionNumber)
						$sectionBorderArrowH:=0
					Else 
						$sectionBorderArrowH:=AJUI_BC_borderArrowH ($currentSection.sectionArrowWidth;$sizeAvailableVWithBorder;$sectionBorderSize)  //calc border size for the angle of the corner arrow
					End if 
					
					  //calc next elem X when the section have a border
					If ($sectionBorderArrowH>0)
						$currentSectionAreaWidth:=$currentSectionAreaWidth-$sectionBorderArrowH
						$compensateSectionBorderValue:=1  //compensate the rounding of the section border arrow
						If ($rtl)
							If ($lastArrowWidth<=0)
								$nextElemX:=$nextElemX-($sectionBorderArrowH/2)
							Else 
								$nextElemX:=$nextElemX-($sectionBorderArrowH/2)-$compensateSectionBorderValue
							End if 
						Else 
							If ($lastArrowWidth<=0)
								$nextElemX:=$nextElemX+($sectionBorderArrowH/2)
							Else 
								$nextElemX:=$nextElemX+($sectionBorderArrowH/2)+$compensateSectionBorderValue
							End if 
						End if 
					Else 
						$compensateSectionBorderValue:=0
					End if 
					
					If ($currentSection.sectionArrowWidth<=0)
						$compensateSectionBorderValue:=0
					End if 
					
					
					
					If ($nbSections=$currentSectionNumber) & (Not($lastSectionWithArrow))  //check last item corner radius
						$applyLastItemRadius:=True
					Else 
						$applyLastItemRadius:=False
					End if 
					
					
					Case of 
						: ($currentSectionNumber=1) & ($applyLastItemRadius)
							If ($rtl)
								$cRadiusStart:=$sectCRadiusRight
								$cRadiusEnd:=$sectCRadiusLeft
							Else 
								$cRadiusStart:=$sectCRadiusLeft
								$cRadiusEnd:=$sectCRadiusRight
							End if 
							
						: ($currentSectionNumber=1) & (Not($applyLastItemRadius))
							If ($rtl)
								$cRadiusStart:=$sectCRadiusRight
							Else 
								$cRadiusStart:=$sectCRadiusLeft
							End if 
							$cRadiusEnd:=0
							
							
						: ($applyLastItemRadius)
							$cRadiusStart:=0
							If ($rtl)
								$cRadiusEnd:=$sectCRadiusLeft
							Else 
								$cRadiusEnd:=$sectCRadiusRight
							End if 
							
						Else 
							$cRadiusStart:=0
							$cRadiusEnd:=0
							
					End case 
					
					If ($rtl)
						$sectionRef:=SVG_New_path ($svgRef;$nextElemX-$cRadiusStart;$nextElemY+($sectionBorderSize/2);$sectionBorderColor;$sectionBgColor;$sectionBorderSize)
					Else 
						$sectionRef:=SVG_New_path ($svgRef;$nextElemX+$cRadiusStart;$nextElemY+($sectionBorderSize/2);$sectionBorderColor;$sectionBgColor;$sectionBorderSize)
					End if 
					
					  //draw section
					If ($rtl)
						If ($currentSectionNumber=1)
							
							SVG_PATH_LINE_TO ($sectionRef;-$currentSectionAreaWidth+$currentSection.sectionArrowWidth+$cRadiusStart+$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusEnd;$cRadiusEnd;-$cRadiusEnd;$cRadiusEnd;0;2)
							SVG_PATH_LINE_TO ($sectionRef;-$currentSection.sectionArrowWidth+$compensateSectionBorderValue;($sizeAvailableV/2)-$cRadiusEnd)
							SVG_PATH_LINE_TO ($sectionRef;$currentSection.sectionArrowWidth-$compensateSectionBorderValue;($sizeAvailableV/2)-$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusEnd;$cRadiusEnd;$cRadiusEnd;$cRadiusEnd;0;2)
							SVG_PATH_LINE_TO ($sectionRef;$currentSectionAreaWidth-$currentSection.sectionArrowWidth-$cRadiusStart-$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusStart;$cRadiusStart;$cRadiusStart;-$cRadiusStart;0;2)
							SVG_PATH_LINE_TO ($sectionRef;0;-$sizeAvailableV+($cRadiusStart*2))
							SVG_PATH_ARC ($sectionRef;-$cRadiusStart;-$cRadiusStart;-$cRadiusStart;-$cRadiusStart;0;2)
							
						Else 
							$currentSectionAreaWidth:=$currentSectionAreaWidth-$currentSection.sectionArrowWidth+$lastArrowWidth
							
							SVG_PATH_LINE_TO ($sectionRef;-$currentSectionAreaWidth+$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusEnd;$cRadiusEnd;-$cRadiusEnd;$cRadiusEnd;0;2)
							SVG_PATH_LINE_TO ($sectionRef;-$currentSection.sectionArrowWidth+$compensateSectionBorderValue;($sizeAvailableV/2)-$cRadiusEnd)
							SVG_PATH_LINE_TO ($sectionRef;$currentSection.sectionArrowWidth-$compensateSectionBorderValue;($sizeAvailableV/2)-$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusEnd;$cRadiusEnd;$cRadiusEnd;$cRadiusEnd;0;2)
							SVG_PATH_LINE_TO ($sectionRef;$currentSectionAreaWidth-$cRadiusEnd)
							SVG_PATH_LINE_TO ($sectionRef;-$lastArrowWidth+$compensateSectionBorderValue;-$sizeAvailableV/2)
							SVG_PATH_LINE_TO ($sectionRef;$lastArrowWidth-$compensateSectionBorderValue;-$sizeAvailableV/2)
						End if 
					Else 
						If ($currentSectionNumber=1)
							SVG_PATH_LINE_TO ($sectionRef;$currentSectionAreaWidth-$currentSection.sectionArrowWidth-$cRadiusStart-$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusEnd;$cRadiusEnd;$cRadiusEnd;$cRadiusEnd)
							SVG_PATH_LINE_TO ($sectionRef;$currentSection.sectionArrowWidth-$compensateSectionBorderValue;($sizeAvailableV/2)-$cRadiusEnd)
							SVG_PATH_LINE_TO ($sectionRef;-$currentSection.sectionArrowWidth+$compensateSectionBorderValue;($sizeAvailableV/2)-$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusEnd;$cRadiusEnd;-$cRadiusEnd;$cRadiusEnd)
							SVG_PATH_LINE_TO ($sectionRef;-$currentSectionAreaWidth+$currentSection.sectionArrowWidth+$cRadiusStart+$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusStart;$cRadiusStart;-$cRadiusStart;-$cRadiusStart)
							SVG_PATH_LINE_TO ($sectionRef;0;-$sizeAvailableV+($cRadiusStart*2))
							SVG_PATH_ARC ($sectionRef;$cRadiusStart;$cRadiusStart;$cRadiusStart;-$cRadiusStart)
						Else 
							$currentSectionAreaWidth:=$currentSectionAreaWidth-$currentSection.sectionArrowWidth+$lastArrowWidth
							
							SVG_PATH_LINE_TO ($sectionRef;$currentSectionAreaWidth-$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusEnd;$cRadiusEnd;$cRadiusEnd;$cRadiusEnd)
							SVG_PATH_LINE_TO ($sectionRef;$currentSection.sectionArrowWidth-$compensateSectionBorderValue;($sizeAvailableV/2)-$cRadiusEnd)
							SVG_PATH_LINE_TO ($sectionRef;-$currentSection.sectionArrowWidth+$compensateSectionBorderValue;($sizeAvailableV/2)-$cRadiusEnd)
							SVG_PATH_ARC ($sectionRef;$cRadiusEnd;$cRadiusEnd;-$cRadiusEnd;$cRadiusEnd)
							SVG_PATH_LINE_TO ($sectionRef;-$currentSectionAreaWidth+$cRadiusEnd)
							If ($lastArrowWidth<=0)
								SVG_PATH_LINE_TO ($sectionRef;$lastArrowWidth;-$sizeAvailableV/2)
								SVG_PATH_LINE_TO ($sectionRef;-$lastArrowWidth;-$sizeAvailableV/2)
							Else 
								SVG_PATH_LINE_TO ($sectionRef;$lastArrowWidth-$compensateSectionBorderValue;-$sizeAvailableV/2)
								SVG_PATH_LINE_TO ($sectionRef;-$lastArrowWidth+$compensateSectionBorderValue;-$sizeAvailableV/2)
							End if 
						End if 
					End if 
					
					SVG_SET_ID ($sectionRef;$currentSection.id)
					SVG_PATH_CLOSE ($sectionRef)
					
					
					  //draw arrow divider
					If (Not($lastSectionWithArrow)) & ($currentSectionNumber=$nbSections)
						  //do nothing
					Else 
						
						If ($rtl)
							If ($currentSectionNumber=1)
								$arrowRef:=SVG_New_path ($svgRef;$nextElemX-$currentSectionAreaWidth+$currentSection.sectionArrowWidth;$nextElemY+$sectionBorderSize;"none";$arrowColor;0)
							Else 
								$arrowRef:=SVG_New_path ($svgRef;$nextElemX-$currentSectionAreaWidth;$nextElemY+$sectionBorderSize;"none";$arrowColor;0)
							End if 
							  //compensate arrow
							If ($currentSection.sectionArrowWidth<=0)
								SVG_PATH_LINE_TO ($arrowRef;-$currentSection.sectionArrowWidth;($sizeAvailableV-$sectionBorderSize)/2)
								SVG_PATH_LINE_TO ($arrowRef;$currentSection.sectionArrowWidth;($sizeAvailableV-$sectionBorderSize)/2)
								SVG_PATH_LINE_TO ($arrowRef;$arrowBorderSize)
								SVG_PATH_LINE_TO ($arrowRef;-$currentSection.sectionArrowWidth;-(($sizeAvailableV-$sectionBorderSize)/2))
								SVG_PATH_LINE_TO ($arrowRef;$currentSection.sectionArrowWidth;-(($sizeAvailableV-$sectionBorderSize)/2))
								SVG_PATH_LINE_TO ($arrowRef;-$arrowBorderSize)
							Else 
								SVG_PATH_LINE_TO ($arrowRef;-$currentSection.sectionArrowWidth+($sectionBorderSize/2)+$compensateSectionBorderValue;($sizeAvailableV-$sectionBorderSize)/2)
								SVG_PATH_LINE_TO ($arrowRef;$currentSection.sectionArrowWidth-($sectionBorderSize/2)-$compensateSectionBorderValue;($sizeAvailableV-$sectionBorderSize)/2)
								SVG_PATH_LINE_TO ($arrowRef;$arrowBorderSize)
								SVG_PATH_LINE_TO ($arrowRef;-$currentSection.sectionArrowWidth+($sectionBorderSize/2)+$compensateSectionBorderValue;-(($sizeAvailableV-$sectionBorderSize)/2))
								SVG_PATH_LINE_TO ($arrowRef;$currentSection.sectionArrowWidth-($sectionBorderSize/2)-$compensateSectionBorderValue;-(($sizeAvailableV-$sectionBorderSize)/2))
								SVG_PATH_LINE_TO ($arrowRef;-$arrowBorderSize)
							End if 
						Else 
							If ($currentSectionNumber=1)
								$arrowRef:=SVG_New_path ($svgRef;$nextElemX+$currentSectionAreaWidth-$currentSection.sectionArrowWidth;$nextElemY+$sectionBorderSize;"none";$arrowColor;0)
							Else 
								$arrowRef:=SVG_New_path ($svgRef;$nextElemX+$currentSectionAreaWidth;$nextElemY+$sectionBorderSize;"none";$arrowColor;0)
							End if 
							  //compensate arrow
							If ($currentSection.sectionArrowWidth<=0)
								SVG_PATH_LINE_TO ($arrowRef;$currentSection.sectionArrowWidth;($sizeAvailableV-$sectionBorderSize)/2)
								SVG_PATH_LINE_TO ($arrowRef;-$currentSection.sectionArrowWidth;($sizeAvailableV-$sectionBorderSize)/2)
								SVG_PATH_LINE_TO ($arrowRef;-$arrowBorderSize)
								SVG_PATH_LINE_TO ($arrowRef;$currentSection.sectionArrowWidth;-(($sizeAvailableV-$sectionBorderSize)/2))
								SVG_PATH_LINE_TO ($arrowRef;-$currentSection.sectionArrowWidth;-(($sizeAvailableV-$sectionBorderSize)/2))
								SVG_PATH_LINE_TO ($arrowRef;$arrowBorderSize)
							Else 
								SVG_PATH_LINE_TO ($arrowRef;$currentSection.sectionArrowWidth-($sectionBorderSize/2)-$compensateSectionBorderValue;($sizeAvailableV-$sectionBorderSize)/2)
								SVG_PATH_LINE_TO ($arrowRef;-$currentSection.sectionArrowWidth+($sectionBorderSize/2)+$compensateSectionBorderValue;($sizeAvailableV-$sectionBorderSize)/2)
								SVG_PATH_LINE_TO ($arrowRef;-$arrowBorderSize)
								SVG_PATH_LINE_TO ($arrowRef;$currentSection.sectionArrowWidth-($sectionBorderSize/2)-$compensateSectionBorderValue;-(($sizeAvailableV-$sectionBorderSize)/2))
								SVG_PATH_LINE_TO ($arrowRef;-$currentSection.sectionArrowWidth+($sectionBorderSize/2)+$compensateSectionBorderValue;-(($sizeAvailableV-$sectionBorderSize)/2))
								SVG_PATH_LINE_TO ($arrowRef;$arrowBorderSize)
							End if 
						End if 
						SVG_PATH_CLOSE ($arrowRef)
					End if 
					
					
					  //text area
					$posOpacity:=Position(":";$fontColor)
					If ($posOpacity>0)
						$fontOpacity:=Delete string($fontColor;0;$posOpacity)
						$fontColor:=Delete string($fontColor;$posOpacity;Length($fontColor))
						$fontOpacityNum:=Num($fontOpacity)/100
						$fontOpacity:=String($fontOpacityNum)
					Else 
						$fontOpacity:="1"
					End if 
					
					  //check max height
					If ($currentSection.sectionAreaHeight>$sizeAvailableV)
						$currentSection.sectionAreaHeight:=$sizeAvailableV
					End if 
					
					  //calc text padding V to center the text vertically
					$textPaddingV:=($svgAreaY/2)-($currentSection.sectionAreaHeight/2)
					
					  //rtl we calculate the nextElement before
					If ($rtl)
						If ($currentSectionNumber=1)
							$nextElemX:=$nextElemX-$currentSectionAreaWidth+$currentSection.sectionArrowWidth
						Else 
							$nextElemX:=$nextElemX-$currentSectionAreaWidth
						End if 
					End if 
					
					  //draw picture with text area
					If ($currentSection.drawPicture)
						
						$pictureMargin:=$currentSection.pictureMargin
						$pictureWidht:=$currentSection.pictureWidht
						$nextElemTextX:=$nextElemX
						Case of 
							: ($label="")
								If ($currentSectionNumber=1)
									$pictX:=$nextElemTextX+(($currentSectionAreaWidth-$currentSection.sectionArrowWidth)/2)-($pictureWidht/2)
								Else 
									$pictX:=$nextElemTextX+($currentSectionAreaWidth/2)-($pictureWidht/2)
								End if 
								If ($rtl)
									$pictX:=$pictX-($lastArrowWidth/2)
								Else 
									$pictX:=$pictX+($lastArrowWidth/2)
								End if 
							: ($currentSection.picturePosition="left")
								If ($currentSectionNumber>1) & (Not($rtl))
									$pictX:=$nextElemTextX+($toDraw_obj.breadCrumb.divider.arrow.paddingH)+$lastArrowWidth
								Else 
									$pictX:=$nextElemTextX+$toDraw_obj.breadCrumb.divider.arrow.paddingH
								End if 
								$nextElemTextX:=$nextElemTextX+$pictureWidht+$pictureMargin
							: ($currentSection.picturePosition="right")
								$pictX:=$nextElemTextX+$currentSectionAreaWidth-$pictureWidht-($toDraw_obj.breadCrumb.divider.arrow.paddingH)
						End case 
						
						$pictY:=($svgAreaY/2)-($currentSection.pictureHeight/2)
						
						$pictureOpacityText:=String($currentSection.currentState.pictureOpacity)+"%"
						
						$picturePath:=$currentSection.picturePath
						
						$importPath:=String($toDraw_obj.breadCrumb.global.importPath)
						If ($picturePath="#@")
							If ($importPath="")
								$picturePath:=Replace string($picturePath;"#";Get 4D folder(Current resources folder;*))
							Else 
								$picturePath:=Replace string($picturePath;"#";$importPath)
							End if 
						Else 
							$picturePath:=Get 4D folder(Current resources folder;*)+$picturePath
						End if 
						
						$picturePath:=Replace string($picturePath;"/";Folder separator)
						
						$file:=File($picturePath;fk platform path)
						$pict_section:=$currentSection.picture
						PICTURE TO BLOB($pict_section;$pict_blob;$file.extension)
						BASE64 ENCODE($pict_blob;$image_txt)
						$image_txt:="data:image/svg+xml;base64,"+$image_txt
						
						  //add picture to SVG
						$dom_image:=DOM Create XML element($svgRef;"image";\
							"xlink:href";$image_txt;\
							"opacity";$pictureOpacityText;\
							"x";$pictX;\
							"y";$pictY;\
							"width";$pictureWidht;\
							"height";$currentSection.pictureHeight)
						
						  //draw text area
						If ($label#"")
							$style_definition:="{font-size:"+String($fontSize)+";fill:"+$fontColor+";font-family:"+$fontName+";fill-opacity:"+$fontOpacity+";text-align:center}"
							If ($currentSectionNumber=1)
								$textID:=SVG_New_textArea ($svgRef;$label;$nextElemTextX;$textPaddingV;$currentSectionAreaWidth-$currentSection.sectionArrowWidth-$pictureWidht-$pictureMargin;$currentSection.sectionAreaHeight;$style_definition)
							Else 
								If ($rtl)
									$textID:=SVG_New_textArea ($svgRef;$label;$nextElemTextX;$textPaddingV;$currentSectionAreaWidth-$lastArrowWidth-$pictureWidht-$pictureMargin;$currentSection.sectionAreaHeight;$style_definition)
								Else 
									$textID:=SVG_New_textArea ($svgRef;$label;$nextElemTextX+$lastArrowWidth;$textPaddingV;$currentSectionAreaWidth-$lastArrowWidth-$pictureWidht-$pictureMargin;$currentSection.sectionAreaHeight;$style_definition)
								End if 
							End if 
							SVG_SET_FONT_STYLE ($textID;Utl_fontStyle2Constant ($fontStyle))
						End if 
					Else 
						$pictureMargin:=0
						$pictureWidht:=0
						
						
						  //draw text area only
						$style_definition:="{font-size:"+String($fontSize)+";fill:"+$fontColor+";font-family:"+$fontName+";fill-opacity:"+$fontOpacity+";text-align:center}"
						If ($currentSectionNumber=1)
							$textID:=SVG_New_textArea ($svgRef;$label;$nextElemX;$textPaddingV;$currentSectionAreaWidth-$currentSection.sectionArrowWidth;$currentSection.sectionAreaHeight;$style_definition)
						Else 
							If ($rtl)
								$textID:=SVG_New_textArea ($svgRef;$label;$nextElemX;$textPaddingV;$currentSectionAreaWidth-$lastArrowWidth;$currentSection.sectionAreaHeight;$style_definition)
							Else 
								$textID:=SVG_New_textArea ($svgRef;$label;$nextElemX+$lastArrowWidth;$textPaddingV;$currentSectionAreaWidth-$lastArrowWidth;$currentSection.sectionAreaHeight;$style_definition)
							End if 
						End if 
						SVG_SET_FONT_STYLE ($textID;Utl_fontStyle2Constant ($fontStyle))
					End if 
					
					
					  //calculate nextElement and size available
					If ($rtl)
						If ($currentSectionNumber=$nbSections)
							$sizeAvailableH:=$sizeAvailableH-$currentSection.sectionAreaWidth
						Else 
							$nextElemX:=$nextElemX-$divMargin-($sectionBorderArrowH/2)
							$sizeAvailableH:=$sizeAvailableH-$currentSection.sectionAreaWidth-$divMargin
						End if 
					Else 
						If ($currentSectionNumber=$nbSections)
							$nextElemX:=$nextElemX+$currentSectionAreaWidth
							$sizeAvailableH:=$sizeAvailableH-$currentSection.sectionAreaWidth
						Else 
							If ($currentSectionNumber=1)
								$nextElemX:=$nextElemX+$currentSectionAreaWidth+$divMargin-$currentSection.sectionArrowWidth+($sectionBorderArrowH/2)
							Else 
								$nextElemX:=$nextElemX+$currentSectionAreaWidth+$divMargin+($sectionBorderArrowH/2)
							End if 
							$sizeAvailableH:=$sizeAvailableH-$currentSection.sectionAreaWidth-$divMargin
						End if 
					End if 
					
					
					If ($rtl)
						$nextElemX:=$nextElemX+$compensateSectionBorderValue
					Else 
						$nextElemX:=$nextElemX-$compensateSectionBorderValue
					End if 
					
					
					  //store the current arrow width for the next section
					$lastArrowWidth:=$currentSection.sectionArrowWidth
				Else 
					$sizeAvailableH:=0
				End if 
				$currentSectionNumber:=$currentSectionNumber+1
				
				
			Until ($currentSectionNumber>$nbSections) | ($sizeAvailableH<=0)
	End case 
End if 


  //for testing purpose
If (False)
	SVGTool_SHOW_IN_VIEWER ($svgRef)
End if 

If ($svgPrevRelativeCoordinate)
	SVG_SET_OPTIONS (SVG_Get_options  ?+ 4)  //Change to absolute coordinates
End if 

  //generate picture
$pict:=SVG_Export_to_picture ($svgRef)
SVG_CLEAR ($svgRef)

$result:=$pict
