//%attributes = {"invisible":true}
  // AJUI_BC_resetState ( $state ) -> return
  //
  // $1 : (text) constant
  //
  // This method will reset the exception of a state of a type of an instance

#DECLARE($param1 : Text)

var $state; $type : Text
var $separator_pos : Integer

If (False)
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


$separator_pos:=Position("-";$param1)
$type:=Substring($param1;1;$separator_pos-1)
$state:=Substring($param1;$separator_pos+1)

OB REMOVE(This.breadCrumb.sectionTypes[$type];$state)

This.breadCrumb.sectionTypes[$type][$state]:=New object
