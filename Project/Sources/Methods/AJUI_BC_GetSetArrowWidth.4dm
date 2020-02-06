//%attributes = {"invisible":true}
  // AJUI_BC_GetSetArrowWidth ( { $width } ) -> return
  //
  // $1 : (text) (optional) width with px or %
  // $0 : (text) (return) current arrow width
  //
  // Getter and setter for the width of the arrow used as a divider. (model : arrow). Specify px or % after the number (examples 50px/10%)
  // percent is based on the text area width

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:17:12
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetArrowWidth
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.arrow.width
Else 
	If ($1="@px") | ($1="@%")
		This:C1470.breadCrumb.divider.arrow.width:=$1
	End if 
End if 