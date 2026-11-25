//%attributes = {"invisible":true}
  // AJUI_BC_removePropTypeException ( $property  ; $type  ) 
  //
  // $1 : (text) formula name
  // $2 : (text) type name
  //
  // This method remove each exception for a property but only for a specific type

#DECLARE($param1 : Text; $param2 : Text)

var $formula; $property; $type : Text
var $pos : Integer
var $properties_col : Collection

If (False)
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


$formula:=$param1
$type:=$param2

$properties_col:=AJUI_BC_PropertyCol 

$pos:=$properties_col.extract("formula").indexOf($formula)
$property:=$properties_col[$pos].property

If ($type="first") | ($type="current") | ($type="previous") | ($type="next")
	OB REMOVE(This.breadCrumb.sectionTypes[$type].default;$property)
	OB REMOVE(This.breadCrumb.sectionTypes[$type].hover;$property)
	OB REMOVE(This.breadCrumb.sectionTypes[$type].active;$property)
	OB REMOVE(This.breadCrumb.sectionTypes[$type].disable;$property)
Else 
	If ($type="standard")
		OB REMOVE(This.breadCrumb.sectionTypes[$type].hover;$property)
		OB REMOVE(This.breadCrumb.sectionTypes[$type].active;$property)
		OB REMOVE(This.breadCrumb.sectionTypes[$type].disable;$property)
	End if 
End if 
