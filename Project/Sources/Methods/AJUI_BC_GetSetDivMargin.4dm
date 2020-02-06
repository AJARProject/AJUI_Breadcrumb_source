//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivMargin ( { $margin } ) -> return
  //
  // $1 : (longint) (optional) margin
  // $0 : (longint) (return) current divider margin
  //
  // Getter and setter for the divider margin

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:15:13
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDivMargin
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.margin
Else 
	If ($1>=0)
		This:C1470.breadCrumb.divider.margin:=$1
	End if 
End if 