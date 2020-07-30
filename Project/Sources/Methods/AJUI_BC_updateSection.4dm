//%attributes = {"invisible":true}
  // AJUI_BC_updateSection ( $id { ; $section_obj } ) -> return
  //
  // $1 : (text) section id
  // $2 : (object) (optional) object with properties to update
  // $0 : (object) (return) section object with current value
  //
  // Getter and setter to modify an section object

If (False:C215)
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


C_TEXT:C284($1;$id)
C_OBJECT:C1216($0;$2;$section_obj)
C_LONGINT:C283($pos)


$id:=$1

$pos:=This:C1470.breadCrumb.sectionList.extract("id").indexOf($id)
If ($pos>=0)
	If (Count parameters:C259=1)
		$0:=This:C1470.breadCrumb.sectionList[$pos]  //Getter
	Else 
		$section_obj:=$2
		
		  //id
		If ($section_obj.id#Null:C1517)
			If (Value type:C1509($section_obj.id)#Is text:K8:3)
				ALERT:C41("String required for the property id !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].id:=$section_obj.id
			End if 
		End if 
		
		  //type
		If ($section_obj.type#Null:C1517)
			If (Value type:C1509($section_obj.type)#Is text:K8:3)
				ALERT:C41("String required for the property type !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].type:=$section_obj.type
			End if 
		End if 
		
		  //position
		If ($section_obj.position#Null:C1517)
			If (Value type:C1509($section_obj.position)=Is real:K8:4) | (Value type:C1509($section_obj.position)=Is longint:K8:6)
				This:C1470.breadCrumb.sectionList[$pos].position:=$section_obj.position
			Else 
				ALERT:C41("Longint required for the property position !")
				
			End if 
		End if 
		
		  //disable
		If ($section_obj.disable#Null:C1517)
			If (Value type:C1509($section_obj.disable)#Is boolean:K8:9)
				ALERT:C41("Boolean required for the property disable !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].disable:=$section_obj.disable
			End if 
		End if 
		
		  //label
		If ($section_obj.label#Null:C1517)
			If (Value type:C1509($section_obj.label)#Is text:K8:3)
				ALERT:C41("String required for the property label !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].label:=$section_obj.label
			End if 
		End if 
		
		  //picturePath
		If ($section_obj.picturePath#Null:C1517)
			If (Value type:C1509($section_obj.picturePath)#Is text:K8:3)
				ALERT:C41("String required for the property picturePath !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].picturePath:=$section_obj.picturePath
			End if 
		End if 
		
		  //picturePosition
		If ($section_obj.picturePosition#Null:C1517)
			If (Value type:C1509($section_obj.picturePosition)#Is text:K8:3)
				ALERT:C41("Use left or right for the property picturePosition !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].picturePosition:=$section_obj.picturePosition
			End if 
		End if 
		
		  //pictureMargin
		If ($section_obj.pictureMargin#Null:C1517)
			If (Value type:C1509($section_obj.pictureMargin)=Is real:K8:4) | (Value type:C1509($section_obj.pictureMargin)=Is longint:K8:6)
				This:C1470.breadCrumb.sectionList[$pos].pictureMargin:=$section_obj.pictureMargin
			Else 
				ALERT:C41("Longint required for the property pictureMargin !")
			End if 
		End if 
		
		  //pictureHeight
		If ($section_obj.pictureHeight#Null:C1517)
			If (Value type:C1509($section_obj.pictureHeight)#Is text:K8:3)
				ALERT:C41("Stringify a value with px or % for the property pictureHeight !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].pictureHeight:=$section_obj.pictureHeight
			End if 
		End if 
		
		  //colorToReplace
		If ($section_obj.colorToReplace#Null:C1517)
			If (Value type:C1509($section_obj.colorToReplace)#Is text:K8:3)
				ALERT:C41("String required for the property colorToReplace !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].colorToReplace:=$section_obj.colorToReplace
			End if 
		End if 
		
		  //onClickCB
		Case of 
			: (Value type:C1509($section_obj.onClickCB)=Is text:K8:3)
				This:C1470.breadCrumb.sectionList[$pos].onClickCB:=$section_obj.onClickCB
				If ($section_obj.onClickCB#"")
					ARRAY TEXT:C222($_methods;0)
					METHOD GET NAMES:C1166($_methods;$section_obj.onClickCB;*)
					If (Size of array:C274($_methods)=0)
						  //ask to create the callback if not exist
						CONFIRM:C162("Callback method for OnClick not found, Do you want to create it ?";"Yes";"No")
						If (OK=1)
							METHOD SET CODE:C1194($section_obj.onClickCB;"C_OBJECT($1)";*)
						End if 
					End if 
				End if 
			: (Value type:C1509($section_obj.onClickCB)=Is object:K8:27)
				This:C1470.breadCrumb.sectionList[$pos].onClickCB:=$section_obj.onClickCB
			: ($section_obj.onClickCB=Null:C1517)
				  //nothing to do
			Else 
				ALERT:C41("String or formula required for the property onClickCB !")
		End case 
		
		
		  //onClickCBParams
		If ($section_obj.onClickCBParams#Null:C1517)
			If (Value type:C1509($section_obj.onClickCBParams)#Is object:K8:27)
				ALERT:C41("Object required for the property onClickCBParams !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].onClickCBParams:=$section_obj.onClickCBParams
			End if 
		End if 
		
		  //onDoubleClickCB
		
		Case of 
			: (Value type:C1509($section_obj.onDoubleClickCB)=Is text:K8:3)
				This:C1470.breadCrumb.sectionList[$pos].onDoubleClickCB:=$section_obj.onDoubleClickCB
				If ($section_obj.onDoubleClickCB#"")
					ARRAY TEXT:C222($_methods;0)
					METHOD GET NAMES:C1166($_methods;$section_obj.onDoubleClickCB;*)
					If (Size of array:C274($_methods)=0)
						  //ask to create the callback if not exist
						CONFIRM:C162("Callback method for OnDoubleClick not found, Do you want to create it ?";"Yes";"No")
						If (OK=1)
							METHOD SET CODE:C1194($section_obj.onClickCB;"C_OBJECT($1)";*)
						End if 
					End if 
				End if 
			: (Value type:C1509($section_obj.onDoubleClickCB)=Is object:K8:27)
				This:C1470.breadCrumb.sectionList[$pos].onDoubleClickCB:=$section_obj.onDoubleClickCB
			: ($section_obj.onDoubleClickCB=Null:C1517)
				  //nothing to do
			Else 
				ALERT:C41("String or formula required for the property onDoubleClickCB !")
		End case 
		
		
		  //onDoubleClickCBParams
		If ($section_obj.onDoubleClickCBParams#Null:C1517)
			If (Value type:C1509($section_obj.onDoubleClickCBParams)#Is object:K8:27)
				ALERT:C41("Object required for the property onDoubleClickCBParams !")
			Else 
				This:C1470.breadCrumb.sectionList[$pos].onDoubleClickCBParams:=$section_obj.onDoubleClickCBParams
			End if 
		End if 
		
	End if 
	This:C1470.breadCrumb.sectionList:=This:C1470.breadCrumb.sectionList.orderBy("position asc")
End if 


