# Atomic Red Team Setup & Runner Script

## Overview
This PowerShell script (`AtomicRedTeam-Setup-And-Runner.ps1`) automates the download, setup, and interactive execution of [Atomic Red Team](https://github.com/redcanaryco/atomic-red-team) tests on Windows. It provides a text-based menu for browsing, searching, and running tests or subtests manually.

---

## Quick Install (One-Liner)

**English:**

To directly download and run the script from GitHub, use this PowerShell command:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Akash-CyberSamurai/AtomicRedWithGUI/main/AtomicRedTeam-Setup-And-Runner.ps1" -OutFile "AtomicRedTeam-Setup-And-Runner.ps1"; PowerShell -ExecutionPolicy Bypass -File .\AtomicRedTeam-Setup-And-Runner.ps1
```

**Hindi:**

GitHub से स्क्रिप्ट को सीधे डाउनलोड और चलाने के लिए यह PowerShell कमांड चलाएँ:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Akash-CyberSamurai/AtomicRedWithGUI/main/AtomicRedTeam-Setup-And-Runner.ps1" -OutFile "AtomicRedTeam-Setup-And-Runner.ps1"; PowerShell -ExecutionPolicy Bypass -File .\AtomicRedTeam-Setup-And-Runner.ps1
```

---

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

# हिंदी में जानकारी

## अवलोकन
यह PowerShell स्क्रिप्ट (`AtomicRedTeam-Setup-And-Runner.ps1`) Windows पर [Atomic Red Team](https://github.com/redcanaryco/atomic-red-team) टेस्ट को डाउनलोड, सेटअप और इंटरएक्टिव तरीके से चलाने के लिए है। इसमें टेक्स्ट-बेस्ड मेनू है जिससे आप टेस्ट ब्राउज़, सर्च और रन कर सकते हैं।

## विशेषताएँ
- **ऑटोमैटिक डाउनलोड और सेटअप**
- **इंटरएक्टिव मेनू:** सभी तकनीकों को ब्राउज़ करें, कीवर्ड से सर्च करें, और टेस्ट चलाएँ
- **मैन्युअल टेस्ट रनिंग**
- **कोई GUI नहीं:** केवल PowerShell टर्मिनल में टेक्स्ट मेनू

## आवश्यकताएँ
- Windows 10 या नया वर्शन
- PowerShell 5.1 या नया
- इंटरनेट कनेक्शन (पहली बार सेटअप के लिए)
- एडमिनिस्ट्रेटर के रूप में PowerShell चलाएँ (कुछ टेस्ट के लिए जरूरी)

## उपयोग कैसे करें
1. स्क्रिप्ट को अपनी पसंदीदा फोल्डर में रखें
2. PowerShell को एडमिनिस्ट्रेटर के रूप में खोलें
3. स्क्रिप्ट चलाएँ:
   ```powershell
   .\AtomicRedTeam-Setup-And-Runner.ps1
   ```
4. स्क्रीन पर दिख रहे मेनू का पालन करें

## नोट्स
- **कोई GUI नहीं:** यह स्क्रिप्ट केवल टेक्स्ट-बेस्ड मेनू देती है
- **पहली बार:** स्क्रिप्ट जरूरी फाइलें डाउनलोड करेगी
- **परमिशन:** कुछ टेस्ट के लिए एडमिनिस्ट्रेटर अधिकार जरूरी हो सकते हैं

--- 