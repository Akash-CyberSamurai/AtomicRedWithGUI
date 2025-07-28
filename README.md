# Atomic Red Team Quick Setup Script

## Quick Install (One-Liner)

To directly download and run the script from GitHub, use this PowerShell command:

```powershell
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Akash-CyberSamurai/AtomicRedWithGUI/main/AtomicRedTeam-Setup-And-Runner.ps1" -OutFile "AtomicRedTeam-Setup-And-Runner.ps1"; PowerShell -ExecutionPolicy Bypass -File .\AtomicRedTeam-Setup-And-Runner.ps1
```

---

## Overview
This PowerShell script automates the download, extraction, and setup of Atomic Red Team on Windows. After running the script, you can manually execute Atomic Red Team tests using PowerShell commands.

---

## Features
- Downloads the latest Atomic Red Team release from GitHub
- Extracts it to `C:\AtomicRedTeam`
- Installs required PowerShell modules: `invoke-atomicredteam` and `powershell-yaml`
- Imports the `Invoke-AtomicRedTeam` module
- Sets the `ATOMICS_PATH` environment variable
- Leaves the PowerShell window open for you to run tests manually

---

## Prerequisites
- Windows 10 or later
- PowerShell 5.1 or newer
- Run PowerShell as Administrator (required for extracting to `C:\` and installing modules)
- Internet connection (for downloading files and modules)

---

## Usage
1. **Download the script** and place it anywhere on your system.
2. **Open PowerShell as Administrator.**
3. **Run the script:**
   ```powershell
   .\AtomicRedTeam-Setup-And-Runner.ps1
   ```
4. **After setup completes,** the window will remain open. You can now run Atomic Red Team tests manually, for example:
   ```powershell
   Invoke-AtomicTest T1003 -ShowDetails
   Invoke-AtomicTest T1003 -TestNumbers 1 -GetPrereqs -Execute
   ```

---

## Notes
- The script will extract Atomic Red Team to `C:\AtomicRedTeam` (existing folder will be overwritten if present).
- You must run as Administrator for full functionality.
- `$ProgressPreference = 'SilentlyContinue'` is used to speed up downloads.
- The script installs modules for the current user only.
- For more information, visit the [Atomic Red Team GitHub](https://github.com/redcanaryco/atomic-red-team).

--- 