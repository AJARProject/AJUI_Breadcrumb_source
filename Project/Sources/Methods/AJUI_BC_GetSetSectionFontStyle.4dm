//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionFontStyle ($constant ; {$style} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) style
  // $0 : (text) (return) current section font style
  //
  // Getter and setter for the font style of an section

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:48:24
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetSectionFontStyle
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
		: (This:C1470.breadCrumb.sectionTypes[$type][$state].fontStyle#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type][$state].fontStyle
			
		: (This:C1470.breadCrumb.sectionTypes[$type].default.fontStyle#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type].default.fontStyle
			
		: (This:C1470.breadCrumb.sectionTypes.standard[$state].fontStyle#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard[$state].fontStyle
			
		: (This:C1470.breadCrumb.sectionTypes.standard.default.fontStyle#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard.default.fontStyle
	End case 
Else 
	This:C1470.breadCrumb.sectionTypes[$type][$state].fontStyle:=$2
End if 