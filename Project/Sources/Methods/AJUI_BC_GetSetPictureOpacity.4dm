//%attributes = {"invisible":true}
  // AJUI_BC_GetSetPictureOpacity ( $constant ; {$opacity} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (longint) (optional) opacity
  // $0 : (longint) (return) current picture opacity
  //
  // Getter and setter for the background color of an section

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.10.19, 09:20:58
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetPictureOpacity
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
		: (This:C1470.breadCrumb.sectionTypes[$type][$state].pictureOpacity#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type][$state].pictureOpacity
			
		: (This:C1470.breadCrumb.sectionTypes[$type].default.pictureOpacity#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes[$type].default.pictureOpacity
			
		: (This:C1470.breadCrumb.sectionTypes.standard[$state].pictureOpacity#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard[$state].pictureOpacity
			
		: (This:C1470.breadCrumb.sectionTypes.standard.default.pictureOpacity#Null:C1517)
			$0:=This:C1470.breadCrumb.sectionTypes.standard.default.pictureOpacity
	End case 
Else 
	This:C1470.breadCrumb.sectionTypes[$type][$state].pictureOpacity:=$2
End if 