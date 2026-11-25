// Declared so the 21 R4 compiler knows the properties set on This.
// https://developer.4d.com/docs/21-R4/Concepts/classes
property breadCrumb : Object
property failImport : Boolean
property templateName : Text

Class constructor($param1 : Object)

	var $template_obj : Object
	
	
	If (Count parameters=1)
		If ($param1.templatePath=Null)
			$template_obj:=AJUI_BC_templateImport ($param1.templateName)
		Else 
			$template_obj:=AJUI_BC_templateImport ($param1.templateName;$param1.templatePath)
		End if 
		
		If (This.failImport)
			$template_obj:=New object()
		Else 
			This.breadCrumb:=$template_obj.breadCrumb
		End if 
	End if 
	
	AJUI_BC_initProperties (This)

Function Draw
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method will handle the state, calculation of the size of each sections, launching the draw and the callback,...
	
	AJUI_BC_draw

Function Export($param1 : Text; $param2 : Text)
	  // ----------------------
	  // Function
	  // ----------------------
	  // Method to export the AJUI BreadCrumb instance into a json file
	
	  // $1 : (text) AJUI BreadCrumb template name
	  // $2 : (text) (optional) Path to export
	
	
	If (Count parameters=2)
		AJUI_BC_templateExport ($param1;$param2)
	Else 
		AJUI_BC_templateExport ($param1)
	End if

Function Hide
	  // ----------------------
	  // Function
	  // ----------------------
	  //  Wrapper for the object set visible (false)
	
	AJUI_BC_hide

Function RemoveCurrent
	  // ----------------------
	  // Function
	  // ----------------------
	  // Remove the current state into a groupedButtons model
	
	AJUI_BC_removeCurrent

Function RemovePropertyException($param1 : Text; $param2 : Text)
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method remove an exception
	
	  // $1 : (text) formula name
	  // $2 : (text) type and state to target
	
	
	AJUI_BC_removePropException ($param1;$param2)

Function RemovePropertyExceptions($param1 : Text)
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method remove each exception for a property
	
	  // $1 : (text) formula name
	
	
	AJUI_BC_removePropExceptions ($param1)

Function RemovePropertyTypeExceptions($param1 : Text; $param2 : Text)
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method remove each exception for a property but only for a specific type
	
	  // $1 : (text) formula name
	  // $2 : (text) type name
	
	
	AJUI_BC_removePropTypeException ($param1;$param2)

Function ResetAllStates
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method will reset all the states exceptions for each type of an instance
	
	AJUI_BC_resetAllStates

Function ResetState($param1 : Text)
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method will reset the exception of a state of a type of an instance
	
	  // $1 : (text) constant
	
	
	AJUI_BC_resetState ($param1)

Function Show
	  // ----------------------
	  // Function
	  // ----------------------
	  // Wrapper for the object set visible (true)
	
	AJUI_BC_show

