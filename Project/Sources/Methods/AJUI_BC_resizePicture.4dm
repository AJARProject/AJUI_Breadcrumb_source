//%attributes = {"invisible":true}
  // AJUI_BC_resizePicture ( $section ; $maxHeight  ) -> return
  //
  // $1 : (text) current section
  // $2 : (text)  max height
  //
  // This will method will get the width and height to apply for the picture

#DECLARE($param1 : Object; $param2 : Integer)

var $section : Object
var $maxHeight; $previousHeight; $pictWidth; $pictHeight : Integer
var $pictureHeight_t : Text
var $pict : Picture
var $scaleToApply : Real

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 01.10.19, 09:43:21
	  // ----------------------------------------------------
	  // Method: AJUI_BC_resizePicture
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$section:=$param1
$pict:=$section.picture

PICTURE PROPERTIES($pict;$pictWidth;$pictHeight)

If ($pictWidth>0) | ($pictHeight>0)
	$maxHeight:=$param2
	$pictureHeight_t:=$section.pictureHeight
	
	If ($pictureHeight_t#"")
		  //value in pixel
		If ($pictureHeight_t="@px")
			$previousHeight:=$pictHeight
			$pictHeight:=Num(Replace string($pictureHeight_t;"px";""))
			$pictWidth:=Round($pictWidth*($pictHeight/$previousHeight);0)
		End if 
		  //value in percent
		If ($pictureHeight_t="@%")
			$previousHeight:=$pictHeight
			$pictHeight:=Round($maxHeight*Num(Replace string($pictureHeight_t;"%";""))/100;0)
			$pictWidth:=Round($pictWidth*($pictHeight/$previousHeight);0)
			
		End if 
	End if 
	
	If ($pictHeight<=$maxHeight)
		$section.pictureWidht:=$pictWidth
		$section.pictureHeight:=$pictHeight
	Else 
		$scaleToApply:=$maxHeight/$pictHeight
		$section.pictureWidht:=Round($pictWidth*$scaleToApply;0)
		$section.pictureHeight:=Round($pictHeight*$scaleToApply;0)
	End if 
	
	  //add picture width and margin into the section area width
	$section.sectionAreaWidth:=$section.sectionAreaWidth+$section.pictureWidht+$section.pictureMargin
	
	$section.drawPicture:=True
Else 
	$section.drawPicture:=False
End if 
