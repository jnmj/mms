/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.18 : Database - mms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mms`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`name`) values ('1133afbfbc924d37a45e0e184e56903d','司法部'),('76b9fb55c9c546f398dcc0f5dcf84b97','商务部'),('8177cd2fe0dc4f9d8870e00919d01884','铁道部'),('9727cc0a6c05442bb0e93a7fb25e90b1','国防部'),('a39fa73e47994a23bf3f53583e0c54f7','外交部'),('c373564f20d2497f91de95209c8788d7','民政部');

/*Table structure for table `meeting` */

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `id` varchar(36) NOT NULL,
  `introduction` tinytext NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` int(4) NOT NULL,
  `note` tinytext,
  `promoter_id` varchar(36) NOT NULL,
  `room_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_ibfk_1` (`promoter_id`),
  KEY `meeting_ibfk_2` (`room_id`),
  CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`promoter_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `meeting` */

insert  into `meeting`(`id`,`introduction`,`start_time`,`end_time`,`status`,`note`,`promoter_id`,`room_id`) values ('15617f85db3943b9b5ce9648afe5d6a0','遵义会议','2017-11-14 08:00:00','2017-11-14 09:00:00',1,NULL,'2016110125','16fd5a5a89c54d09b4c2a89f33ea283b'),('27297b84820649ca914b073e43045340','一月又一月晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕晕','2017-11-17 10:00:00','2017-11-17 19:00:00',0,NULL,'2016110125','ff49deea571845d6a9486034b939dfb5'),('4445da6ce0dc4a5e977e1285ff98cb47','发客户付爱华覅划分好符合哈佛','2017-11-17 16:00:00','2017-11-17 17:00:00',0,NULL,'2016110025','ff49deea571845d6a9486034b939dfb5'),('652d48b4cec444ddb0f8e5572178a332','方法方法付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付','2017-11-17 18:20:00','2017-11-17 19:00:00',1,NULL,'2016110125','ff49deea571845d6a9486034b939dfb5'),('951ed93b69c943a8a2bb0b67a4edf1b0','七届二中全会啊啊啊啊啊啊啊啊啊啊啊啊啊aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2017-11-15 10:00:00','2017-11-15 11:00:00',0,NULL,'2016110125','a0d010b0fe8245d795aee41aa6c600d6'),('a0cef17bffd344cfb1c151b41616ffec','普通用户申请的会议','2017-11-18 14:00:00','2017-11-18 15:00:00',1,NULL,'2016110001','439be95c431d449c8ffce3405378b827'),('a9ed6d6dd4b3499e9ec30aa1d0cb76b1','痛我头发付所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所','2017-11-17 14:00:00','2017-11-17 18:00:00',1,NULL,'2016110125','ff49deea571845d6a9486034b939dfb5'),('c33e14bc7e264cefb1d50a61e12c9cb4','测试冲突','2017-11-17 14:00:00','2017-11-17 15:00:00',2,NULL,'2016110125','16fd5a5a89c54d09b4c2a89f33ea283b'),('cb4b977328dc49fc928ac16d0aa8ca61','八七会议','2017-11-17 14:00:00','2017-11-17 14:30:00',0,NULL,'2016110125','16fd5a5a89c54d09b4c2a89f33ea283b'),('d3efb9ca28594e43a685ca71e7a4b332','古田会议','2017-11-17 15:00:00','2017-11-17 16:00:00',1,NULL,'2016110125','16fd5a5a89c54d09b4c2a89f33ea283b'),('d83b20f0e5ce48efa1c93e7e553bbf83','测试冲突会议','2017-11-17 10:00:00','2017-11-17 15:00:00',1,NULL,'2016110025','16fd5a5a89c54d09b4c2a89f33ea283b'),('f7756592f72044038d12c53c1d2aa616','十九大啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','2017-11-19 02:00:00','2017-11-19 03:00:00',1,NULL,'2016110125','16fd5a5a89c54d09b4c2a89f33ea283b');

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(36) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(40) NOT NULL,
  `role` int(4) NOT NULL,
  `department_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_ibfk_1` (`department_id`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `person` */

insert  into `person`(`id`,`name`,`password`,`phone`,`email`,`role`,`department_id`) values ('2016110001','张飞','e10adc3949ba59abbe56e057f20f883e','13261710001','a01@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110002','赵云','e10adc3949ba59abbe56e057f20f883e','13261710002','a02@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110003','吕布','e10adc3949ba59abbe56e057f20f883e','13261710003','a03@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110004','张辽','e10adc3949ba59abbe56e057f20f883e','13261710004','a04@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110005','关羽','e10adc3949ba59abbe56e057f20f883e','13261710005','a05@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110006','马超','e10adc3949ba59abbe56e057f20f883e','13261710006','a06@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110007','魏延','e10adc3949ba59abbe56e057f20f883e','13261710007','a07@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110008','典韦','e10adc3949ba59abbe56e057f20f883e','13261710008','a08@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110009','甘宁','e10adc3949ba59abbe56e057f20f883e','13261710009','a09@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110010','太史慈','e10adc3949ba59abbe56e057f20f883e','13261710010','a10@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110011','凌统','e10adc3949ba59abbe56e057f20f883e','13261710011','a11@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110012','许褚','e10adc3949ba59abbe56e057f20f883e','13261710012','a12@qq.com',1,'9727cc0a6c05442bb0e93a7fb25e90b1'),('2016110013','诸葛亮','e10adc3949ba59abbe56e057f20f883e','13261710013','a13@qq.com',1,'1133afbfbc924d37a45e0e184e56903d'),('2016110014','周瑜','e10adc3949ba59abbe56e057f20f883e','13261710014','a14@qq.com',1,'1133afbfbc924d37a45e0e184e56903d'),('2016110015','郭嘉','e10adc3949ba59abbe56e057f20f883e','13261710015','a15@qq.com',1,'1133afbfbc924d37a45e0e184e56903d'),('2016110016','姜维','e10adc3949ba59abbe56e057f20f883e','13261710016','a16@qq.com',1,'1133afbfbc924d37a45e0e184e56903d'),('2016110017','曹操','e10adc3949ba59abbe56e057f20f883e','13261710017','a17@qq.com',1,'76b9fb55c9c546f398dcc0f5dcf84b97'),('2016110018','刘备','e10adc3949ba59abbe56e057f20f883e','13261710018','a18@qq.com',1,'76b9fb55c9c546f398dcc0f5dcf84b97'),('2016110019','郭嘉','e10adc3949ba59abbe56e057f20f883e','13261710019','a19@qq.com',1,'76b9fb55c9c546f398dcc0f5dcf84b97'),('2016110020','庞德','e10adc3949ba59abbe56e057f20f883e','13261710020','a20@qq.com',1,'8177cd2fe0dc4f9d8870e00919d01884'),('2016110021','颜良','e10adc3949ba59abbe56e057f20f883e','13261710021','a21@qq.com',1,'8177cd2fe0dc4f9d8870e00919d01884'),('2016110022','华雄','e10adc3949ba59abbe56e057f20f883e','13261710022','a22@qq.com',1,'8177cd2fe0dc4f9d8870e00919d01884'),('2016110023','夏侯渊','e10adc3949ba59abbe56e057f20f883e','13261710023','a23@qq.com',1,'8177cd2fe0dc4f9d8870e00919d01884'),('2016110024','夏侯惇','e10adc3949ba59abbe56e057f20f883e','13261710024','a24@qq.com',1,'8177cd2fe0dc4f9d8870e00919d01884'),('2016110025','大乔','e10adc3949ba59abbe56e057f20f883e','13261710025','a25@qq.com',1,'a39fa73e47994a23bf3f53583e0c54f7'),('2016110026','貂蝉','e10adc3949ba59abbe56e057f20f883e','13261710026','a26@qq.com',1,'a39fa73e47994a23bf3f53583e0c54f7'),('2016110027','甄宓','e10adc3949ba59abbe56e057f20f883e','13261710027','a27@qq.com',1,'a39fa73e47994a23bf3f53583e0c54f7'),('2016110028','孙尚香','e10adc3949ba59abbe56e057f20f883e','13261710028','a28@qq.com',1,'a39fa73e47994a23bf3f53583e0c54f7'),('2016110029','王元姬','e10adc3949ba59abbe56e057f20f883e','13261710029','a29@qq.com',1,'a39fa73e47994a23bf3f53583e0c54f7'),('2016110030','小乔','e10adc3949ba59abbe56e057f20f883e','13261710030','a30@qq.com',1,'a39fa73e47994a23bf3f53583e0c54f7'),('2016110031','星彩','e10adc3949ba59abbe56e057f20f883e','13261710031','a31@qq.com',1,'a39fa73e47994a23bf3f53583e0c54f7'),('2016110032','辛宪英','e10adc3949ba59abbe56e057f20f883e','13261710032','a32@qq.com',1,'a39fa73e47994a23bf3f53583e0c54f7'),('2016110033','张郃','e10adc3949ba59abbe56e057f20f883e','13261710033','a33@qq.com',1,'a39fa73e47994a23bf3f53583e0c54f7'),('2016110125','罗贯中','e10adc3949ba59abbe56e057f20f883e','13261712886','754737592@qq.com',0,'a39fa73e47994a23bf3f53583e0c54f7');

/*Table structure for table `person_meeting` */

DROP TABLE IF EXISTS `person_meeting`;

CREATE TABLE `person_meeting` (
  `id` varchar(36) NOT NULL,
  `person_id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_meeting_ibfk_1` (`person_id`),
  KEY `person_meeting_ibfk_2` (`meeting_id`),
  CONSTRAINT `person_meeting_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `person_meeting_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `person_meeting` */

insert  into `person_meeting`(`id`,`person_id`,`meeting_id`) values ('09b71fd816504936b8d95be7591f595f','2016110020','27297b84820649ca914b073e43045340'),('0b0e24fb09f14aa2957a53c1ce34733b','2016110125','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('0bdf639e03424247b91651efcb8f7313','2016110023','a0cef17bffd344cfb1c151b41616ffec'),('0cd54e83b8bf4bbb949601c9e25bce21','2016110021','d3efb9ca28594e43a685ca71e7a4b332'),('10f23b76004044c1b6468982119b647f','2016110007','cb4b977328dc49fc928ac16d0aa8ca61'),('1290a604c03b4a9a8a5fd8f649056a85','2016110032','951ed93b69c943a8a2bb0b67a4edf1b0'),('149814e366bd42a5a43d94932316be68','2016110026','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('15161b6d4fd840b898cba5a450e11e61','2016110033','f7756592f72044038d12c53c1d2aa616'),('23468acebf4747b48e5b812e933ebded','2016110015','652d48b4cec444ddb0f8e5572178a332'),('2425f89fd2a54c3a8ede84cee1527da0','2016110027','951ed93b69c943a8a2bb0b67a4edf1b0'),('24cd7db4a6c54d37928dbbbeac76b35c','2016110029','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('25430b8b6f2d4c4183ee5dde28743bfd','2016110017','4445da6ce0dc4a5e977e1285ff98cb47'),('28220e53427a48aca0ab416b89817204','2016110025','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('30a5d44d81eb45ec9738f6c49f9ac5c3','2016110032','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('313ffe98a9924929a1d3b73154c9407b','2016110020','a0cef17bffd344cfb1c151b41616ffec'),('330905a3705b4f54896f275e7937e1ee','2016110013','652d48b4cec444ddb0f8e5572178a332'),('3337396b855a4597a83ed29e7de15606','2016110024','d3efb9ca28594e43a685ca71e7a4b332'),('35d0256ad3f043e5862861395c760263','2016110005','cb4b977328dc49fc928ac16d0aa8ca61'),('360bb2cdc7f74ba7bf404a3d3685b01b','2016110013','d83b20f0e5ce48efa1c93e7e553bbf83'),('36feeb6897e3410aac734115caa8e7ed','2016110018','4445da6ce0dc4a5e977e1285ff98cb47'),('3a410776680d472da5cd43239f009e9a','2016110025','f7756592f72044038d12c53c1d2aa616'),('3c6a9b26dbc2439881e8fd8debc8c741','2016110018','c33e14bc7e264cefb1d50a61e12c9cb4'),('3f6ff4547cf64f88a53ab9b3263278b6','2016110019','4445da6ce0dc4a5e977e1285ff98cb47'),('4679780a02aa4727bcc4bbd8ec582fe5','2016110020','d3efb9ca28594e43a685ca71e7a4b332'),('4fb894031c294037a9f99d62b3eaa636','2016110010','cb4b977328dc49fc928ac16d0aa8ca61'),('51342f634cad4357ae576031572be509','2016110022','a0cef17bffd344cfb1c151b41616ffec'),('56dc43eaed28477287cf42627a596204','2016110023','27297b84820649ca914b073e43045340'),('577f0e2cbbb74c9e90f97e92fc969381','2016110009','cb4b977328dc49fc928ac16d0aa8ca61'),('5a4827b5ac6e49ef93732ae2dfaab615','2016110001','cb4b977328dc49fc928ac16d0aa8ca61'),('609aed86b77044c092cc0ec075f4ab3d','2016110006','cb4b977328dc49fc928ac16d0aa8ca61'),('67bc5010132d435b909b3d821d917528','2016110015','15617f85db3943b9b5ce9648afe5d6a0'),('68f244bb830548aa92e0dc261b7253a0','2016110029','951ed93b69c943a8a2bb0b67a4edf1b0'),('6cb8de879f2143ae883a53a62c5a9e2b','2016110028','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('6fedceb51e794f169f583536d2e7100f','2016110024','a0cef17bffd344cfb1c151b41616ffec'),('71e2d25ce8c04fe09f5e05a57c1ff68c','2016110011','cb4b977328dc49fc928ac16d0aa8ca61'),('7653fdda69e9431ab486b02ee009ac5e','2016110016','d83b20f0e5ce48efa1c93e7e553bbf83'),('76629b074c094fc78d3a6326b615a6b0','2016110027','f7756592f72044038d12c53c1d2aa616'),('793ba06379e740db8c6020e89855db4e','2016110028','f7756592f72044038d12c53c1d2aa616'),('7dbbe0c4d9674ffcafd1fd294a8f5b31','2016110021','a0cef17bffd344cfb1c151b41616ffec'),('84dc4a3791d44643a2ab9872e02fd391','2016110030','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('8b65f417aea8489abe5c1cf925369a8e','2016110026','951ed93b69c943a8a2bb0b67a4edf1b0'),('8c9f943b32254103ae9c3dbc6d5d254a','2016110004','cb4b977328dc49fc928ac16d0aa8ca61'),('8e4332b0740b49d4a93668454be63561','2016110015','d83b20f0e5ce48efa1c93e7e553bbf83'),('8ec44914061e427b94bdfa1287d695e7','2016110026','f7756592f72044038d12c53c1d2aa616'),('91a9be36cc4840238d4748348113228f','2016110014','15617f85db3943b9b5ce9648afe5d6a0'),('920c3d6f15b54bf1a3cb28f0aa1a7af1','2016110012','cb4b977328dc49fc928ac16d0aa8ca61'),('9a35856e16dc4acd8cad14f5dc77136c','2016110016','652d48b4cec444ddb0f8e5572178a332'),('9b2c9f2cb9a1484ab45d190053fe8e48','2016110027','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('a03b1bb5f95e45bc84889ed3eb366f46','2016110031','f7756592f72044038d12c53c1d2aa616'),('a0cd008f0b7549019029db0a7d59c05a','2016110028','951ed93b69c943a8a2bb0b67a4edf1b0'),('a0ee631245444716896ecbb2f0bc7b6d','2016110024','27297b84820649ca914b073e43045340'),('a1e9238b0f8a49b2a7990701ba193050','2016110031','951ed93b69c943a8a2bb0b67a4edf1b0'),('a6251bf4aae9471d9ee5c2a67cd39e1c','2016110002','cb4b977328dc49fc928ac16d0aa8ca61'),('a91d255847214880beb03a5100c6360c','2016110023','d3efb9ca28594e43a685ca71e7a4b332'),('ae57d6ea9fa5417e88894d3259e4cfd2','2016110029','f7756592f72044038d12c53c1d2aa616'),('b1a971d696e8462e92519b45ef779f19','2016110025','951ed93b69c943a8a2bb0b67a4edf1b0'),('b3cfcd70282c4b9c8b1cf4f203691e19','2016110033','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('b3f3fbd611df46a9a0334634aec9889a','2016110003','cb4b977328dc49fc928ac16d0aa8ca61'),('b9d28edb3c0645f58c670f0fdeeb873d','2016110125','f7756592f72044038d12c53c1d2aa616'),('bd72aceda3ac4f5bb503aeeaf8d208a6','2016110021','27297b84820649ca914b073e43045340'),('c1cecf6dceb74ee2b29c1f548cf5f689','2016110030','f7756592f72044038d12c53c1d2aa616'),('cb681415542d4c5780cf208a488eeaf9','2016110033','951ed93b69c943a8a2bb0b67a4edf1b0'),('d8e065e17a3c4169a5d823e738f76a49','2016110013','15617f85db3943b9b5ce9648afe5d6a0'),('d9f5bfc255e84d868b426901bbf05c6f','2016110019','c33e14bc7e264cefb1d50a61e12c9cb4'),('e150b2fdea6c4d68b2461c669844b1c0','2016110031','a9ed6d6dd4b3499e9ec30aa1d0cb76b1'),('e712f8a31ad5430981d703fdad86821d','2016110125','951ed93b69c943a8a2bb0b67a4edf1b0'),('f2ed90628af54db78ae3105cdd59b565','2016110022','d3efb9ca28594e43a685ca71e7a4b332'),('f43ba4997bae49779afda1b407cf750a','2016110022','27297b84820649ca914b073e43045340'),('f6236e2d53374a8586c480a0d2896cf3','2016110017','c33e14bc7e264cefb1d50a61e12c9cb4'),('f7c3c8f7cb444a42adcbf48bf5c06bbf','2016110008','cb4b977328dc49fc928ac16d0aa8ca61'),('f7f0c5ff3cb74aac9c79133de1825bf1','2016110014','d83b20f0e5ce48efa1c93e7e553bbf83'),('f887d25d87624a5599fdadfd5c3d4b98','2016110032','f7756592f72044038d12c53c1d2aa616'),('fcc728c81a4b486fb5622c421a9dc9ae','2016110014','652d48b4cec444ddb0f8e5572178a332'),('fcf6254621b146bdbca248d89fcf8c00','2016110016','15617f85db3943b9b5ce9648afe5d6a0'),('fe99a47d78b14e5ca2131b4a4eaf2aa7','2016110030','951ed93b69c943a8a2bb0b67a4edf1b0');

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` varchar(36) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`id`,`NAME`) values ('16fd5a5a89c54d09b4c2a89f33ea283b','811'),('298038476c3a4974b8670609b7c95633','815'),('439be95c431d449c8ffce3405378b827','814'),('6e074f44e53542bcbc3836af180e7233','812'),('987acf244f0a42869f1a2c474f0568e5','816'),('a0d010b0fe8245d795aee41aa6c600d6','819'),('d9e0edb5597640c696e574789ef27cfb','817'),('ff49deea571845d6a9486034b939dfb5','818');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
