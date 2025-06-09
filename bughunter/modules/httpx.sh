#!/bin/bash

source ./config.env
source ./modules/utils.sh

subs_file="subs.txt"
alive_file="subs-active.txt"
httpx-toolkit -l "$subs_file" -mc 200 -silent -o "$alive_file"
total=$(wc -l < "$alive_file")
send_telegram "🌐 Subdomain aktif: $total"
