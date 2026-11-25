//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDivFontName ( { $name } ) -> return
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current font name
  //
  // Getter and setter for the divider font name

#DECLARE($param1 : Text) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 15:16:35
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDivFontName
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



If (Count parameters=0)
	$result:=This.breadCrumb.divider.font.name
Else 
	This.breadCrumb.divider.font.name:=$param1
End if 
