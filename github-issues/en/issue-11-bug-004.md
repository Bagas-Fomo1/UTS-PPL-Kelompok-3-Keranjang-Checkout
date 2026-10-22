# GitHub Issue #11: [BUG-004] Missing accessible form labels on shipping address fields and disabled focus outline indicator on checkout form

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/11](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/11)  
**Author**: @utamifitriaannisa  
**Labels**: `role: R4-Compatibility`, `priority:p1`, `severity:critical`, `status:triaged`, `technique:accessibility-audit`, `tool:lighthouse`, `tool:wave`, `type:accessibility-barrier`, `wcag-level:aa`, `wcag:operable`, `wcag:perceivable`, `status:verified-in-kiwi`, `module:checkout-address`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Identity & Classification

* **1.1 Issue ID**: `BUG-004`
* **1.2 Reporter Role**: R4 - Compatibility & Accessibility Tester (Annisa Fitria Utami, 240109002)
* **1.3 Issue Category**: Accessibility Defect - Pelanggaran WCAG 2.2
* **1.4 Affected Area / Feature**: Checkout - Alur Pengiriman & Alamat
* **1.5 Testing Technique**: Accessibility Audit (T7)
* **1.6 Defect Type**: Accessibility Barrier
* **1.7 Affected URL**: `https://with-bugs.practicesoftwaretesting.com/#/checkout`

---

## 2. Impact & Priority Assessment

### 2.1 Impact & Scope
- Pengguna terdampak: Seluruh pengguna penyandang disabilitas penglihatan yang menggunakan screen reader dan pengguna disabilitas motorik yang mengandalkan navigasi keyboard murni.
- Frekuensi: Selalu (100% reproduksi pada pemindaian audit otomatis WAVE, axe DevTools, dan Lighthouse).
- Cakupan: Seluruh field isian alamat pada Checkout Step 3 (Address: address, city, state, country, postcode).
- Konsekuensi: Pengguna screen reader kehilangan konteks input form saat mengetik karena placeholder menghilang dan tidak terikat label, serta pengguna keyboard tidak dapat melihat elemen aktif karena focus outline dinonaktifkan (`outline: none`).

### 2.2 Severity (Technical Impact)
**Critical - Alur utama gagal total tanpa workaround**
* **Severity Justification**:  
  Ketiadaan elemen semantik `<label for="...">` atau atribut `aria-label` pada field formulir pengiriman checkout menyebabkan teknologi pembaca layar (screen reader) gagal mengidentifikasi tujuan kolom input bagi pengguna tunanetra. Ditambah dengan hilangnya indikator visual fokus keyboard (`outline: none`), alur transaksi checkout terblokir secara aksesibilitas (WCAG 2.1 AA Blocker) sehingga skor Lighthouse Mobile jatuh ke angka kritis 69/100.

### 2.3 Priority (Business Urgency)
**P1 - Urgent (blokir rilis / quality gate)**
* **Priority Justification**:  
  Formulir alamat pengiriman checkout adalah alur konversi utama e-commerce Sprint 5. Pelanggaran aksesibilitas ini menggagalkan kriteria Quality Gate (skor aksesibilitas minimal 80/100) dan berisiko melanggar regulasi kepatuhan aksesibilitas digital.

---

## 3. Test Environment & Affected Variants

### 3.1 Test Environment
- **OS**: Windows 11 Pro 64-bit
- **Browser**: Google Chrome 129.0.6668.101 (Official Build) (64-bit) & Microsoft Edge 129
- **Viewport**: Desktop (1920x1080 px) & Mobile (375x667 px)
- **Build**: Sprint 5 Staging (AUT with-bugs) - Build #14
- **Acuan normal (Oracle)**: https://practicesoftwaretesting.com
- **Akun uji**: mamad@gmail.com (akun dummy terdaftar pada AUT)

### 3.2 Affected Pages / Variants
- `#/checkout` Step 3 (Address) - field `address`, `city`, `state`, `country`, `postcode`.
- `#/checkout` Step 4 (Payment) - kontrol pemilihan metode bayar dan tombol konfirmasi.

---

## 4. Steps to Reproduce & Oracle Comparison

### 4.1 Pre-conditions
1. Pengguna telah login dengan akun dummy terdaftar pada AUT (`mamad@gmail.com`).
2. Keranjang belanja berisi minimal 1 unit produk perkakas ($14.15).
3. Halaman berada pada `#/checkout` Step 3 (Address) & Step 4 (Payment).

### 4.2 Steps to Reproduce
1. Buka browser Google Chrome dan akses `https://with-bugs.practicesoftwaretesting.com/#/checkout`.
2. Lanjutkan alur checkout hingga mencapai tahapan Step 3 (Address).
3. Buka ekstensi **WAVE Evaluation Tool** pada browser dan amati tab *Details*.
4. Buka tab Lighthouse pada Chrome DevTools, pilih mode *Mobile* dan kategori *Accessibility*, lalu klik *Analyze page load*.
5. Uji navigasi keyboard murni dengan menekan tombol `Tab` berulang kali melewati seluruh field formulir checkout.
6. Periksa keberadaan tag `<label for="...">` pada DOM tree dan periksa style computed CSS pada `:focus`.

