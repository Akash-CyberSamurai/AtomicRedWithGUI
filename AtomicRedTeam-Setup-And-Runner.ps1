# Atomic Red Team Setup and Runner Script
# Language: PowerShell
# Purpose: Download, setup, and interactively run Atomic Red Team tests on Windows

$ProgressPreference = 'SilentlyContinue'

# --- CONFIGURATION ---
$AtomicRepoUrl = "https://github.com/redcanaryco/atomic-red-team/archive/refs/heads/master.zip"
$AtomicZip = "$PSScriptRoot\atomic-red-team.zip"
$AtomicDir = "$PSScriptRoot\atomic-red-team-master"
$AtomicModule = "Invoke-AtomicRedTeam"
$AtomicModuleUrl = "https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/Invoke-AtomicRedTeam.psm1"
$AtomicModulePath = "$PSScriptRoot\Invoke-AtomicRedTeam.psm1"

function Download-AtomicRedTeam {
    Write-Host "[+] Downloading Atomic Red Team repository..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $AtomicRepoUrl -OutFile $AtomicZip -UseBasicParsing
    Write-Host "[+] Extracting..." -ForegroundColor Cyan
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($AtomicZip, $PSScriptRoot)
    Remove-Item $AtomicZip
}

function Download-AtomicModule {
    Write-Host "[+] Downloading Invoke-AtomicRedTeam module..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $AtomicModuleUrl -OutFile $AtomicModulePath -UseBasicParsing
}

function Import-AtomicModule {
    if (-not (Get-Module -ListAvailable | Where-Object { $_.Name -eq $AtomicModule })) {
        if (-not (Test-Path $AtomicModulePath)) {
            Download-AtomicModule
        }
        Import-Module $AtomicModulePath -Force
    } else {
        Import-Module $AtomicModule -Force
    }
}

function Ensure-AtomicRedTeam {
    if (-not (Test-Path $AtomicDir)) {
        Download-AtomicRedTeam
    }
}

function Ensure-AtomicModule {
    Import-AtomicModule
}

function Get-Techniques {
    $yamlFiles = Get-ChildItem -Path "$AtomicDir\atomics" -Filter "T*.yaml" -Recurse
    $techniques = $yamlFiles | ForEach-Object {
        $id = $_.BaseName
        $name = (Select-String -Path $_.FullName -Pattern '^name:' | Select-Object -First 1).Line -replace '^name: ', ''
        [PSCustomObject]@{ ID = $id; Name = $name; Path = $_.FullName }
    }
    return $techniques
}

function Show-TechniquesMenu {
    $techniques = Get-Techniques
    $i = 1
    foreach ($t in $techniques) {
        Write-Host ("[{0}] {1} - {2}" -f $i, $t.ID, $t.Name)
        $i++
    }
    $choice = Read-Host "Enter technique number to view details, or 'q' to quit"
    if ($choice -eq 'q') { return }
    $selected = $techniques[$choice-1]
    if ($selected) {
        Show-TechniqueDetails $selected.ID
    }
}

function Show-TechniqueDetails($techniqueId) {
    Write-Host "\n--- Technique: $techniqueId ---\n" -ForegroundColor Yellow
    Invoke-AtomicTest -Technique $techniqueId -ShowDetails
    Write-Host "\nOptions:"
    Write-Host "[1] Execute a test"
    Write-Host "[2] Back to main menu"
    $opt = Read-Host "Choose option"
    if ($opt -eq '1') {
        $testNum = Read-Host "Enter Test Number to execute (e.g., 1, 2, etc.)"
        Invoke-AtomicTest -Technique $techniqueId -TestNumbers $testNum -GetPrereqs -Execute
        Write-Host "Test executed. Press Enter to continue."
        Read-Host
    }
}

function Search-Tests {
    $keyword = Read-Host "Enter keyword to search in test names/descriptions"
    $techniques = Get-Techniques
    $results = @()
    foreach ($t in $techniques) {
        $content = Get-Content $t.Path -Raw
        if ($content -match $keyword) {
            $results += $t
        }
    }
    if ($results.Count -eq 0) {
        Write-Host "No tests found for keyword '$keyword'." -ForegroundColor Red
        return
    }
    $i = 1
    foreach ($r in $results) {
        Write-Host ("[{0}] {1} - {2}" -f $i, $r.ID, $r.Name)
        $i++
    }
    $choice = Read-Host "Enter technique number to view details, or 'q' to quit"
    if ($choice -eq 'q') { return }
    $selected = $results[$choice-1]
    if ($selected) {
        Show-TechniqueDetails $selected.ID
    }
}

function Main-Menu {
    while ($true) {
        Clear-Host
        Write-Host "==== Atomic Red Team Test Runner ====" -ForegroundColor Green
        Write-Host "[1] Browse all techniques"
        Write-Host "[2] Search for a test"
        Write-Host "[q] Quit"
        $choice = Read-Host "Choose an option"
        switch ($choice) {
            '1' { Show-TechniquesMenu }
            '2' { Search-Tests }
            'q' { break }
            default { Write-Host "Invalid option. Press Enter to continue."; Read-Host }
        }
    }
}

# --- MAIN EXECUTION ---
Write-Host "==== Atomic Red Team Setup ====" -ForegroundColor Green
Ensure-AtomicRedTeam
Ensure-AtomicModule

# Set the environment variable for Atomic Red Team path
$env:PathToAtomicsFolder = "$AtomicDir\atomics"

Write-Host "Setup complete. Press Enter to continue to menu."
Read-Host

Main-Menu 