# GitHub Issue #10: [BUG-003] Cart accepts quantity 0 and keeps a $0.00 order line without any validation

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/10](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/10)  
**Author**: @AditCodeX  
**Labels**: `role: R2-Analyst`, `env:chrome`, `module:cart`, `priority:p2`, `severity:major`, `status:triaged`, `technique:bva`, `type:data-validation`, `status:verified-in-kiwi`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Identity & Classification

* **1.1 Issue ID**: `BUG-003`
* **1.2 Reporter Role**: R2 - Test Analyst (Aditya Agung Triwibowo, 240109001)
* **1.3 Issue Category**: Bug - Cacat fungsional (perilaku menyimpang dari acuan)
* **1.4 Affected Area / Feature**: Keranjang (Cart)
* **1.5 Testing Technique**: Boundary Value Analysis (T2)
* **1.6 Defect Type**: Data Validation
* **1.7 Affected URL**: `https://with-bugs.practicesoftwaretesting.com/#/checkout`

---

## 2. Impact & Priority Assessment

### 2.1 Impact & Scope
- Pengguna terdampak: seluruh pembeli; juga alur otomatis yang mengirim payload checkout.
- Frekuensi: selalu (100% reproduksi).
- Cakupan: kuantitas 0 dan seluruh nilai negatif pada baris keranjang.
- Konsekuensi: terbentuk keranjang bernilai nol yang tetap dapat dilanjutkan ke checkout, membuka peluang order tidak sah.

### 2.2 Severity (Technical Impact)
**Major - Fungsi inti salah, masih ada workaround**
* **Severity Justification**:  
  Kuantitas 0 berada di bawah batas minimum transaksi (1 unit) namun diterima, item tetap bertahan, dan tombol proceed-1 tetap aktif. Dampaknya integritas transaksi, tetapi pengguna masih dapat memperbaiki nilainya secara manual sehingga tidak Critical.

### 2.3 Priority (Business Urgency)
**P2 - High (harus diperbaiki sebelum rilis pada sprint berjalan)**
* **Priority Justification**:  
  Menyangkut validasi batas bawah pada alur transaksi utama sehingga perlu diperbaiki sebelum rilis, tetapi tidak memblokir seluruh alur checkout.

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
- `#/checkout` Step 1 CART - kuantitas 0 (dan nilai negatif pada field yang sama).
- Field: `[data-test=product-quantity]`.

---

## 4. Steps to Reproduce & Oracle Comparison

### 4.1 Pre-conditions
1. Pengguna telah login dengan akun dummy yang terdaftar pada AUT.
2. Keranjang berisi 1 unit Combination Pliers ($14.15).
3. Halaman berada pada `#/checkout` Step 1 CART.

### 4.2 Steps to Reproduce
1. Buka `https://with-bugs.practicesoftwaretesting.com/#/checkout` (Step 1 CART).
2. Pastikan keranjang berisi 1 unit Combination Pliers.
3. Fokus ke field `[data-test="product-quantity"]`, ketik `0`.
4. Tekan Tab untuk memicu event change/blur.
5. Amati apakah item dihapus, muncul pesan validasi, atau nilai tetap 0.
6. Periksa Grand Total `[data-test="cart-total"]` dan status tombol `[data-test="proceed-1"]`.

### 4.3 Actual Result (AUT with-bugs)
Nilai `0` diterima dan tetap tersimpan pada baris keranjang. Item tidak dihapus, tidak ada pesan validasi, Total baris `$00.00`, Grand Total `$0.00`, dan tombol `proceed-1` tetap aktif.

### 4.4 Expected Result (Reference Benchmark Oracle)
Pada `https://practicesoftwaretesting.com`, batas minimum transaksi sah adalah 1 unit (`min="1"`). Nilai 0 harus ditolak dengan pesan validasi minimal 1 unit, atau item dihapus otomatis dengan konfirmasi. Item tidak boleh bertahan di keranjang dengan total $0.00 tanpa umpan balik.

---

## 5. Evidence & Attachments

### 5.1 Evidence Files
- evidence-uts/Test-Run/TC79/01_qty0_typed.png - Bukti 1: Nilai 0 diketik pada field kuantitas keranjang
- evidence-uts/Test-Run/TC79/02_after_tab_total_0.png - Bukti 2: Setelah Tab - qty 0, Grand Total $0.00, tombol proceed-1 tetap aktif
- Console: tidak ada error JavaScript (cacat berupa nilai/kalkulasi, bukan exception runtime).

**Bukti 1: Nilai 0 diketik pada field kuantitas keranjang**

<img width="1000" alt="qty 0 typed" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC79/01_qty0_typed.png" />

**Bukti 2: Setelah Tab - qty 0, Grand Total $0.00, tombol proceed-1 tetap aktif**

<img width="1000" alt="after tab qty 0" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC79/02_after_tab_total_0.png" />

### 5.2 Evidence Types Provided
- [X] Screenshot layar penuh (bukan crop)
- [ ] Screen recording (tidak diperlukan, bug selalu reproducible)
- [X] Console log / DOM inspection
- [X] DOM / API inspection (markup elemen, respons endpoint)

---

## 6. Traceability & De-duplication

### 6.1 Kiwi TCMS Execution Link
* **Execution Link**: - TE #86 (TC-79): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/86/

Semua eksekusi di atas berstatus **FAILED** pada Test Run 15.

### 6.2 Duplicate Verification
- Kata kunci yang dicari: `quantity`, `kuantitas`, `min`, `zero`, `negatif`.
- Hasil: tidak ada issue terbuka yang menangani batas bawah kuantitas.
- Catatan: laporan sebelumnya mengenai kuantitas negatif (-1, TC-96) sudah tidak ada di repositori. Akar masalahnya identik (tidak ada validasi batas bawah), sehingga temuan tersebut tercakup dalam issue ini.

---

## 7. R5 Quality Review & Triage Minutes

### 7.1 Proposed Fix
Tambahkan satu validasi batas bawah pada `[data-test=product-quantity]` yang menolak seluruh nilai kurang dari 1 (mencakup -1 dan 0), lalu hapus baris atau tampilkan pesan minimal 1 unit.

### 7.2 Defect Triage Meeting Minutes (Verified by R5 & R1)
> During the defect triage meeting on October 21, 2026, the team verified and confirmed this defect on Google Chrome Desktop using AUT staging build #14. The defect classification was solidified at Severity: Major and Priority: P2 based on its direct impact on the shopping cart/checkout flow and alignment with Sprint 5 Quality Gate rules. Traceability was validated against Kiwi TCMS execution results, and remediation was scheduled for the current sprint.

### 7.3 R5 Validity Quality Gate (Verification Checklist)
- [x] **Reproducibility**: Clear and deterministic steps provided.
- [x] **Oracle Specification**: Benchmarked against `practicesoftwaretesting.com`.
- [x] **Non-duplicate**: Root cause verified as unique across active defect register.
- [x] **Evidence Complete**: Verified full-screen screenshots / logs attached.
- [x] **Severity & Priority Justified**: Sizing strictly follows the project matrix.
- [x] **Kiwi TCMS Traceability**: Execution record linked and cross-referenced.
