﻿/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.5.28 : Database - wyd
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wyd` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wyd`;

TRUNCATE TABLE `mcp_admin`;
TRUNCATE TABLE `mcp_app_token`;
TRUNCATE TABLE `mcp_application`;
TRUNCATE TABLE `mcp_developer`;
TRUNCATE TABLE `mcp_order`;
TRUNCATE TABLE `mcp_order_printer`;
TRUNCATE TABLE `mcp_printer`;
TRUNCATE TABLE `mcp_printer_status`;
TRUNCATE TABLE `mcp_sys_blacklist`;
TRUNCATE TABLE `mcp_merchant_printer`;
TRUNCATE TABLE `mcp_sys_email`;
TRUNCATE TABLE `mcp_sys_sms`;
TRUNCATE TABLE `mcp_sys_verifycode`;
TRUNCATE TABLE `mcp_equipment`;
TRUNCATE TABLE `mcp_express`;
TRUNCATE TABLE `mcp_express_params`;
TRUNCATE TABLE `mcp_express_template`;
TRUNCATE TABLE `mcp_express_template_param`;

UPDATE `mcp_equipment` SET is_bind=0;

/*Data for the table `mcp_equipment` */

INSERT  INTO `mcp_equipment`(`equipment_type`,`equipment_code`,`check_code`,`is_bind`,`created_by`,`created_on`,`modified_by`,`modified_on`,`memo`) 
VALUES (1,'8C18D9FF1C91','00000006',0,'','0000-00-00 00:00:00',NULL,NULL,NULL),
(1,'8C18D9FF2999','10000004',0,'','0000-00-00 00:00:00',NULL,NULL,NULL),
(1,'7CC709A8E18D','Z1000001',0,'','0000-00-00 00:00:00',NULL,NULL,NULL),
(1,'8C18D9FF2317','010000002',0,'','0000-00-00 00:00:00',NULL,NULL,NULL);

/*Data for the table `mcp_express` */

INSERT  INTO `mcp_express`(`express_id`,`express_name`,`default_template_id`,`sort_index`,`status_code`,`created_by`,`created_on`,`modified_by`,`modified_on`,`memo`) 
VALUES ('E001','顺丰快递','T00101','0.00',1,'','0000-00-00 00:00:00',NULL,NULL,NULL),('E002','圆通速递','T00201','0.00',1,'','0000-00-00 00:00:00',NULL,NULL,NULL),('E003','韵达速递','T00301','0.00',0,'','0000-00-00 00:00:00',NULL,NULL,NULL);

/*Data for the table `mcp_express_params` */

