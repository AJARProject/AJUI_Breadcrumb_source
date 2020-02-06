//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBoxWidth ( {  $width } ) -> return
  //
  // $1 : (longint) (optional) width 
  // $0 : (longint) (return) current box width
  //
  // Getter and setter for the box width

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:24:59
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBoxWidth
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.width
Else 
	This:C1470.breadCrumb.box.width:=$1
End if 
