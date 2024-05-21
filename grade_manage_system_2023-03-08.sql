# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.23)
# Database: grade_manage_system
# Generation Time: 2023-03-08 06:35:29 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` char(5) NOT NULL,
  `course_name` varchar(20) NOT NULL,
  `year` char(4) NOT NULL,
  `semester` char(2) NOT NULL,
  `teacher_id` char(5) NOT NULL,
  `credit` tinyint unsigned NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE,
  CONSTRAINT `course_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;

INSERT INTO `course` (`course_id`, `course_name`, `year`, `semester`, `teacher_id`, `credit`)
VALUES
	('00001','数据库系统原理','2019','春','00001',3),
	('00002','计算机系统结构','2019','春','00002',3),
	('00003','现代交换原理','2019','春','00003',3),
	('00004','软件工程','2019','春','00004',3),
	('00005','通信原理','2018','秋','00005',4),
	('00006','编译原理与技术','2018','秋','00006',4),
	('00007','操作系统','2018','秋','00007',4),
	('00008','微机系统与接口技术','2018','秋','00008',4),
	('00009','计算机网络','2018','春','00009',4),
	('00010','计算机组成原理','2018','春','00010',5),
	('00011','算法设计与分析','2018','春','00011',2),
	('00012','形式语言与自动机','2018','春','00012',2),
	('00013','离散数学','2017','秋','00013',6),
	('00014','算法与数据结构','2017','秋','00014',5),
	('00015','毛泽东思想概论','2017','秋','00015',4),
	('00016','数字逻辑','2017','秋','00016',4),
	('00017','电路与电子学','2017','春','00017',3),
	('00018','数学分析','2017','春','00018',10),
	('00019','高等数学','2017','春','00019',10),
	('00020','大学物理','2017','春','00020',4),
	('00021','思想道德修养','2016','秋','00021',3),
	('00022','中国近代史纲要','2016','秋','00022',2),
	('00023','线性代数','2016','秋','00023',3),
	('00024','大学英语','2016','秋','00024',3);

/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table major
# ------------------------------------------------------------

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `major_id` char(3) NOT NULL,
  `major_name` varchar(20) NOT NULL,
  PRIMARY KEY (`major_id`),
  UNIQUE KEY `major_name` (`major_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;

INSERT INTO `major` (`major_id`, `major_name`)
VALUES
	('210','信息安全'),
	('211','计算机科学与技术'),
	('212','通信工程');

/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table major_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `major_course`;

