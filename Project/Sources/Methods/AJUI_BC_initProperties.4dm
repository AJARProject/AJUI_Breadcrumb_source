//%attributes = {"invisible":true}
  // AJUI_BC_initProperties ( $instance_obj )
  //
  // $1 : (object) instance
  //
  // init proprerties of the instance

#DECLARE($param1 : Object) -> $result : Object

var $instance_obj : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.09.19, 13:50:25
	  // ----------------------------------------------------
	  // Method: AJUI_BC_initProperties
	  // Description
	  // 
	  // IN CASE OF MODIFICATION : EDIT THE AJUI_BC_PropertyCol method
	  //
	  // ----------------------------------------------------
End if 


$instance_obj:=$param1

If ($instance_obj.breadCrumb=Null)
	$instance_obj.breadCrumb:=New object
End if 

  // ----------------------------------------------------
  // INTERNAL USE
  // ----------------------------------------------------
$instance_obj.breadCrumb.internalUse:=New object
$instance_obj.breadCrumb.internalUse.lastID:=""
$instance_obj.breadCrumb.internalUse.lastEvent:=-1
$instance_obj.breadCrumb.internalUse.inCallback:=False
If ($instance_obj.breadCrumb.internalUse.selectedBtnID=Null)  //only for groupedButtons
	$instance_obj.breadCrumb.internalUse.selectedBtnID:=""
End if 


  // ----------------------------------------------------
  // GLOBAL
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.global=Null)
	$instance_obj.breadCrumb.global:=New object
End if 
If ($instance_obj.breadCrumb.global.name=Null)
	$instance_obj.breadCrumb.global.name:=""
End if 
If ($instance_obj.breadCrumb.global.model=Null)
	$instance_obj.breadCrumb.global.model:="arrow"  //simple, arrow, groupedButtons
End if 
If ($instance_obj.breadCrumb.global.rtl=Null)
	$instance_obj.breadCrumb.global.rtl:=False
End if 
If ($instance_obj.breadCrumb.global.maxSectionToDraw=Null)
	$instance_obj.breadCrumb.global.maxSectionToDraw:=-1
End if 


  // ----------------------------------------------------
  // BOX
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.box=Null)
	$instance_obj.breadCrumb.box:=New object
End if 
If ($instance_obj.breadCrumb.box.dynamicSize=Null)
	$instance_obj.breadCrumb.box.dynamicSize:=True
End if 
If ($instance_obj.breadCrumb.box.centered=Null)
	$instance_obj.breadCrumb.box.centered:=False
End if 
If ($instance_obj.breadCrumb.box.height=Null)
	$instance_obj.breadCrumb.box.height:=-1
End if 
If ($instance_obj.breadCrumb.box.width=Null)
	$instance_obj.breadCrumb.box.width:=-1
End if 
If ($instance_obj.breadCrumb.box.bgColor=Null)
	$instance_obj.breadCrumb.box.bgColor:="#F0EEF1"
End if 

  // box corner radius
If ($instance_obj.breadCrumb.box.cornerRadius=Null)
	$instance_obj.breadCrumb.box.cornerRadius:=New object
End if 
If ($instance_obj.breadCrumb.box.cornerRadius.right=Null)
	$instance_obj.breadCrumb.box.cornerRadius.right:=5
End if 
If ($instance_obj.breadCrumb.box.cornerRadius.left=Null)
	$instance_obj.breadCrumb.box.cornerRadius.left:=5
End if 

  // box border
If ($instance_obj.breadCrumb.box.border=Null)
	$instance_obj.breadCrumb.box.border:=New object
End if 
If ($instance_obj.breadCrumb.box.border.color=Null)
	$instance_obj.breadCrumb.box.border.color:="black"
End if 
If ($instance_obj.breadCrumb.box.border.size=Null)
	$instance_obj.breadCrumb.box.border.size:=2
End if 

  //box padding
If ($instance_obj.breadCrumb.box.padding=Null)
	$instance_obj.breadCrumb.box.padding:=New object
