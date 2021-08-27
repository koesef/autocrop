#Inverts .tif files from scanner in RGB space, onto new folder "inverted". Maintains file names and originals.
$outputExtension = ".tif"
$outputDirName = "processed"
$inputBaseName = Get-ChildItem -File | Where-Object {$_.Name -like "*$outputExtension"} | Select-Object -expand BaseName  
$currentPath = Get-Location | Select-Object -expand Path

New-Item -ItemType directory -Path $outputDirName
$outputPath = $currentPath+'\'+$outputDirName+'\'

$threshLow = "76%"
$threshHigh = "97%"

#Threshold whites (OK)
$inputBaseName | ForEach-Object {&magick.exe convert $_$outputExtension -channel B -separate -threshold $threshHigh $outputPath$_'_threshWhite'$outputExtension}
#Threshold blacks
$inputBaseName | ForEach-Object {&magick.exe convert $_$outputExtension -channel B -separate -threshold $threshLow -negate $outputPath$_'_threshBlack'$outputExtension}

Pause