//%attributes = {"invisible":true}
  // AJUI_BC_draw (  ) 
  //
  //
  // This method will handle the state, calculation of the size of each sections, launching the draw and the callback,...

If (False:C215)
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

C_OBJECT:C1216($instance_obj;$toDraw_obj;$section)
C_TEXT:C284($name;$callback;$sectionID;$sectionType;$model)
C_BOOLEAN:C305($skip;$firstSectionWithArrow)
C_PICTURE:C286($pict)
C_LONGINT:C283($cRadiusLeft;$cRadiusRight;$borderSize;$position;$maxHeight)

$instance_obj:=This:C1470
$name:=$instance_obj.breadCrumb.global.name

$currentFormObj:=OBJECT Get name:C1087(Object current:K67:2)
$skip:=False:C215

OBJECT GET COORDINATES:C663(*;$name;$left;$top;$right;$bottom)

  //check if the current object and the name is the same
If ($currentFormObj=$name)
	
	GET MOUSE:C468($mouseX;$mouseY;$state)
	CONVERT COORDINATES:C1365($mouseX;$mouseY;XY Current window:K27:6;XY Current form:K27:5)
	$mouseX:=$mouseX-$left
	$mouseY:=$mouseY-$top
	
	$id:=SVG Find element ID by coordinates:C1054(*;$currentFormObj;$mouseX;$mouseY)
	$sectionID:=Substring:C12($id;1;Length:C16($id))
	
	
	
	
	
	
	If ($sectionID="@_AJUI_BC_bindedPicture")
		$sectionID:=Replace string:C233($sectionID;"_AJUI_BC_bindedPicture";"")
	End if 
	
	If ($instance_obj.breadCrumb.internalUse.lastID=$sectionID) & ($instance_obj.breadCrumb.internalUse.lastEvent=On Mouse Move:K2:35) & (Form event code:C388=On Mouse Move:K2:35)
		$skip:=True:C214
	End if 
	
	$instance_obj.breadCrumb.internalUse.lastID:=$sectionID  //refresh last id
Else 
	$instance_obj.breadCrumb.internalUse.lastID:=$sectionID  //refresh last id
End if 

$instance_obj.breadCrumb.internalUse.lastEvent:=Form event code:C388  //refresh last event

  //avoids the mouse move between on clicked and mouse up event
If (Is waiting mouse up:C1422)
	If (Not:C34($instance_obj.breadCrumb.internalUse.lastEvent=On Clicked:K2:4))
		$skip:=True:C214
	End if 
End if 

