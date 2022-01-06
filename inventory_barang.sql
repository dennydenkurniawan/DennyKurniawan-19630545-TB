-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jan 2022 pada 06.41
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory_barang_keluar`
--

CREATE TABLE `inventory_barang_keluar` (
  `Kd_Barang` int(34) NOT NULL,
  `Nama_Barang` varchar(25) NOT NULL,
  `Tanggal_Masuk` date NOT NULL,
  `Tanggal_Keluar` date NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Kondisi` text CHARACTER SET latin2 COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `inventory_barang_keluar`
--

INSERT INTO `inventory_barang_keluar` (`Kd_Barang`, `Nama_Barang`, `Tanggal_Masuk`, `Tanggal_Keluar`, `Jumlah`, `Kondisi`) VALUES
(12345, 'Obat-Obatan', '2021-10-01', '2021-06-30', 1000, 'Rusak Ringan'),
(12346, 'Masker', '2021-01-01', '2021-06-30', 1500, 'Rusak Ringan');

--
-- Trigger `inventory_barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `keluar` AFTER INSERT ON `inventory_barang_keluar` FOR EACH ROW BEGIN
UPDATE inventory_barang_masuk SET Jumlah=Jumlah-NEW.Jumlah
WHERE Kd_Barang=NEW.Kd_Barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory_barang_masuk`
--

CREATE TABLE `inventory_barang_masuk` (
  `Kd_Barang` int(34) NOT NULL,
  `Nama_Barang` varchar(25) NOT NULL,
  `Tanggal_Masuk` date NOT NULL,
  `Jumlah` int(10) NOT NULL,
  `Kondisi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `inventory_barang_masuk`
--

INSERT INTO `inventory_barang_masuk` (`Kd_Barang`, `Nama_Barang`, `Tanggal_Masuk`, `Jumlah`, `Kondisi`) VALUES
(12346, 'Masker', '2021-01-01', 500, 'Rusak Ringan'),
(12347, 'Infus', '2021-02-01', 2000, 'Baik');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `inventory_barang_masuk`
--
ALTER TABLE `inventory_barang_masuk`
  ADD PRIMARY KEY (`Kd_Barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
