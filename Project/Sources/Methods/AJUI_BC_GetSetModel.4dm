//%attributes = {"invisible":true}
  // AJUI_BC_GetSetModel ({  $model } ) -> return
  //
  // $1 : (text) (optional) model name
  // $0 : (text) (return) current model name
  //
  // Getter and setter for the breadcrumb model to use

#DECLARE($param1 : Text) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 09:18:10
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetModel
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



If (Count parameters=0)
	$result:=This.breadCrumb.global.model
Else 
	This.breadCrumb.global.model:=$param1
End if 
