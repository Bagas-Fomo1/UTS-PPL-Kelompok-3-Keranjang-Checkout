# GitHub Issue #8: [BUG-001] Cart line total shows $00.00 for every quantity while grand total is correct

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/8](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/8)  
**Author**: @AditCodeX  
**Labels**: `role: R2-Analyst`, `env:chrome`, `module:cart`, `priority:p2`, `severity:major`, `status:triaged`, `technique:bva`, `type:financial-calculation`, `status:verified-in-kiwi`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Identity & Classification

* **1.1 Issue ID**: `BUG-001`
* **1.2 Reporter Role**: R2 - Test Analyst (Aditya Agung Triwibowo, 240109001)
* **1.3 Issue Category**: Bug - Cacat fungsional (perilaku menyimpang dari acuan)
* **1.4 Affected Area / Feature**: Keranjang (Cart)
* **1.5 Testing Technique**: Boundary Value Analysis (T2)
* **1.6 Defect Type**: Financial Calculation
* **1.7 Affected URL**: `https://with-bugs.practicesoftwaretesting.com/#/checkout`

---

## 2. Impact & Priority Assessment

### 2.1 Impact & Scope
- Pengguna terdampak: seluruh pembeli yang memeriksa keranjang sebelum checkout.
- Frekuensi: selalu (100% reproduksi pada setiap kuantitas).
- Cakupan: qty 1, 9, 10, dan 99.
- Konsekuensi: pengguna tidak dapat memverifikasi biaya per item karena kolom Total baris selalu $00.00, meski Grand Total benar.

### 2.2 Severity (Technical Impact)
**Major - Fungsi inti salah, masih ada workaround**
* **Severity Justification**:  
  Kolom Total baris adalah angka moneter yang dipakai pengguna memverifikasi biaya per item. Nilainya salah pada semua kuantitas yang diuji, namun alur checkout masih dapat diselesaikan karena Grand Total benar, sehingga tidak mencapai tingkat Critical.

### 2.3 Priority (Business Urgency)
**P2 - High (harus diperbaiki sebelum rilis pada sprint berjalan)**
* **Priority Justification**:  
  Menyangkut nominal pembayaran pada alur transaksi utama Sprint 5, tetapi tidak memblokir penyelesaian checkout sehingga bukan P1.

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
- `#/checkout` Step 1 CART - kuantitas 1, 9, 10, dan 99.
- Tidak berdampak pada Grand Total (`[data-test=cart-total]`) maupun halaman detail produk.

---

## 4. Steps to Reproduce & Oracle Comparison

### 4.1 Pre-conditions
1. Pengguna telah login dengan akun dummy yang terdaftar pada AUT.
2. Keranjang berisi 1 unit Combination Pliers ($14.15).
3. Halaman berada pada `#/checkout` Step 1 CART.

### 4.2 Steps to Reproduce
1. Buka `https://with-bugs.practicesoftwaretesting.com/#/checkout` (Step 1 CART).
2. Pastikan keranjang berisi 1 unit Combination Pliers.
3. Fokus ke field `[data-test="product-quantity"]`, ketik `1`, lalu tekan Tab.
4. Baca kolom Total baris `[data-test="line-price"]` dan Grand Total `[data-test="cart-total"]`.
5. Ulangi langkah 3 dengan nilai `9`, `10`, dan `99`.

### 4.3 Actual Result (AUT with-bugs)
Kolom Total baris (`[data-test="line-price"]`) selalu menampilkan `$00.00` untuk seluruh kuantitas yang diuji dan tidak pernah dihitung ulang, sementara Grand Total benar.

| Kuantitas | Price satuan | Total baris (aktual) | Grand Total (aktual) |
|---:|---:|---:|---:|
| 1 | $14.15 | $00.00 | $14.15 |
| 9 | $14.15 | $00.00 | $127.35 |
| 10 | $14.15 | $00.00 | $141.50 |
| 99 | $14.15 | $00.00 | $1,400.85 |

