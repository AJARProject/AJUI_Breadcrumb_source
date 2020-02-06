//%attributes = {"invisible":true,"shared":true}
  // New AJUI_BreadCrumb ( {  $instance_obj } ) -> return
  //
  // $1 : (object) (optional) prebuilded instance object
  // $2 : (object) (return) instance object initiated
  //
  // This method will give you an instance from AJUI Breadcrumb

If (False:C215)
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

C_OBJECT:C1216($0;$1;$instance_obj)

If (Count parameters:C259=1)
	$template_obj:=$1
	If ($template_obj.templatePath=Null:C1517)
		$instance_obj:=AJUI_BC_templateImport ($template_obj.templateName)
	Else 
		$instance_obj:=AJUI_BC_templateImport ($template_obj.templateName;$template_obj.templatePath)
	End if 
	
	If ($instance_obj.failImport)
		
		$instance_obj:=New object:C1471
	End if 
Else 
	$instance_obj:=New object:C1471
End if 

AJUI_BC_initProperties ($instance_obj)
AJUI_BC_initFormulas ($instance_obj)

$0:=$instance_obj
