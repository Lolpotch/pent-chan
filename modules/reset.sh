#!/bin/bash

source ./config.env
source ./modules/utils.sh

rm -f subs.txt subs-active.txt dalfoxes.txt scan.log merged-params.txt final-report.txt
rm -rf results
rm -rf reports
init_dirs
send_telegram "🧹 Semua data lama berhasil dihapus. Siap untuk scan baru!"
echo "[✓] Semua file & folder berhasil dihapus dan direktori dibersihkan."
