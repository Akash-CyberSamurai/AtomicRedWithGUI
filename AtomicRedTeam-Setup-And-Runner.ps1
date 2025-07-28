# Atomic Red Team Quick Setup Script
# This script will download, extract, and set up Atomic Red Team for manual use on Windows

$ProgressPreference = 'SilentlyContinue'

Write-Host "[+] Downloading Atomic Red Team zip from GitHub..." -ForegroundColor Cyan
$zipUrl = "https://github.com/redcanaryco/atomic-red-team/archive/refs/heads/master.zip"
$tempZip = "$env:TEMP\atomic-red-team.zip"
Invoke-WebRequest -Uri $zipUrl -OutFile $tempZip

Write-Host "[+] Extracting zip to C:\ ..." -ForegroundColor Cyan
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($tempZip, "C:\")
Remove-Item $tempZip

# Rename extracted folder to C:\AtomicRedTeam
$extracted = Get-ChildItem -Path 'C:\' -Directory | Where-Object { $_.Name -like 'atomic-red-team-*' } | Select-Object -First 1
if ($extracted -and $extracted.Name -ne 'AtomicRedTeam') {
    Rename-Item -Path $extracted.FullName -NewName 'AtomicRedTeam'
}

$atomicPath = "C:\AtomicRedTeam"

Write-Host "[+] Installing required PowerShell modules..." -ForegroundColor Cyan
$modules = @('invoke-atomicredteam','powershell-yaml')
foreach ($m in $modules) {
    if (-not (Get-Module -ListAvailable -Name $m)) {
        Install-Module -Name $m -Scope CurrentUser -Force
    }
}

Write-Host "[+] Importing Invoke-AtomicRedTeam module..." -ForegroundColor Cyan
Import-Module Invoke-AtomicRedTeam -Force

Write-Host "[+] Setting ATOMICS_PATH environment variable..." -ForegroundColor Cyan
$env:ATOMICS_PATH = "$atomicPath\atomics"

Write-Host "[+] Setup complete! You can now run Invoke-AtomicTest commands manually." -ForegroundColor Green
Write-Host "[!] This window will remain open for you to run tests. Type 'help' for PowerShell help or 'Invoke-AtomicTest' to begin."
Write-Host "\nTo perform a test, use Invoke-AtomicTest followed by the Technique you need to test."
Write-Host "You can find a list of techniques at https://www.atomicredteam.io/atomic-red-team"
Write-Host "Example:"
Write-Host "Invoke-AtomicTest T1021.006-1" -ForegroundColor Yellow

# Script ends here, user gets prompt back 