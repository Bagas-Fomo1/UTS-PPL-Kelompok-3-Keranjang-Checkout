# GitHub Issue #9: [BUG-002] Cart quantity is capped at 10 units while the reference build allows 99

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/9](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/9)  
**Author**: @AditCodeX  
**Labels**: `role: R2-Analyst`, `env:chrome`, `module:cart`, `priority:p2`, `severity:major`, `status:triaged`, `technique:bva`, `type:functional-bug`, `status:verified-in-kiwi`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Identity & Classification

* **1.1 Issue ID**: `BUG-002`
* **1.2 Reporter Role**: R2 - Test Analyst (Aditya Agung Triwibowo, 240109001)
* **1.3 Issue Category**: Bug - Cacat fungsional (perilaku menyimpang dari acuan)
* **1.4 Affected Area / Feature**: Keranjang (Cart)
* **1.5 Testing Technique**: Boundary Value Analysis (T2)
* **1.6 Defect Type**: Functional Bug
* **1.7 Affected URL**: `https://with-bugs.practicesoftwaretesting.com/#/checkout`

---

## 2. Impact & Priority Assessment

### 2.1 Impact & Scope
- Pengguna terdampak: pembeli grosir yang memesan lebih dari 10 unit.
- Frekuensi: selalu (100% reproduksi).
- Cakupan: kuantitas 11 dan seluruh nilai di atas 10.
- Konsekuensi: pesanan sah dipotong diam-diam menjadi 10 unit sehingga nilai tagihan berbeda dari yang diniatkan pengguna.

### 2.2 Severity (Technical Impact)
**Major - Fungsi inti salah, masih ada workaround**
* **Severity Justification**:  
  Pembelian 11 unit yang sah menurut acuan (rentang 1-99) dipotong menjadi 10 tanpa pemberitahuan, sehingga pengguna tidak dapat menyelesaikan pesanan sesuai jumlah yang diinginkan. Masih ada workaround berupa penambahan baris terpisah, sehingga tidak Critical.

### 2.3 Priority (Business Urgency)
**P2 - High (harus diperbaiki sebelum rilis pada sprint berjalan)**
* **Priority Justification**:  
  Menghambat skenario penjualan grosir dan menyangkut integritas nilai pesanan pada sprint berjalan, tetapi tidak memblokir seluruh alur checkout.

---

## 3. Test Environment & Affected Variants

### 3.1 Test Environment
- **OS**: Windows 10 Pro 22H2 (64-bit)
- **Browser**: Google Chrome 141.0.7390.55 (Official Build) (64-bit)
- **Viewport**: Desktop (1262x568)
- **Build**: Sprint 5 Staging (AUT with-bugs) - Build #14
- **Acuan normal (Oracle)**: https://practicesoftwaretesting.com
- **Akun uji**: asep13@gmail.com (akun dummy terdaftar, tanpa password)

### 3.2 Affected Pages / Variants
- `#/checkout` Step 1 CART - seluruh kuantitas di atas 10.
- Halaman detail produk pada AUT yang sama sudah benar (`max="99"`), sehingga batas tidak konsisten dalam satu aplikasi.

---

## 4. Steps to Reproduce & Oracle Comparison

### 4.1 Pre-conditions
1. Pengguna telah login dengan akun dummy yang terdaftar pada AUT.
2. Keranjang berisi 1 unit Combination Pliers ($14.15).
3. Halaman berada pada `#/checkout` Step 1 CART.

### 4.2 Steps to Reproduce
1. Buka `https://with-bugs.practicesoftwaretesting.com/#/checkout` (Step 1 CART).
2. Fokus ke field `[data-test="product-quantity"]`.
3. Ketik `11` via keyboard.
4. Tekan Tab untuk memicu perhitungan ulang.
5. Amati nilai yang tersisa pada field dan Grand Total `[data-test="cart-total"]`.
6. Bandingkan dengan perilaku build acuan pada kuantitas yang sama.