Function MaxSectionToDraw($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Global
	  // ----------------------
	  // Getter and setter to draw the box size dynamically base on the sections do draw
	
	  // $1 : (longint) (optional) number max of section to draw
	  // $0 : (longint) (return) current max section
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetMaxSectionToDraw 
	Else 
		AJUI_BC_GetSetMaxSectionToDraw ($param1)
	End if

Function Model($param1 : Text) -> $result : Text
	  // ----------------------
	  // Global
	  // ----------------------
	  // Getter and setter for the breadcrumb model to use
	
	  // $1 : (text) (optional) model name
	  // $0 : (text) (return) current model name
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetModel 
	Else 
		AJUI_BC_GetSetModel ($param1)
	End if

Function Name($param1 : Text) -> $result : Text
	  // ----------------------
	  // Global
	  // ----------------------
	  // Getter and Setter for the form object name who will receive the breadcrumb
	
	  // $1 : (text) (optional) form object name
	  // $0 : (text) (return) current form object name
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetName 
	Else 
		AJUI_BC_GetSetName ($param1)
	End if

Function RTL($param1 : Boolean) -> $result : Boolean
	  // ----------------------
	  // Global
	  // ----------------------
	  // Getter and setter to draw the section from the right to the left
	
	  // $1 : (boolean) (optional) draw section right to left
	  // $0 : (boolean) (return) rtl activate/inactivate
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetRTL 
	Else 
		AJUI_BC_GetSetRTL ($param1)
	End if

Function BgColor($param1 : Text) -> $result : Text
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box background color
	
	  // $1 : (text) (optional) background color 
	  // $0 : (text) (return) current box background color
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetBgColor 
	Else 
		AJUI_BC_GetSetBgColor ($param1)
	End if

Function BorderColor($param1 : Text) -> $result : Text
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box border color
	
	  // $1 : (text) (optional) border color 
	  // $0 : (text) (return) current box border color
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetBorderColor 
	Else 
		AJUI_BC_GetSetBorderColor ($param1)
	End if

Function BorderSize($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box border size
	
	  // $1 : (longint) (optional) border size 
	  // $0 : (longint) (return) current box border size
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetBorderSize 
	Else 
		AJUI_BC_GetSetBorderSize ($param1)
	End if

Function BoxHeight($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box height
	
	  // $1 : (longint) (optional) height 
	  // $0 : (longint) (return) current box height
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetBoxHeight 
	Else 
		AJUI_BC_GetSetBoxHeight ($param1)
	End if

Function BoxWidth($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box width
	
	  // $1 : (longint) (optional) width 
	  // $0 : (longint) (return) current box width
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetBoxWidth 
	Else 
		AJUI_BC_GetSetBoxWidth ($param1)
	End if

Function CornerRadiusLeft($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the radius of the left corners of the box
	
	  // $1 : (longint) (optional) corner radius 
	  // $0 : (longint) (return) current radius for the left corners
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetCornerRadiusLeft 
	Else 
		AJUI_BC_GetSetCornerRadiusLeft ($param1)
	End if

Function CornerRadiusRight($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the radius of the right corners of the box
	
	  // $1 : (longint) (optional) corner radius 
	  // $0 : (longint) (return) current radius for the right corners
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetCornerRadiusRight 
	Else 
		AJUI_BC_GetSetCornerRadiusRight ($param1)
	End if

Function IsBoxCentered($param1 : Boolean) -> $result : Boolean
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter to activate/inactivate the centering of the box
	
	  // $1 : (boolean) (optionnal) activate/inactivate
	  // $0 : (boolean) (return) current value
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetBoxCentered 
	Else 
		AJUI_BC_GetSetBoxCentered ($param1)
	End if

Function IsDynamicSize($param1 : Boolean) -> $result : Boolean
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter to activate/inactivate the dynamic sizing of the Breadcrumb box
	
	  // $1 : (boolean) (optional) activate/inacivate
	  // $0 : (boolean) (return) dynamic size activated/inactivated
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetDynamicSize 
	Else 
		AJUI_BC_GetSetDynamicSize ($param1)
	End if

Function PaddingH($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the padding horizontal of the box
	
	  // $1 : (longint) (optional) padding
	  // $0 : (longint) (return) current horizontal padding
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetPaddingH 
	Else 
		AJUI_BC_GetSetPaddingH ($param1)
	End if

Function PaddingV($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the padding vertical of the box
	
	  // $1 : (longint) (optional) padding
	  // $0 : (longint) (return) current vertical padding
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetPaddingV 
	Else 
		AJUI_BC_GetSetPaddingV ($param1)
	End if

Function ArrowBorderSize($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the border size of the arrow used as a divider. (model : arrow)
	
	  // $1 : (longint) (optional) size
	  // $0 : (longint) (return) current arrow border size
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetArrowBorderSize 
	Else 
		AJUI_BC_GetSetArrowBorderSize ($param1)
	End if

Function ArrowColor($param1 : Text) -> $result : Text
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the color of the arrow used as a divider. (model : arrow)
	
	  // $1 : (text) (optional) color
	  // $0 : (text) (return) current arrow color
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetArrowColor 
	Else 
		AJUI_BC_GetSetArrowColor ($param1)
	End if

Function ArrowPaddingH($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the padding horizontal (only for model : arrow)
	
	  // $1 : (longint) (optional) padding
	  // $0 : (longint) (return) current divider padding horizontal
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetDividerPaddingH 
	Else 
		AJUI_BC_GetSetDividerPaddingH ($param1)
	End if

Function ArrowWidth($param1 : Text) -> $result : Text
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the width of the arrow used as a divider. (model : arrow). Specify px or % after the number (examples 50px/10%)
	  // percent is based on the text area width
	
	  // $1 : (text) (optional) width with px or %
	  // $0 : (text) (return) current arrow width
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetArrowWidth 
	Else 
		AJUI_BC_GetSetArrowWidth ($param1)
	End if

Function Divider($param1 : Text) -> $result : Text
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the string to use as a divider
	
	  // $1 : (text) (optional) divider
	  // $0 : (text) (return) current divider
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetDivString 
	Else 
		AJUI_BC_GetSetDivString ($param1)
	End if

Function DividerFontColor($param1 : Text) -> $result : Text
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider font color
	
	  // $1 : (text) (optional) color
	  // $0 : (text) (return) current font color
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetDivFontColor 
	Else 
		AJUI_BC_GetSetDivFontColor ($param1)
	End if

Function DividerFontName($param1 : Text) -> $result : Text
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider font name
	
	  // $1 : (text) (optional) color
	  // $0 : (text) (return) current font name
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetDivFontName 
	Else 
		AJUI_BC_GetSetDivFontName ($param1)
	End if

Function DividerFontSize($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider font size
	
	  // $1 : (longint) (optional) size
	  // $0 : (longint) (return) current font size
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetDivFontSize 
	Else 
		AJUI_BC_GetSetDivFontSize ($param1)
	End if

Function DividerFontStyle($param1 : Text) -> $result : Text
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider font style
	
	  // $1 : (text) (optional) style
	  // $0 : (text) (return) current font style
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetDivFontStyle 
	Else 
		AJUI_BC_GetSetDivFontStyle ($param1)
	End if

Function DividerMargin($param1 : Integer) -> $result : Integer
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider margin
	
	  // $1 : (longint) (optional) margin
	  // $0 : (longint) (return) current divider margin
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetDivMargin 
	Else 
		AJUI_BC_GetSetDivMargin ($param1)
	End if

Function IsFirstSectionWithArrow($param1 : Boolean) -> $result : Boolean
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter to draw/remove the first section arrow (model: arrow)
	
	  // $1 : (boolean) (optional) true/false
	  // $0 : (boolean) (return) firstSectionWithArrow activate/inactivate
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetFirstSectWithArro 
	Else 
		AJUI_BC_GetSetFirstSectWithArro ($param1)
	End if

Function IsLastSectionWithArrow($param1 : Boolean) -> $result : Boolean
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter to draw/remove the last section arrow (model: arrow)
	
	  // $1 : (boolean) (optional) true/false
	  // $0 : (boolean) (return) lastSectionWithArrow activate/inactivate
	
	
	If (Count parameters=0)
		$result:=AJUI_BC_GetSetLastSectWithArrow 
	Else 
		AJUI_BC_GetSetLastSectWithArrow ($param1)
	End if

Function AddSection($param1 : Text; $param2 : Object)
	  // ----------------------
	  // Section List
	  // ----------------------
	  // This method will add a new section in the instance. You can fix the properties with the prebuild section
	  // Each property not specified will receive the default value
	
	  // $1 : (text) section id
	  // $2 : (object) (optional) section prebuilded
	
	
	If (Count parameters=2)
		AJUI_BC_addSection ($param1;$param2)
	Else 
		AJUI_BC_addSection ($param1)
	End if

Function GetNextPosition -> $result : Integer
	  // ----------------------
	  // Section List
	  // ----------------------
	  // Check the bigger position and return this value and add one to it
	
	  // $0 : (longint) (return) next position
	
	
	$result:=AJUI_BC_checkNextPosition

Function RemoveAllSections
	  // ----------------------
	  // Section List
	  // ----------------------
	  // This method removes all the sections
	
	AJUI_BC_removeAllSections

Function RemoveSection($param1 : Text)
	  // ----------------------
	  // Section List
	  // ----------------------
	  // This methode remove the section related to the id from the section list
	
	  // $1 : (text) id
	
	
	AJUI_BC_removeSection ($param1)

Function SetCurrentSection($param1 : Text)
	  // ----------------------
	  // Section List
	  // ----------------------
	  // This method will will assign the type to the section related to the id and remove the other section with the current type
	
	  // $1 : (text) id
	
	
	AJUI_BC_setCurrentSection ($param1)

Function UpdateSection($param1 : Text; $param2 : Object) -> $result : Object
	  // ----------------------
	  // Section List
	  // ----------------------
	  // Getter and setter to modify an section object
	
	  // $1 : (text) section id
	  // $2 : (object) (optional) object with properties to update
	  // $0 : (object) (return) section object with current value
	
	
	If (Count parameters=2)
		AJUI_BC_updateSection ($param1;$param2)
	Else 
		$result:=AJUI_BC_updateSection ($param1)
	End if

Function PictureOpacity($param1 : Text; $param2 : Integer) -> $result : Integer
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the background color of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (longint) (optional) opacity
	  // $0 : (longint) (return) current picture opacity
	
	
	If (Count parameters=2)
		AJUI_BC_GetSetPictureOpacity ($param1;$param2)
	Else 
		$result:=AJUI_BC_GetSetPictureOpacity ($param1)
	End if

Function ReplacingColor($param1 : Text; $param2 : Text) -> $result : Text
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the replacing color into a SVG picture
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) color
	  // $0 : (text) (return) current replacing color
	
	
	If (Count parameters=2)
		AJUI_BC_GetSetReplacingColor ($param1;$param2)
	Else 
		$result:=AJUI_BC_GetSetReplacingColor ($param1)
	End if

Function SectionBgColor($param1 : Text; $param2 : Text) -> $result : Text
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the background color of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) color
	  // $0 : (text) (return) current section bg color
	
	
	If (Count parameters=2)
		AJUI_BC_GetSetSectionBgColor ($param1;$param2)
	Else 
		$result:=AJUI_BC_GetSetSectionBgColor ($param1)
	End if

Function SectionBorderColor($param1 : Text; $param2 : Text) -> $result : Text
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the section border color
	
	  // $1 : (text) constant
	  // $2 : (text) (optional) color
	  // $0 : (text) (return) current section border color
	
	
	If (Count parameters=2)
		AJUI_BC_GetSetSectBorderColor ($param1;$param2)
	Else 
		$result:=AJUI_BC_GetSetSectBorderColor ($param1)
	End if

Function SectionBorderSize($param1 : Text; $param2 : Integer) -> $result : Integer
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the section border size
	
	  // $1 : (text) constant
	  // $2 : (longint) (optional) size
	  // $0 : (longint) (return) current section border size
	
	
	If (Count parameters=2)
		AJUI_BC_GetSetSectionBorderSize ($param1;$param2)
	Else 
		$result:=AJUI_BC_GetSetSectionBorderSize ($param1)
	End if

Function SectionFontColor($param1 : Text; $param2 : Text) -> $result : Text
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the font color of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) color
	  // $0 : (text) (return) current section font color
	
	
	If (Count parameters=2)
		AJUI_BC_GetSetSectionFontColor ($param1;$param2)
	Else 
		$result:=AJUI_BC_GetSetSectionFontColor ($param1)
	End if

Function SectionFontName($param1 : Text; $param2 : Text) -> $result : Text
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the font name of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) font name
	  // $0 : (text) (return) current section font name
	
	
	If (Count parameters=2)
		AJUI_BC_GetSetSectionFontName ($param1;$param2)
	Else 
		$result:=AJUI_BC_GetSetSectionFontName ($param1)
	End if

Function SectionFontSize($param1 : Text; $param2 : Integer) -> $result : Integer
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the font size of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) size
	  // $0 : (text) (return) current section font size
	
	
	If (Count parameters=2)
		AJUI_BC_GetSetSectionFontSize ($param1;$param2)
	Else 
		$result:=AJUI_BC_GetSetSectionFontSize ($param1)
	End if

Function SectionFontStyle($param1 : Text; $param2 : Text) -> $result : Text
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the font style of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) style
	  // $0 : (text) (return) current section font style
	
	
	If (Count parameters=2)
		AJUI_BC_GetSetSectionFontStyle ($param1;$param2)
	Else 
		$result:=AJUI_BC_GetSetSectionFontStyle ($param1)
	End if
