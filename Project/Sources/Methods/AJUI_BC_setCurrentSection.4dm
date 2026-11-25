//%attributes = {"invisible":true}
  // AJUI_BC_setCurrentSection ( $id ) -> return
  //
  // $1 : (text) id
  //
  // This method will will assign the type to the section related to the id and remove the other section with the current type

#DECLARE($param1 : Text)

var $id : Text
var $section : Object
var $groupedModel; $foundCurrent : Boolean
var $pos : Integer

If (False)
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


$id:=$param1
$foundCurrent:=False

If (This.breadCrumb.global.model="groupedButtons")
	$groupedModel:=True
Else 
	$groupedModel:=False
End if 


$pos:=This.breadCrumb.sectionList.findIndex("AJUI_BC_findSectionByID";$id)
If ($pos>=0)
	
	If ($groupedModel)  //case grouped buttons
		
		
		For each ($section;This.breadCrumb.sectionList)
			If ($section.id=$id)
				$section.type:="current"
				This.breadCrumb.internalUse.selectedBtnID:=$id
			Else 
				$section.type:="standard"
			End if 
		End for each 
		
	Else 
		
		For each ($section;This.breadCrumb.sectionList)
			If ($section.id=$id)
				If ($section.type#"first")
					$section.type:="current"
				End if 
				$foundCurrent:=True
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
