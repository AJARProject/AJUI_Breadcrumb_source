//%attributes = {"invisible":true}
  // AJUI_BC_GetSetDynamicSize ({  $activate } ) -> return
  //
  // $1 : (boolean) (optional) activate/inacivate
  // $0 : (boolean) (return) dynamic size activated/inactivated
  //
  // Getter and setter to activate/inactivate the dynamic sizing of the Breadcrumb box
#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
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


If (Count parameters=0)
	$result:=This.breadCrumb.box.dynamicSize
Else 
	This.breadCrumb.box.dynamicSize:=$param1
End if 

