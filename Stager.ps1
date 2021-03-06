# Name: Windows System Stager
# Version: V1RC1
# Author: Ryan Van Massenhoven

### Introduction ###
Write-Output "The Following will install all Essential Software"
Pause

### Install Software ###
# Github
winget install --id Github.GithubDesktop

# VS Code
winget install --id Microsoft.VisualStudioCode

# Google Chrome 
winget install --id Google.Chrome

# Parsec
winget install --id Parsec.Parsec

#Power Toys
winget install --id Microsoft.PowerToys

# SysInternals
winget install sysinternals

# Git CLI for Windows
winget install --id Git.Git

# WinSCP
winget install --id winscp.winscp

# Putty
winget install --id Putty.Putty

# Advanced IP Scanner
winget install --id Famatech.AdvancedIPScanner

# UltraVNC
# The Reason i am not using winget is so that you have control over which components of UltraVNC are installed
Invoke-WebRequest https://www.uvnc.eu/download/1381/UltraVNC_1_3_81_X64_Setup.exe -OutFile UltraVNC.exe
Write-Output "Please Install UltraVNC"
.\UltraVNC.exe
Pause
Remove-Item UltraVNC.exe

# Microsoft Office
winget install --id Microsoft.Office

# Gimp
winget install --id Gimp.Gimp

# Screen Connect
Write-Output "Please Enter ScreenConnect Instance domain (https://***.screenconnect.com)"
$ScreenConnect_URL = Read-Host

[system.Diagnostics.Process]::Start("chrome","https://$ScreenConnect_URL.screenconnect.com")

# WSL
Start-Process -FilePath cmd 'wsl --install'
Write-Output "Please Complete WSL Install before Proceeding"
Pause

# Oh My Posh
winget install --id JanDeDobbeleer.OhMyPosh

Write-Output "Downloading and Installing Neccessary Files (This may Take awhile)"
Invoke-WebRequest http://hdmi.vanmassenhoven.com/index.php/s/aNncBdbZf8fzmDc -OutFile C:\Users\$env:USERNAME\AppData\Local\Programs\oh-my-posh\themes\_CustomTheme.omp.json # May Not Work Need to Test

Invoke-WebRequest https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip -OutFile Font.zip
Expand-Archive Font.zip -DestinationPath C:\Users\$env:USERNAME\Downloads\NerdFonts
Remove-Item Font.zip
Write-Output "Please Install All Fonts before Continueing"
explorer.exe C:\Users\$env:USERNAME\Downloads\NerdFonts
Pause


Set-ExecutionPolicy Unrestricted
New-Item -Type File -Force $PROFILE
Write-Output "oh-my-posh --init --shell pwsh --config C:\Users\$Env:Username\AppData\Local\Programs\oh-my-posh\themes/_CustomTheme.omp.json | Invoke-Expression" >> $PROFILE

## Clear the Screen and Continue
Write-Output "Continueing will Clear the Screen"
Pause
Clear-Host


### Add Network Shares ###
Write-Output "Adding Network Shares"
Write-Output "Enter Network Share Username:"
$SMB_Username = Read-Host

Write-Output "Enter Network Share Password:"
$SMB_Password = Read-Host

$User_Name= whoami

RunAs /User:$User_Name /savecreds "net use O: \\slave1.local\Olympus /User:$SMB_Username $SMB_Password"
RunAs /User:$User_Name /savecreds "net use H: \\slave1.local\Hades /User:$SMB_Username $SMB_Password"
RunAs /User:$User_Name /savecreds "net use D: \\slave3.local\Dev /User:$SMB_Username $SMB_Password"

### Set Wall Paper ###
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -Name wallpaper -Value $PWD\Wallpaper.JPG

rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters









# Last Line
Pause