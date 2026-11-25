//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionBgColor ( $constant ; {$color} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) color
  // $0 : (text) (return) current section bg color
  //
  // Getter and setter for the background color of an section

#DECLARE($param1 : Text; $param2 : Text) -> $result : Text

var $state; $type : Text
var $separator_pos : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:47:19
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetSectionBgColor
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
		: (This.breadCrumb.sectionTypes[$type][$state].bgColor#Null)
			$result:=This.breadCrumb.sectionTypes[$type][$state].bgColor
			
		: (This.breadCrumb.sectionTypes[$type].default.bgColor#Null)
			$result:=This.breadCrumb.sectionTypes[$type].default.bgColor
			
		: (This.breadCrumb.sectionTypes.standard[$state].bgColor#Null)
			$result:=This.breadCrumb.sectionTypes.standard[$state].bgColor
			
		: (This.breadCrumb.sectionTypes.standard.default.bgColor#Null)
			$result:=This.breadCrumb.sectionTypes.standard.default.bgColor
	End case 
Else 
	This.breadCrumb.sectionTypes[$type][$state].bgColor:=$param2
End if 
