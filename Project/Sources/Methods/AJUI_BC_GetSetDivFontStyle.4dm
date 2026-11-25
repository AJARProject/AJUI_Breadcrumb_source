//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivFontStyle ( { $style } ) -> return
  //
  // $1 : (text) (optional) style
  // $0 : (text) (return) current font style
  //
  // Getter and setter for the divider font style

#DECLARE($param1 : Text) -> $result : Text

If (False)
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



If (Count parameters=0)
	$result:=This.breadCrumb.divider.font.style
Else 
	This.breadCrumb.divider.font.style:=$param1
End if 
