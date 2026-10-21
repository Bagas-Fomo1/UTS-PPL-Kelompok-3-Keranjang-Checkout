# 📊 Register Rekapitulasi Bug (Bug Tracking Register)
**Mata Kuliah**: Praktikum Pengujian Perangkat Lunak  
**Kelompok**: Kelompok 3  
**Fokus**: Keranjang dan Checkout (+ Login & Beranda)  
**Dokumentasi untuk**: Bab VI Laporan UTS

---

## Tabel Seluruh Cacat (Master Defect List)

| ID Bug | Judul Bug (English / Indonesia) | Area / Fitur | Severity | Priority | Status | URL GitHub Issue | Test Case Kiwi Terkait | Reporter (Role) |
| :---: | :--- | :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **BUG-001** | Total Cart Calculation Displays NaN / Total Harga Keranjang Bernilai NaN | Keranjang | Major | P1 | Confirmed | [Issue #1](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/1) | TC-012 | R2 |
| **BUG-002** | Proceed to Checkout Button Disabled / Tombol Checkout Tidak Aktif | Checkout | Critical | P1 | Confirmed | [Issue #2](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/2) | TC-015 | R1 |
| **BUG-003** | Missing Mandatory Field Warning on Payment / Peringatan Form Pembayaran Kosong Tidak Muncul | Checkout | Minor | P3 | Confirmed | [Issue #3](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/3) | TC-018 | R5 |
| **BUG-004** | Cart Items Duplicated on Page Refresh / Item Keranjang Terduplikasi Saat Refresh | Keranjang | Major | P2 | Confirmed | [Issue #4](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/4) | TC-020 | R3 |
| **BUG-005** | Checkout Layout Broken on 375px Mobile Viewport / Tampilan Checkout Berantakan di HP 375px | Kompatibilitas | Minor | P2 | Confirmed | [Issue #5](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/5) | TC-025 | R4 |
| **BUG-006** | Payment Method Radio Button Missing Accessible Name / Radio Button Pembayaran Tanpa Label Aksesibilitas | Aksesibilitas | Minor | P3 | Confirmed | [Issue #6](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/6) | TC-028 | R4 |
| **BUG-007** | Special Characters in Billing Address Causes 500 Error / Karakter Khusus di Alamat Menyebabkan Error 500 | Checkout | Major | P2 | Confirmed | [Issue #7](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/7) | TC-022 | R2 |
| **BUG-008** | Negative Quantity Allowed via Manual Input / Kuantitas Negatif Diizinkan pada Keranjang | Keranjang | Major | P1 | Confirmed | [Issue #8](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/8) | TC-023 | R5 |
| **BUG-009** | Cart Session Lost After Login State Switch / Sesi Keranjang Hilang Setelah Login | Keranjang / Login | Major | P2 | Confirmed | [Issue #9](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/9) | TC-010 | R1 |
| **BUG-010** | Typos in Order Confirmation Page / Kesalahan Ejaan pada Halaman Konfirmasi Pesanan | Checkout | Trivial | P4 | Confirmed | [Issue #10](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/10) | TC-030 | R3 |

---

## Rincian Alasan Severity dan Priority Tiap Bug

### BUG-001: Total Cart Calculation Displays NaN
* **Alasan Severity (Major)**: Kalkulasi total harga adalah fungsi inti e-commerce. Jika bernilai NaN, transaksi pembelian terhambat meskipun harga satuan produk masih tampil.
* **Alasan Priority (P1)**: Memblokir Quality Gate rilis Sprint 5 karena pelanggan tidak dapat memverifikasi nominal tagihan sebelum checkout.

### BUG-002: Proceed to Checkout Button Disabled
* **Alasan Severity (Critical)**: Pengguna sama sekali tidak dapat melanjutkan ke proses pembayaran meskipun semua prasyarat keranjang terpenuhi (jalan buntu tanpa workaround).
* **Alasan Priority (P1)**: Blocker mutlak. Build rilis tidak boleh diluncurkan jika pembeli tidak bisa melakukan checkout.

### BUG-003: Missing Mandatory Field Warning on Payment
* **Alasan Severity (Minor)**: Alur pembayaran tetap berjalan ketika data valid dimasukkan; hanya pesan validasi field wajib yang tidak informatif saat field dikosongkan.
* **Alasan Priority (P3)**: Tidak memblokir alur utama pembayaran, dapat diperbaiki pada iterasi perbaikan minor berikutnya.

*(Tambahkan penjelasan alasan untuk seluruh bug yang dilaporkan kelompok)*
