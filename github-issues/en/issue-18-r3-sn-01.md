# GitHub Issue #18: [R3-SN-01] Session Notes - Eksplorasi Keranjang Belanja

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/18](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/18)  
**Author**: @nuzul-hanifa  
**Labels**: `role: R3-Exploratory`, `charter:chr-001`, `env:chrome`, `module:cart`, `sbtm:session-notes`, `status:triaged`, `status:verified-in-kiwi`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Session Information

* **Charter Reference ID**: `CHR-001`
* **Tester Name**: Nuzul Hanifa
* **Time-Box Execution**: 21 Oktober 2026, 20.05 - 20.35 WIB

---

## 2. Time Allocation Ratio (100% Total)
- Test execution: 20 menit (66,7%)
- Note-taking: 5 menit (16,7%)
- Bug investigation: 5 menit (16,6%)
- **TOTAL**: 100%

---

## 3. Test Execution Log & Notes
1. Menambahkan produk ke cart. Muncul pesan “Something went wrong”, tetapi produk tetap masuk.
2. Mengubah quantity produk dan menemukan bahwa quantity dapat bernilai 0.
3. Mengklik tombol X untuk menghapus produk, tetapi produk tidak berhasil dihapus.

---

## 4. Session Summary
Dua bug utama yang dipilih adalah quantity produk dapat bernilai 0 dan tombol hapus produk tidak berfungsi. Pesan error setelah Add to Cart dicatat sebagai temuan tambahan.

---

## 5. Escalated Defects
1. Bug quantity produk dapat bernilai 0 - Priority P2 (usulan).
2. Bug tombol hapus produk tidak berfungsi Priority - P2 (usulan).

---

## 6. Debrief with Test Lead (R1)
Test Lead (R1) menyetujui eskalasi 2 bug di atas. Bug pertama dikategorikan Major/P1 karena merusak alur checkout, bug kedua dikategorikan Major/P2.

---

## 7. R5 Quality Review & Triage Minutes
> Debriefed and accepted during the triage review session on October 21, 2026. The 30-minute time-box allocation ratio (100% total) and defect escalation path were verified by QA Lead (R1) and R5, confirming that discovered anomalies were appropriately escalated into formal defect tracking.

### Quality Gate Check
- [x] 100% time allocation ratio verified.
- [x] Execution anomalies validated and escalated to formal defect tickets.
- [x] Debrief session approved by QA Lead (R1) and Defect Manager (R5).
