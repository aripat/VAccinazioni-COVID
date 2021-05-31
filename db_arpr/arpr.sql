-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 31, 2021 at 04:15 PM
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
-- Database: `arpr`
--

-- --------------------------------------------------------

--
-- Table structure for table `cittadino`
--

CREATE TABLE `cittadino` (
  `codice_fiscale` varchar(30) NOT NULL,
  `cat_rischio` enum('A','B','C','D','E','F','G') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cittadino`
--

INSERT INTO `cittadino` (`codice_fiscale`, `cat_rischio`) VALUES
('RZZLSF98', 'E');

-- --------------------------------------------------------

--
-- Table structure for table `team_cittadino`
--

CREATE TABLE `team_cittadino` (
  `codice_fiscale` varchar(30) NOT NULL,
  `team` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_cittadino`
--

INSERT INTO `team_cittadino` (`codice_fiscale`, `team`) VALUES
('RZZLSF98', '0000000000000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
