//%attributes = {"invisible":true}
  // AJUI_BC_GetSetReplacingColor ( {$color} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) color
  // $0 : (text) (return) current replacing color
  //
  // Getter and setter for the replacing color into a SVG picture

#DECLARE($param1 : Text; $param2 : Text) -> $result : Text

var $state; $type : Text
var $separator_pos : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:49:55
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetReplacingColor
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
		: (This.breadCrumb.sectionTypes[$type][$state].replacingColor#Null)
			$result:=This.breadCrumb.sectionTypes[$type][$state].replacingColor
			
		: (This.breadCrumb.sectionTypes[$type].default.replacingColor#Null)
			$result:=This.breadCrumb.sectionTypes[$type].default.replacingColor
			
		: (This.breadCrumb.sectionTypes.standard[$state].replacingColor#Null)
			$result:=This.breadCrumb.sectionTypes.standard[$state].replacingColor
			
		: (This.breadCrumb.sectionTypes.standard.default.replacingColor#Null)
			$result:=This.breadCrumb.sectionTypes.standard.default.replacingColor
	End case 
Else 
	This.breadCrumb.sectionTypes[$type][$state].replacingColor:=$param2
End if 
