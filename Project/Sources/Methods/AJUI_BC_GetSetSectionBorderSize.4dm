//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionBorderSize ( $constant { ; $size } ) -> return
  //
  // $1 : (text) constant
  // $2 : (longint) (optional) size
  // $0 : (longint) (return) current section border size
  //
  // Getter and setter for the section border size

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 25.09.19, 11:15:11
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetSectionBorderSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$state;$type)
C_LONGINT:C283($0;$2;$separator_pos)

$separator_pos:=Position:C15("-";$1)
$type:=Substring:C12($1;1;$separator_pos-1)
$state:=Substring:C12($1;$separator_pos+1)



If (Count parameters:C259=1)
	Case of 
		: (This:C1470.breadCrumb.sectionTypes[$type][$state].borderSize#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type][$state].borderSize
			
		: (This:C1470.breadCrumb.sectionTypes[$type].default.borderSize#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type].default.borderSize
			
		: (This:C1470.breadCrumb.sectionTypes.standard[$state].borderSize#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard[$state].borderSize
			
		: (This:C1470.breadCrumb.sectionTypes.standard.default.borderSize#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard.default.borderSize
	End case 
Else 
	If ($2>=0)
		This:C1470.breadCrumb.sectionTypes[$type][$state].borderSize:=$2
	End if 
End if 