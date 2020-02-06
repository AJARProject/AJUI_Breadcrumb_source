//%attributes = {"invisible":true}
  // AJUI_BC_resizePicture ( $section ; $maxHeight  ) -> return
  //
  // $1 : (text) current section
  // $2 : (text)  max height
  //
  // This will method will get the width and height to apply for the picture

If (False:C215)
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

C_OBJECT:C1216($1;$section)
C_LONGINT:C283($2;$maxHeight;$previousHeight;$pictWidth;$pictHeight)
C_TEXT:C284($pictureHeight_t)
C_PICTURE:C286($pict)

$section:=$1
$pict:=$section.picture

PICTURE PROPERTIES:C457($pict;$pictWidth;$pictHeight)

If ($pictWidth>0) | ($pictHeight>0)
	$maxHeight:=$2
	$pictureHeight_t:=$section.pictureHeight
	
	If ($pictureHeight_t#"")
		  //value in pixel
		If ($pictureHeight_t="@px")
			$previousHeight:=$pictHeight
			$pictHeight:=Num:C11(Replace string:C233($pictureHeight_t;"px";""))
			$pictWidth:=Round:C94($pictWidth*($pictHeight/$previousHeight);0)
		End if 
		  //value in percent
		If ($pictureHeight_t="@%")
			$previousHeight:=$pictHeight
			$pictHeight:=Round:C94($maxHeight*Num:C11(Replace string:C233($pictureHeight_t;"%";""))/100;0)
			$pictWidth:=Round:C94($pictWidth*($pictHeight/$previousHeight);0)
			
		End if 
	End if 
	
	If ($pictHeight<=$maxHeight)
		$section.pictureWidht:=$pictWidth
		$section.pictureHeight:=$pictHeight
	Else 
		$scaleToApply:=$maxHeight/$pictHeight
		$section.pictureWidht:=Round:C94($pictWidth*$scaleToApply;0)
		$section.pictureHeight:=Round:C94($pictHeight*$scaleToApply;0)
	End if 
	
	  //add picture width and margin into the section area width
	$section.sectionAreaWidth:=$section.sectionAreaWidth+$section.pictureWidht+$section.pictureMargin
	
	$section.drawPicture:=True:C214
Else 
	$section.drawPicture:=False:C215
End if 