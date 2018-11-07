# Educational Activities Scheduling Database schema
Database schema for educational resources for Chronological scheduling. __Greek language text:__

# Σχεδίαση ΒΔ Ακαδημαϊκού δικτύου
Είναι πολύ σημαντικό κατά την φάση της ανάπτυξης της Βάσης Δεδομένων να γίνει σχεδίαση του μοντέλου όπου θα αποτυπώνονται οι οντότητες του μοντέλου. Επίσης θα αποτυπώνονται οι σχέσεις των οντοτήτων με ειδικές οντότητες συσχετιστικές. Αυτές οι οντότητες έχουν χαρακτηριστικά από τις δύο οντότητες που συσχετίζουν.

  Κατά την σχεδίαση μέθοδος για να βοηθήσει να ανακαλύψουμε τις οντότητες του μοντέλου είναι η καταγραφή ερωτήσεων, που θα δίνουν απαντήσεις σημαντικές για το πρόβλημα της πραγματικότητας, που λύνει η εφαρμογή. Στην περίπτωση της γραμματειακής εφαρμογής του Ακαδημαϊκού δικτύου που αναλύουμε κάποια βασικά ερωτήματα είναι:
 - Πόσοι διαθέσιμοι για διδασκαλία, καθηγητές υπάρχουν;
 - Πόσα μαθήματα υπάρχουν στο πρόγραμμα να διδαχτούν;
 - Ποιοι καθηγητές είναι ανατεθειμένοι σε κάθε μάθημα;
 - Ποιες σχολές υπάρχουν στο ίδρυμα;
 - Ποιοι είναι οι καθηγητές που διδάσκουν σε κάθε σχολή;
 - Ποιες είναι οι εργασίες που έχουν αναλάβει φοιτητές;
 - Κάθε εργασία σε ποιους καθηγητές έχει δοθεί για εισήγηση;
 
 Το μοντέλο που σχεδιάστηκε έχει ως βασική οντότητα τους καθηγητές και τους συσχετίζει με τα μαθήματα, τις σχολές, τις εργασίες και λοιπά. Σημαντικό χαρακτηριστικό της κάθε οντότητας είναι το μοναδικό αναγνωριστικό της. Μπορεί να είναι ένας κωδικός που αυτόματα δίνεται από το σύστημα. Επίσης μπορεί να δοθεί και κατά την εισαγωγή για παράδειγμα νέου καθηγητή και να χρησιμοποιηθεί το ΑΦΜ του ως μοναδικό αναγνωριστικό.

Σχεδιάγραμμα 6: Φυσικό μοντέλο δεδομένων Ακαδημαϊκού δικτύου Οντοτήτων-Συσχετίσεων

Μετά από λεπτομερή ανάλυση και παραδειγματισμός από λύσεις χρόνο-προγραμματισμού σχεδιάστηκαν μοντέλα που αποτυπώνουν τα μέρη του ακαδημαϊκού δικτύου. Έτσι δημιουργήθηκε μοντέλο που περιλαμβάνει τους καθηγητές και τους φοιτητές ως ομάδες εξαμήνου. Επίσης δημιουργήθηκε μοντέλο που περιλαμβάνει τμήματα σχολών και μαθήματα που είναι προγραμματισμένα να διδαχθούν. Τέλος δημιουργήθηκε μοντέλο για να γίνει εφικτή η διαχείριση των αιθουσών που είναι διαθέσιμες σε συγκεκριμένες ώρες της ημέρας. Τα επιμέρους μοντέλα είναι τα μέρη που συνδυάζονται σε κεντρική οντότητα που κάθε αντικείμενο της (εγγραφή πίνακα) συντάσσει μια ακαδημαϊκή δραστηριότητα ως γεγονός που έχει συγκεκριμένη χρονική διάρκεια και λαμβάνει χώρα σε συγκεκριμένη αίθουσα του ιδρύματος, για να διδαχθεί το μέρος του μαθήματος (module) στους συμμετέχοντες φοιτητές από τον καθηγητή. Δηλαδή, υλοποιεί μοντέλο χρόνο-προγραμματισμού γεγονότος, με χρονική διάρκεια, τον σκοπό και τους συμμετέχοντες (event time, unit, participants).

