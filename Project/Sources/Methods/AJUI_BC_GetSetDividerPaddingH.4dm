//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDividerPaddingH ( { $padding } ) -> return
  //
  // $1 : (longint) (optional) padding
  // $0 : (longint) (return) current divider padding horizontal
  //
  // Getter and setter for the padding horizontal (only for model : arrow)

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 20.09.19, 10:07:39
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDividerPaddingH
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.divider.arrow.paddingH
Else 
	If ($param1>=0)
		This.breadCrumb.divider.arrow.paddingH:=$param1
	End if 
End if 
