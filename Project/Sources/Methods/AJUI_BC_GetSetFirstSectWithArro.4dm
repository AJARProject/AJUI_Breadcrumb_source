//%attributes = {"invisible":true}
  // AJUI_BC_GetSetFirstSectWithArro ( $firstSectionWithArrow ) -> return
  //
  // $1 : (boolean) (optional) true/false
  // $0 : (boolean) (return) firstSectionWithArrow activate/inactivate
  //
  // Getter and setter to draw/remove the first section arrow (model: arrow)

If (False:C215)
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


C_BOOLEAN:C305($1;$0;$arrow)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.divider.arrow.firstSectionWithArrow
Else 
	This:C1470.breadCrumb.divider.arrow.firstSectionWithArrow:=$1
End if 