INSERT  INTO `mcp_express_params`(`param_code`,`param_name`,`param_type`,`param_source`) VALUES ('P0101','寄件-单位名称',1,'T00101'),('P0102','寄件-姓名',1,'T00101'),('P0103','寄件-地址',1,'T00101'),('P0104','寄件-联系电话',1,'T00101'),('P0105','寄件-邮政编码',1,'T00201'),('P0106','寄件-省',1,'T00201'),('P0107','寄件-市',1,'T00201'),('P0108','寄件-区/县',1,'T00201'),('P0109','寄件-乡/镇',1,'T00201'),('P0110','寄件-路/街',1,'T00201'),('P0201','收件-单位名称',1,'T00101'),('P0202','收件-姓名',1,'T00101'),('P0203','收件-省',1,'T00101'),('P0204','收件-市',1,'T00101'),('P0205','收件-区/县',1,'T00101'),('P0206','收件-乡/镇',1,'T00201'),('P0207','收件-路/街',1,'T00101'),('P0208','收件-联系电话',1,'T00101'),('P0209','收件-邮政编码',1,'T00201'),('P0301','物品-描述',1,'T00101'),('P0302','物品-数量',2,'T00101'),('P0303','物品-申明价值',2,'T00101'),('P0304','物品-尺寸',1,'T00101'),('P0305','物品-重量',2,'T00101'),('P0306','物品-是否文件',3,'T00201'),('P0307','物品-是否物品',3,'T00201'),('P0308','物品-非禁寄品',3,'T00201'),('P0401','产品-即日',3,'T00101'),('P0402','产品-次晨',3,'T00101'),('P0403','产品-次日',3,'T00101'),('P0404','产品-隔日',3,'T00101'),('P0405','产品-重货快运',3,'T00101'),('P0406','产品-物流普运',3,'T00101'),('P0407','产品-其他',3,'T00101'),('P0408','产品-即日-描述',1,'T00101'),('P0409','产品-其他-描述',1,'T00101'),('P0410','产品-经济快件',3,'T00201'),('P0501','增值-代收货款',3,'T00101'),('P0502','增值-散单代收到服务费',3,'T00101'),('P0503','增值-大闸蟹专递',3,'T00101'),('P0504','增值-保价',3,'T00101'),('P0505','增值-特安',3,'T00101'),('P0506','增值-签单返还',3,'T00101'),('P0507','增值-保单配送',3,'T00101'),('P0508','增值-个性化包装',3,'T00101'),('P0509','增值-标准化包装',3,'T00101'),('P0510','增值-保鲜服务',3,'T00101'),('P0511','增值-超长超重',3,'T00101'),('P0512','增值-票据专送',3,'T00101'),('P0513','增值-其他',3,'T00101'),('P0514','增值-代收货款-卡号',1,'T00101'),('P0515','增值-代收货款-金额',2,'T00101'),('P0516','增值-保价-投保金额',2,'T00101'),('P0517','增值-保价-保价费用',2,'T00101'),('P0518','增值-保价-否',3,'T00201'),('P0519','增值-签收短信通知',3,'T00201'),('P0520','增值-夜间派送',3,'T00201'),('P0521','增值-保价金额-大写',1,'T00201'),('P0601','费用-件数',2,'T00101'),('P0602','费用-实际重量',2,'T00101'),('P0603','费用-计费重量',2,'T00101'),('P0604','费用-运费',2,'T00101'),('P0605','费用-费用合计',2,'T00101'),('P0701','付款-寄方付',3,'T00101'),('P0702','付款-收方付',3,'T00101'),('P0703','付款-第三方付',3,'T00101'),('P0704','付款-第三方付款地区',1,'T00101'),('P0705','付款-月结账号',1,'T00101'),('P0706','付款-现金',3,'T00201'),('P0707','付款-协议结算',3,'T00201'),('P1001','其他-目的地',1,'T00101'),('P1002','其他-始发地',1,'T00201'),('P1003','其他-备注',1,'T00101');

/*Data for the table `mcp_express_template` */

INSERT  INTO `mcp_express_template`(`express_id`,`template_id`,`template_name`,`template_ver`,`template_example_path`,`status_code`,`create_by`,`created_on`,`modified_by`,`modified_on`,`memo`) VALUES ('E001','T00101','【顺丰快递】JH-10006755-A-R','JH-10006755-A-R','/template/aa025e4549b111e6bd5302004c4f4f50.jpg',1,'','2016-07-13 10:15:29',NULL,NULL,NULL),('E001','T00102','【顺丰快递】JH-10004085-H-R','JH-10004085-H-R','/template/5795ce9f524411e6bd5302004c4f4f50.jpg',1,'','0000-00-00 00:00:00',NULL,NULL,NULL),('E002','T00201','【圆通速递】T000896-F-R','T000896-F-R','/template/b350451d49b111e6bd5302004c4f4f50.jpg',1,'','2016-07-13 10:15:44',NULL,NULL,NULL),('E003','T00301','【韵达速递】T000837-2','T000837-2','/template/bc905a9049b111e6bd5302004c4f4f50.jpg',0,'','2016-07-13 10:15:46',NULL,NULL,NULL);

/*Data for the table `mcp_express_template_param` */

