-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2015 at 02:02 PM
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
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subjectID`, `subjectName`, `subjectAbbrev`, `description`, `weekTeach`, `otherDetails`, `levelID`) VALUES
(9, 'γενικό θέμα ΤΕΙ διδασκαλίας', 'γενικ.θέμα', 'γενικό θέμα τεχνολογικής εκπαίδευσης', 0, NULL, 9),
(11, 'ΜΑΘΗΜΑΤΙΚΗ ΑΝΑΛΥΣΗ 1', 'Μαθηματ.Ανάλ.1', 'Μαθηματική Ανάλυση αρχικό επίπεδο', 4, NULL, 11),
(12, 'ΜΑΘΗΜΑΤΙΚΗ ΑΝΑΛΥΣΗ 2', 'Μαθηματ.Ανάλ.2', 'Μαθηματική Ανάλυση προχωρημένο επίπεδο', 4, NULL, 12);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
