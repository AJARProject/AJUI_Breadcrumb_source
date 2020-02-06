//%attributes = {"invisible":true}
  // AJUI_BC_checkValidCallback ( $callback  ) -> return
  //
  // $1 : (text) callback name
  // $0 : (boolean) (return) ok to execute method
  //
  // Check if the callback exist and share the callback if not shared

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 28.10.19, 16:27:58
	  // ----------------------------------------------------
	  // Method: AJUI_BC_checkValidCallback
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$callback;$method)
C_BOOLEAN:C305($0;$launchExec)
C_OBJECT:C1216($section)

$callback:=$1
If ($callback="")
	$launchExec:=False:C215
Else 
	ARRAY TEXT:C222($_methods;0)
	METHOD GET NAMES:C1166($_methods;$callback;*)
	
	  //check method exist
	If (Size of array:C274($_methods)=0)
		CONFIRM:C162("Callback method: "+$callback+" not found, Do you want to create it ?";"Yes";"No")
		If (OK=1)
			$launchExec:=True:C214
			$method:="C_OBJECT($1)"
			METHOD SET CODE:C1194($callback;$method;*)
		Else 
			$launchExec:=False:C215
		End if 
	Else 
		$launchExec:=True:C214
	End if 
	
	  //check shared
	If ($launchExec)
		If (Not:C34(METHOD Get attribute:C1169($callback;Attribute shared:K72:10;*)))
			METHOD SET ATTRIBUTE:C1192($callback;Attribute shared:K72:10;True:C214;*)
		End if 
	End if 
End if 

$0:=$launchExec