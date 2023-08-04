-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27 Jul 2023 pada 11.39
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pisang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bahan_baku`
--

CREATE TABLE `tb_bahan_baku` (
  `id` int(8) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `nama_bahan_baku` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `min_stok` int(11) NOT NULL,
  `total` double NOT NULL,
  `keterangan` varchar(30) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_bahan_baku`
--

INSERT INTO `tb_bahan_baku` (`id`, `supplier_id`, `nama_bahan_baku`, `harga`, `stok`, `min_stok`, `total`, `keterangan`, `gambar`) VALUES
(1, 1, 'Barangan Merah Grade A', 9000, 400, 1, 0, 'Mulus', '18263_pisang1.jpg'),
(2, 2, 'Barangan Merah Grade B', 8000, 250, 1, 0, 'Sedikit Berbintik', '4676_pisang5.jpeg'),
(3, 3, 'Barangan Merah Grade A', 9000, 250, 1, 0, 'Mulus', '31842_pisang2.jpg'),
(4, 4, 'Barangan Merah Grade B', 80000, 200, 1, 0, 'Sedikit Berbintik', '4523_pisang5.jpeg'),
(28, 5, 'Barangan Merah Grade C', 70000, 250, 1, 0, 'Berbintik', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_konsumen`
--

CREATE TABLE `tb_konsumen` (
  `id` int(11) NOT NULL,
  `nama_konsumen` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_handphone` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_konsumen`
--

INSERT INTO `tb_konsumen` (`id`, `nama_konsumen`, `alamat`, `no_handphone`, `username`, `email`, `password`) VALUES
(1, 'Pajak Kartini', 'Kisaran', '082249758444', 'kartini', 'kartini@gmail.com', 'kartini');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `bukti` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi_barang` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_order`
--

INSERT INTO `tb_order` (`id`, `id_supplier`, `status`, `bukti`, `tanggal`, `lokasi_barang`) VALUES
(3, 4, 2, 'bukti transfer.jpg', '2020-08-03', NULL),
(4, 3, 2, 'bukti transfer.jpg', '2020-08-04', NULL),
(5, 6, 2, 'bukti transfer.jpg', '2020-08-06', NULL),
(6, 4, 2, 'bukti transfer.jpg', '2020-08-06', NULL),
(39, 3, 0, '', '2021-09-06', NULL),
(40, 4, 2, 'beritasatu.png', '2021-09-06', 'Perjalanan Menuju Lokasi'),
(41, 3, 2, 'avatar-01.jpg', '2021-10-11', 'Sudah sampai di Kisaran'),
(42, 3, 0, '', '2021-10-15', NULL),
(43, 1, 0, '', '2023-07-01', NULL),
(44, 1, 0, '', '2023-07-01', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembelian`
--

CREATE TABLE `tb_pembelian` (
  `id` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `nama_bahan_baku` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pembelian`
--

INSERT INTO `tb_pembelian` (`id`, `id_supplier`, `id_order`, `nama_bahan_baku`, `tanggal`, `jumlah`, `harga`, `keterangan`, `total`) VALUES
(38, 1, 43, 'Barangan Merah Grade A', '2023-05-05', 100, 9000, 'diterima', 900000),
(39, 1, 44, 'Barangan Merah Grade A', '2023-05-08', 100, 9000, 'diterima', 900000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemesanan`
--

CREATE TABLE `tb_pemesanan` (
  `id` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `nama_bahan_baku` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pemesanan`
--

INSERT INTO `tb_pemesanan` (`id`, `id_supplier`, `nama_bahan_baku`, `tanggal`, `jumlah`, `harga`, `keterangan`) VALUES
(1, 1, 'Barangan Merah Grade A', '2023-05-09', 50, 9000, 'pesan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id` int(11) NOT NULL,
  `produk` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `berat_bersih` int(11) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_produk`
--

INSERT INTO `tb_produk` (`id`, `nama`, `jumlah`, `berat_bersih`, `harga`, `total`) VALUES
(21, 'Pisang Barangan Merah Grade A', 350, 250, 9000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produksi`
--

CREATE TABLE `tb_produksi` (
  `id` int(11) NOT NULL,
  `produk` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_produksi`
--

INSERT INTO `tb_produksi` (`id`, `produk`, `jumlah`, `status`, `tanggal`) VALUES
(1, 'Pisang Barangan Merah Grade A', '100', 'produksi', '2023-05-22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produksi_bahan_baku`
--

CREATE TABLE `tb_produksi_bahan_baku` (
  `id` int(11) NOT NULL,
  `produk` varchar(50) NOT NULL,
  `bahan_baku` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_produksi_bahan_baku`
--

INSERT INTO `tb_produksi_bahan_baku` (`id`, `produk`, `bahan_baku`, `jumlah`) VALUES
(12, 'Tepung Tapioka', 'Ubi Kayu (Tinggi Raja)', '40'),
(15, 'Tepung Tapioka Cap Dua Naga (25 kg)', 'Ubi Kayu (Tinggi Raja)', '30'),
(17, 'Tepung Tapioka Cap Dua Naga (50 kg)', 'Ubi Kayu (Dusun)', '30'),
(18, 'Barangan Merah Grade A', 'Barangan Merah Grade A', '1000'),
(19, 'Pisang Barangan Merah Grade A', 'Barangan Merah Grade A', '250');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id` int(11) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_handphone` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_supplier`
--

INSERT INTO `tb_supplier` (`id`, `nama_supplier`, `alamat`, `no_handphone`, `username`, `email`, `password`) VALUES
(1, 'Maslina', 'Sionggang', '081236318642', 'maslina', 'maslina@gmail.com', 'maslina'),
(2, 'Eko Sujono', 'Air Joman', '081354367834', 'eko', 'eko@gmail.com', 'eko'),
(3, 'Rismawati', 'Sido Rukun', '085343566550', 'risma', 'risma@gmail.com', 'risma'),
(4, 'Taufiq', 'Sei Renggas', '082372333001', 'taufiq', 'Taufiq@gmail.com', 'taufiq'),
(5, 'M. Rivaldi', 'Kisaran', '082257724004', 'rival', 'rival@gmail.com', 'rival');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `id_konsumen` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `hp` varchar(15) NOT NULL,
  `total` int(7) NOT NULL,
  `status` varchar(30) NOT NULL,
  `bukti` varchar(255) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `id_konsumen`, `alamat`, `hp`, `total`, `status`, `bukti`, `tanggal`) VALUES
(1, 7, 'kisaran', '082256624750', 1140000, '5', '1074907914.jpg', '2021-10-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi_detail`
--

CREATE TABLE `tb_transaksi_detail` (
  `id` int(4) NOT NULL,
  `id_transaksi` int(4) NOT NULL,
  `id_bahan_baku` int(4) NOT NULL,
  `jumlah` int(7) NOT NULL,
  `harga` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_transaksi_detail`
--

INSERT INTO `tb_transaksi_detail` (`id`, `id_transaksi`, `id_bahan_baku`, `jumlah`, `harga`) VALUES
(1, 1, 21, 3, 290000),
(2, 1, 22, 1, 270000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'pimpinan', '90973652b88fe07d05a4304f0a945de8', 'pimpinan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_bahan_baku`
--
ALTER TABLE `tb_bahan_baku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_konsumen`
--
ALTER TABLE `tb_konsumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pemesanan`
--
ALTER TABLE `tb_pemesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_produksi`
--
ALTER TABLE `tb_produksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_produksi_bahan_baku`
--
ALTER TABLE `tb_produksi_bahan_baku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaksi_detail`
--
ALTER TABLE `tb_transaksi_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_bahan_baku`
--
ALTER TABLE `tb_bahan_baku`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tb_konsumen`
--
ALTER TABLE `tb_konsumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `tb_pemesanan`
--
ALTER TABLE `tb_pemesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tb_produksi`
--
ALTER TABLE `tb_produksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_produksi_bahan_baku`
--
ALTER TABLE `tb_produksi_bahan_baku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_transaksi_detail`
--
ALTER TABLE `tb_transaksi_detail`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
