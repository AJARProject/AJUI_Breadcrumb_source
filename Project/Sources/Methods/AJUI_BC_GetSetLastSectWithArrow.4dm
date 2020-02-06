//%attributes = {"invisible":true}
  // AJUI_BC_GetSetLastSectWithArrow ( $lastSectionWithArrow ) -> return
  //
  // $1 : (boolean) (optional) true/false
  // $0 : (boolean) (return) lastSectionWithArrow activate/inactivate
  //
  // Getter and setter to draw/remove the last section arrow (model: arrow)

If (False:C215)
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

C_BOOLEAN:C305($1;$0;$arrow)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.arrow.lastSectionWithArrow
Else 
	This:C1470.breadCrumb.divider.arrow.lastSectionWithArrow:=$1
End if 

