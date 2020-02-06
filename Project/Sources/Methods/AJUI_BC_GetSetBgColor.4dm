//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBgColor ( {  $bgColor } ) -> return
  //
  // $1 : (text) (optional) background color 
  // $0 : (text) (return) current box background color
  //
  // Getter and setter for the box background color

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:26:47
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBgColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.bgColor
Else 
	This:C1470.breadCrumb.box.bgColor:=$1
End if 
