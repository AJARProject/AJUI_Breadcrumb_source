//%attributes = {"invisible":true}
  // AJUI_BC_findSectionByID ( $section ; $id ) -> return
  //
  // $1 : (object) section from the member function findIndex
  // $2 : (text) id
  //
  // Callback to find an section by ID into a collection

#DECLARE($param1 : Object; $param2 : Text)

var $section : Object
var $id : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 16.09.19, 16:11:35
	  // ----------------------------------------------------
	  // Method: AJUI_BC_findSectionmByID
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$section:=$param1.value
$id:=$param2

$param1.result:=($section.id=$id)
