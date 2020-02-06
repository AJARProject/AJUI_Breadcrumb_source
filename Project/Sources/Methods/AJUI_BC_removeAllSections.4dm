//%attributes = {"invisible":true}
  // AJUI_BC_removeAllSections (  ) 
  //
  //
  // This method removes all the sections

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 09.10.19, 14:31:29
	  // ----------------------------------------------------
	  // Method: AJUI_BC_removeAllSections
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

This:C1470.breadCrumb.sectionList.remove(0;This:C1470.breadCrumb.sectionList.count())
