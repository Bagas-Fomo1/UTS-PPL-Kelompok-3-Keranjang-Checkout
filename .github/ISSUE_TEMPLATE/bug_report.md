---
name: "🐞 Bug Report (Standard Markdown)"
about: "Template pelaporan bug CilacapTools - wajib lolos R5 gate sebelum issue dibuat (Tugas T9)"
title: "[BUG-XXX]: [English Title] / [Judul Bahasa Indonesia]"
labels: "status:new, needs-triage"
assignees: ""
---

<!--
  R5 GATE — jangan buat issue sebelum seluruh checklist di bagian akhir terpenuhi.
  Satu akar masalah = satu issue. Bila gejala muncul di beberapa halaman,
  laporkan sekali dan daftarkan semua halaman terdampak pada bagian 8.
  Isi bagian 1-8 dalam Bahasa Inggris; terjemahan Indonesia diletakkan di bawahnya bila perlu.
-->

### 1. Informasi Dasar (General Information)
* **ID Bug**: `BUG-XXX`
* **Judul (English)**: *[Kalimat imperatif singkat, sebutkan area dan perilaku salahnya]*
* **Judul (Indonesia)**: *[Terjemahan singkat]*
* **Role Pelapor**: R1 / R2 / R3 / R4 / R5
* **Area / Fitur Terdampak**: Beranda / Login / Keranjang / Checkout - Address / Checkout - Payment
* **Teknik Pengujian**: BVA / Equivalence Partitioning / Error Guessing / Negative Testing / Edge Case / Exploratory / Cross-browser / Accessibility
* **Tipe / Klasifikasi Cacat**: Functional Bug / Financial Calculation / Data Validation / UI-UX Defect / Crash-Exception / State Management / Compatibility / Accessibility Barrier
* **URL Terdampak**: `https://with-bugs.practicesoftwaretesting.com/#/...`

---

### 2. Klasifikasi Keparahan & Prioritas
* **Severity**: `severity:blocker` / `severity:critical` / `severity:major` / `severity:moderate` / `severity:minor` / `severity:trivial`
  * **Alasan Severity**: *[Jelaskan dampak teknisnya: apa yang gagal, siapa yang terdampak, apakah masih ada workaround]*
* **Priority**: `priority:p1` / `priority:p2` / `priority:p3` / `priority:p4`
  * **Alasan Priority**: *[Jelaskan urgensinya bagi Sprint 5 / Quality Gate: memblokir rilis atau tidak]*

> Acuan pemilihan ada di `docs/BUG_SEVERITY_PRIORITY_MATRIX.md`. Severity menilai **dampak**, Priority menilai **urgensi**. Keduanya wajib punya alasan, bukan hanya label.

---

### 3. Lingkungan Pengujian (Test Environment)
* **Perangkat / OS**: Windows 11 / Windows 10 / macOS / Android / iOS
* **Browser**: Google Chrome v141 / Firefox / Edge v141
* **Viewport / Resolusi Layar**: Desktop (1262x568) / Mobile (375x667, 390x844, 412x915, 820x1180)
* **Versi Build**: Sprint 5 Staging (with-bugs) - Build #14
* **Acuan Normal (Oracle)**: `https://practicesoftwaretesting.com`
* **Akun Uji**: *[akun dummy milik pelapor, jangan tulis password]*

---

### 4. Prasyarat (Pre-conditions)
1. Pengguna telah login dengan akun dummy yang terdaftar pada AUT.
2. Terdapat minimal satu item di dalam keranjang belanja.
3. *[kondisi awal lain yang wajib, mis. halaman berada di Step 1 CART]*

---

### 5. Langkah-Langkah Reproduksi (Steps to Reproduce)
<!-- Bernomor, satu aksi per baris. Anggota lain harus bisa mereproduksi HANYA dari langkah ini. -->
1. Buka `https://with-bugs.practicesoftwaretesting.com/#/...`
2. Fokus ke elemen `[data-test="..."]`.
3. Ketik / pilih `...` lalu tekan Tab.
4. Amati `[data-test="..."]` dan catat nilai yang tampil.
5. *[...]*

---

