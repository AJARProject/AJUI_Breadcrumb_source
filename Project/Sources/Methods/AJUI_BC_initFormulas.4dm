//%attributes = {"invisible":true}
  // AJUI_BC_initFormulas ( $instance_obj ) 
  //
  // $1 : (object) instance
  //
  // Init formulas of the instance

#DECLARE($param1 : Object) -> $result : Object

var $instance_obj : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 12.09.19, 09:09:45
	  // ----------------------------------------------------
	  // Method: AJUI_BC_initFormulas
	  // Description
	  // 
	  // IN CASE OF MODIFICATION : EDIT THE AJUI_BC_PropertyCol method if necessary
	  //
	  // ----------------------------------------------------
End if 


$instance_obj:=$param1

  // ----------------------------------------------------
  // Function
  // ----------------------------------------------------
$instance_obj.Draw:=Formula(AJUI_BC_draw )
$instance_obj.Export:=Formula(AJUI_BC_templateExport )
$instance_obj.ResetState:=Formula(AJUI_BC_resetState )
$instance_obj.ResetAllStates:=Formula(AJUI_BC_resetAllStates )
$instance_obj.RemovePropertyException:=Formula(AJUI_BC_removePropException )
$instance_obj.RemovePropertyExceptions:=Formula(AJUI_BC_removePropExceptions )
$instance_obj.RemovePropertyTypeExceptions:=Formula(AJUI_BC_removePropTypeException )
$instance_obj.Show:=Formula(AJUI_BC_show )
$instance_obj.Hide:=Formula(AJUI_BC_hide )
$instance_obj.RemoveCurrent:=Formula(AJUI_BC_removeCurrent )


  // ----------------------------------------------------
  // GLOBAL
  // ----------------------------------------------------
$instance_obj.Name:=Formula(AJUI_BC_GetSetName )
$instance_obj.Model:=Formula(AJUI_BC_GetSetModel )
$instance_obj.RTL:=Formula(AJUI_BC_GetSetRTL )
$instance_obj.MaxSectionToDraw:=Formula(AJUI_BC_GetSetMaxSectionToDraw )

  // ----------------------------------------------------
  // BOX
  // ----------------------------------------------------
$instance_obj.IsDynamicSize:=Formula(AJUI_BC_GetSetDynamicSize )
$instance_obj.IsBoxCentered:=Formula(AJUI_BC_GetSetBoxCentered )
$instance_obj.BoxHeight:=Formula(AJUI_BC_GetSetBoxHeight )
$instance_obj.BoxWidth:=Formula(AJUI_BC_GetSetBoxWidth )
$instance_obj.BgColor:=Formula(AJUI_BC_GetSetBgColor )
$instance_obj.CornerRadiusLeft:=Formula(AJUI_BC_GetSetCornerRadiusLeft )
$instance_obj.CornerRadiusRight:=Formula(AJUI_BC_GetSetCornerRadiusRight )
$instance_obj.BorderColor:=Formula(AJUI_BC_GetSetBorderColor )
$instance_obj.BorderSize:=Formula(AJUI_BC_GetSetBorderSize )
$instance_obj.PaddingH:=Formula(AJUI_BC_GetSetPaddingH )
$instance_obj.PaddingV:=Formula(AJUI_BC_GetSetPaddingV )

  // ----------------------------------------------------
  // DIVIDER
  // ----------------------------------------------------
$instance_obj.DividerMargin:=Formula(AJUI_BC_GetSetDivMargin )
$instance_obj.Divider:=Formula(AJUI_BC_GetSetDivString )
$instance_obj.DividerFontColor:=Formula(AJUI_BC_GetSetDivFontColor )
$instance_obj.DividerFontName:=Formula(AJUI_BC_GetSetDivFontName )
$instance_obj.DividerFontSize:=Formula(AJUI_BC_GetSetDivFontSize )
$instance_obj.DividerFontStyle:=Formula(AJUI_BC_GetSetDivFontStyle )
$instance_obj.ArrowWidth:=Formula(AJUI_BC_GetSetArrowWidth )
$instance_obj.ArrowBorderSize:=Formula(AJUI_BC_GetSetArrowBorderSize )
$instance_obj.ArrowColor:=Formula(AJUI_BC_GetSetArrowColor )
$instance_obj.IsLastSectionWithArrow:=Formula(AJUI_BC_GetSetLastSectWithArrow )
$instance_obj.IsFirstSectionWithArrow:=Formula(AJUI_BC_GetSetFirstSectWithArro )
$instance_obj.ArrowPaddingH:=Formula(AJUI_BC_GetSetDividerPaddingH )

  // ----------------------------------------------------
  // SECTION LIST
  // ----------------------------------------------------
$instance_obj.AddSection:=Formula(AJUI_BC_addSection )
$instance_obj.UpdateSection:=Formula(AJUI_BC_updateSection )
$instance_obj.RemoveSection:=Formula(AJUI_BC_removeSection )
$instance_obj.SetCurrentSection:=Formula(AJUI_BC_setCurrentSection )
$instance_obj.GetNextPosition:=Formula(AJUI_BC_checkNextPosition )
$instance_obj.RemoveAllSections:=Formula(AJUI_BC_removeAllSections )

  // ----------------------------------------------------
  // SECTION TYPES
  // ----------------------------------------------------
$instance_obj.SectionBgColor:=Formula(AJUI_BC_GetSetSectionBgColor )
$instance_obj.SectionFontColor:=Formula(AJUI_BC_GetSetSectionFontColor )
$instance_obj.SectionFontSize:=Formula(AJUI_BC_GetSetSectionFontSize )
$instance_obj.SectionFontName:=Formula(AJUI_BC_GetSetSectionFontName )
$instance_obj.SectionFontStyle:=Formula(AJUI_BC_GetSetSectionFontStyle )
$instance_obj.ReplacingColor:=Formula(AJUI_BC_GetSetReplacingColor )
$instance_obj.SectionBorderSize:=Formula(AJUI_BC_GetSetSectionBorderSize )
$instance_obj.SectionBorderColor:=Formula(AJUI_BC_GetSetSectBorderColor )
$instance_obj.PictureOpacity:=Formula(AJUI_BC_GetSetPictureOpacity )


$result:=$instance_obj
