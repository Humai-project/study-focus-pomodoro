# Study Focus – Aplikasi Manajemen Waktu Berbasis Teknik Pomodoro

Study Focus adalah aplikasi desktop berbasis Java Swing yang membantu mahasiswa mengatur waktu belajar dan menghadapi deadline tugas dengan teknik Pomodoro, daftar tugas, dan penyimpanan ke database MySQL.

## Latar Belakang

Banyak mahasiswa kesulitan mengatur waktu, menunda tugas, dan baru panik menjelang deadline. Teknik Pomodoro membagi waktu belajar menjadi blok fokus pendek yang diselingi istirahat, sehingga membantu menjaga fokus dan mengurangi prokrastinasi. Aplikasi Study Focus dibuat sebagai alat bantu praktis untuk menerapkan teknik ini dalam aktivitas belajar sehari-hari.

## Fitur Utama

- **Timer Pomodoro**
  - Mode Focus, Short Break, dan Long Break.
  - Durasi standar (misalnya 25/5/15 menit) dan opsi custom HH:MM:SS.
  - Hitung mundur dengan tombol Start, Pause, dan Reset.

- **Quick Task List**
  - Tambah dan hapus tugas kuliah (judul tugas).
  - Tugas disimpan ke tabel `tugas` di database `study_focus`.
  - Tugas yang dipilih muncul sebagai “current task” di dekat timer.

- **Desain Antarmuka**
  - Tampilan sederhana dan aesthetic (warna soft untuk timer dan task).
  - Layout dirancang agar fokus ke timer dan daftar tugas.

- **Struktur Basis Data (sederhana)**
  - Tabel `tugas`: menyimpan daftar tugas yang ditampilkan di aplikasi.
  - Tabel `pengingat` dan `pengaturan_pomodoro`: disiapkan untuk pengembangan fitur pengingat dan pengaturan personal (future work).

## Teknologi yang Digunakan

- Java SE 
- Java Swing untuk antarmuka grafis
- MySQL + phpMyAdmin untuk basis data
- JDBC (mysql-connector) untuk koneksi Java–MySQL
- IDE: NetBeans 

## Cara Kerja Aplikasi (Ringkas)

1. Saat aplikasi dijalankan, kelas `AppMain`/`StudyFocusFrame` membuat jendela utama Study Focus.
2. Aplikasi membuka koneksi ke database MySQL melalui kelas `Koneksi`.
3. Kelas `TugasDAO` mengambil isi tabel `tugas` dan menampilkannya di tabel (JTable) Quick Task List.
4. Pengguna dapat:
   - Menambahkan tugas → `TugasDAO.insertTugas()` menyimpan data ke DB.
   - Menghapus tugas → `TugasDAO.deleteByJudul()` menghapus baris di DB.
   - Memilih tugas → label “current task” di dekat timer menampilkan tugas yang sedang dikerjakan.
5. Timer Pomodoro menggunakan `javax.swing.Timer` yang menghitung mundur detik demi detik.
   - Mode dipilih lewat combobox (Focus / Short Break / Long Break / Custom).
   - Saat Start diklik, timer mulai mengurangi sisa detik dan memperbarui label waktu di layar.
   - Tombol Pause menghentikan sementara, Reset mengembalikan ke durasi awal.

## Cara Menjalankan Proyek

1. **Siapkan Database**
   - Jalankan MySQL dan phpMyAdmin.
   - Buat database bernama `study_focus`.
   - Buat tabel `tugas` (dan tabel lain jika sudah disediakan skrip SQL-nya).
   - Pastikan struktur `tugas` sesuai dengan kode di `TugasDAO`.

2. **Konfigurasi Project di IDE**
   - Clone atau download repository ini.
   - Buka di NetBeans atau IDE Java lain.
   - Tambahkan library `mysql-connector` ke project (jika belum ada).

3. **Atur Koneksi Database**
   - Buka file `Koneksi.java`.
   - Sesuaikan:
     - URL database ( `jdbc:mysql://localhost:3306/study_focus`)
     - Username dan password MySQL sesuai pengaturan lokal.

4. **Jalankan Aplikasi**
   - Jalankan kelas `AppMain` atau `StudyFocusFrame` sebagai main class.
   - Pastikan:
     - Jendela timer dan task list muncul.
     - Bisa menambah/menghapus tugas dan tampil di tabel.
     - Timer Pomodoro bisa Start, Pause, dan Reset.

## Struktur Folder (Umum)

- `src/studyfocus/`
  - `AppMain.java` – titik masuk aplikasi.
  - `StudyFocusFrame.java` – tampilan utama timer + task list.
  - `Koneksi.java` – pengaturan koneksi MySQL.
  - `Tugas.java` – model data tugas.
  - `TugasDAO.java` – akses data ke tabel `tugas`.
- `db/` (opsional) – skrip SQL untuk membuat database dan tabel.
- `README.md` – dokumentasi singkat proyek.

## Future Work

- Mengaktifkan fitur pengingat tugas menggunakan tabel `pengingat` untuk notifikasi otomatis sebelum deadline.
- Menambahkan pengaturan durasi Pomodoro per pengguna dengan memanfaatkan tabel `pengaturan_pomodoro`.
- Menyediakan statistik jumlah sesi Pomodoro yang digunakan per tugas.
- Pengembangan versi web/mobile agar aplikasi lebih mudah diakses.

## Lisensi

Proyek ini dibuat untuk keperluan pembelajaran dan tugas kuliah. 
