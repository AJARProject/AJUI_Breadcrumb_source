//%attributes = {"invisible":true}
  // AJUI_BC_loadPicture ( $section ) -> return
  //
  // $1 : (object) current section
  //
  // Load the picture into the section

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 01.10.19, 09:24:01
	  // ----------------------------------------------------
	  // Method: AJUI_BC_loadPicture
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$section)
C_TEXT:C284($2;$importPath)
C_PICTURE:C286($picture)

$section:=$1

$picturePath:=$section.picturePath

$importPath:=String:C10($2)
If ($picturePath="#@")
	If ($importPath="")
		$picturePath:=Replace string:C233($picturePath;"#";Get 4D folder:C485(Current resources folder:K5:16;*))
	Else 
		$picturePath:=Replace string:C233($picturePath;"#";$importPath)
	End if 
Else 
	$picturePath:=Get 4D folder:C485(Current resources folder:K5:16;*)+$picturePath
End if 


$picturePath:=Replace string:C233($picturePath;"/";Folder separator:K24:12)


If (Test path name:C476($picturePath)=Is a document:K24:1)
	$file:=File:C1566($picturePath;fk platform path:K87:2)
	If ($file.extension=".svg")
		$svg_txt:=Document to text:C1236($picturePath)
		
		$colorToReplace:=$section.colorToReplace
		$replacingColor:=$section.currentState.replacingColor
		
		  //replace color SVG
		If ($replacingColor#$colorToReplace) & ($replacingColor#"")
			$svg_txt:=Replace string:C233($svg_txt;"fill=\""+$colorToReplace;"fill=\""+$replacingColor)
			$svg_txt:=Replace string:C233($svg_txt;"fill:"+$colorToReplace;"fill:"+$replacingColor)
			$svg_txt:=Replace string:C233($svg_txt;"fill: "+$colorToReplace;"fill: "+$replacingColor)
			
			$svg_txt:=Replace string:C233($svg_txt;"stroke=\""+$colorToReplace;"stroke=\""+$replacingColor)
			$svg_txt:=Replace string:C233($svg_txt;"stroke:"+$colorToReplace;"stroke:"+$replacingColor)
			$svg_txt:=Replace string:C233($svg_txt;"stroke: "+$colorToReplace;"stroke: "+$replacingColor)
		End if 
		
		$dom_ref:=DOM Parse XML variable:C720($svg_txt)
		
		SVG EXPORT TO PICTURE:C1017($dom_ref;$picture)
		DOM CLOSE XML:C722($dom_ref)
	Else 
		READ PICTURE FILE:C678($picturePath;$picture)
	End if 
Else 
	$picture:=$picture*0
End if 

$section.picture:=$picture