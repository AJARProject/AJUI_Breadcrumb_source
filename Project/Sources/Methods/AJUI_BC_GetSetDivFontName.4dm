//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivFontName ( { $name } ) -> return
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current font name
  //
  // Getter and setter for the divider font name

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:16:35
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDivFontName
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.font.name
Else 
	This:C1470.breadCrumb.divider.font.name:=$1
End if 