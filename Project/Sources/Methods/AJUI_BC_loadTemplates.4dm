//%attributes = {"invisible":true,"shared":true}
  // AJUI_BC_loadTemplates ( { $folderTargetPath } ) -> return
  //
  // $1 : (text) (optional) path to the template
  // $0 : (text) (return) collection of templates
  //
  // This method return in a collection all the json files from the specified/default path (.../Ressources/AJUI_BreadCrumb_Templates/)

#DECLARE($param1 : Text) -> $result : Collection

var $templates_col : Collection
var $folderTargetPath; $filePath : Text
var $file : Object
var $json_t : Text
var $testPathName : Integer
var $i : Integer
var $btn_instance_obj : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 09.10.19, 09:41:38
	  // ----------------------------------------------------
	  // Method: AJUI_BC_loadTemplates
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

ARRAY TEXT($_files;0)

$templates_col:=New collection
$json_t:=""

If (Count parameters=1)
	$folderTargetPath:=$param1
	If ($folderTargetPath="#@")
		$folderTargetPath:=Replace string($folderTargetPath;"#";Get 4D folder(Current resources folder;*))
	End if 
Else 
	$folderTargetPath:=Get 4D folder(Current resources folder;*)+"AJUI_BreadCrumb_Templates"+Folder separator
End if 


$testPathName:=Test path name($folderTargetPath)

If ($testPathName=0)  //check folder
	DOCUMENT LIST($folderTargetPath;$_files;Absolute path+Recursive parsing)
	
	For ($i;1;Size of array($_files))
		$filePath:=$_files{$i}
		
		If ($filePath="@.json")
			$json_t:=Document to text($filePath)
			If ($json_t="")
				  //do nothing
			Else 
				$btn_instance_obj:=New object
				$btn_instance_obj:=JSON Parse($json_t)
				$file:=File($filePath;fk platform path)
				$btn_instance_obj.templateName:=$file.name
				$btn_instance_obj.templatePath:=Replace string($file.platformPath;$file.name+".json";"")
				$btn_instance_obj:=New AJUI_BreadCrumb ($btn_instance_obj)  //add missing properties and reset calc properties
				$templates_col.push($btn_instance_obj)
			End if 
		End if 
	End for 
	
Else 
	ALERT("folder not found")
End if 

$result:=$templates_col
