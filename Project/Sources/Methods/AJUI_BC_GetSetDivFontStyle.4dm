//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivFontStyle ( { $style } ) -> return
  //
  // $1 : (text) (optional) style
  // $0 : (text) (return) current font style
  //
  // Getter and setter for the divider font style

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:16:46
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDivFontStyle
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.font.style
Else 
	This:C1470.breadCrumb.divider.font.style:=$1
End if 