//%attributes = {"invisible":true}
  // AJUI_BC_PropertyCol ( ) -> return
  //
  // return : (collection) (return) collection of properties and related formulas
  //
  // Return a collection to match properties with formulas

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 05.12.19, 09:45:37
	  // ----------------------------------------------------
	  // Method: AJUI_BC_PropertyCol
	  // Description
	  // 
	  // WARNING : DON'T FORGET TO EDIT THIS METHOD WHEN A FORMULA WITH EXCEPTION IS CREATED/MODIFIED/DELETED
	  //
	  // ----------------------------------------------------
End if 

C_COLLECTION:C1488($0;$properties_col)

$properties_col:=New collection:C1472()


$properties_col.push(New object:C1471("property";"bgColor";"formula";"SectionBgColor"))
$properties_col.push(New object:C1471("property";"borderColor";"formula";"SectionBorderColor"))
$properties_col.push(New object:C1471("property";"borderSize";"formula";"SectionBorderSize"))
$properties_col.push(New object:C1471("property";"fontColor";"formula";"SectionFontColor"))
$properties_col.push(New object:C1471("property";"fontName";"formula";"SectionFontName"))
$properties_col.push(New object:C1471("property";"fontSize";"formula";"SectionFontSize"))
$properties_col.push(New object:C1471("property";"fontStyle";"formula";"SectionFontStyle"))
$properties_col.push(New object:C1471("property";"pictureOpacity";"formula";"PictureOpacity"))
$properties_col.push(New object:C1471("property";"replacingColor";"formula";"ReplacingColor"))



$0:=$properties_col