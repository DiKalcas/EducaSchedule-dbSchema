-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2015 at 01:49 PM
-- Server version: 5.5.36
-- PHP Version: 5.4.25

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eduschedul`
--

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`schoolID`, `schoolSectionName`, `schoolSectionAbbrev`, `locatAddressID_byLocationAddresses`) VALUES
(9, 'σχολή εκπαιδευτικού ιδρύματος', 'σχολ.εκπαιδ.ιδρύμ.', 9),
(11, 'ΠΟΛΙΤΙΚΩΝ ΜΗΧΑΝΙΚΩΝ Τ.Ε. Τμήμα(ΣΤΕΦ)', 'Πολιτικ.Μηχαν.', 1002),
(12, 'ΗΛΕΚΤΡΟΛΟΓΩΝ ΜΗΧΑΝΙΚΩΝ Τ.Ε. Τμήμα(ΣΤΕΦ)', 'Ηλεκτρ.Μηχαν.', 1001),
(13, 'ΜΗΧΑΝΙΚΩΝ ΠΛΗΡΟΦΟΡΙΚΗΣ Τ.Ε. Τμήμα(ΣΤΕΦ)', 'Μηχανικ.Πληροφ.', 1001);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
