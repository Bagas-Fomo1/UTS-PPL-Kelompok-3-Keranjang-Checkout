# 🛠️ CilacapTools - Repositori Manajemen Cacat & Pengujian (Kelompok 3)

[![Mata Kuliah](https://img.shields.io/badge/Mata%20Kuliah-Praktikum%20Pengujian%20Perangkat%20Lunak-blue.svg)](file:///d:/UTS%20BAWUK/Soal%20UTS%20Praktikum%20PPL%20RKS%203%20ABC%202026.pdf)
[![Semester](https://img.shields.io/badge/Semester-V%20Gasal%202026%2F2027-orange.svg)]()
[![Fokus Pengujian](https://img.shields.io/badge/Fokus-Keranjang%20%26%20Checkout-green.svg)]()
[![Kiwi TCMS](https://img.shields.io/badge/Test%20Management-Kiwi%20TCMS-purple.svg)](https://reg-beings-nurse-month.trycloudflare.com)
[![Quality Gate](https://img.shields.io/badge/Quality%20Gate-P1%2FP2%20PASS%20%7C%20No%20Critical%2FMajor-red.svg)]()

Repositori ini dikelola oleh **Kelompok 3** untuk tugas Ujian Tengah Semester (UTS) mata kuliah **Praktikum Pengujian Perangkat Lunak**, Program Studi **Rekayasa Keamanan Siber**, Jurusan Komputer dan Bisnis, **Politeknik Negeri Cilacap**.

Repositori ini berfungsi sebagai pusat **Defect Management**, pelacakan *bug report*, bukti pengujian (*evidence*), standardisasi pengujian, dan integrasi dengan **Kiwi TCMS**.

---

## 📌 Ringkasan Skenario Pengujian

* **Aplikasi**: **CilacapTools** (Toko perkakas online UMKM di Cilacap)
* **Build Target**: Staging Sprint 5 (Build Pertama)
* **Application Under Test (AUT)**: [`https://with-bugs.practicesoftwaretesting.com`](https://with-bugs.practicesoftwaretesting.com) (versi sengaja berisi *bug*)
* **Test Oracle (Acuan Normal)**: [`https://practicesoftwaretesting.com`](https://practicesoftwaretesting.com) (versi acuan perilaku benar tanpa bug)
* **Dashboard Kiwi TCMS**: [`https://reg-beings-nurse-month.trycloudflare.com`](https://reg-beings-nurse-month.trycloudflare.com)
* **Fokus Pengujian Kelompok 3**:
  1. **Keranjang Belanja (Cart)**: Tambah item, ubah kuantitas, hapus item, validasi kuantitas batas, kalkulasi subtotal & diskon.
  2. **Alur Checkout & Pembayaran**: Formulir alamat penagihan/pengiriman, opsi pengiriman, kalkulasi total akhir tagihan, pilihan metode pembayaran *dummy*, hingga halaman konfirmasi pesanan/invoice.
  3. **Alur Wajib**: Halaman Beranda (*Home*) dan Autentikasi (*Login/Logout*).

---

## 👥 Susunan Tim & Pembagian Peran (Kelompok 3)

| Role | Nama Anggota | Tanggung Jawab Utama | Luaran Individu yang Dipaparkan |
| :---: | :--- | :--- | :--- |
| **R1** | *(QA Lead & Test Manager)* | Setup Test Plan & Test Run di Kiwi, menjaga *traceability*, pimpin rapat *triage*, Test Lead pada debrief SBTM, menyusun *Summary Report* & rekomendasi *Go/No-Go*. | Test Plan & Test Run lengkap, Test Execution Summary Report, metrik, rekomendasi rilis (T1, T4, T9). |
| **R2** | *(Test Analyst)* | Merancang Equivalence Partitioning (EP) & Boundary Value Analysis (BVA), *error guessing*, *negative testing*, dan eksekusi test case terstruktur. | Tabel partisi dan titik batas, daftar dugaan error guessing, test case negatif & edge, hasil eksekusi (T2, T3, T4). |
| **R3** | *(Exploratory Tester)* | Menyusun charter eksploratori, menjalankan sesi *time-boxed* (2x30 menit), menyusun *Session Notes*, mengikuti *debrief*. | 2 charter, Session Notes dengan rasio waktu 100%, analisis 2 bug terpenting (T5). |
| **R4** | *(Compatibility & Accessibility Tester)* | Pengujian cross-browser (Chrome, Firefox, Edge), responsivitas layar (4 viewport + emulator), audit aksesibilitas (axe, WAVE, Lighthouse Mobile), keyboard sweep. | Matriks cross-browser & responsivitas, matriks perbandingan tools aksesibilitas, prioritisasi temuan (T6, T7). |
| **R5** | **Bagas** *(Defect Management Engineer)* | **Mengelola repositori GitHub (label & template), verifikasi mutu setiap bug report sebelum diterbitkan, menjaga konsistensi severity & priority, menulis versi Bahasa Inggris, menautkan issue ke Kiwi TCMS, mencatat notulen triage.** | **Daftar bug lengkap, bukti audit mutu bug, versi Inggris, notulen triage meeting (T1 GitHub, T8).** |

> **Kewajiban Kontribusi Individu**:  
> Seluruh anggota (R1–R5) wajib menulis **minimal 2 issue bug di GitHub** dan mengeksekusi **minimal 4 test case di Kiwi TCMS** dengan akun masing-masing.

---

## 🚦 Kriteria Quality Gate (Syarat Kelayakan Rilis)

Pemilik toko CilacapTools menetapkan aturan ketat sebelum produk boleh dirilis ke pelanggan publik:
1. **100% Test Case Prioritas P1 dan P2 berstatus PASS**.
2. **Nol (0) Bug Berkategori Critical atau Major yang masih berstatus Terbuka (*Open*)**.
3. Jika terdapat minimal satu bug Critical atau Major yang belum diperbaiki, maka rekomendasi rilis adalah **NO-GO**.

---

## 📁 Struktur Direktori Repositori

```text
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.yml             # Form pelaporan bug interaktif GitHub (dropdown, validasi field)
│   │   ├── bug_report.md              # Template Markdown standar pelaporan bug
│   │   └── config.yml                 # Konfigurasi issue template (link panduan & TCMS)
│   └── labels.json                    # Definisi 23 label standar warna & deskripsi
├── docs/
│   ├── BUG_SEVERITY_PRIORITY_MATRIX.md# Panduan objektif penentuan Severity dan Priority
│   ├── DEFECT_MANAGEMENT_WORKFLOW.md  # Siklus hidup bug, syarat validitas, dan aturan tautan Kiwi
│   ├── TRIAGE_NOTULEN_TEMPLATE.md     # Template notulen Triage Meeting (2-3 kalimat per bug)
│   └── BUG_TRACKING_REGISTER.md       # Tabel master rekapitulasi bug untuk Bab VI Laporan
├── evidence-uts/
│   ├── screenshots/                   # Screenshot layar penuh (BUG-XXX_judul-singkat.png)
│   ├── recordings/                    # Video rekaman interaksi/bug intermiten (.mp4)
│   ├── logs/                          # Console logs & Network logs error (.log / .txt)
│   └── session-notes/                 # Catatan sesi SBTM dari R3 (.md)
├── scripts/
│   └── setup_github_labels.ps1        # Script otomatis setup seluruh label ke GitHub via REST API
├── .gitignore
└── README.md
```

---

## 🏷️ Sistem Label Repositori (Defect Tracking Labels)

Repositori ini telah dilengkapi skema label terstandar untuk memfasilitasi *triaging* yang efisien:

### 1. Tingkat Keparahan Teknis (Severity)
* `severity: critical` (Merah Tua `#b60205`) - Sistem crash, checkout macet total, no workaround.
* `severity: major` (Oranye `#d93f0b`) - Fungsi utama gagal, kalkulasi total/diskon salah, ada workaround rumit.
* `severity: minor` (Kuning `#fbca04`) - Fungsi sekunder bermasalah, layout geser, salah pesan validasi.
* `severity: trivial` (Hijau Muda `#0e8a16`) - Typo, inkonsistensi estetika minor.

### 2. Prioritas Perbaikan Bisnis (Priority)
* `priority: P1` (Maroon `#7e0018`) - Urgent / Blocker (Wajib diselesaikan untuk Quality Gate).
* `priority: P2` (Rose `#e11d48`) - High (Mempengaruhi pengalaman inti, wajib selesai sebelum rilis).
* `priority: P3` (Amber `#f59e0b`) - Medium (Dapat dijadwalkan pada sprint pemeliharaan).
* `priority: P4` (Abu-abu `#64748b`) - Low (Nice to have).

### 3. Area Modul
* `area: keranjang` - Terkait modul keranjang belanja.
* `area: checkout` - Terkait alur checkout, pengiriman, dan pembayaran.
* `area: login-auth` - Terkait alur autentikasi dan akun pengguna.
* `area: beranda` - Terkait halaman utama.
* `area: kompatibilitas` - Temuan cross-browser dan responsive (Tugas T6).
* `area: aksesibilitas` - Temuan audit aksesibilitas (Tugas T7).

### 4. Status Triage & Defect Lifecycle
* `status: unconfirmed` - Bug baru, menunggu verifikasi mutu oleh R5.
* `status: confirmed` - Bug valid dan berhasil direproduksi.
* `status: under-triage` - Sedang dibahas dalam Triage Meeting.
* `status: verified-in-kiwi` - Sudah ditautkan ke eksekusi FAIL di Kiwi TCMS.
* `status: rejected-duplicate` - Ditolak karena duplikat.
* `status: rejected-not-a-bug` - Ditolak karena perilaku identik dengan versi tanpa cacat.

### 5. Role Pelapor
* `role: R1-Lead`, `role: R2-Analyst`, `role: R3-Exploratory`, `role: R4-Compatibility`, `role: R5-DefectManager`.

---

## ⚡ Panduan Setup Label Otomatis ke GitHub

Untuk menerapkan seluruh label di atas ke repositori GitHub Anda secara otomatis:

1. Buka PowerShell di folder proyek.
2. Dapatkan **Personal Access Token (classic)** dari akun GitHub Anda dengan izin `repo` (atau `issues:write`).
3. Jalankan perintah berikut:

```powershell
.\scripts\setup_github_labels.ps1 -RepoOwner "USERNAME_GITHUB_ANDA" -RepoName "NAMA_REPO_ANDA" -Token "ghp_TOKEN_GITHUB_ANDA"
```

Seluruh 23 label akan dibuat dan diberi kode warna otomatis dalam hitungan detik.

---

## 📝 Panduan Melaporkan Bug (Bagi Seluruh Anggota)

1. Buka menu **Issues** di repositori GitHub ini, lalu klik **New Issue**.
2. Pilih template **🐞 Bug Report (Laporan Cacat)**.
3. Lengkapi setiap bagian sesuai instruksi:
   * **Judul**: Format wajib dwibahasa `[BUG-XXX]: English Title / Judul Indonesia`.
   * **Steps to Reproduce**: Tuliskan langkah nomor demi nomor yang presisi.
   * **Expected Result**: Wajib mencantumkan perilaku pada versi acuan normal ([practicesoftwaretesting.com](https://practicesoftwaretesting.com)).
   * **Evidence**: Unggah tangkapan layar penuh atau video ke folder `evidence-uts/` dan lampirkan link/gambarnya pada issue.
   * **Tautan Kiwi**: Tautkan ke ID Test Case dan URL Eksekusi FAIL di Kiwi TCMS.
4. Centang checklist validasi kualitas di bagian bawah.

---

## 🔗 Tautan Eksternal & Referensi

* 🧪 **Aplikasi yang Diuji (AUT)**: [https://with-bugs.practicesoftwaretesting.com](https://with-bugs.practicesoftwaretesting.com)
* 🎯 **Aplikasi Acuan Tanpa Bug (Oracle)**: [https://practicesoftwaretesting.com](https://practicesoftwaretesting.com)
* 📋 **Kiwi TCMS Dashboard**: [https://reg-beings-nurse-month.trycloudflare.com](https://reg-beings-nurse-month.trycloudflare.com)
* 📖 **Spesifikasi API Swagger**: [https://api_with-bugs.practicesoftwaretesting.com/api/documentation](https://api_with-bugs.practicesoftwaretesting.com/api/documentation)
