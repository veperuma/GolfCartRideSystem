CREATE DATABASE  IF NOT EXISTS `golfcartsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `golfcartsystem`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: golfcartsystem
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `Person_ID` int(11) NOT NULL,
  `Ride_ID` int(11) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `CancelledYorN` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Person_ID`,`Ride_ID`),
  KEY `Ride_ID` (`Ride_ID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Ride_ID`) REFERENCES `ride` (`Ride_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (8010,28,2,0),(8010,31,NULL,0),(8010,32,NULL,0),(8010,33,NULL,0),(8013,22,2,1),(8014,27,NULL,NULL),(8015,19,3,0),(8015,21,4,0),(8019,20,5,0),(8022,16,4,0),(8024,23,4,0),(8031,14,3,0),(8031,24,2,0),(8032,14,2,0),(8033,14,3,0),(8034,18,3,0),(8045,15,4,0),(8046,19,5,0),(8048,17,5,0);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger update_person_cancellables_trigger
after update on booking for each row
begin
if NEW.CancelledYorN>0 THEN
UPDATE PERSON SET NumberOfCancels =NumberOfCancels+1  where New.Person_id= person_id;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `Driver_ID` int(11) NOT NULL,
  `License_Number` varchar(30) DEFAULT NULL,
  `DateHired` date DEFAULT NULL,
  PRIMARY KEY (`Driver_ID`),
  CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`Driver_ID`) REFERENCES `person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (8061,'25007713','2013-09-04'),(8062,'19612281','2010-01-01'),(8063,'35207612','2011-09-25'),(8064,'37900595','2014-01-05'),(8065,'42548241','2011-06-25'),(8066,'32300272','2010-02-19'),(8067,'29135424','2012-02-13'),(8068,'36662734','2011-03-08'),(8069,'87566763','2012-10-09'),(8070,'50289788','2013-12-02');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `Faculty_ID` int(11) NOT NULL,
  `Title` varchar(40) DEFAULT NULL,
  `FullTimeYorN` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Faculty_ID`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`Faculty_ID`) REFERENCES `person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (8010,'Associate Professor',1),(8011,'Professor',1),(8012,'Associate Professor',0),(8013,'Adjunct Faculty',1),(8014,'Associate Professor',0),(8015,'Professor',0),(8016,'Associate Professor',0),(8017,'Adjunct Faculty',1),(8018,'Professor',1),(8019,'Associate Professor',0),(8020,'Head of Department',1);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golfcart`
--

DROP TABLE IF EXISTS `golfcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golfcart` (
  `Cart_ID` int(11) NOT NULL,
  `Model` varchar(40) DEFAULT NULL,
  `Make` int(11) DEFAULT NULL,
  `NumberOfAvailableSeats` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cart_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golfcart`
--

LOCK TABLES `golfcart` WRITE;
/*!40000 ALTER TABLE `golfcart` DISABLE KEYS */;
INSERT INTO `golfcart` VALUES (1,'Bajaj',2017,2),(2,'Hero',2016,3),(3,'Honda',2018,3),(4,'Hero',2016,3),(5,'Hyundai',2015,2),(6,'Bajaj',2017,3),(7,'Hyundai',2018,2),(8,'Honda',2015,3);
/*!40000 ALTER TABLE `golfcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `BuildingCode` varchar(10) NOT NULL,
  `BuildingName` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`BuildingCode`),
  UNIQUE KEY `location_index` (`BuildingCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('Alum','Alumni House (old)'),('Atki','Atkins'),('Auxi','Auxiliary Services Building'),('Band','Vickie and Gene Johnson Marching Band Center (Music Annex)'),('Barn','Barnard'),('BelG','Belk Gym'),('BelH','Belk Hall'),('BenC','Ben Craig Center'),('Bioi','Bioinformatics'),('Biss','Bissel House'),('Boil','Boiler Room'),('Burs','Burson Hall'),('Cafe','Cafeteria Activities Building'),('Came','Cameron Hall'),('Cato','Cato Hall'),('Ceda','Cedar Hall'),('CenC','Center City'),('CoEd','College of Education'),('Colv','Colvard'),('ConD','Cone Deck'),('Cone','Cone University Center'),('CRI1','CRI Parking Deck 1 (formerly Deck I)'),('DecJ','Deck J (South Village Deck)'),('Denn','Denny'),('Duke','Duke Centennial Hall'),('East','East Deck'),('ElmH','Elm Hall'),('EPIC','EPIC'),('Faci','Facilities Management / Police & Public Safety'),('Foun','Foundation'),('Fret','Fretwell'),('Frid','Friday'),('Gara','Garage'),('Gari','Garinger'),('Gree','Greek Village'),('Grig','Grigg Hall'),('Harr','Harris Alumni Center'),('Hawt','Hawthorn Hall'),('Heal','Health & Human Services'),('Hick','Hickory Hall'),('Hols','Holshouser Hall'),('HunH','Hunt Hall (Phase 11)'),('HunV','Hunt Village'),('Irwi','Irwin Belk Track & Field'),('JBui','J Building (Facilities Annex One)'),('Kenn','Kennedy'),('King','King'),('Laur','Laurel Hall'),('Lync','Lynch Hall'),('Macy','Macy'),('Mapl','Maple Hall'),('Mart','Martin Hall'),('McCo','McColl-Richardson Field (Football Stadium)'),('McEn','McEniry'),('McMi','McMillan Greenhouse'),('MCNC','MCNC Data Center - RTP'),('Memo','Memorial Hall'),('MilH','Miltimore Hall'),('Milt','Miltimore-Wallis Center'),('Moor','Moore Hall'),('Moto','Kulwichi Motorsports'),('MSII','Motorsports II'),('NCRC-Cent','NCRC Central Energy Plant'),('NCRC-Davi','NCRC David H. Murdock Research Institute Core Laboratory Building'),('NCRC-Nutr','NCRC Nutrition Research Institute'),('NCRC-Plan','NCRC Plants for Human Health Institute'),('NERF','Northeast Recreation Fields Complex'),('Nort','North Deck'),('OakH','Oak Hall'),('Phil','Philips Baseball Field'),('Pine','Pine Hall'),('PORT','Portal'),('PPla','Physical Plant / Parking Services'),('Pros','Prospector'),('RDHa','Residence Dining Hall (RDH)'),('Re13','Recreation Field #13'),('Rece','Receiving & Stores'),('Rees','Reese'),('Robi','Robinson Hall'),('Rowe','Rowe'),('RUP1','Regional Utility Plant 1'),('RUP2','Regional Utility Plant 2'),('RUP3','Regional Utility Plant 3'),('RUP4','Regional Utility Plant 4'),('Sanf','Sanford Hall'),('Scot','Scott Hall'),('Smit','Smith'),('Stor','Storrs'),('StuA','Student Activity Center (SAC)'),('StuH','Student Health Center'),('StuU','Student Union'),('Syca','Sycamore Hall'),('Tenn','Tennis Facility'),('Tra1','Trailer 1 (FM Grounds)'),('Tra2','Trailer 2 (FM Recycling Annex)'),('Tra3','Trailer 3 (FM Automative/Grounds)'),('Tra4','Trailer 4 (FM EHS)'),('Tra5','Trailer 5 (FM BES)'),('Unio','Union Deck'),('Wach','Wachovia Field House (now Wells Fargo Fieldhouse)'),('Wall','Wallis Hall'),('West','West Deck'),('Winn','Winningham'),('With','Witherspoon Hall'),('Wood','Woodward Hall');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `locationview`
--

DROP TABLE IF EXISTS `locationview`;
/*!50001 DROP VIEW IF EXISTS `locationview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `locationview` AS SELECT 
 1 AS `BuildingCode`,
 1 AS `BuildingName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `Person_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `Mobile` varchar(10) DEFAULT NULL,
  `NumberOfCancels` int(11) DEFAULT '0',
  PRIMARY KEY (`Person_ID`),
  UNIQUE KEY `person_index` (`Person_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (8010,'Ezra Gutierrez','eu.nibh.vulputate@ligulaNullamfeugiat.com','Electrical','3163909078',3),(8011,'Maile Kaufman','faucibus.leo.in@pellentesquemassalobortis.co.uk','Computer Science','3286116824',0),(8012,'Theodore Hanson','Sed@urna.edu','Civil','4135025078',0),(8013,'Tamekah Cash','eget@miac.co.uk','Information Technology','2035121010',1),(8014,'Maya Carrillo','ligula.Aenean@magnaPhasellusdolor.org','Instrumental','8513372291',0),(8015,'Raphael Barber','et.libero.Proin@idanteNunc.org','Computer Science','7796378537',0),(8016,'Keaton Bray','non.bibendum@enimnec.co.uk','Instrumental','3433174180',0),(8017,'Timon Mitchell','facilisis.vitae@nonummyultricies.com','Instrumental','3446390089',0),(8018,'Stella Carter','odio.sagittis.semper@Integereulacus.org','Information Technology','8887491412',0),(8019,'Buckminster George','in.faucibus@pedeCras.org','BioPharmacy','1373099909',0),(8020,'Nell Calhoun','risus.Quisque@nectempus.co.uk','BioPharmacy','3034792666',0),(8021,'Imogene Foley','eu@tellusloremeu.org','BioInformatics','1973657749',0),(8022,'Skyler Bates','id.mollis.nec@Vivamussit.org','BioPharmacy','6765946954',0),(8023,'Aubrey Nunez','sapien@placerat.org','Electrical','4111282580',0),(8024,'Lareina Paul','sed.leo@acrisusMorbi.ca','Electronics and Communication','7544195437',0),(8025,'Zelenia Spencer','et@dignissim.org','Instrumental','9316951580',0),(8026,'Thor Watson','Phasellus.dapibus.quam@aliquam.co.uk','Mechanical','4007355185',0),(8027,'Shaine Dudley','sed.dolor.Fusce@habitantmorbi.org','Electronics and Communication','8855026328',0),(8028,'Lesley Robinson','dapibus.quam@eget.ca','Information Technology','5988523220',0),(8029,'Flavia Lewis','enim@libero.edu','Information Technology','2257723796',0),(8030,'Jescie Jones','lacinia.at.iaculis@est.edu','Electronics and Communication','9252694678',0),(8031,'Keely Howell','ipsum.dolor.sit@commodoauctorvelit.org','Mechanical','3077457395',0),(8032,'Ella Houston','fermentum@ametrisusDonec.net','Information Technology','8967085436',0),(8033,'Orli Rocha','auctor.non.feugiat@acturpis.ca','BioInformatics','1089248191',0),(8034,'Clementine Santos','Aliquam.fringilla@miDuis.net','Mechanical','2138525314',0),(8035,'Chase Blankenship','faucibus.lectus@Aliquamvulputateullamcorper.edu','Computer Science','3672385524',0),(8036,'Linus Castaneda','amet@lacusUtnec.co.uk','Mechanical','4972882006',0),(8037,'Rhea Oliver','placerat@pellentesquemassa.org','Civil','8905131596',0),(8038,'Clare Maxwell','eleifend.vitae@Suspendisse.co.uk','Instrumental','7792200827',0),(8039,'David Wallace','metus.In@duiFuscealiquam.com','Information Technology','4197841935',0),(8040,'Geoffrey Jennings','amet.dapibus@egetipsumDonec.org','BioPharmacy','4665967650',0),(8041,'Sonia Lambert','eget@nislelementum.edu','BioPharmacy','3582026675',0),(8042,'Alexandra Sexton','lorem.lorem.luctus@nonummy.edu','BioInformatics','1117661818',0),(8043,'Colin Drake','lorem.luctus.ut@auctor.ca','Mechanical','2372160140',0),(8044,'Chanda Graves','nulla.Cras@blandit.co.uk','Instrumental','8195490288',0),(8045,'Guy Hansen','velit@odioEtiamligula.edu','BioInformatics','2026363381',0),(8046,'Cain Dixon','In.tincidunt.congue@anteiaculis.com','BioInformatics','1902729105',0),(8047,'Imani Sloan','Donec.vitae.erat@nonummy.com','Mechanical','7521816827',0),(8048,'Jolene Nash','tristique.senectus@Nuncmauris.org','Information Technology','6737314808',0),(8049,'Emmanuel Conrad','libero.Morbi.accumsan@magna.org','Computer Science','8646697230',0),(8050,'TaShya Rutledge','ac.risus.Morbi@fermentumfermentum.co.uk','Electronics and Communication','4769247379',0),(8051,'Caleb Mann','risus.Donec.egestas@elementumsemvitae.org','Information Technology','2323909041',0),(8052,'Xavier Lewis','In.at.pede@purus.co.uk','Electronics and Communication','2449433729',0),(8053,'Quinn Hyde','tempor.lorem@nequeSed.edu','Instrumental','4748742286',0),(8054,'Yvonne Pennington','sed.facilisis@luctuslobortisClass.co.uk','Mechanical','8198298326',0),(8055,'Dean Rodgers','vitae@natoquepenatibuset.net','Instrumental','2837930479',0),(8056,'Jameson Sweet','ante.Nunc@necligulaconsectetuer.net','BioInformatics','9744189377',0),(8057,'Xantha Fisher','eget.odio.Aliquam@tristique.net','BioPharmacy','2246050218',0),(8058,'Patrick Snider','vulputate@magnaUttincidunt.com','Mechanical','9798946933',0),(8059,'Jael Brown','orci.lacus@etnuncQuisque.co.uk','Civil','3842355973',0),(8060,'Xandra Wiggins','a@fringillaporttitorvulputate.com','BioInformatics','9409902405',0),(8061,'Nissim Davenport','facilisis.vitae.orci@massarutrum.com','Mechanical','6972877948',0),(8062,'Bernard Olson','Integer.mollis.Integer@eleifendnunc.ca','Computer Science','3719449852',0),(8063,'Norman Nieves','nibh.Donec@ligulaAenean.net','Mechanical','6743984295',0),(8064,'Porter Atkinson','ipsum@eratvolutpat.edu','Information Technology','9043262281',0),(8065,'Hall Hicks','diam.dictum.sapien@eratvelpede.edu','Mechanical','4943012853',0),(8066,'Juliet Higgins','porttitor@luctusetultrices.edu','BioInformatics','6627988850',0),(8067,'Jack Charles','tempor@feugiat.com','Electronics and Communication','1564552901',0),(8068,'Lydia Ellis','Vivamus.sit@Proinvelit.net','Computer Science','7557993124',0),(8069,'Venus Mosley','Vivamus@sapienAenean.edu','Civil','5699758743',0),(8070,'Igor Thornton','tincidunt.vehicula.risus@penatibuset.edu','Mechanical','3992181746',0),(8071,'Bryar Jensen','dui.nec@magnisdis.ca','Mechanical','7007672693',0),(8072,'Leo Giles','enim.nec.tempus@dapibusquam.co.uk','Instrumental','4036335769',0),(8073,'Naida Mcleod','ornare.lectus@sit.org','Electronics and Communication','2785989338',0),(8074,'Colin Pruitt','ut.cursus@mattissemper.co.uk','Instrumental','9175668689',0),(8075,'Britanni Roberson','vitae.sodales.nisi@odiosagittissemper.com','Civil','4624394016',0),(8076,'Cassandra Stephenson','Curabitur@tacitisociosquad.net','Electronics and Communication','2741969713',0),(8077,'Roanna Cobb','Suspendisse.eleifend.Cras@dapibusrutrumjusto.net','BioInformatics','6644381420',0),(8078,'Kasper Garza','mauris.sit.amet@Integeraliquam.edu','Information Technology','4721341315',0),(8079,'Sybill Barber','auctor@velitCras.net','BioPharmacy','5176265903',0),(8080,'Amena Jackson','egestas@sitametultricies.edu','Electrical','1671042025',0),(8081,'Wylie Peterson','elementum.at@egetmetus.edu','Information Technology','3043080216',0),(8082,'Conan Page','sodales.Mauris.blandit@Praesenteu.com','Information Technology','7237356360',0),(8083,'Clayton Bryan','tempor.bibendum@Aliquam.co.uk','BioInformatics','7327619832',0),(8084,'Amaya Bentley','Nullam@etrutrumnon.co.uk','Computer Science','5958411761',0),(8085,'Yolanda Day','sem@penatibuset.com','Electronics and Communication','2618036823',0),(8086,'Malik Neal','mattis.ornare@velquam.co.uk','Instrumental','6597509358',0),(8087,'Nasim Baxter','pede.Suspendisse@Phasellusinfelis.edu','Information Technology','4911910937',0),(8088,'Chester Page','vulputate.velit.eu@interdumligula.edu','Instrumental','3234233845',0),(8089,'Reese Mcgowan','Curabitur.vel.lectus@suscipitestac.net','Mechanical','4336772078',0),(8090,'Haley Wolf','purus.Maecenas.libero@mi.net','Mechanical','9484802907',0),(8091,'Brooke Sharp','malesuada.fames@adipiscing.ca','Information Technology','9293769086',0),(8092,'Merritt Hernandez','Donec.dignissim.magna@ligulaAeneaneuismod.org','BioPharmacy','9865047988',0),(8093,'Lester Miranda','ac@pedenec.com','Information Technology','1336217592',0),(8094,'Tanner Frost','lectus.rutrum.urna@consequatpurusMaecenas.co.uk','Mechanical','9892360567',0),(8095,'Yolanda Jenkins','ante.lectus.convallis@etultricesposuere.com','BioPharmacy','7087587261',0),(8096,'Howard Brown','parturient.montes.nascetur@etmalesuadafames.org','Electrical','8457371941',0),(8097,'Julian Bennett','Sed@afacilisisnon.co.uk','Mechanical','4643164135',0),(8098,'Celeste Burnett','enim.Nunc@magnatellusfaucibus.co.uk','Civil','3806806216',0),(8099,'Madeline Frank','sed.facilisis@rutrumFuscedolor.edu','Computer Science','4098608663',0),(8100,'Hayfa Maxwell','eu.metus.In@egetmassaSuspendisse.edu','Instrumental','7713193998',0),(8101,'Haley Mcpherson','dignissim@sit.co.uk','BioPharmacy','6689622761',0),(8102,'Zeph Blackwell','Aliquam.auctor.velit@necenimNunc.ca','Civil','7125248043',0),(8103,'Daquan Hinton','dolor@arcuNunc.org','BioPharmacy','1168168691',0),(8104,'Carter Barnett','parturient.montes@tellusAeneanegestas.ca','Civil','3152010915',0),(8105,'Wynne Murray','nec.eleifend@id.ca','Information Technology','8698591878',0),(8106,'Lucius Hutchinson','non@variusNamporttitor.edu','BioPharmacy','4578951271',0),(8107,'Lael Ayers','vitae.erat@utaliquamiaculis.com','Electronics and Communication','1615457871',0),(8108,'Willa Acosta','malesuada.ut@acipsumPhasellus.com','Civil','6502063629',0),(8109,'Cullen Ford','nibh@augueacipsum.org','Mechanical','2854810579',0),(8110,'Bob Smith','bob@smith.com','Computer Science','9801954665',0),(8111,'Bean Tommy','bean@tommy.com','Civil','9701946685',0);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `personview`
--

DROP TABLE IF EXISTS `personview`;
/*!50001 DROP VIEW IF EXISTS `personview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `personview` AS SELECT 
 1 AS `Person_ID`,
 1 AS `Name`,
 1 AS `Email`,
 1 AS `Department`,
 1 AS `Mobile`,
 1 AS `NumberOfCancels`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ride`
--

DROP TABLE IF EXISTS `ride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride` (
  `Ride_ID` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `Start_Location_Code` varchar(10) NOT NULL,
  `End_Location_Code` varchar(10) NOT NULL,
  `BookedDate` date DEFAULT NULL,
  `Start_Time` time NOT NULL,
  `End_Time` time NOT NULL,
  PRIMARY KEY (`Ride_ID`),
  KEY `cart_id` (`cart_id`),
  KEY `driver_id` (`driver_id`),
  KEY `Start_Location_Code` (`Start_Location_Code`),
  KEY `End_Location_Code` (`End_Location_Code`),
  CONSTRAINT `ride_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `golfcart` (`Cart_ID`),
  CONSTRAINT `ride_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`Driver_ID`),
  CONSTRAINT `ride_ibfk_3` FOREIGN KEY (`Start_Location_Code`) REFERENCES `location` (`BuildingCode`),
  CONSTRAINT `ride_ibfk_4` FOREIGN KEY (`End_Location_Code`) REFERENCES `location` (`BuildingCode`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride`
--

LOCK TABLES `ride` WRITE;
/*!40000 ALTER TABLE `ride` DISABLE KEYS */;
INSERT INTO `ride` VALUES (14,1,8064,'Ceda','RDHa','2018-03-21','08:07:00','08:37:00'),(15,2,8065,'Mart','HunH','2018-04-12','10:12:00','08:37:00'),(16,3,8062,'Tenn','Moto','2018-03-15','02:58:00','10:42:00'),(17,4,8064,'ElmH','StuA','2018-04-01','09:36:00','03:28:00'),(18,3,8063,'RUP3','Wall','2018-03-16','06:13:00','10:06:00'),(19,6,8065,'Gari','StuH','2018-04-02','08:00:00','06:43:00'),(20,1,8065,'Rees','Barn','2018-04-08','03:54:00','08:30:00'),(21,7,8064,'Tra5','Cone','2018-03-18','05:24:00','04:24:00'),(22,2,8063,'Cafe','Pine','2018-03-23','04:29:00','05:54:00'),(23,4,8070,'Gara','Rowe','2018-04-11','09:13:00','09:43:00'),(24,1,8069,'Hick','BelH','2018-03-30','04:12:00','04:42:00'),(27,4,8064,'Alum','Bioi','2018-05-01','01:00:00','01:15:00'),(28,2,8062,'Alum','Biss','2018-05-01','01:02:00','01:17:00'),(29,7,8067,'Alum','Colv','2018-05-01','03:05:00','03:20:00'),(30,7,8067,'BenC','CRI1','2018-05-01','01:00:00','01:15:00'),(31,8,8068,'Alum','Biss','2018-06-01','12:59:00','01:14:00'),(32,1,8061,'BelH','HunV','2018-06-02','02:02:00','02:17:00'),(33,5,8065,'Alum','Bioi','2018-06-02','12:58:00','01:13:00'),(34,7,8067,'Alum','Denn','2018-06-02','12:56:00','01:11:00');
/*!40000 ALTER TABLE `ride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rideview`
--

DROP TABLE IF EXISTS `rideview`;
/*!50001 DROP VIEW IF EXISTS `rideview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `rideview` AS SELECT 
 1 AS `person_id`,
 1 AS `ride_id`,
 1 AS `start_location_code`,
 1 AS `end_location_code`,
 1 AS `bookeddate`,
 1 AS `start_time`,
 1 AS `rating`,
 1 AS `cancelledyorn`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `Staff_ID` int(11) NOT NULL,
  `Position` varchar(40) DEFAULT NULL,
  `AdminYorN` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (8021,'Admin',1),(8022,'Clerk',0),(8023,'Receptionist',0),(8024,'Janitor',0),(8025,'Security',0),(8026,'Receptionist',0),(8027,'Attendant',0),(8028,'Clerk',0),(8029,'Manager',0),(8030,'Attendant',0);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `Student_ID` int(11) NOT NULL,
  `GradYear` int(11) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (8031,2017,'2013-11-01'),(8032,2017,'1993-05-28'),(8033,2014,'1991-09-29'),(8034,2016,'1995-08-31'),(8035,2015,'2006-11-17'),(8036,2017,'1984-07-09'),(8037,2015,'2005-02-27'),(8038,2015,'2008-03-04'),(8039,2016,'2012-07-19'),(8040,2015,'1988-07-07'),(8041,2015,'2011-12-26'),(8042,2016,'2000-09-03'),(8043,2017,'1994-11-17'),(8044,2014,'2013-08-05'),(8045,2015,'2002-11-07'),(8046,2014,'2000-09-17'),(8047,2016,'1984-03-17'),(8048,2014,'2015-09-17'),(8049,2017,'1990-02-23'),(8050,2017,'2018-09-21'),(8051,2016,'1985-09-02'),(8052,2015,'1989-12-13'),(8053,2014,'1988-02-27'),(8054,2016,'2014-01-11'),(8055,2015,'2004-05-29'),(8056,2017,'2003-09-19'),(8057,2014,'1988-08-13'),(8058,2014,'2010-07-27'),(8059,2016,'2001-12-06'),(8060,2017,'2003-07-22');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'golfcartsystem'
--

--
-- Dumping routines for database 'golfcartsystem'
--
/*!50003 DROP PROCEDURE IF EXISTS `driverRatingProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `driverRatingProc`(IN id int(11))
BEGIN
select b.person_id, p.name, b.ride_id,b.rating from booking b, ride r, person p where p.person_id=b.person_id and b.ride_id = r.ride_id and r.driver_id=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `locationview`
--

/*!50001 DROP VIEW IF EXISTS `locationview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `locationview` AS select `location`.`BuildingCode` AS `BuildingCode`,`location`.`BuildingName` AS `BuildingName` from `location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personview`
--

/*!50001 DROP VIEW IF EXISTS `personview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personview` AS select `person`.`Person_ID` AS `Person_ID`,`person`.`Name` AS `Name`,`person`.`Email` AS `Email`,`person`.`Department` AS `Department`,`person`.`Mobile` AS `Mobile`,`person`.`NumberOfCancels` AS `NumberOfCancels` from `person` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rideview`
--

/*!50001 DROP VIEW IF EXISTS `rideview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rideview` AS select `b`.`Person_ID` AS `person_id`,`b`.`Ride_ID` AS `ride_id`,`r`.`Start_Location_Code` AS `start_location_code`,`r`.`End_Location_Code` AS `end_location_code`,`r`.`BookedDate` AS `bookeddate`,`r`.`Start_Time` AS `start_time`,`b`.`Rating` AS `rating`,`b`.`CancelledYorN` AS `cancelledyorn` from (`booking` `b` join `ride` `r`) where (`b`.`Ride_ID` = `r`.`Ride_ID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-01 21:12:51
