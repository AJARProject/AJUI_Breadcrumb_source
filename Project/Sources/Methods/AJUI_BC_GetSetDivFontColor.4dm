//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivFontColor ( { $color } ) -> return
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current font color
  //
  // Getter and setter for the divider font color

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:16:21
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDivFontColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.font.color
Else 
	This:C1470.breadCrumb.divider.font.color:=$1
End if 