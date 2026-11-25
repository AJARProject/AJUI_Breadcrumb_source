//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivFontSize ( { $size } ) -> return
  //
  // $1 : (longint) (optional) size
  // $0 : (longint) (return) current font size
  //
  // Getter and setter for the divider font size

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:16:10
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDivFontSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.divider.font.size
Else 
	If ($param1>0)
		This.breadCrumb.divider.font.size:=$param1
	End if 
End if 
