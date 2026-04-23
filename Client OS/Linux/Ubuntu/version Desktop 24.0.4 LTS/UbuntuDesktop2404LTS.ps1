$iso = "https://ubuntu.com/download/desktop/thank-you?version=24.04.4&architecture=amd64&lts=true"

$destination = "C:\OS\ISOs\Ubuntu/Destop/24.0.4"

$name = "Ubuntu Desktop 24.0.4 LTS"

Import-Module -Name OSD -Force

Write-Host "Processing download: $name ISO" -ForegroundColor Cyan
Write-Host
Save-WebFile -SourceUrl $iso -DestinationDirectory $destination
Write-Host
Write-Host "Completed download: $name ISO" -ForegroundColor Green
