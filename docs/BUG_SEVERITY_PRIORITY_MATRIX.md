# 🎯 Matriks Standar Severity & Priority - Kelompok 3
**Fokus Pengujian**: Keranjang & Checkout (+ Alur Login & Beranda)  
**Aplikasi Target**: CilacapTools Staging Sprint 5 (`with-bugs.practicesoftwaretesting.com`)  
**Penanggung Jawab**: R5 (Defect Management Engineer)

---

## 1. Definisi & Kriteria Severity (Tingkat Keparahan Teknis)

Severity mengukur dampak teknis sebuah cacat (*defect*) terhadap operasional sistem, integritas data, dan fungsionalitas aplikasi secara objektif.

| Severity | Definisi Teknis | Contoh Kasus pada Keranjang & Checkout | Tindakan QA |
| :--- | :--- | :--- | :--- |
| **Critical** | Sistem *crash*, fatal error, *white screen*, data hilang/rusak, transaksi pembayaran/checkout macet total tanpa ada jalan pintas (*no workaround*). Keamanan data terancam. | • Klik *"Proceed to Checkout"* menghasilkan infinite loop / halaman blank.<br>• Tombol *"Pay Now"* tidak merespons sama sekali, transaksi gagal tersimpan di database.<br>• Keranjang tiba-tiba terhapus tanpa interaksi pengguna. | Wajib eskalasi instan ke Lead (R1). Otomatis menggagalkan *Quality Gate*. |
| **Major** | Fungsi utama fitur bisnis gagal atau menghasilkan output salah yang fatal (seperti kalkulasi harga/diskon keliru), tetapi ada *workaround* yang rumit bagi pengguna. | • Total harga pada keranjang salah kalkulasi (misal $10 x 2 dihitung $15, atau menghasilkan nilai `NaN`).<br>• Tidak bisa mengubah kuantitas barang secara langsung lewat input field, namun bisa lewat tombol +/-.<br>• Validasi kartu kredit/alamat gagal untuk format yang sepenuhnya valid. | Masuk agenda utama triage. Prioritas utama perbaikan sebelum rilis. |
| **Minor** | Fungsi sekunder/pendukung tidak bekerja sebagaimana mestinya, atau terdapat ketidaksesuaian fungsional kecil yang tidak menghentikan alur utama transaksi. | • Pesan kesalahan/validasi tidak muncul saat input kode pos tidak lengkap (hanya border merah tanpa teks keterangan).<br>• Tombol *"Clear Cart"* tidak menampilkan pop-up konfirmasi pembatalan.<br>• Elemen input field pada form alamat sedikit bergeser/terpotong pada resolusi tertentu namun tetap bisa diisi. | Perbaikan dijadwalkan, tidak memblokir rilis jika ada *workaround*. |
| **Trivial** | Cacat kosmetik, ejaan (*typo*), format teks, warna ikon yang tidak sesuai pedoman UI/UX, atau inkonsistensi estetika yang sama sekali tidak mempengaruhi fungsi sistem. | • Typo tulisan *"Proced to chekout"* pada tombol checkout.<br>• Spasi berlebih pada label *"Shopping Cart ".*<br>• Tooltip bantuan tidak muncul saat kursor diarahkan ke ikon info diskon. | Diperbaiki bila ada waktu luang (nice to have). |

---

## 2. Definisi & Kriteria Priority (Tingkat Urgensi Bisnis)

Priority mengukur seberapa cepat dan mendesak bug tersebut harus diperbaiki dari sudut pandang kepentingan bisnis CilacapTools dan *Quality Gate*.

| Priority | Definisi Urgensi | Kriteria Hubungan dengan Quality Gate | Contoh Kasus |
| :--- | :--- | :--- | :--- |
| **P1 (Urgent)** | **Harus diperbaiki segera / *Blocker***.<br>Rilis tidak boleh dilakukan selama bug ini masih *Open*. | Wajib PASS / Resolved untuk memenuhi syarat *Quality Gate Sprint 5*. | Gagal checkout total, kalkulasi nominal pembayaran salah, *crash* saat submit order. |
| **P2 (High)** | **Harus diperbaiki sebelum rilis produksi**.<br>Mempengaruhi kepuasan pelanggan secara signifikan pada alur utama belanja. | Wajib PASS / Resolved untuk memenuhi syarat *Quality Gate Sprint 5*. | Item yang sudah dihapus dari keranjang muncul kembali saat reload, salah format mata uang pada checkout. |
| **P3 (Medium)** | **Dapat ditunda ke sprint berikutnya**.<br>Cacat pada alur sekunder yang memiliki *workaround* jelas dan mudah bagi pengguna. | Tidak memblokir rilis Sprint 5 secara mutlak. | Salah pesan error pada kupon diskon kadaluarsa, tombol kembali (*Back to shopping*) mengarah ke halaman root bukan katalog. |
| **P4 (Low)** | **Prioritas terendah / Kosmetik**.<br>Perbaikan estetika atau penyempurnaan kecil. | Tidak mempengaruhi status *Quality Gate*. | Kesalahan tata bahasa pada deskripsi kebijakan pengiriman di footer checkout. |

---

## 3. Matriks Hubungan Severity vs Priority

Kombinasi antara Severity dan Priority ditentukan secara objektif pada saat pelaporan dan disepakati dalam *Triage Meeting*:

| Severity \ Priority | **P1 (Urgent)** | **P2 (High)** | **P3 (Medium)** | **P4 (Low)** |
| :--- | :--- | :--- | :--- | :--- |
| **Critical** | Checkout/Pembayaran crash total, data hilang. *(Quality Gate Blocker)* | Crash pada skenario langka yang jarang terjadi (misal: belanja >999 jenis item). | Sangat jarang terjadi, biasanya diturunkan ke Major/Minor. | Tidak lazim. |
| **Major** | Salah kalkulasi total tagihan belanja atau diskon pada checkout. *(Quality Gate Blocker)* | Fitur filter keranjang gagal, validasi alamat gagal untuk area tertentu. | Fitur riwayat checkout sementara tidak menampilkan gambar thumbnail produk. | Fitur minor di halaman konfirmasi. |
| **Minor** | Pesan error menyesatkan pada alur utama yang membingungkan user awam. | Label tombol checkout terpotong pada mobile device tertentu. | Validasi form tidak menampilkan ikon peringatan visual. | Perbedaan margin tombol di keranjang. |
| **Trivial** | Typo pada tombol utama CTA checkout (misal: *"Bayar Sekarang"* salah ketik fatal). | Typo pada halaman invoice resmi. | Typo pada breadcrumb navigasi. | Typo pada catatan kaki (*copyright/footer*). |

---

## 4. Hubungan dengan Quality Gate Rilis CilacapTools (Sprint 5)

> ⚠️ **Aturan Quality Gate Sesuai Soal Ujian**:  
> Build hanya boleh dirilis jika:
> 1. **Seluruh test case berprioritas P1 dan P2 berstatus PASS**.
> 2. **Tidak ada bug Critical atau Major yang masih terbuka (*open*)**.

Oleh karena itu, setiap bug yang dikategorikan **Critical** atau **Major** WAJIB diberi perhatian khusus dalam Triage Meeting dan Test Execution Summary Report (T9).
