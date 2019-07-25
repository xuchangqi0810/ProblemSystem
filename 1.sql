/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.62 : Database - problemtrackingsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`problemtrackingsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `problemtrackingsystem`;

/*Table structure for table `pt_dep` */

DROP TABLE IF EXISTS `pt_dep`;

CREATE TABLE `pt_dep` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(50) NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `pt_dep` */

insert  into `pt_dep`(`d_id`,`d_name`) values (1,'采购部'),(2,'工艺部'),(3,'生产部');

/*Table structure for table `pt_img` */

DROP TABLE IF EXISTS `pt_img`;

CREATE TABLE `pt_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`),
  KEY `pl_id` (`pl_id`),
  CONSTRAINT `pt_img_ibfk_2` FOREIGN KEY (`pl_id`) REFERENCES `pt_problem` (`pl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

/*Data for the table `pt_img` */

insert  into `pt_img`(`id`,`pl_id`,`url`) values (40,66,'20190711103936989.png'),(41,66,'20190711103937038.png'),(42,67,'20190711104018164.png'),(43,67,'20190711104018210.png'),(44,68,'20190711104108018.png'),(45,68,'20190711104108062.png'),(46,70,'20190711144053154.png'),(47,70,'20190711144053154.png'),(48,70,'20190711144053155.png'),(49,71,'20190712161235876.png'),(50,72,'20190712161250730.png'),(51,73,'20190712161304667.png'),(52,74,'20190712161326767.png'),(53,75,'20190712161335237.png'),(54,76,'20190715112127586.png'),(55,76,'20190715112127584.png'),(56,77,'20190715113642318.png'),(57,77,'20190715113642363.png'),(58,78,'20190715113706866.png'),(59,78,'20190715113706905.png'),(60,79,'20190715152204075.png'),(61,80,'20190715152232509.png'),(62,81,'20190715152251528.png'),(63,82,'20190715152721920.png'),(64,84,'20190715152746904.png'),(65,84,'20190715152746929.png'),(66,85,'20190715172450853.png'),(67,86,'20190715173327132.png'),(68,87,'20190715173634414.png'),(69,88,'20190715173800897.png'),(70,89,'20190716084507108.png'),(71,90,'20190716101919411.jpg'),(72,91,'20190717155116485.png'),(73,92,'20190717162057334.png'),(74,93,'20190717163420500.png'),(75,94,'20190719090838252.png'),(76,95,'20190719094357916.png'),(77,96,'20190719100239283.png'),(78,97,'20190719100420675.png'),(79,98,'20190719100520871.png'),(80,99,'20190719101805377.png'),(81,100,'20190724082731732.png'),(82,101,'20190724083618392.png'),(83,102,'20190724084323188.png'),(84,103,'20190724084915301.png'),(85,104,'20190724085237145.png'),(86,105,'20190724085449465.png'),(87,106,'20190724090317363.png'),(88,107,'20190724090854610.png'),(89,108,'20190724091242307.png'),(90,109,'20190724091624730.png'),(91,110,'20190724092225859.png'),(92,111,'20190724092315437.png'),(93,112,'20190724093655726.png'),(94,113,'20190724095208551.png'),(95,114,'20190724095610426.png'),(96,115,'20190724100819736.png'),(97,116,'20190724101321781.png'),(98,117,'20190724101624140.png'),(99,118,'20190724101931918.png'),(100,119,'20190724102257891.png'),(101,120,'20190724102353372.png'),(102,121,'20190724102621510.png'),(103,122,'20190724102736695.png'),(104,123,'20190724103239002.png'),(105,124,'20190724104653073.png'),(106,125,'20190724105630018.png'),(107,126,'20190724110749465.png'),(108,127,'20190724114109020.png'),(109,128,'20190724114148697.png'),(110,129,'20190724114629230.png'),(111,130,'20190724114648900.png'),(112,131,'20190724131836426.png'),(113,132,'20190724143414502.png'),(114,133,'20190724161343708.png'),(115,134,'20190725093849502.png');

