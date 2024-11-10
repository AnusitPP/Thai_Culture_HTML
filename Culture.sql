-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: culture
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `ancientremains`
--

DROP TABLE IF EXISTS `ancientremains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ancientremains` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ancientremains`
--

LOCK TABLES `ancientremains` WRITE;
/*!40000 ALTER TABLE `ancientremains` DISABLE KEYS */;
INSERT INTO `ancientremains` VALUES (1,'วัดพระศรีสรรเพชญ์','ต.ประตูชัย อ.พระนครศรีอยุธยา จ.พระนครศรีอยุธยา','https://www.expedia.co.th/stories/wp-content/uploads/2022/07/1.%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%A8%E0%B8%A3%E0%B8%B5%E0%B8%AA%E0%B8%A3%E0%B8%A3%E0%B9%80%E0%B8%9E%E0%B8%8A%E0%B8%8D%E0%B9%8C-2.jpg','อยุธยา'),(2,'วัดราชบูรณะ','ต.ท่าวาสุกรี อ.พระนครศรีอยุธยา จ.พระนครศรีอยุธยา','https://www.expedia.co.th/stories/wp-content/uploads/2022/07/1.%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B8%9A%E0%B8%B9%E0%B8%A3%E0%B8%93%E0%B8%B0-3.jpg','อยุธยา'),(3,'วัดไชยวัฒนาราม','ต.บ้านป้อม อ.พระนครศรีอยุธยา จ.พระนครศรีอยุธยา','https://www.expedia.co.th/stories/wp-content/uploads/2022/07/1.%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B9%84%E0%B8%8A%E0%B8%A2%E0%B8%A7%E0%B8%B1%E0%B8%92%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%A1-4.jpg','อยุธยา'),(4,'วัดศรีสวาย','อุทยานประวัติศาสตร์สุโขทัย ต.เมืองเก่า อ.เมือง จ.สุโขทัย','https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcRaVPcoNMAp_YR880foW6Wbmx1yg21yQkLkGYPI58cm_WPHdrB5dYm_MapTUhznwMPLSXLrvWaI5V9XnBe1xmRgO9JfTyVm-xbkOF8nEA','สุโขทัย'),(5,'อุทยาน์ศรีสัชนาลัย','ต.ศรีสัชนาลัย อ.ศรีสัชนาลัย จ.สุโขทัย','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Wat_Chang_Lom%2C_Si_Satchanalai_20231226_%28IV%29.jpg/640px-Wat_Chang_Lom%2C_Si_Satchanalai_20231226_%28IV%29.jpg','สุโขทัย'),(6,'วัดพระศรีรัตนศาสดาราม','ต.พระบรมมหาราชวัง อ.พระนคร จ.กรุงเทพมหานคร','https://img.kapook.com/u/2023/sutasinee/04/WatPhraKaew11.jpg','กรุงเทพมหานคร'),(7,'วัดสะพานหิน','โบราณสถานด้านทิศตะวันตก ต.เมืองเก่า อ.เมืองฯ จ.สุโขทัย','https://www.silpa-mag.com/wp-content/uploads/2023/10/%E0%B8%A0%E0%B8%B2%E0%B8%9E%E0%B8%9B%E0%B8%81-%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B8%AA%E0%B8%B0%E0%B8%9E%E0%B8%B2%E0%B8%99%E0%B8%AB%E0%B8%B4%E0%B8%99.jpg','สุโขทัย'),(8,'วัดมหาธาตุ','ต.ท่าวาสุกรี อ.พระนครศรีอยุธยา จ.พระนครศรีอยุธยา','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPaNjxyHYzkS9YJqUqWNeya790M3vSG7wc2A&s','อยุธยา'),(9,'ปฐมเจดีย์ ราชวรมหาวิหาร','ต.พระปฐมเจดีย์ อ.เมืองนครปฐม จ.นครปฐม','https://npt.onab.go.th/th/file/get/file/202107210120a4f9196a5f9eb9f523f31f914da7175822.jpg','นครปฐม'),(10,'อุทยาน์พิมาย','ต.ในเมือง อ.พิมาย จ.นครราชสีมา','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK-U2NiNtzGLQ2Qjz-iLEu6cPEPD5QdDztWQ&s','นครราชสีมา'),(11,'ปราสาทพนมรุ้ง','อุทยานประวัติศาสตร์พนมรุ้ง อ.เฉลิมพระเกียรติ จ.บุรีรัมย์','https://f.ptcdn.info/985/079/000/rqxjs7myd8LvPxSj60aL-o.jpg','บุรีรัมย์'),(12,'วัดไชยวัฒนาราม','ต.เมืองสิงห์ อ.ไทรโยค จ.กาญจนบุรี','https://www.museumthailand.com/upload/evidence/1504185211_68611.jpg','กาญจนบุรี');
/*!40000 ALTER TABLE `ancientremains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactmessages`
--

DROP TABLE IF EXISTS `contactmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contactType` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactmessages`
--