End if 
If ($instance_obj.breadCrumb.box.padding.horizontal=Null)
	$instance_obj.breadCrumb.box.padding.horizontal:=0
End if 
If ($instance_obj.breadCrumb.box.padding.vertical=Null)
	$instance_obj.breadCrumb.box.padding.vertical:=0
End if 


  // ----------------------------------------------------
  // DIVIDER
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.divider=Null)
	$instance_obj.breadCrumb.divider:=New object
End if 
If ($instance_obj.breadCrumb.divider.margin=Null)
	$instance_obj.breadCrumb.divider.margin:=0
End if 
If ($instance_obj.breadCrumb.divider.string=Null)
	$instance_obj.breadCrumb.divider.string:=">"
End if 


  //divider font
If ($instance_obj.breadCrumb.divider.font=Null)
	$instance_obj.breadCrumb.divider.font:=New object
End if 
If ($instance_obj.breadCrumb.divider.font.size=Null)
	$instance_obj.breadCrumb.divider.font.size:=24
End if 
If ($instance_obj.breadCrumb.divider.font.color=Null)
	$instance_obj.breadCrumb.divider.font.color:="blue"
End if 
If ($instance_obj.breadCrumb.divider.font.name=Null)
	$instance_obj.breadCrumb.divider.font.name:="Arial"
End if 
If ($instance_obj.breadCrumb.divider.font.style=Null)
	$instance_obj.breadCrumb.divider.font.style:="none"
End if 

  //divider arrow
If ($instance_obj.breadCrumb.divider.arrow=Null)
	$instance_obj.breadCrumb.divider.arrow:=New object
End if 
If ($instance_obj.breadCrumb.divider.arrow.width=Null)
	$instance_obj.breadCrumb.divider.arrow.width:="50%"  //px or percent of box height
End if 
If ($instance_obj.breadCrumb.divider.arrow.color=Null)
	$instance_obj.breadCrumb.divider.arrow.color:="#0048AA"
End if 
If ($instance_obj.breadCrumb.divider.arrow.borderSize=Null)
	$instance_obj.breadCrumb.divider.arrow.borderSize:=4
End if 
If ($instance_obj.breadCrumb.divider.arrow.lastSectionWithArrow=Null)
	$instance_obj.breadCrumb.divider.arrow.lastSectionWithArrow:=False
End if 
If ($instance_obj.breadCrumb.divider.arrow.firstSectionWithArrow=Null)
	$instance_obj.breadCrumb.divider.arrow.firstSectionWithArrow:=True
End if 
If ($instance_obj.breadCrumb.divider.arrow.paddingH=Null)
	$instance_obj.breadCrumb.divider.arrow.paddingH:=16
End if 



  // ----------------------------------------------------
  // Section LIST
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.sectionList=Null)
	$instance_obj.breadCrumb.sectionList:=New collection()
End if 

  // ----------------------------------------------------
  // Section TYPES
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.sectionTypes=Null)
	$instance_obj.breadCrumb.sectionTypes:=New object
End if 




  //first
If ($instance_obj.breadCrumb.sectionTypes.first=Null)
	$instance_obj.breadCrumb.sectionTypes.first:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.first.default=Null)
	$instance_obj.breadCrumb.sectionTypes.first.default:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.first.hover=Null)
	$instance_obj.breadCrumb.sectionTypes.first.hover:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.first.active=Null)
	$instance_obj.breadCrumb.sectionTypes.first.active:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.first.disable=Null)
	$instance_obj.breadCrumb.sectionTypes.first.disable:=New object
End if 

  //standard
