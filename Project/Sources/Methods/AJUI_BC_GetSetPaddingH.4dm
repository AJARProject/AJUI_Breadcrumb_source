//%attributes = {"invisible":true}
  // AJUI_BC_GetSetPaddingH ( { $padding } ) -> return
  //
  // $1 : (longint) (optional) padding
  // $0 : (longint) (return) current horizontal padding
  //
  // Getter and setter for the padding horizontal of the box

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:47:52
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetPaddingH
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.box.padding.horizontal
Else 
	If ($param1>=0)
		This.breadCrumb.box.padding.horizontal:=$param1
	End if 
End if 
