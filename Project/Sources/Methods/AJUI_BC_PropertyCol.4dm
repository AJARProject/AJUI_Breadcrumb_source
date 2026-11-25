//%attributes = {"invisible":true}
  // AJUI_BC_PropertyCol ( ) -> return
  //
  // return : (collection) (return) collection of properties and related formulas
  //
  // Return a collection to match properties with formulas

#DECLARE() -> $result : Collection

var $properties_col : Collection

If (False)
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


$properties_col:=New collection()


$properties_col.push(New object("property";"bgColor";"formula";"SectionBgColor"))
$properties_col.push(New object("property";"borderColor";"formula";"SectionBorderColor"))
$properties_col.push(New object("property";"borderSize";"formula";"SectionBorderSize"))
$properties_col.push(New object("property";"fontColor";"formula";"SectionFontColor"))
$properties_col.push(New object("property";"fontName";"formula";"SectionFontName"))
$properties_col.push(New object("property";"fontSize";"formula";"SectionFontSize"))
$properties_col.push(New object("property";"fontStyle";"formula";"SectionFontStyle"))
$properties_col.push(New object("property";"pictureOpacity";"formula";"PictureOpacity"))
$properties_col.push(New object("property";"replacingColor";"formula";"ReplacingColor"))



$result:=$properties_col
