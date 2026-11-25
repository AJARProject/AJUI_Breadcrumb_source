//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivMargin ( { $margin } ) -> return
  //
  // $1 : (longint) (optional) margin
  // $0 : (longint) (return) current divider margin
  //
  // Getter and setter for the divider margin

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:15:13
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDivMargin
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.divider.margin
Else 
	If ($param1>=0)
		This.breadCrumb.divider.margin:=$param1
	End if 
End if 
