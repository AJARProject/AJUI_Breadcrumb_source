//%attributes = {"invisible":true}
  // AJUI_BC_templateExport ( $templateName { ; $exportPath } ) 
  //
  // $1 : (text) AJUI BreadCrumb template name
  // $2 : (text) (optional) Path to export
  //
  // Method to export the AJUI BreadCrumb instance into a json file

#DECLARE($param1 : Text; $param2 : Text)

var $templateName; $exportPath; $template_json; $mainPath; $filePath : Text
var $docRef_h : Time

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 09.10.19, 09:41:11
	  // ----------------------------------------------------
	  // Method: AJUI_BC_templateExport
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



$templateName:=$param1

If ($templateName="")
	ALERT("You must enter a template name.")
Else 
	
	If ($templateName="@.json")
		$filePath:=$templateName
	Else 
		$filePath:=$templateName+".json"
	End if 
	
	If (Count parameters=2)
		
		$exportPath:=$param2
	Else 
		$mainPath:=Get 4D folder(Current resources folder;*)
		$exportPath:=$mainPath+"AJUI_BreadCrumb_Templates"+Folder separator
		
	End if 
	This.templateName:=$templateName
	$template_json:=JSON Stringify(This;*)
	
	
	If ((Test path name($exportPath)=Is a folder)=False)
		CREATE FOLDER($exportPath)
	End if 
	
	$exportPath:=$exportPath+$filePath
	$docRef_h:=Create document($exportPath)
	If (OK=1)
		CLOSE DOCUMENT($docRef_h)
		TEXT TO DOCUMENT($exportPath;$template_json)
	Else 
		ALERT("The document could not be created, I/O error "+"\r\r"+$exportPath)
	End if 
End if 
