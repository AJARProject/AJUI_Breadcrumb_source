//%attributes = {"invisible":true}
  // AJUI_BC_borderArrowH ( $arrowWidth ; $sectionHeight ; $sectionBorderSize ) -> return
  //
  // $1 : (real) arrow width
  // $2 : (real) section height
  // $3 : (real) section border size
  // $0 : (real) (return) border size horizontal
  //
  // This method will calculate the border size of the angle of the arrow

#DECLARE($param1 : Real; $param2 : Real; $param3 : Real) -> $result : Real

var $arrowWidth; $sectionHeight; $sectionBorderSize; $offset; $alphaAngle; $cos : Real

If (False)
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


$arrowWidth:=$param1

$sectionHeight:=$param2
$sectionBorderSize:=$param3

$alphaAngle:=Radian*Tan(($arrowWidth/$sectionHeight)/2)

$cos:=Cos(Degree*$alphaAngle)

$offset:=$cos*$sectionBorderSize

$result:=$offset

