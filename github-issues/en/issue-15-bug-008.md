# GitHub Issue #15: [BUG-008] Checkout postcode field accepts 300 characters without length restriction

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/15](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/15)  
**Author**: @Bagas-Fomo1  
**Labels**: `role: R5-DefectManager`, `priority:p3`, `severity:minor`, `status:triaged`, `technique:negative-testing`, `status:verified-in-kiwi`, `module:checkout-address`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Identity & Classification

* **1.1 Issue ID**: `BUG-008`
* **1.2 Reporter Role**: R5 - Defect Management Engineer
* **1.3 Issue Category**: Bug - Cacat fungsional (perilaku menyimpang dari acuan)
* **1.4 Affected Area / Feature**: Checkout - Alur Pengiriman & Alamat
* **1.5 Testing Technique**: Negative Testing (T3)
* **1.6 Defect Type**: Data Validation
* **1.7 Affected URL**: `https://with-bugs.practicesoftwaretesting.com/#/checkout`

---

## 2. Impact & Priority Assessment

### 2.1 Impact & Scope
- Pengguna terdampak: Pembeli yang memasukkan data alamat pengiriman atau mencoba input string panjang.
- Frekuensi: Selalu (100% reproduksi saat input string panjang di-paste).
- Cakupan: Field Postcode pada formulir alamat Step 3 ADDRESS.
- Konsekuensi: Formulir mengizinkan payload teks raksasa (300+ karakter) masuk ke database pesanan tanpa pembatasan buffer, berpotensi memicu layout distortion pada invoice serta masalah sinkronisasi dengan API kurir/ekspedisi pengiriman.

### 2.2 Severity (Technical Impact)
**Minor - Ketidaknyamanan kecil, salah pesan validasi, layout fungsional**
* **Severity Justification**:  
  Dipilih Minor karena alur checkout tetap dapat berjalan hingga pembayaran dan tidak menyebabkan crash sistem atau HTTP 500 error, namun terjadi kegagalan validasi batas buffer input (ketiadaan atribut maxlength) yang menyalahi standar field kode pos internasional.

### 2.3 Priority (Business Urgency)
**P3 - Medium (dapat ditunda ke siklus berikutnya)**
* **Priority Justification**:  
  P3 karena tidak memblokir konversi transaksi dan tidak membatalkan alur utama checkout, sehingga perbaikan pembatasan karakter dapat diselesaikan pada siklus patch berikutnya.

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
- `#/checkout` Step 3 ADDRESS - Field Postcode `[data-test="postcode"]`

---

## 4. Steps to Reproduce & Oracle Comparison

### 4.1 Pre-conditions
1. Pengguna telah login dengan akun valid pada AUT with-bugs.
2. Keranjang belanja berisi minimal 1 unit produk.
3. Alur checkout telah berada pada Step 3 ADDRESS.

### 4.2 Steps to Reproduce
1. Buka formulir alamat pengiriman pada alur `#/checkout` Step 3 ADDRESS.
2. Tempelkan (paste) string 300 karakter 'A' pada field Postcode `[data-test="postcode"]`.
3. Lengkapi seluruh field alamat lainnya dengan data yang valid.
4. Klik tombol lanjut `[data-test="proceed-3"]`.
5. Amati respon formulir dan transisi ke Step 4 PAYMENT.

### 4.3 Actual Result (AUT with-bugs)
Field postcode menerima seluruh 300 karakter tanpa pembatasan (tidak ada atribut maxlength), tidak ada pesan error validasi batasan panjang, dan sistem mengizinkan pengguna melanjutkan checkout ke Step 4 PAYMENT dengan 300 karakter utuh.

### 4.4 Expected Result (Reference Benchmark Oracle)
Pada acuan normal https://practicesoftwaretesting.com dan standar kode pos internasional (maksimal 10-12 karakter), sistem wajib membatasi panjang input melalui atribut maxlength (misal max 10 atau 20 karakter) atau menolak submit dengan pesan error validasi "Postcode exceeds maximum length".

---

## 5. Evidence & Attachments

### 5.1 Evidence Files
- evidence-uts/Test-Run/TC92/01_input_postcode_300_karakter.png - Input 300 karakter 'A' diterima pada field postcode tanpa peringatan
- evidence-uts/Test-Run/TC92/02_observasi_overflow_dan_validasi.png - Observasi ketiadaan pembatasan validasi dan panjang teks
- evidence-uts/Test-Run/TC92/03_respon_submit_panjang_ke_payment.png - Tombol proceed-3 sukses memproses dan lanjut ke step 4 payment dengan 300 karakter utuh
- Console: Tidak ditemukan error JavaScript

### 5.2 Evidence Types Provided
- [x] Screenshot layar penuh (bukan crop)
- [ ] Screen recording (wajib bila bug intermiten atau bergantung urutan interaksi)
- [ ] Console log (wajib bila ada error JavaScript / HTTP 5xx)
- [x] DOM / API inspection (markup elemen, respons endpoint)

---

## 6. Traceability & De-duplication

### 6.1 Kiwi TCMS Execution Link
* **Execution Link**: https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/99/ (TC-92 - T3-NEG-04)

### 6.2 Duplicate Verification
- Kata kunci yang dicari: `postcode`, `zip`, `address length`, `maxlength`
- Hasil: Tidak ada issue terbuka yang melaporkan ketiadaan batas panjang pada field postcode.
- Issue terkait: Issue #7 (spesial karakter pada alamat - fokus pada sanitasi, bukan batas buffer panjang).

---

## 7. R5 Quality Review & Triage Minutes

### 7.1 Proposed Fix
Tambahkan atribut maxlength="10" atau validasi regex batas karakter pada elemen input [data-test="postcode"] di form alamat checkout.

### 7.2 Defect Triage Meeting Minutes (Verified by R5 & R1)
> During the defect triage meeting on October 21, 2026, the team verified and confirmed this defect on Google Chrome Desktop using AUT staging build #14. The defect classification was solidified at Severity: Minor and Priority: P3 based on its direct impact on the shopping cart/checkout flow and alignment with Sprint 5 Quality Gate rules. Traceability was validated against Kiwi TCMS execution results, and remediation was scheduled for the current sprint.

### 7.3 R5 Validity Quality Gate (Verification Checklist)
- [x] **Reproducibility**: Clear and deterministic steps provided.
- [x] **Oracle Specification**: Benchmarked against `practicesoftwaretesting.com`.
- [x] **Non-duplicate**: Root cause verified as unique across active defect register.
- [x] **Evidence Complete**: Verified full-screen screenshots / logs attached.
- [x] **Severity & Priority Justified**: Sizing strictly follows the project matrix.
- [x] **Kiwi TCMS Traceability**: Execution record linked and cross-referenced.
