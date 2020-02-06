//%attributes = {"invisible":true}
  // AJUI_BC_resetState ( $state ) -> return
  //
  // $1 : (text) constant
  //
  // This method will reset the exception of a state of a type of an instance

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.09.19, 14:05:44
	  // ----------------------------------------------------
	  // Method: AJUI_BC_resetState
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$state;$type)
C_LONGINT:C283($separator_pos)

$separator_pos:=Position:C15("-";$1)
$type:=Substring:C12($1;1;$separator_pos-1)
$state:=Substring:C12($1;$separator_pos+1)

OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes[$type];$state)

This:C1470.breadCrumb.sectionTypes[$type][$state]:=New object:C1471
