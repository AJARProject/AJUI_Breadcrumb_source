//%attributes = {"invisible":true}
  // AJUI_BC_templateExport ( $templateName { ; $exportPath } ) 
  //
  // $1 : (text) AJUI BreadCrumb template name
  // $2 : (text) (optional) Path to export
  //
  // Method to export the AJUI BreadCrumb instance into a json file

If (False:C215)
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


C_TEXT:C284($1;$templateName)
C_TEXT:C284($2;$exportPath)
C_TEXT:C284($template_json)
C_TEXT:C284($mainPath;$filePath)
C_TIME:C306($docRef_h)

$templateName:=$1

If ($templateName="")
	ALERT:C41("You must enter a template name.")
Else 
	
	If ($templateName="@.json")
		$filePath:=$templateName
	Else 
		$filePath:=$templateName+".json"
	End if 
	
	If (Count parameters:C259=2)
		
		$exportPath:=$2
	Else 
		$mainPath:=Get 4D folder:C485(Current resources folder:K5:16;*)
		$exportPath:=$mainPath+"AJUI_BreadCrumb_Templates"+Folder separator:K24:12
		
	End if 
	This:C1470.templateName:=$templateName
	$template_json:=JSON Stringify:C1217(This:C1470;*)
	
	
	If ((Test path name:C476($exportPath)=Is a folder:K24:2)=False:C215)
		CREATE FOLDER:C475($exportPath)
	End if 
	
	$exportPath:=$exportPath+$filePath
	$docRef_h:=Create document:C266($exportPath)
	If (OK=1)
		CLOSE DOCUMENT:C267($docRef_h)
		TEXT TO DOCUMENT:C1237($exportPath;$template_json)
	Else 
		ALERT:C41("The document could not be created, I/O error "+"\r\r"+$exportPath)
	End if 
End if 