INSERT  INTO `mcp_express_template_param`(`template_id`,`param_index`,`param_code`,`param_desc`,`param_max_len`,`param_type`,`loc_x`,`loc_y`,`is_need`) VALUES ('T00101',1,'P0101','寄件-单位名称',0,1,'42.00','31.50',0),('T00101',2,'P0102','寄件-姓名',0,1,'96.50','31.50',1),('T00101',3,'P0103','寄件-地址',0,1,'35.50','38.90',0),('T00101',4,'P0104','寄件-联系电话',0,1,'35.50','45.20',1),('T00101',5,'P0201','收件-单位名称',0,1,'41.30','55.00',0),('T00101',6,'P0202','收件-姓名',0,1,'95.20','55.00',1),('T00101',7,'P0203','收件-省',0,1,'32.30','59.80',0),('T00101',8,'P0204','收件-市',0,1,'65.10','59.80',0),('T00101',9,'P0205','收件-区/县',0,1,'85.50','59.80',0),('T00101',10,'P0207','收件-路/街道',0,1,'29.90','66.90',0),('T00101',11,'P0208','收件-联系电话',0,1,'49.50','74.10',1),('T00101',12,'P0301','物品-描述',0,1,'28.60','90.20',0),('T00101',13,'P0302','物品-数量',0,2,'64.60','93.00',0),('T00101',14,'P0303','物品-声明价值',0,2,'94.50','93.00',0),('T00101',15,'P0304','物品-尺寸',0,1,'36.50','100.00',0),('T00101',16,'P0305','物品-重量',0,2,'90.00','100.00',0),('T00101',17,'P0401','产品-即日',0,3,'120.00','34.00',0),('T00101',18,'P0402','产品-次晨',0,3,'138.80','34.00',0),('T00101',19,'P0403','产品-次日',0,3,'157.60','34.00',0),('T00101',20,'P0404','产品-隔日',0,3,'174.60','34.00',0),('T00101',21,'P0405','产品-重货快运',0,3,'190.00','34.00',0),('T00101',22,'P0406','产品-物流普运',0,3,'120.00','38.70',0),('T00101',23,'P0407','产品-其他',0,3,'138.80','38.70',0),('T00101',24,'P0408','产品-即日-描述',0,1,'124.00','34.00',0),('T00101',25,'P0409','产品-其他-描述',0,1,'149.00','38.70',0),('T00101',26,'P0501','增值-代收货款',0,3,'120.00','47.50',0),('T00101',27,'P0502','增值-散单代收到服务费',0,3,'120.00','53.50',0),('T00101',28,'P0504','增值-保价',0,3,'120.00','56.50',0),('T00101',29,'P0505','增值-特安',0,3,'138.80','56.50',0),('T00101',30,'P0506','增值-签单返还',0,3,'120.00','62.50',0),('T00101',31,'P0507','增值-保单配送',0,3,'120.00','67.00',0),('T00101',32,'P0508','增值-个性化包装',0,3,'120.00','71.50',0),('T00101',33,'P0509','增值-标准化包装',0,3,'120.00','76.00',0),('T00101',40,'P0510','增值-保鲜服务',0,3,'179.00','71.00',0),('T00101',38,'P0511','增值-超长超重',0,3,'179.00','63.20',0),('T00101',39,'P0512','增值-票据专送',0,3,'179.00','67.90',0),('T00101',42,'P0513','增值-其他',0,3,'173.00','76.00',0),('T00101',34,'P0514','增值-代收货款-卡号',0,1,'143.80','47.50',0),('T00101',35,'P0515','增值-代收货款-金额',0,2,'192.50','47.50',0),('T00101',36,'P0516','增值-投保金额',0,2,'159.80','56.50',0),('T00101',37,'P0517','增值-保价费用',0,2,'198.40','56.50',0),('T00101',44,'P0601','费用-件数',0,2,'121.70','98.00',0),('T00101',45,'P0602','费用-实际重量',0,2,'140.80','98.00',0),('T00101',46,'P0603','费用-计费重量',0,2,'158.50','98.00',0),('T00101',47,'P0604','费用-运费',0,2,'175.70','98.00',0),('T00101',48,'P0605','费用-费用合计',0,2,'192.50','98.00',0),('T00101',49,'P0701','付款-寄方付',0,3,'120.00','108.00',0),('T00101',50,'P0702','付款-收方付',0,3,'138.10','108.00',0),('T00101',51,'P0703','付款-第三方付',0,3,'154.50','108.00',0),('T00101',52,'P0704','付款-第三方付款地区',0,1,'194.00','108.00',0),('T00101',53,'P0705','付款-月结账号',0,1,'133.30','114.00',0),('T00101',54,'P1001','其他-目的地',0,1,'173.30','17.20',0),('T00101',43,'P1003','其他-备注',0,1,'133.30','83.00',0),('T00102',1,'P0101','寄件-单位名称',0,1,'42.00','31.50',0),('T00102',2,'P0102','寄件-姓名',0,1,'96.50','31.50',1),('T00102',3,'P0103','寄件-地址',0,1,'35.50','38.90',0),('T00102',4,'P0104','寄件-联系电话',0,1,'35.50','45.20',1),('T00102',5,'P0201','收件-单位名称',0,1,'41.30','55.00',0),('T00102',6,'P0202','收件-姓名',0,1,'95.20','55.00',1),('T00102',7,'P0203','收件-省',0,1,'32.30','59.80',0),('T00102',8,'P0204','收件-市',0,1,'65.10','59.80',0),('T00102',9,'P0205','收件-区/县',0,1,'85.50','59.80',0),('T00102',10,'P0207','收件-路/街道',0,1,'29.90','66.90',0),('T00102',11,'P0208','收件-联系电话',0,1,'49.50','74.10',1),('T00102',12,'P0301','物品-描述',0,1,'28.60','90.20',0),('T00102',13,'P0302','物品-数量',0,2,'64.60','93.00',0),('T00102',14,'P0303','物品-声明价值',0,2,'94.50','93.00',0),('T00102',15,'P0304','物品-尺寸',0,1,'36.50','100.00',0),('T00102',16,'P0305','物品-重量',0,2,'90.00','100.00',0),('T00102',17,'P0401','产品-即日',0,3,'120.00','34.00',0),('T00102',18,'P0402','产品-次晨',0,3,'138.80','34.00',0),('T00102',19,'P0403','产品-次日',0,3,'157.60','34.00',0),('T00102',20,'P0404','产品-隔日',0,3,'174.60','34.00',0),('T00102',21,'P0405','产品-重货快运',0,3,'191.60','34.00',0),('T00102',22,'P0406','产品-物流普运',0,3,'120.00','38.70',0),('T00102',23,'P0407','产品-其他',0,3,'138.80','38.70',0),('T00102',24,'P0408','产品-即日-描述',0,1,'124.00','34.00',0),('T00102',25,'P0409','产品-其他-描述',0,1,'149.00','38.70',0),('T00102',26,'P0501','增值-代收货款',0,3,'120.00','47.80',0),('T00102',27,'P0502','增值-散单代收到服务费',0,3,'120.00','53.50',0),('T00102',36,'P0503','增值-大闸蟹专递',0,3,'184.00','53.50',0),('T00102',28,'P0504','增值-保价',0,3,'120.00','58.00',0),('T00102',29,'P0505','增值-特安',0,3,'138.80','58.00',0),('T00102',30,'P0506','增值-签单返还',0,3,'120.00','62.50',0),('T00102',31,'P0507','增值-保单配送',0,3,'120.00','67.00',0),('T00102',32,'P0508','增值-个性化包装',0,3,'120.00','71.50',0),('T00102',33,'P0509','增值-标准化包装',0,3,'120.00','76.00',0),('T00102',39,'P0510','增值-保鲜服务',0,3,'184.00','63.20',0),('T00102',40,'P0511','增值-超长超重',0,3,'184.00','67.90',0),('T00102',41,'P0512','增值-票据专送',0,3,'184.00','71.00',0),('T00102',42,'P0513','增值-其他',0,3,'175.00','76.80',0),('T00102',34,'P0514','增值-代收货款-卡号',0,1,'143.80','48.00',0),('T00102',35,'P0515','增值-代收货款-金额',0,2,'192.50','48.00',0),('T00102',37,'P0516','增值-投保金额',0,2,'159.80','56.50',0),('T00102',38,'P0517','增值-保价费用',0,2,'198.40','56.50',0),('T00102',43,'P0601','费用-件数',0,2,'121.70','90.00',0),('T00102',44,'P0602','费用-实际重量',0,2,'140.80','90.00',0),('T00102',45,'P0603','费用-计费重量',0,2,'158.50','90.00',0),('T00102',46,'P0604','费用-运费',0,2,'175.70','90.00',0),('T00102',47,'P0605','费用-费用合计',0,2,'192.50','90.00',0),('T00102',48,'P0701','付款-寄方付',0,3,'120.00','99.00',0),('T00102',49,'P0702','付款-收方付',0,3,'138.10','99.00',0),('T00102',50,'P0703','付款-第三方付',0,3,'154.50','99.00',0),('T00102',51,'P0704','付款-第三方付款地区',0,1,'194.00','99.00',0),('T00102',52,'P0705','付款-月结账号',0,1,'133.30','104.00',0),('T00102',54,'P1001','其他-目的地',0,1,'173.30','17.20',0),('T00102',53,'P1003','其他-备注',0,1,'133.30','113.00',0),('T00201',3,'P0101','寄件-单位名称',0,1,'32.00','32.50',0),('T00201',1,'P0102','寄件-姓名',0,1,'32.00','26.80',1),('T00201',9,'P0104','寄件-联系电话',0,1,'42.50','56.50',1),('T00201',10,'P0105','寄件-邮政编码',0,1,'93.00','56.50',0),('T00201',4,'P0106','寄件-省',0,1,'32.00','39.50',0),('T00201',5,'P0107','寄件-市',0,1,'51.00','39.50',1),('T00201',6,'P0108','寄件-区/县',0,1,'68.00','39.50',0),('T00201',7,'P0109','寄件-乡/镇',0,1,'86.50','39.50',0),('T00201',8,'P0110','寄件-路/街',0,1,'32.00','47.50',0),('T00201',19,'P0201','收件-单位名称',0,1,'128.00','32.50',0),('T00201',18,'P0202','收件-姓名',0,1,'128.00','26.80',1),('T00201',20,'P0203','收件-省',0,1,'128.00','39.50',0),('T00201',21,'P0204','收件-市',0,1,'150.00','39.50',1),('T00201',22,'P0205','收件-区/县',0,1,'167.50','39.50',0),('T00201',23,'P0206','收件-乡/镇',0,1,'186.50','39.50',0),('T00201',24,'P0207','收件-路/街',0,1,'128.00','47.50',0),('T00201',25,'P0208','收件-联系电话',0,1,'137.00','56.50',1),('T00201',26,'P0209','收件-邮政编码',0,1,'193.50','56.50',0),('T00201',13,'P0301','物品-描述',0,1,'32.00','73.00',0),('T00201',14,'P0302','物品-数量',0,2,'71.00','71.50',0),('T00201',16,'P0304','物品-体积',0,1,'71.00','76.00',0),('T00201',15,'P0305','物品-重量',0,2,'95.50','71.50',0),('T00201',11,'P0306','物品-是否文件',0,3,'24.50','65.00',0),('T00201',12,'P0307','物品-是否物品',0,3,'40.50','65.00',0),('T00201',17,'P0308','物品-非禁寄品',0,3,'89.00','81.50',0),('T00201',27,'P0401','当日达',0,3,'118.50','64.00',0),('T00201',28,'P0402','次晨达',0,3,'138.00','64.00',0),('T00201',29,'P0403','次日达',0,3,'159.50','64.00',0),('T00201',30,'P0404','隔日达',0,3,'178.00','64.00',0),('T00201',31,'P0410','经济快件',0,3,'200.50','64.00',0),('T00201',32,'P0504','保价是',0,3,'122.00','70.00',0),('T00201',35,'P0516','保价金额小写',0,3,'199.00','70.00',0),('T00201',36,'P0517','保价费',0,3,'160.50','75.00',0),('T00201',33,'P0518','保价否',0,3,'132.00','70.00',0),('T00201',37,'P0519','签收短信通知',0,3,'127.50','80.00',0),('T00201',38,'P0520','夜间派送',0,3,'168.50','80.00',0),('T00201',34,'P0521','保价金额大写',0,1,'149.50','70.00',0),('T00201',39,'P0604','资费',0,2,'118.00','86.00',0),('T00201',40,'P0605','费用总计',0,2,'169.50','86.00',0),('T00201',41,'P0706','付款-现金',0,3,'155.50','90.50',0),('T00201',42,'P0707','付款方式-协议结算',0,3,'194.50','90.50',0),('T00201',44,'P1001','目的地名称',0,1,'177.50','14.00',0),('T00201',2,'P1002','其他-始发地',0,1,'72.00','26.80',0),('T00201',43,'P1003','备注',0,1,'118.00','113.50',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;