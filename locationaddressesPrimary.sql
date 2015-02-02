-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2014 at 10:21 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.25

/*SET FOREIGN_KEY_CHECKS=0*/;
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
-- Dumping data for table `locationaddresses`
--

INSERT INTO `locationaddresses` (`locationAddressID`, `city`, `area`, `address`, `zipPostCode`, `province`, `country`, `otherDetails`) VALUES
(9, 'έδρα εκπαιδευτικού ιδρύματος', 'περιοχή έδρας', 'διεύθηνση ΤΕΙ', 99999, NULL, NULL, NULL),
(1001, 'ΛΑΡΙΣΑ', 'Άγιος Θωμας', 'Περιφεριακός Λάρισας - Τρικάλων', 41110, 'Θεσσαλία', 'Ελλάδα', 'Έδρα του Τ.ΕΙ. και βασικές εγκαταστάσεις'),
(1002, 'ΤΡΙΚΑΛΑ', 'περιοχή Τρικάλων', 'Αργοναυτών 1Γ', 42100, 'Θεσσαλία', 'Ελλάδα', 'Περιφερειακό υποκατάστημα Τ.Ε.Ι. Λάρισας'),
(1003, 'ΚΑΡΔΙΤΣΑ', 'περιοχή Καρδίτσας', 'Τέρμα Ν. Τεμπονέρα', 43100, 'Θεσσαλία', 'Ελλάδα', 'Περιφερειακό υποκατάστημα Τ.Ε.Ι. Λάρισας');
/*SET FOREIGN_KEY_CHECKS=1*/;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
