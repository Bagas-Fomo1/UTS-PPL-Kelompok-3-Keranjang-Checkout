---
name: "🐞 Bug Report (Standard Markdown)"
about: "Template pelaporan bug dalam format Markdown standar untuk CilacapTools"
title: "[BUG-XXX]: [English Title] / [Judul Bahasa Indonesia]"
labels: "status: unconfirmed, needs-review"
assignees: ""
---

### 1. Informasi Dasar (General Information)
* **ID Bug**: BUG-XXX
* **Judul (English)**: *[Brief English description of the bug]*
* **Judul (Indonesia)**: *[Deskripsi singkat bug dalam Bahasa Indonesia]*
* **Role Pelapor**: R1 / R2 / R3 / R4 / R5
* **Area / Fitur Terdampak**: Keranjang / Checkout / Login / Beranda
* **URL Terdampak**: `https://with-bugs.practicesoftwaretesting.com/#/...`
* **Test Case & Eksekusi Kiwi TCMS**: [Link Eksekusi FAIL di Kiwi](https://reg-beings-nurse-month.trycloudflare.com/)

---

### 2. Klasifikasi Keparahan & Prioritas
* **Severity**: `Critical` / `Major` / `Minor` / `Trivial`
  * **Alasan Severity**: *[Jelaskan mengapa severity ini dipilih berdasarkan dampak teknis]*
* **Priority**: `P1` / `P2` / `P3` / `P4`
  * **Alasan Priority**: *[Jelaskan urgensi perbaikan bug ini bagi bisnis CilacapTools / Quality Gate]*

---

### 3. Lingkungan Pengujian (Test Environment)
* **Perangkat / OS**: Windows 11 / macOS / Android / iOS
* **Browser**: Google Chrome v129 / Firefox v131 / Edge v129
* **Viewport / Resolusi Layar**: Desktop (1920x1080) / Mobile (375x667, 390x844, 412x915, 820x1180)
* **Versi Build**: Sprint 5 Staging (with-bugs)

---

### 4. Prasyarat (Pre-conditions)
1. Pengguna telah login dengan akun valid (dummy user).
2. Terdapat minimal satu item di dalam keranjang belanja.

---

### 5. Langkah-Langkah Reproduksi (Steps to Reproduce)
1. Akses halaman AUT: `https://with-bugs.practicesoftwaretesting.com`
2. ...
3. ...
4. ...

---

### 6. Hasil Aktual vs Hasil yang Diharapkan
* **Actual Result (AUT with-bugs)**:
  > *[Tuliskan apa yang sebenarnya terjadi, pesan error, atau perilaku salah yang muncul]*

* **Expected Result (Acuan Normal practicesoftwaretesting.com)**:
  > *[Tuliskan perilaku normal yang seharusnya terjadi mengacu pada versi tanpa bug]*

---

### 7. Bukti / Evidence
* **Screenshot**: `evidence-uts/screenshots/BUG-XXX_judul-singkat.png` *(Lampirkan screenshot layar penuh)*
* **Screen Recording (jika ada)**: `evidence-uts/recordings/BUG-XXX_judul-singkat.mp4`
* **Console Logs (jika ada error JS)**:
  ```text
  [Console Error Log di sini]
  ```

---

### 8. Notulen Triage Meeting (Catatan R5 / R1)
* **Tanggal Triage**: DD/MM/2026
* **Status**: `Confirmed` / `Need Clarification` / `Rejected`
* **Catatan Revisi**: *[2 sampai 3 kalimat penjelasan keputusan triage]*

---

### Checklist Kualitas Bug Report (Verifikasi R5):
- [ ] Dapat direproduksi oleh anggota lain hanya dari langkah di atas.
- [ ] Hasil di versi tanpa cacat dicantumkan pada Expected Result.
- [ ] Tidak duplikat (akar masalah sama disatukan).
- [ ] Memiliki evidence yang jelas dan sesuai format penamaan.
- [ ] Severity dan Priority beralasan kuat.
- [ ] Sudah ditautkan ke eksekusi FAIL di Kiwi TCMS.
