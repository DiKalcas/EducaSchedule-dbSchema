SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema eduschedul
-- -----------------------------------------------------
-- Educational Sheduling Database is the main schema element for storing data of Educational resources and stuff

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
-- Table `BuildingFloorRooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BuildingFloorRooms` ;

CREATE TABLE IF NOT EXISTS `BuildingFloorRooms` (
  `buildingFloorRoomID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `buildingName` VARCHAR(45) NULL,
  `floorLevelName` VARCHAR(45) NULL,
  `roomName` VARCHAR(45) NULL,
  `roomTypeID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`buildingFloorRoomID`),
  CONSTRAINT `roomTypeID`
    FOREIGN KEY (`roomTypeID`)
    REFERENCES `RoomTypes` (`roomTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'The Buildings of the institution with the Floors of them, and the rooms available for educational activities:  Τα κτήρια του Τ.Ε.Ι. με τους ορόφους του κάθε κτηρίου και οι διαθέσιμες αίθουσες του κάθε ορόφου για διδασκαλία μαθημάτων ή άλλες εκπαιδευτικές δραστηριότητες.';

CREATE UNIQUE INDEX `buildingFloorRoomID_idx` ON `BuildingFloorRooms` (`buildingFloorRoomID` ASC);

CREATE INDEX `roomTypeID_idx` ON `BuildingFloorRooms` (`roomTypeID` ASC);


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
-- Table `Schools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Schools` ;

CREATE TABLE IF NOT EXISTS `Schools` (
  `schoolID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `schoolSectionName` VARCHAR(45) NOT NULL,
  `locatAddressID_byLocationAddresses` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`schoolID`),
  CONSTRAINT `locatAddressID_byLocationAddresses`
    FOREIGN KEY (`locatAddressID_byLocationAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Schools of the institution:  Σχολές με τα τμήματα που λειτουργούν στην σχολή και η διεύθηνση που εδρεύουν. Υπάρχει περίπτωση να υπάρχουν πρώην σχολές που σταμάτησαν να λειτουργούν πρόσφατα.';

CREATE UNIQUE INDEX `schoolID` ON `Schools` (`schoolID` ASC);

CREATE INDEX `locatAddressID_byLocationAddresses_idx` ON `Schools` (`locatAddressID_byLocationAddresses` ASC);


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
  `eventPlannedCourseID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`eventPlannedCourseID`, `schoolID`, `subjectID`, `teachMethodID_byTeachMethods`),
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

CREATE UNIQUE INDEX `EventPlannedCourseID_UNIQUE` ON `EventPlannedCourses` (`eventPlannedCourseID` ASC);


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
  `professorShortName` VARCHAR(45) NULL,
  `professorLastName` VARCHAR(45) NULL,
  `professorMiddleName` VARCHAR(45) NULL,
  `professorFirstName` VARCHAR(45) NULL,
  `jobTitle` VARCHAR(45) NULL,
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
-- Table `SchoolStudentGroup_Professor_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SchoolStudentGroup_Professor_LINKS` ;

