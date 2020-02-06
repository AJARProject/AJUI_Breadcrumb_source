//%attributes = {"invisible":true}
  // AJUI_BC_GetSetCornerRadiusRight ( {  $cornerRadiusRight } ) -> return
  //
  // $1 : (longint) (optional) corner radius 
  // $0 : (longint) (return) current radius for the right corners
  //
  // Getter and setter for the radius of the right corners of the box


If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:31:43
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetCornerRadiusRight
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.cornerRadius.right
Else 
	If ($1>=0)
		This:C1470.breadCrumb.box.cornerRadius.right:=$1
	End if 
End if 
