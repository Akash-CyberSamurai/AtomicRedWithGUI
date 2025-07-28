# Atomic Red Team Setup & Runner Script

## Overview
This PowerShell script (`AtomicRedTeam-Setup-And-Runner.ps1`) automates the download, setup, and interactive execution of [Atomic Red Team](https://github.com/redcanaryco/atomic-red-team) tests on Windows. It provides a text-based menu for browsing, searching, and running tests or subtests manually.

---

## Quick Install (One-Liner)


To directly download and run the script from GitHub, use this PowerShell command:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Akash-CyberSamurai/AtomicRedWithGUI/main/AtomicRedTeam-Setup-And-Runner.ps1" -OutFile "AtomicRedTeam-Setup-And-Runner.ps1"; PowerShell -ExecutionPolicy Bypass -File .\AtomicRedTeam-Setup-And-Runner.ps1
```



## Features
- **Automatic Download & Setup:** Fetches Atomic Red Team repo and required PowerShell module.
- **Interactive Menu:** Browse all techniques, search by keyword, and execute tests/subtests.
- **Manual Execution:** Choose and run any test interactively.
- **No GUI:** Uses a text-based menu in the PowerShell terminal.

---

## Prerequisites
- Windows 10 or later
- PowerShell 5.1 or newer
- Internet connection (for initial setup)
- Run PowerShell as Administrator (recommended for some tests)

---

## Usage
1. **Download the script:**
   Place `AtomicRedTeam-Setup-And-Runner.ps1` in a folder of your choice.

2. **Open PowerShell as Administrator.**

3. **Run the script:**
   ```powershell
   .\AtomicRedTeam-Setup-And-Runner.ps1
   ```

4. **Follow the on-screen menu:**
   - Browse all techniques
   - Search for tests by keyword
   - View details and execute tests/subtests

---

## Notes
- **No GUI:** This script uses a text-based menu, not a graphical interface.
- **First run:** The script will download and extract the Atomic Red Team repository and required module.
- **Permissions:** Some tests may require elevated privileges (run as Administrator).
- **For more info:** Visit [Atomic Red Team GitHub](https://github.com/redcanaryco/atomic-red-team)

---

