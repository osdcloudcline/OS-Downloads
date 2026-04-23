$iso = "https://linuxfreedom.com/linuxmint/linuxmint.com/stable/22.3/linuxmint-22.3-cinnamon-64bit.iso"

$destination = "C:\OS\ISOs\Linux\Mint"

$name = "Linux Mint 64-bit version 22.3 Cinnamon"

Import-Module -Name OSD -Force

Write-Host "Processing download: $name ISO" -ForegroundColor Cyan
Write-Host
Save-WebFile -SourceUrl $iso -DestinationDirectory $destination
Write-Host
Write-Host "Completed download: $name ISO" -ForegroundColor Green
