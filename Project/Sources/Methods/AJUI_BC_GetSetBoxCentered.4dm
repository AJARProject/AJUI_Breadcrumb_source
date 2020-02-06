//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBoxCentered ( {$centered} ) -> return
  //
  // $1 : (boolean) activate/inactivate
  // $0 : (boolean) (return) current value
  //
  // Getter and setter to activate/inactivate the centering of the box

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.10.19, 16:38:01
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBoxCentered
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.centered
Else 
	This:C1470.breadCrumb.box.centered:=$1
End if 