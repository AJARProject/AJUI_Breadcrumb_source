//%attributes = {"invisible":true}
  // AJUI_BC_GetSetName ( {  $name } ) -> return
  //
  // $1 : (text) (optional) form object name
  // $0 : (text) (return) current form object name
  //
  // Getter and Setter for the form object name who will receive the breadcrumb

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 09:11:43
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetName
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.global.name
Else 
	This:C1470.breadCrumb.global.name:=$1
End if 