# GitHub Issue #13: [R3-CH-01] Exploratory Testing - Add to Cart dan Pengelolaan Keranjang

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/13](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/13)  
**Author**: @nuzul-hanifa  
**Labels**: `role: R3-Exploratory`, `charter:chr-001`, `env:chrome`, `module:cart`, `sbtm:test-charter`, `status:triaged`, `status:verified-in-kiwi`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Charter Identity & Mission

* **Charter ID**: `CHR-001`
* **Tester Name**: Nuzul Hanifa
* **Target Area / Module**: Keranjang Belanja (module:cart)

### Charter Mission
Mengeksplorasi fitur Keranjang Belanja (module:cart) dengan menambahkan produk ke keranjang, mengubah quantity, mencoba menghapus produk, dan mengamati badge counter keranjang untuk menemukan masalah fungsionalitas, validasi quantity, penghapusan produk, serta ketidaksesuaian jumlah produk pada badge dengan isi keranjang.

---

## 2. Prepared Test Data
- **Produk:** Produk yang tersedia pada halaman katalog.
- **Quantity:** Quantity awal, quantity normal (1 atau lebih), dan quantity 0.
- **Aksi:** Add to Cart, mengubah quantity, menekan tombol hapus (X), serta mengamati badge counter.
- **Kondisi awal:** Buka aplikasi dan pastikan halaman katalog dapat diakses.
- **Kondisi pengamatan:** Catat perubahan isi keranjang, pesan yang muncul, respons tombol hapus, dan jumlah pada badge setelah setiap aksi.

---

## 3. Test Case Registration in Kiwi TCMS
Test Charter ini didaftarkan di Kiwi TCMS sebagai test case dengan kategori **Exploratory** dan prioritas **P2**, sesuai ketentuan tugas T5.

- **Nama Test Case:** [R3-CH-01] Exploratory Testing - Add to Cart dan Pengelolaan Keranjang
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
