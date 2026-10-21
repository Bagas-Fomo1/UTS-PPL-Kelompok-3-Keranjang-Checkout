# 📝 Notulen Rapat Triage Cacat (Defect Triage Meeting Minutes)
**Proyek**: CilacapTools Staging Sprint 5  
**Fokus Pengujian**: Keranjang & Checkout (+ Login & Beranda)  
**Kelompok**: Kelompok 3  
**Dipimpin oleh**: R1 (QA Lead & Test Manager)  
**Notulis & Verifikator**: R5 (Defect Management Engineer)

---

## Informasi Pelaksanaan Triage

* **Tanggal Pelaksanaan**: [Contoh: 21 Oktober 2026]
* **Waktu**: [Contoh: 19:30 - 20:45 WIB]
* **Media / Lokasi**: Google Meet / Lab Praktikum
* **Daftar Hadir**:
  1. R1 (QA Lead & Test Manager): [Nama] - Hadir
  2. R2 (Test Analyst): [Nama] - Hadir
  3. R3 (Exploratory Tester): [Nama] - Hadir
  4. R4 (Compatibility & Accessibility Tester): [Nama] - Hadir
  5. R5 (Defect Management Engineer): Bagas - Hadir

---

## Agenda Rapat
1. Pemeriksaan kualitas laporan bug baru (kelengkapan langkah reproduksi dan evidence).
2. Verifikasi perilaku acuan vs perilaku AUT pada versi tanpa bug.
3. Penyelarasan serta penyesuaian Severity dan Priority.
4. Identifikasi bug duplikat atau bug yang tidak valid (*not a bug*).
5. Keputusan akhir status bug untuk dimasukkan ke laporan akhir Bab VI.

---

## Ringkasan Pembahasan & Keputusan Triage (2-3 Kalimat per Bug)

> *Format Catatan Triage*: Tuliskan 2 sampai 3 kalimat per bug yang direvisi/dikonfirmasi, memuat alasan penyesuaian severity/priority atau persetujuan status valid.

### 1. BUG-001: [Judul Singkat]
* **URL Issue**: `#1`
* **Severity Awal / Akhir**: Major ➔ Critical
* **Priority Awal / Akhir**: P2 ➔ P1
* **Notulen Triage**:
  > Bug diverifikasi dan dikonfirmasi dapat direproduksi pada Chrome dan Edge saat checkout dengan 2 item berbeda. Tim sepakat menaikkan severity menjadi Critical dan priority menjadi P1 karena transaksi gagal diproses dan memblokir kriteria Quality Gate. Tautan eksekusi Kiwi TCMS telah divalidasi pada Test Run #1.

---

### 2. BUG-002: [Judul Singkat]
* **URL Issue**: `#2`
* **Severity Awal / Akhir**: Minor ➔ Minor
* **Priority Awal / Akhir**: P2 ➔ P3
* **Notulen Triage**:
  > Masalah inkonsistensi label diskon pada keranjang telah diperiksa terhadap acuan normal. Ditetapkan tetap ber-severity Minor karena pengguna masih dapat melanjutkan transaksi tanpa kehilangan data. Priority diturunkan ke P3 karena terdapat workaround dan tidak menggagalkan rilis Sprint 5.

---

### 3. BUG-003: [Judul Singkat]
* **URL Issue**: `#3`
* **Severity Awal / Akhir**: [Awal] ➔ [Akhir]
* **Priority Awal / Akhir**: [Awal] ➔ [Akhir]
* **Notulen Triage**:
  > [Tuliskan 2-3 kalimat penjelasan kesepakatan tim]

---

### 4. BUG-004: [Judul Singkat]
* **URL Issue**: `#4`
* **Severity Awal / Akhir**: [Awal] ➔ [Akhir]
* **Priority Awal / Akhir**: [Awal] ➔ [Akhir]
* **Notulen Triage**:
  > [Tuliskan 2-3 kalimat penjelasan kesepakatan tim]

---

*(Lanjutkan format ini hingga minimal 10 bug report yang dilaporkan oleh kelompok)*
