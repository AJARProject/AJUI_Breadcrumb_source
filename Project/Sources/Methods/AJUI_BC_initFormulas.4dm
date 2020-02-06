//%attributes = {"invisible":true}
  // AJUI_BC_initFormulas ( $instance_obj ) 
  //
  // $1 : (object) instance
  //
  // Init formulas of the instance

If (False:C215)
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

C_OBJECT:C1216($0;$1;$instance_obj)

$instance_obj:=$1

  // ----------------------------------------------------
  // Function
  // ----------------------------------------------------
$instance_obj.Draw:=Formula:C1597(AJUI_BC_draw )
$instance_obj.Export:=Formula:C1597(AJUI_BC_templateExport )
$instance_obj.ResetState:=Formula:C1597(AJUI_BC_resetState )
$instance_obj.ResetAllStates:=Formula:C1597(AJUI_BC_resetAllStates )
$instance_obj.RemovePropertyException:=Formula:C1597(AJUI_BC_removePropException )
$instance_obj.RemovePropertyExceptions:=Formula:C1597(AJUI_BC_removePropExceptions )
$instance_obj.RemovePropertyTypeExceptions:=Formula:C1597(AJUI_BC_removePropTypeException )
$instance_obj.Show:=Formula:C1597(AJUI_BC_show )
$instance_obj.Hide:=Formula:C1597(AJUI_BC_hide )
$instance_obj.RemoveCurrent:=Formula:C1597(AJUI_BC_removeCurrent )


  // ----------------------------------------------------
  // GLOBAL
  // ----------------------------------------------------
$instance_obj.Name:=Formula:C1597(AJUI_BC_GetSetName )
$instance_obj.Model:=Formula:C1597(AJUI_BC_GetSetModel )
$instance_obj.RTL:=Formula:C1597(AJUI_BC_GetSetRTL )
$instance_obj.MaxSectionToDraw:=Formula:C1597(AJUI_BC_GetSetMaxSectionToDraw )

  // ----------------------------------------------------
  // BOX
  // ----------------------------------------------------
$instance_obj.IsDynamicSize:=Formula:C1597(AJUI_BC_GetSetDynamicSize )
$instance_obj.IsBoxCentered:=Formula:C1597(AJUI_BC_GetSetBoxCentered )
$instance_obj.BoxHeight:=Formula:C1597(AJUI_BC_GetSetBoxHeight )
$instance_obj.BoxWidth:=Formula:C1597(AJUI_BC_GetSetBoxWidth )
$instance_obj.BgColor:=Formula:C1597(AJUI_BC_GetSetBgColor )
$instance_obj.CornerRadiusLeft:=Formula:C1597(AJUI_BC_GetSetCornerRadiusLeft )
$instance_obj.CornerRadiusRight:=Formula:C1597(AJUI_BC_GetSetCornerRadiusRight )
$instance_obj.BorderColor:=Formula:C1597(AJUI_BC_GetSetBorderColor )
$instance_obj.BorderSize:=Formula:C1597(AJUI_BC_GetSetBorderSize )
$instance_obj.PaddingH:=Formula:C1597(AJUI_BC_GetSetPaddingH )
$instance_obj.PaddingV:=Formula:C1597(AJUI_BC_GetSetPaddingV )

  // ----------------------------------------------------
  // DIVIDER
  // ----------------------------------------------------
$instance_obj.DividerMargin:=Formula:C1597(AJUI_BC_GetSetDivMargin )
$instance_obj.Divider:=Formula:C1597(AJUI_BC_GetSetDivString )
$instance_obj.DividerFontColor:=Formula:C1597(AJUI_BC_GetSetDivFontColor )
$instance_obj.DividerFontName:=Formula:C1597(AJUI_BC_GetSetDivFontName )
$instance_obj.DividerFontSize:=Formula:C1597(AJUI_BC_GetSetDivFontSize )
$instance_obj.DividerFontStyle:=Formula:C1597(AJUI_BC_GetSetDivFontStyle )
$instance_obj.ArrowWidth:=Formula:C1597(AJUI_BC_GetSetArrowWidth )
$instance_obj.ArrowBorderSize:=Formula:C1597(AJUI_BC_GetSetArrowBorderSize )
$instance_obj.ArrowColor:=Formula:C1597(AJUI_BC_GetSetArrowColor )
$instance_obj.IsLastSectionWithArrow:=Formula:C1597(AJUI_BC_GetSetLastSectWithArrow )
$instance_obj.IsFirstSectionWithArrow:=Formula:C1597(AJUI_BC_GetSetFirstSectWithArro )
$instance_obj.ArrowPaddingH:=Formula:C1597(AJUI_BC_GetSetDividerPaddingH )

  // ----------------------------------------------------
  // SECTION LIST
  // ----------------------------------------------------
$instance_obj.AddSection:=Formula:C1597(AJUI_BC_addSection )
$instance_obj.UpdateSection:=Formula:C1597(AJUI_BC_updateSection )
$instance_obj.RemoveSection:=Formula:C1597(AJUI_BC_removeSection )
$instance_obj.SetCurrentSection:=Formula:C1597(AJUI_BC_setCurrentSection )
$instance_obj.GetNextPosition:=Formula:C1597(AJUI_BC_checkNextPosition )
$instance_obj.RemoveAllSections:=Formula:C1597(AJUI_BC_removeAllSections )

  // ----------------------------------------------------
  // SECTION TYPES
  // ----------------------------------------------------
$instance_obj.SectionBgColor:=Formula:C1597(AJUI_BC_GetSetSectionBgColor )
$instance_obj.SectionFontColor:=Formula:C1597(AJUI_BC_GetSetSectionFontColor )
$instance_obj.SectionFontSize:=Formula:C1597(AJUI_BC_GetSetSectionFontSize )
$instance_obj.SectionFontName:=Formula:C1597(AJUI_BC_GetSetSectionFontName )
$instance_obj.SectionFontStyle:=Formula:C1597(AJUI_BC_GetSetSectionFontStyle )
$instance_obj.ReplacingColor:=Formula:C1597(AJUI_BC_GetSetReplacingColor )
$instance_obj.SectionBorderSize:=Formula:C1597(AJUI_BC_GetSetSectionBorderSize )
$instance_obj.SectionBorderColor:=Formula:C1597(AJUI_BC_GetSetSectBorderColor )
$instance_obj.PictureOpacity:=Formula:C1597(AJUI_BC_GetSetPictureOpacity )


$0:=$instance_obj