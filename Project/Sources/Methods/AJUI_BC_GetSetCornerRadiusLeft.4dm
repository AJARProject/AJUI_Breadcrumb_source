//%attributes = {"invisible":true}
  // AJUI_BC_GetSetCornerRadiusLeft ( {  $cornerRadiusLeft } ) -> return
  //
  // $1 : (longint) (optional) corner radius 
  // $0 : (longint) (return) current radius for the left corners
  //
  // Getter and setter for the radius of the left corners of the box

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:34:24
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetCornerRadiusLeft
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.box.cornerRadius.left
Else 
	If ($param1>=0)
		This.breadCrumb.box.cornerRadius.left:=$param1
	End if 
End if 
