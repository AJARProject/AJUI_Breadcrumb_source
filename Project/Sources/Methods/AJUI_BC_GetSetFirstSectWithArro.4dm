//%attributes = {"invisible":true}
  // AJUI_BC_GetSetFirstSectWithArro ( $firstSectionWithArrow ) -> return
  //
  // $1 : (boolean) (optional) true/false
  // $0 : (boolean) (return) firstSectionWithArrow activate/inactivate
  //
  // Getter and setter to draw/remove the first section arrow (model: arrow)

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 16.10.19, 11:29:15
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetFirstSectWithArro
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



If (Count parameters=0)
	$result:=This.breadCrumb.divider.arrow.firstSectionWithArrow
Else 
	This.breadCrumb.divider.arrow.firstSectionWithArrow:=$param1
End if 

