-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2015 at 02:57 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `academicperiods`
--

CREATE TABLE IF NOT EXISTS `academicperiods` (
  `academicPeriodID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `academicYearID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`academicPeriodID`,`academicYearID`),
  UNIQUE KEY `academicPeriodID_idx` (`academicPeriodID`),
  KEY `academicYearID_idx` (`academicYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `academicyears`
--

CREATE TABLE IF NOT EXISTS `academicyears` (
  `academicYearID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`academicYearID`),
  UNIQUE KEY `academicYearID_idx` (`academicYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `buildingfloorrooms`
--

CREATE TABLE IF NOT EXISTS `buildingfloorrooms` (
  `buildingFloorRoomID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `buildingFloorRoomConcat` varchar(48) NOT NULL,
  `buildingName` varchar(45) DEFAULT NULL,
  `floorLevelName` varchar(45) DEFAULT NULL,
  `roomName` varchar(45) DEFAULT NULL,
  `roomTypeID` int(10) unsigned NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`buildingFloorRoomID`),
  UNIQUE KEY `buildingFloorRoomID_idx` (`buildingFloorRoomID`),
  KEY `roomTypeID_idx` (`roomTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='The Buildings of the institution with the Floors of them, and the rooms available for educational activities:  Τα κτήρια του Τ.Ε.Ι. με τους ορόφους του κάθε κτηρίου και οι διαθέσιμες αίθουσες του κάθε ορόφου για διδασκαλία μαθημάτων ή άλλες εκπαιδευτικές δραστηριότητες.' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `buildingfloorrooms`
--

INSERT INTO `buildingfloorrooms` (`buildingFloorRoomID`, `buildingFloorRoomConcat`, `buildingName`, `floorLevelName`, `roomName`, `roomTypeID`, `update_time`) VALUES
(9, 'αίθουσα Τ. Ε. Ιδρύματος', 'κτήριο τεχνολ. εκπαιδ. ιδρύματος', 'οποιοσδήποτε όροφος', 'γενική αίθουσα', 9, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE IF NOT EXISTS `days` (
  `dayID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dayName` varchar(45) DEFAULT NULL,
  `dayAbbrev` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dayID`),
  UNIQUE KEY `dayID_idx` (`dayID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`dayID`, `dayName`, `dayAbbrev`) VALUES
(1, 'ΔΕΥΤΕΡΑ', 'Δε'),
(2, 'ΤΡΙΤΗ', 'Τρ'),
(3, 'ΤΕΤΑΡΤΗ', 'Τε'),
(4, 'ΠΕΜΠΤΗ', 'Πε'),
(5, 'ΠΑΡΑΣΚΕΥΗ', 'Πα'),
(6, 'ΣΑΒΒΑΤΟ', 'Σα'),
(7, 'ΚΥΡΙΑΚΗ', 'Κυ');

-- --------------------------------------------------------

--
-- Table structure for table `eventplannedcourses`
--

CREATE TABLE IF NOT EXISTS `eventplannedcourses` (
  `eventPlannedCourseID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventPlannedCourseAbbrev` varchar(72) NOT NULL,
  `schoolID_ofSchools` int(10) unsigned NOT NULL,
  `subjectID_ofSubjects` int(10) unsigned NOT NULL,
  `teachMethodID_ofTeachMethods` int(10) unsigned NOT NULL,
  `secretaryCode` int(11) DEFAULT NULL,
  `ECTS` int(11) DEFAULT NULL COMMENT 'διδακτικές πιστωτικές μονάδες που χρησιμοποιούνται για να καταμετρήσουν τα μαθήματα που έχει ολοκληρώσει ο φοιτητής',
  `otherDetails` varchar(45) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eventPlannedCourseID`,`schoolID_ofSchools`,`subjectID_ofSubjects`,`teachMethodID_ofTeachMethods`),
  UNIQUE KEY `eventPlannedCourseID_UNIQUE` (`eventPlannedCourseID`),
  KEY `schoolID_ofSchools_idx` (`schoolID_ofSchools`),
  KEY `subjectID_ofSubjects_idx` (`subjectID_ofSubjects`),
  KEY `teachMethodID_ofTeachMethods_idx` (`teachMethodID_ofTeachMethods`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10028 ;

--
-- Dumping data for table `eventplannedcourses`
--

INSERT INTO `eventplannedcourses` (`eventPlannedCourseID`, `eventPlannedCourseAbbrev`, `schoolID_ofSchools`, `subjectID_ofSubjects`, `teachMethodID_ofTeachMethods`, `secretaryCode`, `ECTS`, `otherDetails`, `update_time`) VALUES
(10001, 'Πολιτικ.Μηχαν. | ΑΣΚΗΣΗ ΠΡΑΞΗΣ | Μαθηματ.Ανάλυση 1  ', 11, 101, 12, 124, 2, NULL, '0000-00-00 00:00:00'),
(10015, 'Ηλεκτρ.Μηχαν. | ΕΡΓΑΣΤΗΡΙΟ |Μαθηματ.Ανάλ.1', 12, 101, 13, 432, 2, NULL, '0000-00-00 00:00:00'),
(10016, 'Πολιτικ.Μηχαν. | ΘΕΩΡΙΑ ΜΑΘΗΜ | Μαθηματ.Ανάλ.1', 11, 101, 11, 123, 4, NULL, '0000-00-00 00:00:00'),
(10017, 'Μηχαν.Πληροφορ. | ΕΡΓΑΣΤΗΡΙΟ | Μαθηματ.Ανάλ.1', 13, 101, 13, 123, 2, NULL, '0000-00-00 00:00:00'),
(10018, 'Μηχανικ.Πληροφ. | ΘΕΩΡΙΑ ΜΑΘΗΜ. | Μαθηματ.Ανάλ.2', 13, 102, 11, 234, 4, NULL, '0000-00-00 00:00:00'),
(10019, 'Μηχανικ.Πληροφ. | παράδοση μαθήματος | γενικ.θέμα', 13, 9, 9, 666, 2, NULL, '0000-00-00 00:00:00'),
(10020, 'Μηχανικ.Πληροφ. | ΑΣΚΗΣΗ ΠΡΑΞΗΣ | Μαθηματ.Ανάλ.1', 13, 101, 12, 244, 5, NULL, '0000-00-00 00:00:00'),
(10021, 'Ηλεκτρ.Μηχαν. | ΕΡΓΑΣΤΗΡΙΟ | Μαθηματ.Ανάλ.2', 12, 102, 13, 123, 4, NULL, '0000-00-00 00:00:00'),
(10022, 'Πολιτικ.Μηχαν. | ΘΕΩΡΙΑ_ΜΑΘΗΜ. | Μαθηματ.Ανάλ.2', 11, 102, 11, 234, 4, NULL, '0000-00-00 00:00:00'),
(10023, 'Μηχανικ.Πληροφ. | παράδοση μαθήματος | Μαθηματ.Ανάλ.1', 13, 101, 9, 9, 9, NULL, '0000-00-00 00:00:00'),
(10024, 'Μηχανικ.Πληροφ. | ΕΡΓΑΣΤΗΡΙΟ | Μαθηματ.Ανάλ.2', 13, 102, 13, 0, 0, NULL, '0000-00-00 00:00:00'),
(10025, 'Μηχανικ.Πληροφ. | παράδοση μαθήματος | Μαθηματ.Ανάλ.1', 13, 101, 9, 0, 0, NULL, '0000-00-00 00:00:00'),
(10026, 'Μηχανικ.Πληροφ. | παράδοση μαθήματος | Μαθηματ.Ανάλ.1', 13, 101, 9, 0, 0, NULL, '0000-00-00 00:00:00'),
(10027, 'Μηχανικ.Πληροφ. | παράδοση μαθήματος | γενικ.θέμα', 13, 9, 9, 9, 9, NULL, '2015-03-06 10:14:55');

-- --------------------------------------------------------

--
-- Table structure for table `eventplannedcourse_scarceresource_participantgroup_combis`
--

CREATE TABLE IF NOT EXISTS `eventplannedcourse_scarceresource_participantgroup_combis` (
  `eventPlaCourseScarceResouParticiGroupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventPlaCourseScarceResouParticiGroupAbbrev` varchar(144) NOT NULL,
  `eventPlannedCourseID` int(10) unsigned NOT NULL,
  `scarceResourceID` int(10) unsigned NOT NULL,
  `schoolStudentGroupProfessorID` int(10) unsigned NOT NULL,
  `assemblyRegister` int(11) DEFAULT NULL COMMENT 'εάν υπάρχει, η ανάθεση έχει εγκριθεί από Γ.Συνέλευση με αυτόν τον αριθμό μητρώου',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eventPlaCourseScarceResouParticiGroupID`,`eventPlannedCourseID`,`scarceResourceID`,`schoolStudentGroupProfessorID`),
  UNIQUE KEY `eventPlaCourseScarceResouParticiGroupID_UNIQUE` (`eventPlaCourseScarceResouParticiGroupID`),
  KEY `eventPlannedCourseID_idx` (`eventPlannedCourseID`),
  KEY `scarceResourceID_idx` (`scarceResourceID`),
  KEY `schoolStudentGroupProfessorID` (`schoolStudentGroupProfessorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Event time scheduling in a Location of a room of the TEI with the registered Participants in the event.' AUTO_INCREMENT=100000020 ;

--
-- Dumping data for table `eventplannedcourse_scarceresource_participantgroup_combis`
--

INSERT INTO `eventplannedcourse_scarceresource_participantgroup_combis` (`eventPlaCourseScarceResouParticiGroupID`, `eventPlaCourseScarceResouParticiGroupAbbrev`, `eventPlannedCourseID`, `scarceResourceID`, `schoolStudentGroupProfessorID`, `assemblyRegister`, `update_time`) VALUES
(100000005, 'Δε1100_ΛΑΡΙΣΑ_1159 Μαθηματ.Ανάλ.2_ΘΕΩΡΙΑ_ΜΑΘΗΜ. Μηχανικ.Πληροφ.Εξαμ.Γ/1ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10018, 100010, 1000006, NULL, '0000-00-00 00:00:00'),
(100000006, 'Δε1300_ΛΑΡΙΣΑ_1359 Μαθηματ.Ανάλ.1_ΑΣΚΗΣΗ_ΠΡΑΞΗΣ Μηχανικ.Πληροφ.Εξαμ.Γ/1ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10020, 100012, 1000006, NULL, '0000-00-00 00:00:00'),
(100000007, 'Δε0800_ΛΑΡΙΣΑ_0859 Μαθηματ.Ανάλ.1_ΘΕΩΡΙΑ_ΜΑΘΗΜ. Πολιτικ.Μηχαν.Εξαμ.Α/1ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10016, 100002, 1000001, NULL, '0000-00-00 00:00:00'),
(100000008, 'Τρ0800_ΛΑΡΙΣΑ_0859 Μαθηματ.Ανάλ.1_ΕΡΓΑΣΤΗΡΙΟ Ηλεκτρ.Μηχαν.Εξαμ.Β/1ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10015, 100019, 1000004, NULL, '0000-00-00 00:00:00'),
(100000009, 'Δε1100_ΛΑΡΙΣΑ_1159 Μαθηματ.Ανάλ.1_ΑΣΚΗΣΗ_ΠΡΑΞΗΣ Πολιτικ.Μηχαν.Εξαμ.Α/1ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10001, 100010, 1000001, NULL, '0000-00-00 00:00:00'),
(100000010, 'Τε0900_ΛΑΡΙΣΑ_0959 Μαθηματ.Ανάλ.2_ΘΕΩΡΙΑ_ΜΑΘΗΜ. Μηχανικ.Πληροφ.Εξαμ.Γ/2ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10018, 100032, 1000007, NULL, '0000-00-00 00:00:00'),
(100000011, 'Πε0800_ΛΑΡΙΣΑ_0859 Μαθηματ.Ανάλ.2_ΘΕΩΡΙΑ_ΜΑΘΗΜ. Μηχανικ.Πληροφ.Εξαμ.Γ/2ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10018, 100043, 1000007, NULL, '0000-00-00 00:00:00'),
(100000012, 'Δε1900_ΛΑΡΙΣΑ_1959 Μαθηματ.Ανάλ.1_ΘΕΩΡΙΑ_ΜΑΘΗΜ. Πολιτικ.Μηχαν.Εξαμ.Α/1ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10016, 100018, 1000001, NULL, '0000-00-00 00:00:00'),
(100000013, 'Τρ1600_ΛΑΡΙΣΑ_1659 Μαθηματ.Ανάλ.1_ΑΣΚΗΣΗ_ΠΡΑΞΗΣ Πολιτικ.Μηχαν.Εξαμ.Α/1ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10001, 100027, 1000001, NULL, '0000-00-00 00:00:00'),
(100000014, 'Πε0800_ΛΑΡΙΣΑ_0859 Μαθηματ.Ανάλ.1_ΕΡΓΑΣΤΗΡΙΟ Ηλεκτρ.Μηχαν.Εξαμ.Β/2ομάδ.φοιτ. Παπαδοπ.Χ.Δημητ.', 10015, 100043, 1000008, NULL, '0000-00-00 00:00:00'),
(100000015, 'Τρ0800_ΛΑΡΙΣΑ_0859 Μαθηματ.Ανάλ.2_ΕΡΓΑΣΤΗΡΙΟ Ηλεκτρ.Μηχαν.Εξαμ.Β/2ομάδ.φοιτ. Ελευθ.Απ.Κωνστ.', 10021, 100019, 1000015, NULL, '0000-00-00 00:00:00'),
(100000016, 'Τρ0900_ΛΑΡΙΣΑ_0959 Μαθηματ.Ανάλ.1_ΕΡΓΑΣΤΗΡΙΟ Ηλεκτρ.Μηχαν.Εξαμ.Β/1ομάδ.φοιτ. Ελευθ.Απ.Κωνστ.', 10015, 100020, 1000014, NULL, '0000-00-00 00:00:00'),
(100000017, 'Τε0900_ΛΑΡΙΣΑ_0959 Μαθηματ.Ανάλ.1_ΘΕΩΡΙΑ_ΜΑΘΗΜ. Πολιτικ.Μηχαν.Εξαμ.Α/3ομάδ.φοιτ. Καραπιπ.Β.Νικολ.', 10022, 100032, 1000011, NULL, '0000-00-00 00:00:00'),
(100000018, 'Τρ1100_ΛΑΡΙΣΑ_1159 Μαθηματ.Ανάλ.1_ΑΣΚΗΣΗ_ΠΡΑΞΗΣ Πολιτικ.Μηχαν.Εξαμ.Α/2ομάδ.φοιτ. Καραπιπ.Β.Νικολ.', 10001, 100022, 1000012, NULL, '0000-00-00 00:00:00'),
(100000019, 'Πε1000_ΛΑΡΙΣΑ_1059 γενικ.θέμα_παράδοση μαθήματος Μηχανικ.Πληροφ.Εξαμ.Δ/2ομάδ.φοιτ. Ελευθ.Απ.Κωνστ.', 10027, 100045, 1000018, NULL, '2015-03-06 10:33:31');

-- --------------------------------------------------------

--
-- Table structure for table `eventtypes`
--

CREATE TABLE IF NOT EXISTS `eventtypes` (
  `eventTypeID` int(10) unsigned NOT NULL,
  `eventTypeName` varchar(45) NOT NULL,
  `totalDurationMinut` decimal(4,0) NOT NULL,
  PRIMARY KEY (`eventTypeID`),
  UNIQUE KEY `eventTypeID_idx` (`eventTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `eventtypes`
--

INSERT INTO `eventtypes` (`eventTypeID`, `eventTypeName`, `totalDurationMinut`) VALUES
(11, 'ΔΙΔΑΣΚΑΛΙΑ', '59');

-- --------------------------------------------------------

--
-- Table structure for table `institutiondepartments`
--

CREATE TABLE IF NOT EXISTS `institutiondepartments` (
  `ιnstituDepartID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instituDepartTitle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ιnstituDepartID`),
  UNIQUE KEY `ιnstituDepartID_UNIQUE` (`ιnstituDepartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Institution departments are every functional part of the organization, as the secretary, the technical support team. ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jobtitles`
--

CREATE TABLE IF NOT EXISTS `jobtitles` (
  `jobTitleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jobTitleName` varchar(45) NOT NULL,
  `jobStatusBonus` int(11) NOT NULL,
  PRIMARY KEY (`jobTitleID`),
  UNIQUE KEY `jobTitleID_UNIQUE` (`jobTitleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jobtitles`
--

INSERT INTO `jobtitles` (`jobTitleID`, `jobTitleName`, `jobStatusBonus`) VALUES
(1, 'ΕΡΓΑΖΟΜΕΝΟΣ ΤΕΧΝ. ΙΔΡΥΜΑΤΟΣ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE IF NOT EXISTS `levels` (
  `levelID` int(11) NOT NULL,
  `levelTitle` set('ΜΕΤΑΠΤΥΧΙΑΚΟ','ΠΡΟΠΤΥΧΙΑΚΟ','ΕΞΑΜΗΝΟΥ Α ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Β ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Γ ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Δ ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Ε ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ ΣΤ ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Ζ ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Η ΜΑΘΗΜΑ') DEFAULT 'ΠΡΟΠΤΥΧΙΑΚΟ' COMMENT 'Levels is the field showing the level in the time period of degree.',
  PRIMARY KEY (`levelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`levelID`, `levelTitle`) VALUES
(8, 'ΜΕΤΑΠΤΥΧΙΑΚΟ'),
(9, 'ΠΡΟΠΤΥΧΙΑΚΟ'),
(11, 'ΕΞΑΜΗΝΟΥ Α ΜΑΘΗΜΑ'),
(12, 'ΕΞΑΜΗΝΟΥ Β ΜΑΘΗΜΑ'),
(13, 'ΕΞΑΜΗΝΟΥ Γ ΜΑΘΗΜΑ'),
(14, 'ΕΞΑΜΗΝΟΥ Δ ΜΑΘΗΜΑ'),
(15, 'ΕΞΑΜΗΝΟΥ Ε ΜΑΘΗΜΑ'),
(16, 'ΕΞΑΜΗΝΟΥ ΣΤ ΜΑΘΗΜΑ'),
(17, 'ΕΞΑΜΗΝΟΥ Ζ ΜΑΘΗΜΑ'),
(18, 'ΕΞΑΜΗΝΟΥ Η ΜΑΘΗΜΑ');

-- --------------------------------------------------------

--
-- Table structure for table `locationaddresses`
--

CREATE TABLE IF NOT EXISTS `locationaddresses` (
  `locationAddressID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locatAddreConcat` varchar(64) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `zipPostCode` int(11) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `otherDetails` varchar(45) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`locationAddressID`),
  UNIQUE KEY `locationAddressID` (`locationAddressID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Location in terms of place of the event with Address of it.' AUTO_INCREMENT=1004 ;

--
-- Dumping data for table `locationaddresses`
--

INSERT INTO `locationaddresses` (`locationAddressID`, `locatAddreConcat`, `city`, `area`, `address`, `zipPostCode`, `province`, `country`, `otherDetails`, `update_time`) VALUES
(9, 'έδρα εκπαιδ. ιδρύματος | περιοχή έδρας εκπ. ιδρύμ. | 99999', 'έδρα εκπαιδ. ιδρύματος', 'περιοχή έδρας εκπ. ιδρύμ.', 'διεύθηνση τεχνολ. εκπαιδευτ. ιδρύματος', 99999, '', '', '', '0000-00-00 00:00:00'),
(1001, 'ΛΑΡΙΣΑ | Άγιος Θωμάς | Περιφεριακός Λάρισας - Τρικάλων | 41110', 'ΛΑΡΙΣΑ', 'Άγιος Θωμάς', 'Περιφεριακός Λάρισας - Τρικάλων', 41110, 'Θεσσαλία', 'Ελλάδα', 'Έδρα του Τ.ΕΙ. και βασικές εγκαταστάσεις', '0000-00-00 00:00:00'),
(1002, 'ΤΡΙΚΑΛΑ | περιοχή Τρικάλων | Αργοναυτών 1Γ | 42100', 'ΤΡΙΚΑΛΑ', 'περιοχή Τρικάλων', 'Αργοναυτών 1Γ', 42100, 'Θεσσαλία', 'Ελλάδα', 'Περιφερειακό υποκατάστημα Τ.Ε.Ι. Λάρισας', '0000-00-00 00:00:00'),
(1003, 'ΚΑΡΔΙΤΣΑ | περιοχή Καρδίτσας | Τέρμα Ν. Τεμπονέρα | 43100', 'ΚΑΡΔΙΤΣΑ', 'περιοχή Καρδίτσας', 'Τέρμα Ν. Τεμπονέρα', 43100, 'Θεσσαλία', 'Ελλάδα', 'Περιφερειακό υποκατάστημα Τ.Ε.Ι. Λάρισας', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE IF NOT EXISTS `months` (
  `monthID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `academicPeriodID` int(10) unsigned NOT NULL,
  `academicYearID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`monthID`,`academicPeriodID`,`academicYearID`),
  UNIQUE KEY `monthID_idx` (`monthID`),
  KEY `academPeriodID_academYearID_idx` (`academicPeriodID`,`academicYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE IF NOT EXISTS `professors` (
  `professorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `professorFullName` varchar(72) NOT NULL,
  `professorLastName` varchar(45) NOT NULL,
  `professorMiddleName` varchar(45) DEFAULT NULL,
  `professorFirstName` varchar(45) NOT NULL,
  `professorShortName` varchar(18) NOT NULL,
  `identityCardCode` varchar(11) DEFAULT NULL,
  `nationalTaxNum` mediumint(9) DEFAULT NULL,
  `phoneNumber` varchar(45) NOT NULL,
  `emailAddress` varchar(45) NOT NULL,
  `locationAddressID_ofLocationAddresses` int(10) unsigned NOT NULL,
  `professorTitleID_ofProfessorTitles` int(10) unsigned NOT NULL,
  `otherDetails` varchar(45) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`professorID`),
  UNIQUE KEY `professorID` (`professorID`),
  KEY `locationAddressID_ofLocationAddresses_idx` (`locationAddressID_ofLocationAddresses`),
  KEY `professorTitleID_ofProfessorTitles_idx` (`professorTitleID_ofProfessorTitles`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available professors (Roster) as the staff of institution to be assigned lessons.' AUTO_INCREMENT=10004 ;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`professorID`, `professorFullName`, `professorLastName`, `professorMiddleName`, `professorFirstName`, `professorShortName`, `identityCardCode`, `nationalTaxNum`, `phoneNumber`, `emailAddress`, `locationAddressID_ofLocationAddresses`, `professorTitleID_ofProfessorTitles`, `otherDetails`, `update_time`) VALUES
(10001, 'ΠΑΠΑΔΟΠΟΥΛΟΣ ΧΑΡΑΛΑΜΠΟΥ ΔΗΜΗΤΡΙΟΣ', 'ΠΑΠΑΔΟΠΟΥΛΟΣ', 'ΧΑΡΑΛΑΜΠΟΣ', 'ΔΗΜΗΤΡΙΟΣ', 'Παπαδοπ.Χ.Δημητ.', NULL, NULL, '1234567890', 'asdsadasd@sdfsdfsdf.gfdg', 1001, 35, NULL, '0000-00-00 00:00:00'),
(10002, 'ΕΛΕΥΘΕΡΟΠΟΥΛΟΣ ΑΠΟΣΤΟΛΟΥ ΚΩΝΣΤΑΝΤΙΝΟΣ', 'ΕΛΕΥΘΕΡΟΠΟΥΛΟΣ', 'ΑΠΟΣΤΟΛΟΥ', 'ΚΩΝΣΤΑΝΤΙΝΟΣ', 'Ελευθ.Απ.Κωνστ.', 'ΗΗ 121212', 8388607, '2422 123456', 'name@jgjgjgjgj.end', 9, 13, 'οχι άλλα ατομικά στοιχεία', '0000-00-00 00:00:00'),
(10003, 'ΚΑΡΑΠΙΠΕΤΡΟΣ ΒΑΣΙΛΕΙΟΥ ΝΙΚΟΛΑΟΣ', 'ΚΑΡΑΠΙΠΕΤΡΟΣ', 'ΒΑΣΙΛΕΙΟΥ', 'ΝΙΚΟΛΑΟΣ', 'Καραπιπ.Β.Νικολ.', 'ΗΗ 789987', 8388607, '2424 654321', 'name@main.end', 9, 15, 'κι άλλα ατομικά στοιχεία', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `professortitles`
--

CREATE TABLE IF NOT EXISTS `professortitles` (
  `professorTitleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titleName` varchar(45) DEFAULT NULL,
  `weekTeachHours` int(11) DEFAULT NULL,
  `isStanding` set('ΝΑΙ','ΟΧΙ') NOT NULL DEFAULT 'ΟΧΙ' COMMENT 'is standing this title of professor? gives the permanent of the title or not',
  `otherDetails` varchar(45) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`professorTitleID`),
  UNIQUE KEY `professorTitleID_UNIQUE` (`professorTitleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Institution Academic Titles of the Professors:  Ακαδιμαϊκοί τίτλοι του Τ.Ε.Ι. στους μόνιμους εκπαιδευτικούς αλλά και στους έκτακτους εκπαιδευτικούς.' AUTO_INCREMENT=38 ;

--
-- Dumping data for table `professortitles`
--

INSERT INTO `professortitles` (`professorTitleID`, `titleName`, `weekTeachHours`, `isStanding`, `otherDetails`, `update_time`) VALUES
(11, 'ΚΑΘΗΓΗΤΗΣ', 10, 'ΝΑΙ', 'Γενικός τίτλος μόνιμου εκπαιδευτικού προσωπικ', '0000-00-00 00:00:00'),
(12, 'ΑΝΑΠΛΗΡΩΤΗΣ ΚΑΘΗΓΗΤΗΣ', 12, 'ΝΑΙ', 'Τίτλος μόνιμου εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00'),
(13, 'ΕΠΙΚΟΥΡΟΣ ΚΑΘΗΓΗΤΗΣ', 14, 'ΝΑΙ', 'Τίτλος μόνιμου εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00'),
(14, 'ΚΑΘΗΓΗΤΗΣ ΕΦΑΡΜΟΓΩΝ', 16, 'ΝΑΙ', 'Τίτλος μόνιμου εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00'),
(15, 'ΕΙΔΙΚΟ ΕΚΠΑΙΔΕΥΤΙΚΟ ΠΡΟΣΩΠΙΚΟ', 99, 'ΝΑΙ', 'Τίτλος μέλους (ΕΕΠ)', '0000-00-00 00:00:00'),
(16, 'ΕΡΓΑΣΤΗΡΙΑΚΟ ΔΙΔΑΚΤΙΚΟ ΠΡΟΣΩΠΙΚΟ', 99, 'ΝΑΙ', 'Τίτλος μέλους (ΕΡΔΙΠ)', '0000-00-00 00:00:00'),
(17, 'ΕΙΔΙΚΟ ΤΕΧΝΙΚΟ ΕΡΓΑΣΤΗΡΙΑΚΟ ΠΡΟΣΩΠΙΚΟ', 99, 'ΝΑΙ', 'Τίτλος μέλους (ΕΤΕΠ) ', '0000-00-00 00:00:00'),
(18, 'ΕΙΔΙΚΟ ΤΕΧΝΙΚΟ ΠΡΟΣΩΠΙΚΟ', 20, 'ΝΑΙ', 'Τίτλος μέλους (ΕΤΠ) ', '0000-00-00 00:00:00'),
(31, 'ΕΝΤΕΤΑΛΜΕΝΟΣ ΔΙΔΑΣΚΑΛΙΑΣ', 99, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00'),
(32, 'ΠΑΝΕΠΙΣΤΗΜΙΑΚΟΣ ΥΠΟΤΡΟΦΟΣ', 18, 'ΟΧΙ', 'Τίτλος εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00'),
(33, 'ΕΠΙΣΤΗΜΟΝΙΚΟΣ ΣΥΝΕΡΓΑΤΗΣ ΜΕ ΠΛΗΡΗ ΠΡΟΣΟΝΤΑ', 14, 'ΟΧΙ', 'Τίτλος εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00'),
(34, 'ΕΠΙΣΤΗΜΟΝΙΚΟΣ ΣΥΝΕΡΓΑΤΗΣ ΜΕ ΕΛΛΙΠΗ ΠΡΟΣΟΝΤΑ', 14, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00'),
(35, 'ΕΡΓΑΣΤΗΡΙΑΚΟΣ ΣΥΝΕΡΓΑΤΗΣ ΜΕ ΠΛΗΡΗ ΠΡΟΣΟΝΤΑ', 16, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00'),
(36, 'ΕΡΓΑΣΤΗΡΙΑΚΟΣ ΣΥΝΕΡΓΑΤΗΣ ΜΕ ΕΛΛΙΠΗ ΠΡΟΣΟΝΤΑ', 16, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00'),
(37, 'ΥΠΟΤΡΟΦΟΣ ΕΠΙΤΡΟΠΗΣ ΕΡΕΥΝΩΝ', 99, 'ΟΧΙ', 'Τίτλος έκτακτου εκπαιδευτικού προσωπικού', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roomtypes`
--

CREATE TABLE IF NOT EXISTS `roomtypes` (
  `roomTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roomTitle` varchar(45) DEFAULT NULL COMMENT 'the title or the code of the room',
  `roomCapacity` int(11) DEFAULT NULL COMMENT 'room capacity in sheets of students that can be get in for lesson',
  `roomEquipment` varchar(45) DEFAULT NULL,
  `otherDetails` varchar(45) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`roomTypeID`),
  UNIQUE KEY `roomTypeID_UNIQUE` (`roomTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Room types for different Educational activities:  Τα διάφορα είδη αιθουσών του εκπαιδευτικού ιδρύματος, για διδασκαλία των μαθημάτων των σχολών και εκδηλώσεις.' AUTO_INCREMENT=23 ;

--
-- Dumping data for table `roomtypes`
--

INSERT INTO `roomtypes` (`roomTypeID`, `roomTitle`, `roomCapacity`, `roomEquipment`, `otherDetails`, `update_time`) VALUES
(9, 'γενικός τύπος αίθουσας', 999, 'βασικός εξοπλισμός', NULL, '0000-00-00 00:00:00'),
(11, 'ΑΜΦΙΘΕΑΤΡΟ', 100, 'Προβολή φιλμ', 'Αίθουσα διδασκαλίας, αμφιθεατρικής κατασκευής', '0000-00-00 00:00:00'),
(12, 'ΑΜΦΙΘΕΑΤΡΟ ΕΚΔΗΛΩΣΕΩΝ', 300, 'Βίντεο παρουσίαση', 'Μεγάλη αίθουσα για εκδηλώσεις του Ιδρύματος', '0000-00-00 00:00:00'),
(21, 'ΕΡΓΑΣΤΗΡΙΟ ΠΛΗΡΟΦΟΡΙΚΗΣ', 45, 'Δίκτυο υπολογιστών', 'Αίθουσα διδασκαλίας μαθημάτων Πληροφορικής', '0000-00-00 00:00:00'),
(22, 'ΑΙΘΟΥΣΑ ΠΟΛΛΑΠΛΩΝ ΧΡΗΣΕΩΝ', 35, 'Βασικός', 'Γενικός τύπος Αίθουσας διδασκαλίας', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `scarceresources`
--

CREATE TABLE IF NOT EXISTS `scarceresources` (
  `scarceResourceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scarceResourceAbbrev` varchar(72) NOT NULL,
  `locationAddressID_byLocationAddresses` int(10) unsigned NOT NULL,
  `buildingFloorRoomID_byBuildingFloorRooms` int(10) unsigned NOT NULL,
  `timeSlotID_byTimeSlots` int(10) unsigned NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`scarceResourceID`,`locationAddressID_byLocationAddresses`,`buildingFloorRoomID_byBuildingFloorRooms`,`timeSlotID_byTimeSlots`),
  UNIQUE KEY `scarceResourcesID_UNIQUE` (`scarceResourceID`),
  KEY `locationAddressID_byLocationAddresses_idx` (`locationAddressID_byLocationAddresses`),
  KEY `buildingFloorRoomID_byBuildingFloorRooms_idx` (`buildingFloorRoomID_byBuildingFloorRooms`),
  KEY `timeSlotID_byTimeSlots_idx` (`timeSlotID_byTimeSlots`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100067 ;

--
-- Dumping data for table `scarceresources`
--

INSERT INTO `scarceresources` (`scarceResourceID`, `scarceResourceAbbrev`, `locationAddressID_byLocationAddresses`, `buildingFloorRoomID_byBuildingFloorRooms`, `timeSlotID_byTimeSlots`, `update_time`) VALUES
(100002, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε0800 | 0859', 1001, 9, 11, '0000-00-00 00:00:00'),
(100008, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε0900 | 0959', 1001, 9, 12, '0000-00-00 00:00:00'),
(100009, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1000 | 1059', 1001, 9, 13, '0000-00-00 00:00:00'),
(100010, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1100 | 1159', 1001, 9, 14, '0000-00-00 00:00:00'),
(100011, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1200 | 1259', 1001, 9, 15, '0000-00-00 00:00:00'),
(100012, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1300 | 1359', 1001, 9, 16, '0000-00-00 00:00:00'),
(100013, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1400 | 1459', 1001, 9, 17, '0000-00-00 00:00:00'),
(100014, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1500 | 1559', 1001, 9, 18, '0000-00-00 00:00:00'),
(100015, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1600 | 1659', 1001, 9, 19, '0000-00-00 00:00:00'),
(100016, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1700 | 1759', 1001, 9, 20, '0000-00-00 00:00:00'),
(100017, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1800 | 1859', 1001, 9, 21, '0000-00-00 00:00:00'),
(100018, 'ΛΑΡΙΣΑ | γενική αίθουσα | Δε1900 | 1959', 1001, 9, 22, '0000-00-00 00:00:00'),
(100019, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ0800 | 0859', 1001, 9, 23, '0000-00-00 00:00:00'),
(100020, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ0900 | 0959', 1001, 9, 24, '0000-00-00 00:00:00'),
(100021, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1000 | 1059', 1001, 9, 25, '0000-00-00 00:00:00'),
(100022, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1100 | 1159', 1001, 9, 26, '0000-00-00 00:00:00'),
(100023, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1200 | 1259', 1001, 9, 27, '0000-00-00 00:00:00'),
(100024, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1300 | 1359', 1001, 9, 28, '0000-00-00 00:00:00'),
(100025, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1400 | 1459', 1001, 9, 29, '0000-00-00 00:00:00'),
(100026, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1500 | 1559', 1001, 9, 30, '0000-00-00 00:00:00'),
(100027, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1600 | 1659', 1001, 9, 31, '0000-00-00 00:00:00'),
(100028, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1700 | 1759', 1001, 9, 32, '0000-00-00 00:00:00'),
(100029, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1800 | 1859', 1001, 9, 33, '0000-00-00 00:00:00'),
(100030, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τρ1900 | 1959', 1001, 9, 34, '0000-00-00 00:00:00'),
(100031, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε0800 | 0859', 1001, 9, 35, '0000-00-00 00:00:00'),
(100032, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε0900 | 0959', 1001, 9, 36, '0000-00-00 00:00:00'),
(100033, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1000 | 1059', 1001, 9, 37, '0000-00-00 00:00:00'),
(100034, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1100 | 1159', 1001, 9, 38, '0000-00-00 00:00:00'),
(100035, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1200 | 1259', 1001, 9, 39, '0000-00-00 00:00:00'),
(100036, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1300 | 1359', 1001, 9, 40, '0000-00-00 00:00:00'),
(100037, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1400 | 1459', 1001, 9, 41, '0000-00-00 00:00:00'),
(100038, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1500 | 1559', 1001, 9, 42, '0000-00-00 00:00:00'),
(100039, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1600 | 1659', 1001, 9, 43, '0000-00-00 00:00:00'),
(100040, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1700 | 1759', 1001, 9, 44, '0000-00-00 00:00:00'),
(100041, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1800 | 1859', 1001, 9, 45, '0000-00-00 00:00:00'),
(100042, 'ΛΑΡΙΣΑ | γενική αίθουσα | Τε1900 | 1959', 1001, 9, 46, '0000-00-00 00:00:00'),
(100043, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε0800 | 0859', 1001, 9, 47, '0000-00-00 00:00:00'),
(100044, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε0900 | 0959', 1001, 9, 48, '0000-00-00 00:00:00'),
(100045, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1000 | 1059', 1001, 9, 49, '0000-00-00 00:00:00'),
(100046, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1100 | 1159', 1001, 9, 50, '0000-00-00 00:00:00'),
(100047, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1200 | 1259', 1001, 9, 51, '0000-00-00 00:00:00'),
(100048, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1300 | 1359', 1001, 9, 52, '0000-00-00 00:00:00'),
(100049, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1400 | 1459', 1001, 9, 53, '0000-00-00 00:00:00'),
(100050, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1500 | 1559', 1001, 9, 54, '0000-00-00 00:00:00'),
(100051, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1600 | 1659', 1001, 9, 55, '0000-00-00 00:00:00'),
(100052, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1700 | 1759', 1001, 9, 56, '0000-00-00 00:00:00'),
(100053, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1800 | 1859', 1001, 9, 57, '0000-00-00 00:00:00'),
(100054, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πε1900 | 1959', 1001, 9, 58, '0000-00-00 00:00:00'),
(100055, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα0800 | 0859', 1001, 9, 59, '0000-00-00 00:00:00'),
(100056, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα0900 | 0959', 1001, 9, 60, '0000-00-00 00:00:00'),
(100057, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1000 | 1059', 1001, 9, 61, '0000-00-00 00:00:00'),
(100058, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1100 | 1159', 1001, 9, 62, '0000-00-00 00:00:00'),
(100059, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1200 | 1259', 1001, 9, 63, '0000-00-00 00:00:00'),
(100060, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1300 | 1359', 1001, 9, 64, '0000-00-00 00:00:00'),
(100061, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1400 | 1459', 1001, 9, 65, '0000-00-00 00:00:00'),
(100062, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1500 | 1559', 1001, 9, 66, '0000-00-00 00:00:00'),
(100063, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1600 | 1659', 1001, 9, 67, '0000-00-00 00:00:00'),
(100064, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1700 | 1759', 1001, 9, 68, '0000-00-00 00:00:00'),
(100065, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1800 | 1859', 1001, 9, 69, '0000-00-00 00:00:00'),
(100066, 'ΛΑΡΙΣΑ | γενική αίθουσα | Πα1900 | 1959', 1001, 9, 70, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE IF NOT EXISTS `schools` (
  `schoolID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schoolSectionName` varchar(45) NOT NULL,
  `schoolSectionAbbrev` varchar(25) NOT NULL,
  `locatAddressID_byLocationAddresses` int(10) unsigned NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`schoolID`),
  UNIQUE KEY `schoolID` (`schoolID`),
  KEY `locatAddressID_byLocationAddresses_idx` (`locatAddressID_byLocationAddresses`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Schools of the institution:  Σχολές με τα τμήματα που λειτουργούν στην σχολή και η διεύθηνση που εδρεύουν. Υπάρχει περίπτωση να υπάρχουν πρώην σχολές που σταμάτησαν να λειτουργούν πρόσφατα.' AUTO_INCREMENT=19 ;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`schoolID`, `schoolSectionName`, `schoolSectionAbbrev`, `locatAddressID_byLocationAddresses`, `update_time`) VALUES
(9, 'σχολή εκπαιδευτικού ιδρύματος', 'σχολ.εκπαιδ.ιδρύμ.', 9, '0000-00-00 00:00:00'),
(11, 'ΠΟΛΙΤΙΚΩΝ ΜΗΧΑΝΙΚΩΝ Τ.Ε. Τμήμα(ΣΤΕΦ)', 'Πολιτικ.Μηχαν.', 1002, '0000-00-00 00:00:00'),
(12, 'ΗΛΕΚΤΡΟΛΟΓΩΝ ΜΗΧΑΝΙΚΩΝ Τ.Ε. Τμήμα(ΣΤΕΦ)', 'Ηλεκτρ.Μηχαν.', 1001, '0000-00-00 00:00:00'),
(13, 'ΜΗΧΑΝΙΚΩΝ ΠΛΗΡΟΦΟΡΙΚΗΣ Τ.Ε. Τμήμα(ΣΤΕΦ)', 'Μηχανικ.Πληροφ.', 1001, '0000-00-00 00:00:00'),
(14, 'ΛΟΓΙΣΤΙΚΗΣ & ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΗΣ Τμήμα(ΣΔΟ)', 'Λογιστικ&Χρηματοοικονομ.', 1001, '2015-03-06 10:49:23'),
(15, 'ΜΗΧΑΝΙΚΗΣ ΒΙΟΣΥΣΤΗΜΑΤΩΝ Τμήμα(ΣΤΓΤΔ)', 'Μηχαν.Βιοσυστημάτων', 1001, '2015-03-06 10:58:38'),
(16, 'Ιατρικών Eργαστηρίων Τμήμα(ΣΕΥΠ)', 'Ιατρικ.Eργαστηρίων', 1001, '2015-03-06 11:00:36'),
(17, 'ΜΗΧΑΝΟΛΟΓΩΝ ΜΗΧΑΝΙΚΩΝ Τ.Ε. Τμήμα(ΣΤΕΦ)', 'Μηχανολόγ.Μηχανικ.Τ.Ε.', 1001, '2015-03-06 12:11:37'),
(18, 'ΔΑΣΟΠΟΝΙΑΣ ΚΑΙ ΔΙΑΧΕΙΡΙΣΗΣ ΦΥΣΙΚΟΥ ΠΕΡΙΒΑΛ.', 'Δασοπ.&Διαχ.Φυσ.Περιβάλ.', 1002, '2015-03-06 12:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `schoolstudentgroup_professor_links`
--

CREATE TABLE IF NOT EXISTS `schoolstudentgroup_professor_links` (
  `schoolStudentGroupProfessorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schoolStudGroupProfesAbbrev` varchar(72) NOT NULL,
  `schoolID_bySchools` int(10) unsigned NOT NULL,
  `studentGroupID_byStudentGroups` int(10) unsigned NOT NULL,
  `professorID_byProfessors` int(10) unsigned NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`schoolStudentGroupProfessorID`,`schoolID_bySchools`,`studentGroupID_byStudentGroups`,`professorID_byProfessors`),
  UNIQUE KEY `SchoolStudentGroupProfessorID_UNIQUE` (`schoolStudentGroupProfessorID`),
  KEY `professorID_byProfessors_idx` (`professorID_byProfessors`),
  KEY `schoolID_bySchools_idx` (`schoolID_bySchools`),
  KEY `studentGroupID_byStudentGroups_idx` (`studentGroupID_byStudentGroups`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000019 ;

--
-- Dumping data for table `schoolstudentgroup_professor_links`
--

INSERT INTO `schoolstudentgroup_professor_links` (`schoolStudentGroupProfessorID`, `schoolStudGroupProfesAbbrev`, `schoolID_bySchools`, `studentGroupID_byStudentGroups`, `professorID_byProfessors`, `update_time`) VALUES
(1000001, 'Πολιτικ.Μηχαν. | Εξαμ.Α/1ομάδ.φοιτ. | Παπαδοπ.Χ.Δημητ.', 11, 11, 10001, '0000-00-00 00:00:00'),
(1000004, 'Ηλεκτρ.Μηχαν. | Εξαμ.Β/1ομάδ.φοιτ. | Παπαδοπ.Χ.Δημητ.', 12, 21, 10001, '0000-00-00 00:00:00'),
(1000005, 'Ηλεκτρ.Μηχαν. | Εξαμ.Α/2ομάδ.φοιτ. | Παπαδοπ.Χ.Δημητ. | ', 12, 12, 10001, '0000-00-00 00:00:00'),
(1000006, 'Μηχανικ.Πληροφ. | Εξαμ.Γ/1ομάδ.φοιτ. | Παπαδοπ.Χ.Δημητ.', 13, 31, 10001, '0000-00-00 00:00:00'),
(1000007, 'Μηχανικ.Πληροφ. | Εξαμ.Γ/2ομάδ.φοιτ. | Παπαδοπ.Χ.Δημητ.', 13, 32, 10001, '0000-00-00 00:00:00'),
(1000008, 'Ηλεκτρ.Μηχαν. | Εξαμ.Β/2ομάδ.φοιτ. | Παπαδοπ.Χ.Δημητ.', 12, 22, 10001, '0000-00-00 00:00:00'),
(1000009, 'Ηλεκτρ.Μηχαν. | Εξαμ.Α/1ομάδ.φοιτ. | Ελευθ.Απ.Κωνστ.', 12, 11, 10002, '0000-00-00 00:00:00'),
(1000010, 'Ηλεκτρ.Μηχαν. | Εξαμ.ΣΤ/1ομάδ.φοιτ. | Ελευθ.Απ.Κωνστ.', 12, 61, 10002, '0000-00-00 00:00:00'),
(1000011, 'Πολιτικ.Μηχαν. | Εξαμ.Α/1ομάδ.φοιτ. | Καραπιπ.Β.Νικολ.', 11, 11, 10003, '0000-00-00 00:00:00'),
(1000012, 'Πολιτικ.Μηχαν. | Εξαμ.Α/2ομάδ.φοιτ. | Καραπιπ.Β.Νικολ.', 11, 12, 10003, '0000-00-00 00:00:00'),
(1000013, 'Πολιτικ.Μηχαν. | Εξαμ.Α/3ομάδ.φοιτ. | Καραπιπ.Β.Νικολ.', 11, 13, 10003, '0000-00-00 00:00:00'),
(1000014, 'Ηλεκτρ.Μηχαν. | Εξαμ.Β/1ομάδ.φοιτ. | Ελευθ.Απ.Κωνστ.', 12, 21, 10002, '0000-00-00 00:00:00'),
(1000015, 'Ηλεκτρ.Μηχαν. | Εξαμ.Β/2ομάδ.φοιτ. | Ελευθ.Απ.Κωνστ.', 12, 22, 10002, '0000-00-00 00:00:00'),
(1000016, 'Μηχανικ.Πληροφ. | Εξαμ.Γ/1ομάδ.φοιτ. | Καραπιπ.Β.Νικολ.', 13, 31, 10003, '0000-00-00 00:00:00'),
(1000017, 'Μηχανικ.Πληροφ. | Εξαμ.Δ/1ομάδ.φοιτ. | Ελευθ.Απ.Κωνστ.', 13, 41, 10002, '2015-03-06 10:21:20'),
(1000018, 'Μηχανικ.Πληροφ. | Εξαμ.Δ/2ομάδ.φοιτ. | Ελευθ.Απ.Κωνστ.', 13, 42, 10002, '2015-03-06 10:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `studentgroups`
--

CREATE TABLE IF NOT EXISTS `studentgroups` (
  `studentGroupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `studentGroupName` varchar(60) DEFAULT NULL COMMENT 'Student group name is the Title of the student group. The syntax of this  field  is like: ΕΞΑΜΗΝΟΥ ΖΖ ΟΜ',
  `studentGroupAbbrev` varchar(45) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`studentGroupID`),
  UNIQUE KEY `studentGroupID` (`studentGroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Student groups have the group of stutents in semester categorization. Student groups  table  could be connected with the Student table, in a seperate  database.' AUTO_INCREMENT=82 ;

--
-- Dumping data for table `studentgroups`
--

INSERT INTO `studentgroups` (`studentGroupID`, `studentGroupName`, `studentGroupAbbrev`, `update_time`) VALUES
(9, 'γενική ομάδα φοιτητών όλων των επιπέδων', 'γεν.ομάδαΦοιτητών', '0000-00-00 00:00:00'),
(11, 'Εξαμήνου Α ομάδα 1 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Α/1ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(12, 'Εξαμήνου Α ομάδα 2 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Α/2ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(13, 'Εξαμήνου Α ομάδα 3 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Α/3ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(14, 'Εξαμήνου Α ομάδα 4 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Α/4ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(15, 'Εξαμήνου Α ομάδα 5 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Α/5ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(16, 'Εξαμήνου Α ομάδα 6 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Α/6ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(17, 'Εξαμήνου Α ομάδα 7 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Α/7ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(18, 'Εξαμήνου Α ομάδα 8 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Α/8ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(19, 'Εξαμήνου Α ομάδα 9 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Α/9ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(21, 'Εξαμήνου Β ομάδα 1 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Β/1ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(22, 'Εξαμήνου Β ομάδα 2 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Β/2ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(23, 'Εξαμήνου Β ομάδα 3 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Β/3ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(24, 'Εξαμήνου Β ομάδα 4 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Β/4ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(25, 'Εξαμήνου Β ομάδα 5 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Β/5ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(26, 'Εξαμήνου Β ομάδα 6 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Β/6ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(27, 'Εξαμήνου Β ομάδα 7 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Β/7ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(28, 'Εξαμήνου Β ομάδα 8 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Β/8ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(29, 'Εξαμήνου Β ομάδα 9 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Β/9ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(31, 'Εξαμήνου Γ ομάδα 1 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Γ/1ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(32, 'Εξαμήνου Γ ομάδα 2 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Γ/2ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(33, 'Εξαμήνου Γ ομάδα 3 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Γ/3ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(34, 'Εξαμήνου Γ ομάδα 4 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Γ/4ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(35, 'Εξαμήνου Γ ομάδα 5 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Γ/5ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(36, 'Εξαμήνου Γ ομάδα 6 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Γ/6ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(37, 'Εξαμήνου Γ ομάδα 7 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Γ/7ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(38, 'Εξαμήνου Γ ομάδα 8 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Γ/8ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(39, 'Εξαμήνου Γ ομάδα 9 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Γ/9ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(41, 'Εξαμήνου Δ ομάδα 1 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Δ/1ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(42, 'Εξαμήνου Δ ομάδα 2 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Δ/2ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(43, 'Εξαμήνου Δ ομάδα 3 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Δ/3ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(44, 'Εξαμήνου Δ ομάδα 4 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Δ/4ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(45, 'Εξαμήνου Δ ομάδα 5 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Δ/5ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(46, 'Εξαμήνου Δ ομάδα 6 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Δ/6ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(47, 'Εξαμήνου Δ ομάδα 7 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Δ/7ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(48, 'Εξαμήνου Δ ομάδα 8 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Δ/8ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(49, 'Εξαμήνου Δ ομάδα 9 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Δ/9ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(51, 'Εξαμήνου Ε ομάδα 1 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ε/1ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(52, 'Εξαμήνου Ε ομάδα 2 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ε/2ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(53, 'Εξαμήνου Ε ομάδα 3 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ε/3ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(54, 'Εξαμήνου Ε ομάδα 4 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ε/4ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(55, 'Εξαμήνου Ε ομάδα 5 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ε/5ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(56, 'Εξαμήνου Ε ομάδα 6 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ε/6ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(57, 'Εξαμήνου Ε ομάδα 7 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ε/7ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(58, 'Εξαμήνου Ε ομάδα 8 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ε/8ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(59, 'Εξαμήνου Ε ομάδα 9 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ε/9ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(61, 'Εξαμήνου ΣΤ ομάδα 1 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.ΣΤ/1ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(62, 'Εξαμήνου ΣΤ ομάδα 2 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.ΣΤ/2ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(63, 'Εξαμήνου ΣΤ ομάδα 3 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.ΣΤ/3ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(64, 'Εξαμήνου ΣΤ ομάδα 4 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.ΣΤ/4ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(65, 'Εξαμήνου ΣΤ ομάδα 5 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.ΣΤ/5ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(66, 'Εξαμήνου ΣΤ ομάδα 6 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.ΣΤ/6ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(67, 'Εξαμήνου ΣΤ ομάδα 7 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.ΣΤ/7ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(68, 'Εξαμήνου ΣΤ ομάδα 8 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.ΣΤ/8ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(69, 'Εξαμήνου ΣΤ ομάδα 9 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.ΣΤ/9ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(71, 'Εξαμήνου Ζ ομάδα 1 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ζ/1ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(72, 'Εξαμήνου Ζ ομάδα 2 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ζ/2ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(73, 'Εξαμήνου Ζ ομάδα 3 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ζ/3ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(74, 'Εξαμήνου Ζ ομάδα 4 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ζ/4ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(75, 'Εξαμήνου Ζ ομάδα 5 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ζ/5ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(76, 'Εξαμήνου Ζ ομάδα 6 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ζ/6ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(77, 'Εξαμήνου Ζ ομάδα 7 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ζ/7ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(78, 'Εξαμήνου Ζ ομάδα 8 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ζ/8ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(79, 'Εξαμήνου Ζ ομάδα 9 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Ζ/9ομάδ.φοιτ.', '0000-00-00 00:00:00'),
(81, 'Εξαμήνου Η ομάδα 1 φοιτητών & Περασμένων εξαμήνων', 'Εξαμ.Η/1ομάδ.φοιτ.', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `subjectID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(45) DEFAULT NULL,
  `subjectAbbrev` varchar(25) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  `weekTeach` int(11) DEFAULT NULL COMMENT 'εβδομαδιαίες ώρες διδασκαλίας',
  `otherDetails` varchar(60) DEFAULT NULL,
  `levelID` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subjectID`),
  UNIQUE KEY `subjectID_idx` (`subjectID`),
  KEY `levelID_idx` (`levelID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Subjects of lessons that involves the academic institution.' AUTO_INCREMENT=118 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subjectID`, `subjectName`, `subjectAbbrev`, `description`, `weekTeach`, `otherDetails`, `levelID`, `update_time`) VALUES
(9, 'γενικό θέμα ΤΕΙ διδασκαλίας', 'γενικ.θέμα', 'γενικό θέμα τεχνολογικής εκπαίδευσης', 0, NULL, 9, '0000-00-00 00:00:00'),
(101, 'ΜΑΘΗΜΑΤΙΚΗ ΑΝΑΛΥΣΗ 1', 'Μαθηματ.Ανάλ.1', 'Μαθηματική Ανάλυση αρχικό επίπεδο', 4, NULL, 11, '0000-00-00 00:00:00'),
(102, 'ΜΑΘΗΜΑΤΙΚΗ ΑΝΑΛΥΣΗ 2', 'Μαθηματ.Ανάλ.2', 'Μαθηματική Ανάλυση προχωρημένο επίπεδο', 4, NULL, 12, '0000-00-00 00:00:00'),
(103, 'Ηλεκτρομηχανικά Συστήματα Μετατροπής Ενέργεια', NULL, 'Θέμα διδασκαλίας ΤΕΙ μαθήματος Ηλεκτρομηχανικά Συστήμ.', 4, 'Τίτλος εκπαιδευτικού μαθήματος Ηλεκτρομηχανικά Συστήματα Μετ', 16, '2015-03-06 12:04:41'),
(104, 'Εφαρμοσμένη Θερμοδυναμική', NULL, 'Θέμα διδασκαλίας Εφαρμοσμένη Θερμοδυναμική', 5, 'Τίτλος εκπαιδευτικού μαθήματος Εφαρμοσμένη Θερμοδυναμική', 13, '2015-03-06 12:08:06'),
(105, 'Τεχνολογία Δομικών Υλικών', NULL, 'Θέμα διδασκαλίας Τεχνολογία Δομικών Υλικών', 8, 'Τίτλος εκπαιδευτικού μαθήματος Τεχνολογία Δομικών Υλικών', 12, '2015-03-06 12:22:04'),
(106, 'Γεωτεχνική Μηχανική στις Κατασκευές - Εδαφομ.', NULL, 'Θέμα διδασκαλίας Γεωτεχνική Μηχανική στις Κατασκευές - Εδαφ.', 5, 'Τίτλος εκπαιδευτικού μαθήματος Γεωτεχνική Μηχανική ...', 15, '2015-03-06 12:23:14'),
(107, 'ΤΕΧΝΟΛΟΓΙΑ ΚΟΙΝΩΝΙΑ ΚΑΙ ΠΕΡΙΒΑΛΛΟΝ', NULL, 'Θέμα διδασκαλίας ΤΕΧΝΟΛΟΓΙΑ ΚΟΙΝΩΝΙΑ ΚΑΙ ΠΕΡΙΒΑΛΛΟΝ', 4, 'Τίτλος εκπαιδευτικού μαθήματος ΤΕΧΝΟΛΟΓΙΑ ΚΟΙΝΩΝΙΑ ΚΑΙ ΠΕΡΙΒ', 13, '2015-03-06 12:26:53'),
(108, 'ΣΧΕΔΙΑΣΗ ΑΝΑΛΥΣΗ ΗΛΕΚΤΡΙΚΩΝ ΚΥΚΛΩΜΑΤΩΝ', NULL, 'Θέμα διδασκαλίας ΣΧΕΔΙΑΣΗ ΑΝΑΛΥΣΗ ΗΛΕΚΤΡΙΚΩΝ ΚΥΚΛΩΜΑΤΩΝ', 5, 'Τίτλος εκπαιδευτικού μαθήματος ΣΧΕΔΙΑΣΗ ΑΝΑΛΥΣΗ ΗΛΕΚΤΡΙΚΩΝ..', 15, '2015-03-06 12:28:14'),
(109, 'Ανάλυση & Σχεδίαση Πληροφοριακών Συστημάτων', NULL, 'Θέμα διδασκαλίας Ανάλυση & Σχεδίαση Πληροφοριακών Συστημάτων', 4, 'Τίτλος εκπαιδευτικού μαθήματος Ανάλυση & Σχεδίαση Πληροφορια', 12, '2015-03-06 12:31:38'),
(110, 'Ειδικά Θέματα Σχεδίασης Ψηφιακών Συστημάτων', NULL, 'Θέμα διδασκαλίας Ειδικά Θέματα Σχεδίασης Ψηφιακών Συστημάτων', 2, 'Τίτλος εκπαιδευτικού μαθήματος Ειδικά Θέματα Σχεδίασης Ψηφια', 16, '2015-03-06 12:38:53'),
(111, 'Τεχνολογία παραγωγής επίπλου Ι', NULL, 'Θέμα διδασκαλίας Τεχνολογία παραγωγής επίπλου Ι', 4, 'Τίτλος εκπαιδευτικού μαθήματος Τεχνολογία παραγωγής επίπλου ', 13, '2015-03-06 12:42:31'),
(112, 'Τεχνολογία παραγωγής επίπλου ΙΙ', NULL, 'Θέμα διδασκαλίας Τεχνολογία παραγωγής επίπλου ΙΙ', 6, 'Τίτλος εκπαιδευτικού μαθήματος Τεχνολογία παραγωγής επίπλου ', 14, '2015-03-06 12:44:20'),
(113, 'Τεχνολογία παραγωγής μεταλλικών στοιχείων επί', NULL, 'Θέμα διδασκαλίας Τεχνολογία παραγωγής μεταλλικών στοιχείων ε', 4, 'Τίτλος εκπαιδευτικού μαθήματος Τεχνολογία παραγωγής μεταλλικ', 15, '2015-03-06 12:45:26'),
(114, 'ΟΡΓΑΝΩΣΗ ΚΑΙ ΔΙΟΙΚΗΣΗ ΕΠΙΧΕΙΡΗΣΕΩΝ', NULL, 'Θέμα διδασκαλίας ΟΡΓΑΝΩΣΗ ΚΑΙ ΔΙΟΙΚΗΣΗ ΕΠΙΧΕΙΡΗΣΕΩΝ', 4, 'Τίτλος εκπαιδευτικού μαθήματος ΟΡΓΑΝΩΣΗ ΚΑΙ ΔΙΟΙΚΗΣΗ ΕΠΙΧΕΙΡ', 11, '2015-03-06 12:47:23'),
(115, 'ΜΗΧΑΝΟΓΡΑΦΗΜΕΝΗ ΛΟΓΙΣΤΙΚΗ Ι', NULL, 'Θέμα διδασκαλίας ΜΗΧΑΝΟΓΡΑΦΗΜΕΝΗ ΛΟΓΙΣΤΙΚΗ Ι', 5, 'Τίτλος εκπαιδευτικού μαθήματος ΜΗΧΑΝΟΓΡΑΦΗΜΕΝΗ ΛΟΓΙΣΤΙΚΗ Ι', 14, '2015-03-06 12:49:01'),
(116, 'Θέμα διδασκαλίας ΜΗΧΑΝΟΓΡΑΦΗΜΕΝΗ ΛΟΓΙΣΤΙΚΗ ΙΙ', NULL, 'Θέμα διδασκαλίας ΜΗΧΑΝΟΓΡΑΦΗΜΕΝΗ ΛΟΓΙΣΤΙΚΗ ΙΙ', 4, 'Τίτλος εκπαιδευτικού μαθήματος ΜΗΧΑΝΟΓΡΑΦΗΜΕΝΗ ΛΟΓΙΣΤΙΚΗ ΙΙ', 15, '2015-03-06 12:49:28'),
(117, 'Εφαρμογές της Βιοτεχνολογίας στην Ιατρική', NULL, 'Θέμα διδασκαλίας Εφαρμογές της Βιοτεχνολογίας στην Ιατρική', 4, 'Τίτλος εκπαιδευτικού μαθήματος Εφαρμογές της Βιοτεχνολογίας ', 16, '2015-03-06 12:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `teachmethods`
--

CREATE TABLE IF NOT EXISTS `teachmethods` (
  `teachMethodID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teachMethodTitle` varchar(45) NOT NULL,
  `otherDetails` varchar(45) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`teachMethodID`),
  UNIQUE KEY `teachMethodID` (`teachMethodID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='It is, what kind of teaching will use the professor in the time of event.' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `teachmethods`
--

INSERT INTO `teachmethods` (`teachMethodID`, `teachMethodTitle`, `otherDetails`, `update_time`) VALUES
(9, 'παράδοση μαθήματος', 'γενική μέθοδος παράδοσης ή παρουσίασης μαθήμα', '0000-00-00 00:00:00'),
(11, 'ΘΕΩΡΙΑ_ΜΑΘΗΜ.', 'Διάλεξη θεωριτικού μέρος μαθήματος.', '0000-00-00 00:00:00'),
(12, 'ΑΣΚΗΣΗ_ΠΡΑΞΗΣ', 'Πρακτική άσκηση της θεωρίας που παραδόθηκε γι', '0000-00-00 00:00:00'),
(13, 'ΕΡΓΑΣΤΗΡΙΟ', 'Εργαστηριακό μέρος μαθήματος σε ειδικά διαμορ', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `timeslots`
--

CREATE TABLE IF NOT EXISTS `timeslots` (
  `timeSlotID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timeSlotConcat` varchar(64) NOT NULL,
  `daySlotStart` set('Δε0800','Δε0900','Δε1000','Δε1100','Δε1200','Δε1300','Δε1400','Δε1500','Δε1600','Δε1700','Δε1800','Δε1900','Τρ0800','Τρ0900','Τρ1000','Τρ1100','Τρ1200','Τρ1300','Τρ1400','Τρ1500','Τρ1600','Τρ1700','Τρ1800','Τρ1900','Τε0800','Τε0900','Τε1000','Τε1100','Τε1200','Τε1300','Τε1400','Τε1500','Τε1600','Τε1700','Τε1800','Τε1900','Πε0800','Πε0900','Πε1000','Πε1100','Πε1200','Πε1300','Πε1400','Πε1500','Πε1600','Πε1700','Πε1800','Πε1900','Πα0800','Πα0900','Πα1000','Πα1100','Πα1200','Πα1300','Πα1400','Πα1500','Πα1600','Πα1700','Πα1800','Πα1900') DEFAULT NULL,
  `slotEndNumber` set('0859','0959','1059','1159','1259','1359','1459','1559','1659','1759','1859','1959') DEFAULT NULL,
  `dayID` int(10) unsigned NOT NULL,
  `eventTypeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`timeSlotID`),
  UNIQUE KEY `timeSlotID_idx` (`timeSlotID`),
  KEY `eventTypeID_idx` (`eventTypeID`),
  KEY `dayID_idx` (`dayID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Time slot is the time from a chronological point and have a duration, the event time.' AUTO_INCREMENT=71 ;

--
-- Dumping data for table `timeslots`
--

INSERT INTO `timeslots` (`timeSlotID`, `timeSlotConcat`, `daySlotStart`, `slotEndNumber`, `dayID`, `eventTypeID`) VALUES
(11, 'ΔΕΥΤΕΡΑ 0800 0859', 'Δε0800', '0859', 1, 11),
(12, 'ΔΕΥΤΕΡΑ 0900 0959', 'Δε0900', '0959', 1, 11),
(13, 'ΔΕΥΤΕΡΑ 1000 1059', 'Δε1000', '1059', 1, 11),
(14, 'ΔΕΥΤΕΡΑ 1100 1159', 'Δε1100', '1159', 1, 11),
(15, 'ΔΕΥΤΕΡΑ 1200 1259', 'Δε1200', '1259', 1, 11),
(16, 'ΔΕΥΤΕΡΑ 1300 1359', 'Δε1300', '1359', 1, 11),
(17, 'ΔΕΥΤΕΡΑ 1400 1459', 'Δε1400', '1459', 1, 11),
(18, 'ΔΕΥΤΕΡΑ 1500 1559', 'Δε1500', '1559', 1, 11),
(19, 'ΔΕΥΤΕΡΑ 1600 1659', 'Δε1600', '1659', 1, 11),
(20, 'ΔΕΥΤΕΡΑ 1700 1759', 'Δε1700', '1759', 1, 11),
(21, 'ΔΕΥΤΕΡΑ 1800 1859', 'Δε1800', '1859', 1, 11),
(22, 'ΔΕΥΤΕΡΑ 1900 1959', 'Δε1900', '1959', 1, 11),
(23, 'ΤΡΙΤΗ 0800 0859', 'Τρ0800', '0859', 2, 11),
(24, 'ΤΡΙΤΗ 0900 0959', 'Τρ0900', '0959', 2, 11),
(25, 'ΤΡΙΤΗ 1000 1059', 'Τρ1000', '1059', 2, 11),
(26, 'ΤΡΙΤΗ 1100 1159', 'Τρ1100', '1159', 2, 11),
(27, 'ΤΡΙΤΗ 1200 1259', 'Τρ1200', '1259', 2, 11),
(28, 'ΤΡΙΤΗ 1300 1359', 'Τρ1300', '1359', 2, 11),
(29, 'ΤΡΙΤΗ 1400 1459', 'Τρ1400', '1459', 2, 11),
(30, 'ΤΡΙΤΗ 1500 1559', 'Τρ1500', '1559', 2, 11),
(31, 'ΤΡΙΤΗ 1600 1659', 'Τρ1600', '1659', 2, 11),
(32, 'ΤΡΙΤΗ 1700 1759', 'Τρ1700', '1759', 2, 11),
(33, 'ΤΡΙΤΗ 1800 1859', 'Τρ1800', '1859', 2, 11),
(34, 'ΤΡΙΤΗ 1900 1959', 'Τρ1900', '1959', 2, 11),
(35, 'ΤΕΤΑΡΤΗ 0800 0859', 'Τε0800', '0859', 3, 11),
(36, 'ΤΕΤΑΡΤΗ 0900 0959', 'Τε0900', '0959', 3, 11),
(37, 'ΤΕΤΑΡΤΗ 1000 1059', 'Τε1000', '1059', 3, 11),
(38, 'ΤΕΤΑΡΤΗ 1100 1159', 'Τε1100', '1159', 3, 11),
(39, 'ΤΕΤΑΡΤΗ 1200 1259', 'Τε1200', '1259', 3, 11),
(40, 'ΤΕΤΑΡΤΗ 1300 1359', 'Τε1300', '1359', 3, 11),
(41, 'ΤΕΤΑΡΤΗ 1400 1459', 'Τε1400', '1459', 3, 11),
(42, 'ΤΕΤΑΡΤΗ 1500 1559', 'Τε1500', '1559', 3, 11),
(43, 'ΤΕΤΑΡΤΗ 1600 1659', 'Τε1600', '1659', 3, 11),
(44, 'ΤΕΤΑΡΤΗ 1700 1759', 'Τε1700', '1759', 3, 11),
(45, 'ΤΕΤΑΡΤΗ 1800 1859', 'Τε1800', '1859', 3, 11),
(46, 'ΤΕΤΑΡΤΗ 1900 1959', 'Τε1900', '1959', 3, 11),
(47, 'ΠΕΜΠΤΗ 0800 0859', 'Πε0800', '0859', 4, 11),
(48, 'ΠΕΜΠΤΗ 0900 0959', 'Πε0900', '0959', 4, 11),
(49, 'ΠΕΜΠΤΗ 1000 1059', 'Πε1000', '1059', 4, 11),
(50, 'ΠΕΜΠΤΗ 1100 1159', 'Πε1100', '1159', 4, 11),
(51, 'ΠΕΜΠΤΗ 1200 1259', 'Πε1200', '1259', 4, 11),
(52, 'ΠΕΜΠΤΗ 1300 1359', 'Πε1300', '1359', 4, 11),
(53, 'ΠΕΜΠΤΗ 1400 1459', 'Πε1400', '1459', 4, 11),
(54, 'ΠΕΜΠΤΗ 1500 1559', 'Πε1500', '1559', 4, 11),
(55, 'ΠΕΜΠΤΗ 1600 1659', 'Πε1600', '1659', 4, 11),
(56, 'ΠΕΜΠΤΗ 1700 1759', 'Πε1700', '1759', 4, 11),
(57, 'ΠΕΜΠΤΗ 1800 1859', 'Πε1800', '1859', 4, 11),
(58, 'ΠΕΜΠΤΗ 1900 1959', 'Πε1900', '1959', 4, 11),
(59, 'ΠΑΡΑΣΚΕΥΗ 0800 0859', 'Πα0800', '0859', 5, 11),
(60, 'ΠΑΡΑΣΚΕΥΗ 0900 0959', 'Πα0900', '0959', 5, 11),
(61, 'ΠΑΡΑΣΚΕΥΗ 1000 1059', 'Πα1000', '1059', 5, 11),
(62, 'ΠΑΡΑΣΚΕΥΗ 1100 1159', 'Πα1100', '1159', 5, 11),
(63, 'ΠΑΡΑΣΚΕΥΗ 1200 1259', 'Πα1200', '1259', 5, 11),
(64, 'ΠΑΡΑΣΚΕΥΗ 1300 1359', 'Πα1300', '1359', 5, 11),
(65, 'ΠΑΡΑΣΚΕΥΗ 1400 1459', 'Πα1400', '1459', 5, 11),
(66, 'ΠΑΡΑΣΚΕΥΗ 1500 1559', 'Πα1500', '1559', 5, 11),
(67, 'ΠΑΡΑΣΚΕΥΗ 1600 1659', 'Πα1600', '1659', 5, 11),
(68, 'ΠΑΡΑΣΚΕΥΗ 1700 1759', 'Πα1700', '1759', 5, 11),
(69, 'ΠΑΡΑΣΚΕΥΗ 1800 1859', 'Πα1800', '1859', 5, 11),
(70, 'ΠΑΡΑΣΚΕΥΗ 1900 1959', 'Πα1900', '1959', 5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `weeks`
--

CREATE TABLE IF NOT EXISTS `weeks` (
  `weekID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monthID` int(10) unsigned NOT NULL,
  `academPeriodID` int(10) unsigned NOT NULL,
  `academYearID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`weekID`,`monthID`,`academPeriodID`,`academYearID`),
  UNIQUE KEY `weekID_idx` (`weekID`),
  KEY `monthID_acadPeriodID_acadYearID_idx` (`monthID`,`academPeriodID`,`academYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academicperiods`
--
ALTER TABLE `academicperiods`
  ADD CONSTRAINT `academicYearID` FOREIGN KEY (`academicYearID`) REFERENCES `academicyears` (`academicYearID`) ON UPDATE CASCADE;

--
-- Constraints for table `buildingfloorrooms`
--
ALTER TABLE `buildingfloorrooms`
  ADD CONSTRAINT `roomTypeID` FOREIGN KEY (`roomTypeID`) REFERENCES `roomtypes` (`roomTypeID`) ON UPDATE CASCADE;

--
-- Constraints for table `eventplannedcourses`
--
ALTER TABLE `eventplannedcourses`
  ADD CONSTRAINT `schoolID_ofSchools` FOREIGN KEY (`schoolID_ofSchools`) REFERENCES `schools` (`schoolID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `subjectID_ofSubjects` FOREIGN KEY (`subjectID_ofSubjects`) REFERENCES `subjects` (`subjectID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `teachMethodID_ofTeachMethods` FOREIGN KEY (`teachMethodID_ofTeachMethods`) REFERENCES `teachmethods` (`teachMethodID`) ON UPDATE CASCADE;

--
-- Constraints for table `eventplannedcourse_scarceresource_participantgroup_combis`
--
ALTER TABLE `eventplannedcourse_scarceresource_participantgroup_combis`
  ADD CONSTRAINT `eventPlannedCourseID` FOREIGN KEY (`eventPlannedCourseID`) REFERENCES `eventplannedcourses` (`eventPlannedCourseID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `scarceResourceID` FOREIGN KEY (`scarceResourceID`) REFERENCES `scarceresources` (`scarceResourceID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `schoolStudentGroupProfessorID` FOREIGN KEY (`schoolStudentGroupProfessorID`) REFERENCES `schoolstudentgroup_professor_links` (`schoolStudentGroupProfessorID`) ON UPDATE CASCADE;

--
-- Constraints for table `months`
--
ALTER TABLE `months`
  ADD CONSTRAINT `academPeriodID_academYearID` FOREIGN KEY (`academicPeriodID`, `academicYearID`) REFERENCES `academicperiods` (`academicPeriodID`, `academicYearID`) ON UPDATE CASCADE;

--
-- Constraints for table `professors`
--
ALTER TABLE `professors`
  ADD CONSTRAINT `locationAddressID_ofLocationAddresses` FOREIGN KEY (`locationAddressID_ofLocationAddresses`) REFERENCES `locationaddresses` (`locationAddressID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `professorTitleID_ofProfessorTitles` FOREIGN KEY (`professorTitleID_ofProfessorTitles`) REFERENCES `professortitles` (`professorTitleID`) ON UPDATE CASCADE;

--
-- Constraints for table `scarceresources`
--
ALTER TABLE `scarceresources`
  ADD CONSTRAINT `buildingFloorRoomID_byBuildingFloorRooms` FOREIGN KEY (`buildingFloorRoomID_byBuildingFloorRooms`) REFERENCES `buildingfloorrooms` (`buildingFloorRoomID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `locationAddressID_byLocationAddresses` FOREIGN KEY (`locationAddressID_byLocationAddresses`) REFERENCES `locationaddresses` (`locationAddressID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `timeSlotID_byTimeSlots` FOREIGN KEY (`timeSlotID_byTimeSlots`) REFERENCES `timeslots` (`timeSlotID`) ON UPDATE CASCADE;

--
-- Constraints for table `schools`
--
ALTER TABLE `schools`
  ADD CONSTRAINT `locatAddressID_byLocationAddresses` FOREIGN KEY (`locatAddressID_byLocationAddresses`) REFERENCES `locationaddresses` (`locationAddressID`) ON UPDATE CASCADE;

--
-- Constraints for table `schoolstudentgroup_professor_links`
--
ALTER TABLE `schoolstudentgroup_professor_links`
  ADD CONSTRAINT `professorID_byProfessors` FOREIGN KEY (`professorID_byProfessors`) REFERENCES `professors` (`professorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `schoolID_bySchools` FOREIGN KEY (`schoolID_bySchools`) REFERENCES `schools` (`schoolID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `studentGroupID_byStudentGroups` FOREIGN KEY (`studentGroupID_byStudentGroups`) REFERENCES `studentgroups` (`studentGroupID`) ON UPDATE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `levelID` FOREIGN KEY (`levelID`) REFERENCES `levels` (`levelID`) ON UPDATE CASCADE;

--
-- Constraints for table `timeslots`
--
ALTER TABLE `timeslots`
  ADD CONSTRAINT `dayID` FOREIGN KEY (`dayID`) REFERENCES `days` (`dayID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `eventTypeID` FOREIGN KEY (`eventTypeID`) REFERENCES `eventtypes` (`eventTypeID`) ON UPDATE CASCADE;

--
-- Constraints for table `weeks`
--
ALTER TABLE `weeks`
  ADD CONSTRAINT `monthID_acadPeriodID_acadYearID` FOREIGN KEY (`monthID`, `academPeriodID`, `academYearID`) REFERENCES `months` (`monthID`, `academicPeriodID`, `academicYearID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
