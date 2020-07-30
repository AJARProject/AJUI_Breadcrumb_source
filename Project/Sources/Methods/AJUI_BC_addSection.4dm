//%attributes = {"invisible":true}
  // AJUI_BC_addSection ( $id { ; $section } ) -> return
  //
  // $1 : (text) section id
  // $2 : (object) (optional) section prebuilded
  //
  // This method will add a new section in the instance. You can fix the properties with the prebuild section
  // Each property not specified will receive the default value


If (False:C215)
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

C_TEXT:C284($1;$id)
C_OBJECT:C1216($2;$section_obj)

$id:=$1


  //id mandatory 
If ($id#"")
	$pos:=This:C1470.breadCrumb.sectionList.extract("id").indexOf($id)
	  //id unique
	If ($pos=-1)
		If (Count parameters:C259=2)
			$section_obj:=$2
			  //for each parameter check null value
			  //if not null, check if the value is from the correct type
			
			  //type
			If ($section_obj.type=Null:C1517)
				$section_obj.type:="standard"
			Else 
				If (Value type:C1509($section_obj.type)#Is text:K8:3)
					$section_obj.type:="standard"
					ALERT:C41("String required for the property type !")
				End if 
			End if 
			
			  //position
			If ($section_obj.position=Null:C1517)
				If (This:C1470.breadCrumb.sectionList.count()=0)
					$section_obj.position:=1
				Else 
					$section_obj.position:=This:C1470.breadCrumb.sectionList.max("position")+1
				End if 
			Else 
				If (Value type:C1509($section_obj.position)=Is real:K8:4) | (Value type:C1509($section_obj.position)=Is longint:K8:6)
					  //do nothing
				Else 
					If (This:C1470.breadCrumb.sectionList.count()=0)
						$section_obj.position:=1
					Else 
						$section_obj.position:=This:C1470.breadCrumb.sectionList.max("position")+1
					End if 
					ALERT:C41("Longint required for the property position !")
				End if 
			End if 
			
			  //disable
			If ($section_obj.disable=Null:C1517)
				$section_obj.disable:=False:C215
			Else 
				If (Value type:C1509($section_obj.disable)#Is boolean:K8:9)
					$section_obj.disable:=False:C215
					ALERT:C41("Boolean required for the property disable !")
				End if 
			End if 
			
			  //label
			If ($section_obj.label=Null:C1517)
				$section_obj.label:="section "+String:C10($section_obj.position)
			Else 
				If (Value type:C1509($section_obj.label)#Is text:K8:3)
					$section_obj.label:="section "+String:C10($section_obj.position)
					ALERT:C41("String required for the property label !")
				End if 
			End if 
			
			  //picturePath
			If ($section_obj.picturePath=Null:C1517)
				$section_obj.picturePath:=""
			Else 
				If (Value type:C1509($section_obj.picturePath)#Is text:K8:3)
					$section_obj.picturePath:=""
					ALERT:C41("String required for the property picturePath !")
				End if 
			End if 
			
			  //picturePosition
			If ($section_obj.picturePosition=Null:C1517)
				$section_obj.picturePosition:="left"
			Else 
				If (Value type:C1509($section_obj.picturePosition)#Is text:K8:3)
					$section_obj.picturePosition:="left"
					ALERT:C41("Use left or right for the property picturePosition !")
				End if 
			End if 
			
			  //pictureMargin
			If ($section_obj.pictureMargin=Null:C1517)
				$section_obj.pictureMargin:=10
			Else 
				If (Value type:C1509($section_obj.pictureMargin)=Is real:K8:4) | (Value type:C1509($section_obj.pictureMargin)=Is longint:K8:6)
					  //do nothing
				Else 
					$section_obj.pictureMargin:=10
					ALERT:C41("Longint required for the property pictureMargin !")
				End if 
			End if 
			
			  //pictureHeight
			If ($section_obj.pictureHeight=Null:C1517)
				$section_obj.pictureHeight:="40%"
			Else 
				If (Value type:C1509($section_obj.pictureHeight)#Is text:K8:3)
					$section_obj.pictureHeight:=""
					ALERT:C41("Stringify a value with px or % for the property pictureHeight !")
				End if 
			End if 
			
			  //colorToReplace
			If ($section_obj.colorToReplace=Null:C1517)
				$section_obj.colorToReplace:=""
			Else 
				If (Value type:C1509($section_obj.colorToReplace)#Is text:K8:3)
					$section_obj.colorToReplace:=""
					ALERT:C41("String required for the property colorToReplace !")
				End if 
			End if 
			
			  //onClickCB
			Case of 
				: (Value type:C1509($section_obj.onClickCB)=Is text:K8:3)
					If ($section_obj.onClickCB#"")
						ARRAY TEXT:C222($_methods;0)
						METHOD GET NAMES:C1166($_methods;$section_obj.onClickCB;*)
						If (Size of array:C274($_methods)=0)
							  //ask to create the callback
							CONFIRM:C162("Callback method for OnClick not found, Do you want to create it ?";"Yes";"No")
							If (OK=1)
								METHOD SET CODE:C1194($section_obj.onClickCB;"C_OBJECT($1)";*)
							End if 
						End if 
					End if 
				: (Value type:C1509($section_obj.onClickCB)=Is object:K8:27)
					  //nothing to do
				: ($section_obj.onClickCB=Null:C1517)
					$section_obj.onClickCB:=""
				Else 
					$section_obj.onClickCB:=""
					ALERT:C41("String or formula required for the property onClickCB !")
			End case 
			
			
			
			  //onClickCBParams
			If ($section_obj.onClickCBParams#Null:C1517)
				If (Value type:C1509($section_obj.onClickCBParams)#Is object:K8:27)
					ALERT:C41("Object required for the property onClickCBParams !")
					OB REMOVE:C1226($section_obj;"onClickCBParams")
				End if 
			End if 
			
			  //onDoubleClickCB
			Case of 
				: (Value type:C1509($section_obj.onDoubleClickCB)=Is text:K8:3)
					If ($section_obj.onDoubleClickCB#"")
						ARRAY TEXT:C222($_methods;0)
						METHOD GET NAMES:C1166($_methods;$section_obj.onDoubleClickCB;*)
						If (Size of array:C274($_methods)=0)
							  //ask to create the callback
							CONFIRM:C162("Callback method for OnDoubleClick not found, Do you want to create it ?";"Yes";"No")
							If (OK=1)
								METHOD SET CODE:C1194($section_obj.onClickCB;"C_OBJECT($1)";*)
							End if 
						End if 
					End if 
				: (Value type:C1509($section_obj.onDoubleClickCB)=Is object:K8:27)
					  //nothing to do
				: ($section_obj.onDoubleClickCB=Null:C1517)
					$section_obj.onDoubleClickCB:=""
				Else 
					$section_obj.onDoubleClickCB:=""
					ALERT:C41("String or formula required for the property onDoubleClickCB !")
			End case 
			
			
			  //onDoubleClickCBParams
			If ($section_obj.onDoubleClickCBParams#Null:C1517)
				If (Value type:C1509($section_obj.onDoubleClickCBParams)#Is object:K8:27)
					ALERT:C41("Object required for the property onDoubleClickCBParams !")
					OB REMOVE:C1226($section_obj;"onDoubleClickCBParams")
				End if 
			End if 
			
			
			$section_obj.currentState:=New object:C1471
			
		Else 
			  //default section
			$section_obj:=New object:C1471
			
			$section_obj.type:="standard"
			If (This:C1470.breadCrumb.sectionList.count()=0)
				$section_obj.position:=1
			Else 
				$section_obj.position:=This:C1470.breadCrumb.sectionList.max("position")+1
			End if 
			$section_obj.disable:=False:C215
			$section_obj.label:="section "+String:C10($section_obj.position)
			$section_obj.picturePath:=""
			$section_obj.picturePosition:="left"
			$section_obj.pictureMargin:=10
			$section_obj.pictureHeight:="40%"
			$section_obj.colorToReplace:=""
			$section_obj.onClickCB:=""
			$section_obj.onDoubleClickCB:=""
			$section_obj.currentState:=New object:C1471
		End if 
		
		$section_obj.id:=$id
		This:C1470.breadCrumb.sectionList.push(OB Copy:C1225($section_obj))
		This:C1470.breadCrumb.sectionList:=This:C1470.breadCrumb.sectionList.orderBy("position asc")
	Else 
		ALERT:C41("This ID already exists !")
	End if 
Else 
	ALERT:C41("Assign an ID !")
End if 