//%attributes = {"invisible":true}
  // AJUI_BC_mergeStates ( $instance_obj  ; $state ; $sectionType ) -> return
  //
  // $1 : (object) section types object
  // $2 : (text) state
  // $3 : (text) section type
  // $0 : (object) (return) merged object
  //
  // This method will merge the properties to use for the draw SVG based on the exceptions

#DECLARE($param1 : Object; $param2 : Text; $param3 : Text) -> $result : Object

var $merged_obj : Object
var $state; $sectionType : Text
var $instance_obj : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 12.09.19, 14:12:58
	  // ----------------------------------------------------
	  // Method: AJUI_BC_mergeStates
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$instance_obj:=$param1
$state:=$param2
$sectionType:=$param3

$merged_obj:=OB Copy($instance_obj.standard.default)

If ($state="default") & ($sectionType="standard")
	  //nothing to do
Else 
	  //bg color
	If ($instance_obj[$sectionType][$state].bgColor#Null)
		$merged_obj.bgColor:=$instance_obj[$sectionType][$state].bgColor
	Else 
		If ($instance_obj[$sectionType].default.bgColor#Null)
			$merged_obj.bgColor:=$instance_obj[$sectionType].default.bgColor
		Else 
			If ($instance_obj.standard[$state].bgColor#Null)
				$merged_obj.bgColor:=$instance_obj.standard[$state].bgColor
			End if 
		End if 
	End if 
	  //font color
	If ($instance_obj[$sectionType][$state].fontColor#Null)
		$merged_obj.fontColor:=$instance_obj[$sectionType][$state].fontColor
	Else 
		If ($instance_obj[$sectionType].default.fontColor#Null)
			$merged_obj.fontColor:=$instance_obj[$sectionType].default.fontColor
		Else 
			If ($instance_obj.standard[$state].fontColor#Null)
				$merged_obj.fontColor:=$instance_obj.standard[$state].fontColor
			End if 
		End if 
	End if 
	  //font size
	If ($instance_obj[$sectionType][$state].fontSize#Null)
		$merged_obj.fontSize:=$instance_obj[$sectionType][$state].fontSize
	Else 
		If ($instance_obj[$sectionType].default.fontSize#Null)
			$merged_obj.fontSize:=$instance_obj[$sectionType].default.fontSize
		Else 
			If ($instance_obj.standard[$state].fontSize#Null)
				$merged_obj.fontSize:=$instance_obj.standard[$state].fontSize
			End if 
		End if 
	End if 
	  //font name
	If ($instance_obj[$sectionType][$state].fontName#Null)
		$merged_obj.fontName:=$instance_obj[$sectionType][$state].fontName
	Else 
		If ($instance_obj[$sectionType].default.fontName#Null)
			$merged_obj.fontName:=$instance_obj[$sectionType].default.fontName
		Else 
			If ($instance_obj.standard[$state].fontName#Null)
				$merged_obj.fontName:=$instance_obj.standard[$state].fontName
			End if 
		End if 
	End if 
	  //font style
	If ($instance_obj[$sectionType][$state].fontStyle#Null)
		$merged_obj.fontStyle:=$instance_obj[$sectionType][$state].fontStyle
	Else 
		If ($instance_obj[$sectionType].default.fontStyle#Null)
			$merged_obj.fontStyle:=$instance_obj[$sectionType].default.fontStyle
		Else 
			If ($instance_obj.standard[$state].fontStyle#Null)
				$merged_obj.fontStyle:=$instance_obj.standard[$state].fontStyle
			End if 
		End if 
	End if 
	  //color to replace
	If ($instance_obj[$sectionType][$state].colorToReplace#Null)
		$merged_obj.colorToReplace:=$instance_obj[$sectionType][$state].colorToReplace
	Else 
		If ($instance_obj[$sectionType].default.colorToReplace#Null)
			$merged_obj.colorToReplace:=$instance_obj[$sectionType].default.colorToReplace
		Else 
			If ($instance_obj.standard[$state].colorToReplace#Null)
				$merged_obj.colorToReplace:=$instance_obj.standard[$state].colorToReplace
			End if 
		End if 
	End if 
	  //replacing color
	If ($instance_obj[$sectionType][$state].replacingColor#Null)
		$merged_obj.replacingColor:=$instance_obj[$sectionType][$state].replacingColor
	Else 
		If ($instance_obj[$sectionType].default.replacingColor#Null)
			$merged_obj.replacingColor:=$instance_obj[$sectionType].default.replacingColor
		Else 
			If ($instance_obj.standard[$state].replacingColor#Null)
				$merged_obj.replacingColor:=$instance_obj.standard[$state].replacingColor
			End if 
		End if 
	End if 
	  //border size
	If ($instance_obj[$sectionType][$state].borderSize#Null)
		$merged_obj.borderSize:=$instance_obj[$sectionType][$state].borderSize
	Else 
		If ($instance_obj[$sectionType].default.borderSize#Null)
			$merged_obj.borderSize:=$instance_obj[$sectionType].default.borderSize
		Else 
			If ($instance_obj.standard[$state].borderSize#Null)
				$merged_obj.borderSize:=$instance_obj.standard[$state].borderSize
			End if 
		End if 
	End if 
	  //border color
	If ($instance_obj[$sectionType][$state].borderColor#Null)
		$merged_obj.borderColor:=$instance_obj[$sectionType][$state].borderColor
	Else 
		If ($instance_obj[$sectionType].default.borderColor#Null)
			$merged_obj.borderColor:=$instance_obj[$sectionType].default.borderColor
		Else 
			If ($instance_obj.standard[$state].borderColor#Null)
				$merged_obj.borderColor:=$instance_obj.standard[$state].borderColor
			End if 
		End if 
	End if 
	  //picture opacity
	If ($instance_obj[$sectionType][$state].pictureOpacity#Null)
		$merged_obj.pictureOpacity:=$instance_obj[$sectionType][$state].pictureOpacity
	Else 
		If ($instance_obj[$sectionType].default.pictureOpacity#Null)
			$merged_obj.pictureOpacity:=$instance_obj[$sectionType].default.pictureOpacity
		Else 
			If ($instance_obj.standard[$state].pictureOpacity#Null)
				$merged_obj.pictureOpacity:=$instance_obj.standard[$state].pictureOpacity
			End if 
		End if 
	End if 
End if 

$result:=$merged_obj
