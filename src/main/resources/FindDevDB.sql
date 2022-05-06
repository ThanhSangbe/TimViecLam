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
INSERT INTO `candidate` VALUES (1,'Phạm Thanh Sang','Khoa học máy tính','1954112073sang@ou.edu.vn','039295863','https://res.cloudinary.com/thanhsang123/image/upload/v1644718982/earxbxf8jdcd85sntyjx.jpg','male',2,2,79),(2,'Nguyễn Văn A','Công nghệ thông tin','a.nguyenvan@gmail.com','0796742429',NULL,NULL,3,11,79),(3,'Thanhsa','Công nghệ thông tin','123456@gmail.xyz','0398295331','https://res.cloudinary.com/thanhsang123/raw/upload/v1644639180/uyalc4k4zoyi89dknmkl',NULL,3,10,79),(6,'Nguyễn Văn A',NULL,'a.nguyenvan@gmail.com','0369852147','https://res.cloudinary.com/thanhsang123/image/upload/v1645099901/pfsbkbeu2yncudtyel9x.pdf',NULL,2,35,1);
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
INSERT INTO `employer` VALUES (1,'TIKI','Viet Nam','tiki.png','Trang mua sắm uy tín - Tiki giao hàng nhanh 2 giờ',15,'hotro@tiki.vn',79),(2,'SHOPEE','Viet Nam','shopee.png','Gì cũng có mua hết ở Shopee',12,'hotro@shopee.vn',79),(3,'addcd','123','https://res.cloudinary.com/thanhsang123/image/upload/v1644719840/issub7ecak5cam8llfh2.jpg','123',NULL,'123',NULL),(4,'123','123','https://res.cloudinary.com/thanhsang123/image/upload/v1644721160/nryr6o4qixqe7ovnuyv4.jpg','123',24,'123',NULL),(5,'BBV Việt Nam','Việt Nam','https://res.cloudinary.com/thanhsang123/image/upload/v1645005260/ft2un4uyr7mmvbmcsnwd.png','bbv Vietnam stands for top quality in consulting, first class software engineering',32,'bbvvietnam@gmail.com',79),(6,'Công ty Cổ phần Giải pháp Thanh toán Việt Nam','Việt Nam','https://res.cloudinary.com/thanhsang123/image/upload/v1645100142/hh085yvwmxijujyjrseb.png','Công ty Cổ phần Giải pháp Thanh toán Việt Nam',36,'vnpay@pay.vn',1),(7,'Senior Software Developer','Việt Nam','https://res.cloudinary.com/thanhsang123/image/upload/v1645100768/vobwupnxm1cbmaxvgt9v.png','Giải Pháp Công Nghệ Cho Doanh Nghiệp',37,'contact@topERP.vn',79);
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
INSERT INTO `province` VALUES (0,'Tất cả','Không'),(1,'Thành phố Hà Nội','Thành phố Trung ương'),(2,'Tỉnh Hà Giang','Tỉnh'),(4,'Tỉnh Cao Bằng','Tỉnh'),(6,'Tỉnh Bắc Kạn','Tỉnh'),(8,'Tỉnh Tuyên Quang','Tỉnh'),(10,'Tỉnh Lào Cai','Tỉnh'),(11,'Tỉnh Điện Biên','Tỉnh'),(12,'Tỉnh Lai Châu','Tỉnh'),(14,'Tỉnh Sơn La','Tỉnh'),(15,'Tỉnh Yên Bái','Tỉnh'),(17,'Tỉnh Hoà Bình','Tỉnh'),(19,'Tỉnh Thái Nguyên','Tỉnh'),(20,'Tỉnh Lạng Sơn','Tỉnh'),(22,'Tỉnh Quảng Ninh','Tỉnh'),(24,'Tỉnh Bắc Giang','Tỉnh'),(25,'Tỉnh Phú Thọ','Tỉnh'),(26,'Tỉnh Vĩnh Phúc','Tỉnh'),(27,'Tỉnh Bắc Ninh','Tỉnh'),(30,'Tỉnh Hải Dương','Tỉnh'),(31,'Thành phố Hải Phòng','Thành phố Trung ương'),(33,'Tỉnh Hưng Yên','Tỉnh'),(34,'Tỉnh Thái Bình','Tỉnh'),(35,'Tỉnh Hà Nam','Tỉnh'),(36,'Tỉnh Nam Định','Tỉnh'),(37,'Tỉnh Ninh Bình','Tỉnh'),(38,'Tỉnh Thanh Hóa','Tỉnh'),(40,'Tỉnh Nghệ An','Tỉnh'),(42,'Tỉnh Hà Tĩnh','Tỉnh'),(44,'Tỉnh Quảng Bình','Tỉnh'),(45,'Tỉnh Quảng Trị','Tỉnh'),(46,'Tỉnh Thừa Thiên Huế','Tỉnh'),(48,'Thành phố Đà Nẵng','Thành phố Trung ương'),(49,'Tỉnh Quảng Nam','Tỉnh'),(51,'Tỉnh Quảng Ngãi','Tỉnh'),(52,'Tỉnh Bình Định','Tỉnh'),(54,'Tỉnh Phú Yên','Tỉnh'),(56,'Tỉnh Khánh Hòa','Tỉnh'),(58,'Tỉnh Ninh Thuận','Tỉnh'),(60,'Tỉnh Bình Thuận','Tỉnh'),(62,'Tỉnh Kon Tum','Tỉnh'),(64,'Tỉnh Gia Lai','Tỉnh'),(66,'Tỉnh Đắk Lắk','Tỉnh'),(67,'Tỉnh Đắk Nông','Tỉnh'),(68,'Tỉnh Lâm Đồng','Tỉnh'),(70,'Tỉnh Bình Phước','Tỉnh'),(72,'Tỉnh Tây Ninh','Tỉnh'),(74,'Tỉnh Bình Dương','Tỉnh'),(75,'Tỉnh Đồng Nai','Tỉnh'),(77,'Tỉnh Bà Rịa - Vũng Tàu','Tỉnh'),(79,'Thành phố Hồ Chí Minh','Thành phố Trung ương'),(80,'Tỉnh Long An','Tỉnh'),(82,'Tỉnh Tiền Giang','Tỉnh'),(83,'Tỉnh Bến Tre','Tỉnh'),(84,'Tỉnh Trà Vinh','Tỉnh'),(86,'Tỉnh Vĩnh Long','Tỉnh'),(87,'Tỉnh Đồng Tháp','Tỉnh'),(89,'Tỉnh An Giang','Tỉnh'),(91,'Tỉnh Kiên Giang','Tỉnh'),(92,'Thành phố Cần Thơ','Thành phố Trung ương'),(93,'Tỉnh Hậu Giang','Tỉnh'),(94,'Tỉnh Sóc Trăng','Tỉnh'),(95,'Tỉnh Bạc Liêu','Tỉnh'),(96,'Tỉnh Cà Mau','Tỉnh');
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
INSERT INTO `tintuyendung` VALUES (1,'Lập trình viên Full stack','Phát triển các tính năng hướng tới người dùng mới bằng cách sử dụng Javascript và \nReactJS để đáp ứng một số lượng lớn người dùng.<br>\nXây dựng các thành phần có thể tái sử dụng và thư viện front-end để sử dụng trong tương lai<br>\nXây dựng ứng dụng web','NodeJS, ReactJS, Java','Fresher',1000,'2021-11-22',1,4),(2,'NHÂN VIÊN TESTER','Đọc hiểu các tài liệu đặc tả hệ thống, yêu cầu nghiệp vụ, tài liệu thiết kế liên quan.<br>\nXây dựng kịch bản kiểm thử (Testcase).<br>\nThực hiện Test sản phẩm của công ty.<br>\nTham gia lập các bộ tài liệu test: Quy trình test, Testplan, Test Point.<br>\nNghiên cứu và cập nhật các công cụ test và kiến thức mới hỗ trợ cho công việc.<br>\nĐề xuất cải tiến quy trình test.<br>\nThực hiện tốt các công việc khác khi được giao.','QA,QC','Junior',1000,'2021-10-10',2,6),(4,'test2','123456','123456',NULL,123,NULL,2,4),(5,'Frontend Developer Javascript Angular2+','Participate in requirement analysis, implementation, code review, unit test, test, and deployment process.\r\nWrite technical documents.\r\nCollaborate daily with a cross-functional team in a distributed environment.\r\nWork as part of a team and participate in customer support activities as needed. \r\nKeep up to date with new trends and best practices in software development and share knowledge with colleagues.','More than 3 years experience.\r\nExperience in delivering high value and heavy UI front-end products.\r\nExperience in design pattenrns.\r\nExperience in clean code/ coding standards.\r\nExperience with unit tests, TDD, BDD, code coverage, and code refactoring.\r\nGood understanding of front-end component-based architectures.\r\nExperience in one of these frameworks: Angular2+, React, Vue, UI5\r\nExperience with RxJs Observable patterns Strong JavaScript basis and a good understanding of the core-js (ES6/7).','Experience in building apps with Ionic or React Native\r\nExperience with unit tests, test-driven development, code coverage, testing frameworks and refactoring code.\r\nExperience in Scrum/Agile/Kanban.\r\nExperience with Redux (ngrx/store or ng2-redux).',2000,'2022-02-16',5,2),(6,'Android Developers','Tham gia phát triển các ứng dụng Fintech, Ví điện tử VNPAY, VNPAY QR, VNPAY Mobile POS,…\r\nTiếp cận các dự án, công nghệ mới trong lĩnh vực Fintech hang đầu tại Việt Nam.\r\nNghiên cứu, tìm kiếm giải pháp về việc áp dụng các tính năng của thiết bị di động vào mảng tài chính.\r\nDuy trì, hỗ trợ, nâng cấp các ứng dụng dịch vụ đã phát triển của công ty.','Có chuyên môn Công nghệ thông tin: Tự học, tham gia khoá học đào tạo về ngôn ngữ lập trình, cao đẳng, đại học chuyên ngành.\r\nKiến thức cơ bản và tư duy về lập trình Android.\r\nKiến thức về JSON, HTTPS, RESTful service.\r\nNgôn ngữ yêu cầu: Java hoặc Kotlin.','',2000,'2022-02-17',6,5),(7,'iOS Developers','Xây dựng các ứng dụng Mobile Banking liên quan đến các mảng tài chính, Ngân hàng, Viễn thông trên nền tảng IOS.\r\nXây dựng các ứng dụng liên quan đến các phần tiện ích Ecommerce\r\nNghiên cứu, tìm kiếm giải pháp về việc áp dụng các tính năng của thiết bị di động vào mảng tài chính, Ngân hàng, Viễn thông.\r\nDuy trì, hỗ trợ, nâng cấp các ứng dụng dịch vụ đã phát triển của Công ty\r\nPhát triển mới, nâng cấp ứng dụng cho các ngân hàng trong giai đoạn sắp tới.\r\nĐược hướng dẫn, đào tạo bài bản','Theo học chuyên ngành Công nghệ thông tin, Công nghệ phần mềm hoặc Trường đào tạo lập trình viên Quốc Tế (NIIT, Aptech) trở lên.\r\nHiểu biết về xCode, Swift, có kinh nghiệm lập trình ứng dụng trên IOS\r\nCó hiểu biết về Realm, giao tiếp client – server thông qua REST và JSON\r\nCó kiến thức về Objective – C là 1 lợi thế\r\nƯu tiên ứng viên đã tìm hiểu về iOS hoặc đã đi thực tập\r\nỨng viên chịu khó học hỏi, tìm hiểu kiến thức mới.\r\nĐáp ứng được làm fulltime.','Developers',1500,'2022-02-17',6,4),(8,'Senior Software Developer','Phát triển các ứng dụng, các sản phẩm đóng gói với chất lượng cao, dựa trên nền tảng Odoo.\r\nLập trình full stack - JavaScript, HTML, CSS, Python and PostgreSQL.\r\nLàm việc dựa trên mô hình Scrum-based Agile.\r\nThiết kế và phát triển sản phẩm đơn giản, trực quan và dễ sử dụng, cho phép khách hàng mở rộng và tuỳ chỉnh cấu hình theo đặc thù vận hành của họ.\r\nĐóng vai trò quan trọng trong việc thiết kế và phát triển các sản phẩm và tính năng mới, cùng với việc tối ưu các sản phẩm hiện có\r\nTiếp nhận yêu cầu và bản mẫu (requirements and mock-ups), thiết kế giải pháp hoàn thiện để đáp ứng yêu cầu doanh nghiệp, tương tác với Product Owner và các đội ngũ khác.\r\nCộng tác với Product Manager và các đội ngũ khác (BA, QC, Deployment) để triển khai sản phẩm hoàn thiện\r\nXây dựng các ứng dụng web hiện đại, đa năng và cùng với việc hoàn thiện trải nghiệm web trên mobile.','Có hơn 1 năm kinh nghiệm trong việc thiết kế và phát triển các sản phẩm / các plugin / addon có tính tái sử dụng & mở rộng cao\r\nCó kinh nghiệp phát triển phần mềm, debug và tư duy problem-solving. Chúng tôi rất hoan nghênh những developer có khả năng làm việc với nhiều công nghệ mới và có thể xây dựng ứng dụng qua các môi trường lập trình / nhiều ngôn ngữ lập trình khác nhau.','Có kiến thức về Javascript, Python, REST, XML, HTML và CSS.\r\nCó tư duy problem-solving tốt, kỹ năng debug và có tinh thần học hỏi, tiếp thu công nghệ mới\r\nCó kiến thức sâu về đặc tả dữ liệu và cơ sở dữ liệu (PostgreSQL là điểm cộng)\r\nCó kiến thức sâu về cấu trúc dữ liệu, giải thuật, thiết kế hướng đối tượng (OOP), design patterns, biết đánh giá độ phức tạp của thuật toán để tối ưu hiệu suất / khả năng mở rộng của sản phẩm\r\nCó kỹ năng giao tiếp & viết báo cáo\r\nCó kinh nghiệm làm việc với việc sắp xếp độ ưu tiên và có khả năng quản lý timeline hiệu quả\r\nHướng dẫn và đào tạo những developer ít kinh nghiệm hơn\r\nCó bằng cấp trong Computer Science hoặc các chuyên ngành liên quan là một ưu thế.',1200,'2022-02-17',7,3);
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
