//%attributes = {"invisible":true}
  // AJUI_BC_resetAllStates ( ) 
  //
  //
  // This method will reset all the states exceptions for each type of an instance

If (False:C215)
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

$states_obj:=New object:C1471
$states_obj.default:=New object:C1471
$states_obj.hover:=New object:C1471
$states_obj.active:=New object:C1471
$states_obj.disable:=New object:C1471

OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes;"first")
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes;"current")
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes;"previous")
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes;"next")

This:C1470.breadCrumb.sectionTypes.first:=OB Copy:C1225($states_obj)
This:C1470.breadCrumb.sectionTypes.current:=OB Copy:C1225($states_obj)
This:C1470.breadCrumb.sectionTypes.previous:=OB Copy:C1225($states_obj)
This:C1470.breadCrumb.sectionTypes.next:=OB Copy:C1225($states_obj)

  //for standard we  don't clean the default state
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.standard;"hover")
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.standard;"active")
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.standard;"disable")

This:C1470.breadCrumb.sectionTypes.standard.hover:=New object:C1471
This:C1470.breadCrumb.sectionTypes.standard.active:=New object:C1471
This:C1470.breadCrumb.sectionTypes.standard.disable:=New object:C1471