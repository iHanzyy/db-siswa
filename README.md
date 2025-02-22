# 📚 DATABASE PERPUSTAKAAN

## 📖 Deskripsi

Repository ini berisi kumpulan query SQL yang digunakan untuk membangun sistem manajemen perpustakaan berbasis database MySQL. Sistem ini memungkinkan pencatatan data buku, siswa, serta peminjaman dan pengembalian buku dengan fitur otomatisasi stok menggunakan **Stored Procedures** dan **Triggers**.

---

## 🛠️ Fitur Utama

✅ **Membuat database dan tabel** untuk menyimpan data buku, siswa, dan peminjaman.\
✅ **Insert data otomatis** menggunakan Stored Procedure.\
✅ **Mengupdate dan menghapus data** buku melalui Stored Procedure.\
✅ **Menampilkan seluruh data** dari tiap tabel.\
✅ **Trigger stok otomatis berkurang saat buku dipinjam dan bertambah saat dikembalikan.**\
✅ **Stored Procedure untuk mengembalikan buku dengan tanggal otomatis.**\
✅ **Query untuk melihat daftar siswa yang pernah meminjam atau belum pernah meminjam.**\
✅ **Query untuk melihat buku yang belum pernah dipinjam.**

---

## 📌 Struktur Database

Sistem ini terdiri dari tiga tabel utama:

1️⃣ → Menyimpan informasi tentang buku yang tersedia.\
2️⃣ → Data siswa yang bisa meminjam buku.\
3️⃣ → Mencatat siapa yang meminjam buku dan kapan pengembaliannya.

---

## 📜 Dokumentasi Query SQL

Dokumentasi lengkap query SQL dan penjelasannya bisa kamu cek di file PDF-nya.

📂 **Isi dokumentasi mencakup:**

- Pembuatan database dan tabel
- Insert data secara manual dan otomatis
- Stored Procedure untuk CRUD
- Trigger untuk otomatisasi stok buku
- Query untuk menampilkan data tertentu

---

## 📥 Cara Menggunakan

1️⃣ Clone repository ini ke komputer kamu:

```sh
git clone https://github.com/iHanzyy/db-siswa.git
```

2️⃣ Import database dari file `db_perpus.sql`.\
3️⃣ Jalankan setiap query yang ada di dalam dokumentasi.\
4️⃣ Pastikan MySQL/MariaDB sudah terinstall di komputer kamu.

---

## 🧐 FAQ

**❓ Kenapa pakai **``** di beberapa query?**\
➡ Karena kita melakukan `JOIN` dengan tabel lain (`peminjaman`), jadi harus spesifik pakai `siswa.*` supaya SQL tahu kita ambil data dari tabel `siswa`.

**❓ Kenapa pakai **``**?**\
➡ Kalau ada siswa yang belum pernah pinjam buku, `peminjaman.id_peminjaman` bakal NULL. Kita pakai `IFNULL()` supaya NULL itu diubah jadi "Belum Meminjam", biar lebih gampang dipahami.

---

## 🚀 Kontribusi

Kalau ada yang mau ditambahin atau diperbaiki, silakan fork repository ini dan ajukan **pull request**.

---

## 📢 Lisensi

Project ini bebas digunakan dan dikembangkan lebih lanjut. Happy coding! 💻✨

