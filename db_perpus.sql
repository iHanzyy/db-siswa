-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Feb 2025 pada 09.22
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpus`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_buku` (`_idBuku` INT)   BEGIN
    DELETE FROM buku
    WHERE idBuku = _idBuku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_peminjaman` (`_idPeminjaman` INT)   BEGIN
    DELETE FROM peminjaman
    WHERE idPeminjaman = _idPeminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_siswa` (`_idSiswa` INT)   BEGIN
    DELETE FROM siswa
    WHERE idSiswa = _idSiswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_buku` (`_judulBuku` VARCHAR(50), `_penulis` VARCHAR(50), `_kategori` VARCHAR(50), `_stok` INT)   BEGIN
	INSERT into buku (judulBuku,penulis,kategori,stok) values (_judulBuku, _penulis,_kategori,_stok);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_peminjaman` (`_idSiswa` INT, `_idBuku` INT, `_tanggalPeminjaman` DATE, `_tanggalKembali` DATE, `_Status` VARCHAR(50))   BEGIN
	INSERT into peminjaman (idSiswa,idBuku,tanggalPeminjaman,tanggalKembali,_status) values (_idSiswa,_idBuku,_tanggalPeminjaman,_tanggalKembali,_Status);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_siswa` (`_nama` VARCHAR(50), `_kelas` VARCHAR(50))   BEGIN
	INSERT into siswa (nama,kelas) values (_nama, _kelas);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KembalikanBuku` (IN `_idPeminjaman` INT)   BEGIN
    UPDATE peminjaman SET status = 'Dikembalikan', tanggalKembali = CURDATE()
    WHERE idPeminjaman = _idPeminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SemuaBuku` ()   BEGIN
    SELECT buku.*, IFNULL(peminjaman.idPeminjaman, 'Belum Dipinjam') AS _status
    FROM buku LEFT JOIN peminjaman ON buku.idBuku = peminjaman.idBuku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SemuaSiswa` ()   BEGIN
    SELECT siswa.*, IFNULL(peminjaman.idPeminjaman, 'Belum Meminjam') AS _status
    FROM siswa LEFT JOIN peminjaman ON siswa.idSiswa = peminjaman.idSiswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all_buku` ()   BEGIN
    SELECT * FROM buku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all_peminjaman` ()   BEGIN
    SELECT * FROM peminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all_siswa` ()   BEGIN
    SELECT * FROM siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SiswaPernahPinjam` ()   BEGIN
    SELECT DISTINCT siswa.* FROM siswa
    JOIN peminjaman ON siswa.idSiswa = peminjaman.idSiswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_buku` (`_idBuku` INT, `_judulBuku` VARCHAR(50), `_penulis` VARCHAR(50), `_kategori` VARCHAR(50), `_stok` INT)   BEGIN
    UPDATE buku
    SET judulBuku = _judulBuku, penulis = _penulis, kategori = _kategori, stok = _stok
    WHERE idBuku = _idBuku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_peminjaman` (`_idPeminjaman` INT, `_idSiswa` INT, `_idBuku` INT, `_tanggalPeminjaman` DATE, `_tanggalKembali` DATE, `_Status` VARCHAR(50))   BEGIN
    UPDATE peminjaman
    SET idSiswa = _idSiswa, idBuku = _idBuku, tanggalPeminjaman = _tanggalPeminjaman, tanggalKembali = _tanggalKembali, Status = _Status
    WHERE idPeminjaman = _idPeminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_siswa` (`_idSiswa` INT, `_nama` VARCHAR(50), `_kelas` VARCHAR(50))   BEGIN
    UPDATE siswa
    SET nama = _nama, kelas = _kelas
    WHERE idSiswa = _idSiswa;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `idBuku` int(11) NOT NULL,
  `judulBuku` varchar(50) DEFAULT NULL,
  `penulis` varchar(50) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`idBuku`, `judulBuku`, `penulis`, `kategori`, `stok`) VALUES
(1, 'Algoritma dan Pemrograman', 'Andi Wijaya', 'Teknologi', 5),
(2, 'Dasar-dasar Database', 'Budi Santoso', 'Teknologi', 7),
(3, 'Matematika Diskrit', 'Rina Sari', 'Matematika', 4),
(4, 'Sejarah Dunia', 'John Smith', 'Sejarah', 3),
(5, 'Pemrograman Web dengan PHP', 'Eko Prasetyo', 'Teknologi', 8),
(6, 'Sistem Operasi', 'Dian Kurniawan', 'Teknologi', 6),
(7, 'Jaringan Komputer', 'Ahmad Fauzi', 'Teknologi', 5),
(8, 'Cerita Rakyat Nusantara', 'Lestari Dewi', 'Sastra', 9),
(9, 'Bahasa Inggris untuk Pemula', 'Jane Doe', 'Bahasa', 10),
(10, 'Biologi Dasar', 'Budi Rahman', 'Sains', 7),
(11, 'Kimia Organik', 'Siti Aminah', 'Sains', 5),
(12, 'Teknik Elektro', 'Ridwan Hakim', 'Teknik', 6),
(13, 'Fisika Modern', 'Albert Einstein', 'Sains', 4),
(14, 'Manajemen Waktu', 'Steven Covey', 'Pengembangan', 8),
(15, 'Strategi Belajar Efektif', 'Tony Buzan', 'Pendidikan', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `idPeminjaman` int(11) NOT NULL,
  `idSiswa` int(11) DEFAULT NULL,
  `idBuku` int(11) DEFAULT NULL,
  `tanggalPeminjaman` date DEFAULT NULL,
  `tanggalKembali` date DEFAULT NULL,
  `_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`idPeminjaman`, `idSiswa`, `idBuku`, `tanggalPeminjaman`, `tanggalKembali`, `_status`) VALUES
