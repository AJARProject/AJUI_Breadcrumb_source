//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivString (  { divider } ) -> return
  //
  // $1 : (text) (optional) divider
  // $0 : (text) (return) current divider
  //
  // Getter and setter for the string to use as a divider

#DECLARE($param1 : Text) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:15:30
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDivString
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.divider.string
Else 
	This.breadCrumb.divider.string:=$param1
End if 
