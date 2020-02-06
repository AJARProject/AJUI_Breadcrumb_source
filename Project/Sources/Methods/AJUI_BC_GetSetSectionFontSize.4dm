//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionFontSize ($constant ; {$size} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) size
  // $0 : (text) (return) current section font size
  //
  // Getter and setter for the font size of an section

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:47:54
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetSectionFontSize
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
		: (This:C1470.breadCrumb.sectionTypes[$type][$state].fontSize#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type][$state].fontSize
			
		: (This:C1470.breadCrumb.sectionTypes[$type].default.fontSize#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type].default.fontSize
			
		: (This:C1470.breadCrumb.sectionTypes.standard[$state].fontSize#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard[$state].fontSize
			
		: (This:C1470.breadCrumb.sectionTypes.standard.default.fontSize#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard.default.fontSize
	End case 
Else 
	If ($2>0)
		This:C1470.breadCrumb.sectionTypes[$type][$state].fontSize:=$2
	End if 
End if 