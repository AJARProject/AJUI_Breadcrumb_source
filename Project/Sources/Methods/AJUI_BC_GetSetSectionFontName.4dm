//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionFontName ($constant ; {$name} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) font name
  // $0 : (text) (return) current section font name
  //
  // Getter and setter for the font name of an section

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:48:07
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetSectionFontName
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
		: (This:C1470.breadCrumb.sectionTypes[$type][$state].fontName#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type][$state].fontName
			
		: (This:C1470.breadCrumb.sectionTypes[$type].default.fontName#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type].default.fontName
			
		: (This:C1470.breadCrumb.sectionTypes.standard[$state].fontName#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard[$state].fontName
			
		: (This:C1470.breadCrumb.sectionTypes.standard.default.fontName#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard.default.fontName
	End case 
Else 
	This:C1470.breadCrumb.sectionTypes[$type][$state].fontName:=$2
End if 