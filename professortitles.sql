-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2014 at 10:25 AM
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
-- Dumping data for table `professortitles`
--

INSERT INTO `professortitles` (`professorTitleID`, `titleName`, `weekTeachHours`, `isStanding`, `otherDetails`) VALUES
(11, 'ΚΑΘΗΓΗΤΗΣ', 10, 'ΝΑΙ', 'Γενικός τίτλος μόνιμου εκπαιδευτικού προσωπικ'),
(12, 'ΑΝΑΠΛΗΡΩΤΗΣ ΚΑΘΗΓΗΤΗΣ', 12, 'ΝΑΙ', 'Τίτλος μόνιμου εκπαιδευτικού προσωπικού'),
(13, 'ΕΠΙΚΟΥΡΟΣ ΚΑΘΗΓΗΤΗΣ', 14, 'ΝΑΙ', 'Τίτλος μόνιμου εκπαιδευτικού προσωπικού'),
(14, 'ΚΑΘΗΓΗΤΗΣ ΕΦΑΡΜΟΓΩΝ', 16, 'ΝΑΙ', 'Τίτλος μόνιμου εκπαιδευτικού προσωπικού'),
(15, 'ΕΙΔΙΚΟ ΕΚΠΑΙΔΕΥΤΙΚΟ ΠΡΟΣΩΠΙΚΟ', 99, 'ΝΑΙ', 'Τίτλος μέλους (ΕΕΠ)'),
(16, 'ΕΡΓΑΣΤΗΡΙΑΚΟ ΔΙΔΑΚΤΙΚΟ ΠΡΟΣΩΠΙΚΟ', 99, 'ΝΑΙ', 'Τίτλος μέλους (ΕΡΔΙΠ)'),
(17, 'ΕΙΔΙΚΟ ΤΕΧΝΙΚΟ ΕΡΓΑΣΤΗΡΙΑΚΟ ΠΡΟΣΩΠΙΚΟ', 99, 'ΝΑΙ', 'Τίτλος μέλους (ΕΤΕΠ) '),
(18, 'ΕΙΔΙΚΟ ΤΕΧΝΙΚΟ ΠΡΟΣΩΠΙΚΟ', 20, 'ΝΑΙ', 'Τίτλος μέλους (ΕΤΠ) '),
(31, 'ΕΝΤΕΤΑΛΜΕΝΟΣ ΔΙΔΑΣΚΑΛΙΑΣ', 99, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού'),
(32, 'ΠΑΝΕΠΙΣΤΗΜΙΑΚΟΣ ΥΠΟΤΡΟΦΟΣ', 18, 'ΟΧΙ', 'Τίτλος εκπαιδευτικού προσωπικού'),
(33, 'ΕΠΙΣΤΗΜΟΝΙΚΟΣ ΣΥΝΕΡΓΑΤΗΣ ΜΕ ΠΛΗΡΗ ΠΡΟΣΟΝΤΑ', 14, 'ΟΧΙ', 'Τίτλος εκπαιδευτικού προσωπικού'),
(34, 'ΕΠΙΣΤΗΜΟΝΙΚΟΣ ΣΥΝΕΡΓΑΤΗΣ ΜΕ ΕΛΛΙΠΗ ΠΡΟΣΟΝΤΑ', 14, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού'),
(35, 'ΕΡΓΑΣΤΗΡΙΑΚΟΣ ΣΥΝΕΡΓΑΤΗΣ ΜΕ ΠΛΗΡΗ ΠΡΟΣΟΝΤΑ', 16, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού'),
(36, 'ΕΡΓΑΣΤΗΡΙΑΚΟΣ ΣΥΝΕΡΓΑΤΗΣ ΜΕ ΕΛΛΙΠΗ ΠΡΟΣΟΝΤΑ', 16, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού'),
(37, 'ΥΠΟΤΡΟΦΟΣ ΕΠΙΤΡΟΠΗΣ ΕΡΕΥΝΩΝ', 99, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού');
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
