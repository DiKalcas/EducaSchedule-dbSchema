SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema EduSchedul
-- -----------------------------------------------------
-- Educational Sheduling Database is the main schema element for storing data of Educational resources and stuff
DROP SCHEMA IF EXISTS `EduSchedul` ;
CREATE SCHEMA IF NOT EXISTS `EduSchedul` DEFAULT CHARACTER SET utf8 ;
USE `EduSchedul` ;

-- -----------------------------------------------------
-- Table `EduSchedul`.`Levels`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Levels` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Levels` (
  `levelID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`levelID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `levelID` ON `EduSchedul`.`Levels` (`levelID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Subjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Subjects` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Subjects` (
  `subjectID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `levelID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`subjectID`),
  CONSTRAINT `levelID`
    FOREIGN KEY (`levelID`)
    REFERENCES `EduSchedul`.`Levels` (`levelID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `subjectID` ON `EduSchedul`.`Subjects` (`subjectID` ASC);

CREATE INDEX `levellID` ON `EduSchedul`.`Subjects` (`levelID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`TeachMethods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`TeachMethods` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`TeachMethods` (
  `teachMethodID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`teachMethodID`))
ENGINE = InnoDB
COMMENT = '			';

CREATE UNIQUE INDEX `teachMethodID` ON `EduSchedul`.`TeachMethods` (`teachMethodID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`LocationAddresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`LocationAddresses` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`LocationAddresses` (
  `locationAddressID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `area` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `zipPostCode` INT NULL,
  `province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `otherDetails` VARCHAR(45) NULL,
  PRIMARY KEY (`locationAddressID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE UNIQUE INDEX `locationAddressID` ON `EduSchedul`.`LocationAddresses` (`locationAddressID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Schools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Schools` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Schools` (
  `schoolID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `locatAddressID_byLocationAddresses` INT UNSIGNED NOT NULL,
  `SchoolSectionName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`schoolID`),
  CONSTRAINT `locatAddressID_byLocationAddresses`
    FOREIGN KEY (`locatAddressID_byLocationAddresses`)
    REFERENCES `EduSchedul`.`LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Schools of the institution:  Σχολές με τα τμήματα που λειτουργούν στην σχολή και η διεύθηνση που εδρεύουν. Υπάρχει περίπτωση να υπάρχουν πρώην σχολές που σταμάτησαν να λειτουργούν πρόσφατα.';

CREATE UNIQUE INDEX `schoolID` ON `EduSchedul`.`Schools` (`schoolID` ASC);

CREATE INDEX `locatAddressID_byLocationAddresses_idx` ON `EduSchedul`.`Schools` (`locatAddressID_byLocationAddresses` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`School_Subject_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`School_Subject_LINKS` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`School_Subject_LINKS` (
  `schoolID` INT UNSIGNED NOT NULL,
  `subjectID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`schoolID`, `subjectID`),
  CONSTRAINT `subjectID`
    FOREIGN KEY (`subjectID`)
    REFERENCES `EduSchedul`.`Subjects` (`subjectID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolID`
    FOREIGN KEY (`schoolID`)
    REFERENCES `EduSchedul`.`Schools` (`schoolID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `subjectID_idx` ON `EduSchedul`.`School_Subject_LINKS` (`subjectID` ASC);

CREATE INDEX `schoolID_idx` ON `EduSchedul`.`School_Subject_LINKS` (`schoolID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`SchoolSubject_TeachMethod_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`SchoolSubject_TeachMethod_LINKS` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`SchoolSubject_TeachMethod_LINKS` (
  `schoolID` INT UNSIGNED NOT NULL,
  `subjectID` INT UNSIGNED NOT NULL,
  `teachMethodID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`schoolID`, `subjectID`, `teachMethodID`),
  CONSTRAINT `schoolID_subjectID`
    FOREIGN KEY (`schoolID` , `subjectID`)
    REFERENCES `EduSchedul`.`School_Subject_LINKS` (`schoolID` , `subjectID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `teachMethod`
    FOREIGN KEY (`teachMethodID`)
    REFERENCES `EduSchedul`.`TeachMethods` (`teachMethodID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `teachMethodID_idx` ON `EduSchedul`.`SchoolSubject_TeachMethod_LINKS` (`teachMethodID` ASC);

CREATE INDEX `schoolID_subjectID_idx` ON `EduSchedul`.`SchoolSubject_TeachMethod_LINKS` (`schoolID` ASC, `subjectID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Durations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Durations` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Durations` (
  `durationID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`durationID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `durationID` ON `EduSchedul`.`Durations` (`durationID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`EventTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`EventTypes` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`EventTypes` (
  `eventTypeID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `durationID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`eventTypeID`),
  CONSTRAINT `durationID`
    FOREIGN KEY (`durationID`)
    REFERENCES `EduSchedul`.`Durations` (`durationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `eventTypeID_idx` ON `EduSchedul`.`EventTypes` (`eventTypeID` ASC);

CREATE INDEX `durationID_idx` ON `EduSchedul`.`EventTypes` (`durationID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Examinations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Examinations` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Examinations` (
  `examinationID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventTypeID_byEventTypes` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`examinationID`),
  CONSTRAINT `eventTypeID_byEventTypes`
    FOREIGN KEY (`eventTypeID_byEventTypes`)
    REFERENCES `EduSchedul`.`EventTypes` (`eventTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Event list table made of the subjects that will be examined in the examination period';

CREATE UNIQUE INDEX `examinationID_idx` ON `EduSchedul`.`Examinations` (`examinationID` ASC);

CREATE INDEX `eventTypeID_byEventTypes_idx` ON `EduSchedul`.`Examinations` (`eventTypeID_byEventTypes` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`PlannedCourses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`PlannedCourses` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`PlannedCourses` (
  `courseID` INT UNSIGNED NOT NULL,
  `eventTypeID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`courseID`),
  CONSTRAINT `eventTypeID`
    FOREIGN KEY (`eventTypeID`)
    REFERENCES `EduSchedul`.`EventTypes` (`eventTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Courses list for the period of time, as described from the school program';

CREATE UNIQUE INDEX `courseID` ON `EduSchedul`.`PlannedCourses` (`courseID` ASC);

CREATE INDEX `eventTypeID_idx` ON `EduSchedul`.`PlannedCourses` (`eventTypeID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`FinalProjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`FinalProjects` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`FinalProjects` (
  `finalProjectID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventTypeID_ofEventTypes` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`finalProjectID`),
  CONSTRAINT `eventTypeID_ofEventTypes`
    FOREIGN KEY (`eventTypeID_ofEventTypes`)
    REFERENCES `EduSchedul`.`EventTypes` (`eventTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Final projects meens the Dissertation have to do the student in order to complete the program';

CREATE UNIQUE INDEX `finalProjectID` ON `EduSchedul`.`FinalProjects` (`finalProjectID` ASC);

CREATE INDEX `eventTypeID_ofEventTypes_idx` ON `EduSchedul`.`FinalProjects` (`eventTypeID_ofEventTypes` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`PlannedCourse_has_School_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`PlannedCourse_has_School_LINKS` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`PlannedCourse_has_School_LINKS` (
  `courseID_byPlannedCourses` INT UNSIGNED NOT NULL,
  `schoolID_bySchools` INT UNSIGNED NOT NULL,
  `examinationID_byExaminations` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`courseID_byPlannedCourses`, `schoolID_bySchools`, `examinationID_byExaminations`),
  CONSTRAINT `courseID_byPlannedCourses`
    FOREIGN KEY (`courseID_byPlannedCourses`)
    REFERENCES `EduSchedul`.`PlannedCourses` (`courseID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolID_bySchools`
    FOREIGN KEY (`schoolID_bySchools`)
    REFERENCES `EduSchedul`.`Schools` (`schoolID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `examinationID_byExaminations`
    FOREIGN KEY (`examinationID_byExaminations`)
    REFERENCES `EduSchedul`.`Examinations` (`examinationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `schoolID_bySchools_idx` ON `EduSchedul`.`PlannedCourse_has_School_LINKS` (`schoolID_bySchools` ASC);

CREATE INDEX `courseID_byPlannedCourses_idx` ON `EduSchedul`.`PlannedCourse_has_School_LINKS` (`courseID_byPlannedCourses` ASC);

CREATE INDEX `examinationID_byExaminations_idx` ON `EduSchedul`.`PlannedCourse_has_School_LINKS` (`examinationID_byExaminations` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`FinalProject_has_School_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`FinalProject_has_School_LINKS` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`FinalProject_has_School_LINKS` (
  `finalProjectID_ofFinalProjects` INT UNSIGNED NOT NULL,
  `schoolID_ofSchools` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`finalProjectID_ofFinalProjects`, `schoolID_ofSchools`),
  CONSTRAINT `finalProjectID_ofFinalProjects`
    FOREIGN KEY (`finalProjectID_ofFinalProjects`)
    REFERENCES `EduSchedul`.`FinalProjects` (`finalProjectID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolID_ofSchools`
    FOREIGN KEY (`schoolID_ofSchools`)
    REFERENCES `EduSchedul`.`Schools` (`schoolID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `schoolID_ofSchools_idx` ON `EduSchedul`.`FinalProject_has_School_LINKS` (`schoolID_ofSchools` ASC);

CREATE INDEX `finalProjectID_ofFinalProjects_idx` ON `EduSchedul`.`FinalProject_has_School_LINKS` (`finalProjectID_ofFinalProjects` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`BuildingFloorRooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`BuildingFloorRooms` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`BuildingFloorRooms` (
  `buildingFloorRoomID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `locationAddressID_byLocationAddresses` INT UNSIGNED NOT NULL,
  `buildingName` VARCHAR(45) NULL,
  `floorLevelName` VARCHAR(45) NULL,
  `roomName` VARCHAR(45) NULL,
  PRIMARY KEY (`buildingFloorRoomID`),
  CONSTRAINT `locationAddressID`
    FOREIGN KEY (`locationAddressID_byLocationAddresses`)
    REFERENCES `EduSchedul`.`LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'The Buildings of the institution with the Floors of them, and the rooms available for educational activities:  Τα κτήρια του Τ.Ε.Ι. με τους ορόφους του κάθε κτηρίου και οι διαθέσιμες αίθουσες του κάθε ορόφου για διδασκαλία μαθημάτων ή άλλες εκπαιδευτικές δραστηριότητες.';

CREATE UNIQUE INDEX `buildingFloorRoomID_idx` ON `EduSchedul`.`BuildingFloorRooms` (`buildingFloorRoomID` ASC);

CREATE INDEX `locationAddressID_byLocationAddresses_idx` ON `EduSchedul`.`BuildingFloorRooms` (`locationAddressID_byLocationAddresses` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`RoomTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`RoomTypes` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`RoomTypes` (
  `roomTypeID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `roomTitle` VARCHAR(45) NULL COMMENT 'the title or the code of the room',
  `roomCapacity` INT NULL COMMENT 'room capacity in sheets of students that can be get in for lesson',
  `roomEquipment` VARCHAR(45) NULL,
  `otherDetails` VARCHAR(45) NULL,
  PRIMARY KEY (`roomTypeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Room types for different Educational activities:  Τα διάφορα είδη αιθουσών του εκπαιδευτικού ιδρύματος, για διδασκαλία των μαθημάτων των σχολών και εκδηλώσεις.';

CREATE UNIQUE INDEX `roomTypeID_UNIQUE` ON `EduSchedul`.`RoomTypes` (`roomTypeID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Students` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Students` (
  `studentID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`studentID`))
ENGINE = InnoDB
COMMENT = 'Students lists and other details is stored in the system of secretary  \"e-gramateia\" ';

CREATE UNIQUE INDEX `studentID` ON `EduSchedul`.`Students` (`studentID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`StudentGroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`StudentGroups` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`StudentGroups` (
  `studentGroupID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`studentGroupID`),
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `EduSchedul`.`Students` (`studentID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `studentGroupID` ON `EduSchedul`.`StudentGroups` (`studentGroupID` ASC);

CREATE INDEX `studentID_idx` ON `EduSchedul`.`StudentGroups` (`studentID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Professors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Professors` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Professors` (
  `professorID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `locationAddressID_ofLocationAddresses` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`professorID`),
  CONSTRAINT `locationAddressID_ofLocationAddresses`
    FOREIGN KEY (`locationAddressID_ofLocationAddresses`)
    REFERENCES `EduSchedul`.`LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `professorID` ON `EduSchedul`.`Professors` (`professorID` ASC);

CREATE INDEX `locationAddressID_ofLocationAddresses_idx` ON `EduSchedul`.`Professors` (`locationAddressID_ofLocationAddresses` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`StudentGroup_Professor_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`StudentGroup_Professor_LINKS` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`StudentGroup_Professor_LINKS` (
  `studentGroupID` INT UNSIGNED NOT NULL,
  `professorID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`studentGroupID`, `professorID`),
  CONSTRAINT `StudentGroupID`
    FOREIGN KEY (`studentGroupID`)
    REFERENCES `EduSchedul`.`StudentGroups` (`studentGroupID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `ProfessorID`
    FOREIGN KEY (`professorID`)
    REFERENCES `EduSchedul`.`Professors` (`professorID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `professorID` ON `EduSchedul`.`StudentGroup_Professor_LINKS` (`professorID` ASC);

CREATE INDEX `studentGroupID` ON `EduSchedul`.`StudentGroup_Professor_LINKS` (`studentGroupID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`LocationAddress_RoomType_LINKS_plusParticipants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`LocationAddress_RoomType_LINKS_plusParticipants` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`LocationAddress_RoomType_LINKS_plusParticipants` (
  `locationAddressID_fromLocatAddresses` INT UNSIGNED NOT NULL,
  `roomTypeID` INT UNSIGNED NOT NULL,
  `studentGroupID_byStudGroupProfesLINKS` INT UNSIGNED NOT NULL,
  `professorID_byStudGroupProfesLINKS` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`locationAddressID_fromLocatAddresses`, `roomTypeID`, `studentGroupID_byStudGroupProfesLINKS`, `professorID_byStudGroupProfesLINKS`),
  CONSTRAINT `locationAddressID_fromLocatAddresses`
    FOREIGN KEY (`locationAddressID_fromLocatAddresses`)
    REFERENCES `EduSchedul`.`LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `roomTypeID`
    FOREIGN KEY (`roomTypeID`)
    REFERENCES `EduSchedul`.`RoomTypes` (`roomTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `studentGroupID_professorID_byStudGroupProfesLINKS`
    FOREIGN KEY (`studentGroupID_byStudGroupProfesLINKS` , `professorID_byStudGroupProfesLINKS`)
    REFERENCES `EduSchedul`.`StudentGroup_Professor_LINKS` (`studentGroupID` , `professorID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `roomTypeID_idx` ON `EduSchedul`.`LocationAddress_RoomType_LINKS_plusParticipants` (`roomTypeID` ASC);

CREATE INDEX `locationAddressID_fromLocatAddresses_idx` ON `EduSchedul`.`LocationAddress_RoomType_LINKS_plusParticipants` (`locationAddressID_fromLocatAddresses` ASC);

CREATE INDEX `studentGroupID_professorID_byStudGroupProfesLINKS_idx` ON `EduSchedul`.`LocationAddress_RoomType_LINKS_plusParticipants` (`studentGroupID_byStudGroupProfesLINKS` ASC, `professorID_byStudGroupProfesLINKS` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`EventTimeUnits_LocationRooms_ParticipantGroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`EventTimeUnits_LocationRooms_ParticipantGroups` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`EventTimeUnits_LocationRooms_ParticipantGroups` (
  `timeUnitID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventTime` DATETIME NULL,
  `schoolID` INT UNSIGNED NOT NULL,
  `subjectID` INT UNSIGNED NOT NULL,
  `teachMethodID` INT UNSIGNED NOT NULL,
  `locationAddressID` INT UNSIGNED NOT NULL,
  `roomTypeID` INT UNSIGNED NOT NULL,
  `studentGroupID` INT UNSIGNED NOT NULL,
  `professorID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`timeUnitID`, `schoolID`, `subjectID`, `teachMethodID`, `locationAddressID`, `roomTypeID`, `studentGroupID`, `professorID`),
  CONSTRAINT `schoolID_subjectID_teachMethodID`
    FOREIGN KEY (`schoolID` , `subjectID` , `teachMethodID`)
    REFERENCES `EduSchedul`.`SchoolSubject_TeachMethod_LINKS` (`schoolID` , `subjectID` , `teachMethodID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `locationAddressID_roomTypeID_studGroupID_profesID`
    FOREIGN KEY (`locationAddressID` , `roomTypeID` , `studentGroupID` , `professorID`)
    REFERENCES `EduSchedul`.`LocationAddress_RoomType_LINKS_plusParticipants` (`locationAddressID_fromLocatAddresses` , `roomTypeID` , `studentGroupID_byStudGroupProfesLINKS` , `professorID_byStudGroupProfesLINKS`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `timeUnitID_idx` ON `EduSchedul`.`EventTimeUnits_LocationRooms_ParticipantGroups` (`timeUnitID` ASC);

CREATE INDEX `schoolID_subjectID_teachMethodID_idx` ON `EduSchedul`.`EventTimeUnits_LocationRooms_ParticipantGroups` (`schoolID` ASC, `subjectID` ASC, `teachMethodID` ASC);

CREATE INDEX `locationAddressID_roomTypeID_studGroupID_profesID_idx` ON `EduSchedul`.`EventTimeUnits_LocationRooms_ParticipantGroups` (`locationAddressID` ASC, `roomTypeID` ASC, `studentGroupID` ASC, `professorID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`TimeSlots`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`TimeSlots` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`TimeSlots` (
  `timeSlotID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dayID` INT UNSIGNED NOT NULL,
  `weekID` INT UNSIGNED NOT NULL,
  `monthID` INT UNSIGNED NOT NULL,
  `academPeriodID` INT UNSIGNED NOT NULL,
  `academYearID` INT UNSIGNED NOT NULL,
  `durationID_byDurations` INT UNSIGNED NOT NULL,
  `timeUnitID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`timeSlotID`, `dayID`, `weekID`, `monthID`, `academPeriodID`, `academYearID`, `timeUnitID`),
  CONSTRAINT `durationID_byDurations`
    FOREIGN KEY (`durationID_byDurations`)
    REFERENCES `EduSchedul`.`Durations` (`durationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `timeUnitID`
    FOREIGN KEY (`timeUnitID`)
    REFERENCES `EduSchedul`.`EventTimeUnits_LocationRooms_ParticipantGroups` (`timeUnitID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `timeSlotID_idx` ON `EduSchedul`.`TimeSlots` (`timeSlotID` ASC);

CREATE INDEX `durationID_byDurations_idx` ON `EduSchedul`.`TimeSlots` (`durationID_byDurations` ASC);

CREATE INDEX `timeUnitID_idx` ON `EduSchedul`.`TimeSlots` (`timeUnitID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`AcademicYears`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`AcademicYears` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`AcademicYears` (
  `academicYearID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`academicYearID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `academicYearID_idx` ON `EduSchedul`.`AcademicYears` (`academicYearID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`AcademicPeriods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`AcademicPeriods` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`AcademicPeriods` (
  `academicPeriodID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `academicYearID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`academicPeriodID`, `academicYearID`),
  CONSTRAINT `academicYearID`
    FOREIGN KEY (`academicYearID`)
    REFERENCES `EduSchedul`.`AcademicYears` (`academicYearID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `academicPeriodID_idx` ON `EduSchedul`.`AcademicPeriods` (`academicPeriodID` ASC);

CREATE INDEX `academicYearID_idx` ON `EduSchedul`.`AcademicPeriods` (`academicYearID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Months`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Months` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Months` (
  `monthID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `academicPeriodID` INT UNSIGNED NOT NULL,
  `academicYearID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`monthID`, `academicPeriodID`, `academicYearID`),
  CONSTRAINT `academPeriodID_academYearID`
    FOREIGN KEY (`academicPeriodID` , `academicYearID`)
    REFERENCES `EduSchedul`.`AcademicPeriods` (`academicPeriodID` , `academicYearID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `monthID_idx` ON `EduSchedul`.`Months` (`monthID` ASC);

CREATE INDEX `academPeriodID_academYearID_idx` ON `EduSchedul`.`Months` (`academicPeriodID` ASC, `academicYearID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Weeks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Weeks` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Weeks` (
  `weekID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `monthID` INT UNSIGNED NOT NULL,
  `academPeriodID` INT UNSIGNED NOT NULL,
  `academYearID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`weekID`, `monthID`, `academPeriodID`, `academYearID`),
  CONSTRAINT `monthID_acadPeriodID_acadYearID`
    FOREIGN KEY (`monthID` , `academPeriodID` , `academYearID`)
    REFERENCES `EduSchedul`.`Months` (`monthID` , `academicPeriodID` , `academicYearID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `weekID_idx` ON `EduSchedul`.`Weeks` (`weekID` ASC);

CREATE INDEX `monthID_acadPeriodID_acadYearID_idx` ON `EduSchedul`.`Weeks` (`monthID` ASC, `academPeriodID` ASC, `academYearID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Days`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Days` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Days` (
  `dayID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `weekID` INT UNSIGNED NOT NULL,
  `monthID` INT UNSIGNED NOT NULL,
  `academPeriodID` INT UNSIGNED NOT NULL,
  `academYearID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`dayID`, `weekID`, `monthID`, `academPeriodID`, `academYearID`),
  CONSTRAINT `weekID_monthID_acadPeriodID_acadYearID`
    FOREIGN KEY (`weekID` , `monthID` , `academPeriodID` , `academYearID`)
    REFERENCES `EduSchedul`.`Weeks` (`weekID` , `monthID` , `academPeriodID` , `academYearID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `dayID_idx` ON `EduSchedul`.`Days` (`dayID` ASC);

CREATE INDEX `weekID_monthID_acadPeriodID_acadYearID_idx` ON `EduSchedul`.`Days` (`weekID` ASC, `monthID` ASC, `academPeriodID` ASC, `academYearID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`ProfessorTitles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`ProfessorTitles` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`ProfessorTitles` (
  `professorTitleID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titleName` VARCHAR(45) NULL,
  `weekTeachHours` INT NULL,
  `isStanding` TINYINT(1) NULL COMMENT 'is standing this title of professor? gives the permanent of the title or not',
  `otherDetails` VARCHAR(45) NULL,
  PRIMARY KEY (`professorTitleID`))
ENGINE = InnoDB
COMMENT = 'Institution Academic Titles of the Professors:  Ακαδιμαϊκοί τίτλοι του Τ.Ε.Ι. στους μόνιμους εκπαιδευτικούς αλλά και στους έκτακτους εκπαιδευτικούς.';

CREATE UNIQUE INDEX `professorTitleID_UNIQUE` ON `EduSchedul`.`ProfessorTitles` (`professorTitleID` ASC);


-- -----------------------------------------------------
-- Table `EduSchedul`.`Professors_SchoolsLINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EduSchedul`.`Professors_SchoolsLINKS` ;

CREATE TABLE IF NOT EXISTS `EduSchedul`.`Professors_SchoolsLINKS` (
  `Professors_professorID` INT UNSIGNED NOT NULL,
  `Schools_schoolID` INT UNSIGNED NOT NULL,
  `ProfessorTitles_professorTitleID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Professors_professorID`, `Schools_schoolID`),
  CONSTRAINT `Professors_SchoolsLINKS_Professors1`
    FOREIGN KEY (`Professors_professorID`)
    REFERENCES `EduSchedul`.`Professors` (`professorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Professors_SchoolsLINKS_Schools1`
    FOREIGN KEY (`Schools_schoolID`)
    REFERENCES `EduSchedul`.`Schools` (`schoolID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Professors_SchoolsLINKS_ProfessorTitles1`
    FOREIGN KEY (`ProfessorTitles_professorTitleID`)
    REFERENCES `EduSchedul`.`ProfessorTitles` (`professorTitleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Professors_SchoolsLINKS_Schools1_idx` ON `EduSchedul`.`Professors_SchoolsLINKS` (`Schools_schoolID` ASC);

CREATE INDEX `Professors_SchoolsLINKS_Professors1_idx` ON `EduSchedul`.`Professors_SchoolsLINKS` (`Professors_professorID` ASC);

CREATE INDEX `Professors_SchoolsLINKS_ProfessorTitles1_idx` ON `EduSchedul`.`Professors_SchoolsLINKS` (`ProfessorTitles_professorTitleID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `EduSchedul`.`LocationAddresses`
-- -----------------------------------------------------
START TRANSACTION;
USE `EduSchedul`;
INSERT INTO `EduSchedul`.`LocationAddresses` (`locationAddressID`, `city`, `area`, `address`, `zipPostCode`, `province`, `country`, `otherDetails`) VALUES (1001, 'Λάρισα', 'Άγιος Θωμας', 'Περιφεριακός Λάρισας - Τρικάλων', 41110, 'Θεσσαλία', 'Ελλάς', NULL);
INSERT INTO `EduSchedul`.`LocationAddresses` (`locationAddressID`, `city`, `area`, `address`, `zipPostCode`, `province`, `country`, `otherDetails`) VALUES (NULL, 'Τρίκαλα', NULL, 'Αργοναυτών 1Γ', 42100, NULL, 'Ελλάς', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `EduSchedul`.`BuildingFloorRooms`
-- -----------------------------------------------------
START TRANSACTION;
USE `EduSchedul`;
INSERT INTO `EduSchedul`.`BuildingFloorRooms` (`buildingFloorRoomID`, `locationAddressID_byLocationAddresses`, `buildingName`, `floorLevelName`, `roomName`) VALUES (101, 1001, 'ΒΙΒΛΙΟΘΗΚΗ Τ.Ε.Ι.', 'ΙΣΟΓΕΙΟ', 'ΑΙΘΟΥΣΑ ΜΕΛΕΤΗΣ');
INSERT INTO `EduSchedul`.`BuildingFloorRooms` (`buildingFloorRoomID`, `locationAddressID_byLocationAddresses`, `buildingName`, `floorLevelName`, `roomName`) VALUES (102, 1001, 'ΒΙΒΛΙΟΘΗΚΗ Τ.Ε.Ι.', 'ΙΣΟΓΕΙΟ', 'ΧΩΡΟΣ ΤΗΛΕΔΙΑΣΚΕΨΗΣ');
INSERT INTO `EduSchedul`.`BuildingFloorRooms` (`buildingFloorRoomID`, `locationAddressID_byLocationAddresses`, `buildingName`, `floorLevelName`, `roomName`) VALUES (103, 1001, 'ΒΙΒΛΙΟΘΗΚΗ Τ.Ε.Ι.', 'ΙΣΟΓΕΙΟ', 'ΑΙΘΟΥΣΑ ΒΙΒΛΙΟΣΤΑΣΙΩΝ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `EduSchedul`.`RoomTypes`
-- -----------------------------------------------------
START TRANSACTION;
USE `EduSchedul`;
INSERT INTO `EduSchedul`.`RoomTypes` (`roomTypeID`, `roomTitle`, `roomCapacity`, `roomEquipment`, `otherDetails`) VALUES (11, 'ΑΜΦΙΘΕΑΤΡΟ', 100, 'προβολή φιλμ', NULL);
INSERT INTO `EduSchedul`.`RoomTypes` (`roomTypeID`, `roomTitle`, `roomCapacity`, `roomEquipment`, `otherDetails`) VALUES (12, 'ΑΜΦΙΘΕΑΤΡΟ ΕΚΔΗΛΩΣΕΩΝ', 300, 'βίντεο παρουσίαση', NULL);
INSERT INTO `EduSchedul`.`RoomTypes` (`roomTypeID`, `roomTitle`, `roomCapacity`, `roomEquipment`, `otherDetails`) VALUES (21, 'ΕΡΓΑΣΤΗΡΙΟ ΠΛΗΡΟΦΟΡΙΚΗΣ', 45, 'δίκτυο υπολογιστών', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `EduSchedul`.`ProfessorTitles`
-- -----------------------------------------------------
START TRANSACTION;
USE `EduSchedul`;
INSERT INTO `EduSchedul`.`ProfessorTitles` (`professorTitleID`, `titleName`, `weekTeachHours`, `isStanding`, `otherDetails`) VALUES (11, 'ΚΑΘΗΓΗΤΗΣ', 10, 1, NULL);
INSERT INTO `EduSchedul`.`ProfessorTitles` (`professorTitleID`, `titleName`, `weekTeachHours`, `isStanding`, `otherDetails`) VALUES (NULL, 'ΑΝΑΠΛΗΡΩΤΗΣ ΚΑΘΗΓΗΤΗΣ', 12, 1, NULL);
INSERT INTO `EduSchedul`.`ProfessorTitles` (`professorTitleID`, `titleName`, `weekTeachHours`, `isStanding`, `otherDetails`) VALUES (NULL, 'ΕΠΙΚΟΥΡΟΣ ΚΑΘΗΓΗΤΗΣ', 14, 1, NULL);

COMMIT;

