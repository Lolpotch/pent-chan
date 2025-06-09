#!/bin/bash

source ./config.env
source ./modules/utils.sh

subs_file="subs.txt"
read -p "Masukkan domain target: " domain
subfinder -d "$domain" -silent -o "$subs_file"

lynx -dump "https://www.google.com/search?q=site:$domain" | \
  grep -Eo "https?://[a-zA-Z0-9._-]+\.$domain" | sed 's@https\?://@@' >> "$subs_file"

sort -u "$subs_file" -o "$subs_file"
total=$(wc -l < "$subs_file")
send_telegram "🔍 Subdomain ditemukan: $total dari $domain"
