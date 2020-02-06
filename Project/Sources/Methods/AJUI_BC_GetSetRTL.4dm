//%attributes = {"invisible":true}
  // AJUI_BC_GetSetRTL ({  $rtl } ) -> return
  //
  // $1 : (boolean) (optional) draw section right to left
  // $0 : (boolean) (return) rtl activate/inactivate
  //
  // Getter and setter to draw the section from the right to the left

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 09:20:20
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetRTL
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.global.rtl
Else 
	This:C1470.breadCrumb.global.rtl:=$1
End if 

