//%attributes = {"invisible":true}
  // AJUI_BC_GetSetSectionFontSize ($constant ; {$size} ) -> return
  //
  // $1 : (text) type and state constant
  // $2 : (text) (optional) size
  // $0 : (text) (return) current section font size
  //
  // Getter and setter for the font size of an section

#DECLARE($param1 : Text; $param2 : Integer) -> $result : Integer

var $state; $type : Text
var $separator_pos : Integer

If (False)
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


$separator_pos:=Position("-";$param1)
$type:=Substring($param1;1;$separator_pos-1)
$state:=Substring($param1;$separator_pos+1)



If (Count parameters=1)
	Case of 
		: (This.breadCrumb.sectionTypes[$type][$state].fontSize#Null)
			$result:=This.breadCrumb.sectionTypes[$type][$state].fontSize
			
		: (This.breadCrumb.sectionTypes[$type].default.fontSize#Null)
			$result:=This.breadCrumb.sectionTypes[$type].default.fontSize
			
		: (This.breadCrumb.sectionTypes.standard[$state].fontSize#Null)
			$result:=This.breadCrumb.sectionTypes.standard[$state].fontSize
			
		: (This.breadCrumb.sectionTypes.standard.default.fontSize#Null)
			$result:=This.breadCrumb.sectionTypes.standard.default.fontSize
	End case 
Else 
	If ($param2>0)
		This.breadCrumb.sectionTypes[$type][$state].fontSize:=$param2
	End if 
End if 
