-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: maxkey
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `mxk_accounts`
--

DROP TABLE IF EXISTS `mxk_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_accounts` (
  `ID` varchar(45) NOT NULL COMMENT '主键',
  `USERID` varchar(45) DEFAULT NULL COMMENT '用户ID',
  `USERNAME` varchar(45) DEFAULT NULL COMMENT '用户名',
  `DISPLAYNAME` varchar(45) DEFAULT NULL COMMENT '用户显示名',
  `APPID` varchar(45) DEFAULT NULL COMMENT '应用ID',
  `APPNAME` varchar(100) DEFAULT NULL COMMENT '应用名称',
  `RELATEDUSERNAME` varchar(200) DEFAULT NULL COMMENT '用户名',
  `RELATEDPASSWORD` varchar(200) DEFAULT NULL COMMENT '密码',
  `CREATETYPE` varchar(45) DEFAULT 'automatic',
  `STRATEGYID` varchar(45) DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `CREATEDBY` varchar(45) DEFAULT NULL,
  `CREATEDDATE` date DEFAULT NULL,
  `MODIFIEDBY` varchar(45) DEFAULT NULL,
  `MODIFIEDDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE_USER_ACCOUNT` (`USERNAME`,`APPID`,`RELATEDUSERNAME`,`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_accounts_strategy`
--

DROP TABLE IF EXISTS `mxk_accounts_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_accounts_strategy` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `NAME` varchar(100) DEFAULT NULL COMMENT 'strategy NAME',
  `APPID` varchar(45) NOT NULL COMMENT 'APPID',
  `APPNAME` varchar(45) NOT NULL COMMENT 'APPNAME',
  `MAPPING` varchar(45) NOT NULL COMMENT 'ACCOUNT MAPPING',
  `FILTERS` text,
  `ORGIDSLIST` text,
  `STATUS` tinyint unsigned DEFAULT NULL COMMENT 'STATUS',
  `CREATEDBY` varchar(45) DEFAULT NULL COMMENT 'CREATEDBY',
  `CREATEDDATE` date DEFAULT NULL COMMENT 'CREATEDDATE',
  `MODIFIEDBY` varchar(45) DEFAULT NULL COMMENT 'MODIFIEDBY',
  `MODIFIEDDATE` date DEFAULT NULL COMMENT 'MODIFIEDDATE',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT 'DESCRIPTION',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='accounts_strategy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_apps`
--

DROP TABLE IF EXISTS `mxk_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_apps` (
  `ID` varchar(45) NOT NULL COMMENT '主键',
  `NAME` varchar(300) NOT NULL COMMENT '应用名称',
  `LOGINURL` varchar(300) CHARACTER SET cp850 COLLATE cp850_general_ci NOT NULL COMMENT '应用登录地址',
  `CATEGORY` varchar(45) DEFAULT NULL COMMENT '应用类型',
  `SECRET` varchar(400) DEFAULT NULL COMMENT '应用密钥',
  `PROTOCOL` varchar(300) DEFAULT NULL COMMENT '单点登录协议',
  `ICON` blob COMMENT '应用图标',
  `STATUS` tinyint unsigned DEFAULT NULL COMMENT '状态',
  `CREATEDBY` varchar(45) DEFAULT NULL COMMENT '创建人',
  `CREATEDDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIEDBY` varchar(45) DEFAULT NULL COMMENT '修改人',
  `MODIFIEDDATE` datetime DEFAULT NULL COMMENT '修改时间',
  `DESCRIPTION` varchar(400) DEFAULT NULL COMMENT '描述',
  `VENDOR` varchar(45) DEFAULT NULL COMMENT '供应商',
  `VENDORURL` varchar(200) DEFAULT NULL COMMENT '供应商地址',
  `CREDENTIAL` tinyint DEFAULT '0' COMMENT '单点登录凭证类型',
  `SHAREDUSERNAME` varchar(100) DEFAULT NULL COMMENT '共享用户名',
  `SHAREDPASSWORD` varchar(400) DEFAULT NULL COMMENT '共享密码',
  `SYSTEMUSERATTR` varchar(45) DEFAULT NULL COMMENT '系统用户属性',
  `ISEXTENDATTR` varchar(4) DEFAULT NULL COMMENT '是否支持应用扩展属性',
  `EXTENDATTR` varchar(4000) DEFAULT NULL COMMENT '应用扩展属性',
  `SORTINDEX` int unsigned DEFAULT '0' COMMENT '排序序号',
  `ISSIGNATURE` tinyint DEFAULT '0' COMMENT '签名状态',
  `VISIBLE` tinyint DEFAULT '0' COMMENT '可见标识',
  `ISADAPTER` tinyint unsigned DEFAULT '0' COMMENT '是否支持适配器',
  `ADAPTERID` varchar(45) DEFAULT NULL,
  `ADAPTERNAME` varchar(100) DEFAULT NULL,
  `ADAPTER` varchar(500) DEFAULT NULL COMMENT '适配器',
  `PRINCIPAL` varchar(45) DEFAULT NULL COMMENT '接口API用户',
  `CREDENTIALS` varchar(200) DEFAULT NULL COMMENT '接口API用户凭证',
  `USERPROPERTYS` varchar(4000) DEFAULT NULL COMMENT '接口返回用户属性定义',
  `INDUCER` varchar(50) DEFAULT 'IDP' COMMENT '引导方式',
  `LOGOUTURL` varchar(300) DEFAULT NULL COMMENT '注销地址',
  `LOGOUTTYPE` int DEFAULT NULL COMMENT '单点注销方式 0 NONE,1 BACK_CHANNEL,2 FRONT_CHANNEL',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_apps_adapters`
--

DROP TABLE IF EXISTS `mxk_apps_adapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_apps_adapters` (
  `ID` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PROTOCOL` varchar(300) DEFAULT NULL,
  `ADAPTER` varchar(500) DEFAULT NULL,
  `SORTINDEX` int DEFAULT NULL,
  `CREATEDBY` varchar(45) DEFAULT NULL,
  `CREATEDDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIEDBY` varchar(45) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ADAPTER';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_apps_cas_details`
--

DROP TABLE IF EXISTS `mxk_apps_cas_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_apps_cas_details` (
  `ID` varchar(45) NOT NULL,
  `SERVICE` varchar(400) NOT NULL,
  `CALLBACKURL` varchar(400) NOT NULL,
  `EXPIRES` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_apps_form_based_details`
--

DROP TABLE IF EXISTS `mxk_apps_form_based_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_apps_form_based_details` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `USERNAMEMAPPING` varchar(45) DEFAULT NULL COMMENT 'FORM LOGIN NAME',
  `PASSWORDMAPPING` varchar(45) DEFAULT NULL COMMENT 'FORM LOGIN PASSWORD',
  `REDIRECTURI` varchar(400) DEFAULT NULL COMMENT 'REDIRECTURI',
  `AUTHORIZEVIEW` varchar(100) DEFAULT NULL COMMENT 'AUTHORIZEVIEW FOR LOCAL VIEW DEAL',
  `passwordalgorithm` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FormBase details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_apps_jwt_details`
--

DROP TABLE IF EXISTS `mxk_apps_jwt_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_apps_jwt_details` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `ALGORITHMKEY` varchar(400) NOT NULL COMMENT '秘钥',
  `ALGORITHM` varchar(45) NOT NULL COMMENT '加密算法 /DES,DESede,Blowfish and AES',
  `EXPIRES` int unsigned DEFAULT '0' COMMENT 'EXPIRES TIME',
  `REDIRECTURI` varchar(400) NOT NULL COMMENT 'REDIRECTURI',
  `COOKIENAME` varchar(45) DEFAULT NULL,
  `tokenType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_apps_oauth_client_details`
--

DROP TABLE IF EXISTS `mxk_apps_oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_apps_oauth_client_details` (
  `CLIENT_ID` varchar(45) NOT NULL COMMENT 'appkey',
  `RESOURCE_IDS` varchar(256) DEFAULT NULL COMMENT '资源ids',
  `CLIENT_SECRET` varchar(256) DEFAULT NULL COMMENT 'appsecret',
  `SCOPE` varchar(256) DEFAULT NULL COMMENT 'SCOPE',
  `AUTHORIZED_GRANT_TYPES` varchar(256) DEFAULT NULL COMMENT '授权类型',
  `WEB_SERVER_REDIRECT_URI` varchar(256) DEFAULT NULL COMMENT 'REDIRECT_URI认证返回地址',
  `AUTHORITIES` varchar(256) DEFAULT NULL COMMENT 'AUTHORITIES',
  `ACCESS_TOKEN_VALIDITY` int unsigned DEFAULT NULL COMMENT 'accesstoken有效时间',
  `REFRESH_TOKEN_VALIDITY` int unsigned DEFAULT NULL,
  `ADDITIONAL_INFORMATION` varchar(4096) DEFAULT NULL,
  `APPROVALPROMPT` varchar(45) DEFAULT 'force',
  `AUTOAPPROVE` varchar(45) DEFAULT NULL COMMENT '自动通过',
  `IDTOKENENCRYPTEDALGORITHM` varchar(45) DEFAULT NULL,
  `IDTOKENSIGNINGALGORITHM` varchar(45) DEFAULT NULL,
  `IDTOKENENCRYPTIONMETHOD` varchar(45) DEFAULT NULL,
  `USERINFOSIGNINGALGORITHM` varchar(45) DEFAULT NULL,
  `USERINFOCRYPTEDALGORITHM` varchar(45) DEFAULT NULL,
  `USERINFOENCRYPTIONMETHOD` varchar(45) DEFAULT NULL,
  `JWKSURI` varchar(400) DEFAULT NULL,
  `PKCE` varchar(45) DEFAULT NULL,
  `PROTOCOL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='oauth_client_details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_apps_saml_v20_details`
--

DROP TABLE IF EXISTS `mxk_apps_saml_v20_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_apps_saml_v20_details` (
  `ID` varchar(45) NOT NULL,
  `CERTISSUER` varchar(200) DEFAULT NULL,
  `CERTSUBJECT` varchar(200) DEFAULT NULL,
  `CERTEXPIRATION` varchar(100) DEFAULT NULL,
  `KEYSTORE` blob,
  `SPACSURL` varchar(200) NOT NULL,
  `ISSUER` varchar(300) DEFAULT NULL,
  `ENTITYID` varchar(300) DEFAULT NULL,
  `VALIDITYINTERVAL` int unsigned DEFAULT NULL,
  `NAMEIDFORMAT` varchar(45) DEFAULT NULL,
  `NAMEIDCONVERT` tinyint unsigned DEFAULT NULL,
  `NAMEIDSUFFIX` varchar(150) DEFAULT NULL,
  `AUDIENCE` varchar(300) DEFAULT NULL,
  `ENCRYPTED` tinyint unsigned DEFAULT NULL,
  `BINDING` varchar(45) DEFAULT NULL,
  `SIGNATURE` varchar(45) DEFAULT NULL,
  `DIGESTMETHOD` varchar(45) DEFAULT NULL,
  `METAURL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_apps_token_based_details`
--

DROP TABLE IF EXISTS `mxk_apps_token_based_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_apps_token_based_details` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `ALGORITHMKEY` varchar(400) NOT NULL COMMENT '秘钥',
  `ALGORITHM` varchar(45) NOT NULL COMMENT '加密算法 /DES,DESede,Blowfish and AES',
  `EXPIRES` int unsigned DEFAULT '0' COMMENT 'EXPIRES TIME',
  `REDIRECTURI` varchar(400) NOT NULL COMMENT 'REDIRECTURI',
  `COOKIENAME` varchar(45) DEFAULT NULL,
  `tokenType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_group_member`
--

DROP TABLE IF EXISTS `mxk_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_group_member` (
  `ID` varchar(100) NOT NULL DEFAULT '' COMMENT 'ID',
  `GROUPID` varchar(100) NOT NULL COMMENT 'GROUPID',
  `MEMBERID` varchar(100) NOT NULL COMMENT 'MEMBERID USERID OR GROUP ID',
  `TYPE` varchar(45) NOT NULL COMMENT 'TYPE  USER OR GROUP',
  `CREATEDDATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `FK_APPROLEU_REFERENCE_APPROLES` (`GROUPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='group member,USERS OR GROUPS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_group_privileges`
--

DROP TABLE IF EXISTS `mxk_group_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_group_privileges` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `GROUPID` varchar(45) NOT NULL COMMENT 'GROUPID',
  `APPID` varchar(45) NOT NULL COMMENT 'APPID',
  `CREATEDDATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `FK_APPROLEA_REFERENCE_APPLICAT` (`APPID`),
  KEY `FK_APPROLEA_REFERENCE_APPROLES` (`GROUPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='group privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_groups`
--

DROP TABLE IF EXISTS `mxk_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_groups` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `NAME` varchar(100) DEFAULT NULL COMMENT 'GROUP NAME',
  `DYNAMIC` varchar(2) DEFAULT NULL COMMENT '动态用户组，0否 1是',
  `FILTERS` text COMMENT '过滤条件SQL',
  `ORGIDSLIST` text COMMENT '机构列表',
  `STATUS` tinyint unsigned DEFAULT NULL COMMENT 'STATUS',
  `CREATEDBY` varchar(45) DEFAULT NULL COMMENT 'CREATEDBY',
  `ISDEFAULT` tinyint unsigned DEFAULT NULL COMMENT 'ISDEFAULT',
  `CREATEDDATE` date DEFAULT NULL COMMENT 'CREATEDDATE',
  `MODIFIEDBY` varchar(45) DEFAULT NULL COMMENT 'MODIFIEDBY',
  `MODIFIEDDATE` date DEFAULT NULL COMMENT 'MODIFIEDDATE',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT 'DESCRIPTION',
  `RESUMETIME` varchar(45) DEFAULT NULL COMMENT 'RESUMETIME',
  `SUSPENDTIME` varchar(45) DEFAULT NULL COMMENT 'SUSPENDTIME',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_history_connector`
--

DROP TABLE IF EXISTS `mxk_history_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_history_connector` (
  `ID` varchar(45) NOT NULL,
  `CONNAME` varchar(200) DEFAULT NULL,
  `CONTYPE` varchar(45) DEFAULT NULL,
  `SOURCEID` varchar(45) DEFAULT NULL,
  `SOURCENAME` varchar(500) DEFAULT NULL,
  `OBJECTID` varchar(45) DEFAULT NULL,
  `OBJECTNAME` varchar(500) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `SYNCTIME` varchar(45) DEFAULT NULL,
  `RESULT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_history_event`
--

DROP TABLE IF EXISTS `mxk_history_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_history_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eventname` varchar(45) DEFAULT NULL,
  `datatype` varchar(45) DEFAULT NULL,
  `datacount` int DEFAULT NULL,
  `executedatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_history_login`
--

DROP TABLE IF EXISTS `mxk_history_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_history_login` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `SESSIONID` varchar(45) DEFAULT NULL COMMENT 'SESSIONID',
  `USERID` varchar(45) NOT NULL COMMENT 'USERID',
  `USERNAME` varchar(200) NOT NULL COMMENT 'USERNAME',
  `DISPLAYNAME` varchar(45) DEFAULT NULL COMMENT 'DISPLAYNAME',
  `MESSAGE` varchar(200) DEFAULT NULL COMMENT 'MESSAGE',
  `SOURCEIP` varchar(45) DEFAULT NULL COMMENT 'LOGIN SOURCEIP ',
  `LOGINTYPE` varchar(45) DEFAULT NULL COMMENT 'LOGINTYPE',
  `CODE` varchar(45) DEFAULT NULL COMMENT 'CODE',
  `PROVIDER` varchar(45) DEFAULT NULL COMMENT 'PROVIDER',
  `BROWSER` varchar(45) DEFAULT NULL COMMENT 'BROWSER',
  `PLATFORM` varchar(45) DEFAULT NULL COMMENT 'PLATFORM',
  `APPLICATION` varchar(45) DEFAULT NULL COMMENT 'APPLICATION',
  `LOGINURL` varchar(450) DEFAULT NULL COMMENT 'LOGINURL',
  `LOGINTIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'LOGINTIME',
  `LOGOUTTIME` varchar(50) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LOGOUTTIME',
  `SESSIONSTATUS` int DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='history_login';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_history_login_apps`
--

DROP TABLE IF EXISTS `mxk_history_login_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_history_login_apps` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `SESSIONID` varchar(45) DEFAULT NULL COMMENT 'SESSIONID',
  `LOGINTIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'LOGINTIME',
  `APPID` varchar(45) NOT NULL COMMENT 'ACCESS APPID',
  `APPNAME` varchar(45) DEFAULT NULL COMMENT 'APPNAME',
  `USERID` varchar(45) DEFAULT NULL COMMENT 'USERID',
  `USERNAME` varchar(45) DEFAULT NULL COMMENT 'USERNAME',
  `DISPLAYNAME` varchar(45) DEFAULT NULL COMMENT 'DISPLAYNAME',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sign On apps Records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_history_logs`
--

DROP TABLE IF EXISTS `mxk_history_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_history_logs` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `SERVICENAME` varchar(100) DEFAULT NULL COMMENT 'SERVICENAME',
  `MESSAGE` varchar(200) DEFAULT NULL COMMENT 'MESSAGE',
  `OPERATETYPE` varchar(45) DEFAULT NULL COMMENT 'OPERATETYPE',
  `CONTENT` text COMMENT 'CONTENT JSON TYPE',
  `CREATEDDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'CREATEDDATE',
  `CREATEDBY` varchar(45) DEFAULT NULL COMMENT 'CREATEDBY',
  `MESSAGETYPE` varchar(45) DEFAULT NULL COMMENT 'MESSAGETYPE',
  `USERNAME` varchar(45) DEFAULT NULL COMMENT 'USERNAME',
  `CODE` varchar(45) DEFAULT NULL COMMENT 'CODE',
  `TID` varchar(45) DEFAULT NULL COMMENT 'TID',
  `TNAME` varchar(45) DEFAULT NULL COMMENT 'TNAME',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='USER OPERATE LOGS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_history_synchronizer`
--

DROP TABLE IF EXISTS `mxk_history_synchronizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_history_synchronizer` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `SYNCID` varchar(45) NOT NULL COMMENT 'SYNCID',
  `SYNCNAME` varchar(45) DEFAULT NULL COMMENT 'SYNCNAME',
  `OBJECTID` varchar(45) DEFAULT NULL COMMENT 'OBJECTID',
  `OBJECTNAME` varchar(45) DEFAULT NULL COMMENT 'OBJECTNAME',
  `OBJECTTYPE` varchar(45) DEFAULT NULL COMMENT 'OBJECTTYPE',
  `SYNCTIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'SYNCTIME',
  `RESULT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='synchronizer logs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_notices`
--

DROP TABLE IF EXISTS `mxk_notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_notices` (
  `ID` varchar(50) NOT NULL,
  `TITLE` varchar(400) DEFAULT NULL,
  `CONTENT` text,
  `STATUS` varchar(45) DEFAULT NULL,
  `CREATEDBY` varchar(45) DEFAULT NULL,
  `CREATEDDATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `MODIFIEDBY` varchar(45) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_organizations`
--

DROP TABLE IF EXISTS `mxk_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_organizations` (
  `ID` varchar(45) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `FULLNAME` varchar(100) DEFAULT NULL,
  `TYPE` varchar(45) DEFAULT NULL,
  `LEVEL` int unsigned DEFAULT NULL,
  `PARENTID` varchar(45) DEFAULT NULL,
  `PARENTNAME` varchar(45) DEFAULT NULL,
  `CODEPATH` varchar(500) DEFAULT NULL,
  `NAMEPATH` varchar(400) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `STATUS` tinyint unsigned DEFAULT NULL,
  `CREATEDBY` varchar(45) DEFAULT NULL,
  `CREATEDDATE` datetime DEFAULT NULL,
  `MODIFIEDBY` varchar(45) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `POSTALCODE` varchar(45) DEFAULT NULL,
  `PHONE` varchar(200) DEFAULT NULL,
  `FAX` varchar(200) DEFAULT NULL,
  `SORTINDEX` int unsigned DEFAULT '0',
  `DIVISION` varchar(45) DEFAULT NULL,
  `COUNTRY` varchar(45) DEFAULT NULL,
  `REGION` varchar(45) DEFAULT NULL,
  `LOCALITY` varchar(45) DEFAULT NULL,
  `STREET` varchar(45) DEFAULT NULL,
  `HASCHILD` varchar(45) DEFAULT NULL,
  `CONTACT` varchar(45) DEFAULT NULL,
  `CODE` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `LDAPDN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_organizations_cast`
--

DROP TABLE IF EXISTS `mxk_organizations_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_organizations_cast` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `CODE` varchar(45) DEFAULT NULL COMMENT '机构编码',
  `NAME` varchar(200) NOT NULL COMMENT '机构名称',
  `FULLNAME` varchar(100) DEFAULT NULL,
  `PARENTID` varchar(45) DEFAULT NULL COMMENT '父级ID',
  `PARENTNAME` varchar(45) DEFAULT NULL COMMENT '父级名称',
  `CODEPATH` varchar(500) DEFAULT NULL COMMENT 'CODE路径',
  `NAMEPATH` varchar(400) DEFAULT NULL COMMENT '名称路径',
  `SORTINDEX` int DEFAULT NULL,
  `STATUS` tinyint unsigned DEFAULT NULL,
  `PROVIDER` varchar(45) DEFAULT NULL COMMENT '机构提供者',
  `ORGID` varchar(45) DEFAULT NULL COMMENT 'MXK机构id',
  `ORGPARENTID` varchar(45) DEFAULT NULL COMMENT 'MXK机构PARENTID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_password_policy`
--

DROP TABLE IF EXISTS `mxk_password_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_password_policy` (
  `ID` varchar(45) NOT NULL,
  `MINLENGTH` tinyint unsigned DEFAULT '0' COMMENT 'MINLENGTH',
  `MAXLENGTH` tinyint unsigned DEFAULT '0' COMMENT 'MAXLENGTH',
  `LOWERCASE` tinyint unsigned DEFAULT '0' COMMENT 'LOWERCASE',
  `UPPERCASE` tinyint unsigned DEFAULT '0' COMMENT 'UPPERCASE',
  `DIGITS` tinyint unsigned DEFAULT '0' COMMENT 'DIGITS',
  `SPECIALCHAR` tinyint unsigned DEFAULT '0' COMMENT 'SPECIALCHAR',
  `ATTEMPTS` tinyint unsigned DEFAULT '0' COMMENT 'ATTEMPTS LOGIN FOR LOCK',
  `DURATION` tinyint unsigned DEFAULT '0' COMMENT 'DURATION ',
  `EXPIRATION` tinyint unsigned DEFAULT '0' COMMENT 'PASSWORD EXPIRATION',
  `USERNAME` tinyint unsigned DEFAULT '0' COMMENT 'USERNAME IN PASSWORD',
  `HISTORY` tinyint DEFAULT '0' COMMENT 'SIMPLEPASSWORDS NOT USE FOR PASSWORD',
  `DICTIONARY` tinyint DEFAULT NULL,
  `ALPHABETICAL` tinyint DEFAULT NULL,
  `NUMERICAL` tinyint DEFAULT NULL,
  `QWERTY` tinyint DEFAULT NULL,
  `OCCURANCES` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='password policy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_resources`
--

DROP TABLE IF EXISTS `mxk_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_resources` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `RESOURCETYPE` varchar(50) DEFAULT NULL,
  `RESOURCEURL` varchar(500) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `CREATEDBY` varchar(45) DEFAULT NULL,
  `CREATEDDATE` varchar(45) DEFAULT NULL,
  `MODIFIEDBY` varchar(45) DEFAULT NULL,
  `MODIFIEDDATE` varchar(45) DEFAULT NULL,
  `parentId` varchar(50) DEFAULT NULL,
  `parentname` varchar(200) DEFAULT NULL,
  `APPID` varchar(50) DEFAULT NULL,
  `RESOURCEACTION` varchar(200) DEFAULT NULL,
  `RESOURCEICON` varchar(100) DEFAULT NULL,
  `RESOURCESTYLE` varchar(500) DEFAULT NULL,
  `SORTINDEX` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_role_member`
--

DROP TABLE IF EXISTS `mxk_role_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_role_member` (
  `ID` varchar(100) NOT NULL DEFAULT '' COMMENT 'ID',
  `ROLEID` varchar(45) NOT NULL COMMENT 'ROLEID',
  `MEMBERID` varchar(45) NOT NULL COMMENT 'USERID OR ROLEID',
  `TYPE` varchar(45) NOT NULL COMMENT 'TYPE USER OR ROLE',
  `CREATEDDATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_role_permissions`
--

DROP TABLE IF EXISTS `mxk_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_role_permissions` (
  `id` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `roleid` varchar(50) DEFAULT NULL,
  `resourceid` varchar(50) DEFAULT NULL,
  `CREATEDBY` varchar(45) DEFAULT NULL,
  `CREATEDDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_roles`
--

DROP TABLE IF EXISTS `mxk_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_roles` (
  `ID` varchar(45) NOT NULL COMMENT 'ID',
  `NAME` varchar(100) DEFAULT NULL COMMENT 'ROLE NAME',
  `DYNAMIC` varchar(45) DEFAULT NULL,
  `FILTERS` text,
  `ORGIDSLIST` text,
  `STATUS` tinyint unsigned DEFAULT NULL COMMENT 'STATUS',
  `CREATEDBY` varchar(45) DEFAULT NULL COMMENT 'CREATEDBY',
  `ISDEFAULT` tinyint unsigned DEFAULT NULL COMMENT 'ISDEFAULT',
  `CREATEDDATE` date DEFAULT NULL COMMENT 'CREATEDDATE',
  `MODIFIEDBY` varchar(45) DEFAULT NULL COMMENT 'MODIFIEDBY',
  `MODIFIEDDATE` date DEFAULT NULL COMMENT 'MODIFIEDDATE',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT 'DESCRIPTION',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_socials_associate`
--

DROP TABLE IF EXISTS `mxk_socials_associate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_socials_associate` (
  `ID` varchar(45) NOT NULL,
  `USERID` varchar(45) NOT NULL COMMENT 'USERID',
  `USERNAME` varchar(45) NOT NULL,
  `PROVIDER` varchar(45) NOT NULL COMMENT 'PROVIDER',
  `SOCIALUSERINFO` text COMMENT 'SOCIALUSERINFO',
  `SOCIALUSERID` varchar(100) NOT NULL COMMENT 'SOCIALUSERID',
  `EXATTRIBUTE` text,
  `ACCESSTOKEN` text,
  `CREATEDDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATEDDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TRANSMISSION` varchar(45) DEFAULT 'automatic',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='socialsignon USER BIND';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_socials_provider`
--

DROP TABLE IF EXISTS `mxk_socials_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_socials_provider` (
  `ID` varchar(45) NOT NULL,
  `provider` varchar(45) DEFAULT NULL,
  `providername` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `clientid` varchar(100) DEFAULT NULL,
  `clientsecret` varchar(400) DEFAULT NULL,
  `agentId` varchar(45) DEFAULT NULL,
  `hidden` varchar(45) DEFAULT 'false',
  `sortIndex` int DEFAULT '1',
  `status` int DEFAULT '1',
  `CREATEDBY` varchar(45) DEFAULT NULL,
  `CREATEDDATE` varchar(45) DEFAULT NULL,
  `MODIFIEDBY` varchar(45) DEFAULT NULL,
  `MODIFIEDDATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_synchronizers`
--

DROP TABLE IF EXISTS `mxk_synchronizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_synchronizers` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `service` varchar(45) DEFAULT NULL,
  `sourcetype` varchar(45) DEFAULT NULL,
  `scheduler` varchar(45) DEFAULT NULL,
  `providerurl` varchar(400) DEFAULT NULL,
  `driverclass` varchar(400) DEFAULT NULL,
  `principal` varchar(200) DEFAULT NULL,
  `credentials` varchar(200) DEFAULT NULL,
  `RESUMETIME` varchar(45) DEFAULT NULL,
  `SUSPENDTIME` varchar(45) DEFAULT NULL,
  `filters` varchar(400) DEFAULT NULL,
  `basedn` varchar(45) DEFAULT NULL,
  `msaddomain` varchar(45) DEFAULT NULL,
  `sslswitch` varchar(45) DEFAULT NULL,
  `truststore` varchar(45) DEFAULT NULL,
  `truststorepassword` varchar(45) DEFAULT NULL,
  `SYNCSTARTTIME` int DEFAULT '0' COMMENT '同步时间范围（单位天）',
  `STATUS` varchar(45) DEFAULT NULL,
  `CREATEDBY` varchar(45) DEFAULT NULL,
  `CREATEDDATE` varchar(45) DEFAULT NULL,
  `MODIFIEDDATE` varchar(45) DEFAULT NULL,
  `MODIFIEDBY` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步器';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_userinfo`
--

DROP TABLE IF EXISTS `mxk_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_userinfo` (
  `ID` varchar(45) NOT NULL COMMENT '编号',
  `USERNAME` varchar(100) NOT NULL COMMENT '登录名',
  `PASSWORD` varchar(200) NOT NULL COMMENT '密码',
  `DECIPHERABLE` varchar(200) NOT NULL COMMENT 'DE密码',
  `AUTHNTYPE` tinyint unsigned DEFAULT NULL COMMENT '认证类型',
  `MOBILE` varchar(45) DEFAULT NULL COMMENT '手机号码',
  `MOBILEVERIFIED` varchar(45) DEFAULT NULL COMMENT '手机号验证',
  `EMAIL` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `EMAILVERIFIED` smallint unsigned DEFAULT NULL COMMENT '邮箱验证',
  `DISPLAYNAME` varchar(45) DEFAULT NULL COMMENT '显示名称',
  `NICKNAME` varchar(45) DEFAULT NULL COMMENT '昵称',
  `PICTURE` blob COMMENT '头像',
  `TIMEZONE` varchar(45) DEFAULT NULL COMMENT '时区',
  `LOCALE` varchar(45) DEFAULT NULL COMMENT '地址',
  `PREFERREDLANGUAGE` varchar(45) DEFAULT NULL COMMENT '语言偏好',
  `PASSWORDQUESTION` varchar(45) DEFAULT NULL COMMENT '密码问题',
  `PASSWORDANSWER` varchar(45) DEFAULT NULL COMMENT '密码答案',
  `APPLOGINAUTHNTYPE` tinyint unsigned DEFAULT '0' COMMENT '应用登录认证类型',
  `APPLOGINPASSWORD` varchar(45) DEFAULT NULL COMMENT '应用登录密码',
  `PROTECTEDAPPS` varchar(450) DEFAULT NULL COMMENT '应用登录密码保护应用',
  `THEME` varchar(45) DEFAULT 'default' COMMENT '主题',
  `GRIDLIST` tinyint unsigned DEFAULT '0' COMMENT '应用列表类型',
  `LOGINCOUNT` int unsigned DEFAULT '0' COMMENT '登录次数统计',
  `ONLINE` tinyint unsigned DEFAULT NULL COMMENT '在线状态',
  `STATUS` tinyint unsigned DEFAULT NULL COMMENT '用户状态',
  `ISLOCKED` tinyint unsigned DEFAULT NULL COMMENT '锁定状态',
  `UNLOCKTIME` datetime DEFAULT '2020-01-01 01:01:01' COMMENT '解锁时间',
  `LASTLOGINIP` varchar(45) DEFAULT NULL COMMENT '最近登录IP地址',
  `LASTLOGINTIME` datetime DEFAULT '2020-01-01 01:01:01' COMMENT '最近登录时间',
  `LASTLOGOFFTIME` datetime DEFAULT '2020-01-01 01:01:01' COMMENT '最近注销时间',
  `BADPASSWORDTIME` datetime DEFAULT '2020-01-01 01:01:01' COMMENT '最近密码错误时间',
  `BADPASSWORDCOUNT` smallint unsigned DEFAULT NULL COMMENT '密码错误次数',
  `PASSWORDLASTSETTIME` datetime DEFAULT '2020-01-01 01:01:01' COMMENT '最近密码修改时间',
  `PASSWORDSETTYPE` tinyint unsigned DEFAULT '0' COMMENT '密码重置类型',
  `SHAREDSECRET` varchar(500) DEFAULT NULL COMMENT 'TIME-OPT密钥',
  `SHAREDCOUNTER` varchar(45) DEFAULT '0' COMMENT 'COUNTER-OPT密钥',
  `USERTYPE` varchar(45) DEFAULT NULL COMMENT '用户类型',
  `USERSTATE` varchar(45) DEFAULT NULL,
  `EMPLOYEENUMBER` varchar(45) DEFAULT NULL COMMENT '工号',
  `WINDOWSACCOUNT` varchar(45) DEFAULT NULL COMMENT 'AD域账号',
  `DIVISION` varchar(45) DEFAULT NULL COMMENT '分支',
  `COSTCENTER` varchar(45) DEFAULT NULL COMMENT '成本中心',
  `ORGANIZATION` varchar(45) DEFAULT NULL COMMENT '机构',
  `DEPARTMENTID` varchar(45) DEFAULT NULL COMMENT '部门编号',
  `DEPARTMENT` varchar(45) DEFAULT NULL COMMENT '部门',
  `JOBTITLE` varchar(45) DEFAULT NULL COMMENT '职务',
  `JOBLEVEL` varchar(45) DEFAULT NULL COMMENT '工作职级',
  `MANAGERID` varchar(45) DEFAULT NULL COMMENT '经理编号',
  `MANAGER` varchar(45) DEFAULT NULL COMMENT '经理名字',
  `ASSISTANTID` varchar(45) DEFAULT NULL COMMENT '助理编号',
  `ASSISTANT` varchar(45) DEFAULT NULL COMMENT '助理名字',
  `ENTRYDATE` varchar(45) DEFAULT NULL COMMENT '入司时间',
  `STARTWORKDATE` varchar(45) DEFAULT NULL COMMENT '开始工作时间',
  `QUITDATE` varchar(45) DEFAULT NULL COMMENT '离职日期',
  `SORTORDER` tinyint unsigned DEFAULT '0' COMMENT '部门内排序',
  `WORKEMAIL` varchar(45) DEFAULT NULL COMMENT '工作-邮件',
  `WORKPHONENUMBER` varchar(45) DEFAULT NULL COMMENT '工作-电话',
  `WORKCOUNTRY` varchar(45) DEFAULT NULL COMMENT '工作-国家',
  `WORKREGION` varchar(45) DEFAULT NULL COMMENT '工作-省/市',
  `WORKLOCALITY` varchar(45) DEFAULT NULL COMMENT '工作-城市',
  `WORKSTREETADDRESS` varchar(45) DEFAULT NULL COMMENT '工作-街道',
  `WORKADDRESSFORMATTED` varchar(45) DEFAULT NULL COMMENT '工作-地址全称',
  `WORKPOSTALCODE` varchar(45) DEFAULT NULL COMMENT '工作-邮编',
  `WORKFAX` varchar(45) DEFAULT NULL COMMENT '工作-传真',
  `WORKOFFICENAME` varchar(500) DEFAULT NULL,
  `GIVENNAME` varchar(45) DEFAULT NULL COMMENT '名',
  `MIDDLENAME` varchar(45) DEFAULT NULL COMMENT '中间名',
  `FAMILYNAME` varchar(45) DEFAULT NULL COMMENT '姓',
  `HONORIFICPREFIX` varchar(45) DEFAULT NULL COMMENT '前缀',
  `HONORIFICSUFFIX` varchar(45) DEFAULT NULL COMMENT '后缀',
  `FORMATTEDNAME` varchar(400) DEFAULT NULL COMMENT '用户全名',
  `IDTYPE` tinyint unsigned DEFAULT '0' COMMENT '证件类型',
  `IDCARDNO` varchar(45) DEFAULT NULL COMMENT '证件号码',
  `MARRIED` tinyint unsigned DEFAULT '0' COMMENT '婚姻状态',
  `BIRTHDATE` varchar(45) DEFAULT NULL COMMENT '生日',
  `NAMEZHSPELL` varchar(100) DEFAULT NULL COMMENT '名字中文拼音',
  `NAMEZHSHORTSPELL` varchar(45) DEFAULT NULL COMMENT '名字中文拼音简称',
  `GENDER` tinyint unsigned DEFAULT NULL COMMENT '性别',
  `WEBSITE` varchar(50) DEFAULT NULL COMMENT '个人主页',
  `WEIXINFOLLOW` tinyint unsigned DEFAULT NULL COMMENT '微信关注',
  `DEFINEIM` varchar(45) DEFAULT NULL COMMENT 'IM账号',
  `HOMEEMAIL` varchar(45) DEFAULT NULL COMMENT '家庭-邮件',
  `HOMEPHONENUMBER` varchar(45) DEFAULT NULL COMMENT '家庭-电话',
  `HOMECOUNTRY` varchar(45) DEFAULT NULL COMMENT '家庭-省/市',
  `HOMEREGION` varchar(45) DEFAULT NULL COMMENT '家庭-市',
  `HOMELOCALITY` varchar(45) DEFAULT NULL COMMENT '家庭-区',
  `HOMESTREETADDRESS` varchar(45) DEFAULT NULL COMMENT '家庭-街道',
  `HOMEADDRESSFORMATTED` varchar(45) DEFAULT NULL COMMENT '家庭-地址全称',
  `HOMEPOSTALCODE` varchar(45) DEFAULT NULL COMMENT '家庭-邮编',
  `HOMEFAX` varchar(45) DEFAULT NULL COMMENT '家庭-传真',
  `EXTRAATTRIBUTE` varchar(4000) DEFAULT NULL COMMENT '用户扩展属性',
  `CREATEDBY` varchar(45) DEFAULT NULL COMMENT '创建人',
  `CREATEDDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIEDBY` varchar(45) DEFAULT NULL COMMENT '修改人',
  `MODIFIEDDATE` datetime DEFAULT NULL COMMENT '修改时间',
  `DESCRIPTION` varchar(400) DEFAULT NULL COMMENT '描述',
  `LDAPDN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME_UNIQUE` (`USERNAME`) /*!80000 INVISIBLE */,
  UNIQUE KEY `MOBILE_UNIQUE` (`MOBILE`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`),
  KEY `EMPLOYEENUMBER_UNIQUE` (`EMPLOYEENUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='USER INFO DEFINE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mxk_userinfo_adjunct`
--

DROP TABLE IF EXISTS `mxk_userinfo_adjunct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mxk_userinfo_adjunct` (
  `ID` varchar(45) NOT NULL COMMENT '编号',
  `USERID` varchar(45) NOT NULL COMMENT '用户编号',
  `ORGANIZATION` varchar(45) DEFAULT NULL COMMENT '机构',
  `DEPARTMENTID` varchar(45) DEFAULT NULL COMMENT '部门编号',
  `DEPARTMENT` varchar(45) DEFAULT NULL COMMENT '部门',
  `JOBTITLE` varchar(45) DEFAULT NULL COMMENT '职务',
  `JOBLEVEL` varchar(45) DEFAULT NULL COMMENT '工作职级',
  `MANAGERID` varchar(45) DEFAULT NULL COMMENT '经理编号',
  `MANAGER` varchar(45) DEFAULT NULL COMMENT '经理名字',
  `ASSISTANTID` varchar(45) DEFAULT NULL COMMENT '助理编号',
  `ASSISTANT` varchar(45) DEFAULT NULL COMMENT '助理名字',
  `ENTRYDATE` varchar(45) DEFAULT NULL COMMENT '入司时间',
  `STARTWORKDATE` varchar(45) DEFAULT NULL COMMENT '开始工作时间',
  `QUITDATE` varchar(45) DEFAULT NULL COMMENT '离职日期',
  `SORTORDER` tinyint unsigned DEFAULT '0' COMMENT '部门内排序',
  `WORKEMAIL` varchar(45) DEFAULT NULL COMMENT '工作-邮件',
  `WORKPHONENUMBER` varchar(45) DEFAULT NULL COMMENT '工作-电话',
  `WORKCOUNTRY` varchar(45) DEFAULT NULL COMMENT '工作-国家',
  `WORKREGION` varchar(45) DEFAULT NULL COMMENT '工作-省/市',
  `WORKLOCALITY` varchar(45) DEFAULT NULL COMMENT '工作-城市',
  `WORKSTREETADDRESS` varchar(45) DEFAULT NULL COMMENT '工作-街道',
  `WORKADDRESSFORMATTED` varchar(45) DEFAULT NULL COMMENT '工作-地址全称',
  `WORKPOSTALCODE` varchar(45) DEFAULT NULL COMMENT '工作-邮编',
  `WORKFAX` varchar(45) DEFAULT NULL COMMENT '工作-传真',
  `CREATEDBY` varchar(45) DEFAULT NULL COMMENT '创建人',
  `CREATEDDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIEDBY` varchar(45) DEFAULT NULL COMMENT '修改人',
  `MODIFIEDDATE` datetime DEFAULT NULL COMMENT '修改时间',
  `DESCRIPTION` varchar(400) DEFAULT NULL COMMENT '描述',
  `COSTCENTER` varchar(45) DEFAULT NULL,
  `DIVISION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='USER INFO Adjunct';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-02 19:49:15
