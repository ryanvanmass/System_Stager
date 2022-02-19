# Name: Windows System Stager
# Version: 0
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

# Tailscale Tail 
#winget install --id Tailscale.Tailscale
#Write-Output "Please Log Into Tailscale Before procceding"

#C:\'Program Files (x86)'\'Tailscale IPN'\tailscale.exe up
#Pause

## For Testing Comment out Tailscale Install and Uncomment the bellow Line
Set-DnsClientServerAddress -InterfaceAlias * -ServerAddresses 192.168.2.95

#Power Toys
winget install --id Microsoft.PowerToys

# SysInternals
winget install sysinternals

# Git CLI for Windows
winget install --id Git.Git

# Screen Connect
Write-Output "Please Enter ScreenConnect Instance domain (https://***.screenconnect.com)"
$ScreenConnect_URL = Read-Host

[system.Diagnostics.Process]::Start("chrome","https://$ScreenConnect_URL.screenconnect.com")

# WSL
#wsl --install

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














# Last Line
Pause