If (Not:C34($skip))  //dont redraw if skip
	
	
	$toDraw_obj:=OB Copy:C1225($instance_obj)
	$model:=$toDraw_obj.breadCrumb.global.model
	
	  //check grouped buttons model
	If ($model="groupedButtons")
		AJUI_BC_grpBtnAutoValues ($toDraw_obj)
		
		If ($currentFormObj=$name) & ($sectionID#"")
			If (Form event code:C388=On Mouse Up:K2:58) | (Form event code:C388=On Double Clicked:K2:5)
				  //set the new current section
				$toDraw_obj.SetCurrentSection($sectionID)
				$instance_obj.breadCrumb.internalUse.selectedBtnID:=$sectionID  //refresh
			End if 
		End if 
	End if 
	
	$borderSize:=$toDraw_obj.breadCrumb.box.border.size
	
	  //check dynamicSize
	If (Not:C34($toDraw_obj.breadCrumb.box.dynamicSize))
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
			If (Not:C34(OB Is empty:C1297($toDraw_obj.breadCrumb.sectionTypes[$sectionType].disable)))
				$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"disable";$sectionType)
			Else 
				$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
			End if 
			
		Else 
			
			  //HANDLE STATES
			Case of 
				: (Form event code:C388=On Mouse Enter:K2:33)  //state hover
					If (Not:C34(OB Is empty:C1297($toDraw_obj.breadCrumb.sectionTypes[$sectionType].hover))) & ($sectionID=$section.id)
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"hover";$sectionType)
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
				: (Form event code:C388=On Mouse Move:K2:35)  //state hover
					
					If (Not:C34(OB Is empty:C1297($toDraw_obj.breadCrumb.sectionTypes[$sectionType].hover))) & ($sectionID=$section.id)
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"hover";$sectionType)
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
				: (Form event code:C388=On Clicked:K2:4)  //state active
					
					If (Not:C34(OB Is empty:C1297($toDraw_obj.breadCrumb.sectionTypes[$sectionType].active))) & ($sectionID=$section.id)
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"active";$sectionType)
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
					
					
				: (Form event code:C388=On Double Clicked:K2:5)  //state active
					
					If (Not:C34(OB Is empty:C1297($toDraw_obj.breadCrumb.sectionTypes[$sectionType].active))) & ($sectionID=$section.id)
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"active";$sectionType)
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
					
				: (Form event code:C388=On Mouse Leave:K2:34)  //state default
					$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					
				: (Form event code:C388=On Mouse Up:K2:58)  //state default
					GET MOUSE:C468($mouseX;$mouseY;$state)
					CONVERT COORDINATES:C1365($mouseX;$mouseY;XY Current window:K27:6;XY Current form:K27:5)
					
					OBJECT GET COORDINATES:C663(*;$name;$left;$top;$right;$bottom)
					
					  //check case to apply after a mouse up 
					If ($mouseX>=$left) & ($mouseX<=$right) & ($mouseY>=$top) & ($mouseY<=$bottom)
						
						If (Not:C34(OB Is empty:C1297($toDraw_obj.breadCrumb.sectionTypes[$sectionType].hover))) & ($sectionID=$section.id)
							$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"hover";$sectionType)
						Else 
							$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
						End if 
						
					Else 
						$section.currentState:=AJUI_BC_mergeStates ($toDraw_obj.breadCrumb.sectionTypes;"default";$sectionType)
					End if 
					
					
					
				: (Form event code:C388=On Load:K2:1)  //state default
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
			$section.drawPicture:=False:C215
		End if 
		
		$firstSectionWithArrow:=True:C214  //can't be false after the first section
		
	End for each 
	
	
	  //draw
	$pict:=AJUI_BC_drawSVG ($toDraw_obj)
	
	  //set picture and resize
	OBJECT SET BORDER STYLE:C1262(*;$name;Border None:K42:27)
	PICTURE PROPERTIES:C457($pict;$pictWidth;$pictHeight)
	If ($toDraw_obj.breadCrumb.box.dynamicSize) & ($toDraw_obj.breadCrumb.box.centered)
		$offset_center:=(($right-$left)/2)-($pictWidth/2)
		OBJECT SET COORDINATES:C1248(*;$name;$left+$offset_center;$top;$left+$offset_center+$pictWidth;$top+$pictHeight)
	Else 
		If ($toDraw_obj.breadCrumb.global.rtl)  //resize from the right if rtl
			OBJECT SET COORDINATES:C1248(*;$name;$right-$pictWidth;$top;$right;$top+$pictHeight)
		Else 
			OBJECT SET COORDINATES:C1248(*;$name;$left;$top;$left+$pictWidth;$top+$pictHeight)
		End if 
	End if 
	OBJECT Get pointer:C1124(Object named:K67:5;$name)->:=$pict
	
	  //callback
	If ($currentFormObj=$name) & ($sectionID#"")
		$position:=This:C1470.breadCrumb.sectionList.findIndex("AJUI_BC_findSectionByID";$sectionID)
		
		Case of 
			: (Form event code:C388=On Mouse Up:K2:58)
				
				$callback:=$instance_obj.breadCrumb.sectionList[$position].onClickCB
				  //check section disable
				If ($position>=0)
					If (Not:C34($instance_obj.breadCrumb.sectionList[$position].disable))
						If ($callback#"") & ($instance_obj.breadCrumb.internalUse.inCallback=False:C215)  //avoids an infinite loop if the draw method recall himself
							If (AJUI_BC_checkValidCallback ($callback))
								$instance_obj.breadCrumb.internalUse.inCallback:=True:C214
								If ($instance_obj.breadCrumb.sectionList[$position].onClickCBParams=Null:C1517)
									EXECUTE METHOD:C1007($callback)
								Else 
									EXECUTE METHOD:C1007($callback;*;$instance_obj.breadCrumb.sectionList[$position].onClickCBParams)
								End if 
								$instance_obj.breadCrumb.internalUse.inCallback:=False:C215
							End if 
						End if 
					End if 
				End if 
				
			: (Form event code:C388=On Double Clicked:K2:5)
				
				$callback:=$instance_obj.breadCrumb.sectionList[$position].onDoubleClickCB
				  //check section disable
				If ($position>=0)
					If (Not:C34($instance_obj.breadCrumb.sectionList[$position].disable))
						If ($callback#"") & ($instance_obj.breadCrumb.internalUse.inCallback=False:C215)  //avoids an infinite loop if the draw method recall himself
							If (AJUI_BC_checkValidCallback ($callback))
								$instance_obj.breadCrumb.internalUse.inCallback:=True:C214
								If ($instance_obj.breadCrumb.sectionList[$position].onDoubleClickCBParams=Null:C1517)
									EXECUTE METHOD:C1007($callback)
								Else 
									EXECUTE METHOD:C1007($callback;*;$instance_obj.breadCrumb.sectionList[$position].onDoubleClickCBParams)
								End if 
								$instance_obj.breadCrumb.internalUse.inCallback:=False:C215
							End if 
						End if 
					End if 
				End if 
				
		End case 
	End if 
End if 

