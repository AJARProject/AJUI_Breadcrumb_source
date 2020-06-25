//%attributes = {"invisible":true}
  // AJUI_BC_setCurrentSection ( $id ) -> return
  //
  // $1 : (text) id
  //
  // This method will will assign the type to the section related to the id and remove the other section with the current type

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 20.09.19, 14:46:55
	  // ----------------------------------------------------
	  // Method: AJUI_BC_setCurrentSection
	  // Description
	  // 
	  // WARNING : specific case for groupedButtons model
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$id)
C_OBJECT:C1216($section)
C_BOOLEAN:C305($groupedModel;$foundCurrent)

$id:=$1
$foundCurrent:=False:C215

If (This:C1470.breadCrumb.global.model="groupedButtons")
	$groupedModel:=True:C214
Else 
	$groupedModel:=False:C215
End if 


$pos:=This:C1470.breadCrumb.sectionList.findIndex("AJUI_BC_findSectionByID";$id)
If ($pos>=0)
	
	If ($groupedModel)  //case grouped buttons
		
		
		For each ($section;This:C1470.breadCrumb.sectionList)
			If ($section.id=$id)
				$section.type:="current"
				This:C1470.breadCrumb.internalUse.selectedBtnID:=$id
			Else 
				$section.type:="standard"
			End if 
		End for each 
		
	Else 
		
		For each ($section;This:C1470.breadCrumb.sectionList)
			If ($section.id=$id)
				If ($section.type#"first")
					$section.type:="current"
				End if 
				$foundCurrent:=True:C214
			Else 
				
				If ($foundCurrent)
					$section.type:="next"
				Else 
					If ($section.type#"first")
						$section.type:="previous"
					End if 
				End if 
			End if 
		End for each 
	End if 
End if 