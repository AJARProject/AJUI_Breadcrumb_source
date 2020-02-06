//%attributes = {"invisible":true}
  // AJUI_BC_checkNextPosition (  ) -> return
  //
  // $0 : (longint) (return) next position
  //
  // Check the bigger position and return this value and add one to it

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.09.19, 13:24:31
	  // ----------------------------------------------------
	  // Method: AJUI_BC_checkNextPosition
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$nextPosition)

If (This:C1470.breadCrumb.sectionList.count()=0)
	$nextPosition:=1
Else 
	$nextPosition:=This:C1470.breadCrumb.sectionList.max("position")+1
End if 

$0:=$nextPosition