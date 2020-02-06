//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivString (  { divider } ) -> return
  //
  // $1 : (text) (optional) divider
  // $0 : (text) (return) current divider
  //
  // Getter and setter for the string to use as a divider

If (False:C215)
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

C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.string
Else 
	This:C1470.breadCrumb.divider.string:=$1
End if 