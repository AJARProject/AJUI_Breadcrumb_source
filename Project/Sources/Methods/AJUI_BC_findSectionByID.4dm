//%attributes = {"invisible":true}
  // AJUI_BC_findSectionByID ( $section ; $id ) -> return
  //
  // $1 : (object) section from the member function findIndex
  // $2 : (text) id
  //
  // Callback to find an section by ID into a collection

If (False:C215)
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

C_OBJECT:C1216($1;$section)
C_TEXT:C284($2;$id)

$section:=$1.value
$id:=$2

$1.result:=($section.id=$id)