### 6. Hasil Aktual vs Hasil yang Diharapkan
* **Actual Result (AUT with-bugs)**:
  > *[Nilai/teks persis seperti di layar. Sertakan angka, bukan tafsiran. Bila ada beberapa varian, gunakan tabel.]*

* **Expected Result (Acuan Normal practicesoftwaretesting.com)**:
  > *[Perilaku pada build bersih/oracle, atau aturan eksplisit yang terlihat di UI. Cantumkan URL/nilai acuannya.]*

---

### 7. Traceability - Kiwi TCMS
<!-- Setiap bug WAJIB tertaut ke eksekusi FAIL. URL issue ini ditempel sebagai komentar di eksekusi tersebut. -->
* **Test Plan**: `TP-...`
* **Test Run**: `TR-15 - Test Run 1 Sprint 5 Staging`
* **Test Case**: `TC-... - [judul test case]`
* **Test Execution**: `TE #...` (status: **FAILED**)
* **URL Eksekusi**: [Buka di Kiwi TCMS](https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/XXX/)
* [ ] Status eksekusi di Kiwi sudah FAILED (bukan PASSED/BLOCKED)
* [ ] URL issue ini sudah diposting sebagai komentar pada eksekusi FAIL tersebut

---

### 8. Cakupan Halaman Terdampak (Affected Pages / Scope)
<!-- Bila akar masalah sama muncul di beberapa halaman, laporkan sebagai SATU issue dan daftarkan semuanya di sini. -->
* `#/checkout` Step 1 CART - *[varian yang terkena: qty 1, 9, 10, 99]*
* *[...]*

---

### 9. Pemeriksaan Duplikasi (Duplicate Check)
* [ ] Sudah mencari issue terbuka dengan kata kunci: `[...]`
* [ ] Tidak ada issue lain dengan akar masalah yang sama
* [ ] Bila duplikat: tutup dengan `status:duplicate` dan tautkan ke issue utama

---

### 10. Bukti / Evidence
**Aturan wajib:**
- Screenshot harus **layar penuh** (bukan crop), dinamai `BUG-XXX_urutan_keterangan.png`.
- **Screen recording wajib** bila bug intermiten atau bergantung pada urutan interaksi.
- **Console log wajib** bila ada error JavaScript (`TypeError`, `ReferenceError`, HTTP 5xx).

* **Screenshot**: `evidence-uts/Test-Run/TCxx/01_keterangan.png`
* **Screen Recording (jika intermiten)**: `evidence-uts/recordings/BUG-XXX_judul.mp4`
* **Console Logs / DOM Inspection (jika error JS)**:
  ```html
  <!-- Markup elemen yang diperiksa -->
  ```
  ```text
  [Console Error Log di sini]
  ```
* **Direct Image Attachment**:

#### Bukti 1: *[apa yang terlihat di gambar ini]*

<img width="1000" alt="BUG-XXX bukti 1" src="URL_GAMBAR_DARI_REPOSITORI" />

---

### 11. Notulen Triage Meeting (Catatan R5 / R1)
* **Tanggal Triage**: DD/MM/2026
* **Status**: `Confirmed` / `Need Clarification` / `Rejected` / `Duplicate`
* **Catatan Revisi**: *[2 sampai 3 kalimat: keputusan + alasan dampak + tindakan lanjutan]*

---

### Checklist Kualitas Bug Report (Verifikasi R5):
- [ ] Judul berbahasa Inggris, format `[AREA] kalimat imperatif`.
- [ ] Dapat direproduksi oleh anggota lain hanya dari langkah di atas.
- [ ] Hasil di versi tanpa cacat dicantumkan pada Expected Result.
- [ ] Tidak duplikat (akar masalah sama disatukan, halaman terdampak didaftarkan).
- [ ] Memiliki evidence sesuai aturan: layar penuh, rekaman bila intermiten, console log bila error JS.
- [ ] Severity dan Priority beralasan kuat serta konsisten satu sama lain.
- [ ] Sudah ditautkan ke eksekusi FAIL di Kiwi TCMS dan URL issue sudah dikomentarkan di sana.
- [ ] Perilaku yang identik dengan versi oracle bukan bug - pindahkan ke Session Notes sebagai observasi.