LOCK TABLES `contactmessages` WRITE;
/*!40000 ALTER TABLE `contactmessages` DISABLE KEYS */;
INSERT INTO `contactmessages` VALUES (1,'ทั่วไป','Anusit Panpimsen','654234040@parichat.skru.ac.th','0856549874','เป็นเว็บที่ดี','2024-11-09 15:27:33'),(2,'ทั่วไป','Apiwat Naemsai','654234012@parichat.skru.ac.th','0641485194','Jesus! เว็บนี้ใช้งานได้ดีมาก','2024-11-09 15:27:33'),(3,'คำถามเกี่ยวกับบริการ','Lookman Boontang','654234038@parichat.skru.ac.th','0630787104','hello peter!','2024-11-09 15:27:33'),(4,'ความคิดเห็น','Kritsanapong Bunpradit','654234023@parichat.skru.ac.th','0944860221','Hi bro!','2024-11-09 15:27:33'),(5,'ทั่วไป','Erhan','654234015@parichat.skru.ac.th','0936279294','Salam','2024-11-09 15:27:33'),(6,'คำถามเกี่ยวกับบริการ','Firnan','654234009@parichat.skru.ac.th','0838235316','Welcome','2024-11-09 15:27:33'),(7,'ความคิดเห็น','Peerapol Muslimeen','654234008@parichat.skru.ac.th','0801209657','salamat pagi','2024-11-09 15:27:33');
/*!40000 ALTER TABLE `contactmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culturaltraditions`
--

DROP TABLE IF EXISTS `culturaltraditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `culturaltraditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `region` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `details` text,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culturaltraditions`
--

LOCK TABLES `culturaltraditions` WRITE;
/*!40000 ALTER TABLE `culturaltraditions` DISABLE KEYS */;
INSERT INTO `culturaltraditions` VALUES (1,'south','ประเพณีชิงเปรต','ประเพณีชิงเปรตเป็นหนึ่งในประเพณีท้องถิ่นภาคใต้...',NULL,'https://today-obs.line-scdn.net/0ht9lVY5XfKxZRLwI9hHJUQWt5KHliQzgVNRl6FQ1BdSIrGj4VZEg0I319fCAsSGxIPx5sdnIvMCcuFmUXOR40/w1200'),(2,'south','ประเพณีแห่พระสงกรานต์','ประเพณีแห่พระสงกรานต์จัดขึ้นที่จังหวัดนครศรีธรรมราช...',NULL,'https://www.nairobroo.com/wp-content/uploads/2019/03/%E0%B9%81%E0%B8%82%E0%B9%88%E0%B8%87%E0%B9%80%E0%B8%A3%E0%B8%B7%E0%B8%AD%E0%B8%82%E0%B8%B6%E0%B9%89%E0%B8%99%E0%B9%82%E0%B8%82%E0%B8%99%E0%B8%8A%E0%B8%B4%E0%B8%87%E0%B8%98%E0%B8%87-5.jpg'),(3,'south','ประเพณีลอยกระทง','ประเพณีลอยกระทงเป็นประเพณีที่จัดขึ้นในช่วงวันเพ็ญเดือน 12...',NULL,'https://www.suratcity.go.th/web/components/com_flexicontent/uploads/110-1.jpg'),(4,'central','ประเพณีโยนบัว','ประเพณีโยนบัวเป็นการแสดงความเคารพและสักการะองค์พระมหาธาตุ...',NULL,'https://tatapi.tourismthailand.org/tatfs/IMAGE/Event/Picture/E0002303.jpg'),(5,'central','ประเพณีตักบาตรเทโว','ประเพณีตักบาตรเทโวเป็นการทำบุญเพื่อถวายเป็นพุทธบูชา...',NULL,'https://www.dhammathai.org/day/pic/takbatthewo.jpg'),(6,'central','ประเพณีกวนข้าวทิพย์','ประเพณีกวนข้าวทิพย์เป็นประเพณีที่มีการกวนข้าวทิพย์เพื่อถวายพระ...',NULL,'https://www.museumthailand.com/upload/evidence/1565332952_34616.jpg'),(7,'north','ประเพณีอุ้มพระดำน้ำ','ประเพณีอุ้มพระดำน้ำจัดขึ้นที่จังหวัดเพชรบูรณ์...',NULL,'http://hotelandresortthailand.com/read/wp-content/uploads/2020/08/1-4-1600x1066.jpg'),(8,'north','ประเพณีตางตุง','ประเพณีตางตุงเป็นประเพณีที่มีมาอย่างยาวนาน...',NULL,'https://img.kapook.com/u/2018/sutasinee/08/h1.jpg'),(9,'north','ประเพณียี่เป็ง','ประเพณียี่เป็งเป็นเทศกาลลอยกระทงล้านนา...',NULL,'https://www.govivigo.com/content/ideas/5633/56339a3dec60adb92a8b4628-2-full-ideas.jpg'),(10,'eastern','ประเพณีบุญบั้งไฟ','ประเพณีบุญบั้งไฟเป็นการบูชาสิ่งศักดิ์สิทธิ์...',NULL,'https://img.kapook.com/u/panadda/Visun-Khankasemcover.jpg'),(11,'eastern','ประเพณีผีตาโขน','ประเพณีผีตาโขนเป็นเทศกาลที่มีชื่อเสียงในจังหวัดเลย...',NULL,'https://cms.dmpcdn.com/travel/2021/06/09/3722c7d0-c8ee-11eb-9103-ffb559e11b07_original.jpg'),(12,'eastern','ประเพณีแห่เทียนพรรษา','ประเพณีแห่เทียนพรรษาจัดขึ้นในจังหวัดอุบลราชธานี...',NULL,'https://tatapi.tourismthailand.org/tatfs/IMAGE/Event/Picture/E0002303.jpg');
/*!40000 ALTER TABLE `culturaltraditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Anusit','Panpimsen','654234040@parichat.skru.ac.th','$2b$10$lH37aWGpEPPr3Z9F3dE1LO5PI5Zo6GYe9j1WApd8/CDv7WQ2g45Uu','0856549874','2024-11-09 15:37:24'),(2,'Apiwat','Naemsai','654234012@parichat.skru.ac.th','$2b$10$lH37aWGpEPPr3Z9F3dE1LO5PI5Zo6GYe9j1WApd8/CDv7WQ2g45Uu','0641485194','2024-11-09 15:37:24'),(3,'Lookman','Boontang','654234038@parichat.skru.ac.th','$2b$10$lH37aWGpEPPr3Z9F3dE1LO5PI5Zo6GYe9j1WApd8/CDv7WQ2g45Uu','0630787104','2024-11-09 15:37:24'),(4,'Kritsanapong','Bunpradit','654234023@parichat.skru.ac.th','$2b$10$lH37aWGpEPPr3Z9F3dE1LO5PI5Zo6GYe9j1WApd8/CDv7WQ2g45Uu','0944860221','2024-11-09 15:37:24'),(5,'Erhan','Mamat','654234015@parichat.skru.ac.th','$2b$10$lH37aWGpEPPr3Z9F3dE1LO5PI5Zo6GYe9j1WApd8/CDv7WQ2g45Uu','0936279294','2024-11-09 15:37:24'),(6,'Firnan','Chehama','654234009@parichat.skru.ac.th','$2b$10$lH37aWGpEPPr3Z9F3dE1LO5PI5Zo6GYe9j1WApd8/CDv7WQ2g45Uu','0838235316','2024-11-09 15:37:24'),(7,'Peerapol','Muslimeen','654234008@parichat.skru.ac.th','$2b$10$lH37aWGpEPPr3Z9F3dE1LO5PI5Zo6GYe9j1WApd8/CDv7WQ2g45Uu','0801209657','2024-11-09 15:37:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-10  3:17:53
