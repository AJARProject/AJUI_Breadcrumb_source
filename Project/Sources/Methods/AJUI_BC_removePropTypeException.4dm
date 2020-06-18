//%attributes = {"invisible":true}
  // AJUI_BC_removePropTypeException ( $property  ; $type  ) 
  //
  // $1 : (text) formula name
  // $2 : (text) type name
  //
  // This method remove each exception for a property but only for a specific type

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.10.19, 09:26:33
	  // ----------------------------------------------------
	  // Method: AJUI_BC_removePropTypeException
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$formula;$property)
C_TEXT:C284($2;$type)
C_LONGINT:C283($pos)

$formula:=$1
$type:=$2

$properties_col:=AJUI_BC_PropertyCol 

$pos:=$properties_col.extract("formula").indexOf($formula)
$property:=$properties_col[$pos].property

If ($type="first") | ($type="current") | ($type="previous") | ($type="next")
	OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes[$type].default;$property)
	OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes[$type].hover;$property)
	OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes[$type].active;$property)
	OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes[$type].disable;$property)
Else 
	If ($type="standard")
		OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes[$type].hover;$property)
		OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes[$type].active;$property)
		OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes[$type].disable;$property)
	End if 
End if 