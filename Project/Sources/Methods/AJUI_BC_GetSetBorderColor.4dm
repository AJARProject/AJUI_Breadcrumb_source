//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBorderColor ( {  $color } ) -> return
  //
  // $1 : (text) (optional) border color 
  // $0 : (text) (return) current box border color
  //
  // Getter and setter for the box border color

#DECLARE($param1 : Text) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:38:15
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBorderColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.box.border.color
Else 
	This.breadCrumb.box.border.color:=$param1
End if 
