//%attributes = {"invisible":true}
  // AJUI_BC_draw (  ) 
  //
  //
  // This method will handle the state, calculation of the size of each sections, launching the draw and the callback,...

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 12.09.19, 10:14:44
	  // ----------------------------------------------------
	  // Method: AJUI_BC_draw
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $instance_obj; $toDraw_obj; $section : Object
var $name; $sectionID; $sectionType; $model : Text
var $callback : Variant
var $skip; $firstSectionWithArrow : Boolean
var $pict : Picture
var $borderSize; $position; $maxHeight : Integer
var $params : Object
var $currentFormObj : Text
var $left : Integer
var $top : Integer
var $right : Integer
var $bottom : Integer
var $mouseX : Integer
var $mouseY : Integer
var $state : Integer
var $id : Text
var $pictWidth : Integer
var $pictHeight : Integer
var $offset_center : Real


$instance_obj:=This
$name:=$instance_obj.breadCrumb.global.name

$currentFormObj:=OBJECT Get name(Object current)
$skip:=False

OBJECT GET COORDINATES(*;$name;$left;$top;$right;$bottom)

  //check if the current object and the name is the same
If ($currentFormObj=$name)
	
	MOUSE POSITION($mouseX;$mouseY;$state)
	CONVERT COORDINATES($mouseX;$mouseY;XY Current window;XY Current form)
	$mouseX:=$mouseX-$left
	$mouseY:=$mouseY-$top
	
	$id:=SVG Find element ID by coordinates(*;$currentFormObj;$mouseX;$mouseY)
	$sectionID:=Substring($id;1;Length($id))
	
	
	
	
	
	
	If ($sectionID="@_AJUI_BC_bindedPicture")
		$sectionID:=Replace string($sectionID;"_AJUI_BC_bindedPicture";"")
	End if 
	
	If ($instance_obj.breadCrumb.internalUse.lastID=$sectionID) & ($instance_obj.breadCrumb.internalUse.lastEvent=On Mouse Move) & (Form event code=On Mouse Move)
		$skip:=True
	End if 
	
	$instance_obj.breadCrumb.internalUse.lastID:=$sectionID  //refresh last id
Else 
	$instance_obj.breadCrumb.internalUse.lastID:=$sectionID  //refresh last id
End if 

$instance_obj.breadCrumb.internalUse.lastEvent:=Form event code  //refresh last event

  //avoids the mouse move between on clicked and mouse up event
If (Is waiting mouse up)
	If (Not($instance_obj.breadCrumb.internalUse.lastEvent=On Clicked))
		$skip:=True
	End if 
End if 

