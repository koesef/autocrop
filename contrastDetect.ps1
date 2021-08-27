#Inverts .tif files from scanner in RGB space, onto new folder "inverted". Maintains file names and originals.
$outputExtension = ".tif"
$outputDirName = "processed"
$inputBaseName = Get-ChildItem -File | Where-Object {$_.Name -like "*$outputExtension"} | Select-Object -expand BaseName  
$currentPath = Get-Location | Select-Object -expand Path

New-Item -ItemType directory -Path $outputDirName
$outputPath = $currentPath+'\'+$outputDirName+'\'

$threshLow = "76%"
$threshHigh = "97%" #not used

#Threshold whites (OK) not neccessary! black threshold does detect the rectangle outline pretty well.
#$inputBaseName | ForEach-Object {&magick.exe convert $_$outputExtension -channel B -separate -threshold $threshHigh $outputPath$_'_threshWhite'$outputExtension}

#Threshold blacks (meh but sure) (!!)
#$inputBaseName | ForEach-Object {&magick.exe convert $_$outputExtension -channel B -separate -threshold $threshLow -negate $outputPath$_'_threshBlack.png'}

#run canny edge detect
$inputBaseName | ForEach-Object {&magick.exe convert $_$outputExtension -canny 15x1+20%+20% $outputPath$_'_canny.png'}

Pause