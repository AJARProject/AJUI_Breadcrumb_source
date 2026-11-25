//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBoxWidth ( {  $width } ) -> return
  //
  // $1 : (longint) (optional) width 
  // $0 : (longint) (return) current box width
  //
  // Getter and setter for the box width

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:24:59
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBoxWidth
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.box.width
Else 
	This.breadCrumb.box.width:=$param1
End if 
