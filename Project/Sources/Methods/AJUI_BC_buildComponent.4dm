//%attributes = {"invisible":true}
  // AJUI_BC_buildComponent ( ) 
  //
  //
  // Launch the build component method from AJUI Version. Update the build version number


If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 12.09.19, 16:19:26
	  // ----------------------------------------------------
	  // Method: AJUI_BC_buildComponent
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


ARRAY TEXT:C222($_list_components;0)

COMPONENT LIST:C1001($_list_components)

$pos:=Find in array:C230($_list_components;"AJUI_Version")

If ($pos>0)
	EXECUTE METHOD:C1007("AJUI_BuildComponent";*;"AJUI_BC_info")
End if 