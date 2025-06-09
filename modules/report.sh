#!/bin/bash

source ./config.env
source ./modules/utils.sh

subs_file="subs.txt"
alive_file="subs-active.txt"
merged_params="merged-params.txt"
xss_file="dalfoxes.txt"
final_output="final-report.txt"
datetime=$(date '+%Y-%m-%d %H:%M:%S')
domain=$(head -n 1 "$subs_file" | cut -d'.' -f2- 2>/dev/null)

echo "===== 🔐 BugHunter Scan Report =====" > "$final_output"
echo "Target   : ${domain:-[domain tidak diketahui]}" >> "$final_output"
echo "Waktu    : $datetime" >> "$final_output"
echo "======================================" >> "$final_output"
echo "" >> "$final_output"

# Subdomain
echo "===== 🌐 Subdomain Ditemukan =====" >> "$final_output"
[[ -s "$subs_file" ]] && head -n 50 "$subs_file" >> "$final_output" || echo "(tidak ada subdomain ditemukan)" >> "$final_output"
echo "" >> "$final_output"

# Subdomain aktif
echo "===== ✅ Subdomain Aktif (HTTP 200) =====" >> "$final_output"
[[ -s "$alive_file" ]] && head -n 50 "$alive_file" >> "$final_output" || echo "(tidak ada subdomain aktif ditemukan)" >> "$final_output"
echo "" >> "$final_output"

# Parameter
echo "===== 🔍 Parameter URLs =====" >> "$final_output"
[[ -s "$merged_params" ]] && head -n 50 "$merged_params" >> "$final_output" || echo "(tidak ada hasil parameter dari paramspider)" >> "$final_output"
echo "" >> "$final_output"

# XSS
echo "===== 🧪 XSS Report =====" >> "$final_output"
[[ -s "$xss_file" ]] && head -n 50 "$xss_file" >> "$final_output" || echo "(tidak ada hasil dari dalfox)" >> "$final_output"
echo "" >> "$final_output"

# Dirsearch
echo "===== 📂 Hasil Dirsearch =====" >> "$final_output"
if find reports -type f -name '*.txt' | grep -q .; then
  find reports -type f -name '*.txt' | sort | while read -r f; do
    domain_folder=$(basename "$(dirname "$f")")
    filename=$(basename "$f")
    echo "Domain: $domain_folder" >> "$final_output"
    echo "File  : $filename" >> "$final_output"
    grep -E '^200' "$f" | head -n 30 >> "$final_output"
    echo "" >> "$final_output"
  done
else
  echo "(tidak ada hasil dirsearch ditemukan)" >> "$final_output"
fi

# Kirim ke Telegram
if [[ -n "$TELEGRAM_BOT_TOKEN" && -n "$TELEGRAM_CHAT_ID" ]]; then
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendDocument" \
    -F chat_id="$TELEGRAM_CHAT_ID" \
    -F document=@"$final_output" \
    -F caption="📄 Laporan gabungan selesai dikompilasi!"
else
  echo "[!] Token atau Chat ID Telegram tidak tersedia."
fi
