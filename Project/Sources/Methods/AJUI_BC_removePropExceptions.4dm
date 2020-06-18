//%attributes = {"invisible":true}
  // AJUI_BC_removePropExceptions ( $property  ) 
  //
  // $1 : (text) formula name
  //
  // This method remove each exception for a property

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 21.10.19, 16:26:52
	  // ----------------------------------------------------
	  // Method: AJUI_BC_removePropExceptions
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$formula;$property)
C_LONGINT:C283($pos)

$formula:=$1

$properties_col:=AJUI_BC_PropertyCol 

$pos:=$properties_col.extract("formula").indexOf($formula)
$property:=$properties_col[$pos].property

OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.standard.hover;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.standard.active;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.standard.disable;$property)

OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.first.default;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.first.hover;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.first.active;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.first.disable;$property)

OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.current.default;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.current.hover;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.current.active;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.current.disable;$property)

OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.previous.default;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.previous.hover;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.previous.active;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.previous.disable;$property)

OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.next.default;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.next.hover;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.next.active;$property)
OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes.next.disable;$property)

