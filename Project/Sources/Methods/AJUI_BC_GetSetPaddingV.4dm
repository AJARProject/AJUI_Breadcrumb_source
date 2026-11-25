//%attributes = {"invisible":true}
  // AJUI_BC_GetSetPaddingV ( { $padding } ) -> return
  //
  // $1 : (longint) (optional) padding
  // $0 : (longint) (return) current vertical padding
  //
  // Getter and setter for the padding vertical of the box

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:48:42
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetPaddingV
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	
	$result:=This.breadCrumb.box.padding.vertical
Else 
	If ($param1>=0)
		This.breadCrumb.box.padding.vertical:=$param1
	End if 
End if 
