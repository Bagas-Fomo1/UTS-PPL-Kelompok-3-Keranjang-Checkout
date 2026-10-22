# Register Rekapitulasi Bug (Bug Tracking Register)
**Mata Kuliah**: Praktikum Pengujian Perangkat Lunak  
**Kelompok**: Kelompok 3  
**Fokus**: Keranjang dan Checkout (+ Login & Beranda)  
**Dokumentasi untuk**: Bab VI Laporan UTS  
**Terakhir diperbarui**: 22 Oktober 2026

---

## Ringkasan Angka

| Metrik | Nilai | Sumber |
|---|---:|---|
| Total eksekusi Test Run 15 | 32 | Kiwi TCMS TR-15 |
| Eksekusi PASSED | 18 | Kiwi TCMS TR-15 |
| Eksekusi FAILED | 14 | Kiwi TCMS TR-15 |
| Issue GitHub terdaftar | 5 | BUG-001 s/d BUG-005 |
| Eksekusi FAILED yang belum ber-issue | 6 | Lihat Tabel 2 |
| Defect density (issue terdaftar / total test case) | 15,6% | 5 / 32 x 100% |

> Register ini hanya memuat temuan yang benar-benar memiliki issue GitHub dan tertaut ke eksekusi FAIL di Kiwi TCMS. Entri lama pada register sebelumnya tidak dipertahankan karena tidak memiliki issue maupun eksekusi pendukung.

---

## Tabel 1. Daftar Cacat Terdaftar (Master Defect List)

