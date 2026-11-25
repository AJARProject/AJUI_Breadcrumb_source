//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBoxCentered ( {$centered} ) -> return
  //
  // $1 : (boolean) (optionnal) activate/inactivate
  // $0 : (boolean) (return) current value
  //
  // Getter and setter to activate/inactivate the centering of the box

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.10.19, 16:38:01
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBoxCentered
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.box.centered
Else 
	This.breadCrumb.box.centered:=$param1
End if 
