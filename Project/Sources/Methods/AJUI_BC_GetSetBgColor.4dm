//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBgColor ( {  $bgColor } ) -> return
  //
  // $1 : (text) (optional) background color 
  // $0 : (text) (return) current box background color
  //
  // Getter and setter for the box background color

#DECLARE($param1 : Text) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:26:47
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBgColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.box.bgColor
Else 
	This.breadCrumb.box.bgColor:=$param1
End if 