| ID Bug | Judul Bug (English / Indonesia) | Area / Fitur | Severity | Priority | Status | URL GitHub Issue | Test Case & Eksekusi Kiwi | Reporter (Role) |
| :---: | :--- | :--- | :---: | :---: | :---: | :--- | :--- | :---: |
| **BUG-001** | Cart line total shows $00.00 for every quantity while grand total is correct / Total baris keranjang selalu $00.00 padahal Grand Total benar | Keranjang | Major | P2 | `needs-triage` | [Issue #8](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/8) | TC-80 (TE-87), TC-82 (TE-89), TC-83 (TE-90), TC-84 (TE-91) | R2 - Aditya Agung Triwibowo |
| **BUG-002** | Cart quantity is capped at 10 units while the reference build allows 99 / Kuantitas keranjang dibatasi 10 padahal acuan oracle mengizinkan 99 | Keranjang | Major | P2 | `needs-triage` | [Issue #9](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/9) | TC-81 (TE-88) | R2 - Aditya Agung Triwibowo |
| **BUG-003** | Cart accepts quantity 0 and keeps a $0.00 order line without any validation / Keranjang menerima kuantitas 0 dan menyisakan baris pesanan $00.00 tanpa validasi | Keranjang | Major | P2 | `needs-triage` | [Issue #10](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/10) | TC-79 (TE-86) | R2 - Aditya Agung Triwibowo |
| **BUG-004** | Missing accessible form labels on shipping address fields and disabled focus outline indicator on checkout form / Ketiadaan label formulir aksesibel pada isian alamat pengiriman dan indikator cincin fokus dinonaktifkan pada checkout | Checkout - Alur Pengiriman & Alamat | Critical | P1 | `needs-triage` | [Issue #11](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/11) | TC-107 (TE-114) | R4 - Annisa Fitria Utami |
| **BUG-005** | Low color contrast ratio on product description text and missing alternative text on main product image / Rasio kontras warna rendah pada teks deskripsi produk dan ketiadaan teks alternatif pada gambar utama produk | Detail Produk | Major | P2 | `needs-triage` | [Issue #12](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/12) | TC-106 (TE-113) | R4 - Annisa Fitria Utami |

Catatan: ketiga issue masih berstatus `needs-triage` sehingga severity dan priority di atas adalah usulan pelapor dan belum dikunci oleh R5/R1.

---

## Tabel 2. Eksekusi FAILED yang Belum memiliki Issue

Eksekusi berikut sudah berstatus FAILED di TR-15 tetapi belum dilaporkan sebagai issue GitHub. Pemilik eksekusi perlu membuat laporan agar rasio 14 FAILED terhadap issue yang ada tidak menimbulkan pertanyaan saat responsi.

| Test Execution | Test Case | Judul Test Case | Penguji | Status | Tindak Lanjut |
| :---: | :---: | :--- | :---: | :---: | :--- |
| TE-84 | TC-77 | [R3-CH-01] Exploratory Testing - Add to Cart dan Pengelolaan Keranjang | nuzul | FAILED | Lapor oleh R3, verifikasi R5 |
| TE-85 | TC-78 | [R3-CH-02] Exploratory Testing - Checkout dan Validasi Pesanan | nuzul | FAILED | Lapor oleh R3, verifikasi R5 |
| TE-99 | TC-92 | [T3-NEG-04] Postcode 300 karakter (batas panjang tidak dibatasi) | bagas | FAILED | Lapor oleh R5 |
| TE-103 | TC-96 | [T3-NEG-08] Nilai negatif pada field quantity | bagas | FAILED | Lapor oleh R5 (akar masalah sama dengan BUG-003, pertimbangkan penggabungan) |
| TE-107 | TC-100 | [T4-FLOW-04] Ubah kuantitas keranjang dan kalkulasi total | christian | FAILED | Lapor oleh R1, cek irisan dengan BUG-001 |
| TE-108 | TC-101 | [T4-FLOW-05] Hapus item dari keranjang | christian | FAILED | Lapor oleh R1 |

---

## Rincian Alasan Severity dan Priority

### BUG-001: Cart line total shows $00.00
* **Alasan Severity (Major)**: Kolom Total baris adalah angka moneter yang dipakai pengguna memverifikasi biaya per item. Nilainya salah pada seluruh kuantitas yang diuji (1, 9, 10, 99), tetapi alur checkout masih dapat diselesaikan karena Grand Total benar sehingga tidak mencapai Critical.
* **Alasan Priority (P2)**: Menyangkut nominal pembayaran pada alur transaksi utama Sprint 5, tetapi tidak memblokir penyelesaian checkout.
* **Akar masalah**: kolom Total baris tidak dihitung ulang dari Price x Quantity; satu perbaikan menutup empat test case sekaligus.

### BUG-002: Cart quantity capped at 10
* **Alasan Severity (Major)**: Pembelian 11 unit yang sah menurut acuan (rentang 1-99) dipotong menjadi 10 tanpa pemberitahuan, sehingga pengguna tidak dapat menyelesaikan pesanan sesuai jumlah yang diinginkan. Masih ada workaround berupa penambahan baris terpisah.
* **Alasan Priority (P2)**: Menghambat skenario penjualan grosir dan menyangkut integritas nilai pesanan, tetapi tidak memblokir seluruh alur checkout.
* **Akar masalah**: atribut `max="10"` pada kontrol keranjang, sedangkan kontrol kuantitas di halaman detail produk pada aplikasi yang sama sudah memakai `max="99"`.

### BUG-003: Cart accepts quantity 0
* **Alasan Severity (Major)**: Kuantitas 0 berada di bawah batas minimum transaksi (1 unit) namun diterima, item tetap bertahan, dan tombol proceed-1 tetap aktif. Dampaknya integritas transaksi, tetapi pengguna masih dapat memperbaiki nilainya secara manual.
* **Alasan Priority (P2)**: Menyangkut validasi batas bawah pada alur transaksi utama, setara dengan laporan kuantitas negatif (TE-103) yang belum ber-issue.
* **Akar masalah**: tidak ada validasi batas bawah pada `[data-test=product-quantity]` (`min="0"`).

---

## Distribusi Cacat Terdaftar

| Dimensi | Distribusi |
| :--- | :--- |
| Severity | Major: 3 |
| Priority | P2: 3 |
| Area | Keranjang: 3 |
| Teknik pengujian | Boundary Value Analysis (T2): 3 |
| Status alur | `needs-triage`: 3 |

Kesimpulan sementara: seluruh cacat terdaftar terkonsentrasi pada satu komponen, yaitu kontrol kuantitas keranjang (`[data-test=product-quantity]`) dan kolom Total baris. Ini menunjukkan area keranjang sebagai titik paling rawan pada build Sprint 5 dan layak menjadi prioritas perbaikan sebelum rilis.

---

## Riwayat Perubahan Register

| Tanggal | Perubahan |
| :--- | :--- |
| 22 Oktober 2026 | Register disusun ulang mengikuti issue nyata di repositori: BUG-001 s/d BUG-003. Entri lama BUG-001 s/d BUG-010 dihapus karena tidak memiliki issue maupun eksekusi pendukung. Ditambahkan Tabel 2 berisi eksekusi FAILED yang belum dilaporkan. |
