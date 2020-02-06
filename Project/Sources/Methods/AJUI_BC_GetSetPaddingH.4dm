//%attributes = {"invisible":true}
  // AJUI_BC_GetSetPaddingH ( { $padding } ) -> return
  //
  // $1 : (longint) (optional) padding
  // $0 : (longint) (return) current horizontal padding
  //
  // Getter and setter for the padding horizontal of the box

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:47:52
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetPaddingH
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.padding.horizontal
Else 
	If ($1>=0)
		This:C1470.breadCrumb.box.padding.horizontal:=$1
	End if 
End if 
