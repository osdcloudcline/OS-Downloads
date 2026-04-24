$iso1 = "https://download.fedoraproject.org/pub/fedora/linux/releases/43/Workstation/x86_64/iso/Fedora-Workstation-Live-43-1.6.x86_64.iso"
$iso2 = "https://download.fedoraproject.org/pub/fedora/linux/releases/43/KDE/x86_64/iso/Fedora-KDE-Desktop-Live-43-1.6.x86_64.iso"

$destination = "C:\OS\ISOs\Linux\Fedora"

$name1 = "Fedora Linux Workstation 43.0"
$name2 = "Fedora Linux KDE Desktop 43.0"


Import-Module -Name OSD -Force

Write-Host "Processing download: $name1 ISO" -ForegroundColor Cyan
Write-Host
Save-WebFile -SourceUrl $iso1 -DestinationDirectory $destination
Write-Host
Write-Host "Completed download: $name1 ISO" -ForegroundColor Green
Write-Host
Write-Host "Processing download: $name2 ISO" -ForegroundColor Cyan
Write-Host
Save-WebFile -SourceUrl $iso2 -DestinationDirectory $destination
Write-Host
Write-Host "Completed download: $name2 ISO" -ForegroundColor Green
