//%attributes = {"invisible":true}
  // AJUI_BC_resetAllStates ( ) 
  //
  //
  // This method will reset all the states exceptions for each type of an instance

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.09.19, 14:06:03
	  // ----------------------------------------------------
	  // Method: AJUI_BC_resetAllStates
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $states_obj : Object

$states_obj:=New object
$states_obj.default:=New object
$states_obj.hover:=New object
$states_obj.active:=New object
$states_obj.disable:=New object

OB REMOVE(This.breadCrumb.sectionTypes;"first")
OB REMOVE(This.breadCrumb.sectionTypes;"current")
OB REMOVE(This.breadCrumb.sectionTypes;"previous")
OB REMOVE(This.breadCrumb.sectionTypes;"next")

This.breadCrumb.sectionTypes.first:=OB Copy($states_obj)
This.breadCrumb.sectionTypes.current:=OB Copy($states_obj)
This.breadCrumb.sectionTypes.previous:=OB Copy($states_obj)
This.breadCrumb.sectionTypes.next:=OB Copy($states_obj)

  //for standard we  don't clean the default state
OB REMOVE(This.breadCrumb.sectionTypes.standard;"hover")
OB REMOVE(This.breadCrumb.sectionTypes.standard;"active")
OB REMOVE(This.breadCrumb.sectionTypes.standard;"disable")

This.breadCrumb.sectionTypes.standard.hover:=New object
This.breadCrumb.sectionTypes.standard.active:=New object
This.breadCrumb.sectionTypes.standard.disable:=New object