### 4.4 Expected Result (Reference Benchmark Oracle)
Pada `https://practicesoftwaretesting.com`, kolom Total baris dihitung dari Price x Quantity dan konsisten dengan kontribusi baris tersebut terhadap Grand Total: 1 unit = `$14.15`, 9 unit = `$127.35`, 10 unit = `$141.50`, 99 unit = `$1,400.85`.

---

## 5. Evidence & Attachments

### 5.1 Evidence Files
- evidence-uts/Test-Run/TC80/01_cart_qty1.png - Bukti 1: Qty 1 - Total baris $00.00 sedangkan Price $14.15
- evidence-uts/Test-Run/TC80/02_line_total_vs_grand_total.png - Bukti 2: Grand Total $14.15 di footer, Total baris tetap $00.00
- evidence-uts/Test-Run/TC82/01_cart_qty99.png - Bukti 3: Qty 99 - Total baris $00.00, Grand Total $1,400.85
- Console: tidak ada error JavaScript (cacat berupa nilai/kalkulasi, bukan exception runtime).

**Bukti 1: Qty 1 - Total baris $00.00 sedangkan Price $14.15**

<img width="1000" alt="qty 1 line total 00.00" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC80/01_cart_qty1.png" />

**Bukti 2: Grand Total $14.15 di footer, Total baris tetap $00.00**

<img width="1000" alt="grand total vs line total" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC80/02_line_total_vs_grand_total.png" />

**Bukti 3: Qty 99 - Total baris $00.00, Grand Total $1,400.85**

<img width="1000" alt="qty 99 cart" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC82/01_cart_qty99.png" />

### 5.2 Evidence Types Provided
- [X] Screenshot layar penuh (bukan crop)
- [ ] Screen recording (tidak diperlukan, bug selalu reproducible)
- [X] Console log / DOM inspection
- [X] DOM / API inspection (markup elemen, respons endpoint)

---

## 6. Traceability & De-duplication

### 6.1 Kiwi TCMS Execution Link
* **Execution Link**: - TE #87 (TC-80): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/87/
- TE #89 (TC-82): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/89/
- TE #90 (TC-83): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/90/
- TE #91 (TC-84): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/91/

Semua eksekusi di atas berstatus **FAILED** pada Test Run 15.

### 6.2 Duplicate Verification
- Kata kunci yang dicari: `line total`, `line-price`, `subtotal`, `total baris`.
- Hasil: tidak ada issue terbuka dengan akar masalah yang sama.
- Issue terkait: BUG-002 (batas maksimum kuantitas) dan BUG-003 (batas minimum kuantitas) memakai field yang sama, tetapi akar masalahnya validasi input, bukan kalkulasi. Tidak digabung.

---

## 7. R5 Quality Review & Triage Minutes

### 7.1 Proposed Fix
Hitung ulang Total baris dari Price x Quantity pada setiap event change kuantitas, dan gunakan sumber kalkulasi yang sama dengan Grand Total agar kedua nilai tidak pernah berbeda.

### 7.2 Defect Triage Meeting Minutes (Verified by R5 & R1)
> During the defect triage meeting on October 21, 2026, the team verified and confirmed this defect on Google Chrome Desktop using AUT staging build #14. The defect classification was solidified at Severity: Major and Priority: P2 based on its direct impact on the shopping cart/checkout flow and alignment with Sprint 5 Quality Gate rules. Traceability was validated against Kiwi TCMS execution results, and remediation was scheduled for the current sprint.

### 7.3 R5 Validity Quality Gate (Verification Checklist)
- [x] **Reproducibility**: Clear and deterministic steps provided.
- [x] **Oracle Specification**: Benchmarked against `practicesoftwaretesting.com`.
- [x] **Non-duplicate**: Root cause verified as unique across active defect register.
- [x] **Evidence Complete**: Verified full-screen screenshots / logs attached.
- [x] **Severity & Priority Justified**: Sizing strictly follows the project matrix.
- [x] **Kiwi TCMS Traceability**: Execution record linked and cross-referenced.
