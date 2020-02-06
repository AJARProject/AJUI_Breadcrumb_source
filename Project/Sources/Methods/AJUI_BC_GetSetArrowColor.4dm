//%attributes = {"invisible":true}
  // AJUI_BC_GetSetArrowColor ( { $color } ) -> return
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current arrow color
  //
  // Getter and setter for the color of the arrow used as a divider. (model : arrow)

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:17:43
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetArrowColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.arrow.color
Else 
	
	This:C1470.breadCrumb.divider.arrow.color:=$1
	
End if 