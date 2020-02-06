//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivFontSize ( { $size } ) -> return
  //
  // $1 : (longint) (optional) size
  // $0 : (longint) (return) current font size
  //
  // Getter and setter for the divider font size

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:16:10
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDivFontSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.font.size
Else 
	If ($1>0)
		This:C1470.breadCrumb.divider.font.size:=$1
	End if 
End if 