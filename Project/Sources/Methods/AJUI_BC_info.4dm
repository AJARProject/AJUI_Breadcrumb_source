//%attributes = {"invisible":true,"shared":true,"lang":"en"}
  // AJUI_BC_info ( ) -> return
  //
  // $0 : (text) (return) return current version
  //
  // This method return the current version of AJUI BreadCrumb

If (False:C215)
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


C_TEXT:C284($0)

$version_t:="1.2.0-Build32"  // Wed, 22 Jan 2020 08:57:51 GMT

$0:="AJUI BreadCrumb (v18): "+$version_t