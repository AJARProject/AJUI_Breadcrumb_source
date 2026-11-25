//%attributes = {}
// ----------------------------------------------------
// User name (OS): Gary Criblez
// Date and time: 26.06.19, 16:43:41
// ----------------------------------------------------
// Method: AJUI_BuildComponent
// Description
// This method generates a version of the component
//
// Parameters
// ----------------------------------------------------
// Copyrights (C) AJAR SA - 2019

#DECLARE($param1 : Text)

var $projectMethodPath_t; $code_t; $method : Text
var $positionStart_l : Integer
var $positionEnd_l : Integer
var $previousReleaseNumber_t : Text
var $buildRelease_t0 : Text
var $positionStartNumber_l : Integer
var $lengthNumber_l : Integer
var $buildRelease_t : Text
var $buildRelease_l : Real
var $releaseNumber_t : Text
var $path_t : Text

$method:=$param1

$projectMethodPath_t:=METHOD Get path(Path project method; $method; *)
METHOD GET CODE($projectMethodPath_t; $code_t; *)  // code of the method "tip_release"

// 4D 21 R4: the version line is now "x.y.z"  // date (4D 21 R4), without "+Build" nor "GMT".
// The automatic +Build increment only runs when the old format is present; otherwise the
// version is left untouched and only BUILD APPLICATION runs (Settings/buildApp.4DSettings).
If ((Position("+Build"; $code_t)>0) & (Position("GMT\r"; $code_t)>0))
	$positionStart_l:=Position("$version_t:="; $code_t)
	$positionStart_l:=Position("\""; $code_t; $positionStart_l+1)
	$positionEnd_l:=Position("GMT\r"; $code_t; $positionStart_l+1)-$positionStart_l
	
	$previousReleaseNumber_t:=Substring($code_t; $positionStart_l; $positionEnd_l+3)  // "1.0.0+Build52017"  // 2016-02-01T23:00:00Z
	
	
	$buildRelease_t0:=Substring($previousReleaseNumber_t; Position("+Build"; $previousReleaseNumber_t))  //+Build52017"  // 2016-02-01T23:00:00Z
	$positionStartNumber_l:=Position("d"; $buildRelease_t0)
	$lengthNumber_l:=Position("\""; $buildRelease_t0)-$positionStartNumber_l
	$buildRelease_t:=Substring($buildRelease_t0; $positionStartNumber_l+1; $lengthNumber_l)
	$buildRelease_l:=Num(Replace string($buildRelease_t; "+Build"; ""))+1
	
	
	$releaseNumber_t:=Substring($previousReleaseNumber_t; 1; Position("+Build"; $previousReleaseNumber_t)-1)  //1.0.0
	$releaseNumber_t:=$releaseNumber_t+"+Build"+String($buildRelease_l)  // 1.0.0+Build32
	$releaseNumber_t:=$releaseNumber_t+"\""+"// "+String(Current date; Date RFC 1123; Current time)  //
	
	$code_t:=Replace string($code_t; $previousReleaseNumber_t; $releaseNumber_t)
	
	
	METHOD SET CODE($projectMethodPath_t; $code_t; *)
End if


If (Application type=4D Remote mode)
	
Else 
	$path_t:=Get 4D folder(Database folder; *)+"Settings"+Folder separator+"buildApp.4DSettings"
	BUILD APPLICATION($path_t)
End if 



If (OK=1)
	ALERT("Build OK")
End if 

BEEP

