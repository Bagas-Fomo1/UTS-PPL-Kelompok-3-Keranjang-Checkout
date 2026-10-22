# GitHub Issue #14: [R3-CH-02] Exploratory Testing - Checkout dan Validasi Pesanan

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/14](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/14)  
**Author**: @nuzul-hanifa  
**Labels**: `charter:chr-002`, `env:chrome`, `sbtm:test-charter`, `status:triaged`, `status:verified-in-kiwi`, `module:checkout-payment`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Charter Identity & Mission

* **Charter ID**: `CHR-002`
* **Tester Name**: Nuzul Hanifa
* **Target Area / Module**: Checkout Step 3 - Konfirmasi & Invoice (module:checkout-complete)

### Charter Mission
Mengeksplorasi alur Checkout dan Validasi Pesanan dengan menguji proses melanjutkan checkout, validasi quantity produk, serta konfirmasi pesanan untuk menemukan masalah pada validasi sebelum checkout, kalkulasi pembayaran, dan pembaruan status keranjang setelah pesanan dikonfirmasi.

---

## 2. Prepared Test Data
- **Produk:** Produk yang tersedia dan dapat ditambahkan ke keranjang.
- **Quantity:** Quantity normal (1 atau lebih) dan quantity 0.
- **Kondisi awal:** Tambahkan produk ke keranjang dan lanjutkan ke halaman Checkout.
- **Aksi:** Coba melanjutkan checkout dengan quantity 0, periksa informasi dan total pesanan, lalu lanjutkan ke konfirmasi pesanan.
- **Pengamatan:** Catat apakah validasi quantity berjalan, apakah total pembayaran sesuai, dan apakah badge serta isi keranjang diperbarui setelah konfirmasi.

---

## 3. Test Case Registration in Kiwi TCMS
Test Charter ini didaftarkan di Kiwi TCMS sebagai test case dengan kategori **Exploratory** dan prioritas **P2**, sesuai ketentuan tugas T5.

- **Nama Test Case:** [R3-CH-02] Exploratory Testing - Checkout dan Validasi Pesanan
- **Kategori:** Exploratory
- **Prioritas:** P2
- **Durasi sesi:** 30 menit
- **Tester:** R3 (Exploratory Tester)

Pelaksanaan eksplorasi didokumentasikan dalam Session Notes yang mencatat aktivitas pengujian, temuan, dan rasio waktu dengan total 100%.

---

## 4. R5 Review & Triage Minutes
> Reviewed and confirmed during exploratory test planning triage on October 21, 2026. The scope and time-box of this SBTM charter were approved by QA Lead (R1) and Defect Manager (R5) to ensure full exploratory coverage of core customer journeys.

### Quality Gate Check
- [x] Charter mission clearly states exploration goal, target modules, and user perspective.
- [x] Scope adheres to time-box exploration principles.
- [x] Integrated with Kiwi TCMS test run tracking.
