//%attributes = {"invisible":true}
  // AJUI_BC_grpBtnAutoValues ( $toDraw_obj ) 
  //
  // $1 : (object) instance to draw
  //
  // This method set the automatic values for the grouped buttons model

#DECLARE($param1 : Object)

var $instance_obj; $section : Object

If (False)
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


$instance_obj:=$param1

  //set automatic values
$instance_obj.breadCrumb.box.dynamicSize:=True
$instance_obj.breadCrumb.box.bgColor:=$instance_obj.breadCrumb.box.border.color
$instance_obj.breadCrumb.divider.margin:=$instance_obj.breadCrumb.box.border.size
$instance_obj.breadCrumb.box.padding.horizontal:=0
$instance_obj.breadCrumb.box.padding.vertical:=0
$instance_obj.breadCrumb.divider.arrow.width:="0%"
$instance_obj.breadCrumb.divider.arrow.borderSize:=0
$instance_obj.breadCrumb.divider.arrow.lastSectionWithArrow:=False
$instance_obj.breadCrumb.divider.arrow.firstSectionWithArrow:=False

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
