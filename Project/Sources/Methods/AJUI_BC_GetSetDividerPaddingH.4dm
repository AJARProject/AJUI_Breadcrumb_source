//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDividerPaddingH ( { $padding } ) -> return
  //
  // $1 : (longint) (optional) padding
  // $0 : (longint) (return) current divider padding horizontal
  //
  // Getter and setter for the padding horizontal (only for model : arrow)

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 20.09.19, 10:07:39
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDividerPaddingH
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.arrow.paddingH
Else 
	If ($1>=0)
		This:C1470.breadCrumb.divider.arrow.paddingH:=$1
	End if 
End if 