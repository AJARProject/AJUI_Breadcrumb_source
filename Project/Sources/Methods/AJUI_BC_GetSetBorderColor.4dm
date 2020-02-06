//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBorderColor ( {  $color } ) -> return
  //
  // $1 : (text) (optional) border color 
  // $0 : (text) (return) current box border color
  //
  // Getter and setter for the box border color

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:38:15
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBorderColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.border.color
Else 
	This:C1470.breadCrumb.box.border.color:=$1
End if 