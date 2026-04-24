#################################################################
# Main Menu
#################################################################

Function Show-MainMenu{
   [CmdletBinding()]
   param(
   [string]$Title = 'Operating System Administration & Deployment - Main Menu',
   [string]$Question = 'What type of action do you need to do?' 
   )
cls

       $os = Get-CimInstance -ClassName Win32_OperatingSystem
       $PCName = "$env:computername"
       $OSVerison = $($os.Version)
       $UBR = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name UBR).UBR
       $FullOS = $($os.Caption)
       $OSBuild = $($os.Version) + "." + $UBR
       $DisplayVersion = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name DisplayVersion).DisplayVersion
       $EditionID = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name EditionID).EditionID
       $CompleteOSInfo = "$FullOS" + " $OSBuild" + " $DisplayVersion"
       $EdgeEXE = Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe' "(default)"
       $EdgeBrowser = (Get-Item $EdgeEXE).VersionInfo.ProductVersion

       $IP1 = (Get-NetIpaddress | Where-Object { $_.AddressFamily -eq "IPv4" -and $_.InterfaceAlias -eq "Ethernet" -and $_.PrefixLength -eq "24"}).IPAddress
       $IP2 = (Get-NetIpaddress | Where-Object { $_.AddressFamily -eq "IPv4" -and $_.InterfaceAlias -eq "Ethernet 2" -and $_.PrefixLength -eq "24"}).IPAddress
       $IP3 = (Get-NetIpaddress | Where-Object { $_.AddressFamily -eq "IPv4" -and $_.InterfaceAlias -eq "WiFi" -and $_.PrefixLength -eq "24"}).IPAddress
       $NetName = (Get-NetconnectionProfile).Name
       $GatewayDNS = (Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName $env:computername).DefaultIPGateway
       $ExternalIP = (Invoke-WebRequest -uri "https://api.ipify.org/").Content
       
       
       $Baseboard1 = (Get-CimInstance -ClassName Win32_Baseboard).Manufacturer
       $Baseboard2 = (Get-CimInstance -ClassName Win32_Baseboard).Product
       $CPU = (Get-CimInstance -Class Win32_Processor -ComputerName "$env:computername").Name
       $RAM = (Get-CimInstance -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).sum/1gb
       $PCManufacturer = (Get-CimInstance -ClassName Win32_ComputerSystem).Manufacturer
       $BIOS1 = (Get-CimInstance -ClassName Win32_BIOS).Manufacturer
       $BIOS2 = (Get-CimInstance -ClassName Win32_BIOS).SMBIOSBIOSVersion
       $CheckUEFIBoot = [System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI PK).bytes) -match "DO NOT TRUST|DO NOT SHIP"
       
       Write-Host
       Write-Host         "Running Computer Info:" -ForegroundColor Green 
       Write-Verbose "System Hostname: $PCName" -Verbose
       Write-Verbose "Running Operating System: $CompleteOSInfo" -Verbose  
       Write-Verbose "Operating System: $FullOS" -Verbose 
       Write-Verbose "Build Number: $OSBuild" -Verbose 
       Write-Verbose "Display Version: $DisplayVersion" -Verbose
       Write-Verbose "OS Edition: $EditionID" -Verbose 
       Write-Verbose "MS Edge Chromium Version: $EdgeBrowser" -Verbose 

       Write-Host 
       Write-Host         "System Hardware Info:" -ForegroundColor Green 
       Write-Verbose "System Hostname: $PCName" -Verbose
       Write-Verbose "Processor: $CPU" -Verbose
       Write-Verbose "System Memory: $RAM GB" -Verbose
       Write-Verbose "Motherboard: $Baseboard1 $Baseboard2" -Verbose
       Write-Verbose "Manufacturer: $PCManufacturer" -Verbose
       Write-Verbose "System BIOS: $BIOS1 $BIOS2" -Verbose
      If($CheckUEFIBoot -eq $false){
       Write-Host "Great news - $env:computername using $Baseboard1 $Baseboard2 is NOT affected by PKFail security vulneralbility" -ForegroundColor DarkBlue -BackgroundColor White
    }
       ElseIf($CheckUEFIBoot -eq $true){
       Write-Host "Bad news - $env:computername using $Baseboard1 $Baseboard2 IS affected by PKFail security vulneralbility" -ForegroundColor DarkRed -BackgroundColor White
    }
       
       Write-Host 
       Write-Host         "Network Connection Info:" -ForegroundColor Green 
       Write-Verbose "System Hostname: $PCName" -Verbose
       Write-Verbose "System IP Address 1: $IP1" -Verbose
       Write-Verbose "System IP Address 2: $IP2" -Verbose
       Write-Verbose "System IP Address 3: $IP3" -Verbose
       Write-Verbose "Network Name: $NetName" -Verbose
       Write-Verbose "System Gateway/DNS Server: $GatewayDNS" -Verbose
       Write-Verbose "WAN or External IP Address: $ExternalIP" -Verbose
      
