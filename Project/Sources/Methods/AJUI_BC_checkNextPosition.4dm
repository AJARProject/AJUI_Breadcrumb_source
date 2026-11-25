//%attributes = {"invisible":true}
  // AJUI_BC_checkNextPosition (  ) -> return
  //
  // $0 : (longint) (return) next position
  //
  // Check the bigger position and return this value and add one to it

#DECLARE() -> $result : Integer

var $nextPosition : Integer

If (False)
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


If (This.breadCrumb.sectionList.count()=0)
	$nextPosition:=1
Else 
	$nextPosition:=This.breadCrumb.sectionList.max("position")+1
End if 

$result:=$nextPosition