(1, 11, 2, '2025-02-01', '2025-02-08', 'Dipinjam'),
(2, 2, 5, '2025-01-28', '2025-02-04', 'Dikembalikan'),
(3, 3, 8, '2025-02-02', '2025-02-09', 'Dipinjam'),
(4, 4, 10, '2025-01-30', '2025-02-06', 'Dikembalikan'),
(5, 5, 3, '2025-01-25', '2025-02-01', 'Dikembalikan'),
(7, 15, 7, '2025-02-01', '2025-02-08', 'Dipinjam'),
(8, 7, 1, '2025-01-29', '2025-02-05', 'Dikembalikan'),
(9, 8, 9, '2025-02-03', '2025-02-10', 'Dipinjam'),
(10, 13, 4, '2025-01-27', '2025-02-03', 'Dikembalikan'),
(11, 10, 11, '2025-02-01', '2025-02-08', 'Dipinjam');

--
-- Trigger `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `KurangiStok` AFTER INSERT ON `peminjaman` FOR EACH ROW BEGIN
    UPDATE buku SET stok = stok - 1 WHERE idBuku = NEW.idBuku;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TambahStok` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
    IF NEW._status = 'Dikembalikan' THEN
        UPDATE buku SET stok = stok + 1 WHERE idBuku = NEW.idBuku;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `idSiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`idSiswa`, `nama`, `kelas`) VALUES
(1, 'Andi Saputra', 'X-RPL'),
(2, 'Budi Wijaya', 'X-TKJ'),
(3, 'Citra Lestari', 'X-RPL'),
(4, 'Dewi Kurniawan', 'X-TKJ'),
(5, 'Eko Prasetyo', 'X-RPL'),
(6, 'Farhan Maulana', 'XII-TKJ'),
(7, 'Gita Permata', 'X-RPL'),
(8, 'Hadi Sucipto', 'X-TKJ'),
(9, 'Intan Permadi', 'XI-RPL'),
(10, 'Joko Santoso', 'XI-TKJ'),
(11, 'Kartika Sari', 'XII-RPL'),
(12, 'Lintang Putri', 'XII-TKJ'),
(13, 'Muhammad Rizky', 'X-RPL'),
(14, 'Novi Andriana', 'X-TKJ'),
(15, 'Olivia Hernanda', 'XI-RPL');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`idBuku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`idPeminjaman`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idSiswa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `idBuku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `idPeminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idSiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
