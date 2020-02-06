//%attributes = {"invisible":true}
  // AJUI_BC_grpBtnAutoValues ( $toDraw_obj ) 
  //
  // $1 : (object) instance to draw
  //
  // This method set the automatic values for the grouped buttons model

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 07.01.20, 15:31:57
	  // ----------------------------------------------------
	  // Method: AJUI_BC_grpBtnAutoValues
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$instance_obj;$section)

$instance_obj:=$1

  //set automatic values
$instance_obj.breadCrumb.box.dynamicSize:=True:C214
$instance_obj.breadCrumb.box.bgColor:=$instance_obj.breadCrumb.box.border.color
$instance_obj.breadCrumb.divider.margin:=$instance_obj.breadCrumb.box.border.size
$instance_obj.breadCrumb.box.padding.horizontal:=0
$instance_obj.breadCrumb.box.padding.vertical:=0
$instance_obj.breadCrumb.divider.arrow.width:="0%"
$instance_obj.breadCrumb.divider.arrow.borderSize:=0
$instance_obj.breadCrumb.divider.arrow.lastSectionWithArrow:=False:C215
$instance_obj.breadCrumb.divider.arrow.firstSectionWithArrow:=False:C215

  //put section to standard type except for section related to the ID (current type)
For each ($section;$instance_obj.breadCrumb.sectionList)
	If ($section.id=$instance_obj.breadCrumb.internalUse.selectedBtnID)
		$section.type:="current"
	Else 
		$section.type:="standard"
	End if 
End for each 

  //remove section borders
$instance_obj.breadCrumb.sectionTypes.standard.default.borderSize:=0
$instance_obj.RemovePropertyExceptions("SectionBorderSize")
