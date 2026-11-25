//%attributes = {"invisible":true}
  // AJUI_BC_addSection ( $id { ; $section } ) -> return
  //
  // $1 : (text) section id
  // $2 : (object) (optional) section prebuilded
  //
  // This method will add a new section in the instance. You can fix the properties with the prebuild section
  // Each property not specified will receive the default value


#DECLARE($param1 : Text; $param2 : Object)

var $id : Text
var $section_obj : Object
var $pos : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 12.09.19, 09:09:19
	  // ----------------------------------------------------
	  // Method: AJUI_BC_addSection
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$id:=$param1


  //id mandatory 
If ($id#"")
	$pos:=This.breadCrumb.sectionList.extract("id").indexOf($id)
	  //id unique
	If ($pos=-1)
		If (Count parameters=2)
			$section_obj:=$param2
			  //for each parameter check null value
			  //if not null, check if the value is from the correct type
			
			  //type
			If ($section_obj.type=Null)
				$section_obj.type:="standard"
			Else 
				If (Value type($section_obj.type)#Is text)
					$section_obj.type:="standard"
					ALERT("String required for the property type !")
				End if 
			End if 
			
			  //position
			If ($section_obj.position=Null)
				If (This.breadCrumb.sectionList.count()=0)
					$section_obj.position:=1
				Else 
					$section_obj.position:=This.breadCrumb.sectionList.max("position")+1
				End if 
			Else 
				If (Value type($section_obj.position)=Is real) | (Value type($section_obj.position)=Is longint)
					  //do nothing
				Else 
					If (This.breadCrumb.sectionList.count()=0)
						$section_obj.position:=1
					Else 
						$section_obj.position:=This.breadCrumb.sectionList.max("position")+1
					End if 
					ALERT("Longint required for the property position !")
				End if 
			End if 
			
			  //disable
			If ($section_obj.disable=Null)
				$section_obj.disable:=False
			Else 
				If (Value type($section_obj.disable)#Is boolean)
					$section_obj.disable:=False
					ALERT("Boolean required for the property disable !")
				End if 
			End if 
			
			  //label
			If ($section_obj.label=Null)
				$section_obj.label:="section "+String($section_obj.position)
			Else 
				If (Value type($section_obj.label)#Is text)
					$section_obj.label:="section "+String($section_obj.position)
					ALERT("String required for the property label !")
				End if 
			End if 
			
			  //picturePath
			If ($section_obj.picturePath=Null)
				$section_obj.picturePath:=""
			Else 
				If (Value type($section_obj.picturePath)#Is text)
					$section_obj.picturePath:=""
					ALERT("String required for the property picturePath !")
				End if 
			End if 
			
			  //picturePosition
			If ($section_obj.picturePosition=Null)
				$section_obj.picturePosition:="left"
			Else 
				If (Value type($section_obj.picturePosition)#Is text)
					$section_obj.picturePosition:="left"
					ALERT("Use left or right for the property picturePosition !")
				End if 
			End if 
			
			  //pictureMargin
			If ($section_obj.pictureMargin=Null)
				$section_obj.pictureMargin:=10
			Else 
				If (Value type($section_obj.pictureMargin)=Is real) | (Value type($section_obj.pictureMargin)=Is longint)
					  //do nothing
				Else 
					$section_obj.pictureMargin:=10
					ALERT("Longint required for the property pictureMargin !")
				End if 
			End if 
			
			  //pictureHeight
			If ($section_obj.pictureHeight=Null)
				$section_obj.pictureHeight:="40%"
			Else 
				If (Value type($section_obj.pictureHeight)#Is text)
					$section_obj.pictureHeight:=""
					ALERT("Stringify a value with px or % for the property pictureHeight !")
				End if 
			End if 
			
			  //colorToReplace
			If ($section_obj.colorToReplace=Null)
				$section_obj.colorToReplace:=""
			Else 
				If (Value type($section_obj.colorToReplace)#Is text)
					$section_obj.colorToReplace:=""
					ALERT("String required for the property colorToReplace !")
				End if 
			End if 
			
			  //onClickCB
			Case of 
				: (Value type($section_obj.onClickCB)=Is text)
					If ($section_obj.onClickCB#"")
						ARRAY TEXT($_methods;0)
						METHOD GET NAMES($_methods;$section_obj.onClickCB;*)
						If (Size of array($_methods)=0)
							  //ask to create the callback
							CONFIRM("Callback method for OnClick not found, Do you want to create it ?";"Yes";"No")
							If (OK=1)
								METHOD SET CODE($section_obj.onClickCB;"#DECLARE($param1 : Object)";*)
							End if 
						End if 
					End if 
				: (Value type($section_obj.onClickCB)=Is object)
					  //nothing to do
				: ($section_obj.onClickCB=Null)
					$section_obj.onClickCB:=""
				Else 
					$section_obj.onClickCB:=""
					ALERT("String or formula required for the property onClickCB !")
			End case 
			
			
			
			  //onClickCBParams
			If ($section_obj.onClickCBParams#Null)
				If (Value type($section_obj.onClickCBParams)#Is object)
					ALERT("Object required for the property onClickCBParams !")
					OB REMOVE($section_obj;"onClickCBParams")
				End if 
			End if 
			
			  //onDoubleClickCB
			Case of 
				: (Value type($section_obj.onDoubleClickCB)=Is text)
					If ($section_obj.onDoubleClickCB#"")
						ARRAY TEXT($_methods;0)
						METHOD GET NAMES($_methods;$section_obj.onDoubleClickCB;*)
						If (Size of array($_methods)=0)
							  //ask to create the callback
							CONFIRM("Callback method for OnDoubleClick not found, Do you want to create it ?";"Yes";"No")
							If (OK=1)
								METHOD SET CODE($section_obj.onClickCB;"#DECLARE($param1 : Object)";*)
							End if 
						End if 
					End if 
				: (Value type($section_obj.onDoubleClickCB)=Is object)
					  //nothing to do
				: ($section_obj.onDoubleClickCB=Null)
					$section_obj.onDoubleClickCB:=""
				Else 
					$section_obj.onDoubleClickCB:=""
					ALERT("String or formula required for the property onDoubleClickCB !")
			End case 
			
			
			  //onDoubleClickCBParams
			If ($section_obj.onDoubleClickCBParams#Null)
				If (Value type($section_obj.onDoubleClickCBParams)#Is object)
					ALERT("Object required for the property onDoubleClickCBParams !")
					OB REMOVE($section_obj;"onDoubleClickCBParams")
				End if 
			End if 
			
			
			$section_obj.currentState:=New object
			
		Else 
			  //default section
			$section_obj:=New object
			
			$section_obj.type:="standard"
			If (This.breadCrumb.sectionList.count()=0)
				$section_obj.position:=1
			Else 
				$section_obj.position:=This.breadCrumb.sectionList.max("position")+1
			End if 
			$section_obj.disable:=False
			$section_obj.label:="section "+String($section_obj.position)
			$section_obj.picturePath:=""
			$section_obj.picturePosition:="left"
			$section_obj.pictureMargin:=10
			$section_obj.pictureHeight:="40%"
			$section_obj.colorToReplace:=""
			$section_obj.onClickCB:=""
			$section_obj.onDoubleClickCB:=""
			$section_obj.currentState:=New object
		End if 
		
		$section_obj.id:=$id
		This.breadCrumb.sectionList.push(OB Copy($section_obj))
		This.breadCrumb.sectionList:=This.breadCrumb.sectionList.orderBy("position asc")
	Else 
		ALERT("This ID already exists !")
	End if 
Else 
	ALERT("Assign an ID !")
End if 
