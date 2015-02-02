SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema eduschedul
-- -----------------------------------------------------
-- Educational Sheduling Database is the main schema element for storing data of Educational resources and stuff

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
COLLATE = utf8_general_ci
COMMENT = 'Location in terms of place of the event with Address of it.';

CREATE UNIQUE INDEX `locationAddressID` ON `LocationAddresses` (`locationAddressID` ASC);


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
-- Table `StudentGroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StudentGroups` ;

CREATE TABLE IF NOT EXISTS `StudentGroups` (
  `studentGroupID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentGroupName` VARCHAR(60) NULL COMMENT 'Student group name is the Title of the student group. The syntax of this  field  is like: ΕΞΑΜΗΝΟΥ ΖΖ ΟΜ' /* comment truncated */ /*�ΔΑ ΦΟΙΤΗΤΩΝ
In addition can be recorded as: ΚΑΙ ΠΕΡΑΣΜΕΝΩΝ ΕΞΑΜΗΝΩΝ
so that to add in the same group the students of older semesters which are still registered in the lesson.*/,
  PRIMARY KEY (`studentGroupID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Student groups have the group of stutents in semester categorization. ' /* comment truncated */ /*Student groups  table  could be connected with the Student table, in a seperate  database.*/;

CREATE UNIQUE INDEX `studentGroupID` ON `StudentGroups` (`studentGroupID` ASC);


-- -----------------------------------------------------
-- Table `Schools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Schools` ;

CREATE TABLE IF NOT EXISTS `Schools` (
  `schoolID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `schoolSectionName` VARCHAR(45) NOT NULL,
  `locatAddressID_byLocationAddresses` INT UNSIGNED NOT NULL,
  `studentGroupID_byStudentGroups` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`schoolID`, `studentGroupID_byStudentGroups`),
  CONSTRAINT `locatAddressID_byLocationAddresses`
    FOREIGN KEY (`locatAddressID_byLocationAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `studentGroupID_byStudentGroups`
    FOREIGN KEY (`studentGroupID_byStudentGroups`)
    REFERENCES `StudentGroups` (`studentGroupID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Schools of the institution:  Σχολές με τα τμήματα που λειτουργούν στην σχολή και η διεύθηνση που εδρεύουν. Υπάρχει περίπτωση να υπάρχουν πρώην σχολές που σταμάτησαν να λειτουργούν πρόσφατα.';

CREATE UNIQUE INDEX `schoolID` ON `Schools` (`schoolID` ASC);

CREATE INDEX `locatAddressID_byLocationAddresses_idx` ON `Schools` (`locatAddressID_byLocationAddresses` ASC);

CREATE INDEX `studentGroupID_byStudentGroups_idx` ON `Schools` (`studentGroupID_byStudentGroups` ASC);


-- -----------------------------------------------------
-- Table `ProfessorTitles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProfessorTitles` ;

CREATE TABLE IF NOT EXISTS `ProfessorTitles` (
  `professorTitleID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titleName` VARCHAR(45) NULL,
  `weekTeachHours` INT NULL,
  `isStanding` SET('ΝΑΙ','ΟΧΙ') NOT NULL DEFAULT 'ΟΧΙ' COMMENT 'is standing this title of professor? gives the permanent of the title or not',
  `otherDetails` VARCHAR(45) NULL,
  PRIMARY KEY (`professorTitleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Institution Academic Titles of the Professors:  Ακαδιμαϊκοί τίτλοι του Τ.Ε.Ι. στους μόνιμους εκπαιδευτικούς αλλά και στους έκτακτους εκπαιδευτικούς.';

CREATE UNIQUE INDEX `professorTitleID_UNIQUE` ON `ProfessorTitles` (`professorTitleID` ASC);


-- -----------------------------------------------------
-- Table `Professors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Professors` ;

CREATE TABLE IF NOT EXISTS `Professors` (
  `professorID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `professorLastName` VARCHAR(45) NULL,
  `professorMiddleName` VARCHAR(45) NULL,
  `professorFirstName` VARCHAR(45) NULL,
  `jobTitle` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `phoneNumber` VARCHAR(45) NULL,
  `emailAddress` VARCHAR(45) NULL,
  `otherDetails` VARCHAR(45) NULL,
  `locationAddressID_ofLocationAddresses` INT UNSIGNED NOT NULL,
  `professorTitleID_ofProfessorTitles` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`professorID`),
  CONSTRAINT `locationAddressID_ofLocationAddresses`
    FOREIGN KEY (`locationAddressID_ofLocationAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `professorTitleID_ofProfessorTitles`
    FOREIGN KEY (`professorTitleID_ofProfessorTitles`)
    REFERENCES `ProfessorTitles` (`professorTitleID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Available professors as the staff of institution to be assigned lessons.';

CREATE UNIQUE INDEX `professorID` ON `Professors` (`professorID` ASC);

CREATE INDEX `locationAddressID_ofLocationAddresses_idx` ON `Professors` (`locationAddressID_ofLocationAddresses` ASC);

CREATE INDEX `professorTitleID_ofProfessorTitles_idx` ON `Professors` (`professorTitleID_ofProfessorTitles` ASC);


-- -----------------------------------------------------
-- Table `SchoolStudentGroups_Professors_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SchoolStudentGroups_Professors_LINKS` ;

CREATE TABLE IF NOT EXISTS `SchoolStudentGroups_Professors_LINKS` (
  `schoolID_bySchools` INT UNSIGNED NOT NULL,
  `studentGroupID_bySchools` INT UNSIGNED NOT NULL,
  `professorID_byProfessors` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`schoolID_bySchools`, `studentGroupID_bySchools`, `professorID_byProfessors`),
  CONSTRAINT `schoolID_studentGroupID_bySchools`
    FOREIGN KEY (`schoolID_bySchools` , `studentGroupID_bySchools`)
    REFERENCES `Schools` (`schoolID` , `studentGroupID_byStudentGroups`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `professorID_byProfessors`
    FOREIGN KEY (`professorID_byProfessors`)
    REFERENCES `Professors` (`professorID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `professorID_byProfessors_idx` ON `SchoolStudentGroups_Professors_LINKS` (`professorID_byProfessors` ASC);

CREATE INDEX `schoolID_studentGroupID_bySchools_idx` ON `SchoolStudentGroups_Professors_LINKS` (`schoolID_bySchools` ASC, `studentGroupID_bySchools` ASC);


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
-- Table `LocationAddresses_RoomTypes_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LocationAddresses_RoomTypes_LINKS` ;

CREATE TABLE IF NOT EXISTS `LocationAddresses_RoomTypes_LINKS` (
  `locationAddressID_fromLocationAddresses` INT UNSIGNED NOT NULL,
  `roomTypeID_fromRoomTypes` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`locationAddressID_fromLocationAddresses`, `roomTypeID_fromRoomTypes`),
  CONSTRAINT `locationAddressID_fromLocationAddresses`
    FOREIGN KEY (`locationAddressID_fromLocationAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `roomTypeID_fromRoomTypes`
    FOREIGN KEY (`roomTypeID_fromRoomTypes`)
    REFERENCES `RoomTypes` (`roomTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `roomTypeID_fromRoomTypes_idx` ON `LocationAddresses_RoomTypes_LINKS` (`roomTypeID_fromRoomTypes` ASC);

CREATE INDEX `locationAddressID_fromLocationAddresses_idx` ON `LocationAddresses_RoomTypes_LINKS` (`locationAddressID_fromLocationAddresses` ASC);


-- -----------------------------------------------------
-- Table `levels`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `levels` ;

CREATE TABLE IF NOT EXISTS `levels` (
  `levelID` INT NOT NULL,
  `levelTitle` SET('ΜΕΤΑΠΤΥΧΙΑΚΟ','ΠΡΟΠΤΥΧΙΑΚΟ','ΕΞΑΜΗΝΟΥ Α ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Β ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Γ ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Δ ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Ε ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ ΣΤ ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Ζ ΜΑΘΗΜΑ','ΕΞΑΜΗΝΟΥ Η ΜΑΘΗΜΑ') NULL DEFAULT 'ΠΡΟΠΤΥΧΙΑΚΟ' COMMENT 'Levels is the field showing the level in the time period of degree.',
  PRIMARY KEY (`levelID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Subjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Subjects` ;

CREATE TABLE IF NOT EXISTS `Subjects` (
  `subjectID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `subjectName` VARCHAR(45) NULL,
  `description` VARCHAR(60) NULL,
  `weekTeach` INT NULL COMMENT 'εβδομαδιαίες ώρες διδασκαλίας',
  `otherDetails` VARCHAR(60) NULL,
  `levelID` INT NOT NULL,
  PRIMARY KEY (`subjectID`),
  CONSTRAINT `levelID`
    FOREIGN KEY (`levelID`)
    REFERENCES `levels` (`levelID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Subjects of lessons that involves the academic institution.';

CREATE UNIQUE INDEX `subjectID_idx` ON `Subjects` (`subjectID` ASC);

CREATE INDEX `levelID_idx` ON `Subjects` (`levelID` ASC);


-- -----------------------------------------------------
-- Table `TeachMethods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TeachMethods` ;

CREATE TABLE IF NOT EXISTS `TeachMethods` (
  `teachMethodID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `teachMethodTitle` VARCHAR(45) NOT NULL,
  `otherDetails` VARCHAR(45) NULL,
  PRIMARY KEY (`teachMethodID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'It is, what kind of teaching will use the professor in the time of event.';

CREATE UNIQUE INDEX `teachMethodID` ON `TeachMethods` (`teachMethodID` ASC);


-- -----------------------------------------------------
-- Table `EventPlannedCourses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EventPlannedCourses` ;

CREATE TABLE IF NOT EXISTS `EventPlannedCourses` (
  `schoolID` INT UNSIGNED NOT NULL,
  `subjectID` INT UNSIGNED NOT NULL,
  `teachMethodID_byTeachMethods` INT UNSIGNED NOT NULL,
  `secretaryCode` INT NULL,
  `ECTS` INT NULL COMMENT 'διδακτικές πιστωτικές μονάδες που χρησιμοποιούνται για να καταμετρήσουν τα μαθήματα που έχει ολοκληρώσει ο φοιτητής',
  `otherDetails` VARCHAR(45) NULL,
  PRIMARY KEY (`schoolID`, `subjectID`, `teachMethodID_byTeachMethods`),
  CONSTRAINT `subjectID`
    FOREIGN KEY (`subjectID`)
    REFERENCES `Subjects` (`subjectID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolID`
    FOREIGN KEY (`schoolID`)
    REFERENCES `Schools` (`schoolID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `teachMethodID_byTeachMethods`
    FOREIGN KEY (`teachMethodID_byTeachMethods`)
    REFERENCES `TeachMethods` (`teachMethodID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `subjectID_idx` ON `EventPlannedCourses` (`subjectID` ASC);

CREATE INDEX `schoolID_idx` ON `EventPlannedCourses` (`schoolID` ASC);

CREATE INDEX `teachMethodID_byTeachMethods_idx` ON `EventPlannedCourses` (`teachMethodID_byTeachMethods` ASC);


-- -----------------------------------------------------
-- Table `EventTimeUnits_LocationRooms_ParticipantGroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EventTimeUnits_LocationRooms_ParticipantGroups` ;

CREATE TABLE IF NOT EXISTS `EventTimeUnits_LocationRooms_ParticipantGroups` (
  `timeUnitID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `schoolID_byEvePlaCourses` INT UNSIGNED NOT NULL,
  `subjectID_byEvePlaCourses` INT UNSIGNED NOT NULL,
  `teachMethodID_byEvePlaCourses` INT UNSIGNED NOT NULL,
  `locationAddressID_byLocAddreRooTypeLINKS` INT UNSIGNED NOT NULL,
  `roomTypeID_byLocAddreRooTypeLINKS` INT UNSIGNED NOT NULL,
  `schoolID_bySchoolStudentGrouProfesLINKS` INT UNSIGNED NOT NULL,
  `studentGroupID_bySchoolStudentGrouProfesLINKS` INT UNSIGNED NOT NULL,
  `professorID_bySchoolStudentGrouProfesLINKS` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`timeUnitID`),
  CONSTRAINT `schoolID_studeGroupID_profesID_bySchooStudeGrouProfLINKS`
    FOREIGN KEY (`schoolID_bySchoolStudentGrouProfesLINKS` , `studentGroupID_bySchoolStudentGrouProfesLINKS` , `professorID_bySchoolStudentGrouProfesLINKS`)
    REFERENCES `SchoolStudentGroups_Professors_LINKS` (`schoolID_bySchools` , `studentGroupID_bySchools` , `professorID_byProfessors`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `locationAddressID_roomTypeID_byLocAddreRooTypeLINKS`
    FOREIGN KEY (`locationAddressID_byLocAddreRooTypeLINKS` , `roomTypeID_byLocAddreRooTypeLINKS`)
    REFERENCES `LocationAddresses_RoomTypes_LINKS` (`locationAddressID_fromLocationAddresses` , `roomTypeID_fromRoomTypes`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolID_subjectID_teachMethodID_byEvePlaCourses`
    FOREIGN KEY (`schoolID_byEvePlaCourses` , `subjectID_byEvePlaCourses` , `teachMethodID_byEvePlaCourses`)
    REFERENCES `EventPlannedCourses` (`schoolID` , `subjectID` , `teachMethodID_byTeachMethods`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Event time scheduling in a Location of a room of the TEI with the registered Participants in the event.';

CREATE UNIQUE INDEX `timeUnitID_idx` ON `EventTimeUnits_LocationRooms_ParticipantGroups` (`timeUnitID` ASC);

CREATE INDEX `schoolID_studeGroupID_profesID_bySchooStudeGrouProfLINKS_idx` ON `EventTimeUnits_LocationRooms_ParticipantGroups` (`schoolID_bySchoolStudentGrouProfesLINKS` ASC, `studentGroupID_bySchoolStudentGrouProfesLINKS` ASC, `professorID_bySchoolStudentGrouProfesLINKS` ASC);

CREATE INDEX `locationAddressID_roomTypeID_byLocAddreRooTypeLINKS_idx` ON `EventTimeUnits_LocationRooms_ParticipantGroups` (`locationAddressID_byLocAddreRooTypeLINKS` ASC, `roomTypeID_byLocAddreRooTypeLINKS` ASC);

CREATE INDEX `schoolID_subjectID_teachMethodID_byEvePlaCourses_idx` ON `EventTimeUnits_LocationRooms_ParticipantGroups` (`schoolID_byEvePlaCourses` ASC, `subjectID_byEvePlaCourses` ASC, `teachMethodID_byEvePlaCourses` ASC);


-- -----------------------------------------------------
-- Table `EventTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EventTypes` ;

CREATE TABLE IF NOT EXISTS `EventTypes` (
  `eventTypeID` INT UNSIGNED NOT NULL,
  `eventTypeName` VARCHAR(45) NOT NULL,
  `totalDuration` TIME NOT NULL,
  PRIMARY KEY (`eventTypeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE UNIQUE INDEX `eventTypeID_idx` ON `EventTypes` (`eventTypeID` ASC);


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
    REFERENCES `EventPlannedCourses` (`schoolID` , `subjectID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `teachMethod`
    FOREIGN KEY (`teachMethodID`)
    REFERENCES `TeachMethods` (`teachMethodID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `teachMethodID_idx` ON `SchoolSubject_TeachMethod_LINKS` (`teachMethodID` ASC);

CREATE INDEX `schoolID_subjectID_idx` ON `SchoolSubject_TeachMethod_LINKS` (`schoolID` ASC, `subjectID` ASC);


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
  `timeUnitID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`timeSlotID`, `dayID`, `weekID`, `monthID`, `academPeriodID`, `academYearID`),
  CONSTRAINT `timeUnitID`
    FOREIGN KEY (`timeUnitID`)
    REFERENCES `EventTimeUnits_LocationRooms_ParticipantGroups` (`timeUnitID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Time slot is the time from a chronological point and have a duration, the event time.';

CREATE UNIQUE INDEX `timeSlotID_idx` ON `TimeSlots` (`timeSlotID` ASC);

CREATE INDEX `timeUnitID_idx` ON `TimeSlots` (`timeUnitID` ASC);


-- -----------------------------------------------------
-- Table `InstitutionDepartments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InstitutionDepartments` ;

CREATE TABLE IF NOT EXISTS `InstitutionDepartments` (
  `ιnstituDepartID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `instituDepartTitle` VARCHAR(45) NULL,
  PRIMARY KEY (`ιnstituDepartID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Institution departments are every functional part of the organization, as the secretary, the technical support team. ' /* comment truncated */ /*Επίσης συμπεριλαμβάνονται και οι σχολές του ΤΕΙ ως ξεχωριστό εκπαιδευτικό πεδίο μάθησης.*/;

CREATE UNIQUE INDEX `ιnstituDepartID_UNIQUE` ON `InstitutionDepartments` (`ιnstituDepartID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