Write-Host
Write-Host "Hello, $env:username..." -ForegroundColor Cyan 
Write-Host
$Date = Get-Date
Write-Host "Today is:" "$Date"
Write-Host
Write-Verbose "Your user profile is located at $env:userprofile" -Verbose
Write-Host
Write-Host 
Write-Host '                                                                              ' -BackgroundColor White                                                              
Write-Host ' This Git Hub-based deployment scripting solution allows the user to perform: ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Domain User and Computer Administration                                ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Local PC User Administration                                           ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Install OS Mandatory System Software                                   ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Install PowerShell 5.1 and 7.x Modules                                 ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Scripted Install of multiple types of software configurations          ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Import of Registry Entries                                             ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Set-up Custom Windows 11 ONLY based Start Menu                         ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Configure an OSDCloud bootable USB Stick or ISO File                   ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Run OSD Builder to create an up to date OS ISO file                    ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Debloat the OS                                                         ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Install Client and Server OS Roles                                     ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - Download Windows Client and Server ISO files                           ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '     - File inventory of Local PC or a Network Attached Storage Devices       ' -ForegroundColor DarkBlue -BackgroundColor White
Write-Host '                                                                              ' -BackgroundColor White
pause
Clear-Host

Write-Host "======= $Title ======"
Write-Host " 1. Fedora Linux - Download"
Write-Host " 2. Kali Linux - Download"
Write-Host " 3. Ubuntu Linux Desktop - Download"
Write-Host " 4. Windows 11 24H2"
Write-Host " 5. Windows 11 25H2"
Write-Host " 6. Windows 11 26H1 for ARM64 Snapdragon ONLY"
Write-Host " 7. Windows 11 26H2"
Write-Host " 8. Windows 11 27H2"
Write-Host " 9. Return to Main Menu"


do 
{
  $selection = Read-Host 'Please choose an option'
  switch($selection)
  {
  '1'{  cls
        $FedoraLinuxISO = Invoke-WebRequest("https://github.com/osdcloudcline/OS-Downloads/raw/refs/heads/main/Client%20OS/Linux/Fedora%20Linux/FedoraLinux.ps1")
        Invoke-Expression $($FedoraLinuxISO.Content)
      }
  '2' { cls
        $KaliLinuxISO = Invoke-WebRequest ("https://github.com/osdcloudcline/OS-Downloads/raw/refs/heads/main/Client%20OS/Linux/Kali%20Linux/KaliLinux.ps1")
        Invoke-Expression $($KaliLinuxISO.Content)
        }
  '3'{  cls
        $UbuntuDesktopISO = Invoke-WebRequest("https://github.com/osdcloudcline/OS-Downloads/raw/refs/heads/main/Client%20OS/Linux/Ubuntu/version%20Desktop%2024.0.4%20LTS/UbuntuDesktop2404LTS.ps1")
        Invoke-Expression $($UbuntuDesktopISO.Content)
      }
  '4' { cls
        $Win1124H2 = Invoke-WebRequest ("")
        Invoke-Expression $($Win1124H2.Content)
        }
 '5' { cls
        $Win1125H2 = Invoke-WebRequest ("")
        Invoke-Expression $($Win1125H2.Content)
        }
'6' { cls
        $Win1126H1 = Invoke-WebRequest ("")
        Invoke-Expression $($Win1126H1.Content)
        }
'7' { cls
        $Win1126H2 = Invoke-WebRequest ("")
        Invoke-Expression $($Win1126H2.Content)
        }
'8' { cls
        $Win1127H2 = Invoke-WebRequest ("")
        Invoke-Expression $($Win1127H2.Content)
        }
        }
       until ($selection -eq '6'){exit}
    }  
