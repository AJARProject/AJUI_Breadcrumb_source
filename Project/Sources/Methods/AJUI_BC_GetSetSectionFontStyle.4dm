//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionFontStyle ($constant ; {$style} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) style
  // $0 : (text) (return) current section font style
  //
  // Getter and setter for the font style of an section

#DECLARE($param1 : Text; $param2 : Text) -> $result : Text

var $state; $type : Text
var $separator_pos : Integer

If (False)
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


$separator_pos:=Position("-";$param1)
$type:=Substring($param1;1;$separator_pos-1)
$state:=Substring($param1;$separator_pos+1)



If (Count parameters=1)
	Case of 
		: (This.breadCrumb.sectionTypes[$type][$state].fontStyle#Null)
			$result:=This.breadCrumb.sectionTypes[$type][$state].fontStyle
			
		: (This.breadCrumb.sectionTypes[$type].default.fontStyle#Null)
			$result:=This.breadCrumb.sectionTypes[$type].default.fontStyle
			
		: (This.breadCrumb.sectionTypes.standard[$state].fontStyle#Null)
			$result:=This.breadCrumb.sectionTypes.standard[$state].fontStyle
			
		: (This.breadCrumb.sectionTypes.standard.default.fontStyle#Null)
			$result:=This.breadCrumb.sectionTypes.standard.default.fontStyle
	End case 
Else 
	This.breadCrumb.sectionTypes[$type][$state].fontStyle:=$param2
End if 
