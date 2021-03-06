-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: finddevdb
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `major` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cv` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_job` int DEFAULT NULL,
  `id_acc` int DEFAULT NULL,
  `address` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_em` (`id_job`),
  KEY `fk_idacc` (`id_acc`),
  KEY `fkCandidate_address_id` (`address`),
  CONSTRAINT `fk_em` FOREIGN KEY (`id_job`) REFERENCES `job` (`id`),
  CONSTRAINT `fk_idacc` FOREIGN KEY (`id_acc`) REFERENCES `user` (`id`),
  CONSTRAINT `fkCandidate_address_id` FOREIGN KEY (`address`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (1,'Ph???m Thanh Sang','Khoa h???c m??y t??nh','1954112073sang@ou.edu.vn','039295863','https://res.cloudinary.com/thanhsang123/image/upload/v1644718982/earxbxf8jdcd85sntyjx.jpg','male',2,2,79),(2,'Nguy???n V??n A','C??ng ngh??? th??ng tin','a.nguyenvan@gmail.com','0796742429',NULL,NULL,3,11,79),(3,'Thanhsa','C??ng ngh??? th??ng tin','123456@gmail.xyz','0398295331','https://res.cloudinary.com/thanhsang123/raw/upload/v1644639180/uyalc4k4zoyi89dknmkl',NULL,3,10,79),(6,'Nguy???n V??n A',NULL,'a.nguyenvan@gmail.com','0369852147','https://res.cloudinary.com/thanhsang123/image/upload/v1645099901/pfsbkbeu2yncudtyel9x.pdf',NULL,2,35,1);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dontuyendung`
--

