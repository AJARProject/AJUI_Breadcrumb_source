//%attributes = {"invisible":true}
  // AJUI_BC_removePropException ( $property  ; $constant  ) 
  //
  // $1 : (text) formula name
  // $2 : (text) type and state to target
  //
  // This method remove an exception

#DECLARE($param1 : Text; $param2 : Text)

var $formula; $property; $state; $type : Text
var $separator_pos; $pos : Integer
var $properties_col : Collection

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.10.19, 15:45:48
	  // ----------------------------------------------------
	  // Method: AJUI_BC_removePropException
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$formula:=$param1

$properties_col:=AJUI_BC_PropertyCol 

$pos:=$properties_col.extract("formula").indexOf($formula)
$property:=$properties_col[$pos].property

If ($param2#AJUI_bc_standard_default)
	$separator_pos:=Position("-";$param2)
	$type:=Substring($param2;1;$separator_pos-1)
	$state:=Substring($param2;$separator_pos+1)
	
	
	OB REMOVE(This.breadCrumb.sectionTypes[$type][$state];$property)
End if 
