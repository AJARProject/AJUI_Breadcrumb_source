//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionBorderSize ( $constant { ; $size } ) -> return
  //
  // $1 : (text) constant
  // $2 : (longint) (optional) size
  // $0 : (longint) (return) current section border size
  //
  // Getter and setter for the section border size

#DECLARE($param1 : Text; $param2 : Integer) -> $result : Integer

var $state; $type : Text
var $separator_pos : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 25.09.19, 11:15:11
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetSectionBorderSize
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
		: (This.breadCrumb.sectionTypes[$type][$state].borderSize#Null)
			$result:=This.breadCrumb.sectionTypes[$type][$state].borderSize
			
		: (This.breadCrumb.sectionTypes[$type].default.borderSize#Null)
			$result:=This.breadCrumb.sectionTypes[$type].default.borderSize
			
		: (This.breadCrumb.sectionTypes.standard[$state].borderSize#Null)
			$result:=This.breadCrumb.sectionTypes.standard[$state].borderSize
			
		: (This.breadCrumb.sectionTypes.standard.default.borderSize#Null)
			$result:=This.breadCrumb.sectionTypes.standard.default.borderSize
	End case 
Else 
	If ($param2>=0)
		This.breadCrumb.sectionTypes[$type][$state].borderSize:=$param2
	End if 
End if 
