//%attributes = {"invisible":true}
  // AJUI_BC_GetSetModel ({  $model } ) -> return
  //
  // $1 : (text) (optional) model name
  // $0 : (text) (return) current model name
  //
  // Getter and setter for the breadcrumb model to use

If (False:C215)
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


C_TEXT:C284($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.global.model
Else 
	This:C1470.breadCrumb.global.model:=$1
End if 
