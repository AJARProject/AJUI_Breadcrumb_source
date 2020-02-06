//%attributes = {"invisible":true}
  // AJUI_BC_removePropException ( $property  ; $constant  ) 
  //
  // $1 : (text) formula name
  // $2 : (text) type and state to target
  //
  // This method remove an exception

If (False:C215)
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

C_TEXT:C284($1;$formula;$property)
C_TEXT:C284($2;$state;$type)
C_LONGINT:C283($separator_pos;$pos)

$formula:=$1

$properties_col:=AJUI_BC_PropertyCol 

$pos:=$properties_col.extract("formula").indexOf($formula)
$property:=$properties_col[$pos].property

If ($2#AJUI_bc_standard_default)
	$separator_pos:=Position:C15("-";$2)
	$type:=Substring:C12($2;1;$separator_pos-1)
	$state:=Substring:C12($2;$separator_pos+1)
	
	
	OB REMOVE:C1226(This:C1470.breadCrumb.sectionTypes[$type][$state];$property)
End if 