If ($instance_obj.breadCrumb.sectionTypes.standard=Null)
	$instance_obj.breadCrumb.sectionTypes.standard:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.standard.default=Null)
	
	$instance_obj.breadCrumb.sectionTypes.standard.default:=New object
	$instance_obj.breadCrumb.sectionTypes.standard.default.bgColor:="#D4E3FE"
	$instance_obj.breadCrumb.sectionTypes.standard.default.fontColor:="#0148AA"
	$instance_obj.breadCrumb.sectionTypes.standard.default.fontSize:=12
	$instance_obj.breadCrumb.sectionTypes.standard.default.fontName:="Arial"
	$instance_obj.breadCrumb.sectionTypes.standard.default.fontStyle:="none"
	$instance_obj.breadCrumb.sectionTypes.standard.default.replacingColor:=""
	$instance_obj.breadCrumb.sectionTypes.standard.default.borderSize:=0
	$instance_obj.breadCrumb.sectionTypes.standard.default.borderColor:="black"
	$instance_obj.breadCrumb.sectionTypes.standard.default.pictureOpacity:=100
	
Else 
	
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.bgColor=Null)
		$instance_obj.breadCrumb.sectionTypes.standard.default.bgColor:="#D4E3FE"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.fontColor=Null)
		$instance_obj.breadCrumb.sectionTypes.standard.default.fontColor:="#0148AA"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.fontSize=Null)
		$instance_obj.breadCrumb.sectionTypes.standard.default.fontSize:=12
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.fontName=Null)
		$instance_obj.breadCrumb.sectionTypes.standard.default.fontName:="Arial"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.fontStyle=Null)
		$instance_obj.breadCrumb.sectionTypes.standard.default.fontStyle:="none"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.replacingColor=Null)
		$instance_obj.breadCrumb.sectionTypes.standard.default.replacingColor:=""
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.borderSize=Null)
		$instance_obj.breadCrumb.sectionTypes.standard.default.borderSize:=0
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.borderColor=Null)
		$instance_obj.breadCrumb.sectionTypes.standard.default.borderColor:="black"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.pictureOpacity=Null)
		$instance_obj.breadCrumb.sectionTypes.standard.default.pictureOpacity:=100
	End if 
	
End if 

If ($instance_obj.breadCrumb.sectionTypes.standard.hover=Null)
	$instance_obj.breadCrumb.sectionTypes.standard.hover:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.standard.active=Null)
	$instance_obj.breadCrumb.sectionTypes.standard.active:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.standard.disable=Null)
	$instance_obj.breadCrumb.sectionTypes.standard.disable:=New object
End if 

  //current
If ($instance_obj.breadCrumb.sectionTypes.current=Null)
	$instance_obj.breadCrumb.sectionTypes.current:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.current.default=Null)
	$instance_obj.breadCrumb.sectionTypes.current.default:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.current.hover=Null)
	$instance_obj.breadCrumb.sectionTypes.current.hover:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.current.active=Null)
	$instance_obj.breadCrumb.sectionTypes.current.active:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.current.disable=Null)
	$instance_obj.breadCrumb.sectionTypes.current.disable:=New object
End if 

  //previous
If ($instance_obj.breadCrumb.sectionTypes.previous=Null)
	$instance_obj.breadCrumb.sectionTypes.previous:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.previous.default=Null)
	$instance_obj.breadCrumb.sectionTypes.previous.default:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.previous.hover=Null)
	$instance_obj.breadCrumb.sectionTypes.previous.hover:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.previous.active=Null)
	$instance_obj.breadCrumb.sectionTypes.previous.active:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.previous.disable=Null)
	$instance_obj.breadCrumb.sectionTypes.previous.disable:=New object
End if 

  //next
If ($instance_obj.breadCrumb.sectionTypes.next=Null)
	$instance_obj.breadCrumb.sectionTypes.next:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.next.default=Null)
	$instance_obj.breadCrumb.sectionTypes.next.default:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.next.hover=Null)
	$instance_obj.breadCrumb.sectionTypes.next.hover:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.next.active=Null)
	$instance_obj.breadCrumb.sectionTypes.next.active:=New object
End if 
If ($instance_obj.breadCrumb.sectionTypes.next.disable=Null)
	$instance_obj.breadCrumb.sectionTypes.next.disable:=New object
End if 



$result:=$instance_obj
