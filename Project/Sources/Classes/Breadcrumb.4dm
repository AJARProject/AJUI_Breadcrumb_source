Class constructor
	
	C_OBJECT:C1216($1;$template_obj)
	
	If (Count parameters:C259=1)
		If ($1.templatePath=Null:C1517)
			$template_obj:=AJUI_BC_templateImport ($1.templateName)
		Else 
			$template_obj:=AJUI_BC_templateImport ($1.templateName;$1.templatePath)
		End if 
		
		If (This:C1470.failImport)
			$template_obj:=New object:C1471()
		Else 
			This:C1470.breadCrumb:=$template_obj.breadCrumb
		End if 
	End if 
	
	AJUI_BC_initProperties (This:C1470)
	
Function Draw
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method will handle the state, calculation of the size of each sections, launching the draw and the callback,...
	
	AJUI_BC_draw 
	
Function Export
	  // ----------------------
	  // Function
	  // ----------------------
	  // Method to export the AJUI BreadCrumb instance into a json file
	
	  // $1 : (text) AJUI BreadCrumb template name
	  // $2 : (text) (optional) Path to export
	
	C_TEXT:C284($1;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_templateExport ($1;$2)
	Else 
		AJUI_BC_templateExport ($1)
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
	
Function RemovePropertyException
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method remove an exception
	
	  // $1 : (text) formula name
	  // $2 : (text) type and state to target
	
	C_TEXT:C284($1;$2)
	
	AJUI_BC_removePropException ($1;$2)
	
Function RemovePropertyExceptions
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method remove each exception for a property
	
	  // $1 : (text) formula name
	
	C_TEXT:C284($1)
	
	AJUI_BC_removePropExceptions ($1)
	
Function RemovePropertyTypeExceptions
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method remove each exception for a property but only for a specific type
	
	  // $1 : (text) formula name
	  // $2 : (text) type name
	
	C_TEXT:C284($1;$2)
	
	AJUI_BC_removePropTypeException ($1;$2)
	
Function ResetAllStates
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method will reset all the states exceptions for each type of an instance
	
	AJUI_BC_resetAllStates 
	
Function ResetState
	  // ----------------------
	  // Function
	  // ----------------------
	  // This method will reset the exception of a state of a type of an instance
	
	  // $1 : (text) constant
	
	C_TEXT:C284($1)
	
	AJUI_BC_resetState ($1)
	
Function Show
	  // ----------------------
	  // Function
	  // ----------------------
	  // Wrapper for the object set visible (true)
	
	AJUI_BC_show 
	
Function MaxSectionToDraw
	  // ----------------------
	  // Global
	  // ----------------------
	  // Getter and setter to draw the box size dynamically base on the sections do draw
	
	  // $1 : (longint) (optional) number max of section to draw
	  // $0 : (longint) (return) current max section
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetMaxSectionToDraw 
	Else 
		AJUI_BC_GetSetMaxSectionToDraw ($1)
	End if 
	
Function Model
	  // ----------------------
	  // Global
	  // ----------------------
	  // Getter and setter for the breadcrumb model to use
	
	  // $1 : (text) (optional) model name
	  // $0 : (text) (return) current model name
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetModel 
	Else 
		AJUI_BC_GetSetModel ($1)
	End if 
	
Function Name
	  // ----------------------
	  // Global
	  // ----------------------
	  // Getter and Setter for the form object name who will receive the breadcrumb
	
	  // $1 : (text) (optional) form object name
	  // $0 : (text) (return) current form object name
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetName 
	Else 
		AJUI_BC_GetSetName ($1)
	End if 
	
Function RTL
	  // ----------------------
	  // Global
	  // ----------------------
	  // Getter and setter to draw the section from the right to the left
	
	  // $1 : (boolean) (optional) draw section right to left
	  // $0 : (boolean) (return) rtl activate/inactivate
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetRTL 
	Else 
		AJUI_BC_GetSetRTL ($1)
	End if 
	
Function BgColor
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box background color
	
	  // $1 : (text) (optional) background color 
	  // $0 : (text) (return) current box background color
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetBgColor 
	Else 
		AJUI_BC_GetSetBgColor ($1)
	End if 
	
Function BorderColor
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box border color
	
	  // $1 : (text) (optional) border color 
	  // $0 : (text) (return) current box border color
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetBorderColor 
	Else 
		AJUI_BC_GetSetBorderColor ($1)
	End if 
	
Function BorderSize
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box border size
	
	  // $1 : (longint) (optional) border size 
	  // $0 : (longint) (return) current box border size
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetBorderSize 
	Else 
		AJUI_BC_GetSetBorderSize ($1)
	End if 
	
Function BoxHeight
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box height
	
	  // $1 : (longint) (optional) height 
	  // $0 : (longint) (return) current box height
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetBoxHeight 
	Else 
		AJUI_BC_GetSetBoxHeight ($1)
	End if 
	
Function BoxWidth
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the box width
	
	  // $1 : (longint) (optional) width 
	  // $0 : (longint) (return) current box width
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetBoxWidth 
	Else 
		AJUI_BC_GetSetBoxWidth ($1)
	End if 
	
Function CornerRadiusLeft
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the radius of the left corners of the box
	
	  // $1 : (longint) (optional) corner radius 
	  // $0 : (longint) (return) current radius for the left corners
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetCornerRadiusLeft 
	Else 
		AJUI_BC_GetSetCornerRadiusLeft ($1)
	End if 
	
Function CornerRadiusRight
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the radius of the right corners of the box
	
	  // $1 : (longint) (optional) corner radius 
	  // $0 : (longint) (return) current radius for the right corners
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetCornerRadiusRight 
	Else 
		AJUI_BC_GetSetCornerRadiusRight ($1)
	End if 
	
Function IsBoxCentered
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter to activate/inactivate the centering of the box
	
	  // $1 : (boolean) (optionnal) activate/inactivate
	  // $0 : (boolean) (return) current value
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetBoxCentered 
	Else 
		AJUI_BC_GetSetBoxCentered ($1)
	End if 
	
Function IsDynamicSize
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter to activate/inactivate the dynamic sizing of the Breadcrumb box
	
	  // $1 : (boolean) (optional) activate/inacivate
	  // $0 : (boolean) (return) dynamic size activated/inactivated
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetDynamicSize 
	Else 
		AJUI_BC_GetSetDynamicSize ($1)
	End if 
	
Function PaddingH
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the padding horizontal of the box
	
	  // $1 : (longint) (optional) padding
	  // $0 : (longint) (return) current horizontal padding
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetPaddingH 
	Else 
		AJUI_BC_GetSetPaddingH ($1)
	End if 
	
Function PaddingV
	  // ----------------------
	  // Box
	  // ----------------------
	  // Getter and setter for the padding vertical of the box
	
	  // $1 : (longint) (optional) padding
	  // $0 : (longint) (return) current vertical padding
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetPaddingV 
	Else 
		AJUI_BC_GetSetPaddingV ($1)
	End if 
	
Function ArrowBorderSize
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the border size of the arrow used as a divider. (model : arrow)
	
	  // $1 : (longint) (optional) size
	  // $0 : (longint) (return) current arrow border size
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetArrowBorderSize 
	Else 
		AJUI_BC_GetSetArrowBorderSize ($1)
	End if 
	
Function ArrowColor
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the color of the arrow used as a divider. (model : arrow)
	
	  // $1 : (text) (optional) color
	  // $0 : (text) (return) current arrow color
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetArrowColor 
	Else 
		AJUI_BC_GetSetArrowColor ($1)
	End if 
	
Function ArrowPaddingH
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the padding horizontal (only for model : arrow)
	
	  // $1 : (longint) (optional) padding
	  // $0 : (longint) (return) current divider padding horizontal
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetDividerPaddingH 
	Else 
		AJUI_BC_GetSetDividerPaddingH ($1)
	End if 
	
Function ArrowWidth
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the width of the arrow used as a divider. (model : arrow). Specify px or % after the number (examples 50px/10%)
	  // percent is based on the text area width
	
	  // $1 : (text) (optional) width with px or %
	  // $0 : (text) (return) current arrow width
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetArrowWidth 
	Else 
		AJUI_BC_GetSetArrowWidth ($1)
	End if 
	
Function Divider
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the string to use as a divider
	
	  // $1 : (text) (optional) divider
	  // $0 : (text) (return) current divider
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetDivString 
	Else 
		AJUI_BC_GetSetDivString ($1)
	End if 
	
Function DividerFontColor
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider font color
	
	  // $1 : (text) (optional) color
	  // $0 : (text) (return) current font color
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetDivFontColor 
	Else 
		AJUI_BC_GetSetDivFontColor ($1)
	End if 
	
Function DividerFontName
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider font name
	
	  // $1 : (text) (optional) color
	  // $0 : (text) (return) current font name
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetDivFontName 
	Else 
		AJUI_BC_GetSetDivFontName ($1)
	End if 
	
Function DividerFontSize
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider font size
	
	  // $1 : (longint) (optional) size
	  // $0 : (longint) (return) current font size
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetDivFontSize 
	Else 
		AJUI_BC_GetSetDivFontSize ($1)
	End if 
	
Function DividerFontStyle
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider font style
	
	  // $1 : (text) (optional) style
	  // $0 : (text) (return) current font style
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetDivFontStyle 
	Else 
		AJUI_BC_GetSetDivFontStyle ($1)
	End if 
	
Function DividerMargin
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter for the divider margin
	
	  // $1 : (longint) (optional) margin
	  // $0 : (longint) (return) current divider margin
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetDivMargin 
	Else 
		AJUI_BC_GetSetDivMargin ($1)
	End if 
	
Function IsFirstSectionWithArrow
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter to draw/remove the first section arrow (model: arrow)
	
	  // $1 : (boolean) (optional) true/false
	  // $0 : (boolean) (return) firstSectionWithArrow activate/inactivate
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetFirstSectWithArro 
	Else 
		AJUI_BC_GetSetFirstSectWithArro ($1)
	End if 
	
Function IsLastSectionWithArrow
	  // ----------------------
	  // Divider
	  // ----------------------
	  // Getter and setter to draw/remove the last section arrow (model: arrow)
	
	  // $1 : (boolean) (optional) true/false
	  // $0 : (boolean) (return) lastSectionWithArrow activate/inactivate
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_BC_GetSetLastSectWithArrow 
	Else 
		AJUI_BC_GetSetLastSectWithArrow ($1)
	End if 
	
Function AddSection
	  // ----------------------
	  // Section List
	  // ----------------------
	  // This method will add a new section in the instance. You can fix the properties with the prebuild section
	  // Each property not specified will receive the default value
	
	  // $1 : (text) section id
	  // $2 : (object) (optional) section prebuilded
	
	C_TEXT:C284($1)
	C_OBJECT:C1216($2)
	
	If (Count parameters:C259=2)
		AJUI_BC_addSection ($1;$2)
	Else 
		AJUI_BC_addSection ($1)
	End if 
	
Function GetNextPosition
	  // ----------------------
	  // Section List
	  // ----------------------
	  // Check the bigger position and return this value and add one to it
	
	  // $0 : (longint) (return) next position
	
	C_LONGINT:C283($0)
	
	$0:=AJUI_BC_checkNextPosition 
	
Function RemoveAllSections
	  // ----------------------
	  // Section List
	  // ----------------------
	  // This method removes all the sections
	
	AJUI_BC_removeAllSections 
	
Function RemoveSection
	  // ----------------------
	  // Section List
	  // ----------------------
	  // This methode remove the section related to the id from the section list
	
	  // $1 : (text) id
	
	C_TEXT:C284($1)
	
	AJUI_BC_removeSection ($1)
	
Function SetCurrentSection
	  // ----------------------
	  // Section List
	  // ----------------------
	  // This method will will assign the type to the section related to the id and remove the other section with the current type
	
	  // $1 : (text) id
	
	C_TEXT:C284($1)
	
	AJUI_BC_setCurrentSection ($1)
	
Function UpdateSection
	  // ----------------------
	  // Section List
	  // ----------------------
	  // Getter and setter to modify an section object
	
	  // $1 : (text) section id
	  // $2 : (object) (optional) object with properties to update
	  // $0 : (object) (return) section object with current value
	
	C_TEXT:C284($1)
	C_OBJECT:C1216($0;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_updateSection ($1;$2)
	Else 
		$0:=AJUI_BC_updateSection ($1)
	End if 
	
Function PictureOpacity
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the background color of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (longint) (optional) opacity
	  // $0 : (longint) (return) current picture opacity
	
	C_TEXT:C284($1)
	C_LONGINT:C283($0;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_GetSetPictureOpacity ($1;$2)
	Else 
		$0:=AJUI_BC_GetSetPictureOpacity ($1)
	End if 
	
Function ReplacingColor
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the replacing color into a SVG picture
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) color
	  // $0 : (text) (return) current replacing color
	
	C_TEXT:C284($0;$1;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_GetSetReplacingColor ($1;$2)
	Else 
		$0:=AJUI_BC_GetSetReplacingColor ($1)
	End if 
	
Function SectionBgColor
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the background color of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) color
	  // $0 : (text) (return) current section bg color
	
	C_TEXT:C284($0;$1;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_GetSetSectionBgColor ($1;$2)
	Else 
		$0:=AJUI_BC_GetSetSectionBgColor ($1)
	End if 
	
Function SectionBorderColor
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the section border color
	
	  // $1 : (text) constant
	  // $2 : (text) (optional) color
	  // $0 : (text) (return) current section border color
	
	C_TEXT:C284($0;$1;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_GetSetSectBorderColor ($1;$2)
	Else 
		$0:=AJUI_BC_GetSetSectBorderColor ($1)
	End if 
	
Function SectionBorderSize
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the section border size
	
	  // $1 : (text) constant
	  // $2 : (longint) (optional) size
	  // $0 : (longint) (return) current section border size
	
	C_TEXT:C284($1)
	C_LONGINT:C283($0;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_GetSetSectionBorderSize ($1;$2)
	Else 
		$0:=AJUI_BC_GetSetSectionBorderSize ($1)
	End if 
	
Function SectionFontColor
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the font color of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) color
	  // $0 : (text) (return) current section font color
	
	C_TEXT:C284($0;$1;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_GetSetSectionFontColor ($1;$2)
	Else 
		$0:=AJUI_BC_GetSetSectionFontColor ($1)
	End if 
	
Function SectionFontName
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the font name of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) font name
	  // $0 : (text) (return) current section font name
	
	C_TEXT:C284($0;$1;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_GetSetSectionFontName ($1;$2)
	Else 
		$0:=AJUI_BC_GetSetSectionFontName ($1)
	End if 
	
Function SectionFontSize
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the font size of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) size
	  // $0 : (text) (return) current section font size
	
	C_TEXT:C284($1)
	C_LONGINT:C283($0;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_GetSetSectionFontSize ($1;$2)
	Else 
		$0:=AJUI_BC_GetSetSectionFontSize ($1)
	End if 
	
Function SectionFontStyle
	  // ----------------------
	  // Section Types
	  // ----------------------
	  // Getter and setter for the font style of an section
	
	  // $1 : (text) type and state constant
	  // $2 : (text) (optional) style
	  // $0 : (text) (return) current section font style
	
	C_TEXT:C284($0;$1;$2)
	
	If (Count parameters:C259=2)
		AJUI_BC_GetSetSectionFontStyle ($1;$2)
	Else 
		$0:=AJUI_BC_GetSetSectionFontStyle ($1)
	End if 