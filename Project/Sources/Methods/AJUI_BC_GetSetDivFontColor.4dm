//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivFontColor ( { $color } ) -> return
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current font color
  //
  // Getter and setter for the divider font color

#DECLARE($param1 : Text) -> $result : Text

If (False)
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


If (Count parameters=0)
	$result:=This.breadCrumb.divider.font.color
Else 
	This.breadCrumb.divider.font.color:=$param1
End if 
