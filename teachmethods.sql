-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2014 at 12:22 PM
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

-- ------------------------------------------------------

--
-- Dumping data for table `teachmethods`
--

INSERT INTO `teachmethods` (`teachMethodID`, `teachMethodTitle`, `otherDetails`) VALUES
(9, 'παράδοση μαθήματος', 'γενική μέθοδος παράδοσης ή παρουσίασης μαθήματος'),
(11, 'ΘΕΩΡΙΑ ΜΑΘΗΜ.', 'Διάλεξη θεωριτικού μέρος μαθήματος.'),
(12, 'ΑΣΚΗΣΗ ΠΡΑΞΗΣ', 'Πρακτική άσκηση της θεωρίας που παραδόθηκε για κατανόηση του θέματος.'),
(13, 'ΕΡΓΑΣΤΗΡΙΟ', 'Εργαστηριακό μέρος μαθήματος σε ειδικά διαμορφωμμένη αίθουσα.');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
