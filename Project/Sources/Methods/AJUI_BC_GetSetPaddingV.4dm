//%attributes = {"invisible":true}
  // AJUI_BC_GetSetPaddingV ( { $padding } ) -> return
  //
  // $1 : (longint) (optional) padding
  // $0 : (longint) (return) current vertical padding
  //
  // Getter and setter for the padding vertical of the box

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:48:42
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetPaddingV
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	
	$0:=This:C1470.breadCrumb.box.padding.vertical
Else 
	If ($1>=0)
		This:C1470.breadCrumb.box.padding.vertical:=$1
	End if 
End if 
