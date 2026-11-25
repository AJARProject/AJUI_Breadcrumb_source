//%attributes = {"invisible":true,"shared":true,"lang":"en"}
// AJUI_BC_info ( ) -> return
//
// $0 : (text) (return) return current version
//
// This method return the current version of AJUI BreadCrumb

#DECLARE() -> $result : Text

var $version_t : Text

If (False)
	// ----------------------------------------------------
	// User name (OS): Gary Criblez
	// Date and time: 12.09.19, 16:19:45
	// ----------------------------------------------------
	// Method: AJUI_BC_info
	// Description
	// 
	//
	// ----------------------------------------------------
End if 



$version_t:="1.3.0"  // 25 Nov 2026 (4D 21 R4)

$result:="AJUI BreadCrumb (v21 R4): "+$version_t
