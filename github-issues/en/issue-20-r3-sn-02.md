# GitHub Issue #20: [R3-SN-02] Session Notes - Eksplorasi Checkout dan Validasi Pesanan

**Original Issue URL**: [https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/20](https://github.com/Bagas-Fomo1/UTS-PPL-Kelompok-3-Keranjang-Checkout/issues/20)  
**Author**: @nuzul-hanifa  
**Labels**: `role: R3-Exploratory`, `charter:chr-002`, `env:chrome`, `sbtm:session-notes`, `status:triaged`, `status:verified-in-kiwi`, `module:checkout-payment`  
**Quality Reviewer & Verifier**: R5 (Defect Management Engineer) - Bagas Agung Krisnawan  

---

## 1. Session Information

* **Charter Reference ID**: `CHR-002`
* **Tester Name**: Nuzul Hanifa
* **Time-Box Execution**: Tanggal: 21 Oktober 2026, 10.35-11.05 WIB

---

## 2. Time Allocation Ratio (100% Total)
- Test execution: 20 menit (66,7%)
- Note-taking: 5 menit (16,7%)
- Bug investigation: 5 menit (16,6%)
- **TOTAL**: 100%

---

## 3. Test Execution Log & Notes
1. Melanjutkan checkout saat quantity produk bernilai 0; proses tetap dapat dilanjutkan.
2. Mengisi informasi pelanggan dan melanjutkan ke billing address. Indikator tombol Next terlihat sebagai kotak hijau.
3. Mengisi nomor pembayaran dengan satu digit; checkout tetap dapat dilanjutkan.
4. Menekan Confirm. Angka pada ikon cart masih terlihat dan tidak kembali menjadi 0.

---

## 4. Session Summary
Dua bug utama yang dipilih adalah checkout tetap dapat dilanjutkan dengan quantity 0 dan jumlah cart tidak kembali menjadi 0 setelah Confirm. Konsistensi status cart perlu diverifikasi melalui pengujian ulang.

---

## 5. Escalated Defects
1. Checkout dapat dilanjutkan dengan quantity 0 — Priority P2.
2. Jumlah cart tidak kembali menjadi 0 setelah Confirm — Priority P2.

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
