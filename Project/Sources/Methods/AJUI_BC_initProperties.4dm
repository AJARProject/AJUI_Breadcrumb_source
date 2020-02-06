//%attributes = {"invisible":true}
  // AJUI_BC_initProperties ( $instance_obj )
  //
  // $1 : (object) instance
  //
  // init proprerties of the instance

If (False:C215)
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

C_OBJECT:C1216($1;$instance_obj;$default_obj;$states_obj)

$instance_obj:=$1

If ($instance_obj.breadCrumb=Null:C1517)
	$instance_obj.breadCrumb:=New object:C1471
End if 

  // ----------------------------------------------------
  // INTERNAL USE
  // ----------------------------------------------------
$instance_obj.breadCrumb.internalUse:=New object:C1471
$instance_obj.breadCrumb.internalUse.lastID:=""
$instance_obj.breadCrumb.internalUse.lastEvent:=-1
$instance_obj.breadCrumb.internalUse.inCallback:=False:C215
If ($instance_obj.breadCrumb.internalUse.selectedBtnID=Null:C1517)  //only for groupedButtons
	$instance_obj.breadCrumb.internalUse.selectedBtnID:=""
End if 


  // ----------------------------------------------------
  // GLOBAL
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.global=Null:C1517)
	$instance_obj.breadCrumb.global:=New object:C1471
End if 
If ($instance_obj.breadCrumb.global.name=Null:C1517)
	$instance_obj.breadCrumb.global.name:=""
End if 
If ($instance_obj.breadCrumb.global.model=Null:C1517)
	$instance_obj.breadCrumb.global.model:="arrow"  //simple, arrow, groupedButtons
End if 
If ($instance_obj.breadCrumb.global.rtl=Null:C1517)
	$instance_obj.breadCrumb.global.rtl:=False:C215
End if 
If ($instance_obj.breadCrumb.global.maxSectionToDraw=Null:C1517)
	$instance_obj.breadCrumb.global.maxSectionToDraw:=-1
End if 


  // ----------------------------------------------------
  // BOX
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.box=Null:C1517)
	$instance_obj.breadCrumb.box:=New object:C1471
End if 
If ($instance_obj.breadCrumb.box.dynamicSize=Null:C1517)
	$instance_obj.breadCrumb.box.dynamicSize:=True:C214
End if 
If ($instance_obj.breadCrumb.box.centered=Null:C1517)
	$instance_obj.breadCrumb.box.centered:=False:C215
End if 
If ($instance_obj.breadCrumb.box.height=Null:C1517)
	$instance_obj.breadCrumb.box.height:=-1
End if 
If ($instance_obj.breadCrumb.box.width=Null:C1517)
	$instance_obj.breadCrumb.box.width:=-1
End if 
If ($instance_obj.breadCrumb.box.bgColor=Null:C1517)
	$instance_obj.breadCrumb.box.bgColor:="#F0EEF1"
End if 

  // box corner radius
If ($instance_obj.breadCrumb.box.cornerRadius=Null:C1517)
	$instance_obj.breadCrumb.box.cornerRadius:=New object:C1471
End if 
If ($instance_obj.breadCrumb.box.cornerRadius.right=Null:C1517)
	$instance_obj.breadCrumb.box.cornerRadius.right:=5
End if 
If ($instance_obj.breadCrumb.box.cornerRadius.left=Null:C1517)
	$instance_obj.breadCrumb.box.cornerRadius.left:=5
End if 

  // box border
If ($instance_obj.breadCrumb.box.border=Null:C1517)
	$instance_obj.breadCrumb.box.border:=New object:C1471
End if 
If ($instance_obj.breadCrumb.box.border.color=Null:C1517)
	$instance_obj.breadCrumb.box.border.color:="black"
End if 
If ($instance_obj.breadCrumb.box.border.size=Null:C1517)
	$instance_obj.breadCrumb.box.border.size:=2
End if 

  //box padding
If ($instance_obj.breadCrumb.box.padding=Null:C1517)
	$instance_obj.breadCrumb.box.padding:=New object:C1471
End if 
If ($instance_obj.breadCrumb.box.padding.horizontal=Null:C1517)
	$instance_obj.breadCrumb.box.padding.horizontal:=0
End if 
If ($instance_obj.breadCrumb.box.padding.vertical=Null:C1517)
	$instance_obj.breadCrumb.box.padding.vertical:=0
End if 


  // ----------------------------------------------------
  // DIVIDER
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.divider=Null:C1517)
	$instance_obj.breadCrumb.divider:=New object:C1471
End if 
If ($instance_obj.breadCrumb.divider.margin=Null:C1517)
	$instance_obj.breadCrumb.divider.margin:=0
End if 
If ($instance_obj.breadCrumb.divider.string=Null:C1517)
	$instance_obj.breadCrumb.divider.string:=">"
End if 


  //divider font
If ($instance_obj.breadCrumb.divider.font=Null:C1517)
	$instance_obj.breadCrumb.divider.font:=New object:C1471
End if 
If ($instance_obj.breadCrumb.divider.font.size=Null:C1517)
	$instance_obj.breadCrumb.divider.font.size:=24