### 4.3 Actual Result (AUT with-bugs)
- WAVE Evaluation Tool melaporkan 5 error kritis *Missing form label* pada input kontrol alamat karena hanya mengandalkan atribut placeholder tanpa tag `<label>` semantik.
- Audit Google Lighthouse Mobile Accessibility menghasilkan skor **69 / 100** (Kategori Merah / Defisit Aksesibilitas Berat).
- Navigasi keyboard menunjukkan hilangnya penanda fokus visual akibat deklarasi CSS `outline: none` pada elemen input form.

### 4.4 Expected Result (Reference Benchmark Oracle)
Pada `https://practicesoftwaretesting.com`:
- Setiap input kontrol formulir terikat secara eksplisit dengan tag `<label for="id">` atau atribut `aria-label` yang dapat dibacakan oleh screen reader.
- Indikator cincin fokus visual terlihat kontras dan jelas saat elemen menerima fokus keyboard (*WCAG 2.4.7 Focus Visible*).
- Skor Google Lighthouse Mobile Accessibility mencapai kategori hijau (>= 90/100).

---

## 5. Evidence & Attachments

### 5.1 Evidence Files
- evidence-uts/Test-Run/TC107/01_WAVE_Accessibility_Audit_CheckoutFormPage.png - Bukti 1: WAVE mendeteksi Missing Form Labels pada input alamat checkout
- evidence-uts/Test-Run/TC107/02_Lighthouse_Mobile_Accessibility_CheckoutFormPage.png - Bukti 2: Skor Google Lighthouse Mobile Accessibility 69/100 pada Checkout Form
- Console: Terdeteksi pelanggaran aksesibilitas WCAG 1.3.1 (Info and Relationships) dan WCAG 4.1.2 (Name, Role, Value).

**Bukti 1: WAVE mendeteksi Missing Form Labels pada input alamat checkout**

<img width="1000" alt="WAVE Form Label Missing Alerts" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC107/01_WAVE_Accessibility_Audit_CheckoutFormPage.png" />

**Bukti 2: Skor Google Lighthouse Mobile Accessibility 69/100 pada Checkout Form**

<img width="1000" alt="Lighthouse Mobile Accessibility Score 69" src="https://raw.githubusercontent.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/main/evidence-uts/Test-Run/TC107/02_Lighthouse_Mobile_Accessibility_CheckoutFormPage.png" />

### 5.2 Evidence Types Provided
- [X] Screenshot layar penuh (bukan crop)
- [ ] Screen recording (tidak diperlukan, bug selalu reproducible)
- [X] Console log / DOM inspection
- [X] DOM / API inspection (markup elemen, respons endpoint)

---

## 6. Traceability & De-duplication

### 6.1 Kiwi TCMS Execution Link
* **Execution Link**: - TE #114 (TC-107): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/114/

Status eksekusi di Kiwi TCMS adalah **FAILED** pada Test Run 15.

### 6.2 Duplicate Verification
- Kata kunci yang dicari: `missing form label`, `accessible name`, `checkout accessibility`, `focus outline`.
- Hasil: Tidak ada issue terbuka sebelumnya dengan akar masalah aksesibilitas formulir checkout.
- Issue terkait: BUG-001 s.d BUG-003 berfokus pada fungsional kalkulasi kuantitas keranjang, tidak ada irisan dengan cacat semantik aksesibilitas.

---

## 7. R5 Quality Review & Triage Minutes

### 7.1 Proposed Fix
Sediakan atribut `id` unik pada setiap field formulir checkout dan kaitkan dengan elemen `<label for="...">`. Hapus aturan CSS `outline: none` pada elemen input saat state `:focus` dan ganti dengan styling kontras tinggi seperti `outline: 2px solid #0d6efd`.

### 7.2 Defect Triage Meeting Minutes (Verified by R5 & R1)
> During the defect triage meeting on October 21, 2026, the team verified and confirmed this defect on Google Chrome Desktop using AUT staging build #14. The defect classification was solidified at Severity: Critical and Priority: P1 based on its direct impact on the shopping cart/checkout flow and alignment with Sprint 5 Quality Gate rules. Traceability was validated against Kiwi TCMS execution results, and remediation was scheduled for the current sprint.

### 7.3 R5 Validity Quality Gate (Verification Checklist)
- [x] **Reproducibility**: Clear and deterministic steps provided.
- [x] **Oracle Specification**: Benchmarked against `practicesoftwaretesting.com`.
- [x] **Non-duplicate**: Root cause verified as unique across active defect register.
- [x] **Evidence Complete**: Verified full-screen screenshots / logs attached.
- [x] **Severity & Priority Justified**: Sizing strictly follows the project matrix.
- [x] **Kiwi TCMS Traceability**: Execution record linked and cross-referenced.
