//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBoxHeight ( {  $height } ) -> return
  //
  // $1 : (longint) (optional) height 
  // $0 : (longint) (return) current box height
  //
  // Getter and setter for the box height

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:16:08
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBoxHeight
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.height
Else 
	This:C1470.breadCrumb.box.height:=$1
End if 
