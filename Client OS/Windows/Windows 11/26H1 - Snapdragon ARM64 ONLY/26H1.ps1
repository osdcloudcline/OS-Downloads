Get-Date

Install-Module -Name OSD -Force -AllowClobber -SkipPublisherCheck
Import-Module -Name OSD -Force

################### ISO Download, Extraction and Creation Variables region ##########################

$ZIPDestination = "$env:userprofile\Downloads\OS\Windows11\26H1"

$Windows1125H2URL = "https://github.com/osdcloudcline/OS-Downloads/raw/refs/heads/main/Client%20OS/Windows/Windows%2011/25H2/26200.8313_amd64_en-us_multi_509ef3a9_convert_virtual.zip"

$ExtractionLocation = $ZIPDestination

$Windows11Downloader = "$ZIPDestination\uup_download_windows.cmd"

########################################################################################

Write-Host "Downloading Windows 11 26H1 ZIP File..." -ForegroundColor Cyan 

Save-WebFile -SourceUrl $Windows1125H2URL -DestinationDirectory $ZIPDestination

pause 

Write-Host "Expanding Windows 11 26H1 ZIP File..." -ForegroundColor Cyan 

Expand-Archive -Path "$ZIPDestination\26200.8313_amd64_en-us_multi_509ef3a9_convert_virtual.zip" -DestinationPath $ZIPDestination

pause

Write-Host
Write-Host "Downloading Windows 11 26H1 Build: 28000.1836..." -ForegroundColor Cyan 

Start-Process -FilePath $Windows11Downloader

pause

#######    Delete Items Variables region ########################

$binfolder = "$ZIPDestination\bin"
$Driversfolder = "$ZIPDestination\Drivers"
$filesfolder = "$ZIPDestination\files"
$UUPsfolder = "$ZIPDestination\UUPs"

#####################################################

Write-Host "Deleting Subfolders and Files Windows 11 26H1 Source Directory..." -ForegroundColor Cyan 

rd -Path "$binfolder" -Recurse -Force
rd -Path "$Driversfolder" -Recurse -Force
rd -Path "$filesfolder" -Recurse -Force
rd -Path "$UUPsfolder" -Recurse -Force

Remove-Item -Path "$ZIPDestination\*.log" -Recurse -Force
Remove-Item -Path "$ZIPDestination\*.ini" -Recurse -Force
Remove-Item -Path "$ZIPDestination\*.cmd" -Recurse -Force
Remove-Item -Path "$ZIPDestination\*.txt" -Recurse -Force
Remove-Item -Path "$ZIPDestination\*.html" -Recurse -Force
Remove-Item -Path "$ZIPDestination\*.md" -Recurse -Force
Remove-Item -Path "$ZIPDestination\*.sh" -Recurse -Force
Remove-Item -Path "$ZIPDestination\*.zip" -Recurse -Force

Write-Host "Excess Files and folders have been successfully deleted..." -ForegroundColor Green 
