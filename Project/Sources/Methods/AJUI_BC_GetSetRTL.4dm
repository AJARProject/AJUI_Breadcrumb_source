//%attributes = {"invisible":true}
  // AJUI_BC_GetSetRTL ({  $rtl } ) -> return
  //
  // $1 : (boolean) (optional) draw section right to left
  // $0 : (boolean) (return) rtl activate/inactivate
  //
  // Getter and setter to draw the section from the right to the left

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 09:20:20
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetRTL
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.global.rtl
Else 
	This.breadCrumb.global.rtl:=$param1
End if 

