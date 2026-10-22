# GitHub Issue #12: [BUG-005] Low color contrast ratio on product description text and missing alternative text on main product image

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/12](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/12)  
**Author**: @utamifitriaannisa  
**Labels**: `role: R4-Compatibility`, `priority:p2`, `severity:major`, `status:triaged`, `technique:accessibility-audit`, `tool:axe-devtools`, `tool:lighthouse`, `type:accessibility-barrier`, `wcag-level:aa`, `wcag:perceivable`, `status:verified-in-kiwi`, `module:product-detail`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Identity & Classification

* **1.1 Issue ID**: `BUG-005`
* **1.2 Reporter Role**: R4 - Compatibility & Accessibility Tester (Annisa Fitria Utami, 240109002)
* **1.3 Issue Category**: Accessibility Defect - Pelanggaran WCAG 2.2
* **1.4 Affected Area / Feature**: Lainnya
* **1.5 Testing Technique**: Accessibility Audit (T7)
* **1.6 Defect Type**: Accessibility Barrier
* **1.7 Affected URL**: `https://with-bugs.practicesoftwaretesting.com/#/product/1`

---

## 2. Impact & Priority Assessment

### 2.1 Impact & Scope
- Pengguna terdampak: Pengguna dengan gangguan penglihatan (low vision, katarak, buta warna) yang membaca teks deskripsi produk serta pengguna tuna netra yang menggunakan screen reader.
- Frekuensi: Selalu (100% reproduksi pada pemindaian axe DevTools, WAVE, dan Lighthouse).
- Cakupan: Halaman Detail Produk (`#/product/1` - Combination Pliers) pada komponen teks deskripsi sekunder, badge harga diskon, dan elemen gambar produk utama.
- Konsekuensi: Teks deskripsi sulit dibaca karena kontras warna rendah (3.1:1, standar minimum 4.5:1), dan screen reader tidak dapat mengumumkan konten gambar produk karena ketiadaan atribut alt teks yang deskriptif.

### 2.2 Severity (Technical Impact)
**Major - Fungsi inti salah, masih ada workaround**
* **Severity Justification**:  
  Melanggar kriteria sukses internasional WCAG 2.1 Level AA (Kriteria 1.4.3 Contrast Minimum dan Kriteria 1.1.1 Non-text Content). Pengguna dengan gangguan visual mengalami hambatan berat untuk membaca spesifikasi produk, dan pengguna screen reader kehilangan konteks visual produk utama. Skor kepatuhan aksesibilitas Lighthouse Mobile berada di angka 78/100 (gagal mencapai ambang batas kelulusan 80/100).

### 2.3 Priority (Business Urgency)
**P2 - High (harus diperbaiki sebelum rilis pada sprint berjalan)**
* **Priority Justification**:  
  Halaman detail produk adalah modul katalog inti tempat pelanggan meneliti spesifikasi sebelum memutuskan membeli barang. Pelanggaran aksesibilitas ini berdampak langsung pada pengalaman belanja pengguna disabilitas dan menggagalkan kriteria penerimaan Quality Gate sprint berjalan.

---

## 3. Test Environment & Affected Variants

### 3.1 Test Environment
- **OS**: Windows 11 Pro 64-bit
- **Browser**: Google Chrome 129.0.6668.101 (Official Build) (64-bit)
- **Viewport**: Desktop (1920x1080 px) & Mobile Emulator Pixel 7 (412x915 px)
- **Build**: Sprint 5 Staging (AUT with-bugs) - Build #14
- **Acuan normal (Oracle)**: https://practicesoftwaretesting.com
- **Akun uji**: mamad@gmail.com (akun dummy terdaftar pada AUT)

### 3.2 Affected Pages / Variants
- `#/product/1` (Detail Produk Combination Pliers) - teks deskripsi sekunder, badge diskon, gambar produk utama.
- Seluruh halaman detail produk sejenis yang mengimplementasikan template CSS yang sama.

---

## 4. Steps to Reproduce & Oracle Comparison

### 4.1 Pre-conditions
1. Halaman detail produk AUT `https://with-bugs.practicesoftwaretesting.com/#/product/1` dapat diakses normal.
2. Browser Chrome dilengkapi ekstensi audit **axe DevTools** dan **WAVE Evaluation Tool**.

### 4.2 Steps to Reproduce
1. Buka browser Google Chrome dan akses URL `https://with-bugs.practicesoftwaretesting.com/#/product/1`.
2. Buka DevTools (F12), pilih tab **axe DevTools**, dan klik tombol **Scan FULL PAGE**.
3. Periksa temuan pelanggaran pada kategori *color-contrast* dan *image-alt*.
4. Buka tab Lighthouse pada Chrome DevTools, pilih opsi Device: *Mobile* dan centang hanya kategori *Accessibility*, lalu jalankan audit.
5. Catat rasio kontras warna dan skor kepatuhan aksesibilitas yang dilaporkan.

