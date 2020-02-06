//%attributes = {"invisible":true}
  // AJUI_BC_templateImport ( $fileName  ; $pathName  ) -> return
  //
  // $1 : (text) template name
  // $2 : (text) (optional) path to the template
  // $0 : (text) (return) AJUI BreadCrumb instance
  //
  // Method to import an AJUI BreadCrumb instace from a template file (json file)

If (False:C215)
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

C_OBJECT:C1216($0;$instance_obj)
C_TEXT:C284($1;$fileName;$templateName)
C_TEXT:C284($2;$pathName)
C_TEXT:C284($json)

$instance_obj:=New object:C1471
$json:=""
$templateName:=$1

If ($templateName="@.json")
	$fileName:=$templateName
	$templateName:=Replace string:C233($templateName;".json";"")
Else 
	$fileName:=$templateName+".json"
End if 


If (Count parameters:C259=2)
	If ($2="")
		$folder:=Folder:C1567(Get 4D folder:C485(Current resources folder:K5:16;*)+"AJUI_BreadCrumb_Templates"+Folder separator:K24:12+$templateName+Folder separator:K24:12;fk platform path:K87:2)
		If ($folder.exists)
			$pathName:=$folder.platformPath+$fileName
		Else 
			$pathName:=Get 4D folder:C485(Current resources folder:K5:16;*)+"AJUI_BreadCrumb_Templates"+Folder separator:K24:12+$fileName
		End if 
	Else 
		$pathName:=$2+$fileName
	End if 
Else 
	$folder:=Folder:C1567(Get 4D folder:C485(Current resources folder:K5:16;*)+"AJUI_BreadCrumb_Templates"+Folder separator:K24:12+$templateName+Folder separator:K24:12;fk platform path:K87:2)
	If ($folder.exists)
		$pathName:=$folder.platformPath+$fileName
	Else 
		$pathName:=Get 4D folder:C485(Current resources folder:K5:16;*)+"AJUI_BreadCrumb_Templates"+Folder separator:K24:12+$fileName
	End if 
End if 

$testPathName:=Test path name:C476($pathName)

If ($testPathName=1)  //check file
	$json:=Document to text:C1236($pathName)
Else 
	ALERT:C41("File not found"+"\r\r"+$pathName)
End if 


If ($json="")
	$instance_obj.failImport:=True:C214
Else 
	$instance_obj:=JSON Parse:C1218($json)
	$instance_obj.breadCrumb.global.importPath:=Replace string:C233($pathName;$templateName+".json";"")
	$instance_obj.failImport:=False:C215
	
End if 

$0:=$instance_obj