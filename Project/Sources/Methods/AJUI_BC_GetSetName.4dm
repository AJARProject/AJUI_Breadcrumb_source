//%attributes = {"invisible":true}
  // AJUI_BC_GetSetName ( {  $name } ) -> return
  //
  // $1 : (text) (optional) form object name
  // $0 : (text) (return) current form object name
  //
  // Getter and Setter for the form object name who will receive the breadcrumb

#DECLARE($param1 : Text) -> $result : Text

If (False)
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


If (Count parameters=0)
	$result:=This.breadCrumb.global.name
Else 
	This.breadCrumb.global.name:=$param1
End if 