### 4.3 Actual Result (AUT with-bugs)
- Audit axe DevTools menemukan pelanggaran kontras warna (`color-contrast`): Rasio kontras teks deskripsi sekunder (`p.description`) hanya **3.1:1** terhadap latar putih (standar minimum 4.5:1).
- Elemen gambar produk utama `<img>` kehilangan teks alternatif deskriptif (`alt=""` kosong / ketiadaan atribut alt yang bermakna).
- Audit Google Lighthouse Mobile Accessibility menghasilkan skor **78 / 100** (di bawah ambang batas kelulusan 80/100).

### 4.4 Expected Result (Reference Benchmark Oracle)
Pada `https://practicesoftwaretesting.com`:
- Rasio kontras warna teks terhadap latar belakang memenuhi batas ambang minimum WCAG 2.1 AA yaitu minimal **4.5:1** untuk teks reguler.
- Gambar produk memiliki atribut `alt` deskriptif yang memuat nama produk secara lengkap (contoh: `alt="Combination Pliers"`).
- Skor Google Lighthouse Mobile Accessibility mencapai kategori hijau (>= 85/100).

---

## 5. Evidence & Attachments

### 5.1 Evidence Files
- evidence-uts/Test-Run/TC106/01_axe_DevTools_Audit_ProductDetailPage.png - Bukti 1: axe DevTools mendeteksi pelanggaran Color Contrast dan Image Alt Text
- evidence-uts/Test-Run/TC106/02_Lighthouse_Mobile_Accessibility_ProductDetailPage.png - Bukti 2: Skor Google Lighthouse Mobile Accessibility 78/100 pada Detail Produk
- Console: axe-core violation `[color-contrast]` (3.1:1 vs 4.5:1) dan violation `[image-alt]`.

**Bukti 1: axe DevTools mendeteksi pelanggaran Color Contrast dan Image Alt Text**

<img width="1000" alt="axe DevTools Accessibility Audit Detail Produk" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC106/01_axe_DevTools_Audit_ProductDetailPage.png" />

**Bukti 2: Skor Google Lighthouse Mobile Accessibility 78/100 pada Detail Produk**

<img width="1000" alt="Lighthouse Mobile Accessibility Score 78" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC106/02_Lighthouse_Mobile_Accessibility_ProductDetailPage.png" />

### 5.2 Evidence Types Provided
- [X] Screenshot layar penuh (bukan crop)
- [ ] Screen recording (tidak diperlukan, bug selalu reproducible)
- [X] Console log / DOM inspection
- [X] DOM / API inspection (markup elemen, respons endpoint)

---

## 6. Traceability & De-duplication

### 6.1 Kiwi TCMS Execution Link
* **Execution Link**: - TE #113 (TC-106): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/113/

Status eksekusi di Kiwi TCMS adalah **FAILED** pada Test Run 15.

### 6.2 Duplicate Verification
- Kata kunci yang dicari: `color contrast`, `image alt`, `product detail accessibility`, `lighthouse mobile`.
- Hasil: Tidak ada issue terbuka sebelumnya yang melaporkan cacat aksesibilitas kontras atau alt text pada halaman detail produk.
- Issue terkait: BUG-004 membahas aksesibilitas form checkout, sedangkan BUG-005 fokus pada aksesibilitas konten detail produk. Keduanya berdiri sendiri.

---

## 7. R5 Quality Review & Triage Minutes

### 7.1 Proposed Fix
Tingkatkan kegelapan warna teks deskripsi dari `#777777` menjadi `#495057` untuk menghasilkan rasio kontras 7.4:1 terhadap latar putih. Tambahkan atribut `alt` dinamis pada elemen gambar produk utama yang memuat nama produk dari database.

### 7.2 Defect Triage Meeting Minutes (Verified by R5 & R1)
> During the defect triage meeting on October 21, 2026, the team verified and confirmed this defect on Google Chrome Desktop using AUT staging build #14. The defect classification was solidified at Severity: Major and Priority: P2 based on its direct impact on the shopping cart/checkout flow and alignment with Sprint 5 Quality Gate rules. Traceability was validated against Kiwi TCMS execution results, and remediation was scheduled for the current sprint.

### 7.3 R5 Validity Quality Gate (Verification Checklist)
- [x] **Reproducibility**: Clear and deterministic steps provided.
- [x] **Oracle Specification**: Benchmarked against `practicesoftwaretesting.com`.
- [x] **Non-duplicate**: Root cause verified as unique across active defect register.
- [x] **Evidence Complete**: Verified full-screen screenshots / logs attached.
- [x] **Severity & Priority Justified**: Sizing strictly follows the project matrix.
- [x] **Kiwi TCMS Traceability**: Execution record linked and cross-referenced.
