//%attributes = {"invisible":true}
  // AJUI_BC_removePropExceptions ( $property  ) 
  //
  // $1 : (text) formula name
  //
  // This method remove each exception for a property

#DECLARE($param1 : Text)

var $formula; $property : Text
var $pos : Integer
var $properties_col : Collection

If (False)
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


$formula:=$param1

$properties_col:=AJUI_BC_PropertyCol 

$pos:=$properties_col.extract("formula").indexOf($formula)
$property:=$properties_col[$pos].property

OB REMOVE(This.breadCrumb.sectionTypes.standard.hover;$property)
OB REMOVE(This.breadCrumb.sectionTypes.standard.active;$property)
OB REMOVE(This.breadCrumb.sectionTypes.standard.disable;$property)

OB REMOVE(This.breadCrumb.sectionTypes.first.default;$property)
OB REMOVE(This.breadCrumb.sectionTypes.first.hover;$property)
OB REMOVE(This.breadCrumb.sectionTypes.first.active;$property)
OB REMOVE(This.breadCrumb.sectionTypes.first.disable;$property)

OB REMOVE(This.breadCrumb.sectionTypes.current.default;$property)
OB REMOVE(This.breadCrumb.sectionTypes.current.hover;$property)
OB REMOVE(This.breadCrumb.sectionTypes.current.active;$property)
OB REMOVE(This.breadCrumb.sectionTypes.current.disable;$property)

OB REMOVE(This.breadCrumb.sectionTypes.previous.default;$property)
OB REMOVE(This.breadCrumb.sectionTypes.previous.hover;$property)
OB REMOVE(This.breadCrumb.sectionTypes.previous.active;$property)
OB REMOVE(This.breadCrumb.sectionTypes.previous.disable;$property)

OB REMOVE(This.breadCrumb.sectionTypes.next.default;$property)
OB REMOVE(This.breadCrumb.sectionTypes.next.hover;$property)
OB REMOVE(This.breadCrumb.sectionTypes.next.active;$property)
OB REMOVE(This.breadCrumb.sectionTypes.next.disable;$property)

