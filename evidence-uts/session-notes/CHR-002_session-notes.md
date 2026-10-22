# Session Notes - CHR-002 Checkout dan Validasi Pesanan
Rujukan issue: #20 (R3-SN-02)

- Charter: CHR-002, mengeksplorasi alur checkout dan validasi pesanan
- Tester: Nuzul Hanifa (R3)
- Tanggal: 22 Oktober 2026, 10.35 sampai 11.05 WIB
- Durasi: 30 menit
- Status sesi: selesai penuh

## Aktivitas
1. Melanjutkan checkout saat kuantitas produk bernilai 0; sistem tetap mengizinkan.
2. Mengisi informasi pelanggan dan melanjutkan proses checkout.
3. Memasuki billing address; indikator tombol Next hanya tampil sebagai kotak hijau.
4. Mengisi nomor pembayaran satu digit; proses checkout tetap dapat dilanjutkan.
5. Menekan Confirm; angka pada ikon keranjang tidak kembali menjadi 0.

## Dua cacat utama
- Checkout dapat dilanjutkan dengan kuantitas 0. Expected: sistem menolak checkout tanpa produk valid. Aktual: checkout tetap berjalan. Kategori Functional / Validation, P2.
- Jumlah keranjang tidak kembali nol setelah Confirm. Expected: keranjang kosong dan indikator menunjukkan 0. Aktual: angka masih tampil. Kategori Functional / State Consistency, P2.

## Temuan tambahan
Saat checkout dengan kuantitas 1, indikator keranjang tetap 1 setelah proses checkout. Perlu pengujian ulang untuk memastikan konsistensi status keranjang.

## Rasio waktu
- Eksekusi: 20 menit (66,7%)
- Pencatatan: 5 menit (16,7%)
- Investigasi cacat: 5 menit (16,6%)
Total 100% (30 menit)

Bukti eksekusi: Test Execution TE-85 di Kiwi TCMS, test case TC-78.
