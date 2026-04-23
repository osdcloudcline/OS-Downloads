$iso = "https://releases.ubuntu.com/24.04.4/ubuntu-24.04.4-desktop-amd64.iso"

$destination = "C:\OS\ISOs\Ubuntu/Destop/24.0.4"

$name = "Ubuntu Desktop 24.0.4 LTS"

Import-Module -Name OSD -Force

Write-Host "Processing download: $name ISO" -ForegroundColor Cyan
Write-Host
Save-WebFile -SourceUrl $iso -DestinationDirectory $destination
Write-Host
Write-Host "Completed download: $name ISO" -ForegroundColor Green
