# GitHub Issue #16: [BUG-009] Cart allows negative quantity (-1) input without client-side prevention

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/16](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/16)  
**Author**: @Bagas-Fomo1  
**Labels**: `role: R5-DefectManager`, `module:cart`, `priority:p2`, `severity:major`, `status:triaged`, `technique:negative-testing`, `type:ui-ux-defect`, `status:verified-in-kiwi`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Identity & Classification

* **1.1 Issue ID**: `BUG-009`
* **1.2 Reporter Role**: R5 - Defect Management Engineer
* **1.3 Issue Category**: Bug - Cacat fungsional (perilaku menyimpang dari acuan)
* **1.4 Affected Area / Feature**: Keranjang (Cart)
* **1.5 Testing Technique**: Negative Testing (T3)
* **1.6 Defect Type**: Data Validation
* **1.7 Affected URL**: `https://with-bugs.practicesoftwaretesting.com/#/checkout`

---

## 2. Impact & Priority Assessment

### 2.1 Impact & Scope
- Pengguna terdampak: Seluruh pengguna yang mengubah kuantitas barang secara manual di keranjang belanja.
- Frekuensi: Selalu (100% reproduksi saat mengetikkan angka negatif).
- Cakupan: Kontrol kuantitas [data-test="product-quantity"] pada alur Step 1 CART.
- Konsekuensi: Nilai negatif tidak ditolak di antarmuka, tombol 'Proceed to checkout' tetap aktif dan dapat diklik dengan kuantitas -1, memicu inkonsistensi kalkulasi keranjang dan merusak integritas transaksi e-commerce.

### 2.2 Severity (Technical Impact)
**Major - Fungsi inti salah, masih ada workaround**
* **Severity Justification**:  
  Dipilih Major karena mengizinkan kuantitas negatif menyalahi logika bisnis e-commerce (jumlah barang fisik harus >= 1). Meskipun tombol checkout dapat diakses dan setelah hard-refresh kuantitas ter-reset, ketiadaan validasi sisi klien langsung merusak integritas data transaksi.

### 2.3 Priority (Business Urgency)
**P2 - High (harus diperbaiki sebelum rilis pada sprint berjalan)**
* **Priority Justification**:  
  P2 karena berkaitan langsung dengan alur transaksi utama dan kepatuhan Quality Gate batas kuantitas keranjang, setara dengan BUG-003 (kuantitas 0).

---

## 3. Test Environment & Affected Variants

### 3.1 Test Environment
- OS: Windows 11 (64-bit)
- Browser: Google Chrome Desktop (1920x1080)
- Viewport: Desktop 1920x1080
- Build: Sprint 5 Staging (AUT with-bugs) - Build #14
- Acuan normal (Oracle): https://practicesoftwaretesting.com
- Akun uji: customer@practicesoftwaretesting.com (dummy user terdaftar)

### 3.2 Affected Pages / Variants
- `#/checkout` Step 1 CART - Kolom Kuantitas `[data-test="product-quantity"]`

---

## 4. Steps to Reproduce & Oracle Comparison

### 4.1 Pre-conditions
1. Pengguna membuka aplikasi AUT with-bugs.
2. Keranjang belanja berisi minimal 1 unit Combination Pliers ($14.15).
3. Halaman berada pada #/checkout Step 1 CART.

### 4.2 Steps to Reproduce
1. Buka halaman keranjang belanja `#/checkout`.
2. Fokus pada field input kuantitas `[data-test="product-quantity"]`.
3. Kosongkan field lalu ketik `-1`.
4. Tekan tombol Tab atau klik ke luar field untuk memicu validasi.
5. Amati respon validasi input dan status tombol "Proceed to checkout".

### 4.3 Actual Result (AUT with-bugs)
Field kuantitas menerima input "-1" tanpa pesan validasi error, nilai "-1" tetap tertulis pada form, dan tombol "Proceed to checkout" [data-test="proceed-1"] tetap aktif dan dapat diklik.

### 4.4 Expected Result (Reference Benchmark Oracle)
Pada acuan normal https://practicesoftwaretesting.com (rentang sah min=1, max=99), nilai negatif wajib ditolak seketika (auto-correct ke 1) atau form menampilkan error validasi "Quantity must be at least 1" serta menonaktifkan tombol proceed.

---

## 5. Evidence & Attachments

### 5.1 Evidence Files
- evidence-uts/Test-Run/TC96/01_keranjang_awal_sebelum_qty_minus.png - Keranjang belanja awal sebelum input kuantitas negatif
- evidence-uts/Test-Run/TC96/02_input_kuantitas_minus_1.png - Kuantitas bernilai -1 diterima tanpa pesan error dan proceed tetap aktif
- evidence-uts/Test-Run/TC96/03_kondisi_setelah_refresh_kuantitas_kembali_1.png - Observasi pasca refresh kuantitas kembali ke 1 unit
- Console: Tidak ada uncaught error JavaScript

### 5.2 Evidence Types Provided
- [x] Screenshot layar penuh (bukan crop)
- [ ] Screen recording (wajib bila bug intermiten atau bergantung urutan interaksi)
- [ ] Console log (wajib bila ada error JavaScript / HTTP 5xx)
- [x] DOM / API inspection (markup elemen, respons endpoint)

---

## 6. Traceability & De-duplication

### 6.1 Kiwi TCMS Execution Link
* **Execution Link**: https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/103/ (TC-96 - T3-NEG-08)

### 6.2 Duplicate Verification
- Kata kunci yang dicari: `negative quantity`, `kuantitas negatif`, `qty minus`
- Hasil: Belum ada issue yang dibuat untuk kuantitas negatif.
- Perbandingan dengan BUG-003: BUG-003 fokus pada kuantitas 0 (zero boundary), sedangkan temuan ini adalah domain nilai negatif (-1) yang menguji penanganan input bertanda minus pada kontrol numerik.

---

## 7. R5 Quality Review & Triage Minutes

### 7.1 Proposed Fix
Tambahkan atribut min="1" pada elemen input kuantitas [data-test="product-quantity"] serta handler onInput/onChange untuk mencegah input karakter minus (-).

### 7.2 Defect Triage Meeting Minutes (Verified by R5 & R1)
> During the defect triage meeting on October 21, 2026, the team verified and confirmed this defect on Google Chrome Desktop using AUT staging build #14. The defect classification was solidified at Severity: Major and Priority: P2 based on its direct impact on the shopping cart/checkout flow and alignment with Sprint 5 Quality Gate rules. Traceability was validated against Kiwi TCMS execution results, and remediation was scheduled for the current sprint.

### 7.3 R5 Validity Quality Gate (Verification Checklist)
- [x] **Reproducibility**: Clear and deterministic steps provided.
- [x] **Oracle Specification**: Benchmarked against `practicesoftwaretesting.com`.
- [x] **Non-duplicate**: Root cause verified as unique across active defect register.
- [x] **Evidence Complete**: Verified full-screen screenshots / logs attached.
- [x] **Severity & Priority Justified**: Sizing strictly follows the project matrix.
- [x] **Kiwi TCMS Traceability**: Execution record linked and cross-referenced.