CREATE TABLE `major_course` (
  `major_id` char(3) NOT NULL,
  `course_id` char(5) NOT NULL,
  PRIMARY KEY (`major_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `major_course_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `major_course_ibfk_2` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE CASCADE,
  CONSTRAINT `major_course_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `major_course_ibfk_4` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE CASCADE,
  CONSTRAINT `major_course_ibfk_5` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `major_course` WRITE;
/*!40000 ALTER TABLE `major_course` DISABLE KEYS */;

INSERT INTO `major_course` (`major_id`, `course_id`)
VALUES
	('210','00001'),
	('210','00002'),
	('211','00002'),
	('211','00003'),
	('212','00003'),
	('212','00004'),
	('210','00005'),
	('210','00006'),
	('211','00006'),
	('211','00007'),
	('212','00007'),
	('212','00008'),
	('210','00009'),
	('210','00010'),
	('211','00010'),
	('211','00011'),
	('212','00011'),
	('212','00012'),
	('210','00013'),
	('210','00014'),
	('211','00014'),
	('211','00015'),
	('212','00015'),
	('212','00016'),
	('210','00017'),
	('210','00018'),
	('211','00018'),
	('211','00019'),
	('212','00019'),
	('212','00020'),
	('210','00021'),
	('210','00022'),
	('211','00022'),
	('211','00023'),
	('212','00023'),
	('212','00024');

/*!40000 ALTER TABLE `major_course` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `trigger_insert_1` AFTER INSERT ON `major_course` FOR EACH ROW begin
    insert into student_course (
        select student_id, new.course_id, null
        from student
        where major_id = new.major_id
    );
end */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `trigger_delete_1` AFTER DELETE ON `major_course` FOR EACH ROW begin
    delete from student_course
    where student_id in (
        select student_id
        from student
        where major_id = old.major_id
    ) and course_id = old.course_id;
end */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` char(10) NOT NULL,
  `student_name` varchar(20) NOT NULL,
  `sex` char(2) DEFAULT NULL,
  `birth_year` char(4) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `enter_year` char(4) NOT NULL,
  `major_id` char(3) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;

INSERT INTO `student` (`student_id`, `student_name`, `sex`, `birth_year`, `province`, `enter_year`, `major_id`, `password`)
VALUES
	('2016210244','顾曼音','男','1998','江西省','2016','212','pbkdf2:sha256:150000$w2IgccPZ$319ec328700194590c583f3e178af93be8eb1f4f5090f073ea09810ae205a8d6'),
	('2016210249','似安青','男','1998','湖南省','2016','211','pbkdf2:sha256:150000$5k9J7KWz$98a3ad169ed4c8bf65b5b2585110d0c5605adc900b584d32e5d6bf014e391abb'),
	('2016210250','象幼旋','男','1998','广东省','2016','211','pbkdf2:sha256:150000$cu6XQ4Ay$c46768b201230c14bf8afb71ffbea39bec08ef72ce85b729a76c4589e43a9ddc'),
	('2016210253','谌幼','男','1998','四川省','2016','212','pbkdf2:sha256:150000$eESSlA1Y$9888e15093647a29a93baa3f4157a53dbe8dda2e526fda65efe9362b8bd882c4'),
	('2016210262','督心诺','女','1998','辽宁省','2016','211','pbkdf2:sha256:150000$OrrNgqbA$c5e694aa5205874904bd9339fbfa7fce853061922680a4dfa1d648cbff8fbf68'),
	('2016211235','唐雪卉','男','1998','北京市','2016','210','pbkdf2:sha256:150000$mJ7OBbLx$5ac26f85fb1a819b6b77d58ecb756c85815ec9741cd0e6f6d821ccf359a4524b'),
	('2016211237','藏寒荷','男','1998','河北省','2016','211','pbkdf2:sha256:150000$Fxoqf2bf$41d2794c4373dffe4b296bcd7323e20b65027908417a3bcc0db9a4bc345898a9'),
	('2016211239','素承泽','男','1998','黑龙江省','2016','210','pbkdf2:sha256:150000$DFJ6OkSt$d120f3bc3ce2ce672d8f180a3603ba23f13a1dd880d9eba38b1f27620b0a70eb'),
	('2016211246','支承教','男','1998','河南省','2016','210','pbkdf2:sha256:150000$UNjQfEUJ$678e97302f3d15077f4550d5e30cd129b85b2fac0306266cf68ccef18f17a101'),
	('2016211252','考珺娅','女','1998','重庆市','2016','210','pbkdf2:sha256:150000$F2wNnxko$e245dfa9f3adca5147874bd69a006da8e68324763738fd1cba9d769e3fb0e7ca'),
	('2016211257','布昊天','男','1997','浙江省','2016','210','pbkdf2:sha256:150000$pyPyYytB$f624265d0c7440a0bbdb8f6293bbf78c7d4c8fc006a4f1c4d1103e57f554bc07'),
	('2016211258','玄昊焱','男','1997','宁夏省','2016','210','pbkdf2:sha256:150000$OnbCrdTY$3c69e98ce90fdecaab15668fc1b4cc835cf37f50ece5f423a09d489dc1be275b'),
	('2016211261','薄水瑶','女','1998','山西省','2016','211','pbkdf2:sha256:150000$aYx8jgQa$86809bd7b23902ba2edb725fbebe077a6912d5a28db5e1cf0f9a7fc6e80075a1'),
	('2016211263','冉迎丝','女','1998','黑龙江省','2016','211','pbkdf2:sha256:150000$VI5TS38B$22db4ea5ecd03e199a20fa33a6c79a6b13d45965769c85f8bc7729068a95cc68'),
	('2016211265','仁宏达','女','1998','新疆省','2016','211','pbkdf2:sha256:150000$LMqSX79Z$205fd932d9515ee3a5ba0b081fef8f271b51050a449d967e4c0ae649de371a2d'),
	('2016212241','南宫又香','男','1998','浙江省','2016','212','pbkdf2:sha256:150000$h9edjELj$22edfdc178b5237e4cd25c6f24176c234dea3e4035267377b7995dc383661d7a'),
	('2016212255','苍一禾','男','1996','陕西省','2016','212','pbkdf2:sha256:150000$hjSh0k2Q$e04fdddc5008e9956df8e70b949b163b02311748fc115448f577ddedb84076f0'),
	('2016212256','水凡巧','男','1997','甘肃省','2016','212','pbkdf2:sha256:150000$pL2UBsrU$dcc2d21ab8069e96662f75cb51dbeafc2240d59fa4e1e612ef9cbfedcc9603aa'),
	('2016212264','偶兴平','女','1998','广西省','2016','212','pbkdf2:sha256:150000$usP122s5$8279428d6beaf0476ef9d65b9207f9beab823e191a42758d8f53b8f2323968dd'),
	('2016212326','宗飞荷','男','1998','山东省','2016','212','pbkdf2:sha256:150000$UrGmZisZ$beaaa9ab3be51b60f3e6c00da4b5bf53c055dfa120ce80c3a7864d5d9f081dbe');

/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `trigger_insert_2` AFTER INSERT ON `student` FOR EACH ROW begin
    insert into student_course (
        select new.student_id, course_id, null
        from major_course
        where major_id = new.major_id
    );
end */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `tigger_delete_2` AFTER DELETE ON `student` FOR EACH ROW begin
    delete from student_course
    where course_id in (
        select course_id
        from major_course
        where major_id = old.major_id
    ) and student_id = old.student_id;
end */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table student_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_course`;

CREATE TABLE `student_course` (
  `student_id` char(10) NOT NULL,
  `course_id` char(5) NOT NULL,
  `grade` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;

INSERT INTO `student_course` (`student_id`, `course_id`, `grade`)
VALUES
	('2016210244','00003',NULL),
	('2016210244','00004',NULL),
	('2016210244','00007',NULL),
	('2016210244','00008',NULL),
	('2016210244','00011',NULL),
	('2016210244','00012',NULL),
	('2016210244','00015',NULL),
	('2016210244','00016',NULL),
	('2016210244','00019',NULL),
	('2016210244','00020',NULL),
	('2016210244','00023',NULL),
	('2016210244','00024',NULL),
	('2016210249','00002',NULL),
	('2016210249','00003',NULL),
	('2016210249','00006',NULL),
	('2016210249','00007',NULL),
	('2016210249','00010',NULL),
	('2016210249','00011',NULL),
	('2016210249','00014',NULL),
	('2016210249','00015',NULL),
	('2016210249','00018',NULL),
	('2016210249','00019',NULL),
	('2016210249','00022',NULL),
	('2016210249','00023',NULL),
	('2016210250','00002',NULL),
	('2016210250','00003',NULL),
	('2016210250','00006',NULL),
	('2016210250','00007',NULL),
	('2016210250','00010',NULL),
	('2016210250','00011',NULL),
	('2016210250','00014',NULL),
	('2016210250','00015',NULL),
	('2016210250','00018',NULL),
	('2016210250','00019',NULL),
	('2016210250','00022',NULL),
	('2016210250','00023',NULL),
	('2016210253','00003',NULL),
	('2016210253','00004',NULL),
	('2016210253','00007',NULL),
	('2016210253','00008',NULL),
	('2016210253','00011',NULL),
	('2016210253','00012',NULL),
	('2016210253','00015',NULL),
	('2016210253','00016',NULL),
	('2016210253','00019',NULL),
	('2016210253','00020',NULL),
	('2016210253','00023',NULL),
	('2016210253','00024',NULL),
	('2016210262','00002',NULL),
	('2016210262','00003',NULL),
	('2016210262','00006',NULL),
	('2016210262','00007',NULL),
	('2016210262','00010',NULL),
	('2016210262','00011',NULL),
	('2016210262','00014',NULL),
	('2016210262','00015',NULL),
	('2016210262','00018',NULL),
	('2016210262','00019',NULL),
	('2016210262','00022',NULL),
	('2016210262','00023',NULL),
	('2016211235','00001',NULL),
	('2016211235','00002',NULL),
	('2016211235','00005',NULL),
	('2016211235','00006',NULL),
	('2016211235','00009',NULL),
	('2016211235','00010',NULL),
	('2016211235','00013',NULL),
	('2016211235','00014',NULL),
	('2016211235','00017',NULL),
	('2016211235','00018',NULL),
	('2016211235','00021',NULL),
	('2016211235','00022',NULL),
	('2016211237','00002',NULL),
	('2016211237','00003',NULL),
	('2016211237','00006',NULL),
	('2016211237','00007',NULL),
	('2016211237','00010',NULL),
	('2016211237','00011',NULL),
	('2016211237','00014',NULL),
	('2016211237','00015',NULL),
	('2016211237','00018',NULL),
	('2016211237','00019',NULL),
	('2016211237','00022',NULL),
	('2016211237','00023',NULL),
	('2016211239','00001',NULL),
	('2016211239','00002',NULL),
	('2016211239','00005',NULL),
	('2016211239','00006',NULL),
	('2016211239','00009',NULL),
	('2016211239','00010',NULL),
	('2016211239','00013',NULL),
	('2016211239','00014',NULL),
	('2016211239','00017',NULL),
	('2016211239','00018',NULL),
	('2016211239','00021',NULL),
	('2016211239','00022',NULL),
	('2016211246','00001',NULL),
	('2016211246','00002',NULL),
	('2016211246','00005',NULL),
	('2016211246','00006',NULL),
	('2016211246','00009',NULL),
	('2016211246','00010',NULL),
	('2016211246','00013',NULL),
	('2016211246','00014',NULL),
	('2016211246','00017',NULL),
	('2016211246','00018',NULL),
	('2016211246','00021',NULL),
	('2016211246','00022',NULL),
	('2016211252','00001',NULL),
	('2016211252','00002',NULL),
	('2016211252','00005',NULL),
	('2016211252','00006',NULL),
	('2016211252','00009',NULL),
	('2016211252','00010',NULL),
	('2016211252','00013',NULL),
	('2016211252','00014',NULL),
	('2016211252','00017',NULL),
	('2016211252','00018',NULL),
	('2016211252','00021',NULL),
	('2016211252','00022',NULL),
	('2016211257','00001',NULL),
	('2016211257','00002',NULL),
	('2016211257','00005',NULL),
	('2016211257','00006',NULL),
	('2016211257','00009',NULL),
	('2016211257','00010',NULL),
	('2016211257','00013',NULL),
	('2016211257','00014',NULL),
	('2016211257','00017',NULL),
	('2016211257','00018',NULL),
	('2016211257','00021',NULL),
	('2016211257','00022',NULL),
	('2016211258','00001',NULL),
	('2016211258','00002',NULL),
	('2016211258','00005',NULL),
	('2016211258','00006',NULL),
	('2016211258','00009',NULL),
	('2016211258','00010',NULL),
	('2016211258','00013',NULL),
	('2016211258','00014',NULL),
	('2016211258','00017',NULL),
	('2016211258','00018',NULL),
	('2016211258','00021',NULL),
	('2016211258','00022',NULL),
	('2016211261','00002',NULL),
	('2016211261','00003',NULL),
	('2016211261','00006',NULL),
	('2016211261','00007',NULL),
	('2016211261','00010',NULL),
	('2016211261','00011',NULL),
	('2016211261','00014',NULL),
	('2016211261','00015',NULL),
	('2016211261','00018',NULL),
	('2016211261','00019',NULL),
	('2016211261','00022',NULL),
	('2016211261','00023',NULL),
	('2016211263','00002',NULL),
	('2016211263','00003',NULL),
	('2016211263','00006',NULL),
	('2016211263','00007',NULL),
	('2016211263','00010',NULL),
	('2016211263','00011',NULL),
	('2016211263','00014',NULL),
	('2016211263','00015',NULL),
	('2016211263','00018',NULL),
	('2016211263','00019',NULL),
	('2016211263','00022',NULL),
	('2016211263','00023',NULL),
	('2016211265','00002',NULL),
	('2016211265','00003',NULL),
	('2016211265','00006',NULL),
	('2016211265','00007',NULL),
	('2016211265','00010',NULL),
	('2016211265','00011',NULL),
	('2016211265','00014',NULL),
	('2016211265','00015',NULL),
	('2016211265','00018',NULL),
	('2016211265','00019',NULL),
	('2016211265','00022',NULL),
	('2016211265','00023',NULL),
	('2016212241','00003',NULL),
	('2016212241','00004',NULL),
	('2016212241','00007',NULL),
	('2016212241','00008',NULL),
	('2016212241','00011',NULL),
	('2016212241','00012',NULL),
	('2016212241','00015',NULL),
	('2016212241','00016',NULL),
	('2016212241','00019',NULL),
	('2016212241','00020',NULL),
	('2016212241','00023',NULL),
	('2016212241','00024',NULL),
	('2016212255','00003',NULL),
	('2016212255','00004',NULL),
	('2016212255','00007',NULL),
	('2016212255','00008',NULL),
	('2016212255','00011',NULL),
	('2016212255','00012',NULL),
	('2016212255','00015',NULL),
	('2016212255','00016',NULL),
	('2016212255','00019',NULL),
	('2016212255','00020',NULL),
	('2016212255','00023',NULL),
	('2016212255','00024',NULL),
	('2016212256','00003',NULL),
	('2016212256','00004',NULL),
	('2016212256','00007',NULL),
	('2016212256','00008',NULL),
	('2016212256','00011',NULL),
	('2016212256','00012',NULL),
	('2016212256','00015',NULL),
	('2016212256','00016',NULL),
	('2016212256','00019',NULL),
	('2016212256','00020',NULL),
	('2016212256','00023',NULL),
	('2016212256','00024',NULL),
	('2016212264','00003',NULL),
	('2016212264','00004',NULL),
	('2016212264','00007',NULL),
	('2016212264','00008',NULL),
	('2016212264','00011',NULL),
	('2016212264','00012',NULL),
	('2016212264','00015',NULL),
	('2016212264','00016',NULL),
	('2016212264','00019',NULL),
	('2016212264','00020',NULL),
	('2016212264','00023',NULL),
	('2016212264','00024',NULL),
	('2016212326','00003',NULL),
	('2016212326','00004',NULL),
	('2016212326','00007',NULL),
	('2016212326','00008',NULL),
	('2016212326','00011',NULL),
	('2016212326','00012',NULL),
	('2016212326','00015',NULL),
	('2016212326','00016',NULL),
	('2016212326','00019',NULL),
	('2016212326','00020',NULL),
	('2016212326','00023',NULL),
	('2016212326','00024',NULL);

/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teacher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `teacher_id` char(5) NOT NULL,
  `teacher_name` varchar(20) NOT NULL,
  `sex` char(2) DEFAULT NULL,
  `birth_year` char(4) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;

INSERT INTO `teacher` (`teacher_id`, `teacher_name`, `sex`, `birth_year`, `password`)
VALUES
	('00001','晏白卉','女','1970','pbkdf2:sha256:150000$AeM3pggJ$9c0b6909b259369548521a3dbe79fe1935c77132b169d77ef1e66f9d5d795ed6'),
	('00002','门俊楠','男','1971','pbkdf2:sha256:150000$jqt7NswK$dbf8afc3b6a0bc833ba9b28578945bbb6186a35f7ec7ae6a3c059909135e21e2'),
	('00003','侨嫣','男','1972','pbkdf2:sha256:150000$0Y4t7COW$2a455bbb968691e1c88f089ffc80c90053cef5406e7a3933c56563b7a72f3e45'),
	('00004','藤丽雅','男','1973','pbkdf2:sha256:150000$94V4m1eA$3edaf549bb560278a22d36416c78bf54762840d47238e5a755fc018cadcf358d'),
	('00005','尹盼香','女','1974','pbkdf2:sha256:150000$vhS05WHD$505b24e752e699051ab92ac1903a09519b92fa9abd27a173300a2970dbdadf95'),
	('00006','丙淳雅','女','1975','pbkdf2:sha256:150000$h4XH5Zmh$0809312e3b5bf4aeef71e40a11e6e08df299b2f04bb4734adb4cd89d9a9e60a2'),
	('00007','旷曼梅','男','1976','pbkdf2:sha256:150000$zdFOOBnp$67370b07b0018fae57c2225781c0b486571d67776a1733b061056654c2790c2a'),
	('00008','羿晶晶','男','1977','pbkdf2:sha256:150000$aKTQFzNy$99cc9287bc1908264b3cd2b9d52ca8bae0c16a8173ae890e19ea93e65504d134'),
	('00009','阙寄云','女','1978','pbkdf2:sha256:150000$gLPBmwGI$c7bf242b751e89e67a4a0c4b2710b40ba7a82f185fb374fd01b78c1cecb8db37'),
	('00010','鲜于建业','男','1979','pbkdf2:sha256:150000$oOLGzWN6$81cf7a472dcdb6073ad53eea7bbff1b7328a27e6bd8d4debb144f5b1f3305fcb'),
	('00011','徐乐蕊','男','1980','pbkdf2:sha256:150000$NlDL2ubt$b3bbc1f589ef441f9d9f3475caf1a252811aa7dde5eb66ac293404300a70b80d'),
	('00012','长仪芳','男','1981','pbkdf2:sha256:150000$VEh9oJRN$6b84b0c0017144ee2d503d5d52a3f8a8f28442bd3a97695e3775cb46e1318854'),
	('00013','匡适','男','1982','pbkdf2:sha256:150000$bFSGVusE$e7ecbd57ef721b7fcbf4d8d1698f81111c500fcf851e775647a8a58917423b71'),
	('00014','穰淡','男','1983','pbkdf2:sha256:150000$E6BMrz1P$fcce112be4d0767a65cd1f51f422b93c2d107213ab4c30b35e79295501f4aa22'),
	('00015','典笛','女','1984','pbkdf2:sha256:150000$2rICjiWp$102a5c3395f8e2c0106b273583c2da0d6ab922408daacb1211072e0e82c6cadf'),
	('00016','锁天睿','男','1985','pbkdf2:sha256:150000$ZgvvgoJw$20e6005b323f14ab30023964fce51f8c1b3f29c16ea6c0ee47a29323f1554c40'),
	('00017','梁丘寻桃','男','1970','pbkdf2:sha256:150000$4ijihZke$7ad1a39d41f9f7c9316674f04cf02a9f988494d5d3771a169f0012c4e1c4c4d7'),
	('00018','续丝柳','女','1971','pbkdf2:sha256:150000$MFq61dRz$a79062cdd153425cc5cb33d32e7820ecde0dbeb0b0886058cb297d3a71f0f1ce'),
	('00019','愚子怡','男','1972','pbkdf2:sha256:150000$lQe9tC8O$c89c4d928b53d6a48562959ff18816a7b924d4b42ed74fd17c1dfde8abdca2bf'),
	('00020','昝易真','男','1973','pbkdf2:sha256:150000$G70WUUhD$c6f78699203bae23ecd70d88082d5c1a8f7c0eddd8254eca422ee674c62ca4ac'),
	('00021','卫萝','女','1974','pbkdf2:sha256:150000$5OuoY7mN$acaaee2a03245b6d95fdb7da05a3075f49f63dfc44f884a0a2c73c4b76cd42ad'),
	('00022','宁雅青','男','1975','pbkdf2:sha256:150000$h2RKPTKp$4b279252bf4c42ac17b889983d370a02d13e65751f380d9dcdd7d61bf2dbeda6'),
	('00023','粟俊喆','男','1976','pbkdf2:sha256:150000$w8ssOSPW$47ef6ce8d334d992a3d745a2a843fa265a6129c2082f75815e63980bd32d0289'),
	('00024','宏绮艳','女','1977','pbkdf2:sha256:150000$Eb1T4Odh$d38c100741e03f81ec5ade79a8b6259e3cc62b6cdaf442eedbd22b193359cfbd');

/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
