//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionFontName ($constant ; {$name} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) font name
  // $0 : (text) (return) current section font name
  //
  // Getter and setter for the font name of an section

#DECLARE($param1 : Text; $param2 : Text) -> $result : Text

var $state; $type : Text
var $separator_pos : Integer

If (False)
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


$separator_pos:=Position("-";$param1)
$type:=Substring($param1;1;$separator_pos-1)
$state:=Substring($param1;$separator_pos+1)



If (Count parameters=1)
	Case of 
		: (This.breadCrumb.sectionTypes[$type][$state].fontName#Null)
			$result:=This.breadCrumb.sectionTypes[$type][$state].fontName
			
		: (This.breadCrumb.sectionTypes[$type].default.fontName#Null)
			$result:=This.breadCrumb.sectionTypes[$type].default.fontName
			
		: (This.breadCrumb.sectionTypes.standard[$state].fontName#Null)
			$result:=This.breadCrumb.sectionTypes.standard[$state].fontName
			
		: (This.breadCrumb.sectionTypes.standard.default.fontName#Null)
			$result:=This.breadCrumb.sectionTypes.standard.default.fontName
	End case 
Else 
	This.breadCrumb.sectionTypes[$type][$state].fontName:=$param2
End if 
