//%attributes = {"invisible":true}
  // AJUI_BC_borderArrowH ( $arrowWidth ; $sectionHeight ; $sectionBorderSize ) -> return
  //
  // $1 : (real) arrow width
  // $2 : (real) section height
  // $3 : (real) section border size
  // $0 : (real) (return) border size horizontal
  //
  // This method will calculate the border size of the angle of the arrow

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 27.09.19, 10:28:52
	  // ----------------------------------------------------
	  // Method: AJUI_BC_borderArrowH
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_REAL:C285($1;$2;$3;$arrowWidth;$sectionHeight;$sectionBorderSize)
C_REAL:C285($0;$offset)
C_REAL:C285($alphaAngle;$cos)

$arrowWidth:=$1

$sectionHeight:=$2
$sectionBorderSize:=$3

$alphaAngle:=Radian:K30:3*Tan:C19(($arrowWidth/$sectionHeight)/2)

$cos:=Cos:C18(Degree:K30:2*$alphaAngle)

$offset:=$cos*$sectionBorderSize

$0:=$offset

