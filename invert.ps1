#Inverts .tif files from scanner in RGB space, onto new folder "inverted". Maintains file names and originals.
$outputExtension = ".tif"
$outputDirName = "inverted"
$inputBaseName = Get-ChildItem -File | Where-Object {$_.Name -like "*$outputExtension"} | Select-Object -expand Name  
$currentPath = Get-Location | Select-Object -expand Path

New-Item -ItemType directory -Path $outputDirName
$outputPath = $currentPath+'\'+$outputDirName+'\'

$inputBaseName | ForEach-Object {&magick.exe convert $_ -channel RGB -negate $outputPath$_}