DROP TABLE IF EXISTS `dontuyendung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dontuyendung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_candidate` int DEFAULT NULL,
  `datestart` date DEFAULT NULL,
  `id_tintuyendung` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cank` (`id_candidate`),
  KEY `fk_ttd` (`id_tintuyendung`),
  CONSTRAINT `fk_cank` FOREIGN KEY (`id_candidate`) REFERENCES `candidate` (`id`),
  CONSTRAINT `fk_ttd` FOREIGN KEY (`id_tintuyendung`) REFERENCES `tintuyendung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dontuyendung`
--

LOCK TABLES `dontuyendung` WRITE;
/*!40000 ALTER TABLE `dontuyendung` DISABLE KEYS */;
INSERT INTO `dontuyendung` VALUES (1,1,'2022-02-16',4),(2,1,'2022-02-16',2),(3,3,'2021-04-22',5),(4,6,'2022-02-17',8),(5,6,'2022-02-17',7),(6,1,'2022-02-17',7);
/*!40000 ALTER TABLE `dontuyendung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `slogan` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idUser` int DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkEm_address_id` (`address`),
  CONSTRAINT `fkEm_address_id` FOREIGN KEY (`address`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (1,'TIKI','Viet Nam','tiki.png','Trang mua s???m uy t??n - Tiki giao h??ng nhanh 2 gi???',15,'hotro@tiki.vn',79),(2,'SHOPEE','Viet Nam','shopee.png','G?? c??ng c?? mua h???t ??? Shopee',12,'hotro@shopee.vn',79),(3,'addcd','123','https://res.cloudinary.com/thanhsang123/image/upload/v1644719840/issub7ecak5cam8llfh2.jpg','123',NULL,'123',NULL),(4,'123','123','https://res.cloudinary.com/thanhsang123/image/upload/v1644721160/nryr6o4qixqe7ovnuyv4.jpg','123',24,'123',NULL),(5,'BBV Vi???t Nam','Vi???t Nam','https://res.cloudinary.com/thanhsang123/image/upload/v1645005260/ft2un4uyr7mmvbmcsnwd.png','bbv Vietnam stands for top quality in consulting, first class software engineering',32,'bbvvietnam@gmail.com',79),(6,'C??ng ty C??? ph???n Gi???i ph??p Thanh to??n Vi???t Nam','Vi???t Nam','https://res.cloudinary.com/thanhsang123/image/upload/v1645100142/hh085yvwmxijujyjrseb.png','C??ng ty C??? ph???n Gi???i ph??p Thanh to??n Vi???t Nam',36,'vnpay@pay.vn',1),(7,'Senior Software Developer','Vi???t Nam','https://res.cloudinary.com/thanhsang123/image/upload/v1645100768/vobwupnxm1cbmaxvgt9v.png','Gi???i Ph??p C??ng Ngh??? Cho Doanh Nghi???p',37,'contact@topERP.vn',79);
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Back end'),(2,'Front end'),(3,'Software Enginer'),(4,'Full stack'),(5,'Android'),(6,'Tester');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (0,'T???t c???','Kh??ng'),(1,'Th??nh ph??? H?? N???i','Th??nh ph??? Trung ????ng'),(2,'T???nh H?? Giang','T???nh'),(4,'T???nh Cao B???ng','T???nh'),(6,'T???nh B???c K???n','T???nh'),(8,'T???nh Tuy??n Quang','T???nh'),(10,'T???nh L??o Cai','T???nh'),(11,'T???nh ??i???n Bi??n','T???nh'),(12,'T???nh Lai Ch??u','T???nh'),(14,'T???nh S??n La','T???nh'),(15,'T???nh Y??n B??i','T???nh'),(17,'T???nh Ho?? B??nh','T???nh'),(19,'T???nh Th??i Nguy??n','T???nh'),(20,'T???nh L???ng S??n','T???nh'),(22,'T???nh Qu???ng Ninh','T???nh'),(24,'T???nh B???c Giang','T???nh'),(25,'T???nh Ph?? Th???','T???nh'),(26,'T???nh V??nh Ph??c','T???nh'),(27,'T???nh B???c Ninh','T???nh'),(30,'T???nh H???i D????ng','T???nh'),(31,'Th??nh ph??? H???i Ph??ng','Th??nh ph??? Trung ????ng'),(33,'T???nh H??ng Y??n','T???nh'),(34,'T???nh Th??i B??nh','T???nh'),(35,'T???nh H?? Nam','T???nh'),(36,'T???nh Nam ?????nh','T???nh'),(37,'T???nh Ninh B??nh','T???nh'),(38,'T???nh Thanh H??a','T???nh'),(40,'T???nh Ngh??? An','T???nh'),(42,'T???nh H?? T??nh','T???nh'),(44,'T???nh Qu???ng B??nh','T???nh'),(45,'T???nh Qu???ng Tr???','T???nh'),(46,'T???nh Th???a Thi??n Hu???','T???nh'),(48,'Th??nh ph??? ???? N???ng','Th??nh ph??? Trung ????ng'),(49,'T???nh Qu???ng Nam','T???nh'),(51,'T???nh Qu???ng Ng??i','T???nh'),(52,'T???nh B??nh ?????nh','T???nh'),(54,'T???nh Ph?? Y??n','T???nh'),(56,'T???nh Kh??nh H??a','T???nh'),(58,'T???nh Ninh Thu???n','T???nh'),(60,'T???nh B??nh Thu???n','T???nh'),(62,'T???nh Kon Tum','T???nh'),(64,'T???nh Gia Lai','T???nh'),(66,'T???nh ?????k L???k','T???nh'),(67,'T???nh ?????k N??ng','T???nh'),(68,'T???nh L??m ?????ng','T???nh'),(70,'T???nh B??nh Ph?????c','T???nh'),(72,'T???nh T??y Ninh','T???nh'),(74,'T???nh B??nh D????ng','T???nh'),(75,'T???nh ?????ng Nai','T???nh'),(77,'T???nh B?? R???a - V??ng T??u','T???nh'),(79,'Th??nh ph??? H??? Ch?? Minh','Th??nh ph??? Trung ????ng'),(80,'T???nh Long An','T???nh'),(82,'T???nh Ti???n Giang','T???nh'),(83,'T???nh B???n Tre','T???nh'),(84,'T???nh Tr?? Vinh','T???nh'),(86,'T???nh V??nh Long','T???nh'),(87,'T???nh ?????ng Th??p','T???nh'),(89,'T???nh An Giang','T???nh'),(91,'T???nh Ki??n Giang','T???nh'),(92,'Th??nh ph??? C???n Th??','Th??nh ph??? Trung ????ng'),(93,'T???nh H???u Giang','T???nh'),(94,'T???nh S??c Tr??ng','T???nh'),(95,'T???nh B???c Li??u','T???nh'),(96,'T???nh C?? Mau','T???nh');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tintuyendung`
--

DROP TABLE IF EXISTS `tintuyendung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tintuyendung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `descrip` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Skils` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `experience` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salary` bigint DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `id_employer` int DEFAULT NULL,
  `id_job` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emk` (`id_employer`),
  KEY `fk_job` (`id_job`),
  CONSTRAINT `fk_emk` FOREIGN KEY (`id_employer`) REFERENCES `employer` (`id`),
  CONSTRAINT `fk_job` FOREIGN KEY (`id_job`) REFERENCES `job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tintuyendung`
--

LOCK TABLES `tintuyendung` WRITE;
/*!40000 ALTER TABLE `tintuyendung` DISABLE KEYS */;
INSERT INTO `tintuyendung` VALUES (1,'L???p tr??nh vi??n Full stack','Ph??t tri???n c??c t??nh n??ng h?????ng t???i ng?????i d??ng m???i b???ng c??ch s??? d???ng Javascript v?? \nReactJS ????? ????p ???ng m???t s??? l?????ng l???n ng?????i d??ng.<br>\nX??y d???ng c??c th??nh ph???n c?? th??? t??i s??? d???ng v?? th?? vi???n front-end ????? s??? d???ng trong t????ng lai<br>\nX??y d???ng ???ng d???ng web','NodeJS, ReactJS, Java','Fresher',1000,'2021-11-22',1,4),(2,'NH??N VI??N TESTER','?????c hi???u c??c t??i li???u ?????c t??? h??? th???ng, y??u c???u nghi???p v???, t??i li???u thi???t k??? li??n quan.<br>\nX??y d???ng k???ch b???n ki???m th??? (Testcase).<br>\nTh???c hi???n Test s???n ph???m c???a c??ng ty.<br>\nTham gia l???p c??c b??? t??i li???u test: Quy tr??nh test, Testplan, Test Point.<br>\nNghi??n c???u v?? c???p nh???t c??c c??ng c??? test v?? ki???n th???c m???i h??? tr??? cho c??ng vi???c.<br>\n????? xu???t c???i ti???n quy tr??nh test.<br>\nTh???c hi???n t???t c??c c??ng vi???c kh??c khi ???????c giao.','QA,QC','Junior',1000,'2021-10-10',2,6),(4,'test2','123456','123456',NULL,123,NULL,2,4),(5,'Frontend Developer Javascript Angular2+','Participate in requirement analysis, implementation, code review, unit test, test, and deployment process.\r\nWrite technical documents.\r\nCollaborate daily with a cross-functional team in a distributed environment.\r\nWork as part of a team and participate in customer support activities as needed. \r\nKeep up to date with new trends and best practices in software development and share knowledge with colleagues.','More than 3 years experience.\r\nExperience in delivering high value and heavy UI front-end products.\r\nExperience in design pattenrns.\r\nExperience in clean code/ coding standards.\r\nExperience with unit tests, TDD, BDD, code coverage, and code refactoring.\r\nGood understanding of front-end component-based architectures.\r\nExperience in one of these frameworks: Angular2+, React, Vue, UI5\r\nExperience with RxJs Observable patterns Strong JavaScript basis and a good understanding of the core-js (ES6/7).','Experience in building apps with Ionic or React Native\r\nExperience with unit tests, test-driven development, code coverage, testing frameworks and refactoring code.\r\nExperience in Scrum/Agile/Kanban.\r\nExperience with Redux (ngrx/store or ng2-redux).',2000,'2022-02-16',5,2),(6,'Android Developers','Tham gia ph??t tri???n c??c ???ng d???ng Fintech, V?? ??i???n t??? VNPAY, VNPAY QR, VNPAY Mobile POS,???\r\nTi???p c???n c??c d??? ??n, c??ng ngh??? m???i trong l??nh v???c Fintech hang ?????u t???i Vi???t Nam.\r\nNghi??n c????u, ti??m ki????m gia??i pha??p v???? vi????c a??p du??ng ca??c ti??nh n??ng cu??a thi????t bi?? di ??????ng va??o ma??ng ta??i chi??nh.\r\nDuy tri??, h???? tr????, n??ng c????p ca??c ????ng du??ng di??ch vu?? ??a?? pha??t tri????n cu??a c??ng ty.','C?? chuy??n m??n C??ng ngh??? th??ng tin: T??? h???c, tham gia kho?? h???c ????o t???o v??? ng??n ng??? l???p tr??nh, cao ?????ng, ?????i h???c chuy??n ng??nh.\r\nKi????n th????c c?? ba??n va?? t?? duy v???? l????p tri??nh Android.\r\nKi???n th???c v??? JSON, HTTPS, RESTful service.\r\nNg??n ng??? y??u c???u: Java ho???c Kotlin.','',2000,'2022-02-17',6,5),(7,'iOS Developers','X??y d????ng ca??c ????ng du??ng Mobile Banking li??n quan ??????n ca??c ma??ng ta??i chi??nh, Ng??n h??ng, Vi???n th??ng tr??n n???n t???ng IOS.\r\nX??y d???ng c??c ???ng d???ng li??n quan ?????n c??c ph???n ti???n ??ch Ecommerce\r\nNghi??n c????u, ti??m ki????m gia??i pha??p v???? vi????c a??p du??ng ca??c ti??nh n??ng cu??a thi????t bi?? di ??????ng va??o ma??ng ta??i chi??nh, Ng??n h??ng, Vi???n th??ng.\r\nDuy tri??, h???? tr????, n??ng c????p ca??c ????ng du??ng di??ch vu?? ??a?? pha??t tri????n cu??a C??ng ty\r\nPh??t tri???n m???i, n??ng c???p ???ng d???ng cho c??c ng??n h??ng trong giai ??o???n s???p t???i.\r\n???????c h?????ng d???n, ????o t???o b??i b???n','Theo h???c chuy??n ng??nh C??ng ngh??? th??ng tin, C??ng ngh??? ph???n m???m ho???c Tr?????ng ????o t???o l???p tr??nh vi??n Qu???c T??? (NIIT, Aptech) tr??? l??n.\r\nHi???u bi???t v??? xCode, Swift, c?? kinh nghi???m l???p tr??nh ???ng d???ng tr??n IOS\r\nC?? hi???u bi???t v??? Realm, giao ti???p client ??? server th??ng qua REST v?? JSON\r\nC?? ki???n th???c v??? Objective ??? C l?? 1 l???i th???\r\n??u ti??n ???ng vi??n ???? t??m hi???u v??? iOS ho???c ???? ??i th???c t???p\r\n???ng vi??n ch???u kh?? h???c h???i, t??m hi???u ki???n th???c m???i.\r\n????p ???ng ???????c l??m fulltime.','Developers',1500,'2022-02-17',6,4),(8,'Senior Software Developer','Ph??t tri???n c??c ???ng d???ng, c??c s???n ph???m ????ng g??i v???i ch???t l?????ng cao, d???a tr??n n???n t???ng Odoo.\r\nL???p tr??nh full stack - JavaScript, HTML, CSS, Python and PostgreSQL.\r\nL??m vi???c d???a tr??n m?? h??nh Scrum-based Agile.\r\nThi???t k??? v?? ph??t tri???n s???n ph???m ????n gi???n, tr???c quan v?? d??? s??? d???ng, cho ph??p kh??ch h??ng m??? r???ng v?? tu??? ch???nh c???u h??nh theo ?????c th?? v???n h??nh c???a h???.\r\n????ng vai tr?? quan tr???ng trong vi???c thi???t k??? v?? ph??t tri???n c??c s???n ph???m v?? t??nh n??ng m???i, c??ng v???i vi???c t???i ??u c??c s???n ph???m hi???n c??\r\nTi???p nh???n y??u c???u v?? b???n m???u (requirements and mock-ups), thi???t k??? gi???i ph??p ho??n thi???n ????? ????p ???ng y??u c???u doanh nghi???p, t????ng t??c v???i Product Owner v?? c??c ?????i ng?? kh??c.\r\nC???ng t??c v???i Product Manager v?? c??c ?????i ng?? kh??c (BA, QC, Deployment) ????? tri???n khai s???n ph???m ho??n thi???n\r\nX??y d???ng c??c ???ng d???ng web hi???n ?????i, ??a n??ng v?? c??ng v???i vi???c ho??n thi???n tr???i nghi???m web tr??n mobile.','C?? h??n 1 n??m kinh nghi???m trong vi???c thi???t k??? v?? ph??t tri???n c??c s???n ph???m / c??c plugin / addon c?? t??nh t??i s??? d???ng & m??? r???ng cao\r\nC?? kinh nghi???p ph??t tri???n ph???n m???m, debug v?? t?? duy problem-solving. Ch??ng t??i r???t hoan ngh??nh nh???ng developer c?? kh??? n??ng l??m vi???c v???i nhi???u c??ng ngh??? m???i v?? c?? th??? x??y d???ng ???ng d???ng qua c??c m??i tr?????ng l???p tr??nh / nhi???u ng??n ng??? l???p tr??nh kh??c nhau.','C?? ki???n th???c v??? Javascript, Python, REST, XML, HTML v?? CSS.\r\nC?? t?? duy problem-solving t???t, k??? n??ng debug v?? c?? tinh th???n h???c h???i, ti???p thu c??ng ngh??? m???i\r\nC?? ki???n th???c s??u v??? ?????c t??? d??? li???u v?? c?? s??? d??? li???u (PostgreSQL l?? ??i???m c???ng)\r\nC?? ki???n th???c s??u v??? c???u tr??c d??? li???u, gi???i thu???t, thi???t k??? h?????ng ?????i t?????ng (OOP), design patterns, bi???t ????nh gi?? ????? ph???c t???p c???a thu???t to??n ????? t???i ??u hi???u su???t / kh??? n??ng m??? r???ng c???a s???n ph???m\r\nC?? k??? n??ng giao ti???p & vi???t b??o c??o\r\nC?? kinh nghi???m l??m vi???c v???i vi???c s???p x???p ????? ??u ti??n v?? c?? kh??? n??ng qu???n l?? timeline hi???u qu???\r\nH?????ng d???n v?? ????o t???o nh???ng developer ??t kinh nghi???m h??n\r\nC?? b???ng c???p trong Computer Science ho???c c??c chuy??n ng??nh li??n quan l?? m???t ??u th???.',1200,'2022-02-17',7,3);
/*!40000 ALTER TABLE `tintuyendung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$10$CNGZkqBh8F6FjzN4fChzbelZ9IvnksabG2uYAUBKZ8Lb10LJcWwmma','ADMIN'),(2,'thanh','$2a$10$YiK7s40YYFBdT29VHJOYrOWZl00qYuXuN42N8xubaYFkcZkO/kixe','ROLE_C'),(3,'abc','$2a$10$mH8QBh3bZLj5X0/3hDOTqun3TxHv/UGihnlMCyksxUhSh3Udrk0Ta','CANDIDATE'),(6,'xyz','$2a$10$LvI.YtddKjPXIwerPXrMWej.m.iZfOLBEs0p6oQeGpOKRqHjgsGbe',NULL),(7,'xyzsa','$2a$10$M6v4y8FG2N140nIPGPsJ7OAjJPiPiKGn5LBN7iq528.g9lBXKpejW',NULL),(10,'kel','$2a$10$HFG4F/CSAIXqNOGmrdBmBeLBKNV02UdTMKqXNqPwrSOBkK9hLOj4a','ROLE_C'),(11,'thi','$2a$10$URv.IIe6z/z4KDdftBxjAuxS/YgQ2QM0ukY8yis2fK2flYfJEEHgm','ROLE_C'),(12,'shopee','$2a$10$cNGN.XHmPHtPS78BQzpA.Oz13FAPBJ2ocmjIJkd5y7w/lvm10D9kG','ROLE_E'),(13,'topcv','$2a$10$sDEAFcEFv8kbePl1DqJqM.EFR8gtfmlTRyzIZCT2Q9PbgpEKcs8Nm','ROLE_E'),(15,'tiki','$2a$10$g/AKVuu5QYYhL9lI/.hEL.h3q4E7eKMv9tel.Jxod9.oIOexS7Jzy','ROLE_E'),(16,'adc','$2a$10$vSX1dgyv1B3D4t9KrjKioObr7Rtj2iLaq26eouJi6MmNm/oFff4CG','ROLE_E'),(17,'adcd','$2a$10$Sx.HJe38NBJ5YvNEy7MHCuC7yocaYta7RmEJKNQf73dJVuuHaxzKC','ROLE_E'),(18,'add','$2a$10$DDfAixj23DTXaq/.nCKFSOqGp3KwWn7SU8FmewaJ6Xm7N1EAW5hmi','ROLE_E'),(19,'addcd','$2a$10$Hy75VweXDZFrV8BiTKu/O.7A1/9fTiEwn43jP.3ROnbkBJz0.DkdK','ROLE_E'),(20,'acdcd','$2a$10$bBiNMoiaGKqyqO.E.aEPmOnWm4XTaFom1/iicFLONqDd8y/vjtx.i','ROLE_E'),(21,'acdcda','$2a$10$VPKBsFj2tIcE0.S3T615mObwsrwRp8V0c237Nk6YhfDH8.0UL3qUS','ROLE_E'),(22,'bcd','$2a$10$w81UBRWvpq7jdz2zP4TR8ePtcEfoZwRtnn/Ht1WDrb1umBAz121Iq','ROLE_E'),(23,'bcdd','$2a$10$YtprrGEF/3RanHwaxS2OtefOI9XJWrU4sWpy8NoOOuysl.3jwVBka','ROLE_E'),(24,'kkk','$2a$10$CNGZkqBh8F6FjzN4fChzbelZ9IvnksabG2uYAUBKZ8Lb10LJcWwmm','ROLE_E'),(28,'sang','$2a$10$a5SOThxjWVf/VIverG3Y2ejmmmE9x1hWpk/jSOKbBs8wfduWth2Tq','ROLE_A'),(31,'vietnam','$2a$10$OKS51/PkHAHpUg.7BII2Juyv8/O/UBnVDF3oP4RiDZBMqF51No5bm','ROLE_E'),(32,'bbvVietNam','$2a$10$EmIKX5ZOvf8J3hn0lF90I.qjSHzhiGM1PvDUmOAZ40WpE0YMwyUMu','ROLE_E'),(33,'pham','$2a$10$tiH3uem7WegO638Kj3dE8Ol6BxOZiec/Ra9iB/zShWiBHEZI6wW5y','ROLE_C'),(34,'thanha','$2a$10$Hzib6tLBA1MCuJb4HMZkG.ECWLPK.xMKc.fGu5aRY.48rHBFEu5cu','ROLE_C'),(35,'1245','$2a$10$iHeVohy63fgY55Ag7xy9suJfrAT.EV7dFMEiIgg6cMAgoExP56y.u','ROLE_C'),(36,'vnpay','$2a$10$46kgWOoNKNaiVU8vQSLg7e0WhT5GiQVJfcL3F7tbu48ovrG1JbuiO','ROLE_E'),(37,'topERP','$2a$10$zCCjCodrlO.oO3Q5SXKBvu82hUz0sfnQoh0su9aqKBPf7d1dVf6U6','ROLE_E');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-17 20:21:21
