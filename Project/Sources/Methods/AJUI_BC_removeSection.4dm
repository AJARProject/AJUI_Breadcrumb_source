//%attributes = {"invisible":true}
  // AJUI_BC_removeSection ( $id) -> return
  //
  // $1 : (text) id
  //
  // This methode remove the section related to the id from the section list

#DECLARE($param1 : Text)

var $id : Text
var $pos : Integer

If (False)
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


$id:=$param1
$pos:=This.breadCrumb.sectionList.extract("id").indexOf($id)

If ($pos>=0)
	This.breadCrumb.sectionList.remove($pos)
	This.breadCrumb.sectionList:=This.breadCrumb.sectionList.orderBy("position asc")
End if 

