#!/bin/bash

source ./config.env
source ./modules/utils.sh

echo "[*] Menginstal tools..."
sudo apt update
sudo apt install -y subfinder httpx-toolkit paramspider dirsearch sqlmap golang lynx python3 python3-setuptools
go install github.com/hahwul/dalfox/v2@latest
sudo cp ~/go/bin/dalfox /usr/bin/
echo "[✓] Semua tools berhasil diinstal!"
send_telegram "✅ Semua tools berhasil diinstal!"
