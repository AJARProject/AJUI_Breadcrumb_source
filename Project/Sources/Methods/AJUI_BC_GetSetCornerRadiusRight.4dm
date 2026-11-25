//%attributes = {"invisible":true}
  // AJUI_BC_GetSetCornerRadiusRight ( {  $cornerRadiusRight } ) -> return
  //
  // $1 : (longint) (optional) corner radius 
  // $0 : (longint) (return) current radius for the right corners
  //
  // Getter and setter for the radius of the right corners of the box


#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:31:43
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetCornerRadiusRight
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.box.cornerRadius.right
Else 
	If ($param1>=0)
		This.breadCrumb.box.cornerRadius.right:=$param1
	End if 
End if 
