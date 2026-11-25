//%attributes = {"invisible":true}
  // AJUI_BC_GetSetArrowWidth ( { $width } ) -> return
  //
  // $1 : (text) (optional) width with px or %
  // $0 : (text) (return) current arrow width
  //
  // Getter and setter for the width of the arrow used as a divider. (model : arrow). Specify px or % after the number (examples 50px/10%)
  // percent is based on the text area width

#DECLARE($param1 : Text) -> $result : Text

If (False)
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


If (Count parameters=0)
	$result:=This.breadCrumb.divider.arrow.width
Else 
	If ($param1="@px") | ($param1="@%")
		This.breadCrumb.divider.arrow.width:=$param1
	End if 
End if 
