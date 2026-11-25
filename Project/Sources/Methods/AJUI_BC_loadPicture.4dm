//%attributes = {"invisible":true}
  // AJUI_BC_loadPicture ( $section ) -> return
  //
  // $1 : (object) current section
  //
  // Load the picture into the section

#DECLARE($param1 : Object; $param2 : Text)

var $section : Object
var $importPath : Text
var $picture : Picture
var $picturePath : Text
var $file : 4D.File
var $svg_txt : Text
var $colorToReplace : Text
var $replacingColor : Text
var $dom_ref : Text

If (False)
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


$section:=$param1

$picturePath:=$section.picturePath

$importPath:=String($param2)
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


If (Test path name($picturePath)=Is a document)
	$file:=File($picturePath;fk platform path)
	If ($file.extension=".svg")
		$svg_txt:=Document to text($picturePath)
		
		$colorToReplace:=$section.colorToReplace
		$replacingColor:=$section.currentState.replacingColor
		
		  //replace color SVG
		If ($replacingColor#$colorToReplace) & ($replacingColor#"")
			$svg_txt:=Replace string($svg_txt;"fill=\""+$colorToReplace;"fill=\""+$replacingColor)
			$svg_txt:=Replace string($svg_txt;"fill:"+$colorToReplace;"fill:"+$replacingColor)
			$svg_txt:=Replace string($svg_txt;"fill: "+$colorToReplace;"fill: "+$replacingColor)
			
			$svg_txt:=Replace string($svg_txt;"stroke=\""+$colorToReplace;"stroke=\""+$replacingColor)
			$svg_txt:=Replace string($svg_txt;"stroke:"+$colorToReplace;"stroke:"+$replacingColor)
			$svg_txt:=Replace string($svg_txt;"stroke: "+$colorToReplace;"stroke: "+$replacingColor)
		End if 
		
		$dom_ref:=DOM Parse XML variable($svg_txt)
		
		SVG EXPORT TO PICTURE($dom_ref;$picture)
		DOM CLOSE XML($dom_ref)
	Else 
		READ PICTURE FILE($picturePath;$picture)
	End if 
Else 
	$picture:=$picture*0
End if 

$section.picture:=$picture
