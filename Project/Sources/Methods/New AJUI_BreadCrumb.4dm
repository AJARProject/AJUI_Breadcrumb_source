//%attributes = {"invisible":true,"shared":true}
  // New AJUI_BreadCrumb ( {  $instance_obj } ) -> return
  //
  // $1 : (object) (optional) prebuilded instance object
  // $2 : (object) (return) instance object initiated
  //
  // This method will give you an instance from AJUI Breadcrumb

#DECLARE($param1 : Object) -> $result : Object

var $instance_obj : Object
var $template_obj : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 12.09.19, 09:10:06
	  // ----------------------------------------------------
	  // Method: New AJUI_BreadCrumb
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=1)
	$template_obj:=$param1
	If ($template_obj.templatePath=Null)
		$instance_obj:=AJUI_BC_templateImport ($template_obj.templateName)
	Else 
		$instance_obj:=AJUI_BC_templateImport ($template_obj.templateName;$template_obj.templatePath)
	End if 
	
	If ($instance_obj.failImport)
		
		$instance_obj:=New object
	End if 
Else 
	$instance_obj:=New object
End if 

AJUI_BC_initProperties ($instance_obj)
AJUI_BC_initFormulas ($instance_obj)

$result:=$instance_obj
