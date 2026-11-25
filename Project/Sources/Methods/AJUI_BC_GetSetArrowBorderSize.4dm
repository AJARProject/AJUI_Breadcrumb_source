//%attributes = {"invisible":true}
  // AJUI_BC_GetSetArrowBorderSize ( { $size } ) -> return
  //
  // $1 : (longint) (optional) size
  // $0 : (longint) (return) current arrow border size
  //
  // Getter and setter for the border size of the arrow used as a divider. (model : arrow)

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:18:07
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetArrowBorderSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.divider.arrow.borderSize
Else 
	If ($param1>=0)
		This.breadCrumb.divider.arrow.borderSize:=$param1
	End if 
End if 
