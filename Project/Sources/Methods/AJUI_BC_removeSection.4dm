//%attributes = {"invisible":true}
  // AJUI_BC_removeSection ( $id) -> return
  //
  // $1 : (text) id
  //
  // This methode remove the section related to the id from the section list

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 13.09.19, 15:20:10
	  // ----------------------------------------------------
	  // Method: AJUI_BC_removeSection
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$id)
C_LONGINT:C283($pos)

$id:=$1
$pos:=This:C1470.breadCrumb.sectionList.extract("id").indexOf($id)

If ($pos>=0)
	This:C1470.breadCrumb.sectionList.remove($pos)
	This:C1470.breadCrumb.sectionList:=This:C1470.breadCrumb.sectionList.orderBy("position asc")
End if 

