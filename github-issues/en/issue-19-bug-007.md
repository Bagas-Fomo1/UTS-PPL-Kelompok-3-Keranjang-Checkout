# GitHub Issue #19: [BUG-007] Cart item line total calculates to $00.00 upon quantity modification in checkout flow

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/19](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/19)  
**Author**: @christianLuis07  
**Labels**: `role: R1-Lead`, `env:chrome`, `module:cart`, `priority:p1`, `severity:critical`, `status:triaged`, `technique:equivalence-partitioning`, `type:financial-calculation`, `type:functional-bug`, `status:verified-in-kiwi`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Identity & Classification

* **1.1 Issue ID**: `BUG-007`
* **1.2 Reporter Role**: R1 - QA Lead & Test Manager
* **1.3 Issue Category**: Bug - Cacat fungsional (perilaku menyimpang dari acuan)
* **1.4 Affected Area / Feature**: Keranjang (Cart)
* **1.5 Testing Technique**: Main Flow Execution - Alur Utama & Result Tracking (T4)
* **1.6 Defect Type**: Financial Calculation
* **1.7 Affected URL**: `https://with-bugs.practicesoftwaretesting.com/#/checkout`

---

## 2. Impact & Priority Assessment

### 2.1 Impact & Scope
- Pengguna terdampak: Seluruh pembeli yang memodifikasi kuantitas belanja pada alur utama transaksi checkout.
- Frekuensi: Selalu (100% reproduksi saat kuantitas produk diubah).
- Cakupan: Field input kuantitas keranjang `[data-test="product-quantity"]` terhadap kolom Total baris `[data-test="line-price"]`.
- Konsekuensi: Menghancurkan transparansi rincian harga per produk karena subtotal baris bernilai $00.00, bertentangan secara matematis dengan Grand Total di bagian bawah tabel.

### 2.2 Severity (Technical Impact)
**Critical - Alur utama gagal total tanpa workaround**
* **Severity Justification**:  
  Terjadi anomali aritmatika finansial fatal di mana pengubahan kuantitas sah dari 1 menjadi 2 me-reset subtotal baris menjadi nol mutlak (`$00.00`), merusak integritas verifikasi tagihan belanja pengguna pada alur transaksi inti.

### 2.3 Priority (Business Urgency)
**P1 - Urgent (blokir rilis / quality gate)**
* **Priority Justification**:  
  Menghambat pemenuhan Quality Gate UTS pada Alur Utama Bisnis (Tugas T4 - Kasus Uji P1 TC-100) yang mensyaratkan 100% kasus uji P1 harus berstatus PASS tanpa bug Critical/Major terbuka sebelum rilis.

---

## 3. Test Environment & Affected Variants

### 3.1 Test Environment
- **OS**: Windows 11 Home 64-bit
- **Browser**: Google Chrome 129.0.6668.101 (Official Build) (64-bit)
- **Viewport**: Desktop (1920x1080)
- **Build**: Sprint 5 Staging (AUT with-bugs) - Build #14
- **Acuan normal (Oracle)**: https://practicesoftwaretesting.com
- **Akun uji**: customer@practicesoftwaretesting.com (akun dummy terdaftar, tanpa password)

### 3.2 Affected Pages / Variants
- `#/checkout` Step 1 CART - Kolom Total baris produk `[data-test="line-price"]` saat kuantitas diubah ke nilai 2.

---

## 4. Steps to Reproduce & Oracle Comparison

### 4.1 Pre-conditions
1. Pengguna mengakses aplikasi AUT `https://with-bugs.practicesoftwaretesting.com`.
2. Keranjang belanja berisi 1 unit produk aktif: Combination Pliers (harga satuan $14.15).
3. Halaman berada pada `#/checkout` Step 1 CART.

### 4.2 Steps to Reproduce
1. Buka halaman keranjang belanja `https://with-bugs.practicesoftwaretesting.com/#/checkout` (Step 1 CART).
2. Verifikasi kondisi awal: Kuantitas = `1`, Unit Price = `$14.15`, Total baris = `$14.15`, Grand Total = `$14.15`.
3. Ubah nilai input kuantitas `[data-test="product-quantity"]` dari `1` menjadi `2`.
4. Tekan tombol Tab atau klik di luar kotak input (*blur*) untuk memicu rekalkulasi otomatis.
5. Amati angka yang tertera pada kolom Total baris `[data-test="line-price"]` dan baris footer Grand Total `[data-test="cart-total"]`.

### 4.3 Actual Result (AUT with-bugs)
Kolom Total baris produk langsung berubah dan menampilkan angka `$00.00`, sementara baris footer Grand Total menampilkan nilai `$28.30`. Terjadi diskrepansi matematis nyata antara subtotal baris dan total belanja keseluruhan.
Cuplikan elemen tabel keranjang pada AUT:

