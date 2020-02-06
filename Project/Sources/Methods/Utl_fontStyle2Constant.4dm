//%attributes = {"invisible":true}
  // Utl_fontStyle2Constant ( $fontStyle ) -> return
  //
  // $1 : (text) font style
  // $2 : (longint) (return) constant
  //
  // This method will return the value of the constant linked to the font style

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 16.09.19, 15:11:40
	  // ----------------------------------------------------
	  // Method: Utl_fontStyle2Constant
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$fontStyleText;$substring)
C_LONGINT:C283($0;$fontStyleLongint;$position)
$fontStyleText:=$1

Repeat 
	$position:=Position:C15(",";$fontStyleText)
	
	If ($position<=0)
		$substring:=$fontStyleText
	Else 
		$substring:=Substring:C12($fontStyleText;1;$position-1)
		$fontStyleText:=Delete string:C232($fontStyleText;1;$position)
	End if 
	
	Case of 
		: ($substring="none") | ($substring="")
			$fontStyleLongint:=$fontStyleLongint+0
		: ($substring="Bold")
			$fontStyleLongint:=$fontStyleLongint+1
		: ($substring="Italic")
			$fontStyleLongint:=$fontStyleLongint+2
		: ($substring="Underline")
			$fontStyleLongint:=$fontStyleLongint+4
		: ($substring="Strikethrough")
			$fontStyleLongint:=$fontStyleLongint+8
		Else 
			$fontStyleLongint:=$fontStyleLongint+0
	End case 
Until ($position<=0)

$0:=$fontStyleLongint