End if 
If ($instance_obj.breadCrumb.divider.font.color=Null:C1517)
	$instance_obj.breadCrumb.divider.font.color:="blue"
End if 
If ($instance_obj.breadCrumb.divider.font.name=Null:C1517)
	$instance_obj.breadCrumb.divider.font.name:="Arial"
End if 
If ($instance_obj.breadCrumb.divider.font.style=Null:C1517)
	$instance_obj.breadCrumb.divider.font.style:="none"
End if 

  //divider arrow
If ($instance_obj.breadCrumb.divider.arrow=Null:C1517)
	$instance_obj.breadCrumb.divider.arrow:=New object:C1471
End if 
If ($instance_obj.breadCrumb.divider.arrow.width=Null:C1517)
	$instance_obj.breadCrumb.divider.arrow.width:="50%"  //px or percent of box height
End if 
If ($instance_obj.breadCrumb.divider.arrow.color=Null:C1517)
	$instance_obj.breadCrumb.divider.arrow.color:="#0048AA"
End if 
If ($instance_obj.breadCrumb.divider.arrow.borderSize=Null:C1517)
	$instance_obj.breadCrumb.divider.arrow.borderSize:=4
End if 
If ($instance_obj.breadCrumb.divider.arrow.lastSectionWithArrow=Null:C1517)
	$instance_obj.breadCrumb.divider.arrow.lastSectionWithArrow:=False:C215
End if 
If ($instance_obj.breadCrumb.divider.arrow.firstSectionWithArrow=Null:C1517)
	$instance_obj.breadCrumb.divider.arrow.firstSectionWithArrow:=True:C214
End if 
If ($instance_obj.breadCrumb.divider.arrow.paddingH=Null:C1517)
	$instance_obj.breadCrumb.divider.arrow.paddingH:=16
End if 



  // ----------------------------------------------------
  // Section LIST
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.sectionList=Null:C1517)
	$instance_obj.breadCrumb.sectionList:=New collection:C1472()
End if 

  // ----------------------------------------------------
  // Section TYPES
  // ----------------------------------------------------
If ($instance_obj.breadCrumb.sectionTypes=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes:=New object:C1471
End if 




  //first
If ($instance_obj.breadCrumb.sectionTypes.first=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.first:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.first.default=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.first.default:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.first.hover=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.first.hover:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.first.active=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.first.active:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.first.disable=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.first.disable:=New object:C1471
End if 

  //standard
If ($instance_obj.breadCrumb.sectionTypes.standard=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.standard:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.standard.default=Null:C1517)
	
	$instance_obj.breadCrumb.sectionTypes.standard.default:=New object:C1471
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
	
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.bgColor=Null:C1517)
		$instance_obj.breadCrumb.sectionTypes.standard.default.bgColor:="#D4E3FE"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.fontColor=Null:C1517)
		$instance_obj.breadCrumb.sectionTypes.standard.default.fontColor:="#0148AA"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.fontSize=Null:C1517)
		$instance_obj.breadCrumb.sectionTypes.standard.default.fontSize:=12
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.fontName=Null:C1517)
		$instance_obj.breadCrumb.sectionTypes.standard.default.fontName:="Arial"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.fontStyle=Null:C1517)
		$instance_obj.breadCrumb.sectionTypes.standard.default.fontStyle:="none"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.replacingColor=Null:C1517)
		$instance_obj.breadCrumb.sectionTypes.standard.default.replacingColor:=""
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.borderSize=Null:C1517)
		$instance_obj.breadCrumb.sectionTypes.standard.default.borderSize:=0
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.borderColor=Null:C1517)
		$instance_obj.breadCrumb.sectionTypes.standard.default.borderColor:="black"
	End if 
	If ($instance_obj.breadCrumb.sectionTypes.standard.default.pictureOpacity=Null:C1517)
		$instance_obj.breadCrumb.sectionTypes.standard.default.pictureOpacity:=100
	End if 
	
End if 

If ($instance_obj.breadCrumb.sectionTypes.standard.hover=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.standard.hover:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.standard.active=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.standard.active:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.standard.disable=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.standard.disable:=New object:C1471
End if 

  //current
If ($instance_obj.breadCrumb.sectionTypes.current=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.current:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.current.default=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.current.default:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.current.hover=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.current.hover:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.current.active=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.current.active:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.current.disable=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.current.disable:=New object:C1471
End if 

  //previous
If ($instance_obj.breadCrumb.sectionTypes.previous=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.previous:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.previous.default=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.previous.default:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.previous.hover=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.previous.hover:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.previous.active=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.previous.active:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.previous.disable=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.previous.disable:=New object:C1471
End if 

  //next
If ($instance_obj.breadCrumb.sectionTypes.next=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.next:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.next.default=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.next.default:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.next.hover=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.next.hover:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.next.active=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.next.active:=New object:C1471
End if 
If ($instance_obj.breadCrumb.sectionTypes.next.disable=Null:C1517)
	$instance_obj.breadCrumb.sectionTypes.next.disable:=New object:C1471
End if 



$0:=$instance_obj