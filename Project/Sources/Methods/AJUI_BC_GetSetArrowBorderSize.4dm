//%attributes = {"invisible":true}
  // AJUI_BC_GetSetArrowBorderSize ( { $size } ) -> return
  //
  // $1 : (longint) (optional) size
  // $0 : (longint) (return) current arrow border size
  //
  // Getter and setter for the border size of the arrow used as a divider. (model : arrow)

If (False:C215)
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

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.arrow.borderSize
Else 
	If ($1>=0)
		This:C1470.breadCrumb.divider.arrow.borderSize:=$1
	End if 
End if 