-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2025 at 06:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `study_focus`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan_pomodoro`
--

CREATE TABLE `pengaturan_pomodoro` (
  `id` int(11) NOT NULL,
  `focus_minutes` int(11) NOT NULL,
  `short_break_minutes` int(11) NOT NULL,
  `long_break_minutes` int(11) NOT NULL,
  `long_break_interval` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengaturan_pomodoro`
--

INSERT INTO `pengaturan_pomodoro` (`id`, `focus_minutes`, `short_break_minutes`, `long_break_minutes`, `long_break_interval`) VALUES
(1, 25, 5, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pengingat`
--

CREATE TABLE `pengingat` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `waktu` datetime NOT NULL,
  `kategori` enum('TUGAS','UTS','UAS','PRIBADI') DEFAULT 'PRIBADI',
  `sudah_ingat` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `matkul` varchar(100) DEFAULT NULL,
  `tipe` enum('TUGAS','QUIZ','UTS','UAS','LAINNYA') DEFAULT 'TUGAS',
  `deadline` date DEFAULT NULL,
  `estimasi_pomodoro` int(11) DEFAULT 1,
  `pomodoro_selesai` int(11) DEFAULT 0,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`id`, `judul`, `matkul`, `tipe`, `deadline`, `estimasi_pomodoro`, `pomodoro_selesai`, `catatan`) VALUES
(4, 'UAS', 'PBO', 'TUGAS', '2025-12-31', 1, 0, NULL),
(5, 'JURNAL', 'STATIS', 'TUGAS', '2025-12-30', 1, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengaturan_pomodoro`
--
ALTER TABLE `pengaturan_pomodoro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengingat`
--
ALTER TABLE `pengingat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengingat`
--
ALTER TABLE `pengingat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