/*Table structure for table `pt_navigation` */

DROP TABLE IF EXISTS `pt_navigation`;

CREATE TABLE `pt_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `path` varchar(100) NOT NULL COMMENT '连接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pt_navigation` */

/*Table structure for table `pt_problem` */

DROP TABLE IF EXISTS `pt_problem`;

CREATE TABLE `pt_problem` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题编号',
  `t_id` int(11) NOT NULL COMMENT '问题分类',
  `u_id` int(11) DEFAULT NULL COMMENT '负责人',
  `pl_name` varchar(100) NOT NULL COMMENT '问题名称',
  `pl_feedback` varchar(50) NOT NULL COMMENT '反馈人',
  `pl_describe` varchar(300) NOT NULL COMMENT '问题描述',
  `pl_lrDate` date NOT NULL COMMENT '录入时间',
  `pl_fsDate` datetime NOT NULL COMMENT '发生时间',
  `pl_yqDate` datetime DEFAULT NULL COMMENT '要求时间',
  `pl_wcDate` datetime DEFAULT NULL COMMENT '完成时间',
  `pl_state` int(11) NOT NULL COMMENT '1.未开始2.进行中（未完成）3.待审核4.已审核',
  `pl_serious` int(11) NOT NULL COMMENT '严重等级',
  `pl_programme` varchar(300) NOT NULL COMMENT '解决方案',
  `pl_yjhours` int(11) DEFAULT NULL COMMENT '预计使用时间',
  `pl_surplustime` int(11) DEFAULT NULL COMMENT '剩余时间',
  `pl_starttime` datetime DEFAULT NULL COMMENT '问题开始时间',
  `d_id` int(11) NOT NULL COMMENT '问题归属部门',
  PRIMARY KEY (`pl_id`),
  KEY `u_id` (`u_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `pt_problem_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `pt_user` (`u_id`),
  CONSTRAINT `pt_problem_ibfk_3` FOREIGN KEY (`t_id`) REFERENCES `pt_type` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

/*Data for the table `pt_problem` */

insert  into `pt_problem`(`pl_id`,`t_id`,`u_id`,`pl_name`,`pl_feedback`,`pl_describe`,`pl_lrDate`,`pl_fsDate`,`pl_yqDate`,`pl_wcDate`,`pl_state`,`pl_serious`,`pl_programme`,`pl_yjhours`,`pl_surplustime`,`pl_starttime`,`d_id`) values (66,4,6,'数据问题1','徐昌琦','11','2019-02-01','2019-07-11 00:00:00','2019-07-12 00:00:00',NULL,1,4,'22',NULL,NULL,'0001-01-01 00:00:00',2),(67,3,7,'采购问题1','徐昌琦','11','2019-02-01','2019-07-11 00:00:00','2019-07-13 00:00:00',NULL,1,4,'22',NULL,NULL,'0001-01-01 00:00:00',2),(68,4,4,'数据问题2','徐昌琦','11','2019-02-11','2019-07-11 00:00:00','2019-07-12 00:00:00','2019-07-17 14:01:22',4,4,'22',NULL,NULL,'2019-07-11 14:45:04',2),(69,5,9,'数据异常1','徐昌琦','问题描述','2019-02-11','2019-07-11 00:00:00','2019-07-15 00:00:00',NULL,1,3,'解决方案奥术大师大所大所大所大所大所大所大多撒多',NULL,NULL,'0001-01-01 00:00:00',2),(70,3,9,'数据异常1','徐昌琦','问题描述','2019-04-11','2019-07-11 00:00:00','2019-07-15 00:00:00',NULL,1,3,'解决方案',NULL,NULL,'0001-01-01 00:00:00',2),(71,3,1,'wdasd','徐昌琦','asd','2019-03-12','2019-07-12 00:00:00','0001-01-01 00:00:00',NULL,1,3,'',NULL,NULL,'0001-01-01 00:00:00',2),(72,3,4,'asd','徐昌琦','asd','2019-04-12','2019-07-12 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(73,5,7,'1wwa','徐昌琦','asd','2019-05-12','2019-07-12 00:00:00','0001-01-01 00:00:00',NULL,1,2,'aasd',NULL,NULL,'0001-01-01 00:00:00',2),(74,3,1,'asd','徐昌琦','asd','2019-07-12','2019-07-12 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(75,4,4,'asd','徐昌琦','asd','2019-04-12','2019-07-12 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(76,6,4,'xasd','徐昌琦','1','2019-07-15','2019-07-15 00:00:00','2019-07-18 00:00:00','2019-07-15 11:33:50',4,2,'adsa',NULL,NULL,'2019-07-15 11:33:03',2),(77,3,6,'sad','徐昌琦','asd','2019-07-15','2019-07-15 00:00:00','2019-07-18 00:00:00',NULL,1,4,'asd',NULL,NULL,'0001-01-01 00:00:00',2),(78,4,7,'asdas','徐昌琦','asd','2019-07-15','2019-07-15 00:00:00','2019-07-20 00:00:00',NULL,1,4,'asd',NULL,NULL,'0001-01-01 00:00:00',2),(79,7,1,'sad11','徐昌琦','asd','2019-07-15','2019-07-15 00:00:00','0001-01-01 00:00:00',NULL,1,4,'123',NULL,NULL,'0001-01-01 00:00:00',2),(80,8,6,'sad','徐昌琦','asd','2019-07-15','2019-07-15 00:00:00','2019-07-18 00:00:00',NULL,1,4,'as',NULL,NULL,'0001-01-01 00:00:00',2),(81,5,5,'asd','徐昌琦','asd','2019-07-15','2019-07-15 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(82,7,9,'132','徐昌琦','asd','2019-07-15','2019-07-15 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(83,4,7,'er','徐昌琦','awd','2019-07-15','2019-07-15 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(84,4,7,'er','徐昌琦','awd','2019-07-15','2019-07-15 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(85,7,4,'asd','徐昌琦','asd','2019-07-15','2019-07-15 00:00:00','2019-07-19 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(86,4,4,'asd','徐昌琦','asd','2019-07-15','2019-07-15 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(87,5,8,'123','徐昌琦','飞一般的速度','2019-07-15','2019-07-15 00:00:00','2019-07-20 00:00:00','2019-07-18 09:53:39',4,4,'增加负荷',NULL,NULL,'2019-07-18 09:53:28',2),(88,4,4,'123','徐昌琦','123','2019-07-15','2019-07-15 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(89,8,4,'456','admin','a23','2019-07-16','2019-07-17 00:00:00','0001-01-01 00:00:00',NULL,1,4,'123',NULL,NULL,'0001-01-01 00:00:00',2),(90,4,4,'世界核平','张朋','不可描述','2019-07-16','2019-07-16 00:00:00','2019-07-17 00:00:00','2019-07-22 09:56:51',4,1,'集中起爆',NULL,NULL,'2019-07-18 14:21:02',2),(91,4,4,'123','徐昌琦','123','2019-07-17','2019-07-05 00:00:00','0001-01-01 00:00:00',NULL,1,1,'asasd',NULL,NULL,'0001-01-01 00:00:00',2),(92,6,4,'新建问题1','徐昌琦','123','2019-07-17','2019-07-17 00:00:00','2019-07-19 00:00:00','2019-07-17 16:32:19',4,2,'12333',NULL,NULL,'2019-07-17 16:23:02',2),(93,5,4,'测试问题2','admin','123','2019-07-17','2019-07-17 00:00:00','2019-07-19 00:00:00','2019-07-17 16:35:05',4,4,'',NULL,NULL,'2019-07-17 16:34:55',2),(94,7,4,'132','徐昌琦','11','2019-07-19','2019-07-19 00:00:00','2019-07-20 00:00:00',NULL,2,4,'',NULL,NULL,'2019-07-22 09:11:56',2),(95,6,4,'23121','徐昌琦','1223','2019-07-19','2019-07-19 00:00:00','2019-07-20 00:00:00',NULL,1,4,'asd',NULL,NULL,'0001-01-01 00:00:00',2),(96,8,NULL,'asdas','徐昌琦','asd','2019-07-19','2019-07-19 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(97,8,NULL,'qwe','徐昌琦','qw','2019-07-19','2019-07-19 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(98,8,NULL,'asd','徐昌琦','','2019-07-19','2019-07-19 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(99,3,1,'123','徐昌琦','123','2019-07-19','2019-07-19 00:00:00','2019-07-21 00:00:00','2019-07-25 09:49:37',4,4,'',NULL,NULL,'2019-07-25 09:48:54',2),(100,8,8,'问题名称1','徐昌琦','123','2019-07-24','2019-07-24 00:00:00','2019-07-26 00:00:00','2019-07-24 08:33:42',3,4,'123',NULL,NULL,'2019-07-24 08:31:20',2),(101,4,8,'问题名称2','徐昌琦','123','2019-07-24','2019-07-24 00:00:00','2019-07-26 00:00:00','2019-07-24 08:45:15',3,2,'455',NULL,NULL,'2019-07-24 08:37:15',2),(102,3,8,'问题名称3','徐昌琦','123','2019-07-24','2019-07-24 00:00:00','2019-07-26 00:00:00','2019-07-24 08:45:25',2,4,'465',NULL,NULL,'2019-07-24 08:45:27',2),(103,6,6,'问题名称4','徐昌琦','123','2019-07-24','2019-07-24 00:00:00','2019-07-26 00:00:00','2019-07-24 08:50:14',2,2,'4565',NULL,NULL,'2019-07-24 08:50:16',2),(104,7,4,'问题名称5','张朋','1232','2019-07-24','2019-07-24 00:00:00','2019-07-26 00:00:00','2019-07-24 08:53:01',2,1,'45',NULL,NULL,'2019-07-24 08:53:03',2),(105,4,4,'问题名称6','张朋','123','2019-07-24','2019-07-24 00:00:00','0001-01-01 00:00:00','2019-07-24 08:55:02',2,4,'566333',NULL,NULL,'2019-07-24 08:57:00',2),(106,7,4,'问题名称7','张朋','123','2019-07-24','2019-07-24 00:00:00','0001-01-01 00:00:00','2019-07-24 09:03:28',2,4,'213333',NULL,NULL,'2019-07-24 09:03:36',2),(107,4,8,'sasds','徐昌琦','asd2222','2019-07-24','2019-07-24 00:00:00','0001-01-01 00:00:00','2019-07-24 09:09:16',2,4,'',NULL,NULL,'2019-07-24 09:09:18',2),(108,4,4,'23333','张朋','1323','2019-07-24','2019-07-24 00:00:00','0001-01-01 00:00:00',NULL,2,4,'adasd',NULL,NULL,'2019-07-24 09:12:52',2),(109,4,4,'asdsa','徐昌琦','seda','2019-07-24','2019-07-24 00:00:00','2019-07-26 00:00:00','2019-07-24 09:16:31',2,2,'asd',NULL,NULL,'2019-07-24 09:16:35',2),(110,4,4,'asdasdasd','徐昌琦','23','2019-07-24','2019-07-24 00:00:00','0001-01-01 00:00:00',NULL,1,2,'123',NULL,NULL,'0001-01-01 00:00:00',2),(111,3,4,'asdasd','徐昌琦','23','2019-07-24','2019-07-24 00:00:00','0001-01-01 00:00:00',NULL,1,4,'asdasdas',NULL,NULL,'0001-01-01 00:00:00',2),(112,6,4,'asdas','徐昌琦','asd','2019-07-24','2019-07-26 00:00:00','2019-07-27 00:00:00','2019-07-24 09:51:48',3,1,'this is a Problem33',NULL,NULL,'2019-07-24 09:50:17',2),(113,5,4,'asda','徐昌琦','asd','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 09:53:23',2,4,'',NULL,NULL,'2019-07-24 09:53:37',2),(114,4,4,'fffff','徐昌琦','asd','2019-07-24','2019-07-24 00:00:00','2019-07-26 00:00:00','2019-07-24 09:56:15',2,4,'asd',NULL,NULL,'2019-07-24 09:56:17',2),(115,6,4,'123','徐昌琦','233','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 10:13:07',3,4,'as',NULL,NULL,'2019-07-24 10:08:33',2),(116,6,4,'asdasd','徐昌琦','24eas','2019-07-24','2019-07-24 00:00:00','2019-07-26 00:00:00','2019-07-24 10:13:35',2,1,'asd',NULL,NULL,'2019-07-24 10:13:37',2),(117,5,4,'asdasd','徐昌琦','asd','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 10:16:29',2,4,'',NULL,NULL,'2019-07-24 10:16:35',2),(118,8,4,'阿斯顿','徐昌琦','阿斯顿','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 10:20:07',2,4,'',NULL,NULL,'2019-07-24 10:20:09',2),(119,4,4,'asd','徐昌琦','asd','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 10:24:20',4,2,'asd',NULL,NULL,'2019-07-24 10:23:18',2),(120,8,4,'asdsa','徐昌琦','asd','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 10:47:22',2,4,'',NULL,NULL,'2019-07-24 10:55:47',2),(121,4,4,'阿斯顿','徐昌琦','阿斯顿','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 10:26:33',2,4,'',NULL,NULL,'2019-07-24 10:26:36',2),(122,3,4,'zxc','徐昌琦','zxvx','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00',NULL,2,4,'',NULL,NULL,'2019-07-24 10:31:32',2),(123,5,4,'vcb','徐昌琦','bvc','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 10:46:11',4,2,'',NULL,NULL,'2019-07-24 10:45:17',2),(124,8,4,'23','徐昌琦','asd','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 11:35:01',2,4,'asd',NULL,NULL,'2019-07-24 11:35:27',2),(125,4,4,'ghf','徐昌琦','asd','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00',NULL,2,1,'wqe',NULL,NULL,'2019-07-24 11:02:54',2),(126,4,4,'tpoiu','徐昌琦','asd','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 11:33:19',2,2,'',NULL,NULL,'2019-07-24 11:33:21',2),(127,3,4,'fgh','徐昌琦','asfdd','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 11:41:18',2,4,'',NULL,NULL,'2019-07-24 11:41:11',2),(128,4,4,'asd','徐昌琦','a2asdsa','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 11:42:43',4,4,'asd33333',NULL,NULL,'2019-07-24 11:42:05',2),(129,8,NULL,'啊是大','徐昌琦','啊是大','2019-07-24','2019-07-24 00:00:00','0001-01-01 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00',2),(130,8,7,'很健康','徐昌琦','34','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00',NULL,1,2,'阿三',NULL,NULL,'0001-01-01 00:00:00',2),(131,6,6,'新建问题A测试','徐昌琦','问题描述A\n','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00',NULL,2,1,'解决方案A\n',NULL,NULL,'2019-07-24 13:20:14',2),(132,4,NULL,'问题B','徐昌琦','描述B','2019-07-24','2019-07-24 00:00:00','2019-07-26 00:00:00',NULL,1,4,'解决方案B',NULL,NULL,'0001-01-01 00:00:00',2),(133,8,4,'新建问题C','徐昌琦','问题描述C','2019-07-24','2019-07-24 00:00:00','2019-07-27 00:00:00','2019-07-24 16:20:28',4,1,'解决方案C',NULL,NULL,'2019-07-24 16:19:28',2),(134,8,9,'测试1','徐昌琦','测试描述123','2019-07-25','2019-07-24 00:00:00','2019-07-27 00:00:00',NULL,1,1,'测试方案123',NULL,NULL,'0001-01-01 00:00:00',2);

/*Table structure for table `pt_proinfo` */

DROP TABLE IF EXISTS `pt_proinfo`;

CREATE TABLE `pt_proinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_id` int(11) NOT NULL COMMENT '问题id',
  `u_id` int(11) DEFAULT NULL COMMENT '驳回人',
  `proDate` date NOT NULL COMMENT '操作时间',
  `state` int(11) NOT NULL COMMENT '2:正常录入问题数据3：录入驳回问题信息',
  `hours` int(11) DEFAULT NULL COMMENT '消耗工时',
  `surplus` int(11) DEFAULT NULL COMMENT '剩余工时',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pl_id` (`pl_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `pt_proinfo_ibfk_1` FOREIGN KEY (`pl_id`) REFERENCES `pt_problem` (`pl_id`),
  CONSTRAINT `pt_proinfo_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `pt_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `pt_proinfo` */

insert  into `pt_proinfo`(`id`,`pl_id`,`u_id`,`proDate`,`state`,`hours`,`surplus`,`remarks`) values (4,68,NULL,'2019-07-10',2,2,NULL,'完成xx'),(5,76,NULL,'2019-07-12',2,5,NULL,'asd'),(6,76,NULL,'2019-07-14',2,4,NULL,'as2as'),(7,92,NULL,'2019-07-17',2,2,NULL,'完成123'),(8,92,NULL,'2019-07-18',2,3,NULL,'完成2343'),(9,92,NULL,'2019-07-19',2,4,NULL,'完成23223'),(10,92,1,'2019-07-17',3,0,NULL,'未完成1111'),(11,92,NULL,'2019-07-19',2,4,NULL,'修改xxxx'),(12,93,NULL,'2019-07-17',2,4,NULL,'asdasd'),(13,87,NULL,'2019-07-18',2,4,NULL,'asdsa'),(14,90,NULL,'2019-07-22',2,5,NULL,'备注123'),(15,90,1,'2019-07-22',3,0,NULL,'1233'),(16,90,NULL,'2019-07-23',2,4,NULL,'456'),(17,100,NULL,'2019-07-24',2,5,NULL,'123'),(18,100,NULL,'2019-07-25',2,2,NULL,'456'),(19,100,NULL,'2019-07-25',2,2,NULL,'789'),(20,100,NULL,'2019-07-26',2,4,NULL,'159'),(21,101,NULL,'2019-07-24',2,3,NULL,'123'),(22,101,NULL,'2019-07-25',2,5,NULL,'456'),(23,102,NULL,'2019-07-24',2,3,NULL,'asd'),(24,103,NULL,'2019-07-24',2,3,NULL,'asd'),(25,104,NULL,'2019-07-24',2,2,NULL,'sad'),(26,112,NULL,'2019-07-05',2,3,NULL,'456'),(27,115,NULL,'2019-07-05',2,3,NULL,'asd'),(28,116,NULL,'2019-07-24',2,3,NULL,'asd'),(29,118,NULL,'2019-07-24',2,3,NULL,'阿斯顿'),(30,119,NULL,'2019-07-24',2,3,NULL,'asd'),(31,122,NULL,'2019-07-24',2,4,NULL,'asd'),(32,123,NULL,'2019-07-24',2,1,NULL,'12'),(33,122,NULL,'2019-07-24',2,3,NULL,'444'),(34,125,NULL,'2019-07-24',2,3,NULL,'asd'),(35,128,NULL,'2019-07-24',2,4,NULL,'wwa'),(36,128,NULL,'2019-07-26',2,5,NULL,'qqq'),(37,127,1,'2019-07-24',3,0,NULL,'rrrr'),(38,131,NULL,'2019-07-24',2,5,NULL,'asd'),(39,131,NULL,'2019-07-25',2,6,NULL,'asd'),(40,133,NULL,'2019-07-24',2,5,NULL,'问题备注'),(41,99,NULL,'2019-07-25',2,4,NULL,'abcd'),(42,99,NULL,'2019-07-26',2,1,NULL,'efgh'),(43,118,NULL,'2019-07-25',2,2,NULL,'456'),(44,118,NULL,'2019-07-26',2,6,NULL,'789'),(45,118,NULL,'2019-07-26',2,4,NULL,'789'),(46,118,NULL,'2019-07-27',2,4,NULL,'546');

/*Table structure for table `pt_role` */

DROP TABLE IF EXISTS `pt_role`;

CREATE TABLE `pt_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `r_name` varchar(50) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `pt_role` */

insert  into `pt_role`(`id`,`r_name`) values (1,'amdin'),(2,'管理'),(3,'普通员工');

/*Table structure for table `pt_type` */

DROP TABLE IF EXISTS `pt_type`;

CREATE TABLE `pt_type` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题类型编号',
  `t_name` varchar(50) NOT NULL COMMENT '问题类型名称',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `pt_type` */

insert  into `pt_type`(`t_id`,`t_name`) values (3,'采购问题'),(4,'设计问题'),(5,'工艺问题'),(6,'生产问题'),(7,'质检问题'),(8,'仓储物流问题');

/*Table structure for table `pt_user` */

DROP TABLE IF EXISTS `pt_user`;

CREATE TABLE `pt_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `d_id` int(11) NOT NULL COMMENT '部门编号',
  `u_name` varchar(50) NOT NULL COMMENT '用户名',
  `u_nickName` varchar(50) NOT NULL COMMENT '真实姓名',
  `password` varchar(50) NOT NULL COMMENT '登录密码',
  `u_gender` int(11) NOT NULL COMMENT '性别',
  `u_email` varchar(150) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`u_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `pt_user_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `pt_dep` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `pt_user` */

insert  into `pt_user`(`u_id`,`d_id`,`u_name`,`u_nickName`,`password`,`u_gender`,`u_email`) values (1,2,'admin','admin','325a2cc052914ceeb8c19016c091d2ac',1,'xuchangqi0810@dingtalk.com'),(4,2,'xcq','徐昌琦','0242764e5bbcac5c170cbf1eb27d1770',1,'xuchangqi0810@dingtalk.com'),(5,2,'tianlei','田雷','325a2cc052914ceeb8c19016c091d2ac',1,'tianlei1121@dingtalk.com'),(6,2,'zhangmy','张明玉','325a2cc052914ceeb8c19016c091d2ac',1,'zhangmingyu0074@dingtalk.com'),(7,2,'huangsw','黄晟维','325a2cc052914ceeb8c19016c091d2ac',1,'huangshengwei0008@dingtalk.com'),(8,2,'zhangpeng','张朋','325a2cc052914ceeb8c19016c091d2ac',1,'lsr8167@dingtalk.com'),(9,2,'zhongmw','钟明玮','325a2cc052914ceeb8c19016c091d2ac',1,'pir4648@dingtalk.com'),(10,3,'user','user','325a2cc052914ceeb8c19016c091d2ac',1,'xuchangqi0810@dingtalk.com');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `u_id` (`u_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `pt_user` (`u_id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `pt_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`u_id`,`r_id`) values (1,1,1),(3,4,3),(4,5,2),(5,6,3),(6,7,3),(7,8,3),(8,9,3),(9,10,3);

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `day_event` */

/*!50106 DROP EVENT IF EXISTS `day_event`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`localhost` EVENT `day_event` ON SCHEDULE EVERY 1 DAY STARTS '2019-06-18 10:18:27' ON COMPLETION PRESERVE ENABLE DO call updatetime() */$$
DELIMITER ;

/* Procedure structure for procedure `updatetime` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatetime` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatetime`()
BEGIN
	UPDATE pt_problem SET realtime = NOW() WHERE pl_state = 2;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
