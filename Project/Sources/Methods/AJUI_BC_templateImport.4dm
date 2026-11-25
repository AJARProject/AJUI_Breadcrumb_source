//%attributes = {"invisible":true}
  // AJUI_BC_templateImport ( $fileName  ; $pathName  ) -> return
  //
  // $1 : (text) template name
  // $2 : (text) (optional) path to the template
  // $0 : (text) (return) AJUI BreadCrumb instance
  //
  // Method to import an AJUI BreadCrumb instace from a template file (json file)

#DECLARE($param1 : Text; $param2 : Text) -> $result : Object

var $instance_obj : Object
var $fileName; $templateName; $pathName; $json : Text
var $folder : 4D.Folder
var $testPathName : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 09.10.19, 09:40:50
	  // ----------------------------------------------------
	  // Method: AJUI_BC_templateImport
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$instance_obj:=New object
$json:=""
$templateName:=$param1

If ($templateName="@.json")
	$fileName:=$templateName
	$templateName:=Replace string($templateName;".json";"")
Else 
	$fileName:=$templateName+".json"
End if 


If (Count parameters=2)
	If ($param2="")
		$folder:=Folder(Get 4D folder(Current resources folder;*)+"AJUI_BreadCrumb_Templates"+Folder separator+$templateName+Folder separator;fk platform path)
		If ($folder.exists)
			$pathName:=$folder.platformPath+$fileName
		Else 
			$pathName:=Get 4D folder(Current resources folder;*)+"AJUI_BreadCrumb_Templates"+Folder separator+$fileName
		End if 
	Else 
		If ($param2="#@")
			$pathName:=Replace string($param2;"#";Get 4D folder(Current resources folder;*))
		Else 
			$pathName:=$param2
		End if 
		
		$folder:=Folder($pathName+$templateName+Folder separator;fk platform path)
		If ($folder.exists)
			$pathName:=$folder.platformPath+$fileName
		Else 
			$pathName:=$pathName+$fileName
		End if 
	End if 
Else 
	$folder:=Folder(Get 4D folder(Current resources folder;*)+"AJUI_BreadCrumb_Templates"+Folder separator+$templateName+Folder separator;fk platform path)
	If ($folder.exists)
		$pathName:=$folder.platformPath+$fileName
	Else 
		$pathName:=Get 4D folder(Current resources folder;*)+"AJUI_BreadCrumb_Templates"+Folder separator+$fileName
	End if 
End if 

$testPathName:=Test path name($pathName)

If ($testPathName=1)  //check file
	$json:=Document to text($pathName)
Else 
	ALERT("File not found"+"\r\r"+$pathName)
End if 


If ($json="")
	$instance_obj.failImport:=True
Else 
	$instance_obj:=JSON Parse($json)
	$instance_obj.breadCrumb.global.importPath:=Replace string($pathName;$templateName+".json";"")
	$instance_obj.failImport:=False
	
End if 

$result:=$instance_obj
