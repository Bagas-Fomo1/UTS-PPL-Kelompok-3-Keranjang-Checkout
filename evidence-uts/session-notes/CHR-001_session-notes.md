# Session Notes - CHR-001 Keranjang dan Kuantitas Item
Rujukan issue: #18 (R3-SN-01)

- Charter: CHR-001, mengeksplorasi penambahan produk ke keranjang dan pengelolaan kuantitas
- Tester: Nuzul Hanifa (R3)
- Tanggal: 21 Oktober 2026, 20.05 sampai 20.35 WIB
- Durasi: 30 menit
- Status sesi: selesai penuh

## Aktivitas
1. Menambahkan produk memakai tombol Add to cart; muncul pesan "Oeps, something went wrong" meskipun produk tetap masuk.
2. Membuka halaman keranjang dan mengubah kuantitas produk.
3. Mengamati bahwa kuantitas produk dapat bernilai 0.
4. Mencoba menghapus produk memakai tombol X; produk tidak terhapus.

## Dua cacat utama
- Kuantitas produk dapat bernilai 0. Expected: tidak boleh di bawah batas minimum. Aktual: bernilai 0. Kategori Functional / Quantity Validation, usulan P2.
- Tombol hapus tidak berfungsi. Expected: produk terhapus setelah tombol X diklik. Aktual: produk tetap ada. Kategori Functional, usulan P2.

## Temuan tambahan
Pesan "Oeps, something went wrong" muncul saat penambahan produk berhasil. Tidak dipilih sebagai cacat utama.

## Rasio waktu
- Eksekusi: 20 menit (66,7%)
- Pencatatan: 5 menit (16,7%)
- Investigasi cacat: 5 menit (16,6%)
Total 100% (30 menit)

Bukti eksekusi: Test Execution TE-84 di Kiwi TCMS, test case TC-77.