## Μοντέλο συμμετεχόντων
  Το μοντέλο των συμμετεχόντων στο γεγονός περιλαμβάνει οντότητες του ακαδημαϊκού δικτύου που εμπλέκονται σε εκπαιδευτική δραστηριότητα του ιδρύματος. Έτσι, η οντότητα Professors που αποθηκεύει καθηγητές είναι από τις κύριες του μοντέλου και έχει όλα τα χαρακτηριστικά-στοιχεία του κάθε εργαζόμενου στο ίδρυμα, διαθέσιμου καθηγητή. Τα στοιχεία που έχουν να κάνουν με ΑΦΜ, αριθμό ταυτότητας και διεύθυνση χρειάζονται για την σύμβαση που υπογράφεται στην αρχή της περιόδου από τους συμβασιούχους καθηγητές. Η οντότητα Professor titles των τίτλων καθηγητών έχει τις βαθμίδες των καθηγητών και αν πρόκειται για μόνιμο ή έκτακτο προσωπικό του οργανισμού. Όσο αφορά τους φοιτητές ως συμμετέχοντες υπάρχουν σε επίπεδο ομάδων εξαμήνου και κάθε εξάμηνο σε επιμέρους ομάδες για να μπορούν να οργανωθούν διδασκαλίες μαθημάτων σε αίθουσες, όταν το πλήθος των εγγεγραμμένων μαθητών υπερβαίνει την ικανότητα σε θέσεις της αίθουσας.

Σχεδιάγραμμα 7: μοντέλο των συμμετεχόντων στην εκπαιδευτική δραστηριότητα

  Τέλος, το μοντέλο ολοκληρώνεται με την συσχετική οντότητα που συσχετίζει τμήμα σχολής με ομάδα φοιτητών και καθηγητή. Η οντότητα των τμημάτων σχολών υπάρχει σε μοντέλο που περιλαμβάνει τα μαθήματα.
Παράδειγμα SQL εντολών για την δημιουργία του πίνακα της βάσης, που υλοποιεί την οντότητα των τίτλων των καθηγητών, δηλαδή τις βαθμίδες που μπορεί να έχει ο καθηγητής στο εκπαιδευτικό ίδρυμα.
```sql
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
```
Παράδειγμα SQL εντολών για την δημιουργία του πίνακα της βάσης, που υλοποιεί την οντότητα των καθηγητών με τα στοιχεία που αποθηκεύονται για κάθε καθηγητή.
```sql
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
```
Παράδειγμα SQL εντολών για την δημιουργία του πίνακα της βάσης που υλοποιεί την οντότητα που συσχετίζει τμήμα σχολής με ομάδα φοιτητών και καθηγητή. Η οντότητα έχει μοναδικό αναγνωριστικό για να μπορέσει να χαρακτηρίσει ως ομάδα συμμετεχόντων το τμήμα σχολής με τους φοιτητές και τον καθηγητή. Δηλαδή γίνεται ενοποίηση των επιμέρους αντικειμένων σε ένα για να μπορούμε να αναφερθούμε σ’ αυτό με τον κωδικό της βάσης.

