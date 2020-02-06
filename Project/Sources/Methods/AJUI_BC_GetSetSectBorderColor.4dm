//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectBorderColor ( $constant { ; $color } ) -> return
  //
  // $1 : (text) constant
  // $2 : (text) (optional) color
  // $0 : (text) (return) current section border color
  //
  // Getter and setter for the section border color

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 25.09.19, 11:15:01
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetSectBorderColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($0;$1;$2;$state;$type)
C_LONGINT:C283($separator_pos)

$separator_pos:=Position:C15("-";$1)
$type:=Substring:C12($1;1;$separator_pos-1)
$state:=Substring:C12($1;$separator_pos+1)



If (Count parameters:C259=1)
	Case of 
		: (This:C1470.breadCrumb.sectionTypes[$type][$state].borderColor#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type][$state].borderColor
			
		: (This:C1470.breadCrumb.sectionTypes[$type].default.borderColor#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type].default.borderColor
			
		: (This:C1470.breadCrumb.sectionTypes.standard[$state].borderColor#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard[$state].borderColor
			
		: (This:C1470.breadCrumb.sectionTypes.standard.default.borderColor#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard.default.borderColor
	End case 
Else 
	This:C1470.breadCrumb.sectionTypes[$type][$state].borderColor:=$2
End if 