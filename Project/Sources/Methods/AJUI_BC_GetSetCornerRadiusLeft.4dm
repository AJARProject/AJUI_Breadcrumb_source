//%attributes = {"invisible":true}
  // AJUI_BC_GetSetCornerRadiusLeft ( {  $cornerRadiusLeft } ) -> return
  //
  // $1 : (longint) (optional) corner radius 
  // $0 : (longint) (return) current radius for the left corners
  //
  // Getter and setter for the radius of the left corners of the box

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:34:24
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetCornerRadiusLeft
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.cornerRadius.left
Else 
	If ($1>=0)
		This:C1470.breadCrumb.box.cornerRadius.left:=$1
	End if 
End if 