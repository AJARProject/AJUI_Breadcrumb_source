//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionFontColor ($constant ; {$color} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) color
  // $0 : (text) (return) current section font color
  //
  // Getter and setter for the font color of an section

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:47:37
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetSectionFontColor
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
		: (This:C1470.breadCrumb.sectionTypes[$type][$state].fontColor#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type][$state].fontColor
			
		: (This:C1470.breadCrumb.sectionTypes[$type].default.fontColor#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type].default.fontColor
			
		: (This:C1470.breadCrumb.sectionTypes.standard[$state].fontColor#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard[$state].fontColor
			
		: (This:C1470.breadCrumb.sectionTypes.standard.default.fontColor#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard.default.fontColor
	End case 
Else 
	This:C1470.breadCrumb.sectionTypes[$type][$state].fontColor:=$2
End if 