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
  `buildingFloorRoomConcat` VARCHAR(48) NOT NULL,
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
  `locatAddreConcat` VARCHAR(64) NULL,
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
-- Table `EventTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EventTypes` ;

CREATE TABLE IF NOT EXISTS `EventTypes` (
  `eventTypeID` INT UNSIGNED NOT NULL,
  `eventTypeName` VARCHAR(45) NOT NULL,
  `totalDurationMinut` DECIMAL(4,0) NOT NULL,
  PRIMARY KEY (`eventTypeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE UNIQUE INDEX `eventTypeID_idx` ON `EventTypes` (`eventTypeID` ASC);


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
-- Table `JobTitles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JobTitles` ;

CREATE TABLE IF NOT EXISTS `JobTitles` (
  `jobTitleID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `jobTitleName` VARCHAR(45) NOT NULL,
  `jobStatusBonus` INT NOT NULL,
  PRIMARY KEY (`jobTitleID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `jobTitleID_UNIQUE` ON `JobTitles` (`jobTitleID` ASC);


-- -----------------------------------------------------
-- Table `Professors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Professors` ;

CREATE TABLE IF NOT EXISTS `Professors` (
  `professorID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `professorFullName` VARCHAR(72) NULL,
  `professorLastName` VARCHAR(45) NULL,
  `professorMiddleName` VARCHAR(45) NULL,
  `professorFirstName` VARCHAR(45) NULL,
  `professorShortName` VARCHAR(18) NULL,
  `identityCardCode` VARCHAR(11) NULL,
  `nationalTaxNum` MEDIUMINT NULL,
  `phoneNumber` VARCHAR(45) NULL,
  `emailAddress` VARCHAR(45) NULL,
  `locationAddressID_ofLocationAddresses` INT UNSIGNED NOT NULL,
  `professorTitleID_ofProfessorTitles` INT UNSIGNED NOT NULL,
  `jobTitleID_ofJobTitles` INT UNSIGNED NOT NULL,
  `otherDetails` VARCHAR(45) NULL,
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
    ON UPDATE CASCADE,
  CONSTRAINT `jobTitleID_ofJobTitles`
    FOREIGN KEY (`jobTitleID_ofJobTitles`)
    REFERENCES `JobTitles` (`jobTitleID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Available professors (Roster) as the staff of institution to be assigned lessons.';

CREATE UNIQUE INDEX `professorID` ON `Professors` (`professorID` ASC);

CREATE INDEX `locationAddressID_ofLocationAddresses_idx` ON `Professors` (`locationAddressID_ofLocationAddresses` ASC);

CREATE INDEX `professorTitleID_ofProfessorTitles_idx` ON `Professors` (`professorTitleID_ofProfessorTitles` ASC);

CREATE INDEX `jobTitleID_ofJobTitles_idx` ON `Professors` (`jobTitleID_ofJobTitles` ASC);


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
  `subjectAbbrev` VARCHAR(25) NULL,
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
  `schoolSectionAbbrev` VARCHAR(25) NOT NULL,
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
  `eventPlannedCourseID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventPlannedCourseAbbrev` VARCHAR(72) NOT NULL,
  `schoolID_ofSchools` INT UNSIGNED NOT NULL,
  `subjectID_ofSubjects` INT UNSIGNED NOT NULL,
  `teachMethodID_ofTeachMethods` INT UNSIGNED NOT NULL,
  `secretaryCode` INT NULL,
  `ECTS` INT NULL COMMENT 'διδακτικές πιστωτικές μονάδες που χρησιμοποιούνται για να καταμετρήσουν τα μαθήματα που έχει ολοκληρώσει ο φοιτητής',
  `otherDetails` VARCHAR(45) NULL,
  PRIMARY KEY (`eventPlannedCourseID`, `schoolID_ofSchools`, `subjectID_ofSubjects`, `teachMethodID_ofTeachMethods`),
  CONSTRAINT `subjectID_ofSubjects`
    FOREIGN KEY (`subjectID_ofSubjects`)
    REFERENCES `Subjects` (`subjectID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolID_ofSchools`
    FOREIGN KEY (`schoolID_ofSchools`)
    REFERENCES `Schools` (`schoolID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `teachMethodID_ofTeachMethods`
    FOREIGN KEY (`teachMethodID_ofTeachMethods`)
    REFERENCES `TeachMethods` (`teachMethodID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `subjectID_ofSubjects_idx` ON `EventPlannedCourses` (`subjectID_ofSubjects` ASC);

CREATE INDEX `schoolID_ofSchools_idx` ON `EventPlannedCourses` (`schoolID_ofSchools` ASC);

CREATE INDEX `teachMethodID_ofTeachMethods_idx` ON `EventPlannedCourses` (`teachMethodID_ofTeachMethods` ASC);

CREATE UNIQUE INDEX `eventPlannedCourseID_UNIQUE` ON `EventPlannedCourses` (`eventPlannedCourseID` ASC);


-- -----------------------------------------------------
-- Table `Days`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Days` ;

CREATE TABLE IF NOT EXISTS `Days` (
  `dayID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dayName` VARCHAR(45) NULL,
  `dayAbbrev` VARCHAR(45) NULL,
  PRIMARY KEY (`dayID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `dayID_idx` ON `Days` (`dayID` ASC);


-- -----------------------------------------------------
-- Table `TimeSlots`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TimeSlots` ;

CREATE TABLE IF NOT EXISTS `TimeSlots` (
  `timeSlotID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `timeSlotConcat` VARCHAR(64) NOT NULL,
  `daySlotStart` SET('Δε0800','Δε0900','Δε1000','Δε1100','Δε1200','Δε1300','Δε1400','Δε1500','Δε1600','Δε1700','Δε1800','Δε1900','Τρ0800','Τρ0900','Τρ1000','Τρ1100','Τρ1200','Τρ1300','Τρ1400','Τρ1500','Τρ1600','Τρ1700','Τρ1800','Τρ1900','Τε0800','Τε0900','Τε1000','Τε1100','Τε1200','Τε1300','Τε1400','Τε1500','Τε1600','Τε1700','Τε1800','Τε1900','Πε0800','Πε0900','Πε1000','Πε1100','Πε1200','Πε1300','Πε1400','Πε1500','Πε1600','Πε1700','Πε1800','Πε1900','Πα0800','Πα0900','Πα1000','Πα1100','Πα1200','Πα1300','Πα1400','Πα1500','Πα1600','Πα1700','Πα1800','Πα1900') NULL,
  `slotEndNumber` SET('0859','0959','1059','1159','1259','1359','1459','1559','1659','1759','1859','1959') NULL,
  `dayID` INT UNSIGNED NOT NULL,
  `eventTypeID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`timeSlotID`),
  CONSTRAINT `eventTypeID`
    FOREIGN KEY (`eventTypeID`)
    REFERENCES `EventTypes` (`eventTypeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `dayID`
    FOREIGN KEY (`dayID`)
    REFERENCES `Days` (`dayID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Time slot is the time from a chronological point and have a duration, the event time.';

CREATE UNIQUE INDEX `timeSlotID_idx` ON `TimeSlots` (`timeSlotID` ASC);

CREATE INDEX `eventTypeID_idx` ON `TimeSlots` (`eventTypeID` ASC);

CREATE INDEX `dayID_idx` ON `TimeSlots` (`dayID` ASC);


-- -----------------------------------------------------
-- Table `ScarceResources`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScarceResources` ;

CREATE TABLE IF NOT EXISTS `ScarceResources` (
  `scarceResourceID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `scarceResourceAbbrev` VARCHAR(72) NOT NULL,
  `locationAddressID_byLocationAddresses` INT UNSIGNED NOT NULL,
  `buildingFloorRoomID_byBuildingFloorRooms` INT UNSIGNED NOT NULL,
  `timeSlotID_byTimeSlots` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`scarceResourceID`, `locationAddressID_byLocationAddresses`, `buildingFloorRoomID_byBuildingFloorRooms`, `timeSlotID_byTimeSlots`),
  CONSTRAINT `locationAddressID_byLocationAddresses`
    FOREIGN KEY (`locationAddressID_byLocationAddresses`)
    REFERENCES `LocationAddresses` (`locationAddressID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `buildingFloorRoomID_byBuildingFloorRooms`
    FOREIGN KEY (`buildingFloorRoomID_byBuildingFloorRooms`)
    REFERENCES `BuildingFloorRooms` (`buildingFloorRoomID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `timeSlotID_byTimeSlots`
    FOREIGN KEY (`timeSlotID_byTimeSlots`)
    REFERENCES `TimeSlots` (`timeSlotID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `locationAddressID_byLocationAddresses_idx` ON `ScarceResources` (`locationAddressID_byLocationAddresses` ASC);

CREATE INDEX `buildingFloorRoomID_byBuildingFloorRooms_idx` ON `ScarceResources` (`buildingFloorRoomID_byBuildingFloorRooms` ASC);

CREATE UNIQUE INDEX `scarceResourcesID_UNIQUE` ON `ScarceResources` (`scarceResourceID` ASC);

CREATE INDEX `timeSlotID_byTimeSlots_idx` ON `ScarceResources` (`timeSlotID_byTimeSlots` ASC);


-- -----------------------------------------------------
-- Table `StudentGroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StudentGroups` ;

CREATE TABLE IF NOT EXISTS `StudentGroups` (
  `studentGroupID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentGroupName` VARCHAR(60) NULL COMMENT 'Student group name is the Title of the student group. The syntax of this  field  is like: ΕΞΑΜΗΝΟΥ ΖΖ ΟΜ' /* comment truncated */ /*�ΔΑ ΦΟΙΤΗΤΩΝ
In addition can be recorded as: ΚΑΙ ΠΕΡΑΣΜΕΝΩΝ ΕΞΑΜΗΝΩΝ
so that to add in the same group the students of older semesters which are still registered in the lesson.*/,
  `studentGroupAbbrev` VARCHAR(45) NULL,
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
  `schoolStudentGroupProfessorID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `schoolStudGroupProfesAbbrev` VARCHAR(72) NOT NULL,
  `schoolID_bySchools` INT UNSIGNED NOT NULL,
  `studentGroupID_byStudentGroups` INT UNSIGNED NOT NULL,
  `professorID_byProfessors` INT UNSIGNED NOT NULL,
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
-- Table `EventPlannedCourse_ScarceResource_ParticipantGroup_COMBIS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EventPlannedCourse_ScarceResource_ParticipantGroup_COMBIS` ;

CREATE TABLE IF NOT EXISTS `EventPlannedCourse_ScarceResource_ParticipantGroup_COMBIS` (
  `eventPlaCourseScarceResouParticiGroupID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventPlannedCourseID` INT UNSIGNED NOT NULL,
  `scarceResourceID` INT UNSIGNED NOT NULL,
  `schoolStudentGroupProfessorID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`eventPlaCourseScarceResouParticiGroupID`, `eventPlannedCourseID`, `scarceResourceID`, `schoolStudentGroupProfessorID`),
  CONSTRAINT `eventPlannedCourseID`
    FOREIGN KEY (`eventPlannedCourseID`)
    REFERENCES `EventPlannedCourses` (`eventPlannedCourseID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `scarceResourceID`
    FOREIGN KEY (`scarceResourceID`)
    REFERENCES `ScarceResources` (`scarceResourceID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `schoolStudentGroupProfessorID`
    FOREIGN KEY (`schoolStudentGroupProfessorID`)
    REFERENCES `SchoolStudentGroup_Professor_LINKS` (`schoolStudentGroupProfessorID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Event time scheduling in a Location of a room of the TEI with the registered Participants in the event.';

CREATE INDEX `eventPlannedCourseID_idx` ON `EventPlannedCourse_ScarceResource_ParticipantGroup_COMBIS` (`eventPlannedCourseID` ASC);

CREATE INDEX `scarceResourceID_idx` ON `EventPlannedCourse_ScarceResource_ParticipantGroup_COMBIS` (`scarceResourceID` ASC);

CREATE INDEX `schoolStudentGroupProfessorID` ON `EventPlannedCourse_ScarceResource_ParticipantGroup_COMBIS` (`schoolStudentGroupProfessorID` ASC);

CREATE UNIQUE INDEX `eventPlaCourseScarceResouParticiGroupID_UNIQUE` ON `EventPlannedCourse_ScarceResource_ParticipantGroup_COMBIS` (`eventPlaCourseScarceResouParticiGroupID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
