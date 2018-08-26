/*
SQLyog Community v10.3 
MySQL - 5.5.50-log : Database - tms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `batch` */

CREATE TABLE `batch` (
  `batch_id` int(10) NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(50) NOT NULL,
  `start_time` varchar(50) NOT NULL,
  `end_time` varchar(50) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `sdate` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `batch` */

insert  into `batch`(`batch_id`,`batch_name`,`start_time`,`end_time`,`emp_id`,`s_name`,`cname`,`sdate`,`status`) values (1,'DMCP_31','10:00','12:00',7,'java','DMCP','2018-03-31','running'),(2,'ANDROID_30','03:30','04:30',8,'Android','Android','2018-03-30','running'),(3,'PHP_29','02:00','03:30',7,'PHP','PHP','2018-03-29','running'),(4,'java07_04_2018','03:25','05:05',8,'Android','Android','2018-03-01','running'),(5,'android07_04_2018','14:01','16:01',8,'Android','Android','2017-12-29','running'),(6,'python07_04_2018','13:00','16:00',8,'python','python','2017-12-30','running');

/*Table structure for table `batch_attendance` */

CREATE TABLE `batch_attendance` (
  `batch_attid` int(10) NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) NOT NULL,
  `date` varchar(50) NOT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`batch_attid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `batch_attendance` */

insert  into `batch_attendance`(`batch_attid`,`batch_id`,`date`,`remarks`,`status`) values (1,1,'2018-03-31',NULL,'Taken'),(2,2,'2018-03-31',NULL,'Taken'),(3,3,'2018-03-31',NULL,'Taken'),(4,1,'2018-04-01',NULL,'Taken'),(5,1,'2018-04-02',NULL,'Taken'),(6,2,'2018-03-01',NULL,'Taken'),(7,1,'2018-03-04',NULL,'Taken'),(8,1,'2018-03-03',NULL,'Taken'),(9,3,'2018-04-03',NULL,'Taken'),(10,2,'2018-04-04',NULL,'Taken'),(11,1,'2018-03-29',NULL,'Taken'),(12,2,'2018-04-01',NULL,'Taken');

/*Table structure for table `course` */

CREATE TABLE `course` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) NOT NULL,
  `cfees` varchar(10) NOT NULL,
  `cduration` varchar(25) NOT NULL,
  `csubjects` varchar(100) NOT NULL,
  `cremarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Data for the table `course` */

insert  into `course`(`cid`,`cname`,`cfees`,`cduration`,`csubjects`,`cremarks`) values (1,'Java','3000','2 months','java,','core java'),(2,'c++','2500','2 months','c++,','only c++'),(3,'PHP','4000','2 months','PHP,','only PHP'),(4,'Python','4500','2 months','python,','only python'),(5,'Android','5000','3 months','Android,','Android'),(6,'Asp.net','5500','3 months','Asp.net,','only asp.net'),(7,'vb.net','3000','2 months','vb.net,','only vb.net'),(8,'Data structure','2500','2 months','Data structure,','only data structure'),(9,'System Software','3000','3 months','System Software,','System Software'),(10,'HTML','1500','1 month','HTML,','HTML'),(11,'IOT','6000','3 months','IOT,','IOT'),(12,'Neural Networks','3000','2 months','Neural Networks,','Neural Networks'),(13,'MIS','3000','2 months','Management Information system,','Management Information Syatem'),(14,'CSCU','5000','3 months','Certified secure computer user,','Certified secure computer user'),(15,'Comptia+','4000','3 months','comptia a+,','only comptia+'),(16,'N+','5500','3 months','n+,','N+'),(17,'MCITP','6000','2 months','MCITP,','MCITP'),(18,'CEH','3800','2 months','CEH,','CEH'),(19,'IELTS','2500','2 months','IELTS,',''),(20,'RHCSA','3000','2 months','RHCSA,',''),(21,'CCNA','3000','3 months','CCNA,',''),(22,'CCNP','4000','3 months',' CCNP,',''),(23,'CCNP','3000','3 months','CCNA, CCNP,',''),(24,'E-Commerce','5500','3 months','E-COMMERCE,',''),(25,'Digital Marketing','5500','1 month','Digital Marketing,',''),(26,'os','5600','','OS,',''),(27,'Computer Graphics','3600','3 months','Computer graphics,',''),(28,'Advance Java','5500','3 months','advanced java,',''),(29,'c#','5500','3 months','c#,',''),(30,'DMCP','12000','','c++,java,PHP,vb.net,',''),(31,'CHNA','5500','1 month','c++,java,comptia a+,n+,CEH,RHCSA,CCNA,',''),(32,'Advance CHNA','3000','3 months','c++,java,PHP,IOT',''),(33,'CSP','70000','','c++,java',''),(34,'CSPP','100000','12 Months','c++,java,PHP,python,Android,Asp.net,vb.net,c#,','');

/*Table structure for table `employee` */

CREATE TABLE `employee` (
  `empid` int(10) NOT NULL AUTO_INCREMENT,
  `empusername` varchar(50) NOT NULL,
  `emppassword` varchar(100) NOT NULL,
  `empname` varchar(50) NOT NULL,
  `empaddress` varchar(200) NOT NULL,
  `empmobile` varchar(10) NOT NULL,
  `empemail` varchar(50) NOT NULL,
  `empqualification` varchar(50) NOT NULL,
  `empdesignation` varchar(50) NOT NULL,
  `empaadhar` varchar(12) NOT NULL,
  `empsalary` int(10) NOT NULL,
  `empsubject` varchar(50) NOT NULL,
  `empjoindate` date DEFAULT NULL,
  `empimg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`empid`,`empusername`,`emppassword`,`empname`,`empaddress`,`empmobile`,`empemail`,`empqualification`,`empdesignation`,`empaadhar`,`empsalary`,`empsubject`,`empjoindate`,`empimg`) values (1,'aniket','e4db857a36521c573c1f649dc8b1ac32065298ece1a3a25688cfa6e2f871b2dd','Aniket Gajjar','Krushnanagar Society , Navavadaj , Krushnanagar','9898622183','aniketgajjar966@gmail.com','MscIT','Admin','466525365986',25000,'not faculty','2018-01-01','20160824_135837.jpg'),(2,'mokshit','c57b5014bf0ef543ee3ceec7197c3e5ee3d7ddcf1da5b1fa26414c18416d343e','Mokshit Shah','Mokshrajvilla Flat,Near -Dev Hospital,Vasna','8866221377','mokshitshah1998@gmail.com','MscIT','Admin','580005464544',50000,'not faculty','2018-01-01','ms.jpg'),(3,'Neel2898','ea0c95194e1688ceb9b32cd527c88827bc3f69e4d96ff05f4c6e54e204c6713f','Neel','2036/6, opp.upasana school,beside vitthal temple, dolatkhana, sarangpur, ahmedabad 01','8733942898','mrdrasticthakkar@gmail.com','BScIT','Admin','252552525252',25000,'not faculty','2018-01-01','ms.jpg'),(5,'Misha','b6f399edd6129447b7bb8d54be95b62abd643689d8603bb1ec4ce4baf24ff0fc','Misha','2036/6, dolatkhana, srangpur, ahmedabad 01','7433974910','mishuthakkar9999@gmail.com','BScIT','Faculty','252552525252',25000,'c++,java,PHP,','2018-02-05','ms.jpg'),(7,'Neelfaculty','ea0c95194e1688ceb9b32cd527c88827bc3f69e4d96ff05f4c6e54e204c6713f','Neel','2036/6, dolatkhana, sarangpur, ahmedabad 01','8733942898','mrdrasticthakkar1@gmail.com','BScIT','Faculty','202025256562',22000,'java,PHP,','2018-03-01','ms.jpg'),(8,'aniketfaculty','e4db857a36521c573c1f649dc8b1ac32065298ece1a3a25688cfa6e2f871b2dd','aniket gajjar','Krushnanagar Society , Navavadaj , Krushnanagar','9714670032','ganeshenterprice955@gmail.com','MSCIT','Faculty','252552525252',20000,'python,Android,','2018-02-01','ms.jpg'),(9,'mokshitfaculty','c57b5014bf0ef543ee3ceec7197c3e5ee3d7ddcf1da5b1fa26414c18416d343e','mokshit shah','Mokshrajvilla Flat,Near -Dev Hospital,Vasna','9426930551','tony65600st@gmail.com','MSCIT','Faculty','252552525252',35000,'Asp.net,vb.net,','2018-02-01','ms.jpg'),(10,'Disha','9601d8425b52ae86ea31d23e87df04ce5b4a2821748b5a4a857124032729b740','Disha Pandya','kenyug apparment, shyamal, satelite','8980928127','dishapandya1497@gmail.com','BScIT','Faculty','252552525252',20000,'vb.net,','2018-02-01','ms.jpg'),(11,'Aneri','f45909f2e17814c54d8c59ebb32e30dcf5c3240f7144cab5359039e96aa796ce','Aneri shah','41/490 akash deep appartment, nava vadaj','8401380858','anerishah8198@gmail.com','BScIT','Faculty','525265654545',20000,'Data structure,','2018-02-01','ms.jpg'),(12,'tamanna','854d1f10b95d1e28d500108e495a3e64357443ab56f4cc9c103aefd54efbd4d9','Tamanna Nagar','meghani nagar','9898637435','tamannanagar111@gmail.com','MSCIT','Faculty','525289897889',35000,'System Software,','2018-02-01','ms.jpg'),(14,'ritufaculty','ddfc5ef080dc4dba0a30545b0280529610ea2b10722436c167252eb1105e7e58','Ritu Kapadia','khokhra , maninagar','9737712989','ritumkapadia@gmail.com','BScIT','Faculty','989878784545',12000,'HTML,','2018-02-01','ms.jpg'),(15,'jayswee','f79ede522620dad0d4828fdecbef7abe15f1fdcf3748f6133446e3229441b587','jayswee shah','navrangpura','9773844376','kushalbagadia9999@gmail.com','MSCIT','Faculty','875645562123',32000,'IOT,','2018-02-01','ms.jpg'),(16,'ajayfaculty','8e4ee04091fd16017000373f5db76e722acf9a3694ac0a0701f8bad7bf84b81b','Ajay solanki','anjar','9879987374','ajudigu@gmail.com','MSCIT','Faculty','986585745656',23000,'Neural Networks,','2018-02-02','ms.jpg'),(17,'varhhil','9f676a6cc42cf98a82cc97ba53406bf8abb4293570232b0587da99f3403cba34','varshil variya','mangalpark society, maninagar','9898622183','varshilvariya24@gmail.com','BScIT','Faculty','747454655252',25000,'Management Information system,','2018-02-01','ms.jpg'),(18,'stavan','407f185ee0623217c54d281cc9299cc8d66158d6c4ff6781596b0fedf679bef8','stavan yodh','hajira ni pole, raipur, ahmedabad 01','9724177560','stavu.yodh14798@gmail.com','BScIT','Faculty','636352524141',25000,'Certified secure computer user,','2018-02-01','ms.jpg'),(19,'nikunj','2eaa84c8446abbc9a9738600077127fa23466744a243f24f7e609df35b649199','nikunj thakkar','sudama sadan, b/h. punitashram maninagar, ahmedabad 01','9512107150','nikunj02111997@gmail.com','BScIT','Faculty','363652521414',22000,'comptia a+,','2018-02-01','20160824_135837.jpg'),(20,'krushal','a68130265cdbe2a6c1e57b8264b92f4d8b1fe8f88ced0b7a27514f085f235ef2','krushal kalal','dharnidhar','9909996466','aniketgajjar9662@gmail.com','BScIT','Faculty','969685857474',35000,'n+,','2018-02-01','20160824_135837.jpg'),(21,'sandip','f9989023d4749c43af56b92b6d1b7d019056a5f550b744f94d2096293895d1e8','sandi parmar','ahmedabad','8733942898','aniketgajjar96623@gmail.com','MSCIT','Faculty','858596967474',52000,'MCITP,','2018-02-01','20160824_135837.jpg'),(22,'sandip','f9989023d4749c43af56b92b6d1b7d019056a5f550b744f94d2096293895d1e8','sandi parmar','ahmedabad','8733942898','aniketgajjar96623@gmail.com','MSCIT','Faculty','858596967474',52000,'MCITP,','2018-02-01','20160824_135837.jpg'),(23,'sandip','f9989023d4749c43af56b92b6d1b7d019056a5f550b744f94d2096293895d1e8','sandi parmar','ahmedabad','8733942898','aniketgajjar96623@gmail.com','MSCIT','Faculty','858596967474',52000,'MCITP,','2018-02-01','20160824_135837.jpg'),(24,'jagdish','1bd2df6d8ec1208b600ae8ace31f9be7a795856771fd77e4a22fba9310d7dbd7','jagdish prajapati','naranpura','9714670032','sahilshah211998.ss6@gmail.com','BScIT','Faculty','747414145252',23200,'CEH,','2018-02-01','20160824_135837.jpg'),(25,'jaymin','b4e4411150d3a4a9fab27dd0326a34b2c8dcd86e79f5fc425f1b842fa11d303e','jaymin otwani','isanpur','9537771137','jaymin3097@gmail.com','BScIT','Faculty','123456789123',36000,'IELTS,','2018-02-01','20160824_135837.jpg'),(26,'vedant','837f8527e1a520cf88f414980e8e0dddb02e3672d8fca2aa3f79eca8fc20a764','vedant patel','naranpura','9426930551','thakkarneel2036@gmail.com','BScIT','Manager','252565654545',35000,'not faculty','2018-02-01','20160824_135837.jpg'),(27,'maulik','7365ea3d6f466c1384d2f0b77871f27e0a7b5ae6e73a842f48bcd715b047c054','maulik','100/1199 narnapura','9558161697','maulikshah481997@gmail.com','BScIT','Manager','858596967474',35000,'not faculty','2018-02-01','20160824_135837.jpg'),(28,'nemish','7ed3a55ca0e7539bc905b8075e39759ca8f824e5eb2c018b9cb68bd66568e0df','nemi shah','chandrangar,ahmedabad','8690099696','nshah3250@gmail.com','BScIT','Manager','969685857474',35000,'not faculty','2018-02-01','20160824_135837.jpg'),(29,'Dheer','d186d16798ad98a05405d0c105107e7d33f0e47f3989942b6462fa7cf2e6a698','Dheer Kothari','Ahmedabad','9033856085','dheerkothari2912@gmail.com','BScIT','Counsellor','525263634141',35000,'not faculty','2018-02-01','20160824_135837.jpg'),(30,'anerishah','da3540e1d8d9e19b9063bb9fb8ca349c979b747c2f93d878122b30f29a41b5aa','aneri shah','nava vadaj','9033992898','thakkarneel2898@gmail.com','BScIT','Accountant','963852741741',35000,'not faculty','2018-02-01','20160824_135837.jpg'),(31,'aniketmanager','e4db857a36521c573c1f649dc8b1ac32065298ece1a3a25688cfa6e2f871b2dd','aniket','37-mahadevnagar society,navavadaj,ahemdabad-13','9714670032','aniketgajjar966@gmail.com','mscit','Manager','569823654879',25000,'not faculty','2018-02-02','20160824_135837.jpg'),(32,'aniketaccoutant','e4db857a36521c573c1f649dc8b1ac32065298ece1a3a25688cfa6e2f871b2dd','aniket','37-Mahadevnagar Society, Navavadaj , Ahemdabad-13','9714670032','aniketgajjar966@gmail.com','MSCIT','Accountant','165465465465',50000,'not faculty','2018-02-09','20160824_135837.jpg'),(33,'aniketcounsellor','e4db857a36521c573c1f649dc8b1ac32065298ece1a3a25688cfa6e2f871b2dd','aniket','37-mahadevnagar Society,Navavadaj,Ahemdabad-13','9714670032','aniketgajjar966@gmail.com','MSCIT','Counsellor','256456489898',95600,'not faculty','2018-02-15','20160824_135837.jpg');

/*Table structure for table `employee_attendence` */

CREATE TABLE `employee_attendence` (
  `emp_attid` int(10) NOT NULL AUTO_INCREMENT,
  `empid` int(10) NOT NULL,
  `date` varchar(10) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`emp_attid`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `employee_attendence` */

insert  into `employee_attendence`(`emp_attid`,`empid`,`date`,`status`) values (1,1,'2018-03-25','present'),(2,2,'2018-03-25','present'),(3,3,'2018-03-25','present'),(4,26,'2018-03-25','present'),(5,27,'2018-03-25','present'),(6,28,'2018-03-25','present'),(7,31,'2018-03-25','present'),(8,5,'2018-03-25','present'),(9,7,'2018-03-25','present'),(10,8,'2018-03-25','present'),(11,9,'2018-03-25','present'),(12,10,'2018-03-25','present'),(13,11,'2018-03-25','present'),(14,12,'2018-03-25','present'),(15,14,'2018-03-25','present'),(16,15,'2018-03-25','present'),(17,16,'2018-03-25','present'),(18,17,'2018-03-25','present'),(19,18,'2018-03-25','present'),(20,19,'2018-03-25','present'),(21,20,'2018-03-25','present'),(22,21,'2018-03-25','present'),(23,22,'2018-03-25','present'),(24,23,'2018-03-25','present'),(25,24,'2018-03-25','present'),(26,25,'2018-03-25','present'),(27,30,'2018-03-25','present'),(28,32,'2018-03-25','present'),(29,29,'2018-03-25','present'),(30,33,'2018-03-25','present'),(31,1,'2018-03-26','present'),(32,2,'2018-03-26','present'),(33,2,'2018-03-27','present'),(34,3,'2018-03-27','present'),(35,1,'2018-03-28','present'),(36,2,'2018-03-28','present'),(37,2,'2018-03-29','present'),(38,1,'2018-03-30','present'),(39,3,'2018-03-30','present'),(40,26,'2018-03-31','present'),(41,27,'2018-03-31','present'),(42,28,'2018-03-31','present'),(43,31,'2018-03-31','present'),(44,5,'2018-03-31','present'),(45,7,'2018-03-31','present'),(46,8,'2018-03-31','present'),(47,9,'2018-03-31','present'),(48,10,'2018-03-31','present'),(49,11,'2018-03-31','present'),(50,12,'2018-03-31','present'),(51,14,'2018-03-31','present'),(52,15,'2018-03-31','present'),(53,16,'2018-03-31','present'),(54,17,'2018-03-31','present'),(55,18,'2018-03-31','present'),(56,19,'2018-03-31','present'),(57,20,'2018-03-31','present'),(58,21,'2018-03-31','present'),(59,22,'2018-03-31','present'),(60,23,'2018-03-31','present'),(61,24,'2018-03-31','present'),(62,25,'2018-03-31','present'),(63,30,'2018-03-31','present'),(64,32,'2018-03-31','present'),(65,29,'2018-03-31','present'),(66,33,'2018-03-31','present');

/*Table structure for table `exam_attendance` */

CREATE TABLE `exam_attendance` (
  `ex_attid` int(10) NOT NULL AUTO_INCREMENT,
  `exa_id` int(10) NOT NULL,
  `stuid` int(10) NOT NULL,
  `present` varchar(10) DEFAULT NULL,
  `ob_marks` int(5) DEFAULT NULL,
  PRIMARY KEY (`ex_attid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `exam_attendance` */

insert  into `exam_attendance`(`ex_attid`,`exa_id`,`stuid`,`present`,`ob_marks`) values (1,1,2,'absent',0),(2,1,12,'present',35),(3,1,16,'present',36),(4,2,9,'present',90);

/*Table structure for table `exam_master` */

CREATE TABLE `exam_master` (
  `exa_id` int(10) NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) NOT NULL,
  `date` varchar(25) NOT NULL,
  `time` varchar(25) NOT NULL,
  `tmarks` int(5) NOT NULL,
  `pmarks` int(5) NOT NULL,
  `exa_name` varchar(25) NOT NULL,
  PRIMARY KEY (`exa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `exam_master` */

insert  into `exam_master`(`exa_id`,`batch_id`,`date`,`time`,`tmarks`,`pmarks`,`exa_name`) values (1,1,'2018-04-01','120',50,20,'PHP'),(2,2,'2018-04-01','180',100,32,'ANDROID');

/*Table structure for table `fees` */

CREATE TABLE `fees` (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL,
  `totalfees` varchar(15) NOT NULL,
  `paid` varchar(15) NOT NULL,
  `remaining` varchar(15) NOT NULL,
  `ptype` varchar(20) NOT NULL,
  `pdetail` varchar(35) DEFAULT NULL,
  `installment` varchar(30) NOT NULL,
  `amount` varchar(15) NOT NULL,
  `date` varchar(20) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `fees` */

insert  into `fees`(`fid`,`sid`,`totalfees`,`paid`,`remaining`,`ptype`,`pdetail`,`installment`,`amount`,`date`,`remarks`) values (1,2,'12000','5000','7000','cheque','cheque no = 123456','Second','7000','2018-03-31','-'),(2,3,'5500','3000','2500','cash','cash','Second','2500','2018-03-31','-'),(3,10,'12000','6000','6000','cheque','cheque no = 45978','Second','3000','2018-03-30','-'),(4,15,'100000','40000','60000','cash','cash','Second','30000','2018-03-29','-'),(5,12,'12000','6000','6000','cheque','cheque no = 789456','Second','6000','2018-03-31','ALL PAID'),(6,3,'','5500','19500','cash','cash','Third','2500','2018-04-13',''),(7,3,'25000','8000','17000','cash','cash','Third','1500','2018-04-30',''),(8,3,'25000','9500','15500','cash','cash','Second','500','2018-04-12',''),(9,3,'25000','10000','15000','cash','cash','Second','500','2018-04-13',''),(10,3,'25000','10500','14500','cash','cash','Second','500','2018-04-27',''),(11,3,'25000','11000','14000','cash','cash','Third','1500','2018-04-30','cash payment'),(12,3,'25000','12500','12500','cash','cash','Second','200','2018-05-02',''),(13,3,'25000','12500','12500','cash','cash','Second','200','2018-05-02','');

/*Table structure for table `inquiry` */

CREATE TABLE `inquiry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `isname` varchar(50) NOT NULL,
  `isemail` varchar(35) DEFAULT NULL,
  `isref` varchar(100) DEFAULT NULL,
  `ismobile` varchar(15) NOT NULL,
  `date` varchar(20) DEFAULT NULL,
  `interest` varchar(150) DEFAULT NULL,
  `icourse` varchar(40) NOT NULL,
  `iremarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `inquiry` */

insert  into `inquiry`(`id`,`isname`,`isemail`,`isref`,`ismobile`,`date`,`interest`,`icourse`,`iremarks`) values (1,'Dhruvil','drs@gmail.com','Rohan','947856123','2018-04-05','Java,c++,PHP,Python,Android,','1','-'),(2,'aniket','aniketgajjar966@gmail.com','','9714670032','2018-04-21','c++,Python,','1',''),(3,'hardik','aniketgajjar966@gmail.com','','9714670032','2018-05-12','PHP,Python,','1',''),(4,'krushal','aniketgajjar966@gmail.com','','9714670032','2018-05-25','c++,PHP,','6',''),(5,'misha','mishuthakkar9999@gmail.com','','7433974910','2018-06-15','PHP,Python,Android,','6','');

/*Table structure for table `salary` */

CREATE TABLE `salary` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `empid` int(10) NOT NULL,
  `tsalary` varchar(15) NOT NULL,
  `month` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `tattend` varchar(5) DEFAULT NULL,
  `nsalary` varchar(20) DEFAULT NULL,
  `ptype` varchar(10) NOT NULL,
  `pdetail` varchar(100) DEFAULT NULL,
  `pdate` varchar(20) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `empid` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `salary` */

insert  into `salary`(`sid`,`empid`,`tsalary`,`month`,`year`,`tattend`,`nsalary`,`ptype`,`pdetail`,`pdate`,`remarks`) values (1,1,'25000','March','2018','4','3224','cheque','cheque no = 896455','2018-03-31','-'),(2,2,'50000','March','2018','5','8060','cheque','cheque no = 578956','2018-03-31','-'),(3,3,'25000','March','2018','3','2418','cheque','cheque no = 456879','2018-03-31','-'),(4,29,'35000','March','2018','2','2258','cash','cash','2018-03-31','-'),(5,9,'35000','March','2018','2','2258','cheque','cheque no = 122235','2018-03-31','-'),(6,26,'35000','March','2018','2','2258','cheque','cheque no = 789456','2018-03-31','-'),(7,32,'50000','March','2018','2','3224','cheque','cheque no = 123456','2018-03-31','-');

/*Table structure for table `stock` */

CREATE TABLE `stock` (
  `stid` int(20) NOT NULL AUTO_INCREMENT,
  `stname` varchar(50) NOT NULL,
  `stquantity` int(10) NOT NULL,
  `sttype` varchar(30) DEFAULT NULL,
  `stsubject` varchar(50) DEFAULT NULL,
  `stcourse` varchar(50) DEFAULT NULL,
  `stremarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `stock` */

insert  into `stock`(`stid`,`stname`,`stquantity`,`sttype`,`stsubject`,`stcourse`,`stremarks`) values (1,'Pen',10,'Stationary','other','other','All Pens '),(2,'Duster',5,'Stationary','other','other','-'),(3,'JAVA BOOK',30,'Study','java','java','Core Java'),(4,'PHP BOOK',20,'Study','PHP','DMCP','-'),(5,'Advance Java',20,'Study','advanced java','advanced java','-'),(6,'Android Pemplate',30,'Study','Android','Android','-'),(7,'Java Templates',20,'Study','java','DMCP','Both Books'),(8,'Python',10,'Study','python','python','-'),(9,'IOT Pemplate',20,'Study','IOT','IOT','-'),(10,'PQR',10,'Stationary','other','other','-');

/*Table structure for table `student` */

CREATE TABLE `student` (
  `stuid` int(10) NOT NULL AUTO_INCREMENT,
  `stuname` varchar(50) NOT NULL,
  `stuaddress` varchar(100) DEFAULT NULL,
  `stumobile` varchar(10) DEFAULT NULL,
  `stuemail` varchar(30) DEFAULT NULL,
  `stugen` varchar(10) DEFAULT NULL,
  `parname` varchar(40) DEFAULT NULL,
  `parmobile` varchar(10) DEFAULT NULL,
  `paremail` varchar(30) DEFAULT NULL,
  `batchid` varchar(10) DEFAULT NULL,
  `refname` varchar(50) DEFAULT NULL,
  `courseid` int(10) DEFAULT NULL,
  `totalfees` int(15) DEFAULT NULL,
  `paidamount` varchar(15) DEFAULT NULL,
  `stubook` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`stuid`,`stuname`,`stuaddress`,`stumobile`,`stuemail`,`stugen`,`parname`,`parmobile`,`paremail`,`batchid`,`refname`,`courseid`,`totalfees`,`paidamount`,`stubook`) values (1,'Mokshit','Ahmedabad','9426930551','mokshitshah2015@gmail.com','male','Pankaj','9426930551','mokshitshah2015@gmail.com','3','Neel',3,4000,'1000','Yes'),(2,'Neel Thakkar','Sarangpur','8733942898','mrdrasticthakkar@gmail.com','male','Milanbhai Thakkar','8733942898','mrdrasticthakkar@gmail.com','1','Mokshit',30,12000,'DONE','No'),(3,'Aniket Gajjar','Naroda','9714670032','aniketgajjar966@gmail.com','male','Vinodbhai Gajjar','9714670032','aniketgajjar966@gmail.com','3','neel',31,25000,'12700','Yes'),(6,'Misha Thakkar','Sarangpur','7433974910','mishuthakkar9999@gmail.com','female','Pareshbhai Thakkar','7433974910','mishuthakkar9999@gmail.com','4','Neel',5,5000,'2000','Yes'),(7,'Disha Pandya','Ahmedabad','8980928127','dishapandya1497@gmail.com','female','Rameshbhai','8980928127','dishapandya1497@gmail.com','-','Mokshit',19,2500,'1000','Yes'),(8,'Aneri Shah','Ahmedabad','8401380858','anerishah8198@gmail.com','female','Maheshbhai ','8401380858','anerishah8198@gmail.com','-','Aniket',31,5000,'2500','Yes'),(9,'Tamanna Nagar','Meghaninagar','9898637435','tamannanagar111@gmail.com','female','Sanjaybhai','9898637435','tamannanagar111@gmail.com','2','Mokshit',5,5000,'3000','Yes'),(10,'Ritu Kapadia','Ahmedabad','9737712989','ritumkapadia@gmail.com','female','Vishalbhai','9737712989','ritumkapadia@gmail.com','-','Mokshit',30,12000,'9000','Yes'),(11,'Jayswee Shah','Ahmedabad','9773844376','kushalbagadia9999@gmail.com','female','Rajeshbhai','9773844376','kushalbagadia9999@gmail.com','-','Aniket',30,12000,'6000','Yes'),(12,'Ajay Solanki','Anjar','9879987374','ajudigu@gmail.com','male','Amitbhai','9879987374','ajudigu@gmail.com','1','Aniket',30,12000,'DONE','Yes'),(13,'Varshil variya','Ahmedabad','9898622183','varshilvariya24@gmail.com','male','Aanandbhai','9898622183','varshilvariya24@gmail.com','-','Neel',31,5500,'500','Yes'),(14,'Stavan Yodh','Sarangpur','9724177560','stavu.yodh14798@gmail.com','male','Hirakbhai','9724177560','stavu.yodh14798@gmail.com','-','Neel',34,100000,'60000','Yes'),(15,'Krushal kalal','Jivraj','9909996466','aniketgajjar9662@gmail.com','male','Roshanbhai','9909996466','aniketgajjar9662@gmail.com','-','Mokshit',34,100000,'70000','Yes'),(16,'Jhala Vrajpal','Navrangpura','8866221377','aniketgajjar9662@gmail.com','male','Sureshbhai','8866221377','aniketgajjar9662@gmail.com','1','Mokshit',30,12000,'6000','yes');

/*Table structure for table `student_attendence` */

CREATE TABLE `student_attendence` (
  `stu_attid` int(10) NOT NULL AUTO_INCREMENT,
  `stuid` int(10) NOT NULL,
  `bat_id` int(10) NOT NULL,
  `date` varchar(50) NOT NULL,
  `present` varchar(10) NOT NULL,
  PRIMARY KEY (`stu_attid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `student_attendence` */

insert  into `student_attendence`(`stu_attid`,`stuid`,`bat_id`,`date`,`present`) values (1,2,1,'2018-03-31','present'),(2,12,1,'2018-03-31','present'),(3,16,1,'2018-03-31','present'),(4,9,2,'2018-03-31','present'),(5,1,3,'2018-03-31','present'),(6,2,1,'2018-04-01','present'),(7,12,1,'2018-04-01','absent'),(8,16,1,'2018-04-01','present'),(9,2,1,'2018-04-02','absent'),(10,12,1,'2018-04-02','present'),(11,16,1,'2018-04-02','present'),(12,9,2,'2018-03-01','present'),(13,2,1,'2018-03-04','present'),(14,12,1,'2018-03-04','present'),(15,16,1,'2018-03-04','present'),(16,2,1,'2018-03-03','absent'),(17,12,1,'2018-03-03','present'),(18,16,1,'2018-03-03','absent'),(19,1,3,'2018-04-03','absent'),(20,9,2,'2018-04-04','absent'),(21,2,1,'2018-03-29','absent'),(22,12,1,'2018-03-29','absent'),(23,16,1,'2018-03-29','absent'),(24,2,1,'2018-03-29','absent'),(25,12,1,'2018-03-29','absent'),(26,16,1,'2018-03-29','absent'),(27,9,2,'2018-04-01','absent');

/*Table structure for table `subject` */

CREATE TABLE `subject` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(50) NOT NULL,
  `sfees` varchar(10) DEFAULT NULL,
  `cname` varchar(50) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `subject` */

insert  into `subject`(`sid`,`s_name`,`sfees`,`cname`) values (1,'c++','5000','c++,CHNA,DMCP,CSPP,ADVANCE'),(2,'java','5000','java,CHNA,DMCP,CSPP,ADVANCE CHNA,CHNA'),(3,'PHP','5000','PHP,DMCP,ADVANCE CHNA,CSPP'),(4,'python','5000','python,CSPP'),(5,'Android','5000','Android'),(6,'Asp.net','5000','Asp.net'),(7,'vb.net','5000','vb.net'),(8,'Data structure','5000','Data structure'),(9,'System Software','5000','System Software'),(10,'HTML','5000','HTML'),(11,'IOT','5000','IOT,ADVANCE CHNA'),(12,'Neural Networks','5000','Neural Networks'),(13,'Management Information system','5000','Management Information system'),(14,'Certified secure computer user','5000','Certified secure computer user'),(15,'comptia a+','5000','comptia a+'),(16,'n+','5000','n+'),(17,'MCITP','5000','MCITP'),(18,'CEH','5000','CEH'),(19,'IELTS','5000','IELTS'),(20,'RHCSA','5000','RHCSA'),(21,'CCNA','5000','CCNA'),(22,' CCNP','5000',''),(23,'DCNN','5000',''),(24,'E-COMMERCE','5000',''),(25,'Digital Marketing','5000',''),(26,'OS','5000',''),(27,'Computer graphics','5000',''),(28,'advanced java','5000','advanced java'),(29,'c#','5000',''),(30,'Ruby','5000',''),(31,'AI','8000','');

/*Table structure for table `temp_admission` */

CREATE TABLE `temp_admission` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `admissiondate` date DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `temp_admission` */

insert  into `temp_admission`(`aid`,`admissiondate`,`sid`) values (1,'2018-03-30',1),(2,'2018-03-31',2),(3,'2018-03-31',3),(4,'2018-03-31',4),(5,'2018-03-31',5),(6,'2018-03-31',6),(7,'2018-03-31',7),(8,'2018-03-31',8),(9,'2018-03-31',9),(10,'2018-03-31',10),(11,'2018-03-31',11),(12,'2018-03-31',12),(13,'2018-03-31',13),(14,'2018-03-31',14),(15,'2018-03-31',15),(16,'2018-03-31',16);

/* Trigger structure for table `student` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `my_addmission` AFTER INSERT ON `student` FOR EACH ROW BEGIN
		insert into `temp_admission`(`admissiondate`,`sid`) values(DATE(now()),NEW.stuid);
	END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
