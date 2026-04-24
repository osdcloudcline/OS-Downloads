$iso = "https://cdimage.kali.org/kali-2026.1/kali-linux-2026.1-installer-amd64.iso"


$destination = "C:\OS\ISOs\Linux\Kali Linux"

$name = "Kali Linux 2026.1"



Import-Module -Name OSD -Force

Write-Host "Processing download: $name ISO" -ForegroundColor Cyan
Write-Host
Save-WebFile -SourceUrl $iso -DestinationDirectory $destination
Write-Host
Write-Host "Completed download: $name ISO" -ForegroundColor Green
Write-Host