CREATE TABLE IF NOT EXISTS `SchoolStudentGroup_Professor_LINKS` (
  `schoolID_bySchools` INT UNSIGNED NOT NULL,
  `studentGroupID_byStudentGroups` INT UNSIGNED NOT NULL,
  `professorID_byProfessors` INT UNSIGNED NOT NULL,
  `schoolStudentGroupProfessorID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`schoolStudentGroupProfessorID`, `schoolID_bySchools`, `studentGroupID_byStudentGroups`, `professorID_byProfessors`),
  CONSTRAINT `schoolID_bySchools`
    FOREIGN KEY (`schoolID_bySchools`)
    REFERENCES `Schools` (`schoolID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `professorID_byProfessors`
    FOREIGN KEY (`professorID_byProfessors`)
    REFERENCES `Professors` (`professorID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `studentGroupID_byStudentGroups`
    FOREIGN KEY (`studentGroupID_byStudentGroups`)
    REFERENCES `StudentGroups` (`studentGroupID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `professorID_byProfessors_idx` ON `SchoolStudentGroup_Professor_LINKS` (`professorID_byProfessors` ASC);

CREATE INDEX `schoolID_bySchools_idx` ON `SchoolStudentGroup_Professor_LINKS` (`schoolID_bySchools` ASC);

CREATE INDEX `studentGroupID_byStudentGroups_idx` ON `SchoolStudentGroup_Professor_LINKS` (`studentGroupID_byStudentGroups` ASC);

CREATE UNIQUE INDEX `SchoolStudentGroupProfessorID_UNIQUE` ON `SchoolStudentGroup_Professor_LINKS` (`schoolStudentGroupProfessorID` ASC);


-- -----------------------------------------------------
-- Table `LocationAddress_BuildingFloorRoom_LINKS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LocationAddress_BuildingFloorRoom_LINKS` ;

CREATE TABLE IF NOT EXISTS `LocationAddress_BuildingFloorRoom_LINKS` (
  `locationAddressID_fromLocationAddresses` INT UNSIGNED NOT NULL,
  `buildingFloorRoomID_fromBuildingFloorRooms` INT UNSIGNED NOT NULL,
  `locatAddressBuildingFloorRoomID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`locatAddressBuildingFloorRoomID`, `locationAddressID_fromLocationAddresses`, `buildingFloorRoomID_fromBuildingFloorRooms`),
  CONSTRAINT `locationAddressID_fromLocationAddresses`
    FOREIGN KEY (`locationAddressID_fromLocationAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `buildingFloorRoomID_fromBuildingFloorRooms`
    FOREIGN KEY (`buildingFloorRoomID_fromBuildingFloorRooms`)
    REFERENCES `BuildingFloorRooms` (`buildingFloorRoomID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `locationAddressID_fromLocationAddresses_idx` ON `LocationAddress_BuildingFloorRoom_LINKS` (`locationAddressID_fromLocationAddresses` ASC);

CREATE INDEX `buildingFloorRoomID_fromBuildingFloorRooms_idx` ON `LocationAddress_BuildingFloorRoom_LINKS` (`buildingFloorRoomID_fromBuildingFloorRooms` ASC);

CREATE UNIQUE INDEX `locatAddressBuildingFloorRoomID_UNIQUE` ON `LocationAddress_BuildingFloorRoom_LINKS` (`locatAddressBuildingFloorRoomID` ASC);


-- -----------------------------------------------------
-- Table `EventTimeUnit_LocationRoom_ParticipantGroup_COMBIS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EventTimeUnit_LocationRoom_ParticipantGroup_COMBIS` ;

CREATE TABLE IF NOT EXISTS `EventTimeUnit_LocationRoom_ParticipantGroup_COMBIS` (
  `eventPlannedCourseID` INT UNSIGNED NOT NULL,
  `locatAddressBuildingFloorRoomID` INT UNSIGNED NOT NULL,
  `schoolStudentGroupProfessorID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`eventPlannedCourseID`, `locatAddressBuildingFloorRoomID`, `schoolStudentGroupProfessorID`),
  CONSTRAINT `EventPlannedCourseID`
    FOREIGN KEY (`eventPlannedCourseID`)
    REFERENCES `EventPlannedCourses` (`eventPlannedCourseID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `SchoolStudentGroupProfessorID`
    FOREIGN KEY (`schoolStudentGroupProfessorID`)
    REFERENCES `SchoolStudentGroup_Professor_LINKS` (`schoolStudentGroupProfessorID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `locatAddressBuildingFloorRoomID`
    FOREIGN KEY (`locatAddressBuildingFloorRoomID`)
    REFERENCES `LocationAddress_BuildingFloorRoom_LINKS` (`locatAddressBuildingFloorRoomID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Event time scheduling in a Location of a room of the TEI with the registered Participants in the event.';

CREATE INDEX `EventPlannedCourseID_idx` ON `EventTimeUnit_LocationRoom_ParticipantGroup_COMBIS` (`eventPlannedCourseID` ASC);

CREATE INDEX `SchoolStudentGroupProfessorID_idx` ON `EventTimeUnit_LocationRoom_ParticipantGroup_COMBIS` (`schoolStudentGroupProfessorID` ASC);

CREATE INDEX `locatAddressBuildingFloorRoomID_idx` ON `EventTimeUnit_LocationRoom_ParticipantGroup_COMBIS` (`locatAddressBuildingFloorRoomID` ASC);


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
  PRIMARY KEY (`timeSlotID`, `dayID`, `weekID`, `monthID`, `academPeriodID`, `academYearID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Time slot is the time from a chronological point and have a duration, the event time.';

CREATE UNIQUE INDEX `timeSlotID_idx` ON `TimeSlots` (`timeSlotID` ASC);


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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
