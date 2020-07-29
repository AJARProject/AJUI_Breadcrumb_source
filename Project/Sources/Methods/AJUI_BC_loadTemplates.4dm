//%attributes = {"invisible":true,"shared":true}
  // AJUI_BC_loadTemplates ( { $folderTargetPath } ) -> return
  //
  // $1 : (text) (optional) path to the template
  // $0 : (text) (return) collection of templates
  //
  // This method return in a collection all the json files from the specified/default path (.../Ressources/AJUI_BreadCrumb_Templates/)

If (False:C215)
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

C_COLLECTION:C1488($0;$templates_col)
C_TEXT:C284($1;$folderTargetPath)
C_TEXT:C284($filePath)
C_OBJECT:C1216($file)
ARRAY TEXT:C222($_files;0)

$templates_col:=New collection:C1472
$json_t:=""

If (Count parameters:C259=1)
	$folderTargetPath:=$1
	If ($folderTargetPath="#@")
		$folderTargetPath:=Replace string:C233($folderTargetPath;"#";Get 4D folder:C485(Current resources folder:K5:16;*))
	End if 
Else 
	$folderTargetPath:=Get 4D folder:C485(Current resources folder:K5:16;*)+"AJUI_BreadCrumb_Templates"+Folder separator:K24:12
End if 


$testPathName:=Test path name:C476($folderTargetPath)

If ($testPathName=0)  //check folder
	DOCUMENT LIST:C474($folderTargetPath;$_files;Absolute path:K24:14+Recursive parsing:K24:13)
	
	For ($i;1;Size of array:C274($_files))
		$filePath:=$_files{$i}
		
		If ($filePath="@.json")
			$json_t:=Document to text:C1236($filePath)
			If ($json_t="")
				  //do nothing
			Else 
				$btn_instance_obj:=New object:C1471
				$btn_instance_obj:=JSON Parse:C1218($json_t)
				$file:=File:C1566($filePath;fk platform path:K87:2)
				$btn_instance_obj.templateName:=$file.name
				$btn_instance_obj.templatePath:=Replace string:C233($file.platformPath;$file.name+".json";"")
				$btn_instance_obj:=New AJUI_BreadCrumb ($btn_instance_obj)  //add missing properties and reset calc properties
				$templates_col.push($btn_instance_obj)
			End if 
		End if 
	End for 
	
Else 
	ALERT:C41("folder not found")
End if 

$0:=$templates_col