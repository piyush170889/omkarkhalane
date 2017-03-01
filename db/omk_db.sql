-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: omk_db
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `advance_amount`
--

DROP TABLE IF EXISTS `advance_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_amount` (
  `sr_no` int(11) NOT NULL AUTO_INCREMENT,
  `advance_datetime` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `advance_ipd_id` varchar(10) DEFAULT NULL,
  `creattion_datetime` datetime DEFAULT NULL,
  `admission_datetime` datetime DEFAULT NULL,
  UNIQUE KEY `sr_no` (`sr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_amount`
--

LOCK TABLES `advance_amount` WRITE;
/*!40000 ALTER TABLE `advance_amount` DISABLE KEYS */;
INSERT INTO `advance_amount` VALUES (1,'2015-12-08 14:17:00',1000,'IP1','2015-12-08 13:18:00','2015-12-08 14:17:00'),(2,'2015-12-15 11:19:00',1000,'IP2','2015-12-15 11:19:00','2015-12-15 11:19:00'),(3,'2015-12-15 11:22:00',0,'IP3','2015-12-15 11:22:00','2015-12-15 11:22:00'),(4,'2015-12-15 11:33:00',1000,'IP4','2015-12-15 11:34:00','2015-12-15 11:33:00'),(5,'2015-12-15 11:48:00',1000,'IP4','2015-12-15 11:48:00','2015-12-15 11:33:00'),(6,'2015-12-15 11:50:00',1000,'IP4','2015-12-15 11:50:00','2015-12-15 11:50:00'),(7,'2015-12-15 11:52:00',0,'IP6','2015-12-15 11:52:00','2015-12-15 11:52:00');
/*!40000 ALTER TABLE `advance_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logo`
--

DROP TABLE IF EXISTS `logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logo` (
  `UserID` varchar(45) DEFAULT NULL,
  `UserType` varchar(45) DEFAULT NULL,
  `UserLevel` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `emp_id` varchar(100) DEFAULT NULL,
  `logo_srno` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`logo_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logo`
--

LOCK TABLES `logo` WRITE;
/*!40000 ALTER TABLE `logo` DISABLE KEYS */;
INSERT INTO `logo` VALUES ('administrator','SuperUser','1','omk@123','S1',1,NULL),('recepone','Reception','3','newpassword','R1',15,'rajufulari123@gmail.com'),('Reception','Reception','3','newpass','R3',16,'rajufulari@ymail.com'),('reception007','Reception','3','reception07','R4',17,'rajufulari123@gmail.com');
/*!40000 ALTER TABLE `logo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_book_appointment`
--

DROP TABLE IF EXISTS `omk_book_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_book_appointment` (
  `srno` int(10) NOT NULL AUTO_INCREMENT,
  `booking_id` varchar(10) NOT NULL,
  `b_opd_id` varchar(100) DEFAULT NULL,
  `b_ipd_id` varchar(100) DEFAULT NULL,
  `F_name` varchar(50) DEFAULT NULL,
  `patient_contact` varchar(100) NOT NULL,
  `patient_age` varchar(10) DEFAULT NULL,
  `patient_gender` varchar(10) NOT NULL,
  `patient_address` varchar(1000) NOT NULL,
  `patient_occupation` varchar(100) NOT NULL,
  `b_datetime_of_appointment` datetime NOT NULL,
  `b_status` varchar(100) NOT NULL,
  `booking_date` datetime NOT NULL,
  `m_name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `appointment_for` varchar(50) DEFAULT NULL,
  `consulting_doctor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_book_appointment`
--

LOCK TABLES `omk_book_appointment` WRITE;
/*!40000 ALTER TABLE `omk_book_appointment` DISABLE KEYS */;
INSERT INTO `omk_book_appointment` VALUES (1,'B1','OP1','Not Registered','Raju1','9730155941','24','Male','315, Nilam nagar, M.I.D.C. Road solapur','BE-IT','2015-12-08 13:17:00','Registered For OPD','2015-12-08 13:11:00','S.1','Fulari1','Orthopedic','Doctor 1'),(2,'B2','Not Registered','IP1','Pradeep1','9978675645','24','Male','Pune','MBA','2015-12-08 00:00:00','Registered For IPD','2015-12-08 13:13:00','M.1','Patil1','Orthopedic','Doctor 1'),(3,'B3','OP2','Not Registered','Mohan','9090909090','23','Male','Pune','','2015-12-08 13:18:00','Registered For OPD','2015-12-08 13:14:00','','Jadhav','Ayurved','Doctor 3'),(4,'B4','Not Registered','Not Registered','Salman','89889889898','35','Male','Mumbia','Filmstar','2015-12-08 13:15:00','Not Registered','2015-12-08 13:15:00','','Khan','Orthopedic','Doctor 5'),(5,'B5','Not Registered','Not Registered','Priti','88888888888','40','Male','PUNE','','2015-12-08 17:16:00','Not Registered','2015-12-08 13:16:00','','Zinta','Ayurved','Doctor 4'),(6,'B6','Not Registered','Not Registered','Patient001','9878675645','44','Male','Pune','fvb','2015-12-15 11:16:00','Not Registered','2015-12-15 11:16:00','0001','0002','Department007','Doctor007'),(7,'B7','Not Registered','Not Registered','Patient002','7766339988','33','Female','dsfgf','dfsd','2015-12-15 11:16:00','Not Registered','2015-12-15 11:17:00','0001','0002','Ayurved','Doctor 2'),(8,'B8','Not Registered','Not Registered','Patient003','8909780978','43','Male','dssf','ds','2015-12-15 11:17:00','Not Registered','2015-12-15 11:17:00','0001','0002','Department007','Doctor007'),(9,'B9','OP3','IP6','Patient004','2323232323','32','Female','dsfdghj','dfsd','2015-12-15 11:51:00','Registered For Both','2015-12-15 11:18:00','0001','0002','Department007','Doctor007'),(10,'B10','Not Registered','IP2','Patient005','43356','11','Female','fgd','fdgf','2015-12-15 11:19:00','Registered For IPD','2015-12-15 11:19:00','0001','0001','Department007','Doctor007'),(12,'B12','OP4','IP4','Patient007','897655456','','','','','2015-12-15 17:00:00','Registered For IPD','2015-12-15 11:21:00','','','',''),(13,'B13','Not Registered','IP3','Patient008','8765433565','','','','','2015-12-15 11:22:00','Registered For IPD','2015-12-15 11:22:00','','','','');
/*!40000 ALTER TABLE `omk_book_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_departments`
--

DROP TABLE IF EXISTS `omk_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_departments` (
  `srno` int(10) NOT NULL AUTO_INCREMENT,
  `D_id` varchar(20) DEFAULT NULL,
  `D_name` varchar(100) DEFAULT NULL,
  `HOD` varchar(100) DEFAULT NULL,
  `c_date` date DEFAULT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_departments`
--

LOCK TABLES `omk_departments` WRITE;
/*!40000 ALTER TABLE `omk_departments` DISABLE KEYS */;
INSERT INTO `omk_departments` VALUES (1,'DEPT1','Orthopedic','Doctor One','2015-10-22'),(2,'DEPT2','Ayurved','Doctor Two','2015-10-22'),(3,'DEPT3','Department007','Doctor007','2015-12-15');
/*!40000 ALTER TABLE `omk_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_doctor_details`
--

DROP TABLE IF EXISTS `omk_doctor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_doctor_details` (
  `doc_srno` int(10) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(10) DEFAULT NULL,
  `doc_name` varchar(100) DEFAULT NULL,
  `doc_age` varchar(10) DEFAULT NULL,
  `doc_gender` varchar(10) DEFAULT NULL,
  `doc_address` varchar(1000) DEFAULT NULL,
  `doc_contact` varchar(20) DEFAULT NULL,
  `doc_consulting_fees` varchar(100) DEFAULT NULL,
  `education` varchar(500) DEFAULT NULL,
  `specialization` varchar(500) DEFAULT NULL,
  `med_reg_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`doc_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_doctor_details`
--

LOCK TABLES `omk_doctor_details` WRITE;
/*!40000 ALTER TABLE `omk_doctor_details` DISABLE KEYS */;
INSERT INTO `omk_doctor_details` VALUES (1,'D1','Doctor 1','54','','','','500','','',''),(2,'D2','Doctor 2','','','','','','','',''),(3,'D3','Doctor 3','','','','','','','',''),(4,'D4','Doctor 4','','','','','','','',''),(5,'D5','Doctor 5','','','','','','','',''),(6,'D6','Doctor007','79','Male','Pune','9089890989','1000','MBBS','Medical','M11');
/*!40000 ALTER TABLE `omk_doctor_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_ipd_appointments`
--

DROP TABLE IF EXISTS `omk_ipd_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_ipd_appointments` (
  `ipd_srno` int(11) NOT NULL AUTO_INCREMENT,
  `i_opd_id` varchar(100) DEFAULT NULL,
  `next_to_kin` varchar(100) DEFAULT NULL,
  `admitted_on_datetime` datetime DEFAULT NULL,
  `discharge_on_datetime` datetime DEFAULT NULL,
  `expiry_on_datetime` datetime DEFAULT NULL,
  `primary_diagnosis` varchar(1000) DEFAULT NULL,
  `final_diagnosis` varchar(1000) DEFAULT NULL,
  `cause_of_death` varchar(1000) DEFAULT NULL,
  `death_certificate_no` varchar(100) DEFAULT NULL,
  `surgeon` varchar(100) DEFAULT NULL,
  `datetime_of_surgery` datetime DEFAULT NULL,
  `anaesthetist_doctor` varchar(100) DEFAULT NULL,
  `anaesthesia_type` varchar(100) DEFAULT NULL,
  `death_certificate_issue_datetime` datetime DEFAULT NULL,
  `ipd_registration_datetime` datetime DEFAULT NULL,
  `ipd_reference_doctor` varchar(100) DEFAULT NULL,
  `ipd_id` varchar(10) DEFAULT NULL,
  `ipd_billing_id` varchar(100) DEFAULT NULL,
  `mlcno` varchar(100) DEFAULT NULL,
  `suregryDescription` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`ipd_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_ipd_appointments`
--

LOCK TABLES `omk_ipd_appointments` WRITE;
/*!40000 ALTER TABLE `omk_ipd_appointments` DISABLE KEYS */;
INSERT INTO `omk_ipd_appointments` VALUES (1,'Not Registered','Dont Know','2015-12-08 14:17:00','2015-12-09 00:00:00',NULL,'Kuch Bhi nahi hai','fdggfff','','','Doctor 1','2015-12-09 00:00:00','fgdgd','GA',NULL,'2015-12-08 13:18:00','Reference Doctor One','IP1','BLI1','','fgdxdgfd'),(2,'Not Registered','fgdf','2015-12-15 11:19:00','2015-12-17 11:34:00','2015-12-15 11:35:00','sfdgf','uiyuyrtrdfg','rtdfgh',';kjhrgdf','Doctor007','2015-12-16 00:00:00','ufh','EA','2015-12-16 00:00:00','2015-12-15 11:19:00','Refernce007','IP2','BLI2','fgfdhg','oiuyedfgh'),(3,'Not Registered','fsd','2015-12-15 11:22:00',NULL,NULL,'fds',NULL,NULL,NULL,'','2015-12-15 11:38:00',NULL,NULL,NULL,'2015-12-15 11:22:00','','IP3',NULL,NULL,NULL),(4,'Not Registered','iujthrf','2015-12-15 11:33:00','2015-12-17 00:00:00',NULL,'[oiytyfghj','ds','','','Doctor007','2015-12-16 00:00:00','','',NULL,'2015-12-15 11:34:00','Reference Two','IP4','BLI3','adsf','sadsf'),(5,'Not Registered','rew','2015-12-15 11:50:00',NULL,NULL,'erw',NULL,NULL,NULL,'Doctor 5','2015-12-15 11:50:00',NULL,NULL,NULL,'2015-12-15 11:50:00','Reference Doctor One','IP4',NULL,NULL,NULL),(6,'Not Registered','dew','2015-12-15 11:52:00',NULL,NULL,'dew',NULL,NULL,NULL,'Doctor007','2015-12-16 00:00:00',NULL,NULL,NULL,'2015-12-15 11:52:00','Refernce007','IP6',NULL,NULL,NULL);
/*!40000 ALTER TABLE `omk_ipd_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_ipd_billing_details`
--

DROP TABLE IF EXISTS `omk_ipd_billing_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_ipd_billing_details` (
  `ipd_billing_srno` int(10) NOT NULL AUTO_INCREMENT,
  `billing_id_ipd` varchar(100) DEFAULT NULL,
  `ipd_bill_generation_datetime` datetime DEFAULT NULL,
  `ipd_bill_ipd_id` varchar(100) DEFAULT NULL,
  `ipd_bill_discharge_datetime` datetime DEFAULT NULL,
  `ipd_bill_billtype` varchar(200) DEFAULT NULL,
  `ipd_bill_roomtype` varchar(100) DEFAULT NULL,
  `ipd_bill_room_or_bed_no` varchar(100) DEFAULT NULL,
  `ipd_bill_roomcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_perunitroomcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_nursingcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_perunitnursingcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_visitingdoc1` varchar(100) DEFAULT NULL,
  `ipd_bill_visitingdoc2` varchar(100) DEFAULT NULL,
  `ipd_bill_visitingdoc3` varchar(100) DEFAULT NULL,
  `ipd_bill_operatingcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_assistantcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_otcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_oxygencharges` varchar(100) DEFAULT NULL,
  `ipd_bill_drugscharges` varchar(100) DEFAULT NULL,
  `ipd_bill_anaesthesiadoctorcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_instrumentcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_implantscharges` varchar(100) DEFAULT NULL,
  `ipd_bill_deliverycharges` varchar(100) DEFAULT NULL,
  `ipd_bill_labourroomcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_babycarecharges` varchar(100) DEFAULT NULL,
  `ipd_bill_ivorbloodfusioncharges` varchar(100) DEFAULT NULL,
  `ipd_bill_disposablecharges` varchar(100) DEFAULT NULL,
  `ipd_bill_administrationcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_dressingorplastercharges` varchar(100) DEFAULT NULL,
  `ipd_bill_labcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_investigationcharges` varchar(100) DEFAULT NULL,
  `ipd_bill_xraycharges` varchar(100) DEFAULT NULL,
  `ipd_bill_miscellenouscharges` varchar(100) DEFAULT NULL,
  `ipd_bill_totalbill` varchar(100) DEFAULT NULL,
  `ipd_bill_balance` varchar(100) DEFAULT NULL,
  `ipd_bill_paid` varchar(100) DEFAULT NULL,
  `visitingdoc1charges` varchar(20) DEFAULT NULL,
  `visitingdoc2charges` varchar(20) DEFAULT NULL,
  `visitingdoc3charges` varchar(20) DEFAULT NULL,
  `xrayperprice` varchar(20) DEFAULT NULL,
  `xrayqty` varchar(20) DEFAULT NULL,
  `registrationCharges` varchar(20) DEFAULT NULL,
  `ipd_bill_datetime_of_admission` datetime DEFAULT NULL,
  `mlcno` varchar(100) DEFAULT NULL,
  `suregryDescription` varchar(5000) DEFAULT NULL,
  `ipd_bill_subtotal` varchar(100) DEFAULT NULL,
  `Concession` int(11) DEFAULT NULL,
  PRIMARY KEY (`ipd_billing_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_ipd_billing_details`
--

LOCK TABLES `omk_ipd_billing_details` WRITE;
/*!40000 ALTER TABLE `omk_ipd_billing_details` DISABLE KEYS */;
INSERT INTO `omk_ipd_billing_details` VALUES (1,'BLI1','2015-12-08 13:38:00','IP1','2015-12-09 00:00:00','Final','General Ward Male','100','150','150','100','100','Doctor 2','Doctor 1','Doctor 3','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','0','500','1000','2700','200','2500','100','100','100','100','5','100','2015-12-08 14:17:00','','fgdxdgfd','3750',50),(2,'BLI2','2015-12-15 11:37:00','IP2','2015-12-17 11:34:00','Final','Room007','100','140000','70000','100','100','Doctor 2','Doctor 3','','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','200','100','141300','100','141200','100','100','0','100','2','100','2015-12-15 11:19:00','fgfdhg','oiuyedfgh','142400',100),(3,'BLI3','2015-12-15 11:48:00','IP4','2015-12-17 00:00:00','Final','','','0','0','10000','0','','','','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','8000','0','8000','0','0','0','','0','0','2015-12-15 11:33:00','adsf','sadsf','10000',0);
/*!40000 ALTER TABLE `omk_ipd_billing_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_opd_appointments`
--

DROP TABLE IF EXISTS `omk_opd_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_opd_appointments` (
  `srno` int(10) NOT NULL AUTO_INCREMENT,
  `opd_id` varchar(10) NOT NULL,
  `opd_appointment_for` varchar(100) NOT NULL,
  `opd_datetime_of_appointment` datetime NOT NULL,
  `opd_appointment_type` varchar(100) NOT NULL,
  `opd_appointment_status` varchar(100) NOT NULL,
  `opd_registration_datetime` datetime NOT NULL,
  `opd_consulting_doctor` varchar(100) NOT NULL,
  `opd_reference_doctor` varchar(500) NOT NULL,
  `o_ipd_id` varchar(100) DEFAULT NULL,
  `opd_date_of_billing` datetime DEFAULT NULL,
  `opd_bill_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_opd_appointments`
--

LOCK TABLES `omk_opd_appointments` WRITE;
/*!40000 ALTER TABLE `omk_opd_appointments` DISABLE KEYS */;
INSERT INTO `omk_opd_appointments` VALUES (1,'OP1','Orthopedic','2015-12-08 13:17:00','New','Attended','2015-12-08 13:17:00','Doctor 1','Reference Doctor One','Not Registered','2015-12-08 13:21:00','BL1'),(2,'OP2','Ayurved','2015-12-08 13:18:00','New','Not Attended','2015-12-08 13:18:00','Doctor 3','Refernce 3','Not Registered',NULL,NULL),(3,'OP3','Department007','2015-12-15 11:18:00','New','Attended','2015-12-15 11:18:00','Doctor007','Refernce007','IP6','2015-12-15 11:27:00','BL2'),(4,'OP4','Department007','2015-12-15 17:00:00','New','Attended','2015-12-15 11:21:00','Doctor007','Refernce007','IP4','2015-12-15 12:09:00','BL3'),(6,'OP3','','2015-12-15 11:51:00','Follow-Up','Not Attended','2015-12-15 11:51:00','Doctor007','','IP6',NULL,NULL);
/*!40000 ALTER TABLE `omk_opd_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_opd_billing_details`
--

DROP TABLE IF EXISTS `omk_opd_billing_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_opd_billing_details` (
  `bill_srno` int(10) NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(100) DEFAULT NULL,
  `bill_date_of_bill` datetime DEFAULT NULL,
  `bill_total` varchar(100) DEFAULT NULL,
  `bill_balance` varchar(100) DEFAULT NULL,
  `bill_paid` varchar(100) DEFAULT NULL,
  `bill_service_taken_id` varchar(100) DEFAULT NULL,
  `bill_opd_id` varchar(100) DEFAULT NULL,
  `bill_opd_datetime_of_appointment` datetime DEFAULT NULL,
  `opd_prev_bal` varchar(10) DEFAULT NULL,
  `opd_discount` varchar(10) DEFAULT NULL,
  `opd_subtotal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bill_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_opd_billing_details`
--

LOCK TABLES `omk_opd_billing_details` WRITE;
/*!40000 ALTER TABLE `omk_opd_billing_details` DISABLE KEYS */;
INSERT INTO `omk_opd_billing_details` VALUES (1,'BL1','2015-12-08 13:21:00','1240','40','1200','ST1','OP1','2015-12-08 13:17:00','0','40','1280'),(2,'BL2','2015-12-15 11:27:00','3590','10','3580','ST2','OP3','2015-12-15 11:18:00','0','10','3600'),(3,'BL3','2015-12-15 12:09:00','2100','0','2100','ST3','OP4','2015-12-15 17:00:00','0','0','2100');
/*!40000 ALTER TABLE `omk_opd_billing_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_reception_details`
--

DROP TABLE IF EXISTS `omk_reception_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_reception_details` (
  `reception_srno` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dateOfJoining` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `education` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`reception_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_reception_details`
--

LOCK TABLES `omk_reception_details` WRITE;
/*!40000 ALTER TABLE `omk_reception_details` DISABLE KEYS */;
INSERT INTO `omk_reception_details` VALUES (2,'R1','Reception One','23-10-2015','20','Male','309488904550','sdvnsnl','Pune','rajufulari123@gmail.com'),(3,'R3','Reception123','11/11/2015','67','Female','9876564534','MBA','pune','rajufulari@ymail.com'),(4,'R4','Reception007','12/12/2012','23','Female','9999999999','Nan','pune','rajufulari123@gmail.com');
/*!40000 ALTER TABLE `omk_reception_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_refernce_doctor`
--

DROP TABLE IF EXISTS `omk_refernce_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_refernce_doctor` (
  `srno` int(10) NOT NULL AUTO_INCREMENT,
  `Rd_id` varchar(20) DEFAULT NULL,
  `Rd_name` varchar(100) DEFAULT NULL,
  `Rd_age` varchar(20) DEFAULT NULL,
  `Rd_gender` varchar(10) DEFAULT NULL,
  `Rd_address` varchar(1000) DEFAULT NULL,
  `Rd_contact` varchar(20) DEFAULT NULL,
  `Education` varchar(500) DEFAULT NULL,
  `specialization` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_refernce_doctor`
--

LOCK TABLES `omk_refernce_doctor` WRITE;
/*!40000 ALTER TABLE `omk_refernce_doctor` DISABLE KEYS */;
INSERT INTO `omk_refernce_doctor` VALUES (1,'RD1','Reference Doctor One','40','Male','Pune Clinic - Test','1287635490','MBBS','SKBKJK'),(2,'RD2','Reference Two','56','Female','asc - JAsbcj','2987984360','kasdbv','sldvnlsv'),(3,'RD3','Refernce 3','54','Female','pune','54565757676','gh','hfj'),(4,'RD4','refernce 4','45','Male','pune','8767564533','tert','tryy'),(5,'RD5','Refernce007','70','Male','pune','7777777777','mmm','mmmm');
/*!40000 ALTER TABLE `omk_refernce_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_room`
--

DROP TABLE IF EXISTS `omk_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_room` (
  `room_id` varchar(10) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `room_per_price` int(10) DEFAULT NULL,
  `sr_no` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_room`
--

LOCK TABLES `omk_room` WRITE;
/*!40000 ALTER TABLE `omk_room` DISABLE KEYS */;
INSERT INTO `omk_room` VALUES ('R1','General Ward Male',150,1),('R2','General Ward Female',150,2),('R3','Semi Private',300,3),('R4','Private Room',400,4),('R5','Deluxe',500,5),('R6','Room007',70000,6);
/*!40000 ALTER TABLE `omk_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_service_details`
--

DROP TABLE IF EXISTS `omk_service_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_service_details` (
  `service_sr_no` int(10) NOT NULL AUTO_INCREMENT,
  `serviceId` varchar(50) DEFAULT NULL,
  `service_name` varchar(1000) DEFAULT NULL,
  `service_price` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`service_sr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_service_details`
--

LOCK TABLES `omk_service_details` WRITE;
/*!40000 ALTER TABLE `omk_service_details` DISABLE KEYS */;
INSERT INTO `omk_service_details` VALUES (1,'S1','Service One','100'),(2,'S2','Service Two','200'),(3,'S3','service three','300'),(4,'S4','service four','400'),(6,'S6','service six','600'),(7,'S7','service seven','700'),(8,'S8','service eight','800'),(9,'S9','service nine','900'),(22,'S10','service007','700');
/*!40000 ALTER TABLE `omk_service_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omk_services_taken_details`
--

DROP TABLE IF EXISTS `omk_services_taken_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omk_services_taken_details` (
  `service_taken_srno` int(10) NOT NULL AUTO_INCREMENT,
  `servicename` varchar(1000) DEFAULT NULL,
  `servicequantity` varchar(100) DEFAULT NULL,
  `service_total_price` varchar(10) DEFAULT NULL,
  `service_per_price` varchar(10) DEFAULT NULL,
  `services_date_of_billing` datetime DEFAULT NULL,
  `servicetaken_id` varchar(10) DEFAULT NULL,
  `current_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`service_taken_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omk_services_taken_details`
--

LOCK TABLES `omk_services_taken_details` WRITE;
/*!40000 ALTER TABLE `omk_services_taken_details` DISABLE KEYS */;
INSERT INTO `omk_services_taken_details` VALUES (1,'service thirteen','1','130','130','2015-12-08 13:21:00','ST1',1),(2,'Service Seventeen','1','170','170','2015-12-08 13:21:00','ST1',1),(3,'Service eighteen','1','180','180','2015-12-08 13:21:00','ST1',1),(4,'service eight','1','800','800','2015-12-08 13:21:00','ST1',1),(5,'service three','1','300','300','2015-12-15 11:27:00','ST2',2),(6,'service seven','1','700','700','2015-12-15 11:27:00','ST2',2),(7,'Service One','1','100','100','2015-12-15 11:27:00','ST2',2),(8,'service Five','1','500','500','2015-12-15 11:27:00','ST2',2),(9,'service seven','1','700','700','2015-12-15 11:27:00','ST2',2),(10,'Service Two','1','200','200','2015-12-15 11:27:00','ST2',2),(11,'service Five','1','500','500','2015-12-15 11:27:00','ST2',2),(12,'service six','1','600','600','2015-12-15 11:27:00','ST2',2),(13,'service007','1','700','700','2015-12-15 12:09:00','ST3',3),(14,'service007','1','700','700','2015-12-15 12:09:00','ST3',3),(15,'service007','1','700','700','2015-12-15 12:09:00','ST3',3);
/*!40000 ALTER TABLE `omk_services_taken_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-15 15:19:20
