//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBorderSize ( {  $size } ) -> return
  //
  // $1 : (longint) (optional) border size 
  // $0 : (longint) (return) current box border size
  //
  // Getter and setter for the box border size

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:40:17
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBorderSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.box.border.size
Else 
	If ($param1>=0)
		This.breadCrumb.box.border.size:=$param1
	End if 
End if 
