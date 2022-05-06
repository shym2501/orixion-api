-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 06 Bulan Mei 2022 pada 12.43
-- Versi server: 5.6.38
-- Versi PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orixion`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `inbox`
--

CREATE TABLE `inbox` (
  `id` int(11) NOT NULL,
  `pengirim` varchar(50) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `jenis_id` int(11) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_kegiatan` date NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `inbox`
--

INSERT INTO `inbox` (`id`, `pengirim`, `no_surat`, `jenis_id`, `perihal`, `tgl_masuk`, `tgl_kegiatan`, `file`) VALUES
(1, 'HMPS TBI', '001/pp/raker/hmps-tbi/V/2022', 3, 'penyampaian kegiatan', '2022-05-10', '2022-05-15', 'default.jpg'),
(2, 'HMPS PGMI', '001/pp', 1, 'peminjaman ', '2022-05-15', '2022-05-30', 'hal.jpg'),
(3, 'HMPS EKSYAR', '011/pp/munas/eksyar/2022', 2, 'undangan pembukaan Munas', '2022-05-15', '2022-05-30', 'hal.jpg'),
(6, 'LKQ', '011/pp/munas/lkq/V/2022', 2, 'undangan pembukaan Munas', '2022-05-15', '2022-05-30', 'hal.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `jenis_id` int(11) NOT NULL,
  `jenis` char(20) NOT NULL,
  `warna` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`jenis_id`, `jenis`, `warna`) VALUES
(1, 'Peminjaman', 'error'),
(2, 'Undangan', 'warning'),
(3, 'Penyampaian', 'success'),
(4, 'Lainnya', 'primary');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inbox_jenis_id_jenis_jenis_id` (`jenis_id`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`jenis_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `inbox`
--
ALTER TABLE `inbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `inbox`
--
ALTER TABLE `inbox`
  ADD CONSTRAINT `inbox_jenis_id_jenis_jenis_id` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`jenis_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
