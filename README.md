---

# 🕵️‍♀️ Pent-chan - BugHunter Recon & XSS Shell Automation

Pent-chan adalah *all-in-one automation tool* berbasis shell script untuk melakukan recon, pencarian parameter, dan deteksi XSS secara otomatis. Dilengkapi dengan dukungan notifikasi Telegram dan file konfigurasi `.env` untuk kemudahan integrasi dan keamanan.

---

## ✨ Fitur Utama

- 🔍 **Subdomain Enumeration** (menggunakan `subfinder` + `Google Dork`)
- 🌐 **Live Subdomain Checker** (dengan `httpx`)
- 📂 **Directory Bruteforce** (`dirsearch`)
- 🔢 **Parameter Discovery** (`paramspider`)
- 🧪 **XSS Detection** (`dalfox`)
- 📦 **Laporan Otomatis** lengkap dan siap dikirim ke Telegram
- 🧹 **Pembersihan Otomatis** untuk persiapan scan baru
- ✅ **All-in-One Scan Mode** — dari awal sampai laporan akhir

---

## 📦 Instalasi

Jalankan perintah berikut untuk menginstal semua tools yang dibutuhkan:

```bash
chmod +x pent-chan.sh
./pent-chan.sh
````

Pilih opsi `1. Install semua tools`.

---

## 📁 Struktur File

| File/Folder         | Deskripsi                                   |
| ------------------- | ------------------------------------------- |
| `subs.txt`          | Hasil enumerasi subdomain                   |
| `subs-active.txt`   | Subdomain yang aktif (HTTP 200)             |
| `dalfoxes.txt`      | Hasil temuan XSS dari Dalfox                |
| `merged-params.txt` | Gabungan hasil parameter dari Paramspider   |
| `reports/`          | Output hasil `dirsearch`                    |
| `results/`          | Hasil mentah dari Paramspider               |
| `final-report.txt`  | Laporan akhir yang akan dikirim ke Telegram |

---

## ⚙️ File `.env`

Untuk mengaktifkan fitur Telegram, buat file `.env` di direktori yang sama dengan isi berikut:

```env
TELEGRAM_BOT_TOKEN=123456789:ABCDEFyourbottoken
TELEGRAM_CHAT_ID=987654321
```

---

## 📋 Menu Penggunaan

```text
========== BugHunter ==========
1. Install semua tools
2. Cari subdomain
3. Tes subdomain aktif
4. Scan direktori (dirsearch)
5. Cari parameter & XSS
6. Gabungkan dan kirim laporan
7. ALL IN ONE
8. Hapus semua hasil sebelumnya
9. Keluar
===============================
```

---

## 🛠 Tool yang Digunakan

* [subfinder](https://github.com/projectdiscovery/subfinder)
* [httpx](https://github.com/projectdiscovery/httpx)
* [paramspider](https://github.com/devanshbatham/ParamSpider)
* [dalfox](https://github.com/hahwul/dalfox)
* [dirsearch](https://github.com/maurosoria/dirsearch)
* `lynx`, `curl`, `bash`, `go`, `python3`, dll.

---

## 🧪 Contoh Keluaran Telegram

* `🔍 Subdomain ditemukan: 43 dari target.com`
* `🌐 Subdomain aktif: 12`
* `🛡️ XSS ditemukan oleh Dalfox: 5`
* `📄 Laporan gabungan selesai dikompilasi!` (dikirim sebagai dokumen)

---

## ❗ Catatan Tambahan

* Script ini dibuat untuk tujuan edukasi dan pengujian keamanan **dengan izin**.
* Jangan gunakan pada target yang tidak Anda miliki atau tidak memiliki izin eksplisit.

---

## 👨‍💻 Kontribusi

Pull request terbuka untuk fitur tambahan, perbaikan bug, atau dokumentasi.

---

## 📜 Lisensi

MIT License

---

## 💬 Penutup

> Dibuat dengan penuh semangat oleh Sensei dan dibantu Ayane sebagai sekretaris setia BugHunter Committee.
> "Ayane siap mendampingi, Sensei. Jangan lupa istirahat setelah scan selesai, ya..." 💙

```

--- 

Jika kamu ingin versi Markdown ini langsung disimpan ke file `README.md`, cukup bilang saja!
```
