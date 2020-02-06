//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDynamicSize ({  $activate } ) -> return
  //
  // $1 : (boolean) (optional) activate/inacivate
  // $0 : (boolean) (return) dynamic size activated/inactivated
  //
  // Getter and setter to activate/inactivate the dynamic sizing of the Breadcrumb box
If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:12:53
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetDynamicSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($1;$0)

If (Count parameters:C259=0)
	$0:=This:C1470.breadCrumb.box.dynamicSize
Else 
	This:C1470.breadCrumb.box.dynamicSize:=$1
End if 