```html
<tr _ngcontent-ng-c1248102374="">
  <td>Combination Pliers</td>
  <td><input type="number" data-test="product-quantity" class="form-control quantity" value="2"></td>
  <td data-test="unit-price">$14.15</td>
  <!-- Nilai line-total me-reset ke $00.00 akibat logic flaw di event handler -->
  <td data-test="line-total">$00.00</td>
  <td><button class="btn btn-danger" data-test="remove-item"><i class="fa fa-remove"></i></button></td>
</tr>
```

### 4.4 Expected Result (Reference Benchmark Oracle)
Pada https://practicesoftwaretesting.com, saat kuantitas diubah menjadi 2, kolom Total baris produk wajib terhitung secara akurat menjadi $28.30 (hasil dari 2 x $14.15) dan tetap sinkron dengan Grand Total $28.30.

---

## 5. Evidence & Attachments

### 5.1 Evidence Files
evidence-uts/Test-Run/TC100/02_pengubahan_kuantitas_menjadi_2.png - Bukti 1: Pengubahan nilai kuantitas menjadi 2 pada field input keranjang
evidence-uts/Test-Run/TC100/03_hasil_kalkulasi_anomali_subtotal_0.png - Bukti 2: Hasil kalkulasi anomali - kolom Total baris me-reset ke $00.00 sedangkan Grand Total $28.30
Console: Tidak ada error JavaScript runtime (anomali terjadi pada level aritmatika logika tampilan komponen).

Bukti 1: Pengubahan nilai kuantitas menjadi 2 pada field input keranjang

<img width="1902" height="928" alt="Image" src="https://github.com/user-attachments/assets/5e692e00-e164-4f10-8ea7-ae8c54838772" />

Bukti 2: Hasil kalkulasi anomali - kolom Total baris me-reset ke $00.00 sedangkan Grand Total $28.30

<img width="1902" height="928" alt="Image" src="https://github.com/user-attachments/assets/9cc2a507-81d9-4659-92e6-abdebedab82b" />

### 5.2 Evidence Types Provided
- [x] Screenshot layar penuh (bukan crop)
- [ ] Screen recording (wajib bila bug intermiten atau bergantung urutan interaksi)
- [x] Console log (wajib bila ada error JavaScript / HTTP 5xx)
- [x] DOM / API inspection (markup elemen, respons endpoint)

---

## 6. Traceability & De-duplication

### 6.1 Kiwi TCMS Execution Link
* **Execution Link**: TE #107 (TC-100): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/107/

### 6.2 Duplicate Verification
Kata kunci yang dicari: line total, line-price, subtotal, total baris.
Hasil: Terdapat issue #8 (BUG-001) oleh R2 (Aditya) yang menguji Boundary Value Analysis (TC-80, TC-82, TC-83, TC-84 pada batas kuantitas 1, 9, 10, 99).
Keterkaitan: Issue #8 ditautkan ke TE #87, #89, #90, dan #91. Issue ini (BUG-005) mendokumentasikan secara khusus kegagalan pada alur bisnis utama Happy Path transaksi (Tugas T4 - TC-100 / TE #107), di mana penambahan kuantitas sah dari 1 ke 2 langsung menyebabkan diskrepansi perhitungan subtotal baris ($00.00) dan memblokir kriteria Quality Gate P1.

---

## 7. R5 Quality Review & Triage Minutes

### 7.1 Proposed Fix
Perbaiki event handler penghitungan subtotal baris pada CartComponent agar mengalikan price * quantity secara reaktif dan menghindari reset ke nilai default string $00.00.

### 7.2 Defect Triage Meeting Minutes (Verified by R5 & R1)
> During the defect triage meeting on October 21, 2026, the team verified and confirmed this defect on Google Chrome Desktop using AUT staging build #14. The defect classification was solidified at Severity: Critical and Priority: P1 based on its direct impact on the shopping cart/checkout flow and alignment with Sprint 5 Quality Gate rules. Traceability was validated against Kiwi TCMS execution results, and remediation was scheduled for the current sprint.

### 7.3 R5 Validity Quality Gate (Verification Checklist)
- [x] **Reproducibility**: Clear and deterministic steps provided.
- [x] **Oracle Specification**: Benchmarked against `practicesoftwaretesting.com`.
- [x] **Non-duplicate**: Root cause verified as unique across active defect register.
- [x] **Evidence Complete**: Verified full-screen screenshots / logs attached.
- [x] **Severity & Priority Justified**: Sizing strictly follows the project matrix.
- [x] **Kiwi TCMS Traceability**: Execution record linked and cross-referenced.
