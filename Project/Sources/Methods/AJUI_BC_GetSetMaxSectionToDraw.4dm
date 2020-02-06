//%attributes = {"invisible":true}
  // AJUI_BC_GetSetMaxSectionToDraw ( {  $maxSectionToDraw } ) -> return
  //
  // $1 : (longint) (optional) number max of section to draw
  // $0 : (longint) (return) current max section
  //
  // Getter and setter to draw the box size dynamically base on the sections do draw

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 10:14:55
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetMaxSectionToDraw
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.global.maxSectionToDraw
Else 
	If ($1>=-1)
		This:C1470.breadCrumb.global.maxSectionToDraw:=$1
	End if 
End if 
