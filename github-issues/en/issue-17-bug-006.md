# GitHub Issue #17: [BUG-006] Cart item delete button ('X') is unclickable (dead click) preventing item removal

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/17](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/17)  
**Author**: @christianLuis07  
**Labels**: `role: R1-Lead`, `env:chrome`, `module:cart`, `priority:p1`, `severity:critical`, `status:triaged`, `technique:equivalence-partitioning`, `type:functional-bug`, `type:ui-ux-defect`, `status:verified-in-kiwi`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Identity & Classification

* **1.1 Issue ID**: `BUG-006`
* **1.2 Reporter Role**: R1 - QA Lead & Test Manager
* **1.3 Issue Category**: Bug - Cacat fungsional (perilaku menyimpang dari acuan)
* **1.4 Affected Area / Feature**: Keranjang (Cart)
* **1.5 Testing Technique**: Main Flow Execution - Alur Utama & Result Tracking (T4)
* **1.6 Defect Type**: UI / UX Defect
* **1.7 Affected URL**: `https://with-bugs.practicesoftwaretesting.com/#/checkout`

---

## 2. Impact & Priority Assessment

### 2.1 Impact & Scope
- Pengguna terdampak: Seluruh pembeli yang ingin membatalkan, mengedit, atau menghapus barang tertentu dari keranjang belanja sebelum checkout.
- Frekuensi: Selalu (100% reproduksi setiap kali tombol hapus diklik).
- Cakupan: Seluruh baris produk di dalam tabel keranjang (`[data-test="remove-item"]`).
- Konsekuensi: Pengguna terkunci dengan barang belanjaan yang tidak diinginkan dan terpaksa checkout seluruh item atau meninggalkan keranjang belanja (*cart abandonment*).

### 2.2 Severity (Technical Impact)
**Critical - Alur utama gagal total tanpa workaround**
* **Severity Justification**:  
  Kontrol manipulasi esensial keranjang (*delete button*) mengalami kegagalan fungsi total (*dead click / event disconnected*). Tidak ada tombol alternatif, shortcut, maupun aksi lain yang dapat menghapus item terpilih dari tabel keranjang belanja.

### 2.3 Priority (Business Urgency)
**P1 - Urgent (blokir rilis / quality gate)**
* **Priority Justification**:  
  Merupakan bagian dari Alur Bisnis Utama (Tugas T4 - Kasus Uji P1) yang wajib PASS 100% tanpa adanya cacat berstatus Critical terbuka sebagai prasyarat Quality Gate UTS.

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
Pada https://practicesoftwaretesting.com, saat tombol ikon silang merah diklik, produk Combination Pliers seketika terhapus dari tabel, tabel menyisakan 1 produk (Pliers), total tagihan otomatis diperbarui menjadi $12.01, dan badge navbar berkurang dari 2 menjadi 1.

---

## 5. Evidence & Attachments

### 5.1 Evidence Files
evidence-uts/Test-Run/TC101/04_anomali_item_gagal_terhapus.png - Bukti 1: Tombol hapus diklik namun baris produk Combination Pliers gagal terhapus dan tetap tertahan di tabel keranjang
evidence-uts/Test-Run/TC101/05_observasi_badge_dan_state_keranjang.png - Bukti 2: State keranjang dan badge counter navbar tetap bernilai 2 item
Console: Tag tombol tidak memiliki event listener click, tidak ada error JavaScript runtime.

Bukti 1: Tombol hapus diklik namun baris produk Combination Pliers gagal terhapus dan tetap tertahan di tabel keranjang

<img width="1902" height="928" alt="Image" src="https://github.com/user-attachments/assets/2ca7e14b-d7e8-40b9-a335-21c26f53db99" />

Bukti 2: State keranjang dan badge counter navbar tetap bernilai 2 item

<img width="1902" height="928" alt="Image" src="https://github.com/user-attachments/assets/46fc5e32-8000-44a4-b628-79e900c54748" />

### 5.2 Evidence Types Provided
- [x] Screenshot layar penuh (bukan crop)
- [ ] Screen recording (wajib bila bug intermiten atau bergantung urutan interaksi)
- [x] Console log (wajib bila ada error JavaScript / HTTP 5xx)
- [x] DOM / API inspection (markup elemen, respons endpoint)

---

## 6. Traceability & De-duplication

### 6.1 Kiwi TCMS Execution Link
* **Execution Link**: TE #108 (TC-101): https://pdt-confident-sleeve-slim.trycloudflare.com/runs/15/executions/108/

### 6.2 Duplicate Verification
Kata kunci yang dicari: remove, delete, hapus, trash, dead click.
Hasil: Tidak ada issue terbuka yang melaporkan tombol hapus item keranjang.
Issue terkait: Issue #8 (BUG-001), #9 (BUG-002), dan #10 (BUG-003) berfokus pada validasi kuantitas input dan kalkulasi harga moneter. Issue ini menyangkut event binding tombol tindakan (action button). Tidak digabung.

---

## 7. R5 Quality Review & Triage Minutes

### 7.1 Proposed Fix
Tambahkan event binding (click)="removeItem(item)" pada tag <button data-test="remove-item"> di template cart.component.html dan hubungkan ke fungsi penghapusan item pada CartService/NgRx store.

### 7.2 Defect Triage Meeting Minutes (Verified by R5 & R1)
> During the defect triage meeting on October 21, 2026, the team verified and confirmed this defect on Google Chrome Desktop using AUT staging build #14. The defect classification was solidified at Severity: Critical and Priority: P1 based on its direct impact on the shopping cart/checkout flow and alignment with Sprint 5 Quality Gate rules. Traceability was validated against Kiwi TCMS execution results, and remediation was scheduled for the current sprint.

### 7.3 R5 Validity Quality Gate (Verification Checklist)
- [x] **Reproducibility**: Clear and deterministic steps provided.
- [x] **Oracle Specification**: Benchmarked against `practicesoftwaretesting.com`.
- [x] **Non-duplicate**: Root cause verified as unique across active defect register.
- [x] **Evidence Complete**: Verified full-screen screenshots / logs attached.
- [x] **Severity & Priority Justified**: Sizing strictly follows the project matrix.
- [x] **Kiwi TCMS Traceability**: Execution record linked and cross-referenced.
