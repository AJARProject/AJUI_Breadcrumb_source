//%attributes = {"invisible":true}
  // AJUI_BC_GetSetMaxSectionToDraw ( {  $maxSectionToDraw } ) -> return
  //
  // $1 : (longint) (optional) number max of section to draw
  // $0 : (longint) (return) current max section
  //
  // Getter and setter to draw the box size dynamically base on the sections do draw

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
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


If (Count parameters=0)
	$result:=This.breadCrumb.global.maxSectionToDraw
Else 
	If ($param1>=-1)
		This.breadCrumb.global.maxSectionToDraw:=$param1
	End if 
End if 
