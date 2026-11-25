//%attributes = {"invisible":true}
  // AJUI_BC_updateSection ( $id { ; $section_obj } ) -> return
  //
  // $1 : (text) section id
  // $2 : (object) (optional) object with properties to update
  // $0 : (object) (return) section object with current value
  //
  // Getter and setter to modify an section object

#DECLARE($param1 : Text; $param2 : Object) -> $result : Object

var $id : Text
var $section_obj : Object
var $pos : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 12.09.19, 15:16:42
	  // ----------------------------------------------------
	  // Method: AJUI_BC_updateSection
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 




$id:=$param1

$pos:=This.breadCrumb.sectionList.extract("id").indexOf($id)
If ($pos>=0)
	If (Count parameters=1)
		$result:=This.breadCrumb.sectionList[$pos]  //Getter
	Else 
		$section_obj:=$param2
		
		  //id
		If ($section_obj.id#Null)
			If (Value type($section_obj.id)#Is text)
				ALERT("String required for the property id !")
			Else 
				This.breadCrumb.sectionList[$pos].id:=$section_obj.id
			End if 
		End if 
		
		  //type
		If ($section_obj.type#Null)
			If (Value type($section_obj.type)#Is text)
				ALERT("String required for the property type !")
			Else 
				This.breadCrumb.sectionList[$pos].type:=$section_obj.type
			End if 
		End if 
		
		  //position
		If ($section_obj.position#Null)
			If (Value type($section_obj.position)=Is real) | (Value type($section_obj.position)=Is longint)
				This.breadCrumb.sectionList[$pos].position:=$section_obj.position
			Else 
				ALERT("Longint required for the property position !")
				
			End if 
		End if 
		
		  //disable
		If ($section_obj.disable#Null)
			If (Value type($section_obj.disable)#Is boolean)
				ALERT("Boolean required for the property disable !")
			Else 
				This.breadCrumb.sectionList[$pos].disable:=$section_obj.disable
			End if 
		End if 
		
		  //label
		If ($section_obj.label#Null)
			If (Value type($section_obj.label)#Is text)
				ALERT("String required for the property label !")
			Else 
				This.breadCrumb.sectionList[$pos].label:=$section_obj.label
			End if 
		End if 
		
		  //picturePath
		If ($section_obj.picturePath#Null)
			If (Value type($section_obj.picturePath)#Is text)
				ALERT("String required for the property picturePath !")
			Else 
				This.breadCrumb.sectionList[$pos].picturePath:=$section_obj.picturePath
			End if 
		End if 
		
		  //picturePosition
		If ($section_obj.picturePosition#Null)
			If (Value type($section_obj.picturePosition)#Is text)
				ALERT("Use left or right for the property picturePosition !")
			Else 
				This.breadCrumb.sectionList[$pos].picturePosition:=$section_obj.picturePosition
			End if 
		End if 
		
		  //pictureMargin
		If ($section_obj.pictureMargin#Null)
			If (Value type($section_obj.pictureMargin)=Is real) | (Value type($section_obj.pictureMargin)=Is longint)
				This.breadCrumb.sectionList[$pos].pictureMargin:=$section_obj.pictureMargin
			Else 
				ALERT("Longint required for the property pictureMargin !")
			End if 
		End if 
		
		  //pictureHeight
		If ($section_obj.pictureHeight#Null)
			If (Value type($section_obj.pictureHeight)#Is text)
				ALERT("Stringify a value with px or % for the property pictureHeight !")
			Else 
				This.breadCrumb.sectionList[$pos].pictureHeight:=$section_obj.pictureHeight
			End if 
		End if 
		
		  //colorToReplace
		If ($section_obj.colorToReplace#Null)
			If (Value type($section_obj.colorToReplace)#Is text)
				ALERT("String required for the property colorToReplace !")
			Else 
				This.breadCrumb.sectionList[$pos].colorToReplace:=$section_obj.colorToReplace
			End if 
		End if 
		
		  //onClickCB
		Case of 
			: (Value type($section_obj.onClickCB)=Is text)
				This.breadCrumb.sectionList[$pos].onClickCB:=$section_obj.onClickCB
				If ($section_obj.onClickCB#"")
					ARRAY TEXT($_methods;0)
					METHOD GET NAMES($_methods;$section_obj.onClickCB;*)
					If (Size of array($_methods)=0)
						  //ask to create the callback if not exist
						CONFIRM("Callback method for OnClick not found, Do you want to create it ?";"Yes";"No")
						If (OK=1)
							METHOD SET CODE($section_obj.onClickCB;"#DECLARE($param1 : Object)";*)
						End if 
					End if 
				End if 
			: (Value type($section_obj.onClickCB)=Is object)
				This.breadCrumb.sectionList[$pos].onClickCB:=$section_obj.onClickCB
			: ($section_obj.onClickCB=Null)
				  //nothing to do
			Else 
				ALERT("String or formula required for the property onClickCB !")
		End case 
		
		
		  //onClickCBParams
		If ($section_obj.onClickCBParams#Null)
			If (Value type($section_obj.onClickCBParams)#Is object)
				ALERT("Object required for the property onClickCBParams !")
			Else 
				This.breadCrumb.sectionList[$pos].onClickCBParams:=$section_obj.onClickCBParams
			End if 
		End if 
		
		  //onDoubleClickCB
		
		Case of 
			: (Value type($section_obj.onDoubleClickCB)=Is text)
				This.breadCrumb.sectionList[$pos].onDoubleClickCB:=$section_obj.onDoubleClickCB
				If ($section_obj.onDoubleClickCB#"")
					ARRAY TEXT($_methods;0)
					METHOD GET NAMES($_methods;$section_obj.onDoubleClickCB;*)
					If (Size of array($_methods)=0)
						  //ask to create the callback if not exist
						CONFIRM("Callback method for OnDoubleClick not found, Do you want to create it ?";"Yes";"No")
						If (OK=1)
							METHOD SET CODE($section_obj.onClickCB;"#DECLARE($param1 : Object)";*)
						End if 
					End if 
				End if 
			: (Value type($section_obj.onDoubleClickCB)=Is object)
				This.breadCrumb.sectionList[$pos].onDoubleClickCB:=$section_obj.onDoubleClickCB
			: ($section_obj.onDoubleClickCB=Null)
				  //nothing to do
			Else 
				ALERT("String or formula required for the property onDoubleClickCB !")
		End case 
		
		
		  //onDoubleClickCBParams
		If ($section_obj.onDoubleClickCBParams#Null)
			If (Value type($section_obj.onDoubleClickCBParams)#Is object)
				ALERT("Object required for the property onDoubleClickCBParams !")
			Else 
				This.breadCrumb.sectionList[$pos].onDoubleClickCBParams:=$section_obj.onDoubleClickCBParams
			End if 
		End if 
		
	End if 
	This.breadCrumb.sectionList:=This.breadCrumb.sectionList.orderBy("position asc")
End if 


