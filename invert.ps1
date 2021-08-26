#it works, for now
$outputExtension = ".tif"
$inputBaseName = Get-ChildItem -File | Select-Object -expand BaseName
$currentPath = Get-Location | Select-Object -expand Path

#Get-ChildItem -File | Where-Object {$_.Name -like "*.tif"} | Select-Object -expand Name  

# $toExecute = 'magick.exe'
# $toExecute_Mode = 'convert'
# $toExecute_Mode2 = '-channel RGB -negate'

$dirname = "inverted"
New-Item -ItemType directory -Path $dirname
$outputPath = $currentPath+'\'+$dirname+'\'

#convert input.png -channel RGB -negate output.png
$inputBaseName | ForEach-Object {&magick.exe convert $_$outputExtension -channel RGB -negate $outputPath$_$outputExtension}