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
| Issue GitHub terdaftar | 8 | BUG-001 s/d BUG-009 (BUG-007 tidak terpakai) |
| Eksekusi FAILED yang belum ber-issue | 2 | Lihat Tabel 2 |
| Defect density (issue terdaftar / total test case) | 25,0% | 8 / 32 x 100% |

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
| **BUG-006** | Cart item delete button is unclickable (dead click) preventing item removal / Tombol hapus item keranjang tidak dapat diklik sehingga item tidak dapat dihapus | Keranjang | Critical | P1 | `needs-triage` | [Issue #17](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/17) | TC-101 (TE-108) | R1 - Christian Luis Paskalis Ginting |
| **BUG-008** | Checkout postcode field accepts 300 characters without length restriction / Field kode pos menerima 300 karakter tanpa batas panjang atau pesan validasi | Checkout - Alur Pengiriman & Alamat | Minor | P3 | `needs-triage` | [Issue #15](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/15) | TC-92 (TE-99) | R5 - Bagas Agung Krisnawan |
| **BUG-009** | Cart allows negative quantity (-1) input without client-side prevention / Kuantitas negatif (-1) diterima pada keranjang tanpa pencegahan di sisi klien | Keranjang | Major | P2 | `needs-triage` | [Issue #16](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/16) | TC-96 (TE-103) | R5 - Bagas Agung Krisnawan |

Catatan: ketiga issue masih berstatus `needs-triage` sehingga severity dan priority di atas adalah usulan pelapor dan belum dikunci oleh R5/R1.

---

## Tabel 2. Eksekusi FAILED yang Belum memiliki Issue

Eksekusi berikut sudah berstatus FAILED di TR-15 tetapi belum menghasilkan laporan cacat tersendiri. Keduanya berasal dari sesi exploratory yang charter-nya memang sudah didaftarkan sebagai test case, sehingga keputusannya bergantung pada triase.

| Test Execution | Test Case | Judul Test Case | Penguji | Status | Tindak Lanjut |
| :---: | :---: | :--- | :---: | :---: | :--- |
| TE-84 | TC-77 | [R3-CH-01] Exploratory Testing - Add to Cart dan Pengelolaan Keranjang | nuzul | FAILED | Charter sudah didaftarkan (issue #13); perlu keputusan triase apakah temuan sesi menjadi cacat tersendiri |
| TE-85 | TC-78 | [R3-CH-02] Exploratory Testing - Checkout dan Validasi Pesanan | nuzul | FAILED | Charter sudah didaftarkan (issue #14); perlu keputusan triase apakah temuan sesi menjadi cacat tersendiri |

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
| Severity | Critical: 2 · Major: 5 · Minor: 1 |
| Priority | P1: 2 · P2: 5 · P3: 1 |
| Area | Keranjang: 5 · Checkout Address: 2 · Detail Produk: 1 |
| Teknik pengujian | BVA (T2): 6 · Error Guessing (T3): 1 · T4: 1 |
| Status alur | `needs-triage`: 8 |

Kesimpulan sementara: lima dari delapan cacat berada pada area keranjang, dengan konsentrasi pada kontrol kuantitas (`[data-test=product-quantity]`), kolom Total baris, dan tombol hapus item. Area keranjang menjadi titik paling rawan pada build Sprint 5, diikuti formulir alamat yang menyumbang dua cacat aksesibilitas dan validasi panjang.

---

## Riwayat Perubahan Register

| Tanggal | Perubahan |
| :--- | :--- |
| 22 Oktober 2026 | Register disusun ulang mengikuti issue nyata di repositori: BUG-001 s/d BUG-003. Entri lama BUG-001 s/d BUG-010 dihapus karena tidak memiliki issue maupun eksekusi pendukung. Ditambahkan Tabel 2 berisi eksekusi FAILED yang belum dilaporkan. |
| 22 Oktober 2026 | Ditambahkan BUG-004 dan BUG-005 dari R4 (aksesibilitas). |
| 22 Oktober 2026 | Ditambahkan BUG-006 (R1), BUG-008 dan BUG-009 (R5). Tabel 2 menyusut menjadi dua eksekusi charter yang menunggu keputusan triase. Nomor BUG-007 tidak terpakai. |
