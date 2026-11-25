//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionFontColor ($constant ; {$color} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) color
  // $0 : (text) (return) current section font color
  //
  // Getter and setter for the font color of an section

#DECLARE($param1 : Text; $param2 : Text) -> $result : Text

var $state; $type : Text
var $separator_pos : Integer

If (False)
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


$separator_pos:=Position("-";$param1)
$type:=Substring($param1;1;$separator_pos-1)
$state:=Substring($param1;$separator_pos+1)



If (Count parameters=1)
	Case of 
		: (This.breadCrumb.sectionTypes[$type][$state].fontColor#Null)
			$result:=This.breadCrumb.sectionTypes[$type][$state].fontColor
			
		: (This.breadCrumb.sectionTypes[$type].default.fontColor#Null)
			$result:=This.breadCrumb.sectionTypes[$type].default.fontColor
			
		: (This.breadCrumb.sectionTypes.standard[$state].fontColor#Null)
			$result:=This.breadCrumb.sectionTypes.standard[$state].fontColor
			
		: (This.breadCrumb.sectionTypes.standard.default.fontColor#Null)
			$result:=This.breadCrumb.sectionTypes.standard.default.fontColor
	End case 
Else 
	This.breadCrumb.sectionTypes[$type][$state].fontColor:=$param2
End if 
