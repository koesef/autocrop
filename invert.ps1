#worx
$outputExtension = ".tif"
$inputBaseName = dir -File | select -expand BaseName
$currentPath = Get-Location | select -expand Path

$toExecute = 'magick.exe'
$toExecute_Mode = 'convert'
$toExecute_Mode2 = '-channel RGB -negate'

$dirname = "inverted"
mkdir $dirname
$outputPath = $currentPath+'\'+$dirname+'\'

#convert input.png -channel RGB -negate output.png
$inputBaseName | ForEach-Object {&magick.exe convert $_$outputExtension -channel RGB -negate $outputPath$_$outputExtension}