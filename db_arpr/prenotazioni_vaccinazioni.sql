-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2021 at 06:23 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prenotazioni_vaccinazioni`
--

-- --------------------------------------------------------

--
-- Table structure for table `erogazione`
--

CREATE TABLE `erogazione` (
  `id_erogazione` int(11) NOT NULL,
  `polo_vaccinale` varchar(100) NOT NULL,
  `vaccino` varchar(100) NOT NULL,
  `data` char(10) NOT NULL,
  `ora` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `erogazione`
--

INSERT INTO `erogazione` (`id_erogazione`, `polo_vaccinale`, `vaccino`, `data`, `ora`) VALUES
(3, 'ColleferroAuditorium', 'Pfizer', '2021-07-10', '14:15'),
(4, 'ColleferroAuditorium', 'Pfizer', '2021-07-31', '14:15'),
(5, 'ColleferroAuditorium', 'Pfizer', '2021-07-09', '14:15'),
(6, 'ColleferroAuditorium', 'Pfizer', '2021-07-30', '14:15'),
(7, 'ColleferroAuditorium', 'Pfizer', '2021-07-08', '14:15'),
(8, 'ColleferroAuditorium', 'Pfizer', '2021-07-29', '14:15'),
(9, 'ColleferroAuditorium', 'Pfizer', '2021-07-10', '14:00'),
(10, 'ColleferroAuditorium', 'Pfizer', '2021-07-31', '14:00'),
(11, 'ColleferroAuditorium', 'Pfizer', '2021-07-09', '14:00'),
(12, 'ColleferroAuditorium', 'Pfizer', '2021-07-30', '14:00'),
(13, 'ColleferroAuditorium', 'Pfizer', '2021-07-08', '14:00'),
(14, 'ColleferroAuditorium', 'Pfizer', '2021-07-29', '14:00'),
(15, 'ColleferroAuditorium', 'Pfizer', '2021-07-10', '13:45'),
(16, 'ColleferroAuditorium', 'Pfizer', '2021-07-31', '13:45'),
(17, 'ColleferroAuditorium', 'Pfizer', '2021-07-09', '13:45'),
(18, 'ColleferroAuditorium', 'Pfizer', '2021-07-30', '13:45'),
(19, 'ColleferroAuditorium', 'Pfizer', '2021-07-08', '13:45'),
(20, 'ColleferroAuditorium', 'Pfizer', '2021-07-29', '13:45');

-- --------------------------------------------------------

--
-- Table structure for table `polo_per_categoria`
--

CREATE TABLE `polo_per_categoria` (
  `polo_vaccinale` varchar(100) NOT NULL,
  `categoria` enum('A','B','C','D','E','F','G') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `polo_per_categoria`
--

INSERT INTO `polo_per_categoria` (`polo_vaccinale`, `categoria`) VALUES
('ColleferroAuditorium', 'E');

-- --------------------------------------------------------

--
-- Table structure for table `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `codice_fiscale` varchar(30) NOT NULL,
  `team` char(13) NOT NULL,
  `numero_richiesta` char(14) NOT NULL,
  `id_erogazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vaccino_per_categoria`
--

CREATE TABLE `vaccino_per_categoria` (
  `vaccino` varchar(100) NOT NULL,
  `categoria` enum('A','B','C','D','E','F','G') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `erogazione`
--
ALTER TABLE `erogazione`
  ADD PRIMARY KEY (`id_erogazione`),
  ADD KEY `fk_foreign_key_polo_vaccinale` (`polo_vaccinale`);

--
-- Indexes for table `polo_per_categoria`
--
ALTER TABLE `polo_per_categoria`
  ADD PRIMARY KEY (`polo_vaccinale`,`categoria`);

--
-- Indexes for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`numero_richiesta`,`id_erogazione`),
  ADD KEY `foreign_key_id_erogazione` (`id_erogazione`);

--
-- Indexes for table `vaccino_per_categoria`
--
ALTER TABLE `vaccino_per_categoria`
  ADD PRIMARY KEY (`vaccino`,`categoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `erogazione`
--
ALTER TABLE `erogazione`
  MODIFY `id_erogazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `erogazione`
--
ALTER TABLE `erogazione`
  ADD CONSTRAINT `fk_foreign_key_polo_vaccinale` FOREIGN KEY (`polo_vaccinale`) REFERENCES `polo_per_categoria` (`polo_vaccinale`);

--
-- Constraints for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`id_erogazione`) REFERENCES `erogazione` (`id_erogazione`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
