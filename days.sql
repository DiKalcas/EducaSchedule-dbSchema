-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 06 Ιαν 2015 στις 10:36:28
-- Έκδοση διακομιστή: 5.5.36
-- Έκδοση PHP: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Βάση δεδομένων: `eduschedul`
--

INSERT INTO `days` (`dayID`, `dayName`, `dayAbbrev`) VALUES
(1, 'ΔΕΥΤΕΡΑ', 'Δε'),
(2, 'ΤΡΙΤΗ', 'Τρ'),
(3, 'ΤΕΤΑΡΤΗ', 'Τε'),
(4, 'ΠΕΜΠΤΗ', 'Πε'),
(5, 'ΠΑΡΑΣΚΕΥΗ', 'Πα'),
(6, 'ΣΑΒΒΑΤΟ', 'Σα'),
(7, 'ΚΥΡΙΑΚΗ', 'Κυ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
