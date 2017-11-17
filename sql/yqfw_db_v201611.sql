CREATE DATABASE  IF NOT EXISTS `yqfw_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yqfw_db`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: yqfw_db
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `plat_sys_app`
--

DROP TABLE IF EXISTS `plat_sys_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat_sys_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `app_key` varchar(100) DEFAULT NULL,
  `app_secret` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_app_app_key` (`app_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat_sys_app`
--

LOCK TABLES `plat_sys_app` WRITE;
/*!40000 ALTER TABLE `plat_sys_app` DISABLE KEYS */;
INSERT INTO `plat_sys_app` VALUES (1,'中心服务器','645ba616-370a-43a8-a8e0-993e7a590cf0','bb74abb6-bae0-47dd-a7b1-9571ea3a0f33',1),(2,'APP-1','645ba612-370a-43a8-a8e0-993e7a590cf0','bb74abb2-bae0-47dd-a7b1-9571ea3a0f33',1),(3,'APP-2','645ba613-370a-43a8-a8e0-993e7a590cf0','bb74abb3-bae0-47dd-a7b1-9571ea3a0f33',1);
/*!40000 ALTER TABLE `plat_sys_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat_sys_auth`
--

DROP TABLE IF EXISTS `plat_sys_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat_sys_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `role_ids` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_app_roles_user_id_app_id` (`user_id`,`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat_sys_auth`
--

LOCK TABLES `plat_sys_auth` WRITE;
/*!40000 ALTER TABLE `plat_sys_auth` DISABLE KEYS */;
INSERT INTO `plat_sys_auth` VALUES (1,1,1,'1,'),(2,1,2,'1,2'),(3,1,3,'1,3'),(4,5,1,'2,3,4,');
/*!40000 ALTER TABLE `plat_sys_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat_sys_config`
--

DROP TABLE IF EXISTS `plat_sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat_sys_config` (
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `configValue` varchar(500) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat_sys_config`
--

LOCK TABLES `plat_sys_config` WRITE;
/*!40000 ALTER TABLE `plat_sys_config` DISABLE KEYS */;
INSERT INTO `plat_sys_config` VALUES ('TEMPLETE_PATH',NULL,'F:\\\\plat\\\\templet\\\\',NULL),('TEST','测试项','测试内容',1);
/*!40000 ALTER TABLE `plat_sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat_sys_org`
--

DROP TABLE IF EXISTS `plat_sys_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat_sys_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_organization_parent_id` (`parent_id`),
  KEY `idx_sys_organization_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat_sys_org`
--

LOCK TABLES `plat_sys_org` WRITE;
/*!40000 ALTER TABLE `plat_sys_org` DISABLE KEYS */;
INSERT INTO `plat_sys_org` VALUES (1,'张掖经济技术开发区',0,'0/',1),(2,'管理委员会',1,'0/1/',1),(3,'机构2',1,'0/1/',1),(4,'机构3',2,'0/1/2/',1),(5,'测试组织机构2',3,NULL,0),(6,'测试组织机构2',3,NULL,0),(7,'测试组织机构2',3,NULL,0),(8,'测试组织机构2',3,NULL,0),(9,'测试组织机构2',3,NULL,0);
/*!40000 ALTER TABLE `plat_sys_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat_sys_resource`
--

DROP TABLE IF EXISTS `plat_sys_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat_sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `icon` varchar(45) DEFAULT NULL,
  `indexnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_resource_parent_id` (`parent_id`),
  KEY `idx_sys_resource_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=7305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat_sys_resource`
--

LOCK TABLES `plat_sys_resource` WRITE;
/*!40000 ALTER TABLE `plat_sys_resource` DISABLE KEYS */;
INSERT INTO `plat_sys_resource` VALUES (5,'企业管理','menu','',1,'0/1/','',1,'icon02',1),(6,'土地资源','menu',' ',1,'0/1/','',1,'icon03',2),(8,'管网管线','menu',NULL,1,'0/1/','',1,'icon05',3),(9,'监测数据','menu',NULL,1,'0/1/','',1,'icon04',4),(10,'系统管理','menu','',1,'0/1/','sys:*',1,'icon06',9),(32,'资源新增','button','',10,'0/1/31/','resource:create',1,NULL,NULL),(33,'资源修改','button','',10,'0/1/31/','resource:update',1,NULL,NULL),(34,'资源删除','button','',10,'0/1/31/','resource:delete',1,NULL,NULL),(35,'资源列表','menu','/resource',10,'0/1/31/','resource:view',1,NULL,NULL),(42,'角色新增','button','',10,'0/1/41/','role:create',1,NULL,NULL),(43,'角色修改','button','',10,'0/1/41/','role:update',1,NULL,NULL),(44,'角色删除','button','',10,'0/1/41/','role:delete',1,NULL,NULL),(45,'角色列表','menu','/role',10,'0/1/41/','role:view',1,NULL,NULL),(62,'机构列表','menu','/org',10,'0/1/61','config:view',1,NULL,NULL),(71,'地图配置','menu','',1,NULL,'mkfact:*',1,NULL,7),(72,'图层要素','menu','/mkfact/list',71,'0/1/10/71','mkfact:*view',1,NULL,NULL),(201,'用户列表','menu','/user',10,'0/1/21/','user:view',1,NULL,NULL),(202,'用户修改','button','',10,'0/1/21/','user:update',1,NULL,NULL),(204,'用户删除','button','',10,'0/1/21/','user:delete',1,NULL,NULL),(205,'用户新增','button','',10,'0/1/21/','user:create',1,NULL,NULL),(502,'企业新增','button','',5,'0/1/5/501','corp:create',0,NULL,NULL),(503,'企业修改','button','',5,'0/1/5/501','corp:update',1,NULL,NULL),(504,'企业查看','button','',5,'0/1/5/501','corp:view',1,NULL,NULL),(505,'企业删除','button','',5,'0/1/5/501','corp:delete',1,NULL,NULL),(506,'企业列表','menu','/company/list',5,'0/1/5/501','',1,NULL,NULL),(507,'企业分布','menu','/company/map',5,'0/1/5/501','corp:map',1,NULL,NULL),(550,'项目管理','menu',NULL,1,NULL,NULL,1,NULL,6),(551,'重点项目','menu','/proj/list',550,'0/1/5/550',NULL,1,NULL,NULL),(610,'土地列表','menu','/land/list',6,'0/1/6/601','land:view',1,NULL,NULL),(611,'土地分布','menu','/land/map',6,'0/1/6/601',NULL,0,NULL,NULL),(612,' 新增土地','button',NULL,6,'0/1/6/601','land:create',0,NULL,NULL),(613,'土地编辑','button','',6,NULL,'land:update',0,NULL,NULL),(802,'管线列表','menu','/pipe/list',8,'0/1/8/801',NULL,1,NULL,NULL),(803,'管线分布','menu','/pipe/map',8,'0/1/8/801',NULL,1,NULL,NULL),(911,'监测数据','menu','/monitorval/list',9,'0/1/10/701/',NULL,1,NULL,NULL),(912,'监测指标','menu','/monitortype/list',9,'0/1/3/',NULL,1,NULL,NULL),(913,'预警规则','menu','/warnrule/list',9,'0/1/3/','',1,NULL,NULL),(914,'新增预警','button',NULL,9,NULL,'warn:create',1,NULL,NULL),(915,'修改预警','button',NULL,9,NULL,'warn:update',1,NULL,NULL),(916,'删除预警','button',NULL,9,NULL,'warn:delete',1,NULL,NULL),(7304,'地图配置','menu','/mapconf/list',71,NULL,'mapconf:*',0,NULL,NULL);
/*!40000 ALTER TABLE `plat_sys_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat_sys_role`
--

DROP TABLE IF EXISTS `plat_sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat_sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(1000) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_role_resource_ids` (`resource_ids`(255))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat_sys_role`
--

LOCK TABLES `plat_sys_role` WRITE;
/*!40000 ALTER TABLE `plat_sys_role` DISABLE KEYS */;
INSERT INTO `plat_sys_role` VALUES (1,'admin','超级管理员','5,501,502,503,504,505,506,507,550,551,6,601,610,611,612,613,8,801,802,803,9,901,911,912,913,914,915,916,10,21,201,202,204,205,31,32,33,34,35,41,42,43,44,45,61,62,71,72,7304,',1),(2,'role1','客户经理',NULL,0),(3,'role2','业务主管',NULL,0),(4,'testA','测试角色','5,501,502,503,504,505,506,507,',0);
/*!40000 ALTER TABLE `plat_sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat_sys_user`
--

DROP TABLE IF EXISTS `plat_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgid` bigint(20) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_user_username` (`username`),
  KEY `idx_sys_user_organization_id` (`orgid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat_sys_user`
--

LOCK TABLES `plat_sys_user` WRITE;
/*!40000 ALTER TABLE `plat_sys_user` DISABLE KEYS */;
INSERT INTO `plat_sys_user` VALUES (1,4,'系统管理员','admin','9ace5ac7450dd54c05f2c3005e8ee4fe','3487ff429b0a7d3d75a551dfc9b65912',0),(5,1,'测试A','testA','e8119fe576080b0bae311a643a1b7763','92bb58bf67149123df607c505a7e4843',0),(8,2,'测试B','testB','61b52166fc860196e161dd8b09ce089d','bf293e02697a5d98a0acb83e9838b31c',0);
/*!40000 ALTER TABLE `plat_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sessions`
--

DROP TABLE IF EXISTS `sys_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sessions` (
  `id` varchar(200) NOT NULL DEFAULT '',
  `session` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sessions`
--

LOCK TABLES `sys_sessions` WRITE;
/*!40000 ALTER TABLE `sys_sessions` DISABLE KEYS */;
INSERT INTO `sys_sessions` VALUES ('717d63f5-8abf-40d0-97a5-ecca80c62ea0','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJDcxN2Q2M2Y1LThhYmYtNDBkMC05N2E1LWVjY2E4MGM2MmVhMHNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUyWpz5geHNxAH4AA3cIAAABTJao4ex4dxMAAAAAABt3QAAJMTI3LjAuMC4xc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAADHcIAAAAEAAAAAR0AFBvcmcuYXBhY2hlLnNoaXJvLnN1YmplY3Quc3VwcG9ydC5EZWZhdWx0U3ViamVjdENvbnRleHRfQVVUSEVOVElDQVRFRF9TRVNTSU9OX0tFWXNyABFqYXZhLmxhbmcuQm9vbGVhbs0gcoDVnPruAgABWgAFdmFsdWV4cAF0AAZzaXRlSWRzcgAOamF2YS5sYW5nLkxvbmc7i+SQzI8j3wIAAUoABXZhbHVleHIAEGphdmEubGFuZy5OdW1iZXKGrJUdC5TgiwIAAHhwAAAAAAAAA+l0AAZ1c2VySWRzcQB+AAwAAAAAAAAD6HQATW9yZy5hcGFjaGUuc2hpcm8uc3ViamVjdC5zdXBwb3J0LkRlZmF1bHRTdWJqZWN0Q29udGV4dF9QUklOQ0lQQUxTX1NFU1NJT05fS0VZc3IAMm9yZy5hcGFjaGUuc2hpcm8uc3ViamVjdC5TaW1wbGVQcmluY2lwYWxDb2xsZWN0aW9uqH9YJcajCEoDAAFMAA9yZWFsbVByaW5jaXBhbHN0AA9MamF2YS91dGlsL01hcDt4cHNyABdqYXZhLnV0aWwuTGlua2VkSGFzaE1hcDTATlwQbMD7AgABWgALYWNjZXNzT3JkZXJ4cQB+AAY/QAAAAAAADHcIAAAAEAAAAAF0AChjb20uZ3NjY3MuYjJjLnNoaXJvLmNsaWVudC5DbGllbnRSZWFsbV8wc3IAF2phdmEudXRpbC5MaW5rZWRIYXNoU2V02GzXWpXdKh4CAAB4cgARamF2YS51dGlsLkhhc2hTZXS6RIWVlri3NAMAAHhwdwwAAAAQP0AAAAAAAAF0AAVhZG1pbnh4AHcBAXEAfgAWeHh4'),('7e6d17b1-b00e-4393-920d-e12f53e92652','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJDdlNmQxN2IxLWIwMGUtNDM5My05MjBkLWUxMmY1M2U5MjY1MnNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUx95o6seHNxAH4AA3cIAAABTH3pZBh4dxMAAAAAABt3QAAJMTI3LjAuMC4xc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAADHcIAAAAEAAAAAN0ABFhdXRoYy5mYWxsYmFja1VybHQAJGh0dHA6Ly8xMjcuMC4wLjE6NzA4MC9lYi1zdG9yZS9zdG9yZXQAEXNoaXJvU2F2ZWRSZXF1ZXN0c3IAKWNvbS5nc2Njcy5iMmMuYXBwLmNvcmUuQ2xpZW50U2F2ZWRSZXF1ZXN0ZWbjXB3DOKsCAAVJAARwb3J0TAAHYmFja1VybHQAEkxqYXZhL2xhbmcvU3RyaW5nO0wAC2NvbnRleHRQYXRocQB+AAxMAAZkb21haW5xAH4ADEwABnNjaGVtZXEAfgAMeHIAJm9yZy5hcGFjaGUuc2hpcm8ud2ViLnV0aWwuU2F2ZWRSZXF1ZXN0r848rXmCyroCAANMAAZtZXRob2RxAH4ADEwAC3F1ZXJ5U3RyaW5ncQB+AAxMAApyZXF1ZXN0VVJJcQB+AAx4cHQAA0dFVHB0AAovZWItc3RvcmUvAAAbqHB0AAkvZWItc3RvcmV0AAkxMjcuMC4wLjF0AARodHRwdABNb3JnLmFwYWNoZS5zaGlyby5zdWJqZWN0LnN1cHBvcnQuRGVmYXVsdFN1YmplY3RDb250ZXh0X1BSSU5DSVBBTFNfU0VTU0lPTl9LRVlzcgAyb3JnLmFwYWNoZS5zaGlyby5zdWJqZWN0LlNpbXBsZVByaW5jaXBhbENvbGxlY3Rpb26of1glxqMISgMAAUwAD3JlYWxtUHJpbmNpcGFsc3QAD0xqYXZhL3V0aWwvTWFwO3hwc3IAF2phdmEudXRpbC5MaW5rZWRIYXNoTWFwNMBOXBBswPsCAAFaAAthY2Nlc3NPcmRlcnhxAH4ABj9AAAAAAAAMdwgAAAAQAAAAAXQAJGNvbS5nc2Njcy5iMmMucGxhdC5yZWFsbS5Vc2VyUmVhbG1fMHNyABdqYXZhLnV0aWwuTGlua2VkSGFzaFNldNhs11qV3SoeAgAAeHIAEWphdmEudXRpbC5IYXNoU2V0ukSFlZa4tzQDAAB4cHcMAAAAED9AAAAAAAABdAAFYWRtaW54eAB3AQFxAH4AGXh4eA=='),('a0535220-82c1-43c1-b12f-7be8a1b12769','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJGEwNTM1MjIwLTgyYzEtNDNjMS1iMTJmLTdiZThhMWIxMjc2OXNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUzlEwvKeHNxAH4AA3cIAAABTOU9Blp4dxMAAAAAABt3QAAJMTI3LjAuMC4xc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAADHcIAAAAEAAAAAR0AFBvcmcuYXBhY2hlLnNoaXJvLnN1YmplY3Quc3VwcG9ydC5EZWZhdWx0U3ViamVjdENvbnRleHRfQVVUSEVOVElDQVRFRF9TRVNTSU9OX0tFWXNyABFqYXZhLmxhbmcuQm9vbGVhbs0gcoDVnPruAgABWgAFdmFsdWV4cAF0AAZzaXRlSWRzcgAOamF2YS5sYW5nLkxvbmc7i+SQzI8j3wIAAUoABXZhbHVleHIAEGphdmEubGFuZy5OdW1iZXKGrJUdC5TgiwIAAHhwAAAAAAAAA+l0AAZ1c2VySWRzcQB+AAwAAAAAAAAD6HQATW9yZy5hcGFjaGUuc2hpcm8uc3ViamVjdC5zdXBwb3J0LkRlZmF1bHRTdWJqZWN0Q29udGV4dF9QUklOQ0lQQUxTX1NFU1NJT05fS0VZc3IAMm9yZy5hcGFjaGUuc2hpcm8uc3ViamVjdC5TaW1wbGVQcmluY2lwYWxDb2xsZWN0aW9uqH9YJcajCEoDAAFMAA9yZWFsbVByaW5jaXBhbHN0AA9MamF2YS91dGlsL01hcDt4cHNyABdqYXZhLnV0aWwuTGlua2VkSGFzaE1hcDTATlwQbMD7AgABWgALYWNjZXNzT3JkZXJ4cQB+AAY/QAAAAAAADHcIAAAAEAAAAAF0AChjb20uZ3NjY3MuYjJjLnNoaXJvLmNsaWVudC5DbGllbnRSZWFsbV8wc3IAF2phdmEudXRpbC5MaW5rZWRIYXNoU2V02GzXWpXdKh4CAAB4cgARamF2YS51dGlsLkhhc2hTZXS6RIWVlri3NAMAAHhwdwwAAAAQP0AAAAAAAAF0AAVhZG1pbnh4AHcBAXEAfgAWeHh4'),('a9218085-116a-47b4-935c-a35f659aec44','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJGE5MjE4MDg1LTExNmEtNDdiNC05MzVjLWEzNWY2NTlhZWM0NHNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUzlRvQ7eHNxAH4AA3cIAAABTOVObex4dxMAAAAAABt3QAAJMTI3LjAuMC4xc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAADHcIAAAAEAAAAAR0AFBvcmcuYXBhY2hlLnNoaXJvLnN1YmplY3Quc3VwcG9ydC5EZWZhdWx0U3ViamVjdENvbnRleHRfQVVUSEVOVElDQVRFRF9TRVNTSU9OX0tFWXNyABFqYXZhLmxhbmcuQm9vbGVhbs0gcoDVnPruAgABWgAFdmFsdWV4cAF0AAZzaXRlSWRzcgAOamF2YS5sYW5nLkxvbmc7i+SQzI8j3wIAAUoABXZhbHVleHIAEGphdmEubGFuZy5OdW1iZXKGrJUdC5TgiwIAAHhwAAAAAAAAA+l0AAZ1c2VySWRzcQB+AAwAAAAAAAAD6HQATW9yZy5hcGFjaGUuc2hpcm8uc3ViamVjdC5zdXBwb3J0LkRlZmF1bHRTdWJqZWN0Q29udGV4dF9QUklOQ0lQQUxTX1NFU1NJT05fS0VZc3IAMm9yZy5hcGFjaGUuc2hpcm8uc3ViamVjdC5TaW1wbGVQcmluY2lwYWxDb2xsZWN0aW9uqH9YJcajCEoDAAFMAA9yZWFsbVByaW5jaXBhbHN0AA9MamF2YS91dGlsL01hcDt4cHNyABdqYXZhLnV0aWwuTGlua2VkSGFzaE1hcDTATlwQbMD7AgABWgALYWNjZXNzT3JkZXJ4cQB+AAY/QAAAAAAADHcIAAAAEAAAAAF0AChjb20uZ3NjY3MuYjJjLnNoaXJvLmNsaWVudC5DbGllbnRSZWFsbV8wc3IAF2phdmEudXRpbC5MaW5rZWRIYXNoU2V02GzXWpXdKh4CAAB4cgARamF2YS51dGlsLkhhc2hTZXS6RIWVlri3NAMAAHhwdwwAAAAQP0AAAAAAAAF0AAVhZG1pbnh4AHcBAXEAfgAWeHh4'),('acbab26a-148d-4113-9ce6-ff469436ca83','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJGFjYmFiMjZhLTE0OGQtNDExMy05Y2U2LWZmNDY5NDM2Y2E4M3NyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUyRW5JoeHNxAH4AA3cIAAABTJFeX9x4dxMAAAAAABt3QAAJMTI3LjAuMC4xc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAADHcIAAAAEAAAAAJ0ABFhdXRoYy5mYWxsYmFja1VybHQAJGh0dHA6Ly8xMjcuMC4wLjE6NzA4MC9lYi1zdG9yZS9zdG9yZXQAEXNoaXJvU2F2ZWRSZXF1ZXN0c3IAKWNvbS5nc2Njcy5iMmMuYXBwLmNvcmUuQ2xpZW50U2F2ZWRSZXF1ZXN0ZWbjXB3DOKsCAAVJAARwb3J0TAAHYmFja1VybHQAEkxqYXZhL2xhbmcvU3RyaW5nO0wAC2NvbnRleHRQYXRocQB+AAxMAAZkb21haW5xAH4ADEwABnNjaGVtZXEAfgAMeHIAJm9yZy5hcGFjaGUuc2hpcm8ud2ViLnV0aWwuU2F2ZWRSZXF1ZXN0r848rXmCyroCAANMAAZtZXRob2RxAH4ADEwAC3F1ZXJ5U3RyaW5ncQB+AAxMAApyZXF1ZXN0VVJJcQB+AAx4cHQAA0dFVHB0AAovZWItc3RvcmUvAAAbqHB0AAkvZWItc3RvcmV0AAkxMjcuMC4wLjF0AARodHRweHg='),('bf4a234c-067b-4da7-bc0a-d9d69d5be112','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJGJmNGEyMzRjLTA2N2ItNGRhNy1iYzBhLWQ5ZDY5ZDViZTExMnNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUx9+Dg0eHNxAH4AA3cIAAABTH4VILh4dxMAAAAAABt3QAAJMTI3LjAuMC4xc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAAAXcIAAAAAgAAAAJ0ABFhdXRoYy5mYWxsYmFja1VybHQAJGh0dHA6Ly8xMjcuMC4wLjE6NzA4MC9lYi1zdG9yZS9zdG9yZXQAEXNoaXJvU2F2ZWRSZXF1ZXN0c3IAKWNvbS5nc2Njcy5iMmMuYXBwLmNvcmUuQ2xpZW50U2F2ZWRSZXF1ZXN0ZWbjXB3DOKsCAAVJAARwb3J0TAAHYmFja1VybHQAEkxqYXZhL2xhbmcvU3RyaW5nO0wAC2NvbnRleHRQYXRocQB+AAxMAAZkb21haW5xAH4ADEwABnNjaGVtZXEAfgAMeHIAJm9yZy5hcGFjaGUuc2hpcm8ud2ViLnV0aWwuU2F2ZWRSZXF1ZXN0r848rXmCyroCAANMAAZtZXRob2RxAH4ADEwAC3F1ZXJ5U3RyaW5ncQB+AAxMAApyZXF1ZXN0VVJJcQB+AAx4cHQAA0dFVHB0AAovZWItc3RvcmUvAAAbqHB0AAkvZWItc3RvcmV0AAkxMjcuMC4wLjF0AARodHRweHg='),('c9c177f1-3f5e-4dc6-a75e-39b9f1056d66','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIAW3QAJGM5YzE3N2YxLTNmNWUtNGRjNi1hNzVlLTM5YjlmMTA1NmQ2NnNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUx9mEQdeHNxAH4AA3cIAAABTH2fP2R4dxMAAAAAABt3QAAJMTI3LjAuMC4xeA=='),('d4f138fb-0a7e-45e7-a0b3-b7eb1ad2bbda','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJGQ0ZjEzOGZiLTBhN2UtNDVlNy1hMGIzLWI3ZWIxYWQyYmJkYXNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUyTQDX0eHNxAH4AA3cIAAABTJNA8Gp4dxMAAAAAABt3QAAJMTI3LjAuMC4xc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAADHcIAAAAEAAAAAF0AE1vcmcuYXBhY2hlLnNoaXJvLnN1YmplY3Quc3VwcG9ydC5EZWZhdWx0U3ViamVjdENvbnRleHRfUFJJTkNJUEFMU19TRVNTSU9OX0tFWXNyADJvcmcuYXBhY2hlLnNoaXJvLnN1YmplY3QuU2ltcGxlUHJpbmNpcGFsQ29sbGVjdGlvbqh/WCXGowhKAwABTAAPcmVhbG1QcmluY2lwYWxzdAAPTGphdmEvdXRpbC9NYXA7eHBzcgAXamF2YS51dGlsLkxpbmtlZEhhc2hNYXA0wE5cEGzA+wIAAVoAC2FjY2Vzc09yZGVyeHEAfgAGP0AAAAAAAAx3CAAAABAAAAABdAAoY29tLmdzY2NzLmIyYy5zaGlyby5jbGllbnQuQ2xpZW50UmVhbG1fMHNyABdqYXZhLnV0aWwuTGlua2VkSGFzaFNldNhs11qV3SoeAgAAeHIAEWphdmEudXRpbC5IYXNoU2V0ukSFlZa4tzQDAAB4cHcMAAAAED9AAAAAAAABdAAFYWRtaW54eAB3AQFxAH4ADXh4eA=='),('f89dfd82-953e-4c32-bdc8-6615c07fb32d','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJGY4OWRmZDgyLTk1M2UtNGMzMi1iZGM4LTY2MTVjMDdmYjMyZHNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUx0rB/IeHNxAH4AA3cIAAABTHSz7St4dxMAAAAAABt3QAAJMTI3LjAuMC4xc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAADHcIAAAAEAAAAAJ0ABFhdXRoYy5mYWxsYmFja1VybHQAI2h0dHA6Ly8xMjcuMC4wLjE6OTA4MC9lYi1zaXRlL2luZGV4dAARc2hpcm9TYXZlZFJlcXVlc3RzcgApY29tLmdzY2NzLmIyYy5hcHAuY29yZS5DbGllbnRTYXZlZFJlcXVlc3RlZuNcHcM4qwIABUkABHBvcnRMAAdiYWNrVXJsdAASTGphdmEvbGFuZy9TdHJpbmc7TAALY29udGV4dFBhdGhxAH4ADEwABmRvbWFpbnEAfgAMTAAGc2NoZW1lcQB+AAx4cgAmb3JnLmFwYWNoZS5zaGlyby53ZWIudXRpbC5TYXZlZFJlcXVlc3SvzjyteYLKugIAA0wABm1ldGhvZHEAfgAMTAALcXVlcnlTdHJpbmdxAH4ADEwACnJlcXVlc3RVUklxAH4ADHhwdAADR0VUcHQADi9lYi1zaXRlL2xvZ2luAAAjeHB0AAgvZWItc2l0ZXQACTEyNy4wLjAuMXQABGh0dHB4eA=='),('fd929280-80f6-4d60-ae1c-415803dafdac','rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIAW3QAJGZkOTI5MjgwLTgwZjYtNGQ2MC1hZTFjLTQxNTgwM2RhZmRhY3NyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAUx9v0pgeHNxAH4AA3cIAAABTH3F57t4dxMAAAAAABt3QAAJMTI3LjAuMC4xeA==');
/*!40000 ALTER TABLE `sys_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_notice`
--

DROP TABLE IF EXISTS `work_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_notice` (
  `id` varchar(36) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社区通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_notice`
--

LOCK TABLES `work_notice` WRITE;
/*!40000 ALTER TABLE `work_notice` DISABLE KEYS */;
INSERT INTO `work_notice` VALUES ('101','2015年10月25日通知测试','测试信息测试信息测试信息测试信息测试信息测试信息','2015-11-01 00:00:00',NULL);
/*!40000 ALTER TABLE `work_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_plan`
--

DROP TABLE IF EXISTS `work_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_plan` (
  `id` varchar(36) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(245) DEFAULT NULL,
  `assigner` varchar(45) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT NULL,
  `pstarttime` timestamp NULL DEFAULT NULL,
  `pendtime` timestamp NULL DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `remark` varchar(245) DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作计划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_plan`
--

LOCK TABLES `work_plan` WRITE;
/*!40000 ALTER TABLE `work_plan` DISABLE KEYS */;
INSERT INTO `work_plan` VALUES ('101','测试信息','测试信息测试信息测试信息测试信息测试信息测试信息测试信息',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `work_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_company`
--

DROP TABLE IF EXISTS `yqfw_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_company` (
  `id` varchar(36) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `lng` decimal(10,4) DEFAULT NULL COMMENT '经度',
  `lat` decimal(10,4) DEFAULT NULL COMMENT '维度',
  `tel` varchar(20) DEFAULT NULL,
  `classid` varchar(10) DEFAULT NULL,
  `leader` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  `intime` timestamp NULL DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `scaleid` varchar(36) DEFAULT NULL,
  `newtime` timestamp NULL DEFAULT NULL,
  `logo` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_company`
--

LOCK TABLES `yqfw_company` WRITE;
/*!40000 ALTER TABLE `yqfw_company` DISABLE KEYS */;
INSERT INTO `yqfw_company` VALUES ('202','高台兰亭新能源开发有限公司',100.4535,38.9392,'1890900099','301','测试人','甘肃省张掖市高台县南华镇工业园区','0','2015-11-03 16:00:00','甘肃省张掖市高台县南华镇工业园区','401','2015-11-03 16:00:00','/yqfw/upload/banner.jpg'),('203','高台金牧农业科技有限公司',100.4700,38.9100,'13884072400','301','测试人','发送发送大厦','1','2015-09-17 12:23:12','甘肃省张掖市高台县湿地新区','401','2015-09-08 12:23:07','/yqfw/upload/0.png'),('204','高台县丰祥建材有限公司',100.4887,38.2479,'156','302','测试人','','','2015-10-23 08:10:17','甘肃 高台县 工业园区纬3路12号','401','2015-10-06 08:10:13','/yqfw/upload/0.png'),('205','高台县二六八八服务店',100.4622,38.9359,NULL,'302',NULL,NULL,NULL,NULL,'甘肃 高台县 人民东路258号',NULL,NULL,'/yqfw/upload/0.png'),('206','庆阳路',100.4587,38.9413,'1890900099','301','庆阳路','庆阳路测试','1','2015-10-24 16:00:00','甘肃省兰州市城关区庆阳路232号甘肃中通申信科技有限公司','401','2015-10-24 16:00:00','/yqfw/upload/0.png'),('207','测试企业123',100.4573,38.9431,'1890900099','301','测试人','','1','2015-11-02 09:25:59','甘肃省兰州市城关区庆阳路232号甘肃中通申信科技有限公司','401','2015-11-27 09:25:55','/yqfw/upload/0.png'),('2505073c-7dad-43e4-aac4-ab3bfc94ba17','测试图片信息',100.4620,38.9431,'344','301','ce','','1','2015-11-03 16:00:00','cc','401','2015-11-03 16:00:00','/yqfw/upload/banner.jpg'),('71dae665-8013-4c7e-8df1-0d98dc801666','测试企业中心',100.5372,38.9717,'15300000','301','测试人','','1','2015-12-21 12:12:20','甘肃张掖','401','2015-12-21 12:12:18','/yqfw/upload/p2.png');
/*!40000 ALTER TABLE `yqfw_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_gis_area`
--

DROP TABLE IF EXISTS `yqfw_gis_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_gis_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  KEY `code` (`code`,`parentId`)
) ENGINE=InnoDB AUTO_INCREMENT=9319 DEFAULT CHARSET=utf8 COMMENT='全国省市区街道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_gis_area`
--

LOCK TABLES `yqfw_gis_area` WRITE;
/*!40000 ALTER TABLE `yqfw_gis_area` DISABLE KEYS */;
INSERT INTO `yqfw_gis_area` VALUES (931,NULL,93,'兰州市',3),(9310,NULL,931,'安宁区',4),(9311,NULL,931,'城关区',4),(9312,NULL,931,'七里河区',4),(9313,NULL,931,'西固区',4),(9314,NULL,931,'红古区',4),(9315,NULL,931,'永登县',4),(9316,NULL,931,'皋兰县',4),(9317,NULL,931,'榆中县',4),(9318,NULL,931,'兰州新区',4);
/*!40000 ALTER TABLE `yqfw_gis_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_gis_conf`
--

DROP TABLE IF EXISTS `yqfw_gis_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_gis_conf` (
  `authkey` varchar(45) NOT NULL COMMENT '授权码',
  `title` varchar(45) DEFAULT NULL,
  `centerx` decimal(10,6) DEFAULT NULL COMMENT '中心点经度',
  `centery` decimal(10,6) DEFAULT NULL COMMENT '中心点维度',
  `isbound` varchar(1) DEFAULT '0' COMMENT '是否控制视野范围',
  `bsswlng` decimal(10,4) DEFAULT NULL COMMENT '边界左上角经度',
  `bsswlat` decimal(10,4) DEFAULT NULL COMMENT '边界左上角维度',
  `bsnelng` decimal(10,4) DEFAULT NULL,
  `bsnelat` decimal(10,4) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL COMMENT '所在城市',
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`authkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地图配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_gis_conf`
--

LOCK TABLES `yqfw_gis_conf` WRITE;
/*!40000 ALTER TABLE `yqfw_gis_conf` DISABLE KEYS */;
INSERT INTO `yqfw_gis_conf` VALUES ('glbe8fDURt2c8Nh8YUlflchE','张掖数字园区',100.471635,38.966068,'1',100.2690,38.8762,100.6743,39.0558,'张掖','');
/*!40000 ALTER TABLE `yqfw_gis_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_land_info`
--

DROP TABLE IF EXISTS `yqfw_land_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_land_info` (
  `id` varchar(36) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `measure` decimal(10,0) DEFAULT NULL COMMENT '面积',
  `state` varchar(15) DEFAULT NULL,
  `corpid` varchar(45) DEFAULT NULL COMMENT '占用企业',
  `classid` varchar(45) DEFAULT NULL COMMENT '土地分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='园区土地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_land_info`
--

LOCK TABLES `yqfw_land_info` WRITE;
/*!40000 ALTER TABLE `yqfw_land_info` DISABLE KEYS */;
INSERT INTO `yqfw_land_info` VALUES ('1001','100-105','1号工厂土地','土地资源变更测试',100,'1','202','201'),('1002','2001-01','1号工厂2','',60,'','203','201'),('1003','100-102','新增土地测试','新增土地测试',200,NULL,NULL,'202'),('5d1ca802-b892-4132-8463-ec216fd549c7','20151212','测试删除土地','测试删除',0,'1','','201'),('969a8cac-5317-49bc-b07f-ba8d6b058bca','20555','测试土地资源中心','测试',430,'1','','201'),('acb7f4f4-7053-4d82-a549-dc0666bfa86a','1001-103','测试土地3号地','工业用地',400,'1','202','201');
/*!40000 ALTER TABLE `yqfw_land_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_land_point`
--

DROP TABLE IF EXISTS `yqfw_land_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_land_point` (
  `id` varchar(36) NOT NULL,
  `landid` varchar(45) DEFAULT NULL COMMENT '所属土地',
  `lng` decimal(10,4) DEFAULT NULL,
  `lat` decimal(10,4) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='园区土地绘制点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_land_point`
--

LOCK TABLES `yqfw_land_point` WRITE;
/*!40000 ALTER TABLE `yqfw_land_point` DISABLE KEYS */;
INSERT INTO `yqfw_land_point` VALUES ('0b599689-cd12-41f1-811e-9fbaa1f83229','1003',100.4414,38.9470,NULL,5),('14bd3c49-5019-4562-99f3-3525a5c4c4ac','acb7f4f4-7053-4d82-a549-dc0666bfa86a',100.4492,38.9453,NULL,3),('2622b357-69f8-4099-ae82-25db80b4263c','969a8cac-5317-49bc-b07f-ba8d6b058bca',100.5095,38.9360,NULL,2),('27753a2b-dfe6-4921-b74f-066edfdbc3b2','1003',100.4481,38.9464,NULL,3),('2f1bd641-06b1-4ffe-a9a9-3cbb8d8fd27a','5d1ca802-b892-4132-8463-ec216fd549c7',100.4575,38.9373,NULL,5),('3cb8aaae-3913-4282-81f0-983620bca34a','1001',100.4578,38.9453,NULL,4),('400fe7ce-3a8f-463e-8f8c-d94b97fbdf24','1002',100.4488,38.9377,NULL,1),('4014e86e-7249-44d0-a6a9-3eb7f9fae65c','969a8cac-5317-49bc-b07f-ba8d6b058bca',100.4979,38.9355,NULL,1),('409b90eb-d6cc-4b9d-bfa4-534f99e8908f','acb7f4f4-7053-4d82-a549-dc0666bfa86a',100.4443,38.9444,NULL,2),('43a696a4-ae91-4501-b6ac-1918adb28450','969a8cac-5317-49bc-b07f-ba8d6b058bca',100.5040,38.9435,NULL,4),('6a7b1d65-cf80-4f13-abd5-e112c12e7362','1001',100.4555,38.9464,NULL,6),('6d60421c-8c7f-4944-be61-91b147bae3ff','1003',100.4414,38.9450,NULL,4),('76a5aa7f-f249-4c03-b4b0-6e1ec129ec54','1002',100.4465,38.9363,NULL,0),('785c6378-527c-49e2-b390-1be5480202cf','1002',100.4526,38.9350,NULL,3),('7ac3b846-c093-4158-a551-e74dc3e536ae','1003',100.4424,38.9498,NULL,1),('7acd8b13-bb68-4776-baa4-5e68c7b3f147','1002',100.4520,38.9387,NULL,2),('807d66a1-d7d7-4303-b67d-afd05328ec65','5d1ca802-b892-4132-8463-ec216fd549c7',100.4556,38.9333,NULL,2),('882a4632-e21a-4a93-9185-086603085265','1002',100.4462,38.9345,NULL,4),('8a5d493c-56e0-40e5-bfda-709615138272','acb7f4f4-7053-4d82-a549-dc0666bfa86a',100.4434,38.9415,NULL,6),('8ee2b638-5fa7-4685-bab9-3e780db023b2','5d1ca802-b892-4132-8463-ec216fd549c7',100.4598,38.9331,NULL,1),('97444c13-710d-4385-b4c1-96e324fdd32c','5d1ca802-b892-4132-8463-ec216fd549c7',100.4535,38.9367,NULL,4),('9cf862c5-eba4-466c-986c-f92b11e77fe1','1001',100.4580,38.9448,NULL,3),('ab845fdd-8d08-48e8-bd8e-653809e1f29d','5d1ca802-b892-4132-8463-ec216fd549c7',100.4541,38.9347,NULL,3),('b2fe8071-0314-4854-8e93-acd531832466','acb7f4f4-7053-4d82-a549-dc0666bfa86a',100.4507,38.9439,NULL,4),('b82592f2-5e30-4f6d-b63e-17a5b324d5d7','1003',100.4406,38.9484,NULL,0),('c6116074-e773-442d-987b-3185616d1bc4','1001',100.4581,38.9433,NULL,2),('c630f35d-b413-43f3-bd32-1012f8b33131','acb7f4f4-7053-4d82-a549-dc0666bfa86a',100.4418,38.9431,NULL,1),('c81214dc-77f5-4e28-9c9d-73d5b2b8f7c4','1001',100.4567,38.9452,NULL,5),('cd43db9a-7005-45c7-98c1-13dd3f3d0829','acb7f4f4-7053-4d82-a549-dc0666bfa86a',100.4512,38.9424,NULL,5),('cf5f2a4a-2f1b-4c58-b812-6db78e401603','969a8cac-5317-49bc-b07f-ba8d6b058bca',100.4976,38.9429,NULL,0),('d2911555-5db7-4174-81e6-fd304e0fea0e','acb7f4f4-7053-4d82-a549-dc0666bfa86a',100.4420,38.9414,NULL,0),('d7ca866d-415c-4d06-b2db-b3bd6f8bd1fd','1001',100.4540,38.9427,NULL,1),('d9cfa45f-a8c7-4677-a114-25aa1f084708','5d1ca802-b892-4132-8463-ec216fd549c7',100.4596,38.9350,NULL,0),('e1b15f18-f287-4abd-a72c-a55f79326ae2','969a8cac-5317-49bc-b07f-ba8d6b058bca',100.5105,38.9426,NULL,3),('f42cd3f8-2cd6-493d-888c-a1090e2ca6cd','1001',100.4537,38.9448,NULL,0),('ffd00af6-3e4e-4de0-bdb7-f4032814454e','1003',100.4444,38.9503,NULL,2);
/*!40000 ALTER TABLE `yqfw_land_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_marker_factor`
--

DROP TABLE IF EXISTS `yqfw_marker_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_marker_factor` (
  `id` varchar(36) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `linecolor` varchar(45) DEFAULT '#6495ED',
  `fillcolor` varchar(45) DEFAULT '#6495ED',
  `weight` int(11) DEFAULT '5',
  `opacity` float DEFAULT '0.5',
  `classfy` varchar(45) DEFAULT NULL COMMENT '要素类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图层要素分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_marker_factor`
--

LOCK TABLES `yqfw_marker_factor` WRITE;
/*!40000 ALTER TABLE `yqfw_marker_factor` DISABLE KEYS */;
INSERT INTO `yqfw_marker_factor` VALUES ('101','电力','1','',NULL,'#FF0000','#FF0000',3,0.5,'PIPE'),('102','自来水','1','',NULL,'#006400','#006400',2,0.5,'PIPE'),('103','通信','1','',NULL,'#000079','#000079',2,0.5,'PIPE'),('201','工业用地','1','',NULL,'#000079','#000079',1,0.5,'LAND'),('202','居住用地','1','',NULL,'#006400','#006400',2,0.5,'LAND'),('301','生产行业','1','',NULL,'#000000','#000000',2,0.5,'CORP'),('302','销售行业','1',NULL,NULL,NULL,'#6495ED',NULL,NULL,'CORP'),('303','服务行业','1',NULL,NULL,NULL,'#6495ED',NULL,NULL,'CORP'),('304','公共服务','1','',NULL,'#FFFF00','#FFFF00',2,0.5,'CORP'),('401','0~50人',NULL,NULL,NULL,NULL,'#6495ED',NULL,NULL,'SCALE'),('402','50～99人',NULL,NULL,NULL,NULL,'#6495ED',NULL,NULL,'SCALE'),('e7970ef2-e523-4372-8c66-2ef86c504972','测试','1','',NULL,NULL,'#6495ED',NULL,NULL,'LAND'),('fae4d40a-0668-4a25-8bf9-b540b68f712b','污水','1','测试',NULL,'#000000','#000000',2,0.5,'PIPE');
/*!40000 ALTER TABLE `yqfw_marker_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_monit_type`
--

DROP TABLE IF EXISTS `yqfw_monit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_monit_type` (
  `id` varchar(36) NOT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '类型名称',
  `unit` varchar(45) DEFAULT NULL COMMENT '单位',
  `alias` varchar(50) DEFAULT NULL COMMENT '类型别名',
  `state` varchar(1) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `ordernum` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ordernum_UNIQUE` (`ordernum`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='园区监测分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_monit_type`
--

LOCK TABLES `yqfw_monit_type` WRITE;
/*!40000 ALTER TABLE `yqfw_monit_type` DISABLE KEYS */;
INSERT INTO `yqfw_monit_type` VALUES ('101','二氧化碳','毫安','二氧化碳','1','修改测试',1),('102','测试指标3','毫克','专属定制','1','',12),('111','二氧化硫','毫克','二氧化硫','1',NULL,2),('121','一氧化碳','毫克','一氧化碳','1',NULL,3),('2ce99900-b8f7-4db0-804a-f66c0ea7c030','测试指标5','克','','1','',15),('2f28ddb5-e529-4201-83f0-5e82b22a9e02','测试检测指标1','毫安','无','1','测哦哦呃呃',13),('e1670a14-2109-4c66-b6c5-61c31246b509','测试指标4','克','','1','',14);
/*!40000 ALTER TABLE `yqfw_monit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_monit_vals`
--

DROP TABLE IF EXISTS `yqfw_monit_vals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_monit_vals` (
  `id` varchar(36) NOT NULL,
  `type_id` varchar(50) DEFAULT NULL COMMENT '类型ID',
  `corp_id` varchar(50) DEFAULT NULL COMMENT '企业ID',
  `monitval` decimal(10,2) DEFAULT NULL COMMENT '监测值',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '监测时间',
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='园区企业监测值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_monit_vals`
--

LOCK TABLES `yqfw_monit_vals` WRITE;
/*!40000 ALTER TABLE `yqfw_monit_vals` DISABLE KEYS */;
INSERT INTO `yqfw_monit_vals` VALUES ('1','101','202',97.02,'2015-10-21 16:00:00','多对多'),('1d20cb28-dee8-45c2-9859-d8eba3d65b9e','101','202',8.01,'2015-10-21 16:00:00',''),('2','101','203',40.02,'2015-10-09 16:00:00',NULL),('3','102','202',110.02,'2015-10-21 16:00:00','多对多'),('4','111','203',40.02,'2015-10-09 16:00:00',NULL),('5','121','204',103.02,'2015-10-09 16:00:00',NULL),('590d2f3e-6fc2-4f75-b8c9-a0435d8c7e36','f7add461-b789-4f35-800f-fdb4be7c7795','202',97.00,'2015-10-29 15:29:01','测试'),('60f16a31-52cb-4a73-8448-3dfae1ab383b','111','203',900.00,'2015-11-03 16:00:00',''),('bfbc04c1-d496-417a-97bb-dd0f5e5cd5e5','101','202',60.00,'2015-10-06 06:23:08','测试添加监测数据');
/*!40000 ALTER TABLE `yqfw_monit_vals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_overproof`
--

DROP TABLE IF EXISTS `yqfw_overproof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_overproof` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyid` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `overproofvalue` varchar(200) DEFAULT NULL,
  `standardvalue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_overproof`
--

LOCK TABLES `yqfw_overproof` WRITE;
/*!40000 ALTER TABLE `yqfw_overproof` DISABLE KEYS */;
/*!40000 ALTER TABLE `yqfw_overproof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_pipe_net`
--

DROP TABLE IF EXISTS `yqfw_pipe_net`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_pipe_net` (
  `id` varchar(36) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `corpid` varchar(45) DEFAULT NULL COMMENT '所属企业',
  `classid` varchar(45) DEFAULT NULL COMMENT '管线管网类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管线管网标注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_pipe_net`
--

LOCK TABLES `yqfw_pipe_net` WRITE;
/*!40000 ALTER TABLE `yqfw_pipe_net` DISABLE KEYS */;
INSERT INTO `yqfw_pipe_net` VALUES ('1001','1001-101','1号园区电力管道','编辑测试','1',100.00,'202','101'),('1002','2','2号电力输送线路','测试2','0',20.00,'206','101'),('1003','2','园区自来水1号管道','','1',5.00,'','102'),('1004','4','3号园区自来水管道','','1',200.00,'','102'),('2b71d63e-37a7-4d3f-b263-fcf77f701884','102-100','管网管线中心点','','1',50.00,'','101'),('8235f104-5031-4234-9aba-705709d256eb','1001-101','园区通信光缆1号线','','1',2000.00,'','103'),('860dff8c-6ca5-42f4-90c4-70e80d4a813b','1001-102','测试管道','测试管道','1',100.00,'206','101');
/*!40000 ALTER TABLE `yqfw_pipe_net` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_pipe_point`
--

DROP TABLE IF EXISTS `yqfw_pipe_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_pipe_point` (
  `id` varchar(36) NOT NULL,
  `pipeid` varchar(45) DEFAULT NULL,
  `lng` decimal(10,4) DEFAULT NULL,
  `lat` decimal(10,4) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管线数据点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_pipe_point`
--

LOCK TABLES `yqfw_pipe_point` WRITE;
/*!40000 ALTER TABLE `yqfw_pipe_point` DISABLE KEYS */;
INSERT INTO `yqfw_pipe_point` VALUES ('0049f6ae-f4e1-4875-91f8-567db416cbdf','1002',100.4604,38.9694,NULL,2),('03247299-b62f-4699-823f-dee6a14fe501','1002',100.4634,38.9752,NULL,1),('05e69e6d-372d-4b7f-8966-f4b16c3bea97','8235f104-5031-4234-9aba-705709d256eb',100.4497,38.9404,NULL,5),('0e6486a2-72a8-4a9b-844f-c1aef4f6012a','1002',100.4848,38.9352,NULL,5),('0f17e01f-14e6-4b9f-a456-c4d13a86d016','1002',100.4770,38.9577,NULL,3),('10f755f0-70c7-4356-ba87-e53da5f61f04','8235f104-5031-4234-9aba-705709d256eb',100.4528,38.9425,NULL,6),('1a4293a0-39e3-426f-86d0-519a885555c2','2b71d63e-37a7-4d3f-b263-fcf77f701884',100.4879,38.9513,NULL,3),('1d175cb4-b25c-4530-846e-a3197ac498a2','1004',100.4233,38.9471,NULL,0),('2583fbfc-fd62-4370-9392-a1f85a36bb2f','1001',100.3693,38.9319,NULL,1),('26b84b67-1302-44b0-b513-c15c2c11802a','1003',100.4234,38.9481,NULL,1),('2893edd6-18f9-466c-b08e-789c4576b74c','2b71d63e-37a7-4d3f-b263-fcf77f701884',100.4902,38.9580,NULL,2),('2894e9a4-b820-4dc7-a119-55946528e926','8235f104-5031-4234-9aba-705709d256eb',100.4583,38.9422,NULL,8),('2fb02db0-ef3c-4228-9761-e2988825cd9c','8235f104-5031-4234-9aba-705709d256eb',100.4551,38.9428,NULL,7),('45e119b9-3ea0-4b9c-b83e-d06a1b7972a3','1003',100.4063,38.9551,NULL,0),('47d1bda3-7ff3-4b5d-a49d-cddbc92bf425','860dff8c-6ca5-42f4-90c4-70e80d4a813b',100.4448,38.9412,NULL,1),('4a2830e5-de0d-4c5c-bda2-a4571ea990de','1004',100.4529,38.9384,NULL,3),('56526a39-4ba0-4b8f-8650-075fd5aa07df','1001',100.3896,38.9521,NULL,3),('58338b71-94fa-4a03-a2d6-7d705153bf85','1004',100.4358,38.9380,NULL,1),('62d45b2d-3da0-45f2-a8da-fa79af40c898','1004',100.4413,38.9366,NULL,2),('67c86362-f874-43a2-9a00-6bb138bbfa09','1001',100.4127,38.9329,NULL,2),('785b97ca-d445-4625-b6bb-5ea222f048c5','1002',100.4487,38.9270,NULL,8),('7a456d03-df3b-4d68-a8a8-330e95fce26f','8235f104-5031-4234-9aba-705709d256eb',100.4360,38.9416,NULL,2),('7e2ae34e-913f-4c79-bc81-27d5becd3fd0','1001',100.3783,38.9173,NULL,0),('7f8105f4-5844-4af3-ab7a-98061ecfc896','8235f104-5031-4234-9aba-705709d256eb',100.4296,38.9400,NULL,0),('8331c729-e2e4-4a02-9fb3-22ec2d4dd925','1002',100.4698,38.9442,NULL,4),('9d3bc164-ec65-4c7a-b582-2a27494d8802','2b71d63e-37a7-4d3f-b263-fcf77f701884',100.5229,38.9765,NULL,0),('a09e6b23-2ecb-4b1d-9f33-ff90552472db','8235f104-5031-4234-9aba-705709d256eb',100.4401,38.9408,NULL,3),('b48bebe8-c0c0-4b0a-aad2-f67400819993','8235f104-5031-4234-9aba-705709d256eb',100.4427,38.9415,NULL,4),('bb6f248c-e4f3-468f-97db-d09132154871','1003',100.4524,38.9460,NULL,2),('c14c80d8-b036-4bd2-8eac-824a3f79a0ff','860dff8c-6ca5-42f4-90c4-70e80d4a813b',100.4500,38.9400,NULL,0),('cfaa5430-efd7-4b72-ba26-636c5a735fe3','1004',100.4540,38.9341,NULL,4),('d7bed7cc-b80c-4254-93e2-40c0091640df','1003',100.4577,38.9484,NULL,3),('de118632-4f50-49cd-9f56-b465ab73fb34','2b71d63e-37a7-4d3f-b263-fcf77f701884',100.5016,38.9593,NULL,1),('de2e16f4-c261-45d6-aba3-c7de73dfddf5','1002',100.4560,38.9319,NULL,7),('df9d78ac-aaf9-4d8e-b4ec-72cec3d17b51','8235f104-5031-4234-9aba-705709d256eb',100.4347,38.9404,NULL,1),('edb799a5-1455-40dc-bcad-9e3f28d2828b','1002',100.4675,38.9326,NULL,6),('f10412b7-192c-4ffe-b542-5a6c99c9abcc','1002',100.4696,38.9752,NULL,0);
/*!40000 ALTER TABLE `yqfw_pipe_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_project`
--

DROP TABLE IF EXISTS `yqfw_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_project` (
  `id` varchar(36) NOT NULL,
  `title` varchar(200) NOT NULL,
  `pstartday` timestamp NULL DEFAULT NULL COMMENT '计划开工时间',
  `pendday` timestamp NULL DEFAULT NULL COMMENT '计划完工时间',
  `endday` timestamp NULL DEFAULT NULL COMMENT '实际完工时间',
  `state` varchar(45) DEFAULT NULL,
  `leader` varchar(45) DEFAULT NULL,
  `linktel` varchar(45) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='重点工程项目信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_project`
--

LOCK TABLES `yqfw_project` WRITE;
/*!40000 ALTER TABLE `yqfw_project` DISABLE KEYS */;
INSERT INTO `yqfw_project` VALUES ('101','项目测试','2015-11-17 16:00:00','2015-11-18 16:00:00',NULL,'1','','',NULL,'项目ceshi'),('104','测试项目4','2015-11-19 16:00:00','2016-01-29 16:00:00',NULL,'1','测试人','1519310000',NULL,'');
/*!40000 ALTER TABLE `yqfw_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqfw_warn_rule`
--

DROP TABLE IF EXISTS `yqfw_warn_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yqfw_warn_rule` (
  `id` varchar(36) NOT NULL,
  `type_id` varchar(45) DEFAULT NULL COMMENT '指标',
  `rule` varchar(45) DEFAULT NULL COMMENT '条件',
  `threshold` decimal(10,2) DEFAULT NULL COMMENT '阀值',
  `remark` varchar(255) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='监测值预警规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqfw_warn_rule`
--

LOCK TABLES `yqfw_warn_rule` WRITE;
/*!40000 ALTER TABLE `yqfw_warn_rule` DISABLE KEYS */;
INSERT INTO `yqfw_warn_rule` VALUES ('101','101','gt',50.00,'预警规则测试','1'),('102','102','lt',30.01,'','1'),('1a5d124f-6eec-436a-81a9-f1c2df8ffb67','111','gt',10.00,'','1'),('b2172533-0672-47d6-92ac-f437cb42d432','2f28ddb5-e529-4201-83f0-5e82b22a9e02','lt',1.00,'测试','1'),('f120aec3-9d4f-4325-878b-d65e6c675cf0','121','gt',8.00,'一样化碳预警','1');
/*!40000 ALTER TABLE `yqfw_warn_rule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-17 23:03:01
