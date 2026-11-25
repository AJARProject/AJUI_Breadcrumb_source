//%attributes = {"invisible":true}
  // AJUI_BC_GetSetPictureOpacity ( $constant ; {$opacity} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (longint) (optional) opacity
  // $0 : (longint) (return) current picture opacity
  //
  // Getter and setter for the background color of an section

#DECLARE($param1 : Text; $param2 : Integer) -> $result : Integer

var $state; $type : Text
var $separator_pos : Integer

If (False)
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


$separator_pos:=Position("-";$param1)
$type:=Substring($param1;1;$separator_pos-1)
$state:=Substring($param1;$separator_pos+1)



If (Count parameters=1)
	Case of 
		: (This.breadCrumb.sectionTypes[$type][$state].pictureOpacity#Null)
			$result:=This.breadCrumb.sectionTypes[$type][$state].pictureOpacity
			
		: (This.breadCrumb.sectionTypes[$type].default.pictureOpacity#Null)
			$result:=This.breadCrumb.sectionTypes[$type].default.pictureOpacity
			
		: (This.breadCrumb.sectionTypes.standard[$state].pictureOpacity#Null)
			$result:=This.breadCrumb.sectionTypes.standard[$state].pictureOpacity
			
		: (This.breadCrumb.sectionTypes.standard.default.pictureOpacity#Null)
			$result:=This.breadCrumb.sectionTypes.standard.default.pictureOpacity
	End case 
Else 
	This.breadCrumb.sectionTypes[$type][$state].pictureOpacity:=$param2
End if 
