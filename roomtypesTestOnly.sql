-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2014 at 10:26 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.25

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
-- Dumping data for table `roomtypes`
--

INSERT INTO `roomtypes` (`roomTypeID`, `roomTitle`, `roomCapacity`, `roomEquipment`, `otherDetails`) VALUES
(9, 'γενικός τύπος αίθουσας', 999, 'βασικός εξοπλισμός', NULL),
(11, 'ΑΜΦΙΘΕΑΤΡΟ', 100, 'Προβολή φιλμ', 'Αίθουσα διδασκαλίας, αμφιθεατρικής κατασκευής'),
(12, 'ΑΜΦΙΘΕΑΤΡΟ ΕΚΔΗΛΩΣΕΩΝ', 300, 'Βίντεο παρουσίαση', 'Μεγάλη αίθουσα για εκδηλώσεις του Ιδρύματος'),
(21, 'ΕΡΓΑΣΤΗΡΙΟ ΠΛΗΡΟΦΟΡΙΚΗΣ', 45, 'Δίκτυο υπολογιστών', 'Αίθουσα διδασκαλίας μαθημάτων Πληροφορικής'),
(22, 'ΑΙΘΟΥΣΑ ΠΟΛΛΑΠΛΩΝ ΧΡΗΣΕΩΝ', 35, 'Βασικός', 'Γενικός τύπος Αίθουσας διδασκαλίας');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