If (Not($skip))  //dont redraw if skip
	
	
	$toDraw_obj:=OB Copy($instance_obj)
	$model:=$toDraw_obj.breadCrumb.global.model
	
	  //check grouped buttons model
	If ($model="groupedButtons")
		AJUI_BC_grpBtnAutoValues ($toDraw_obj)
		
		If ($currentFormObj=$name) & ($sectionID#"")
			If (Form event code=On Mouse Up) | (Form event code=On Double Clicked)
				  //set the new current section
				$toDraw_obj.SetCurrentSection($sectionID)
				$instance_obj.breadCrumb.internalUse.selectedBtnID:=$sectionID  //refresh
			End if 
		End if 
	End if 
	
	$borderSize:=$toDraw_obj.breadCrumb.box.border.size
	
	  //check dynamicSize
	If (Not($toDraw_obj.breadCrumb.box.dynamicSize))
		If ($toDraw_obj.breadCrumb.box.width<0)
			$toDraw_obj.breadCrumb.box.width:=$right-$left-$borderSize
		End if 
	End if 
	
	If ($toDraw_obj.breadCrumb.box.height<0)
		$toDraw_obj.breadCrumb.box.height:=$bottom-$top-$borderSize
	End if 
	
	$maxHeight:=$toDraw_obj.breadCrumb.box.height-($borderSize*2)-($toDraw_obj.breadCrumb.box.padding.vertical*2)
	
	$firstSectionWithArrow:=$toDraw_obj.breadCrumb.divider.arrow.firstSectionWithArrow
	
	For each ($section;$toDraw_obj.breadCrumb.sectionList)
		$sectionType:=$section.type
		
		If ($section.disable)
			If (Not(OB Is empty($toDraw_obj.breadCrumb.sectionTypes[$sectionType].disable)))
				$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"disable";$sectionType)
			Else 
				$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
			End if 
			
		Else 
			
			  //HANDLE STATES
			Case of 
				: (Form event code=On Mouse Enter)  //state hover
					If (Not(OB Is empty($toDraw_obj.breadCrumb.sectionTypes[$sectionType].hover))) & ($sectionID=$section.id)
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"hover";$sectionType)
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
				: (Form event code=On Mouse Move)  //state hover
					
					If (Not(OB Is empty($toDraw_obj.breadCrumb.sectionTypes[$sectionType].hover))) & ($sectionID=$section.id)
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"hover";$sectionType)
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
				: (Form event code=On Clicked)  //state active
					
					If (Not(OB Is empty($toDraw_obj.breadCrumb.sectionTypes[$sectionType].active))) & ($sectionID=$section.id)
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"active";$sectionType)
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
					
					
				: (Form event code=On Double Clicked)  //state active
					
					If (Not(OB Is empty($toDraw_obj.breadCrumb.sectionTypes[$sectionType].active))) & ($sectionID=$section.id)
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"active";$sectionType)
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
					
				: (Form event code=On Mouse Leave)  //state default
					$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					
				: (Form event code=On Mouse Up)  //state default
					MOUSE POSITION($mouseX;$mouseY;$state)
					CONVERT COORDINATES($mouseX;$mouseY;XY Current window;XY Current form)
					
					OBJECT GET COORDINATES(*;$name;$left;$top;$right;$bottom)
					
					  //check case to apply after a mouse up 
					If ($mouseX>=$left) & ($mouseX<=$right) & ($mouseY>=$top) & ($mouseY<=$bottom)
						
						If (Not(OB Is empty($toDraw_obj.breadCrumb.sectionTypes[$sectionType].hover))) & ($sectionID=$section.id)
							$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"hover";$sectionType)
						Else 
							$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
						End if 
						
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
					
					
				: (Form event code=On Load)  //state default
					$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					
					
				Else   //state default
					$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					
			End case 
			
			
		End if 
		
		  //calc size section and load picture
		If ($model="arrow") | ($model="groupedButtons")
			AJUI_BC_calcSizeSection ($section;$toDraw_obj.breadCrumb.divider.arrow.width;$toDraw_obj.breadCrumb.divider.arrow.paddingH;$maxHeight;$firstSectionWithArrow)
		Else 
			AJUI_BC_calcSizeSection ($section)
		End if 
		
		  //load picture
		If ($section.picturePath#"")
			AJUI_BC_loadPicture ($section;$toDraw_obj.breadCrumb.global.importPath)
			AJUI_BC_resizePicture ($section;$maxHeight-4)
		Else 
			$section.drawPicture:=False
		End if 
		
		$firstSectionWithArrow:=True  //can't be false after the first section
		
	End for each 
	
	
	  //draw
	$pict:=AJUI_BC_drawSVG ($toDraw_obj)
	
	  //set picture and resize
	OBJECT SET BORDER STYLE(*;$name;Border None)
	PICTURE PROPERTIES($pict;$pictWidth;$pictHeight)
	If ($toDraw_obj.breadCrumb.box.dynamicSize) & ($toDraw_obj.breadCrumb.box.centered)
		$offset_center:=(($right-$left)/2)-($pictWidth/2)
		OBJECT SET COORDINATES(*;$name;$left+$offset_center;$top;$left+$offset_center+$pictWidth;$top+$pictHeight)
	Else 
		If ($toDraw_obj.breadCrumb.global.rtl)  //resize from the right if rtl
			OBJECT SET COORDINATES(*;$name;$right-$pictWidth;$top;$right;$top+$pictHeight)
		Else 
			OBJECT SET COORDINATES(*;$name;$left;$top;$left+$pictWidth;$top+$pictHeight)
		End if 
	End if 
	OBJECT Get pointer(Object named;$name)->:=$pict
	
	  //callback
	If ($currentFormObj=$name) & ($sectionID#"")
		$position:=This.breadCrumb.sectionList.findIndex("AJUI_BC_findSectionByID";$sectionID)
		
		Case of 
			: (Form event code=On Mouse Up)
				$callback:=$instance_obj.breadCrumb.sectionList[$position].onClickCB
				  //check section disable
				If ($position>=0)
					If (Not($instance_obj.breadCrumb.sectionList[$position].disable))
						
						Case of 
							: (Value type($callback)=Is text)
								If ($callback#"") & ($instance_obj.breadCrumb.internalUse.inCallback=False)  //avoids an infinite loop if the draw method recall himself
									If (AJUI_BC_checkValidCallback ($callback))
										$instance_obj.breadCrumb.internalUse.inCallback:=True
										If ($instance_obj.breadCrumb.sectionList[$position].onClickCBParams=Null)
											EXECUTE METHOD($callback)
										Else 
											EXECUTE METHOD($callback;*;$instance_obj.breadCrumb.sectionList[$position].onClickCBParams)
										End if 
										$instance_obj.breadCrumb.internalUse.inCallback:=False
									End if 
								End if 
							: (Value type($callback)=Is object)
								If ($instance_obj.breadCrumb.internalUse.inCallback=False)  //avoids an infinite loop if the draw method recall himself
									$instance_obj.breadCrumb.internalUse.inCallback:=True
									If ($instance_obj.breadCrumb.sectionList[$position].onClickCBParams=Null)
										$callback.call()
									Else 
										$params:=$instance_obj.breadCrumb.sectionList[$position].onClickCBParams
										$callback.call(Null;$params)
									End if 
									$instance_obj.breadCrumb.internalUse.inCallback:=False
								End if 
						End case 
					End if 
				End if 
				
			: (Form event code=On Double Clicked)
				
				$callback:=$instance_obj.breadCrumb.sectionList[$position].onDoubleClickCB
				  //check section disable
				If ($position>=0)
					If (Not($instance_obj.breadCrumb.sectionList[$position].disable))
						
						Case of 
							: (Value type($callback)=Is text)
								If ($callback#"") & ($instance_obj.breadCrumb.internalUse.inCallback=False)  //avoids an infinite loop if the draw method recall himself
									If (AJUI_BC_checkValidCallback ($callback))
										$instance_obj.breadCrumb.internalUse.inCallback:=True
										If ($instance_obj.breadCrumb.sectionList[$position].onDoubleClickCBParams=Null)
											EXECUTE METHOD($callback)
										Else 
											EXECUTE METHOD($callback;*;$instance_obj.breadCrumb.sectionList[$position].onDoubleClickCBParams)
										End if 
										$instance_obj.breadCrumb.internalUse.inCallback:=False
									End if 
								End if 
							: (Value type($callback)=Is object)
								If ($instance_obj.breadCrumb.internalUse.inCallback=False)  //avoids an infinite loop if the draw method recall himself
									$instance_obj.breadCrumb.internalUse.inCallback:=True
									If ($instance_obj.breadCrumb.sectionList[$position].onDoubleClickCBParams=Null)
										$callback.call()
									Else 
										$params:=$instance_obj.breadCrumb.sectionList[$position].onDoubleClickCBParams
										$callback.call(Null;$params)
									End if 
									$instance_obj.breadCrumb.internalUse.inCallback:=False
								End if 
						End case 
					End if 
				End if 
		End case 
	End if 
End if 

