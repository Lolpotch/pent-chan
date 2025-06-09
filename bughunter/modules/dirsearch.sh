#!/bin/bash

source ./config.env
source ./modules/utils.sh

alive_file="subs-active.txt"
log_file="scan.log"
now=$(date '+%y-%m-%d_%H-%M-%S')

while read -r url; do
  folder="reports/$(echo "$url" | sed 's|https\?://||;s|/|_|g')"
  mkdir -p "$folder"
  outfile="$folder/_${now}.txt"
  echo "[+] Dirsearch scan: $url → $outfile" | tee -a "$log_file"
  sudo dirsearch -u "$url" -i 200 --format plain --output "$outfile"
done < "$alive_file"

send_telegram "📂 Dirsearch selesai dan disimpan di folder reports/"