## Μοντέλο ακαδημαϊκών πόρων όχι διαθέσιμων (scarce resources)
Σημαντικό ρόλο παίζει το μοντέλο (Σχεδιάγραμμα 7) που περιγράφει και διαχειρίζεται τους σπάνιους, με την έννοια του όχι διαθέσιμους ακαδημαϊκούς πόρους. Σ’ αυτό υπάρχει οντότητα Room types που περιγράφει τον τύπο των αιθουσών που υπάρχουν στις εγκαταστάσεις του οργανισμού, παράδειγμα Αίθουσα διάλεξης, Αμφιθέατρο και λοιπά. Επίσης υπάρχει οντότητα Building-floor-rooms που δίνει την δυνατότητα να αποθηκευτούν  τα κτίρια των εγκαταστάσεων. Στο μοντέλο αυτό υπάρχει η οντότητα Location addresses που περιγράφει τοποθεσίες ως διευθύνσεις των σχολών του ιδρύματος, των καθηγητών και λοιπά. Η συσχετική οντότητα Scarce resources ενοποιεί τις επιμέρους οντότητες προσθέτοντας την οντότητα Time slot ως παράμετρο που χαρακτηρίζει τον χρόνο. Οπότε σε συνεργασία τα τοπικά χαρακτηριστικά του μοντέλου με τα χρονικά χαρακτηριστικά δίνουν στον προγραμματισμό γεγονότων τόπο και χρόνο.
Παράδειγμα SQL εντολών για δημιουργία πίνακα που υλοποιεί την οντότητα του μοντέλου που περιγράφει διευθύνσεις τοποθεσίας με στοιχεία όπως η πόλη, η περιοχή, ο ταχυδρομικός κωδικός και άλλα.
```sql
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
```
Παράδειγμα SQL εντολών που δημιουργεί πίνακα που υλοποιεί την συσχετική οντότητα του μοντέλου. Το στοιχείο του πίνακα Time slot δίνει την χρονοθυρίδα που είναι προγραμματισμένο να εκτελεστεί το γεγονός.
```sql
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
```

Σχεδιάγραμμα 8: μοντέλο οντοτήτων ακαδημαϊκών πόρων με χαρακτηριστικά scarce resources

## Μοντέλο θεμάτων & σχολών
Όσο αφορά το μάθημα ως αιτία του γεγονότος που χρόνο-προγραμματίζεται σχεδιάστηκε το μοντέλο (Σχεδιάγραμμα 8) που περιγράφει με λεπτομέρεια τα θέματα διδασκαλίας. Πρόκειται για την οντότητα Subjects του μοντέλου που περιγράφει τα θέματα διδασκαλίας που ασχολείται το εκπαιδευτικό ίδρυμα. Το κάθε θέμα διδασκαλίας έχει την ονομασία, την περιγραφή, τις εβδομαδιαίες ώρες που χρειάζεται για να διδαχθεί και το επίπεδο κατά τη διάρκεια φοίτησης που πρέπει να έχει ο φοιτητής, ώστε να μπορεί να το αναλάβει. Υπάρχει η οντότητα Teach methods που περιγράφει τις μεθόδους διδασκαλίας που εφαρμόζονται, όπως η διάλεξη μαθήματος, εργαστήριο, φροντιστήριο και λοιπά. Στο μοντέλο αυτό υπάρχει και η οντότητα Schools που περιγράφει τα τμήματα σχολών του εκπαιδευτικού ιδρύματος.

Σχεδιάγραμμα 9: μοντέλο θεμάτων διδασκαλίας και τμημάτων σχολών ΤΕΙ

  Τέλος υπάρχει η συσχετιστική οντότητα που ενοποιεί τις επιμέρους οντότητες του μοντέλου. Έχει δικό της μοναδικό αναγνωριστικό κωδικό για να χαρακτηρίζει το κάθε αντικείμενο που αποθηκεύει ως μάθημα τμήματος σχολής που θα διδαχθεί με συγκεκριμένη μέθοδο (module).
Παραδείγματα SQL εντολών για την δημιουργία πίνακα που υλοποιεί τις οντότητες θεμάτων διδασκαλίας του εκπαιδευτικού ιδρύματος.
```sql
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
```
Παραδείγματα SQL εντολών για την δημιουργία πίνακα που υλοποιεί την συσχετική οντότητα του μοντέλου και προσθέτει κάποια χαρακτηριστικά ακόμα όπως το ECTS για κάθε μεμονωμένο μάθημα.
```sql
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
```
## Κεντρική συσχετική οντότητα
Σύμφωνα με την σχεδίαση των επιμέρους μοντέλων για να επιτευχθεί η κεντρική συσχέτιση αυτών δημιουργήθηκε πίνακας (Σχεδιάγραμμα 9) που ενοποιεί τα μοντέλα. Αυτό γίνεται με τα μοναδικά αναγνωριστικά των συσχετιστικών πινάκων των επιμέρους μοντέλων. 

 Έτσι στον πίνακα κατά την εισαγωγή εγγραφής γίνεται συνδυασμός των μερών που κάνουν μια μεμονωμένη εκπαιδευτική δραστηριότητα του ιδρύματος. Τα μέρη αυτά είναι:
 - Event plant course Identification: μάθημα (module) πρόγραμμα σπουδών
 - Scarce resource Identification: αίθουσα εγκαταστάσεων, ώρα ημέρας
 - School student group & Professor Identification: ομάδα φοιτητών τμήματος σχολής, καθηγητής
 
 Σχεδιάγραμμα 10: κεντρική συσχετική οντότητα των επιμέρους μοντέλων
 
   Επιπρόσθετα, στον πίνακα υπάρχει το χαρακτηριστικό Assembly register που μπορεί να είναι κενό. Αυτό σημαίνει ότι περιμένει την έγκριση του συμβουλίου. Όταν εγκριθεί παίρνει αριθμό πρωτοκόλλου και κατοχυρώνεται. 
 
