# 👷‍♂️ Proyek Akhir Semester Kelompok E12 - NoBokek 👷‍♀️

## 🙋‍♂️ Nama anggota kelompok 🙋‍♀️
1. Ian Suryadi Timothy H (2106750875)
2. Irfan Satya Hendrasto (2106751682)
3. Marc Salvadore Silitonga (2106705543)
4. Rafli Wasis Anggito (2106751442)
5. Symphony Cellis Zaana Saraaya (2106752060) 

## 📃 Deskripsi aplikasi (nama aplikasi, fungsi aplikasi, dan peran atau aktor pengguna aplikasi) 📃
- Nama Aplikasi : NoBokek
- Deskripsi Aplikasi :
Platform (website dan aplikasi) ini dibuat untuk membantu mempermudah pengelolaan keuangan pengguna atau user khususnya bagi mahasiswa. Pada platform ini, pengguna dapat mencatat pengeluaran serta pendapatan kemudian melihat perkembangannya perminggu dengan penyajian yang menarik dan mudah dimengerti. Platform ini juga menyediakan info terkini mengenai hal-hal yang terkait dengan dunia ekonomi dan finansial. Terdapat juga forum untuk pengguna melakukan posting.
- Peran atau aktor pengguna aplikasi :
    1. Logged in User : 
        - Melihat home yang berisi info terkini dan penjelasan website 
        - Menambahkan pemasukkan, pengeluaran, dan target pengeluaran 
        - Melihat grafik data perbulan
        - Melihat total saldo dan detail income dan outcome, Melihat dan melakukan Forum komunitas untuk posting 
        - Memposting keluhan di halaman Contact Us
    2. Guest : 
        - Melihat home yang berisi info terkini dan penjelasan website 
        - Melihat forum komunitas
    3. Admin : 
        - Melihat daftar keluhan yang diposting oleh user dari halaman Contact Us
        - Menghapus keluhan yang sudah selesai diatasi.

## 📝 Daftar fitur atau modul yang diimplementasikan beserta kontrak kinerja per anggota kelompok 📝
1. Autentikasi pengguna (Login, Sign Up) : Irfan Satya Hendrasto
2. Homepage Aplikasi (Berisikan penjelasan singkat website NoBokek, beberapa info terkini penjelasan singkat website NoBokek dan user dapat menggunakan fitur search) : Irfan Satya Hendrasto
3. Add Income / Outcome + Target Pengeluaran User (Membuat fitur yang berupa form untuk menambahkan input dan outcome user serta target pengeluaran user pada setiap bulannya) : Symphony Cellis Zaana Saraaya
4. Statistik Outcome / Income User (Menyajikan data outcome dan income pengguna menggunakan grafik, user dapat melakukan filter berdasarkan pengeluaran dan pemasukkan terendah dan tertinggi) :  Marc Salvadore Silitonga
5. Report User Info (Menampilkan laporan yang berupa outcome user dan detail pengeluaran yang ingin dilihat user, User juga dapat memakai filter untuk mencari bulan) : Rafli Wasis Anggito
6. Forum untuk posting (User yang sudah login dapat melakukan posting mengenai hal yang berkaitan dengan keuangan kemudian dapat dilihat oleh user lain) : Ian Suryadi Timothy H
7. Contact Us untuk mengirim keluhan user yang sudah login kepada admin (Semua keluhan user akan ditampilkan ketika login sebagai admin) : Irfan Satya Hendrasto

## ♻️ Alur pengintegrasian dengan web service untuk terhubung dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester ♻️
- Menambahkan dependency http ke proyek, dependency ini digunakan untuk bertukar data melalui HTTP request, seperti GET, POST, PUT, dan lain-lain.
- Membuat model dan menambahkan keyword `required` pada setiap parameter class pada bagian constructor, sesuai dengan respons dari data yang berasal dari web service proyek tengah semester.
- Membuat http request ke web service menggunakan dependency http.
- Mengkonversikan objek yang didapatkan dari web service ke model yang telah kita buat di langkah kedua.
- Menampilkan data yang telah dikonversi ke aplikasi dengan `FutureBuilder`.
