//%attributes = {"invisible":true}
  // AJUI_BC_GetSetBoxHeight ( {  $height } ) -> return
  //
  // $1 : (longint) (optional) height 
  // $0 : (longint) (return) current box height
  //
  // Getter and setter for the box height

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 18.09.19, 14:16:08
	  // ----------------------------------------------------
	  // Method: AJUI_BC_GetSetBoxHeight
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Count parameters=0)
	$result:=This.breadCrumb.box.height
Else 
	This.breadCrumb.box.height:=$param1
End if 