Παράδειγμα SQL που δημιουργεί πίνακα της κεντρικής συσχετικής οντότητας των επιμέρους μοντέλων
```sql
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
```
Παράδειγμα κώδικα PHP που όταν καλεστεί από τον χρήστη της εφαρμογής, διαγράφει εγγραφή του πίνακα
```php
<?php
 require('../parameteDB.php');
            // specify the calling of the deletion script
 if ( isset($_GET['mode'], $_GET['id']) &&  $_GET['mode']=='delete'  ) {
  $title= 'διαγραφή επιλεγμένης ΕΓΓΡΑΦΗΣ από πίνακα';
  $eventPlaCourseScarceResouParticiGroupID=  $_GET['id'];  //το ID της εγγραφής που θα μεταβάλλουμε  
 }
         //finding of the record to be erased
 try {  //initialization of PDObject
  $pdoObject = new PDO("mysql:host=$dbhost;dbname=$dbname;", $dbuser, $dbpass);
  $pdoObject -> exec('set names utf8');
        
  $sql = " DELETE FROM eventplannedcourse_scarceresource_participantgroup_combis WHERE 
    eventPlaCourseScarceResouParticiGroupID = '$eventPlaCourseScarceResouParticiGroupID'  
           LIMIT 1 ";
            
       //  DELETE FROM `eduschedul`.`~~` WHERE `~~`.`~~` = 
  if ( $statement= $pdoObject->query($sql) ) { $record_exists=true; } 
  else                                         $record_exists=false;  // not existing record Flag state
  // closing of query statement and clearing of PDObject
  $statement->closeCursor();
  $pdoObject= null;  
 }
 catch ( PDOException $e ) {
  print "Database Error: " . $e->getMessage();
      
  die("Αδυναμία δημιουργίας PDO Object");
 }
     
 if (!$record_exists) {
  header('Location: index.php?msg=Record does not exist.');
  exit();
 }
 else  header('Location: index.php?msg=Record already erased.'); 
?>
```

## Μοντέλο περιγραφής χρονοθυρίδων
Σχετικά με το μέρος του χρόνο-προγραμματισμού που έχει να κάνει με τον χρόνο δημιουργήθηκε μοντέλο (Σχεδιάγραμμα 10) που περιγράφει χρονοθυρίδες, δηλαδή σημείου του χρόνου και διάρκεια για να προσδιορίζεται χρονικά το γεγονός. Υπάρχει οντότητα Time slots που περιγράφεται από την μέρα της εβδομάδας και την ώρα της ημέρας. Επίσης υπάρχει η διάρκεια που θα λάβει το γεγονός.

Σχεδιάγραμμα 11: μοντέλο περιγραφής χρονοθυρίδων για προγραμματισμό γεγονότων

```sql
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
```
  Έχει γίνει σχεδίαση για δυνατότητα επέκτασης του μοντέλου του χρόνου για λεπτομερέστερη αναπαράσταση του χρονικού σημείου, που περιλαμβάνει οντότητες που περιγράφουν τις εβδομάδες, του μήνες του χρόνου, τις ακαδημαϊκές περιόδους και τα ακαδημαϊκά έτη.

Σχεδιάγραμμα 12: επέκταση μοντέλου χρόνου με λεπτομερέστερη αναπαράσταση
