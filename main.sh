#!/bin/bash

echo "
                       __                   .__                   
 ______   ____   _____/  |_            ____ |  |__ _____    ____  
 \____ \_/ __ \ /    \   __\  ______ _/ ___\|  |  \\__  \  /    \ 
 |  |_> >  ___/|   |  \  |   /_____/ \  \___|   Y  \/ __ \|   |  \
 
 |   __/ \___  >___|  /__|            \___  >___|  (____  /___|  /
 |__|        \/     \/                    \/     \/     \/     \/ 
"


if [[ -f .env ]]; then
  source .env
else
  echo "[!] File .env tidak ditemukan. Notifikasi Telegram tidak aktif."
fi

source ./modules/utils.sh

show_menu() {
  echo ""
  echo "========== BugHunter =========="
  echo "1. Install semua tools"
  echo "2. Cari subdomain"
  echo "3. Tes subdomain aktif"
  echo "4. Scan direktori (dirsearch)"
  echo "5. Cari parameter & XSS"
  echo "6. Gabungkan dan kirim laporan"
  echo "7. ALL IN ONE"
  echo "8. Hapus semua hasil sebelumnya"
  echo "9. Keluar"
  echo "==============================="
}

while true; do
  show_menu
  read -p "Pilih opsi [1-9]: " opsi
  case $opsi in
    1) bash modules/install.sh ;;
    2) bash modules/subfinder.sh ;;
    3) bash modules/httpx.sh ;;
    4) bash modules/dirsearch.sh ;;
    5) bash modules/param_xss.sh ;;
    6) bash modules/report.sh ;;
    7)
      bash modules/subfinder.sh
      bash modules/httpx.sh
      bash modules/dirsearch.sh
      bash modules/param_xss.sh
      bash modules/report.sh
      send_telegram "🎉 ALL-IN-ONE selesai dan laporan sudah dikirim!"
      ;;
    8) bash modules/reset.sh ;;
    9) echo "[!] Keluar..."; exit 0 ;;
    *) echo "[!] Pilihan tidak valid." ;;
  esac
done
