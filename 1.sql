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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `pt_user` */

insert  into `pt_user`(`u_id`,`d_id`,`u_name`,`u_nickName`,`password`,`u_gender`,`u_email`) values (1,2,'admin','admin','325a2cc052914ceeb8c19016c091d2ac',1,'xuchangqi0810@dingtalk.com'),(4,2,'xcq','徐昌琦','0242764e5bbcac5c170cbf1eb27d1770',1,'xuchangqi0810@dingtalk.com'),(5,2,'tianlei','田雷','325a2cc052914ceeb8c19016c091d2ac',1,'tianlei1121@dingtalk.com'),(6,2,'zhangmy','张明玉','325a2cc052914ceeb8c19016c091d2ac',1,'zhangmingyu0074@dingtalk.com'),(7,2,'huangsw','黄晟维','325a2cc052914ceeb8c19016c091d2ac',1,'huangshengwei0008@dingtalk.com'),(8,2,'zhangpeng','张朋','325a2cc052914ceeb8c19016c091d2ac',1,'lsr8167@dingtalk.com'),(9,2,'zhongmw','钟明玮','325a2cc052914ceeb8c19016c091d2ac',1,'pir4648@dingtalk.com'),(10,3,'zhangbl','张宝利','325a2cc052914ceeb8c19016c091d2ac',1,'zhangbaoli6013@dingtalk.com'),(11,3,'wuguanjun','吴冠军','325a2cc052914ceeb8c19016c091d2ac',1,'wuguanjun5225@dingtalk.com'),(13,3,'chenqz','陈庆忠','325a2cc052914ceeb8c19016c091d2ac',1,'chenqingzhong1506@dingtalk.com'),(14,3,'chenjz','陈建中','325a2cc052914ceeb8c19016c091d2ac',1,'chenjianzhong7084@dingtalk.com'),(17,3,'liuzi','柳子宁','325a2cc052914ceeb8c19016c091d2ac',1,'liuzining9205@dingtalk.com'),(20,3,'wangjj','王建军','325a2cc052914ceeb8c19016c091d2ac',1,NULL),(21,3,'zhanbin','詹斌','325a2cc052914ceeb8c19016c091d2ac',1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