### 4.3 Actual Result (AUT with-bugs)
Nilai `11` yang diketik langsung berubah menjadi `10`. Grand Total yang terbentuk `$141.50` (10 x $14.15), bukan `$155.65`. Tidak ada pesan bahwa kuantitas dipotong.

Atribut kontrol keranjang:

```html
<input type="number" min="0" max="10" data-test="product-quantity" class="form-control quantity">
```

Sebagai pembanding, kontrol kuantitas pada halaman detail produk di AUT yang sama sudah memakai `min="1" max="99"`.

### 4.4 Expected Result (Reference Benchmark Oracle)
Pada `https://practicesoftwaretesting.com`, rentang sah adalah 1 s/d 99 unit (`min="1"`, `max="99"`). Kuantitas `11` diterima tanpa pemotongan dengan Grand Total `$155.65` (11 x $14.15).

---

## 5. Evidence & Attachments

### 5.1 Evidence Files
- evidence-uts/Test-Run/TC81/01_typed_11_clamped_to_10.png - Bukti 1: Setelah mengetik 11, field berubah menjadi 10
- evidence-uts/Test-Run/TC81/02_grand_total_after_clamp.png - Bukti 2: Grand Total menjadi $141.50, bukan $155.65
- Console: tidak ada error JavaScript (cacat berupa nilai/kalkulasi, bukan exception runtime).

**Bukti 1: Setelah mengetik 11, field berubah menjadi 10**

<img width="1000" alt="input 11 clamped to 10" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC81/01_typed_11_clamped_to_10.png" />

**Bukti 2: Grand Total menjadi $141.50, bukan $155.65**

<img width="1000" alt="grand total after clamp" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC81/02_grand_total_after_clamp.png" />

### 5.2 Evidence Types Provided
- [X] Screenshot layar penuh (bukan crop)
- [ ] Screen recording (tidak diperlukan, bug selalu reproducible)
- [X] Console log / DOM inspection
- [X] DOM / API inspection (markup elemen, respons endpoint)

---

## 6. Traceability & De-duplication

### 6.1 Kiwi TCMS Execution Link
* **Execution Link**: - TE #88 (TC-81): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/88/

Semua eksekusi di atas berstatus **FAILED** pada Test Run 15.

### 6.2 Duplicate Verification
- Kata kunci yang dicari: `max`, `kuantitas maksimum`, `quantity limit`, `clamp`.
- Hasil: tidak ada issue terbuka dengan akar masalah yang sama.
- Issue terkait: BUG-001 (kalkulasi Total baris) dan BUG-003 (batas bawah kuantitas). Akar masalahnya berbeda: issue ini menyangkut batas maksimum.

---

## 7. R5 Quality Review & Triage Minutes

### 7.1 Proposed Fix
Samakan batas maksimum kontrol keranjang dengan acuan (`max="99"`), atau tampilkan pesan eksplisit bila produk memang dibatasi 10 unit.

### 7.2 Defect Triage Meeting Minutes (Verified by R5 & R1)
> During the defect triage meeting on October 21, 2026, the team verified and confirmed this defect on Google Chrome Desktop using AUT staging build #14. The defect classification was solidified at Severity: Major and Priority: P2 based on its direct impact on the shopping cart/checkout flow and alignment with Sprint 5 Quality Gate rules. Traceability was validated against Kiwi TCMS execution results, and remediation was scheduled for the current sprint.

### 7.3 R5 Validity Quality Gate (Verification Checklist)
- [x] **Reproducibility**: Clear and deterministic steps provided.
- [x] **Oracle Specification**: Benchmarked against `practicesoftwaretesting.com`.
- [x] **Non-duplicate**: Root cause verified as unique across active defect register.
- [x] **Evidence Complete**: Verified full-screen screenshots / logs attached.
- [x] **Severity & Priority Justified**: Sizing strictly follows the project matrix.
- [x] **Kiwi TCMS Traceability**: Execution record linked and cross-referenced.
