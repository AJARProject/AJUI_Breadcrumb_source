//%attributes = {"invisible":true}
  // AJUI_BC_GetSetLastSectWithArrow ( $lastSectionWithArrow ) -> return
  //
  // $1 : (boolean) (optional) true/false
  // $0 : (boolean) (return) lastSectionWithArrow activate/inactivate
  //
  // Getter and setter to draw/remove the last section arrow (model: arrow)

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.09.19, 11:47:50
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetLastSectWithArrow
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.divider.arrow.lastSectionWithArrow
Else 
	This.breadCrumb.divider.arrow.lastSectionWithArrow:=$param1
End if 

