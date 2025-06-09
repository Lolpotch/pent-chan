```
                      __                   .__                   
______   ____   _____/  |_            ____ |  |__ _____    ____  
\____ \_/ __ \ /    \   __\  ______ _/ ___\|  |  \\__  \  /    \ 
|  |_> >  ___/|   |  \  |   /_____/ \  \___|   Y  \/ __ \|   |  \
|   __/ \___  >___|  /__|            \___  >___|  (____  /___|  /
|__|        \/     \/                    \/     \/     \/     \/ 
```
---

# 🕵️‍♀️ Pent-chan - BugHunter Recon & XSS Shell Automation

Pent-chan is an *all-in-one automation tool* built with shell scripting to perform recon, parameter discovery, and XSS detection automatically. It includes Telegram notification support and `.env` config for easy integration and security.

---

## ✨ Key Features

- 🔍 **Subdomain Enumeration** (using `subfinder` + `Google Dork`)
- 🌐 **Live Subdomain Checker** (with `httpx`)
- 📂 **Directory Bruteforce** (`dirsearch`)
- 🔢 **Parameter Discovery** (`paramspider`)
- 🧪 **XSS Detection** (`dalfox`)
- 📦 **Automated Report** generation ready for Telegram
- 🧹 **Auto Cleanup** to prepare for new scans
- ✅ **All-in-One Scan Mode** — from start to final report

---

## 📦 Installation

Run the following command to install all required tools:

```bash
chmod +x pent-chan.sh
./pent-chan.sh
```

Select option `1. Install all tools`.

---

## 📁 File Structure

| File/Folder         | Description                              |
| ------------------- | ---------------------------------------- |
| `subs.txt`          | Subdomain enumeration results            |
| `subs-active.txt`   | Active subdomains (HTTP 200)             |
| `dalfoxes.txt`      | XSS findings from Dalfox                 |
| `merged-params.txt` | Combined parameters found by Paramspider |
| `reports/`          | Output from `dirsearch`                  |
| `results/`          | Raw results from Paramspider             |
| `final-report.txt`  | Final report sent to Telegram            |

---

## ⚙️ `config.env` File

To enable Telegram notifications, create a `config.env` file in the same directory with the following content:

```env
TELEGRAM_BOT_TOKEN=123456789:ABCDEFyourbottoken
TELEGRAM_CHAT_ID=987654321
```

---

## 📋 Usage Menu

```text
========== BugHunter ==========
1. Install all tools
2. Find subdomains
3. Check live subdomains
4. Scan directories (dirsearch)
5. Discover parameters & XSS
6. Merge and send report
7. ALL IN ONE
8. Clean all previous results
9. Exit
===============================
```

---

## 🛠 Tools Used

* [subfinder](https://github.com/projectdiscovery/subfinder)
* [httpx](https://github.com/projectdiscovery/httpx)
* [paramspider](https://github.com/devanshbatham/ParamSpider)
* [dalfox](https://github.com/hahwul/dalfox)
* [dirsearch](https://github.com/maurosoria/dirsearch)
* `lynx`, `curl`, `bash`, `go`, `python3`, etc.

---

## 🧪 Example Telegram Output

* `🔍 Subdomains found: 43 from target.com`
* `🌐 Active subdomains: 12`
* `🛡️ XSS found by Dalfox: 5`
* `📄 Final report compiled!` (sent as a document)

---

## ❗ Notes

* This script is intended for educational and authorized security testing only.
* Do not use this on targets you do not own or lack explicit permission for.

---

## 👨‍💻 Contributing

Pull requests are welcome for new features, bug fixes, or documentation improvements.

---
