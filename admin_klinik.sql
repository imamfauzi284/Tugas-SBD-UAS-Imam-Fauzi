-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2022 at 07:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_klinik`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_totalUsers` () RETURNS INT(11) UNSIGNED NO SQL RETURN (SELECT COUNT(id_pasien) FROM pasien)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `berobat`
--

CREATE TABLE `berobat` (
  `id_berobat` int(11) NOT NULL,
  `id_pasien` int(5) DEFAULT NULL,
  `id_dokter` int(5) DEFAULT NULL,
  `tgl_berobat` date DEFAULT NULL,
  `keluhan_pasien` varchar(200) DEFAULT NULL,
  `hasil_diagnosa` varchar(200) DEFAULT NULL,
  `penatalaksanaan` enum('Rawat Jalan','Rawat Inap','Rujuk','lainnya') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `berobat`
--

INSERT INTO `berobat` (`id_berobat`, `id_pasien`, `id_dokter`, `tgl_berobat`, `keluhan_pasien`, `hasil_diagnosa`, `penatalaksanaan`) VALUES
(2221, 11, 1011, '2022-04-21', 'Sakit Tenggorokan,Demam,Panas', 'omicron', 'Rujuk'),
(2222, 12, 1012, '2022-04-21', 'sakit kepala sebelah', 'Migren', 'Rawat Jalan'),
(2223, 13, 1013, '2022-04-21', 'sakit leher belakang,pegal', 'kolesterol', 'Rawat Inap'),
(2224, 14, 1014, '2022-04-21', 'Sakit Perut,mules', 'diare', 'Rawat Jalan'),
(2225, 15, 1015, '2022-04-21', 'Sakit Perut, Magh', 'Asam Lambung', 'Rawat Jalan');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(5) NOT NULL,
  `nama_dokter` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`) VALUES
(1015, 'Fauzi'),
(1013, 'Muhamad'),
(1011, 'Siti Fadilah'),
(1012, 'Tirta'),
(1014, 'Willona');

-- --------------------------------------------------------

--
-- Table structure for table `log_obat`
--

CREATE TABLE `log_obat` (
  `id_log` int(11) DEFAULT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `nama_obat_lama` varchar(100) DEFAULT NULL,
  `nama_obat_baru` varchar(100) DEFAULT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_obat`
--

INSERT INTO `log_obat` (`id_log`, `id_obat`, `nama_obat_lama`, `nama_obat_baru`, `waktu`) VALUES
(NULL, 1113, 'Costrimoxazole', 'Promag', '2022-07-14'),
(NULL, 1111, 'Amoxillin', 'Decadryl', '2022-07-18'),
(NULL, 1112, 'Antasida', 'Promagh', '2022-07-18'),
(NULL, 1113, 'Promag', 'Paramex', '2022-07-18'),
(NULL, 1114, 'Dextropen', 'Paracetamol', '2022-07-18'),
(NULL, 1115, 'Erytromycin', 'Amoxilin', '2022-07-18');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(5) NOT NULL,
  `nama_obat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`) VALUES
(1111, 'Decadryl'),
(1112, 'Promagh'),
(1113, 'Paramex'),
(1114, 'Paracetamol'),
(1115, 'Amoxilin');

--
-- Triggers `obat`
--
DELIMITER $$
CREATE TRIGGER `update_nama_obat` BEFORE UPDATE ON `obat` FOR EACH ROW insert into log_obat set id_obat=old.id_obat, nama_obat_lama = old.nama_obat, nama_obat_baru=new.nama_obat, waktu = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(5) NOT NULL,
  `nama_pasien` varchar(40) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `umur` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `umur`) VALUES
(11, 'Imam Fauzi', 'L', 20),
(12, 'Monce', 'P', 25),
(13, 'Mukhlis', 'L', 18),
(14, 'Adilla', 'P', 22),
(15, 'Katak', 'L', 25);

-- --------------------------------------------------------

--
-- Table structure for table `resep_obat`
--

CREATE TABLE `resep_obat` (
  `id_resep` int(11) NOT NULL,
  `id_berobat` int(11) DEFAULT NULL,
  `id_obat` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resep_obat`
--

INSERT INTO `resep_obat` (`id_resep`, `id_berobat`, `id_obat`) VALUES
(3331, 2221, 1111),
(3332, 2222, 1112),
(3333, 2223, 1113),
(3334, 2224, 1114),
(3335, 2225, 1115);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `nama_lengkap` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama_lengkap`) VALUES
(1211, 'adminklinik1', '1211', 'imam'),
(1212, 'adminklinik2', '1212', 'Andini'),
(1213, 'adminklinik3', '1213', 'Irma Karmila'),
(1214, 'adminklinik4', '1214', 'Atta Halilintar'),
(1215, 'adminklinik5', '1215', 'Rafi Ahmad'),
(1216, 'imam', 'Immfzi284', 'Imam Fauzi'),
(1217, 'imam ', '2a7ca991bc2f4485ed5b006394778b4d', 'Imam Fauzi');

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewpenyakit`
-- (See below for the actual view)
--
CREATE TABLE `viewpenyakit` (
`id_berobat` int(11)
,`nama_pasien` varchar(40)
,`jenis_kelamin` enum('L','P')
,`umur` int(2)
,`keluhan_pasien` varchar(200)
,`hasil_diagnosa` varchar(200)
,`tgl_berobat` date
,`nama_dokter` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `viewpenyakit`
--
DROP TABLE IF EXISTS `viewpenyakit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewpenyakit`  AS SELECT `a`.`id_berobat` AS `id_berobat`, `b`.`nama_pasien` AS `nama_pasien`, `b`.`jenis_kelamin` AS `jenis_kelamin`, `b`.`umur` AS `umur`, `a`.`keluhan_pasien` AS `keluhan_pasien`, `a`.`hasil_diagnosa` AS `hasil_diagnosa`, `a`.`tgl_berobat` AS `tgl_berobat`, `c`.`nama_dokter` AS `nama_dokter` FROM ((`berobat` `a` join `pasien` `b` on(`a`.`id_pasien` = `b`.`id_pasien`)) join `dokter` `c` on(`a`.`id_dokter` = `c`.`id_dokter`)) WHERE `b`.`jenis_kelamin` = 'L\'L''L\'L'  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berobat`
--
ALTER TABLE `berobat`
  ADD PRIMARY KEY (`id_berobat`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD UNIQUE KEY `nama_dokter_2` (`nama_dokter`),
  ADD KEY `nama_dokter` (`nama_dokter`),
  ADD KEY `nama_dokter_3` (`nama_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id_berobat` (`id_berobat`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berobat`
--
ALTER TABLE `berobat`
  MODIFY `id_berobat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2226;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1118;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `resep_obat`
--
ALTER TABLE `resep_obat`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3336;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1218;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berobat`
--
ALTER TABLE `berobat`
  ADD CONSTRAINT `id_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `id_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);

--
-- Constraints for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD CONSTRAINT `id_berobat` FOREIGN KEY (`id_berobat`) REFERENCES `berobat` (`id_berobat`),
  ADD CONSTRAINT `id_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
