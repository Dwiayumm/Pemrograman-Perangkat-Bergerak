# pertemuan_2

Proyek ini merupakan hasil tugas dan pengembangan berkelanjutan untuk mata kuliah Pemrograman Perangkat Bergerak, menggunakan framework Flutter. Aplikasi ini dirancang sebagai sistem dasar untuk mengelola dan memvalidasi data entitas kampus seperti Mahasiswa, Dosen, dan Mata Kuliah. Pengembangan dilakukan secara progresif, dimulai dari konfigurasi lingkungan dasar hingga implementasi fitur input dan output data yang kompleks.

Secara keseluruhan, proyek ini mengintegrasikan seluruh materi yang telah dipelajari dalam beberapa pertemuan. Tahap awal mencakup Instalasi dan Setup Lingkungan Flutter (P1), dilanjutkan dengan Penyempurnaan Konfigurasi dan perancangan Menu Drawer Utama yang menyertakan section Tentang Aplikasi dan Pengaturan (P2).

Inti fungsionalitas terletak pada modul Form. Pada tahap awal (P3), diimplementasikan Form Mahasiswa dengan bidang Nama, NPM, Email, Alamat, serta penambahan fungsionalitas Tanggal Lahir menggunakan Date Picker. Puncak dari proyek ini adalah Proyek UTS yang menuntut implementasi dua modul utama: Form Dosen dan Form Mata Kuliah. Form Dosen mencakup atribut NIDN, Nama, Home Base, Email, dan No. Telepon, sementara Form Mata Kuliah mencakup Kode Matkul, Nama Matkul, dan SKS.

Seluruh data yang dimasukkan melalui Form Dosen dan Mata Kuliah divalidasi dan langsung disajikan sebagai Ringkasan Data dalam pop-up (AlertDialog) setelah tombol "Simpan" ditekan. Hal ini bertujuan untuk menguji kemampuan aplikasi dalam menangkap dan menampilkan output data secara akurat. Semua kode program utama berpusat di direktori lib/ dengan main.dart berfungsi sebagai pengatur routing dan navigasi, menghubungkan semua modul Form yang terpisah (form_dosen.dart, form_matkul.dart, dan form_mahasiswa.dart)..

## Getting Started

Proyek ini dibangun di atas Flutter SDK. Pastikan Anda telah menjalankan flutter doctor dan lingkungan pengembangan Anda sudah siap. Untuk menjalankan proyek secara lokal, gunakan langkah-langkah berikut:

1. Arahkan ke direktori utama proyek di terminal.

2. Ambil semua dependensi yang diperlukan dengan perintah flutter pub get.

3. Jalankan aplikasi pada perangkat atau emulator yang terhubung dengan perintah flutter run.
