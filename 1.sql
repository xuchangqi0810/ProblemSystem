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

insert  into `pt_img`(`id`,`pl_id`,`url`) values (95,133,'20190621113209446.png'),(96,133,'20190621113209504.png'),(97,134,'20190621115942025.png'),(98,134,'20190621115942069.png'),(99,135,'20190621130722078.png'),(100,136,'20190621140607695.png'),(101,136,'20190621140607735.png'),(103,138,'20190621141006959.png'),(104,139,'20190621141516046.png'),(105,139,'20190621141516089.png'),(106,140,'20190621143639691.png'),(107,140,'20190621143639730.png'),(108,141,'20190621151522390.png'),(109,141,'20190621151522440.png'),(110,142,'20190621151659774.png'),(111,143,'20190621161555027.png'),(112,143,'20190621161555136.png'),(113,144,'20190621162238443.png'),(114,144,'20190621162238486.png'),(115,145,'20190624135657914.png');

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
  `pl_lrDate` datetime NOT NULL COMMENT '录入时间',
  `pl_fsDate` datetime NOT NULL COMMENT '发生时间',
  `pl_yqDate` datetime DEFAULT NULL COMMENT '要求时间',
  `pl_wcDate` datetime DEFAULT NULL COMMENT '完成时间',
  `pl_state` int(11) NOT NULL COMMENT '1.未开始2.进行中（未完成）3.待审核4.已审核',
  `pl_serious` int(11) NOT NULL COMMENT '严重等级',
  `pl_programme` varchar(300) NOT NULL COMMENT '解决方案',
  `pl_yjhours` int(11) DEFAULT NULL COMMENT '预计使用时间',
  `pl_surplustime` int(11) DEFAULT NULL COMMENT '剩余时间',
  `pl_starttime` datetime DEFAULT NULL COMMENT '问题开始时间',
  PRIMARY KEY (`pl_id`),
  KEY `u_id` (`u_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `pt_problem_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `pt_user` (`u_id`),
  CONSTRAINT `pt_problem_ibfk_3` FOREIGN KEY (`t_id`) REFERENCES `pt_type` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

/*Data for the table `pt_problem` */

insert  into `pt_problem`(`pl_id`,`t_id`,`u_id`,`pl_name`,`pl_feedback`,`pl_describe`,`pl_lrDate`,`pl_fsDate`,`pl_yqDate`,`pl_wcDate`,`pl_state`,`pl_serious`,`pl_programme`,`pl_yjhours`,`pl_surplustime`,`pl_starttime`) values (133,3,1,'新建问题1','张三','问题描述1','2019-06-21 00:00:00','2019-06-20 00:00:00','2019-06-23 00:00:00','2019-06-21 11:58:46',4,3,'解决方案1',NULL,NULL,'2019-06-21 11:51:05'),(134,4,1,'新建问题2','张三','问题描述2','2019-06-21 00:00:00','2019-06-21 00:00:00','2019-06-24 00:00:00','2019-06-21 12:00:44',4,4,'解决方案2',NULL,NULL,'2019-06-21 11:59:45'),(135,4,1,'新建问题3','张三','问题描述3','2019-06-21 00:00:00','2019-06-19 00:00:00','2019-06-22 00:00:00','2019-06-21 13:20:20',4,1,'解决方案3',NULL,NULL,'2019-06-21 13:07:51'),(136,4,1,'新建问题4','张三','问题描述4','2019-06-21 00:00:00','2019-06-19 00:00:00','2019-06-22 00:00:00',NULL,1,3,'解决方案4',NULL,NULL,'0001-01-01 00:00:00'),(138,4,1,'新建问题6','张三','问题描述6','2019-06-21 00:00:00','2019-06-19 00:00:00','2019-06-22 00:00:00','2019-06-21 14:29:17',2,2,'',NULL,NULL,'0001-01-01 00:00:00'),(139,4,1,'新建问题6','张三','','2019-06-21 00:00:00','2019-06-20 00:00:00','2019-06-22 00:00:00','2019-06-21 14:29:40',2,4,'阿达',NULL,NULL,'0001-01-01 00:00:00'),(140,4,1,'新建问题7','张三','问题描述7','2019-06-21 00:00:00','2019-06-20 00:00:00','2019-06-22 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00'),(141,3,1,'新建问题12','张三','问题描述12','2019-06-21 00:00:00','2019-06-21 00:00:00','2019-06-22 00:00:00',NULL,1,4,'',NULL,NULL,'0001-01-01 00:00:00'),(142,4,1,'新建问题14','张三','aaa','2019-06-21 00:00:00','2019-06-21 00:00:00','2019-06-22 00:00:00','2019-06-24 10:03:33',3,4,'',NULL,NULL,'2019-06-24 10:03:06'),(143,3,1,'新建问题222','张三','aaaa','2019-06-21 00:00:00','2019-06-20 00:00:00','2019-06-22 00:00:00','2019-06-24 13:38:42',4,4,'aaa',NULL,NULL,'2019-06-24 09:56:55'),(144,4,1,'新建问题6666','李四','问题描述666','2019-06-21 00:00:00','2019-06-20 00:00:00','0001-01-01 00:00:00',NULL,1,4,'解决方案666',NULL,NULL,'0001-01-01 00:00:00'),(145,4,4,'软件安装失败','徐昌琦','软件安装xxxx出现错误','2019-06-24 00:00:00','2019-06-24 00:00:00','2019-06-25 00:00:00','2019-06-24 14:06:13',3,3,'重新安装',NULL,NULL,'2019-06-24 14:02:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

/*Data for the table `pt_proinfo` */

insert  into `pt_proinfo`(`id`,`pl_id`,`u_id`,`proDate`,`state`,`hours`,`surplus`,`remarks`) values (84,133,NULL,'2019-06-20',2,8,NULL,'awdsad'),(85,133,NULL,'2019-06-21',2,2,NULL,'adas'),(86,134,NULL,'2019-06-21',2,12,NULL,'备注2222'),(87,134,1,'2019-06-21',3,0,NULL,'反馈1'),(88,134,NULL,'2019-06-22',2,4,NULL,'啊啊啊啊'),(89,135,NULL,'2019-06-20',2,5,NULL,'备注1'),(90,135,1,'2019-06-21',3,0,NULL,'反馈意见13'),(91,138,1,'2019-06-21',3,0,NULL,'11'),(92,138,1,'2019-06-21',3,0,NULL,'11'),(93,138,1,'2019-06-21',3,0,NULL,'11'),(94,138,1,'2019-06-21',3,0,NULL,'11'),(95,138,1,'2019-06-21',3,0,NULL,'11'),(96,138,1,'2019-06-21',3,0,NULL,'11'),(97,138,1,'2019-06-21',3,0,NULL,'11'),(98,138,1,'2019-06-21',3,0,NULL,'55'),(99,139,1,'2019-06-21',3,0,NULL,'驳回'),(100,139,NULL,'2019-06-24',2,4,NULL,'aaaa'),(101,139,NULL,'2019-06-25',2,5,NULL,'bbbb'),(102,143,NULL,'2019-06-24',2,5,NULL,'消耗工时5'),(103,142,NULL,'2019-06-24',2,5,NULL,'消耗工时5.完成xxx任务'),(104,143,1,'2019-06-24',3,0,NULL,'xxx未完成'),(105,143,NULL,'2019-06-24',2,4,NULL,'消耗工时44'),(106,143,NULL,'2019-06-24',2,5,NULL,'消耗工时55'),(107,145,NULL,'2019-06-24',2,5,NULL,'2019年6月24日14:05:47 软件安装完成');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `pt_type` */

insert  into `pt_type`(`t_id`,`t_name`) values (3,'采购问题'),(4,'数据问题');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `pt_user` */

insert  into `pt_user`(`u_id`,`d_id`,`u_name`,`u_nickName`,`password`,`u_gender`,`u_email`) values (1,1,'admin','admin','admin',1,'xuchangqi@g-linkwell.com'),(4,2,'xcq','徐昌琦','Abcd1234',1,'xuchangqi@g-linkwell.com'),(5,2,'tianlei','田雷','Abcd1234',1,'tianlei@g-linkwell.com'),(6,2,'zmy','张明玉','Abcd1234',1,'zhangmingyu@g-linkwell.com'),(7,2,'hsw','黄晟维','Abcd1234',1,'huangshengwei@g-linkwell.com'),(8,2,'zhangpeng','张朋','Abcd1234',1,'zhangpeng@g-linkwell.com'),(9,2,'zmw','钟明玮','Abcd1234',1,'zhongmw@g-linkwell.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`u_id`,`r_id`) values (1,1,1),(3,4,3),(4,5,2),(5,6,3),(6,7,3),(7,8,3),(8,9,3);

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
