SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema EduSchedul
-- -----------------------------------------------------
-- Educational Sheduling Database is the main schema element for storing data of Educational resources and stuff

-- -----------------------------------------------------
-- Table `Levels`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Levels` ;

CREATE TABLE IF NOT EXISTS `Levels` (
  `levelID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`levelID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `levelID` ON `Levels` (`levelID` ASC);


-- -----------------------------------------------------
-- Table `Subjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Subjects` ;

CREATE TABLE IF NOT EXISTS `Subjects` (
  `subjectID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `levelID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`subjectID`),
  CONSTRAINT `levelID`
    FOREIGN KEY (`levelID`)
    REFERENCES `Levels` (`levelID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `subjectID` ON `Subjects` (`subjectID` ASC);

CREATE INDEX `levellID` ON `Subjects` (`levelID` ASC);


-- -----------------------------------------------------
-- Table `TeachMethods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TeachMethods` ;

CREATE TABLE IF NOT EXISTS `TeachMethods` (
  `teachMethodID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`teachMethodID`))
ENGINE = InnoDB
COMMENT = '			';

CREATE UNIQUE INDEX `teachMethodID` ON `TeachMethods` (`teachMethodID` ASC);


-- -----------------------------------------------------
-- Table `LocationAddresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LocationAddresses` ;

CREATE TABLE IF NOT EXISTS `LocationAddresses` (
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

CREATE UNIQUE INDEX `locationAddressID` ON `LocationAddresses` (`locationAddressID` ASC);


-- -----------------------------------------------------
-- Table `Schools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Schools` ;

CREATE TABLE IF NOT EXISTS `Schools` (
  `schoolID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `locatAddressID_byLocationAddresses` INT UNSIGNED NOT NULL,
  `SchoolSectionName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`schoolID`),
  CONSTRAINT `locatAddressID_byLocationAddresses`
    FOREIGN KEY (`locatAddressID_byLocationAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Schools of the institution:  Σχολές με τα τμήματα που λειτουργούν στην σχολή και η διεύθηνση που εδρεύουν. Υπάρχει περίπτωση να υπάρχουν πρώην σχολές που σταμάτησαν να λειτουργούν πρόσφατα.';

CREATE UNIQUE INDEX `schoolID` ON `Schools` (`schoolID` ASC);

CREATE INDEX `locatAddressID_byLocationAddresses_idx` ON `Schools` (`locatAddressID_byLocationAddresses` ASC);


-- -----------------------------------------------------
-- Table `School_Subject_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `School_Subject_LINKS` ;

CREATE TABLE IF NOT EXISTS `School_Subject_LINKS` (
  `schoolID` INT UNSIGNED NOT NULL,
  `subjectID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`schoolID`, `subjectID`),
  CONSTRAINT `subjectID`
    FOREIGN KEY (`subjectID`)
    REFERENCES `Subjects` (`subjectID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolID`
    FOREIGN KEY (`schoolID`)
    REFERENCES `Schools` (`schoolID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `subjectID_idx` ON `School_Subject_LINKS` (`subjectID` ASC);

CREATE INDEX `schoolID_idx` ON `School_Subject_LINKS` (`schoolID` ASC);


-- -----------------------------------------------------
-- Table `SchoolSubject_TeachMethod_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SchoolSubject_TeachMethod_LINKS` ;

CREATE TABLE IF NOT EXISTS `SchoolSubject_TeachMethod_LINKS` (
  `schoolID` INT UNSIGNED NOT NULL,
  `subjectID` INT UNSIGNED NOT NULL,
  `teachMethodID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`schoolID`, `subjectID`, `teachMethodID`),
  CONSTRAINT `schoolID_subjectID`
    FOREIGN KEY (`schoolID` , `subjectID`)
    REFERENCES `School_Subject_LINKS` (`schoolID` , `subjectID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `teachMethod`
    FOREIGN KEY (`teachMethodID`)
    REFERENCES `TeachMethods` (`teachMethodID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `teachMethodID_idx` ON `SchoolSubject_TeachMethod_LINKS` (`teachMethodID` ASC);

CREATE INDEX `schoolID_subjectID_idx` ON `SchoolSubject_TeachMethod_LINKS` (`schoolID` ASC, `subjectID` ASC);


-- -----------------------------------------------------
-- Table `Durations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Durations` ;

CREATE TABLE IF NOT EXISTS `Durations` (
  `durationID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`durationID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `durationID` ON `Durations` (`durationID` ASC);


-- -----------------------------------------------------
-- Table `EventTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EventTypes` ;

CREATE TABLE IF NOT EXISTS `EventTypes` (
  `eventTypeID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `durationID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`eventTypeID`),
  CONSTRAINT `durationID`
    FOREIGN KEY (`durationID`)
    REFERENCES `Durations` (`durationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `eventTypeID_idx` ON `EventTypes` (`eventTypeID` ASC);

CREATE INDEX `durationID_idx` ON `EventTypes` (`durationID` ASC);


-- -----------------------------------------------------
-- Table `Examinations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Examinations` ;

CREATE TABLE IF NOT EXISTS `Examinations` (
  `examinationID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventTypeID_byEventTypes` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`examinationID`),
  CONSTRAINT `eventTypeID_byEventTypes`
    FOREIGN KEY (`eventTypeID_byEventTypes`)
    REFERENCES `EventTypes` (`eventTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Event list table made of the subjects that will be examined in the examination period';

CREATE UNIQUE INDEX `examinationID_idx` ON `Examinations` (`examinationID` ASC);

CREATE INDEX `eventTypeID_byEventTypes_idx` ON `Examinations` (`eventTypeID_byEventTypes` ASC);


-- -----------------------------------------------------
-- Table `PlannedCourses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlannedCourses` ;

CREATE TABLE IF NOT EXISTS `PlannedCourses` (
  `courseID` INT UNSIGNED NOT NULL,
  `eventTypeID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`courseID`),
  CONSTRAINT `eventTypeID`
    FOREIGN KEY (`eventTypeID`)
    REFERENCES `EventTypes` (`eventTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Courses list for the period of time, as described from the school program';

CREATE UNIQUE INDEX `courseID` ON `PlannedCourses` (`courseID` ASC);

CREATE INDEX `eventTypeID_idx` ON `PlannedCourses` (`eventTypeID` ASC);


-- -----------------------------------------------------
-- Table `FinalProjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FinalProjects` ;

CREATE TABLE IF NOT EXISTS `FinalProjects` (
  `finalProjectID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventTypeID_ofEventTypes` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`finalProjectID`),
  CONSTRAINT `eventTypeID_ofEventTypes`
    FOREIGN KEY (`eventTypeID_ofEventTypes`)
    REFERENCES `EventTypes` (`eventTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Final projects meens the Dissertation have to do the student in order to complete the program';

CREATE UNIQUE INDEX `finalProjectID` ON `FinalProjects` (`finalProjectID` ASC);

CREATE INDEX `eventTypeID_ofEventTypes_idx` ON `FinalProjects` (`eventTypeID_ofEventTypes` ASC);


-- -----------------------------------------------------
-- Table `PlannedCourse_has_School_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlannedCourse_has_School_LINKS` ;

CREATE TABLE IF NOT EXISTS `PlannedCourse_has_School_LINKS` (
  `courseID_byPlannedCourses` INT UNSIGNED NOT NULL,
  `schoolID_bySchools` INT UNSIGNED NOT NULL,
  `examinationID_byExaminations` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`courseID_byPlannedCourses`, `schoolID_bySchools`, `examinationID_byExaminations`),
  CONSTRAINT `courseID_byPlannedCourses`
    FOREIGN KEY (`courseID_byPlannedCourses`)
    REFERENCES `PlannedCourses` (`courseID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolID_bySchools`
    FOREIGN KEY (`schoolID_bySchools`)
    REFERENCES `Schools` (`schoolID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `examinationID_byExaminations`
    FOREIGN KEY (`examinationID_byExaminations`)
    REFERENCES `Examinations` (`examinationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `schoolID_bySchools_idx` ON `PlannedCourse_has_School_LINKS` (`schoolID_bySchools` ASC);

CREATE INDEX `courseID_byPlannedCourses_idx` ON `PlannedCourse_has_School_LINKS` (`courseID_byPlannedCourses` ASC);

CREATE INDEX `examinationID_byExaminations_idx` ON `PlannedCourse_has_School_LINKS` (`examinationID_byExaminations` ASC);


-- -----------------------------------------------------
-- Table `FinalProject_has_School_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FinalProject_has_School_LINKS` ;

CREATE TABLE IF NOT EXISTS `FinalProject_has_School_LINKS` (
  `finalProjectID_ofFinalProjects` INT UNSIGNED NOT NULL,
  `schoolID_ofSchools` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`finalProjectID_ofFinalProjects`, `schoolID_ofSchools`),
  CONSTRAINT `finalProjectID_ofFinalProjects`
    FOREIGN KEY (`finalProjectID_ofFinalProjects`)
    REFERENCES `FinalProjects` (`finalProjectID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolID_ofSchools`
    FOREIGN KEY (`schoolID_ofSchools`)
    REFERENCES `Schools` (`schoolID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `schoolID_ofSchools_idx` ON `FinalProject_has_School_LINKS` (`schoolID_ofSchools` ASC);

CREATE INDEX `finalProjectID_ofFinalProjects_idx` ON `FinalProject_has_School_LINKS` (`finalProjectID_ofFinalProjects` ASC);


-- -----------------------------------------------------
-- Table `BuildingFloorRooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BuildingFloorRooms` ;

CREATE TABLE IF NOT EXISTS `BuildingFloorRooms` (
  `buildingFloorRoomID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `locationAddressID_byLocationAddresses` INT UNSIGNED NOT NULL,
  `buildingName` VARCHAR(45) NULL,
  `floorLevelName` VARCHAR(45) NULL,
  `roomName` VARCHAR(45) NULL,
  PRIMARY KEY (`buildingFloorRoomID`),
  CONSTRAINT `locationAddressID`
    FOREIGN KEY (`locationAddressID_byLocationAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'The Buildings of the institution with the Floors of them, and the rooms available for educational activities:  Τα κτήρια του Τ.Ε.Ι. με τους ορόφους του κάθε κτηρίου και οι διαθέσιμες αίθουσες του κάθε ορόφου για διδασκαλία μαθημάτων ή άλλες εκπαιδευτικές δραστηριότητες.';

CREATE UNIQUE INDEX `buildingFloorRoomID_idx` ON `BuildingFloorRooms` (`buildingFloorRoomID` ASC);

CREATE INDEX `locationAddressID_byLocationAddresses_idx` ON `BuildingFloorRooms` (`locationAddressID_byLocationAddresses` ASC);


-- -----------------------------------------------------
-- Table `RoomTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RoomTypes` ;

CREATE TABLE IF NOT EXISTS `RoomTypes` (
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

CREATE UNIQUE INDEX `roomTypeID_UNIQUE` ON `RoomTypes` (`roomTypeID` ASC);


-- -----------------------------------------------------
-- Table `Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Students` ;

CREATE TABLE IF NOT EXISTS `Students` (
  `studentID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`studentID`))
ENGINE = InnoDB
COMMENT = 'Students lists and other details is stored in the system of secretary  \"e-gramateia\" ';

CREATE UNIQUE INDEX `studentID` ON `Students` (`studentID` ASC);


-- -----------------------------------------------------
-- Table `StudentGroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StudentGroups` ;

CREATE TABLE IF NOT EXISTS `StudentGroups` (
  `studentGroupID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`studentGroupID`),
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `Students` (`studentID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `studentGroupID` ON `StudentGroups` (`studentGroupID` ASC);

CREATE INDEX `studentID_idx` ON `StudentGroups` (`studentID` ASC);


-- -----------------------------------------------------
-- Table `Professors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Professors` ;

CREATE TABLE IF NOT EXISTS `Professors` (
  `professorID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `locationAddressID_ofLocationAddresses` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`professorID`),
  CONSTRAINT `locationAddressID_ofLocationAddresses`
    FOREIGN KEY (`locationAddressID_ofLocationAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `professorID` ON `Professors` (`professorID` ASC);

CREATE INDEX `locationAddressID_ofLocationAddresses_idx` ON `Professors` (`locationAddressID_ofLocationAddresses` ASC);


-- -----------------------------------------------------
-- Table `StudentGroup_Professor_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StudentGroup_Professor_LINKS` ;

CREATE TABLE IF NOT EXISTS `StudentGroup_Professor_LINKS` (
  `studentGroupID` INT UNSIGNED NOT NULL,
  `professorID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`studentGroupID`, `professorID`),
  CONSTRAINT `StudentGroupID`
    FOREIGN KEY (`studentGroupID`)
    REFERENCES `StudentGroups` (`studentGroupID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `ProfessorID`
    FOREIGN KEY (`professorID`)
    REFERENCES `Professors` (`professorID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `professorID` ON `StudentGroup_Professor_LINKS` (`professorID` ASC);

CREATE INDEX `studentGroupID` ON `StudentGroup_Professor_LINKS` (`studentGroupID` ASC);


-- -----------------------------------------------------
-- Table `LocationAddress_RoomType_LINKS_plusParticipants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LocationAddress_RoomType_LINKS_plusParticipants` ;

CREATE TABLE IF NOT EXISTS `LocationAddress_RoomType_LINKS_plusParticipants` (
  `locationAddressID_fromLocatAddresses` INT UNSIGNED NOT NULL,
  `roomTypeID` INT UNSIGNED NOT NULL,
  `studentGroupID_byStudGroupProfesLINKS` INT UNSIGNED NOT NULL,
  `professorID_byStudGroupProfesLINKS` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`locationAddressID_fromLocatAddresses`, `roomTypeID`, `studentGroupID_byStudGroupProfesLINKS`, `professorID_byStudGroupProfesLINKS`),
  CONSTRAINT `locationAddressID_fromLocatAddresses`
    FOREIGN KEY (`locationAddressID_fromLocatAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `roomTypeID`
    FOREIGN KEY (`roomTypeID`)
    REFERENCES `RoomTypes` (`roomTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `studentGroupID_professorID_byStudGroupProfesLINKS`
    FOREIGN KEY (`studentGroupID_byStudGroupProfesLINKS` , `professorID_byStudGroupProfesLINKS`)
    REFERENCES `StudentGroup_Professor_LINKS` (`studentGroupID` , `professorID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `roomTypeID_idx` ON `LocationAddress_RoomType_LINKS_plusParticipants` (`roomTypeID` ASC);

CREATE INDEX `locationAddressID_fromLocatAddresses_idx` ON `LocationAddress_RoomType_LINKS_plusParticipants` (`locationAddressID_fromLocatAddresses` ASC);

CREATE INDEX `studentGroupID_professorID_byStudGroupProfesLINKS_idx` ON `LocationAddress_RoomType_LINKS_plusParticipants` (`studentGroupID_byStudGroupProfesLINKS` ASC, `professorID_byStudGroupProfesLINKS` ASC);


-- -----------------------------------------------------
-- Table `EventTimeUnits_LocationRooms_ParticipantGroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EventTimeUnits_LocationRooms_ParticipantGroups` ;

CREATE TABLE IF NOT EXISTS `EventTimeUnits_LocationRooms_ParticipantGroups` (
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
    REFERENCES `SchoolSubject_TeachMethod_LINKS` (`schoolID` , `subjectID` , `teachMethodID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `locationAddressID_roomTypeID_studGroupID_profesID`
    FOREIGN KEY (`locationAddressID` , `roomTypeID` , `studentGroupID` , `professorID`)
    REFERENCES `LocationAddress_RoomType_LINKS_plusParticipants` (`locationAddressID_fromLocatAddresses` , `roomTypeID` , `studentGroupID_byStudGroupProfesLINKS` , `professorID_byStudGroupProfesLINKS`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `timeUnitID_idx` ON `EventTimeUnits_LocationRooms_ParticipantGroups` (`timeUnitID` ASC);

CREATE INDEX `schoolID_subjectID_teachMethodID_idx` ON `EventTimeUnits_LocationRooms_ParticipantGroups` (`schoolID` ASC, `subjectID` ASC, `teachMethodID` ASC);

CREATE INDEX `locationAddressID_roomTypeID_studGroupID_profesID_idx` ON `EventTimeUnits_LocationRooms_ParticipantGroups` (`locationAddressID` ASC, `roomTypeID` ASC, `studentGroupID` ASC, `professorID` ASC);


-- -----------------------------------------------------
-- Table `TimeSlots`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TimeSlots` ;

CREATE TABLE IF NOT EXISTS `TimeSlots` (
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
    REFERENCES `Durations` (`durationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `timeUnitID`
    FOREIGN KEY (`timeUnitID`)
    REFERENCES `EventTimeUnits_LocationRooms_ParticipantGroups` (`timeUnitID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `timeSlotID_idx` ON `TimeSlots` (`timeSlotID` ASC);

CREATE INDEX `durationID_byDurations_idx` ON `TimeSlots` (`durationID_byDurations` ASC);

CREATE INDEX `timeUnitID_idx` ON `TimeSlots` (`timeUnitID` ASC);


-- -----------------------------------------------------
-- Table `AcademicYears`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AcademicYears` ;

CREATE TABLE IF NOT EXISTS `AcademicYears` (
  `academicYearID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`academicYearID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `academicYearID_idx` ON `AcademicYears` (`academicYearID` ASC);


-- -----------------------------------------------------
-- Table `AcademicPeriods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AcademicPeriods` ;

CREATE TABLE IF NOT EXISTS `AcademicPeriods` (
  `academicPeriodID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `academicYearID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`academicPeriodID`, `academicYearID`),
  CONSTRAINT `academicYearID`
    FOREIGN KEY (`academicYearID`)
    REFERENCES `AcademicYears` (`academicYearID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `academicPeriodID_idx` ON `AcademicPeriods` (`academicPeriodID` ASC);

CREATE INDEX `academicYearID_idx` ON `AcademicPeriods` (`academicYearID` ASC);


-- -----------------------------------------------------
-- Table `Months`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Months` ;

CREATE TABLE IF NOT EXISTS `Months` (
  `monthID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `academicPeriodID` INT UNSIGNED NOT NULL,
  `academicYearID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`monthID`, `academicPeriodID`, `academicYearID`),
  CONSTRAINT `academPeriodID_academYearID`
    FOREIGN KEY (`academicPeriodID` , `academicYearID`)
    REFERENCES `AcademicPeriods` (`academicPeriodID` , `academicYearID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `monthID_idx` ON `Months` (`monthID` ASC);

CREATE INDEX `academPeriodID_academYearID_idx` ON `Months` (`academicPeriodID` ASC, `academicYearID` ASC);


-- -----------------------------------------------------
-- Table `Weeks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Weeks` ;

CREATE TABLE IF NOT EXISTS `Weeks` (
  `weekID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `monthID` INT UNSIGNED NOT NULL,
  `academPeriodID` INT UNSIGNED NOT NULL,
  `academYearID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`weekID`, `monthID`, `academPeriodID`, `academYearID`),
  CONSTRAINT `monthID_acadPeriodID_acadYearID`
    FOREIGN KEY (`monthID` , `academPeriodID` , `academYearID`)
    REFERENCES `Months` (`monthID` , `academicPeriodID` , `academicYearID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `weekID_idx` ON `Weeks` (`weekID` ASC);

CREATE INDEX `monthID_acadPeriodID_acadYearID_idx` ON `Weeks` (`monthID` ASC, `academPeriodID` ASC, `academYearID` ASC);


-- -----------------------------------------------------
-- Table `Days`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Days` ;

CREATE TABLE IF NOT EXISTS `Days` (
  `dayID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `weekID` INT UNSIGNED NOT NULL,
  `monthID` INT UNSIGNED NOT NULL,
  `academPeriodID` INT UNSIGNED NOT NULL,
  `academYearID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`dayID`, `weekID`, `monthID`, `academPeriodID`, `academYearID`),
  CONSTRAINT `weekID_monthID_acadPeriodID_acadYearID`
    FOREIGN KEY (`weekID` , `monthID` , `academPeriodID` , `academYearID`)
    REFERENCES `Weeks` (`weekID` , `monthID` , `academPeriodID` , `academYearID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `dayID_idx` ON `Days` (`dayID` ASC);

CREATE INDEX `weekID_monthID_acadPeriodID_acadYearID_idx` ON `Days` (`weekID` ASC, `monthID` ASC, `academPeriodID` ASC, `academYearID` ASC);


-- -----------------------------------------------------
-- Table `ProfessorTitles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProfessorTitles` ;

CREATE TABLE IF NOT EXISTS `ProfessorTitles` (
  `professorTitleID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titleName` VARCHAR(45) NULL,
  `weekTeachHours` INT NULL,
  `isStanding` TINYINT(1) NULL COMMENT 'is standing this title of professor? gives the permanent of the title or not',
  `otherDetails` VARCHAR(45) NULL,
  PRIMARY KEY (`professorTitleID`))
ENGINE = InnoDB
COMMENT = 'Institution Academic Titles of the Professors:  Ακαδιμαϊκοί τίτλοι του Τ.Ε.Ι. στους μόνιμους εκπαιδευτικούς αλλά και στους έκτακτους εκπαιδευτικούς.';

CREATE UNIQUE INDEX `professorTitleID_UNIQUE` ON `ProfessorTitles` (`professorTitleID` ASC);


-- -----------------------------------------------------
-- Table `Professors_SchoolsLINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Professors_SchoolsLINKS` ;

CREATE TABLE IF NOT EXISTS `Professors_SchoolsLINKS` (
  `Professors_professorID` INT UNSIGNED NOT NULL,
  `Schools_schoolID` INT UNSIGNED NOT NULL,
  `ProfessorTitles_professorTitleID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Professors_professorID`, `Schools_schoolID`),
  CONSTRAINT `Professors_SchoolsLINKS_Professors1`
    FOREIGN KEY (`Professors_professorID`)
    REFERENCES `Professors` (`professorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Professors_SchoolsLINKS_Schools1`
    FOREIGN KEY (`Schools_schoolID`)
    REFERENCES `Schools` (`schoolID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Professors_SchoolsLINKS_ProfessorTitles1`
    FOREIGN KEY (`ProfessorTitles_professorTitleID`)
    REFERENCES `ProfessorTitles` (`professorTitleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Professors_SchoolsLINKS_Schools1_idx` ON `Professors_SchoolsLINKS` (`Schools_schoolID` ASC);

CREATE INDEX `Professors_SchoolsLINKS_Professors1_idx` ON `Professors_SchoolsLINKS` (`Professors_professorID` ASC);

CREATE INDEX `Professors_SchoolsLINKS_ProfessorTitles1_idx` ON `Professors_SchoolsLINKS` (`ProfessorTitles_professorTitleID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `LocationAddresses`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `LocationAddresses` (`locationAddressID`, `city`, `area`, `address`, `zipPostCode`, `province`, `country`, `otherDetails`) VALUES (1001, 'Λάρισα', 'Άγιος Θωμας', 'Περιφεριακός Λάρισας - Τρικάλων', 41110, 'Θεσσαλία', 'Ελλάς', NULL);
INSERT INTO `LocationAddresses` (`locationAddressID`, `city`, `area`, `address`, `zipPostCode`, `province`, `country`, `otherDetails`) VALUES (NULL, 'Τρίκαλα', NULL, 'Αργοναυτών 1Γ', 42100, NULL, 'Ελλάς', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BuildingFloorRooms`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `BuildingFloorRooms` (`buildingFloorRoomID`, `locationAddressID_byLocationAddresses`, `buildingName`, `floorLevelName`, `roomName`) VALUES (101, 1001, 'ΒΙΒΛΙΟΘΗΚΗ Τ.Ε.Ι.', 'ΙΣΟΓΕΙΟ', 'ΑΙΘΟΥΣΑ ΜΕΛΕΤΗΣ');
INSERT INTO `BuildingFloorRooms` (`buildingFloorRoomID`, `locationAddressID_byLocationAddresses`, `buildingName`, `floorLevelName`, `roomName`) VALUES (102, 1001, 'ΒΙΒΛΙΟΘΗΚΗ Τ.Ε.Ι.', 'ΙΣΟΓΕΙΟ', 'ΧΩΡΟΣ ΤΗΛΕΔΙΑΣΚΕΨΗΣ');
INSERT INTO `BuildingFloorRooms` (`buildingFloorRoomID`, `locationAddressID_byLocationAddresses`, `buildingName`, `floorLevelName`, `roomName`) VALUES (103, 1001, 'ΒΙΒΛΙΟΘΗΚΗ Τ.Ε.Ι.', 'ΙΣΟΓΕΙΟ', 'ΑΙΘΟΥΣΑ ΒΙΒΛΙΟΣΤΑΣΙΩΝ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `RoomTypes`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `RoomTypes` (`roomTypeID`, `roomTitle`, `roomCapacity`, `roomEquipment`, `otherDetails`) VALUES (11, 'ΑΜΦΙΘΕΑΤΡΟ', 100, 'προβολή φιλμ', NULL);
INSERT INTO `RoomTypes` (`roomTypeID`, `roomTitle`, `roomCapacity`, `roomEquipment`, `otherDetails`) VALUES (12, 'ΑΜΦΙΘΕΑΤΡΟ ΕΚΔΗΛΩΣΕΩΝ', 300, 'βίντεο παρουσίαση', NULL);
INSERT INTO `RoomTypes` (`roomTypeID`, `roomTitle`, `roomCapacity`, `roomEquipment`, `otherDetails`) VALUES (21, 'ΕΡΓΑΣΤΗΡΙΟ ΠΛΗΡΟΦΟΡΙΚΗΣ', 45, 'δίκτυο υπολογιστών', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ProfessorTitles`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `ProfessorTitles` (`professorTitleID`, `titleName`, `weekTeachHours`, `isStanding`, `otherDetails`) VALUES (11, 'ΚΑΘΗΓΗΤΗΣ', 10, 1, NULL);
INSERT INTO `ProfessorTitles` (`professorTitleID`, `titleName`, `weekTeachHours`, `isStanding`, `otherDetails`) VALUES (NULL, 'ΑΝΑΠΛΗΡΩΤΗΣ ΚΑΘΗΓΗΤΗΣ', 12, 1, NULL);
INSERT INTO `ProfessorTitles` (`professorTitleID`, `titleName`, `weekTeachHours`, `isStanding`, `otherDetails`) VALUES (NULL, 'ΕΠΙΚΟΥΡΟΣ ΚΑΘΗΓΗΤΗΣ', 14, 1, NULL);

COMMIT;

