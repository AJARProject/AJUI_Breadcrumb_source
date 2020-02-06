//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBorderSize ( {  $size } ) -> return
  //
  // $1 : (longint) (optional) border size 
  // $0 : (longint) (return) current box border size
  //
  // Getter and setter for the box border size

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:40:17
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBorderSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.border.size
Else 
	If ($1>=0)
		This:C1470.breadCrumb.box.border.size:=$1
	End if 
End if 