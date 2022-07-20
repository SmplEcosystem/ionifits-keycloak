-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: keycloak
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB-1:10.6.4+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text DEFAULT NULL,
  `REPRESENTATION` text DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
INSERT INTO `ASSOCIATED_POLICY` VALUES
('05f947f0-ddf0-4ada-935d-69ebaa44c158','6c39d3e1-7cee-4c9b-ac98-73c208a5abb6');
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES
('0a5b4d86-9c69-4f4b-ae0e-904086dc1ccf',NULL,NULL,'master','306a729e-c149-482f-b71a-e8841a3caabe',0,20,'','11337475-d6f1-4fe4-a4f5-3f2a227d3d80',NULL),
('0bdd98f4-8648-4ed0-b4af-7838568cbe25',NULL,'http-basic-authenticator','master','36c04034-2bf0-43b1-99b6-60ea8213f5a8',0,10,'\0',NULL,NULL),
('0d27bdc0-e9fa-4d0b-88e7-1dbef9b1e349',NULL,'auth-otp-form','master','093c6ff9-3c87-4d3b-baec-4a7ad911a8bd',0,20,'\0',NULL,NULL),
('0dcec0b3-5ef8-40c0-bc9e-b20ee9dacf48',NULL,'client-secret-jwt','master','4ffc4fff-0e3f-484f-8155-f1866b163c69',2,30,'\0',NULL,NULL),
('150635f7-21f0-4a66-99c9-fe8ef1c7366a',NULL,NULL,'SmplFinance','e0c570d2-d128-4d2c-9d5f-77d142ff92f2',1,20,'','8f44f5dc-c212-4f28-9a0f-9dadc200c9e1',NULL),
('16dd5346-43fd-4bff-af74-45d6203eb260',NULL,'docker-http-basic-authenticator','master','54909597-eb73-4c96-a353-5f2ae979fb25',0,10,'\0',NULL,NULL),
('172cd880-af9c-4edc-93a4-5edf4e777e91',NULL,'conditional-user-configured','master','2accd7c6-af27-492d-8d44-707daf51b912',0,10,'\0',NULL,NULL),
('17e140b1-6593-4cde-9525-56b14b783324',NULL,NULL,'SmplFinance','e1862423-b184-424d-9a17-ef398e7f2d9d',1,40,'','02ade49f-92ce-47e3-997c-e23df4488d23',NULL),
('1c4e12bd-4fa5-49b9-b650-77bdc4cfcf6f',NULL,'no-cookie-redirect','SmplFinance','7edc24f8-7231-4d66-8b59-93afc1bea41b',0,10,'\0',NULL,NULL),
('1cafd3e5-6e2b-4095-986b-06a8f74de7e5',NULL,'identity-provider-redirector','SmplFinance','4ca1f4c0-395c-453c-9153-1e0af79079ca',2,25,'\0',NULL,NULL),
('276138f9-06d3-42f9-8d6d-ed67e8ca3fc9',NULL,'reset-credential-email','SmplFinance','e1862423-b184-424d-9a17-ef398e7f2d9d',0,20,'\0',NULL,NULL),
('2ab49a0b-dd8c-45ff-8b1e-faaa3a6a0e48',NULL,'reset-otp','SmplFinance','02ade49f-92ce-47e3-997c-e23df4488d23',0,20,'\0',NULL,NULL),
('32e2007b-c041-4459-870a-3bdb7349765a',NULL,'client-jwt','SmplFinance','2f8dc40a-4c8e-40d5-8f9d-11b0de919c78',2,20,'\0',NULL,NULL),
('335bbead-efc2-46ac-811d-b6a93c1a6b13',NULL,'client-x509','master','4ffc4fff-0e3f-484f-8155-f1866b163c69',2,40,'\0',NULL,NULL),
('33a6de85-a5b5-4aee-9fc3-e1a3f201f76a',NULL,NULL,'SmplFinance','0b201889-e580-43ea-9d8b-d82d586215d7',1,20,'','bfafe0df-06bc-422d-8275-9fb1960a402e',NULL),
('39398125-ba8c-4659-ac33-16a7e1dcfc18',NULL,'identity-provider-redirector','master','a454be13-d159-4b18-8574-2d901fb5b81e',2,25,'\0',NULL,NULL),
('3b4fc05c-2a3b-4f71-a270-9648b6df0acd',NULL,'http-basic-authenticator','SmplFinance','6d3ef492-4aa6-4bb4-803b-56e7bb546891',0,10,'\0',NULL,NULL),
('3d60e099-988c-4b16-a2d6-7c3a4b2b15b8',NULL,'client-secret-jwt','SmplFinance','2f8dc40a-4c8e-40d5-8f9d-11b0de919c78',2,30,'\0',NULL,NULL),
('3db94160-935c-47fd-b197-2c871764d36a',NULL,'docker-http-basic-authenticator','SmplFinance','9da874d4-52a8-40b4-b4fd-71a0296d4b62',0,10,'\0',NULL,NULL),
('3e13cf11-2020-42eb-95cc-7d8d4faf6475',NULL,'auth-username-password-form','master','c9fad5a7-883b-4214-b2e7-1b0d6aefc772',0,10,'\0',NULL,NULL),
('44438cdd-33d7-48ad-bdb0-e32a948a65b0',NULL,'basic-auth','master','3683e797-9bdf-4e5f-ac78-63d0da666337',0,10,'\0',NULL,NULL),
('44fd7adc-cf3f-48b1-9fed-906c5cbb2510',NULL,NULL,'master','5772d09a-ae3f-455d-af79-cfe105520cc4',1,30,'','96c67238-bab1-4b7d-8629-925d22c2d0dd',NULL),
('49be414f-42d6-47d9-837b-2b6c3c70820d',NULL,NULL,'SmplFinance','1e537313-14fe-41f0-80ad-794da77dc84a',2,20,'','43117ace-0be4-4171-9b96-b0a391a114e2',NULL),
('4a13f7c9-0a76-4940-88c8-73bbe53ad454',NULL,NULL,'master','5a865c62-2ab5-4afc-bda9-49d8ba7c2755',0,20,'','d4d898f9-be1b-461a-bc64-809fbaa8f9a7',NULL),
('4b7bd91d-0dfd-4561-ab16-b828d16cfbb4',NULL,'client-secret','master','4ffc4fff-0e3f-484f-8155-f1866b163c69',2,10,'\0',NULL,NULL),
('4c642da7-19b6-42a9-bb33-879fcf472268',NULL,'auth-spnego','master','3683e797-9bdf-4e5f-ac78-63d0da666337',3,30,'\0',NULL,NULL),
('524783bb-66bb-43d9-9950-ead366eb6ce0',NULL,'idp-create-user-if-unique','SmplFinance','1e537313-14fe-41f0-80ad-794da77dc84a',2,10,'\0',NULL,'c8e38fc2-62e4-4a4b-ba42-563341eb4142'),
('52839839-b443-43bd-9491-0af465fc2daa',NULL,'conditional-user-configured','master','40d7bbb5-dd62-4476-b6e4-e700fc2e0b18',0,10,'\0',NULL,NULL),
('57f26416-31d0-4eb7-8730-7d4006ab1569',NULL,'auth-otp-form','master','40d7bbb5-dd62-4476-b6e4-e700fc2e0b18',0,20,'\0',NULL,NULL),
('5a2ce298-2c4d-4aff-b1b2-504e54f3830d',NULL,'client-x509','SmplFinance','2f8dc40a-4c8e-40d5-8f9d-11b0de919c78',2,40,'\0',NULL,NULL),
('5c990409-fc28-49bd-b0d9-2c375040fdb3',NULL,'client-secret','SmplFinance','2f8dc40a-4c8e-40d5-8f9d-11b0de919c78',2,10,'\0',NULL,NULL),
('5fe9dead-b14b-419a-959e-1db33f76b9fd',NULL,'no-cookie-redirect','master','4999cc49-7a79-4eb7-a85a-c75fbac14d63',0,10,'\0',NULL,NULL),
('657d91a3-6b82-4abd-b77d-7f6a7c1dbf32',NULL,NULL,'master','c9fad5a7-883b-4214-b2e7-1b0d6aefc772',1,20,'','093c6ff9-3c87-4d3b-baec-4a7ad911a8bd',NULL),
('676005b3-7d9a-4259-9659-cdc9ea6eeaa4',NULL,'conditional-user-configured','SmplFinance','8f44f5dc-c212-4f28-9a0f-9dadc200c9e1',0,10,'\0',NULL,NULL),
('6806cacc-6bdd-4047-807e-a18e1ec66b6e',NULL,'registration-password-action','master','0d121f94-f45d-4d66-a765-10ec5e5a8bd1',0,50,'\0',NULL,NULL),
('68bb49c8-1393-4b72-a18a-45da160d0373',NULL,'registration-recaptcha-action','SmplFinance','d090b27a-f306-4b7c-a50e-166ed098bff2',3,60,'\0',NULL,NULL),
('692ab60e-781c-4462-8548-af1af199fa35',NULL,NULL,'master','11337475-d6f1-4fe4-a4f5-3f2a227d3d80',2,20,'','5a865c62-2ab5-4afc-bda9-49d8ba7c2755',NULL),
('6df8e598-4bc2-4ec2-b455-876745e5eb52',NULL,NULL,'SmplFinance','43117ace-0be4-4171-9b96-b0a391a114e2',0,20,'','c7999d55-841a-43f5-ad92-01f5a0735468',NULL),
('6fb081c8-d4cb-4ada-968f-b851943ef86f',NULL,NULL,'SmplFinance','c7999d55-841a-43f5-ad92-01f5a0735468',2,20,'','e0c570d2-d128-4d2c-9d5f-77d142ff92f2',NULL),
('722d8e0f-b34b-40eb-b1ef-1d1c6e3f8dcf',NULL,'idp-email-verification','master','d4d898f9-be1b-461a-bc64-809fbaa8f9a7',2,10,'\0',NULL,NULL),
('7d9524aa-f91f-4b43-9b1a-1c84f6be2760',NULL,'registration-page-form','SmplFinance','64df7727-7f38-49b6-98c6-d9cb6cbc3040',0,10,'','d090b27a-f306-4b7c-a50e-166ed098bff2',NULL),
('7e346cce-e41a-4ef5-b839-b122fd176299',NULL,NULL,'SmplFinance','7edc24f8-7231-4d66-8b59-93afc1bea41b',0,20,'','13c3640c-e182-41ed-8da3-531e30c9135b',NULL),
('8013f54b-876b-48dd-b47b-dc536715509a',NULL,'idp-review-profile','master','306a729e-c149-482f-b71a-e8841a3caabe',0,10,'\0',NULL,'e8497750-1e55-4e70-bf58-23b9705096d8'),
('80c3b0c1-fe28-4102-a1f4-83d51a2e975a',NULL,NULL,'master','179ff1e1-8b65-4bb5-adb4-b9212e514651',1,20,'','40d7bbb5-dd62-4476-b6e4-e700fc2e0b18',NULL),
('83456a68-fda1-40b1-9377-4cf7b3e17bc4',NULL,'auth-spnego','SmplFinance','4ca1f4c0-395c-453c-9153-1e0af79079ca',3,20,'\0',NULL,NULL),
('87cbd1cd-20fd-4d81-9aa2-4f2a6946e49f',NULL,'auth-otp-form','SmplFinance','8f44f5dc-c212-4f28-9a0f-9dadc200c9e1',0,20,'\0',NULL,NULL),
('894633a2-9213-470e-85d5-c95fe4bc6e62',NULL,'direct-grant-validate-username','master','5772d09a-ae3f-455d-af79-cfe105520cc4',0,10,'\0',NULL,NULL),
('94e31278-7874-44ed-961b-259d8b54df55',NULL,'conditional-user-configured','SmplFinance','2b0c52da-627b-42a0-aa4d-8cb4de13a52a',0,10,'\0',NULL,NULL),
('972303ae-db0e-43c2-bf41-0ef32764d0c8',NULL,'registration-page-form','master','c3fa5245-e73b-4f1e-96c2-ffd3d740b9b4',0,10,'','0d121f94-f45d-4d66-a765-10ec5e5a8bd1',NULL),
('972b597c-9bdd-427f-bf93-133260796fbf',NULL,'reset-credentials-choose-user','master','9a3b5e89-14e7-4131-8632-1c68e0fb44a4',0,10,'\0',NULL,NULL),
('977f3b70-0731-4903-a6d6-3be2da4adedb',NULL,'idp-username-password-form','SmplFinance','e0c570d2-d128-4d2c-9d5f-77d142ff92f2',0,10,'\0',NULL,NULL),
('9895aad6-cfa3-4962-813c-ab6d464b5a41',NULL,'registration-password-action','SmplFinance','d090b27a-f306-4b7c-a50e-166ed098bff2',0,50,'\0',NULL,NULL),
('98f09ccb-700e-41b6-b5c4-3a3317994626',NULL,'idp-email-verification','SmplFinance','c7999d55-841a-43f5-ad92-01f5a0735468',2,10,'\0',NULL,NULL),
('9d0d9526-bb89-47cb-ab40-1b850e12109e',NULL,'idp-confirm-link','SmplFinance','43117ace-0be4-4171-9b96-b0a391a114e2',0,10,'\0',NULL,NULL),
('a0dee093-2a20-4fd2-a4d9-4f6a914779ff',NULL,'reset-otp','master','2accd7c6-af27-492d-8d44-707daf51b912',0,20,'\0',NULL,NULL),
('a3a4b751-6530-450b-a408-709c12108836',NULL,'auth-cookie','SmplFinance','4ca1f4c0-395c-453c-9153-1e0af79079ca',2,10,'\0',NULL,NULL),
('a407f2e3-8c6d-45e3-b985-480e133d3b3e',NULL,'registration-recaptcha-action','master','0d121f94-f45d-4d66-a765-10ec5e5a8bd1',3,60,'\0',NULL,NULL),
('a7988247-1e1d-49b8-97f1-3bd35421d19c',NULL,'idp-create-user-if-unique','master','11337475-d6f1-4fe4-a4f5-3f2a227d3d80',2,10,'\0',NULL,'46b8164d-fe83-4a07-8ec2-429107c16ce5'),
('a95aaaa5-24aa-4986-9fcf-e439775da730',NULL,NULL,'SmplFinance','597d36b7-2f72-428d-90f1-2b76f573b2ab',1,30,'','2b0c52da-627b-42a0-aa4d-8cb4de13a52a',NULL),
('ad6e749f-bc55-4e7b-9e8c-04bfc6e9168f',NULL,NULL,'master','a454be13-d159-4b18-8574-2d901fb5b81e',2,30,'','c9fad5a7-883b-4214-b2e7-1b0d6aefc772',NULL),
('afbdad47-0a0f-4752-871d-1e16c75f5beb',NULL,NULL,'master','9a3b5e89-14e7-4131-8632-1c68e0fb44a4',1,40,'','2accd7c6-af27-492d-8d44-707daf51b912',NULL),
('b0a5f77e-1742-4c55-a26e-3025a3c4305d',NULL,'basic-auth-otp','SmplFinance','13c3640c-e182-41ed-8da3-531e30c9135b',3,20,'\0',NULL,NULL),
('b22814d6-3b39-49f5-b273-bc18b280d595',NULL,'reset-password','master','9a3b5e89-14e7-4131-8632-1c68e0fb44a4',0,30,'\0',NULL,NULL),
('b2674449-e507-4fb9-897c-d643080cbfd9',NULL,'direct-grant-validate-username','SmplFinance','597d36b7-2f72-428d-90f1-2b76f573b2ab',0,10,'\0',NULL,NULL),
('b78f0790-12a8-446a-a10a-17f26bd94f0f',NULL,'registration-profile-action','master','0d121f94-f45d-4d66-a765-10ec5e5a8bd1',0,40,'\0',NULL,NULL),
('b93c7788-586b-4887-872d-58773a7e4aee',NULL,'conditional-user-configured','SmplFinance','bfafe0df-06bc-422d-8275-9fb1960a402e',0,10,'\0',NULL,NULL),
('b9558eed-6d9e-4781-9ce7-040adc29ea42',NULL,'direct-grant-validate-password','master','5772d09a-ae3f-455d-af79-cfe105520cc4',0,20,'\0',NULL,NULL),
('bc513aeb-b6f5-4a51-ac2e-86da22972adf',NULL,'auth-spnego','master','a454be13-d159-4b18-8574-2d901fb5b81e',3,20,'\0',NULL,NULL),
('c0ff2670-0fc4-4db3-b0dc-1a81057ddef8',NULL,'direct-grant-validate-otp','SmplFinance','2b0c52da-627b-42a0-aa4d-8cb4de13a52a',0,20,'\0',NULL,NULL),
('c10ced25-b0b2-4165-a4d5-45a1453342df',NULL,'registration-profile-action','SmplFinance','d090b27a-f306-4b7c-a50e-166ed098bff2',0,40,'\0',NULL,NULL),
('c2200b0e-1c79-42e6-af23-111884e19745',NULL,'basic-auth','SmplFinance','13c3640c-e182-41ed-8da3-531e30c9135b',0,10,'\0',NULL,NULL),
('c3890148-1fcd-4ef8-9c71-dc9d7ca96651',NULL,'reset-password','SmplFinance','e1862423-b184-424d-9a17-ef398e7f2d9d',0,30,'\0',NULL,NULL),
('c6e27a9a-a276-4fb4-8d67-9af38b054497',NULL,NULL,'SmplFinance','e4586902-1fa3-49b4-97c8-b01a00a36f4a',0,20,'','1e537313-14fe-41f0-80ad-794da77dc84a',NULL),
('ca73db8f-0ebf-4b13-a8e3-88d6f2ee7108',NULL,'auth-otp-form','SmplFinance','bfafe0df-06bc-422d-8275-9fb1960a402e',0,20,'\0',NULL,NULL),
('cb916777-cc0b-4f93-98ed-70c2d9f3f6e2',NULL,NULL,'master','d4d898f9-be1b-461a-bc64-809fbaa8f9a7',2,20,'','179ff1e1-8b65-4bb5-adb4-b9212e514651',NULL),
('d10c0aa3-783c-489b-a692-1495d6264421',NULL,'auth-spnego','SmplFinance','13c3640c-e182-41ed-8da3-531e30c9135b',3,30,'\0',NULL,NULL),
('d40d523a-fea8-49a2-8e33-ed44e87513b4',NULL,'direct-grant-validate-password','SmplFinance','597d36b7-2f72-428d-90f1-2b76f573b2ab',0,20,'\0',NULL,NULL),
('da813be8-9d22-4e20-af61-c8d1ecc544db',NULL,'idp-review-profile','SmplFinance','e4586902-1fa3-49b4-97c8-b01a00a36f4a',0,10,'\0',NULL,'76ba654d-ac56-45e3-abd8-82443cc3f638'),
('dc811982-2130-4a1d-aa46-6741fbf6c362',NULL,'conditional-user-configured','master','96c67238-bab1-4b7d-8629-925d22c2d0dd',0,10,'\0',NULL,NULL),
('df96634a-8891-4360-a3df-d21477b2f747',NULL,'auth-username-password-form','SmplFinance','0b201889-e580-43ea-9d8b-d82d586215d7',0,10,'\0',NULL,NULL),
('dff55336-ebbb-4c74-8a4b-20e98c957821',NULL,'conditional-user-configured','SmplFinance','02ade49f-92ce-47e3-997c-e23df4488d23',0,10,'\0',NULL,NULL),
('e6c77e44-55cf-4ae9-bc91-651ebf6b8d74',NULL,NULL,'SmplFinance','4ca1f4c0-395c-453c-9153-1e0af79079ca',2,30,'','0b201889-e580-43ea-9d8b-d82d586215d7',NULL),
('e759c7e3-0252-4fcb-b9a0-964b33c69f22',NULL,NULL,'master','4999cc49-7a79-4eb7-a85a-c75fbac14d63',0,20,'','3683e797-9bdf-4e5f-ac78-63d0da666337',NULL),
('e9bb266a-7675-4efd-b61b-7aaaed5d0b23',NULL,'idp-confirm-link','master','5a865c62-2ab5-4afc-bda9-49d8ba7c2755',0,10,'\0',NULL,NULL),
('e9bc2d49-7709-4cf3-8ca6-411f6f139755',NULL,'auth-cookie','master','a454be13-d159-4b18-8574-2d901fb5b81e',2,10,'\0',NULL,NULL),
('ec1febf2-b94c-45a2-8839-bda2224e20ef',NULL,'client-jwt','master','4ffc4fff-0e3f-484f-8155-f1866b163c69',2,20,'\0',NULL,NULL),
('edc26293-7699-485b-9a41-2448a007fade',NULL,'idp-username-password-form','master','179ff1e1-8b65-4bb5-adb4-b9212e514651',0,10,'\0',NULL,NULL),
('ef3b7539-c4ec-4fb9-8ef6-5870441cd5c8',NULL,'registration-user-creation','master','0d121f94-f45d-4d66-a765-10ec5e5a8bd1',0,20,'\0',NULL,NULL),
('f051efce-a2f1-4f6d-b2a3-4c996745c981',NULL,'reset-credential-email','master','9a3b5e89-14e7-4131-8632-1c68e0fb44a4',0,20,'\0',NULL,NULL),
('f5196424-fb71-48f4-98cb-aa45d113b8f4',NULL,'reset-credentials-choose-user','SmplFinance','e1862423-b184-424d-9a17-ef398e7f2d9d',0,10,'\0',NULL,NULL),
('f579618d-edd0-4ef9-9393-df01e37fb161',NULL,'direct-grant-validate-otp','master','96c67238-bab1-4b7d-8629-925d22c2d0dd',0,20,'\0',NULL,NULL),
('fb3d1709-c34c-4d51-9ebf-6afbc69d9727',NULL,'conditional-user-configured','master','093c6ff9-3c87-4d3b-baec-4a7ad911a8bd',0,10,'\0',NULL,NULL),
('fb590928-8c89-4530-bca9-3165f9d6b4e5',NULL,'basic-auth-otp','master','3683e797-9bdf-4e5f-ac78-63d0da666337',3,20,'\0',NULL,NULL),
('fdd2ce1f-021a-4a82-9feb-3b47e7118f94',NULL,'registration-user-creation','SmplFinance','d090b27a-f306-4b7c-a50e-166ed098bff2',0,20,'\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES
('02ade49f-92ce-47e3-997c-e23df4488d23','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','SmplFinance','basic-flow','\0',''),
('093c6ff9-3c87-4d3b-baec-4a7ad911a8bd','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow','\0',''),
('0b201889-e580-43ea-9d8b-d82d586215d7','forms','Username, password, otp and other auth forms.','SmplFinance','basic-flow','\0',''),
('0d121f94-f45d-4d66-a765-10ec5e5a8bd1','registration form','registration form','master','form-flow','\0',''),
('11337475-d6f1-4fe4-a4f5-3f2a227d3d80','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow','\0',''),
('13c3640c-e182-41ed-8da3-531e30c9135b','Authentication Options','Authentication options.','SmplFinance','basic-flow','\0',''),
('179ff1e1-8b65-4bb5-adb4-b9212e514651','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0',''),
('1e537313-14fe-41f0-80ad-794da77dc84a','User creation or linking','Flow for the existing/non-existing user alternatives','SmplFinance','basic-flow','\0',''),
('2accd7c6-af27-492d-8d44-707daf51b912','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow','\0',''),
('2b0c52da-627b-42a0-aa4d-8cb4de13a52a','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','SmplFinance','basic-flow','\0',''),
('2f8dc40a-4c8e-40d5-8f9d-11b0de919c78','clients','Base authentication for clients','SmplFinance','client-flow','',''),
('306a729e-c149-482f-b71a-e8841a3caabe','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','',''),
('3683e797-9bdf-4e5f-ac78-63d0da666337','Authentication Options','Authentication options.','master','basic-flow','\0',''),
('36c04034-2bf0-43b1-99b6-60ea8213f5a8','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow','',''),
('40d7bbb5-dd62-4476-b6e4-e700fc2e0b18','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow','\0',''),
('43117ace-0be4-4171-9b96-b0a391a114e2','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','SmplFinance','basic-flow','\0',''),
('4999cc49-7a79-4eb7-a85a-c75fbac14d63','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow','',''),
('4ca1f4c0-395c-453c-9153-1e0af79079ca','browser','browser based authentication','SmplFinance','basic-flow','',''),
('4ffc4fff-0e3f-484f-8155-f1866b163c69','clients','Base authentication for clients','master','client-flow','',''),
('54909597-eb73-4c96-a353-5f2ae979fb25','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow','',''),
('5772d09a-ae3f-455d-af79-cfe105520cc4','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),
('597d36b7-2f72-428d-90f1-2b76f573b2ab','direct grant','OpenID Connect Resource Owner Grant','SmplFinance','basic-flow','',''),
('5a865c62-2ab5-4afc-bda9-49d8ba7c2755','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0',''),
('64df7727-7f38-49b6-98c6-d9cb6cbc3040','registration','registration flow','SmplFinance','basic-flow','',''),
('6d3ef492-4aa6-4bb4-803b-56e7bb546891','saml ecp','SAML ECP Profile Authentication Flow','SmplFinance','basic-flow','',''),
('7edc24f8-7231-4d66-8b59-93afc1bea41b','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','SmplFinance','basic-flow','',''),
('8f44f5dc-c212-4f28-9a0f-9dadc200c9e1','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','SmplFinance','basic-flow','\0',''),
('96c67238-bab1-4b7d-8629-925d22c2d0dd','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow','\0',''),
('9a3b5e89-14e7-4131-8632-1c68e0fb44a4','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','',''),
('9da874d4-52a8-40b4-b4fd-71a0296d4b62','docker auth','Used by Docker clients to authenticate against the IDP','SmplFinance','basic-flow','',''),
('a454be13-d159-4b18-8574-2d901fb5b81e','browser','browser based authentication','master','basic-flow','',''),
('bfafe0df-06bc-422d-8275-9fb1960a402e','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','SmplFinance','basic-flow','\0',''),
('c3fa5245-e73b-4f1e-96c2-ffd3d740b9b4','registration','registration flow','master','basic-flow','',''),
('c7999d55-841a-43f5-ad92-01f5a0735468','Account verification options','Method with which to verity the existing account','SmplFinance','basic-flow','\0',''),
('c9fad5a7-883b-4214-b2e7-1b0d6aefc772','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),
('d090b27a-f306-4b7c-a50e-166ed098bff2','registration form','registration form','SmplFinance','form-flow','\0',''),
('d4d898f9-be1b-461a-bc64-809fbaa8f9a7','Account verification options','Method with which to verity the existing account','master','basic-flow','\0',''),
('e0c570d2-d128-4d2c-9d5f-77d142ff92f2','Verify Existing Account by Re-authentication','Reauthentication of existing account','SmplFinance','basic-flow','\0',''),
('e1862423-b184-424d-9a17-ef398e7f2d9d','reset credentials','Reset credentials for a user if they forgot their password or something','SmplFinance','basic-flow','',''),
('e4586902-1fa3-49b4-97c8-b01a00a36f4a','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','SmplFinance','basic-flow','','');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES
('46b8164d-fe83-4a07-8ec2-429107c16ce5','create unique user config','master'),
('76ba654d-ac56-45e3-abd8-82443cc3f638','review profile config','SmplFinance'),
('c8e38fc2-62e4-4a4b-ba42-563341eb4142','create unique user config','SmplFinance'),
('e8497750-1e55-4e70-bf58-23b9705096d8','review profile config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES
('46b8164d-fe83-4a07-8ec2-429107c16ce5','false','require.password.update.after.registration'),
('76ba654d-ac56-45e3-abd8-82443cc3f638','missing','update.profile.on.first.login'),
('c8e38fc2-62e4-4a4b-ba42-563341eb4142','false','require.password.update.after.registration'),
('e8497750-1e55-4e70-bf58-23b9705096d8','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT 0,
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES
('07e3e213-4589-42b9-95d7-3309947272dc','','\0','master-realm',0,'\0',NULL,NULL,'',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','','\0','account-console',0,'',NULL,'/realms/SmplFinance/account/','\0',NULL,'\0','SmplFinance','openid-connect',0,'\0','\0','${client_account-console}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),
('117a9570-c3e7-4701-a210-27364557a9ff','','\0','broker',0,'\0',NULL,NULL,'',NULL,'\0','master','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','','','AmbassadorProgramUi',0,'',NULL,NULL,'\0',NULL,'\0','SmplFinance','openid-connect',-1,'\0','\0',NULL,'\0','client-secret',NULL,NULL,NULL,'','\0','','\0'),
('1d307da5-7815-455b-92d9-d6e86113dda9','','','vault-chain-wallet-service',0,'\0','6b24f4c2-bd1a-46c8-a89a-4125df60aed1',NULL,'\0',NULL,'\0','SmplFinance','openid-connect',-1,'\0','\0',NULL,'','client-secret',NULL,NULL,NULL,'','\0','','\0'),
('236dc851-c82e-45d5-a197-cc26d974185f','','\0','security-admin-console',0,'',NULL,'/admin/SmplFinance/console/','\0',NULL,'\0','SmplFinance','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret','${authAdminUrl}',NULL,NULL,'','\0','\0','\0'),
('2ec6278e-5f6b-427d-b916-62285789bbea','','\0','broker',0,'\0',NULL,NULL,'',NULL,'\0','SmplFinance','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','','','smpl-client-broker',0,'\0','**********',NULL,'',NULL,'\0','SmplFinance','openid-connect',-1,'\0','\0',NULL,'\0','client-secret',NULL,NULL,NULL,'','\0','','\0'),
('488ee362-0d08-4d50-80b6-d4a6f7884788','','\0','admin-cli',0,'',NULL,NULL,'\0',NULL,'\0','SmplFinance','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','','\0'),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','','\0','security-admin-console',0,'',NULL,'/admin/master/console/','\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret','${authAdminUrl}',NULL,NULL,'','\0','\0','\0'),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','','\0','account',0,'',NULL,'/realms/master/account/','\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_account}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),
('6b30be93-6b51-47ce-981d-c280078d2d71','','\0','admin-cli',0,'',NULL,NULL,'\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','','\0'),
('7136bef4-e531-407c-ac89-c05a64fca136','','\0','realm-management',0,'\0',NULL,NULL,'',NULL,'\0','SmplFinance','openid-connect',0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),
('7894795e-a846-4be3-abd8-834c89d5abb5','','\0','account',0,'',NULL,'/realms/SmplFinance/account/','\0',NULL,'\0','SmplFinance','openid-connect',0,'\0','\0','${client_account}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','','\0','account-console',0,'',NULL,'/realms/master/account/','\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_account-console}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','','','smpl-angular-client',0,'',NULL,NULL,'\0','http://localhost:4200/','\0','SmplFinance','openid-connect',-1,'\0','\0',NULL,'\0','client-secret','http://localhost:4200/',NULL,NULL,'','\0','','\0'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','','','SmplWalletUi',0,'',NULL,NULL,'\0','http://localhost:4200/','\0','SmplFinance','openid-connect',-1,'\0','\0',NULL,'\0','client-secret','http://localhost:4200/',NULL,NULL,'','\0','','\0'),
('d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','\0','SmplFinance-realm',0,'\0',NULL,NULL,'',NULL,'\0','master',NULL,0,'\0','\0','SmplFinance Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','S256','pkce.code.challenge.method'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','backchannel.logout.revoke.offline.tokens'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','true','backchannel.logout.session.required'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','client_credentials.use_refresh_token'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','display.on.consent.screen'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','exclude.session.state.from.auth.response'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','id.token.as.detached.signature'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','oauth2.device.authorization.grant.enabled'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','oidc.ciba.grant.enabled'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','require.pushed.authorization.requests'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.artifact.binding'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.assertion.signature'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.authnstatement'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.client.signature'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.encrypt'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.force.post.binding'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.multivalued.roles'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.onetimeuse.condition'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.server.signature'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml.server.signature.keyinfo.ext'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','saml_force_name_id_format'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','false','tls.client.certificate.bound.access.tokens'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','true','use.refresh.tokens'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','backchannel.logout.revoke.offline.tokens'),
('1d307da5-7815-455b-92d9-d6e86113dda9','true','backchannel.logout.session.required'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','client_credentials.use_refresh_token'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','display.on.consent.screen'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','exclude.session.state.from.auth.response'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','id.token.as.detached.signature'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','oauth2.device.authorization.grant.enabled'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','oidc.ciba.grant.enabled'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.artifact.binding'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.assertion.signature'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.authnstatement'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.client.signature'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.encrypt'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.force.post.binding'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.multivalued.roles'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.onetimeuse.condition'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.server.signature'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml.server.signature.keyinfo.ext'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','saml_force_name_id_format'),
('1d307da5-7815-455b-92d9-d6e86113dda9','false','tls.client.certificate.bound.access.tokens'),
('1d307da5-7815-455b-92d9-d6e86113dda9','true','use.refresh.tokens'),
('236dc851-c82e-45d5-a197-cc26d974185f','S256','pkce.code.challenge.method'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','backchannel.logout.revoke.offline.tokens'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','true','backchannel.logout.session.required'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','client_credentials.use_refresh_token'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','display.on.consent.screen'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','exclude.session.state.from.auth.response'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','id.token.as.detached.signature'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','oauth2.device.authorization.grant.enabled'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','oidc.ciba.grant.enabled'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.artifact.binding'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.assertion.signature'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.authnstatement'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.client.signature'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.encrypt'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.force.post.binding'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.multivalued.roles'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.onetimeuse.condition'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.server.signature'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml.server.signature.keyinfo.ext'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','saml_force_name_id_format'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','false','tls.client.certificate.bound.access.tokens'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','true','use.refresh.tokens'),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','S256','pkce.code.challenge.method'),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','S256','pkce.code.challenge.method'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','backchannel.logout.revoke.offline.tokens'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','true','backchannel.logout.session.required'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','client_credentials.use_refresh_token'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','display.on.consent.screen'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','exclude.session.state.from.auth.response'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','id.token.as.detached.signature'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','oauth2.device.authorization.grant.enabled'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','oidc.ciba.grant.enabled'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','require.pushed.authorization.requests'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.artifact.binding'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.assertion.signature'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.authnstatement'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.client.signature'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.encrypt'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.force.post.binding'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.multivalued.roles'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.onetimeuse.condition'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.server.signature'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml.server.signature.keyinfo.ext'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','saml_force_name_id_format'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','false','tls.client.certificate.bound.access.tokens'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','true','use.refresh.tokens'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','backchannel.logout.revoke.offline.tokens'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','true','backchannel.logout.session.required'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','client_credentials.use_refresh_token'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','display.on.consent.screen'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','exclude.session.state.from.auth.response'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','id.token.as.detached.signature'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','oauth2.device.authorization.grant.enabled'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','oidc.ciba.grant.enabled'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','require.pushed.authorization.requests'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.artifact.binding'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.assertion.signature'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.authnstatement'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.client.signature'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.encrypt'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.force.post.binding'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.multivalued.roles'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.onetimeuse.condition'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.server.signature'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml.server.signature.keyinfo.ext'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','saml_force_name_id_format'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','false','tls.client.certificate.bound.access.tokens'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','true','use.refresh.tokens');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES
('099049c5-d947-4d92-833a-1802978f0b50','offline_access','SmplFinance','OpenID Connect built-in scope: offline_access','openid-connect'),
('15a2800e-c27e-4456-81a1-a40979bca698','web-origins','SmplFinance','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),
('322b3887-2259-4ea0-9c64-9926bc0f9905','phone','SmplFinance','OpenID Connect built-in scope: phone','openid-connect'),
('35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b','email','master','OpenID Connect built-in scope: email','openid-connect'),
('35e5cb10-0112-48db-8e5f-b74dad999397','address','SmplFinance','OpenID Connect built-in scope: address','openid-connect'),
('41e8df4e-884f-41b9-9869-12945cd27116','roles','SmplFinance','OpenID Connect scope for add user roles to the access token','openid-connect'),
('6135e0a0-41d8-44e7-b158-6099e1b9af69','role_list','master','SAML role list','saml'),
('6af761ea-2f59-448c-9da0-dc4d6ea95b74','profile','SmplFinance','OpenID Connect built-in scope: profile','openid-connect'),
('6e8cedf7-0724-4417-862a-26b656de3d80','role_list','SmplFinance','SAML role list','saml'),
('754cd73e-b300-4bcc-8cd9-78ae5e45aa60','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),
('7ccf27da-91f0-4ee9-a743-8cfde6ec5578','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),
('812c98c1-a666-4e31-abdb-b17f13d3dcf7','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),
('829ceaa5-e3b7-451c-8f8b-51fc3ab53e47','profile','master','OpenID Connect built-in scope: profile','openid-connect'),
('8bed60a1-3231-46b9-8373-10d77c011f03','microprofile-jwt','SmplFinance','Microprofile - JWT built-in scope','openid-connect'),
('8fb12bbe-64c1-45a0-b7d4-1c218543f64b','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),
('b810e8c0-fda0-4a0b-8c36-0bb6b547eedf','email','SmplFinance','OpenID Connect built-in scope: email','openid-connect'),
('ccbb2026-d1ec-4db4-90e0-6b79f9c53555','phone','master','OpenID Connect built-in scope: phone','openid-connect'),
('f71f565a-b668-47ec-aa3a-ce1471ef207c','address','master','OpenID Connect built-in scope: address','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES
('099049c5-d947-4d92-833a-1802978f0b50','${offlineAccessScopeConsentText}','consent.screen.text'),
('099049c5-d947-4d92-833a-1802978f0b50','true','display.on.consent.screen'),
('15a2800e-c27e-4456-81a1-a40979bca698','','consent.screen.text'),
('15a2800e-c27e-4456-81a1-a40979bca698','false','display.on.consent.screen'),
('15a2800e-c27e-4456-81a1-a40979bca698','false','include.in.token.scope'),
('322b3887-2259-4ea0-9c64-9926bc0f9905','${phoneScopeConsentText}','consent.screen.text'),
('322b3887-2259-4ea0-9c64-9926bc0f9905','true','display.on.consent.screen'),
('322b3887-2259-4ea0-9c64-9926bc0f9905','true','include.in.token.scope'),
('35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b','${emailScopeConsentText}','consent.screen.text'),
('35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b','true','display.on.consent.screen'),
('35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b','true','include.in.token.scope'),
('35e5cb10-0112-48db-8e5f-b74dad999397','${addressScopeConsentText}','consent.screen.text'),
('35e5cb10-0112-48db-8e5f-b74dad999397','true','display.on.consent.screen'),
('35e5cb10-0112-48db-8e5f-b74dad999397','true','include.in.token.scope'),
('41e8df4e-884f-41b9-9869-12945cd27116','${rolesScopeConsentText}','consent.screen.text'),
('41e8df4e-884f-41b9-9869-12945cd27116','true','display.on.consent.screen'),
('41e8df4e-884f-41b9-9869-12945cd27116','false','include.in.token.scope'),
('6135e0a0-41d8-44e7-b158-6099e1b9af69','${samlRoleListScopeConsentText}','consent.screen.text'),
('6135e0a0-41d8-44e7-b158-6099e1b9af69','true','display.on.consent.screen'),
('6af761ea-2f59-448c-9da0-dc4d6ea95b74','${profileScopeConsentText}','consent.screen.text'),
('6af761ea-2f59-448c-9da0-dc4d6ea95b74','true','display.on.consent.screen'),
('6af761ea-2f59-448c-9da0-dc4d6ea95b74','true','include.in.token.scope'),
('6e8cedf7-0724-4417-862a-26b656de3d80','${samlRoleListScopeConsentText}','consent.screen.text'),
('6e8cedf7-0724-4417-862a-26b656de3d80','true','display.on.consent.screen'),
('754cd73e-b300-4bcc-8cd9-78ae5e45aa60','${rolesScopeConsentText}','consent.screen.text'),
('754cd73e-b300-4bcc-8cd9-78ae5e45aa60','true','display.on.consent.screen'),
('754cd73e-b300-4bcc-8cd9-78ae5e45aa60','false','include.in.token.scope'),
('7ccf27da-91f0-4ee9-a743-8cfde6ec5578','','consent.screen.text'),
('7ccf27da-91f0-4ee9-a743-8cfde6ec5578','false','display.on.consent.screen'),
('7ccf27da-91f0-4ee9-a743-8cfde6ec5578','false','include.in.token.scope'),
('812c98c1-a666-4e31-abdb-b17f13d3dcf7','${offlineAccessScopeConsentText}','consent.screen.text'),
('812c98c1-a666-4e31-abdb-b17f13d3dcf7','true','display.on.consent.screen'),
('829ceaa5-e3b7-451c-8f8b-51fc3ab53e47','${profileScopeConsentText}','consent.screen.text'),
('829ceaa5-e3b7-451c-8f8b-51fc3ab53e47','true','display.on.consent.screen'),
('829ceaa5-e3b7-451c-8f8b-51fc3ab53e47','true','include.in.token.scope'),
('8bed60a1-3231-46b9-8373-10d77c011f03','false','display.on.consent.screen'),
('8bed60a1-3231-46b9-8373-10d77c011f03','true','include.in.token.scope'),
('8fb12bbe-64c1-45a0-b7d4-1c218543f64b','false','display.on.consent.screen'),
('8fb12bbe-64c1-45a0-b7d4-1c218543f64b','true','include.in.token.scope'),
('b810e8c0-fda0-4a0b-8c36-0bb6b547eedf','${emailScopeConsentText}','consent.screen.text'),
('b810e8c0-fda0-4a0b-8c36-0bb6b547eedf','true','display.on.consent.screen'),
('b810e8c0-fda0-4a0b-8c36-0bb6b547eedf','true','include.in.token.scope'),
('ccbb2026-d1ec-4db4-90e0-6b79f9c53555','${phoneScopeConsentText}','consent.screen.text'),
('ccbb2026-d1ec-4db4-90e0-6b79f9c53555','true','display.on.consent.screen'),
('ccbb2026-d1ec-4db4-90e0-6b79f9c53555','true','include.in.token.scope'),
('f71f565a-b668-47ec-aa3a-ce1471ef207c','${addressScopeConsentText}','consent.screen.text'),
('f71f565a-b668-47ec-aa3a-ce1471ef207c','true','display.on.consent.screen'),
('f71f565a-b668-47ec-aa3a-ce1471ef207c','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES
('07e3e213-4589-42b9-95d7-3309947272dc','35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b',''),
('07e3e213-4589-42b9-95d7-3309947272dc','754cd73e-b300-4bcc-8cd9-78ae5e45aa60',''),
('07e3e213-4589-42b9-95d7-3309947272dc','7ccf27da-91f0-4ee9-a743-8cfde6ec5578',''),
('07e3e213-4589-42b9-95d7-3309947272dc','812c98c1-a666-4e31-abdb-b17f13d3dcf7','\0'),
('07e3e213-4589-42b9-95d7-3309947272dc','829ceaa5-e3b7-451c-8f8b-51fc3ab53e47',''),
('07e3e213-4589-42b9-95d7-3309947272dc','8fb12bbe-64c1-45a0-b7d4-1c218543f64b','\0'),
('07e3e213-4589-42b9-95d7-3309947272dc','ccbb2026-d1ec-4db4-90e0-6b79f9c53555','\0'),
('07e3e213-4589-42b9-95d7-3309947272dc','f71f565a-b668-47ec-aa3a-ce1471ef207c','\0'),
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','15a2800e-c27e-4456-81a1-a40979bca698',''),
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','41e8df4e-884f-41b9-9869-12945cd27116',''),
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('117a9570-c3e7-4701-a210-27364557a9ff','35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b',''),
('117a9570-c3e7-4701-a210-27364557a9ff','754cd73e-b300-4bcc-8cd9-78ae5e45aa60',''),
('117a9570-c3e7-4701-a210-27364557a9ff','7ccf27da-91f0-4ee9-a743-8cfde6ec5578',''),
('117a9570-c3e7-4701-a210-27364557a9ff','812c98c1-a666-4e31-abdb-b17f13d3dcf7','\0'),
('117a9570-c3e7-4701-a210-27364557a9ff','829ceaa5-e3b7-451c-8f8b-51fc3ab53e47',''),
('117a9570-c3e7-4701-a210-27364557a9ff','8fb12bbe-64c1-45a0-b7d4-1c218543f64b','\0'),
('117a9570-c3e7-4701-a210-27364557a9ff','ccbb2026-d1ec-4db4-90e0-6b79f9c53555','\0'),
('117a9570-c3e7-4701-a210-27364557a9ff','f71f565a-b668-47ec-aa3a-ce1471ef207c','\0'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','15a2800e-c27e-4456-81a1-a40979bca698',''),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','41e8df4e-884f-41b9-9869-12945cd27116',''),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('1d307da5-7815-455b-92d9-d6e86113dda9','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('1d307da5-7815-455b-92d9-d6e86113dda9','15a2800e-c27e-4456-81a1-a40979bca698',''),
('1d307da5-7815-455b-92d9-d6e86113dda9','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('1d307da5-7815-455b-92d9-d6e86113dda9','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('1d307da5-7815-455b-92d9-d6e86113dda9','41e8df4e-884f-41b9-9869-12945cd27116',''),
('1d307da5-7815-455b-92d9-d6e86113dda9','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('1d307da5-7815-455b-92d9-d6e86113dda9','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('1d307da5-7815-455b-92d9-d6e86113dda9','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('236dc851-c82e-45d5-a197-cc26d974185f','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('236dc851-c82e-45d5-a197-cc26d974185f','15a2800e-c27e-4456-81a1-a40979bca698',''),
('236dc851-c82e-45d5-a197-cc26d974185f','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('236dc851-c82e-45d5-a197-cc26d974185f','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('236dc851-c82e-45d5-a197-cc26d974185f','41e8df4e-884f-41b9-9869-12945cd27116',''),
('236dc851-c82e-45d5-a197-cc26d974185f','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('236dc851-c82e-45d5-a197-cc26d974185f','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('236dc851-c82e-45d5-a197-cc26d974185f','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('2ec6278e-5f6b-427d-b916-62285789bbea','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('2ec6278e-5f6b-427d-b916-62285789bbea','15a2800e-c27e-4456-81a1-a40979bca698',''),
('2ec6278e-5f6b-427d-b916-62285789bbea','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('2ec6278e-5f6b-427d-b916-62285789bbea','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('2ec6278e-5f6b-427d-b916-62285789bbea','41e8df4e-884f-41b9-9869-12945cd27116',''),
('2ec6278e-5f6b-427d-b916-62285789bbea','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('2ec6278e-5f6b-427d-b916-62285789bbea','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('2ec6278e-5f6b-427d-b916-62285789bbea','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','15a2800e-c27e-4456-81a1-a40979bca698',''),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','41e8df4e-884f-41b9-9869-12945cd27116',''),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('3c14b29b-81ab-4b6a-83b1-04e1640759e3','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('488ee362-0d08-4d50-80b6-d4a6f7884788','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('488ee362-0d08-4d50-80b6-d4a6f7884788','15a2800e-c27e-4456-81a1-a40979bca698',''),
('488ee362-0d08-4d50-80b6-d4a6f7884788','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('488ee362-0d08-4d50-80b6-d4a6f7884788','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('488ee362-0d08-4d50-80b6-d4a6f7884788','41e8df4e-884f-41b9-9869-12945cd27116',''),
('488ee362-0d08-4d50-80b6-d4a6f7884788','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('488ee362-0d08-4d50-80b6-d4a6f7884788','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('488ee362-0d08-4d50-80b6-d4a6f7884788','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b',''),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','754cd73e-b300-4bcc-8cd9-78ae5e45aa60',''),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','7ccf27da-91f0-4ee9-a743-8cfde6ec5578',''),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','812c98c1-a666-4e31-abdb-b17f13d3dcf7','\0'),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','829ceaa5-e3b7-451c-8f8b-51fc3ab53e47',''),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','8fb12bbe-64c1-45a0-b7d4-1c218543f64b','\0'),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','ccbb2026-d1ec-4db4-90e0-6b79f9c53555','\0'),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','f71f565a-b668-47ec-aa3a-ce1471ef207c','\0'),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b',''),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','754cd73e-b300-4bcc-8cd9-78ae5e45aa60',''),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','7ccf27da-91f0-4ee9-a743-8cfde6ec5578',''),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','812c98c1-a666-4e31-abdb-b17f13d3dcf7','\0'),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','829ceaa5-e3b7-451c-8f8b-51fc3ab53e47',''),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','8fb12bbe-64c1-45a0-b7d4-1c218543f64b','\0'),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','ccbb2026-d1ec-4db4-90e0-6b79f9c53555','\0'),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','f71f565a-b668-47ec-aa3a-ce1471ef207c','\0'),
('6b30be93-6b51-47ce-981d-c280078d2d71','35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b',''),
('6b30be93-6b51-47ce-981d-c280078d2d71','754cd73e-b300-4bcc-8cd9-78ae5e45aa60',''),
('6b30be93-6b51-47ce-981d-c280078d2d71','7ccf27da-91f0-4ee9-a743-8cfde6ec5578',''),
('6b30be93-6b51-47ce-981d-c280078d2d71','812c98c1-a666-4e31-abdb-b17f13d3dcf7','\0'),
('6b30be93-6b51-47ce-981d-c280078d2d71','829ceaa5-e3b7-451c-8f8b-51fc3ab53e47',''),
('6b30be93-6b51-47ce-981d-c280078d2d71','8fb12bbe-64c1-45a0-b7d4-1c218543f64b','\0'),
('6b30be93-6b51-47ce-981d-c280078d2d71','ccbb2026-d1ec-4db4-90e0-6b79f9c53555','\0'),
('6b30be93-6b51-47ce-981d-c280078d2d71','f71f565a-b668-47ec-aa3a-ce1471ef207c','\0'),
('7136bef4-e531-407c-ac89-c05a64fca136','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('7136bef4-e531-407c-ac89-c05a64fca136','15a2800e-c27e-4456-81a1-a40979bca698',''),
('7136bef4-e531-407c-ac89-c05a64fca136','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('7136bef4-e531-407c-ac89-c05a64fca136','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('7136bef4-e531-407c-ac89-c05a64fca136','41e8df4e-884f-41b9-9869-12945cd27116',''),
('7136bef4-e531-407c-ac89-c05a64fca136','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('7136bef4-e531-407c-ac89-c05a64fca136','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('7136bef4-e531-407c-ac89-c05a64fca136','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('7894795e-a846-4be3-abd8-834c89d5abb5','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('7894795e-a846-4be3-abd8-834c89d5abb5','15a2800e-c27e-4456-81a1-a40979bca698',''),
('7894795e-a846-4be3-abd8-834c89d5abb5','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('7894795e-a846-4be3-abd8-834c89d5abb5','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('7894795e-a846-4be3-abd8-834c89d5abb5','41e8df4e-884f-41b9-9869-12945cd27116',''),
('7894795e-a846-4be3-abd8-834c89d5abb5','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('7894795e-a846-4be3-abd8-834c89d5abb5','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('7894795e-a846-4be3-abd8-834c89d5abb5','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b',''),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','754cd73e-b300-4bcc-8cd9-78ae5e45aa60',''),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','7ccf27da-91f0-4ee9-a743-8cfde6ec5578',''),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','812c98c1-a666-4e31-abdb-b17f13d3dcf7','\0'),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','829ceaa5-e3b7-451c-8f8b-51fc3ab53e47',''),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','8fb12bbe-64c1-45a0-b7d4-1c218543f64b','\0'),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','ccbb2026-d1ec-4db4-90e0-6b79f9c53555','\0'),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','f71f565a-b668-47ec-aa3a-ce1471ef207c','\0'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','15a2800e-c27e-4456-81a1-a40979bca698',''),
('c0080901-389e-4396-8762-1b0c6dfc1a00','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','41e8df4e-884f-41b9-9869-12945cd27116',''),
('c0080901-389e-4396-8762-1b0c6dfc1a00','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('c0080901-389e-4396-8762-1b0c6dfc1a00','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf',''),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','15a2800e-c27e-4456-81a1-a40979bca698',''),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','41e8df4e-884f-41b9-9869-12945cd27116',''),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf','');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES
('099049c5-d947-4d92-833a-1802978f0b50','7d790bae-aa3e-489f-bbde-77ed8b3394b0'),
('812c98c1-a666-4e31-abdb-b17f13d3dcf7','1f99cb99-f166-4e8b-a79d-626183138c03');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES
('057d69a1-cc2b-4399-8da6-2198ae4b269c','Consent Required','SmplFinance','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SmplFinance','anonymous'),
('0cfc6169-775e-4517-8f76-f5b48137104d','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),
('1b224c6d-8a00-4bd3-aba6-4cf640e340a0','Full Scope Disabled','SmplFinance','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SmplFinance','anonymous'),
('4de3f556-a804-47ee-8a4d-667b7f4fcace','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),
('57b7e95b-9587-4c46-9d85-5994caaef568',NULL,'SmplFinance','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','SmplFinance',NULL),
('5edce2c0-878e-459f-8920-d1c4226fdb88','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('66189495-aa4d-40e6-b2ac-de1344dd871f','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('6d49bcaa-b66c-4b2a-b278-bbac49cfeeec','Max Clients Limit','SmplFinance','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SmplFinance','anonymous'),
('7522347d-9285-41bf-9b7b-f63a46b88a8c','Allowed Client Scopes','SmplFinance','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SmplFinance','anonymous'),
('7a40179f-7802-45b6-a904-08f967fdd3d2','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('85107cbc-2f93-4926-a2a6-b34c4e6ad4f8','Trusted Hosts','SmplFinance','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SmplFinance','anonymous'),
('8dbd5566-fc6e-4721-bcca-0bfe0bd8ea0b','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('a2e5feba-7b8e-4bf0-89f6-0d369cf25c83','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),
('b1ab885d-f9bc-4f7e-9ecd-facf7359203e','Allowed Protocol Mapper Types','SmplFinance','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SmplFinance','anonymous'),
('b7023734-b6d9-4389-b40a-f1ce3ec948a5','hmac-generated','SmplFinance','hmac-generated','org.keycloak.keys.KeyProvider','SmplFinance',NULL),
('bc51e965-79eb-4475-badb-9e4505505f87','Allowed Client Scopes','SmplFinance','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SmplFinance','authenticated'),
('bce93487-2fbf-4ebe-bcbd-cd7c52c83530','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),
('bd876bdb-89d6-41da-9618-66b750b0af57','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('cd1a65c1-d767-44b4-a439-d740f5cc2ffb','Allowed Protocol Mapper Types','SmplFinance','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SmplFinance','authenticated'),
('cf08cbd1-281c-4409-8349-08dfdffb9764','aes-generated','SmplFinance','aes-generated','org.keycloak.keys.KeyProvider','SmplFinance',NULL),
('deefb84e-4927-4edc-8628-c938a058d5f8','rsa-generated','SmplFinance','rsa-generated','org.keycloak.keys.KeyProvider','SmplFinance',NULL),
('ee4f7969-8f2a-49bb-a5c1-a6a3463dccab','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('fd0b98ad-3007-4ec6-bf79-db122ac6472f','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES
('0e8edcc3-b6aa-4308-882d-58f907588770','b1ab885d-f9bc-4f7e-9ecd-facf7359203e','allowed-protocol-mapper-types','oidc-address-mapper'),
('108eae34-fd36-4610-95f5-738892ce30ba','b7023734-b6d9-4389-b40a-f1ce3ec948a5','algorithm','HS256'),
('131c6ba8-c541-444c-8033-9750e9ae8503','4de3f556-a804-47ee-8a4d-667b7f4fcace','certificate','MIICmzCCAYMCBgF6yoe59zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwNzIxMTkyMzUwWhcNMzEwNzIxMTkyNTMwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC1X/Tm9JUQJCcUkGPsv4E3m/HPQWKVcYrMAmF/ydY4N65pVD7Fcpabp7JyyMl/2gFHpU0+ws+NlWz4/D58upKK7DQgMdCtyGBM90vTSdFom9qBWW8qoyxWPlegICS5pXZEKcffrqPQghII5+Rv4xVJ9aIS2+c5WUUcxmTGeI02QClTgMdBfRIjmP/XRrU7OAxq90uAqyzo85GlCpYPhGEWgHzG8DinhTi8y24FmnkRGKmXDDLJegGKqZspIGO+Zd96OV2+WTcK4j75GHFcrgAr7t+/GZxY7r7nMErtpcoBqjC6Dm1g+5qzLVUOUCsoj59dElBw9VAxbtVYPNSE97a3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBALDU2i01vFdKQ6lvUsSL9VQ9bp/lN5TDJVfCwO/8h/+dDFfpQvWCSOTLNFTai1+w82/099UUII+MPqpKiV6j2tZYTRU7hPOnNBqPuyiGFzHwtHLELRzAA19eZpZHZylxqRxbyPLnI8Q8xn6uCyWNK2+U10Ggw1OoOYuCkGAio4c4XrY2dSVDYd4dTw3wEHI/pdh9lO6p7o0omXLZq4aN8qOIcJwZhtYoUYZtSxcBC19eJqBt9UwrlmzMBfy6vbrLo6rVzpiuNR1s++eDg0vXClWGH/R0GAPcrXoq0GVCgl8JE82rHVCn8rwCJ5ms9Dq3yDcIFl/ENdJ1eEfWUlfJmig='),
('1673d0b5-7332-4971-8692-b919d3da50f4','4de3f556-a804-47ee-8a4d-667b7f4fcace','priority','100'),
('18ba62c0-ba14-499a-b57a-499263875b9c','bd876bdb-89d6-41da-9618-66b750b0af57','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('19a46d8a-44dd-447d-8593-9673c2bfba32','b1ab885d-f9bc-4f7e-9ecd-facf7359203e','allowed-protocol-mapper-types','saml-role-list-mapper'),
('20d44b86-ff96-45ca-9acb-f24a1c511e4b','deefb84e-4927-4edc-8628-c938a058d5f8','certificate','MIICpTCCAY0CBgF6yofAJDANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtTbXBsRmluYW5jZTAeFw0yMTA3MjExOTIzNTJaFw0zMTA3MjExOTI1MzJaMBYxFDASBgNVBAMMC1NtcGxGaW5hbmNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAo3u8Jy4Fxyp2xVJCHbwYM8fKxnk/w7aOwqw3crs8P559MTKSZJD54O7S7dXhf43eXiKKQr8wyEKGuwF2YFC+GB6kQDI8iIWAsmZNDgISHGn8Lp3UbgUMDYYvkl/OV33gvUnyiD7ePi1XN2214S9D5OtAhq90UpPKZOYMHms7G4U66MRwtjqH24e33MiVnn9Wwr0OlMD5kAnsSXAa/Syi92+vPaHCggs2UBTwzOdt0duQ09h5DHTftzgAtQ5BR4PtCLE7zMsKR9wQVg64yaFqDU4uAfc2FEbqjEvKI1RfrJVAiSABgGMadUDTSlw96XuXc/OIQVaDwo+XJkUvEAdXDQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAfqdSWwG6tQV5QDPF9jKf/15CImLeKDeMBlgjkeuLuPwn3wDeWYRE0rd+jpqZ4zZEM7RG9I8GvPFddcccFZzCKwSB/x5wJXyDykMhd73b6LAcGjLCIBf7DLNET1zkAzfQ3nsbE4hK2PdpJqanrjJTfbg2exLDhZF15YHuSk011dtILfuxX11bZlr0M14Fr3wXyrsfwK1k1LjuUe1g7FFmMl/ELdS07vwI4Dx2aeOqNZS0bKpt/C1mk98l7HimdTcRXxZg4ionxio5AOevJ2t7qCKHxnRTdX8423Bhocm7jziznxrUdJI/zaS3yjaCF8QZoyivUaJ7uNkIkMHPHrUbO'),
('243dcf78-52ec-40ed-b9bf-dc57f4fa47fd','ee4f7969-8f2a-49bb-a5c1-a6a3463dccab','allow-default-scopes','true'),
('258a41cb-b002-4fdc-90b6-775d67cc30c8','fd0b98ad-3007-4ec6-bf79-db122ac6472f','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('2e5c9e16-8bc0-49f8-bcad-905e144b7c43','bce93487-2fbf-4ebe-bcbd-cd7c52c83530','secret','cgt2RhjSaFD-G4AhLoF8ylwfr6EGGTRfC0pJAQ2F2UW3pUI18QzcKacmpnUO6-bzA2MZP_WUJBFFBAYiUaQhkA'),
('376bbc78-f045-4503-b7a4-74e912920d46','a2e5feba-7b8e-4bf0-89f6-0d369cf25c83','secret','bbbZ_F0DpBoL0lQyJl_rgQ'),
('483ce2dc-cf54-4c58-9c7d-fe5318421425','fd0b98ad-3007-4ec6-bf79-db122ac6472f','allowed-protocol-mapper-types','saml-role-list-mapper'),
('54ffa38d-f325-4d61-981a-30bada2801d8','bd876bdb-89d6-41da-9618-66b750b0af57','allowed-protocol-mapper-types','saml-user-property-mapper'),
('5617fd19-0ec6-4f62-94ae-70e8895d9b2a','66189495-aa4d-40e6-b2ac-de1344dd871f','client-uris-must-match','true'),
('59a0c8f0-ffcc-4548-9da9-4c7528ebd0b1','fd0b98ad-3007-4ec6-bf79-db122ac6472f','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('5b6aee21-3de4-4de0-be6e-4ca09d922b97','bd876bdb-89d6-41da-9618-66b750b0af57','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('6366b935-fee1-483c-b232-4a6a64526ad5','cd1a65c1-d767-44b4-a439-d740f5cc2ffb','allowed-protocol-mapper-types','oidc-address-mapper'),
('6bdcc6c3-33bf-49c9-b3a4-f78ee3c1c0a6','cf08cbd1-281c-4409-8349-08dfdffb9764','priority','100'),
('6d0453fe-4fae-496b-bb91-e524dd9c4916','cd1a65c1-d767-44b4-a439-d740f5cc2ffb','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('6d7b2310-630f-435d-9243-2b152f609a1d','7522347d-9285-41bf-9b7b-f63a46b88a8c','allow-default-scopes','true'),
('6dd5b742-46f3-44ad-b04a-ee073cfb5a1e','fd0b98ad-3007-4ec6-bf79-db122ac6472f','allowed-protocol-mapper-types','saml-user-property-mapper'),
('70768adc-3d81-4b95-8643-570bfffd3e16','b1ab885d-f9bc-4f7e-9ecd-facf7359203e','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('72f8ebcc-4eae-4b92-bf1f-283f37661542','cd1a65c1-d767-44b4-a439-d740f5cc2ffb','allowed-protocol-mapper-types','saml-user-property-mapper'),
('778d2f07-14d6-4a23-b9f2-c3fa11fc3b9c','66189495-aa4d-40e6-b2ac-de1344dd871f','host-sending-registration-request-must-match','true'),
('7839720a-8e82-4ebd-9265-9e190a57551e','bd876bdb-89d6-41da-9618-66b750b0af57','allowed-protocol-mapper-types','oidc-address-mapper'),
('784f3b6a-66f8-47c1-80ce-3951bb19360a','cf08cbd1-281c-4409-8349-08dfdffb9764','kid','2a154d8c-8de0-407a-9dcd-7646aec6af37'),
('78aba1b6-ab92-44da-8a02-281fd7a41274','b7023734-b6d9-4389-b40a-f1ce3ec948a5','priority','100'),
('7ed76925-de9b-412b-8ebf-b9a0c32de290','cd1a65c1-d767-44b4-a439-d740f5cc2ffb','allowed-protocol-mapper-types','saml-role-list-mapper'),
('837835b4-29fe-4187-8adc-079eb62507fb','cd1a65c1-d767-44b4-a439-d740f5cc2ffb','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('89e153db-3582-4907-a273-baa274002b0a','bce93487-2fbf-4ebe-bcbd-cd7c52c83530','priority','100'),
('93a5f95d-d7c4-4aa0-9d9b-b12c13251717','cf08cbd1-281c-4409-8349-08dfdffb9764','secret','Ldp2cpB5nN5V9eDzdUsdCA'),
('965adaf8-c816-4c20-a2d0-ce7dbc1e293b','a2e5feba-7b8e-4bf0-89f6-0d369cf25c83','kid','32fd4c69-7714-454b-9c56-6c196bd8b74c'),
('997d5873-c387-4b70-abe1-2798526b6393','cd1a65c1-d767-44b4-a439-d740f5cc2ffb','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('9a7d7021-656f-4168-9294-237667d5af1c','fd0b98ad-3007-4ec6-bf79-db122ac6472f','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('9fbb0155-93da-477b-aca5-33fa32764d5d','bc51e965-79eb-4475-badb-9e4505505f87','allow-default-scopes','true'),
('a3bb81cb-3c3f-4841-b315-ef92b007406b','b7023734-b6d9-4389-b40a-f1ce3ec948a5','kid','67dc9df9-59f6-4d18-a277-5d703d68f73a'),
('a8049e8f-6c61-483f-a0a3-450f249cc342','7a40179f-7802-45b6-a904-08f967fdd3d2','max-clients','200'),
('ab774a67-c833-4c53-a86d-85e3b2d3404d','bce93487-2fbf-4ebe-bcbd-cd7c52c83530','algorithm','HS256'),
('abe43961-6a72-4844-80ba-bad2534472d9','a2e5feba-7b8e-4bf0-89f6-0d369cf25c83','priority','100'),
('b3110249-4da6-409a-9e66-d9e4c35ff159','6d49bcaa-b66c-4b2a-b278-bbac49cfeeec','max-clients','200'),
('b75bd44c-935f-44ba-bf86-0c61e8f5d1f4','b1ab885d-f9bc-4f7e-9ecd-facf7359203e','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('b81da3e3-b16e-4145-bd3a-fa1f8ae30990','bd876bdb-89d6-41da-9618-66b750b0af57','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('ba1d9e3a-157d-4f49-9cf5-5f55f83658a6','deefb84e-4927-4edc-8628-c938a058d5f8','priority','100'),
('bfa65895-fc94-4d53-8595-a3af40e5ce23','0cfc6169-775e-4517-8f76-f5b48137104d','allow-default-scopes','true'),
('bfbf0698-d71f-41a2-95d9-b631305923a8','deefb84e-4927-4edc-8628-c938a058d5f8','privateKey','MIIEowIBAAKCAQEAo3u8Jy4Fxyp2xVJCHbwYM8fKxnk/w7aOwqw3crs8P559MTKSZJD54O7S7dXhf43eXiKKQr8wyEKGuwF2YFC+GB6kQDI8iIWAsmZNDgISHGn8Lp3UbgUMDYYvkl/OV33gvUnyiD7ePi1XN2214S9D5OtAhq90UpPKZOYMHms7G4U66MRwtjqH24e33MiVnn9Wwr0OlMD5kAnsSXAa/Syi92+vPaHCggs2UBTwzOdt0duQ09h5DHTftzgAtQ5BR4PtCLE7zMsKR9wQVg64yaFqDU4uAfc2FEbqjEvKI1RfrJVAiSABgGMadUDTSlw96XuXc/OIQVaDwo+XJkUvEAdXDQIDAQABAoIBAQCd1AkTsiS14NMFMKLP3hVneAzVi5z5rzcnzedCBmzl5nZqlq4qFKSIeUh9gCzRXf891g6w3a+UxlUYGRNVbN34nyxnJZi3HFvg306opWsir1ddEdZR2OGH9PHcWE32vXnIhKl2y2r3kAJRasNagK0FRfDnll+wkSmmO0mb3F4V8/6aft24KuGqz5+EYBHpm2FKLBt5E0uyUCFsJd7/QmtTij9vEi7wtDbBAsTYWDLZpfm+T1WDZP6M+qwCEGEWKitmwfoKHi5CtHonAAc9iD8F8aO5E+xP0aAr5J+cJKFyuKegioOUrFGg07BTJbzw3Kup43gGtIEfwPbQn8WJNBCpAoGBAOKDpkvAx5Zvda6XWcWgXTRFWGcwa/Ra0qaInRWbJTQJ80N/W/hAJae7FcBnRCP5OAel7PCI6Cyi86HpDj6Xn9OKXmAJgzms7OcGXEVqx1pxH9U0iDeSZVUIm1YeDicfJD7kRF7AhjYZxhtERRQDfKPclkLZPFpGSYxnVgT8RJ7jAoGBALjDpWXztOuWvnlI7i8ksBxND29tyfWGzZ7VCJyZZiCHlNTXOxeNLs12XH5vR5b5f5FqixDNLe5IVgo2kOYFnaRDvOekVazqIW91H4zUp03GPf2bf1XCdUCeuPGsvlg+nSgYALTCFJ9blEkuHWDRhiGeNsSugtxnvCepSwT6ZqVPAoGAQTIhOCaJi8wS9CiN5yrsCLJ46mJugAtwHAywIdrgz2SZxvCuWPqlm+xmK1XNsAj4ToM8elL9eHOCajS5K9zaXLmzxjKWuZADM8+J2VUNggOTZPtUxaH2Vo4+n3/RFQOKnCt5XkhNmN68PXbd5w/F3SgNe7oo+9bFLotDn/W4Dn8CgYBsYfgoMimy+R6Krwlphi/4qguf5dtOt+DuhzEiC6oo8t+PayIy0pLd28yuLkDkgz8d4k3pcTK8UJqIKzIcfLbYoROzHmdTo5QxeZckWao6qUu79PdhK0z0tybuPdL6mOA/oLTpU+AdCu+VbgO1w7LXDaQ7A9OnzwJEkb58ERcdaQKBgFu0Jd8oN+MppHaFUEVpv6nXMKLAVTQjKlB7TKhYQ+UlL4P3daPTwYhU9Vk5GRh6f9b9UVVNWtl8v0Y5ZgqZqWF2+iOkJeZF0wX/7TJ4rl9ch0DGhS54xSSdZaaNWirjVtvkZsgyk9IbuIA7zJlQo56CM/jpXWvwn6X/4GIk8k9a'),
('c04a3290-63db-417b-b6e2-7ff40464af09','cd1a65c1-d767-44b4-a439-d740f5cc2ffb','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('c3402dd8-fe77-490a-a4a1-72cfaa763539','fd0b98ad-3007-4ec6-bf79-db122ac6472f','allowed-protocol-mapper-types','oidc-address-mapper'),
('c4c7b56d-6034-4429-bd3d-30ab373790fb','bd876bdb-89d6-41da-9618-66b750b0af57','allowed-protocol-mapper-types','saml-role-list-mapper'),
('c6751baf-d9e6-46fb-bfc7-fb4a3ed80531','fd0b98ad-3007-4ec6-bf79-db122ac6472f','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('c73b1953-77ce-44b7-9b2f-0b0621775ac6','bce93487-2fbf-4ebe-bcbd-cd7c52c83530','kid','9f13a4cc-095e-41c9-b1f9-3a62c9ea7f8a'),
('c979d45a-c7b3-49ac-a492-15951713fa3e','bd876bdb-89d6-41da-9618-66b750b0af57','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('cf04a446-d70f-4699-bdbe-76730e7015ed','4de3f556-a804-47ee-8a4d-667b7f4fcace','privateKey','MIIEowIBAAKCAQEAtV/05vSVECQnFJBj7L+BN5vxz0FilXGKzAJhf8nWODeuaVQ+xXKWm6eycsjJf9oBR6VNPsLPjZVs+Pw+fLqSiuw0IDHQrchgTPdL00nRaJvagVlvKqMsVj5XoCAkuaV2RCnH366j0IISCOfkb+MVSfWiEtvnOVlFHMZkxniNNkApU4DHQX0SI5j/10a1OzgMavdLgKss6PORpQqWD4RhFoB8xvA4p4U4vMtuBZp5ERiplwwyyXoBiqmbKSBjvmXfejldvlk3CuI++RhxXK4AK+7fvxmcWO6+5zBK7aXKAaowug5tYPuasy1VDlArKI+fXRJQcPVQMW7VWDzUhPe2twIDAQABAoIBAC5lCUQ6tBaY6NY9yRG6Otd6sHQPiaQokxR0V3RUsNNYiuiugBAJq7TNRLxP2Bs4LLOi+Qtg0a6p1mIqQ+Gr5+hZW0wQ8gxCAUAu0dqOO17C3zXPJryFWMYG1GtFTZ+fT41IErSI+6ZOX0af6rMkJ0Hv7zFbxt3IlAE0TnrmQ1joymVqXUlW2w+mlpDScLA5fYOrAAa25qXV009FoR8t/5KqxIvZ1ba0TZQarRWngWb73Fm4VeRPLHIfdB7yKIy8JOxXllmKnp+TMR+KvjTh0l9zmiavZwdat4RvPEYRR2+4DUrTuS/ymk7Vn0rMpREKvLO/QspE8g6aaU9ueONFuCECgYEA3EB3a/NyVWsifj4H063BuvyXHwSRmpWe0i+7lILU774aHcSVgC94W5GfM45Ajf3lDUwQy3hwk8BESGkz+a7czEzbyTwXNx5498WYXsaDMsgo+uTlnZ/14744kO0iE6vXtxcVeEjKtjePUAmb7k6RkETOXB22hJyd0KSS4jLvesMCgYEA0tAjhSbDYsSIP2Sy2uo24xjZ6trq4hbKUNHV3zVZhIPqoODIhkARMlAAiSLs1oNUyfWEHSbP4Hw18w6Au3DE+Odq2uusOJNDVbJ+lHSSKqT61CRF/Qf8uLjWfIhHZmxPAizCxrzApelijZgZVSMNDw6Nw+yB3BSoGAl9Oo4ozP0CgYBvq4/g/9GcVXFrqG+3d4WeFKtaYqqgQfQAhYsJxTvJQg1jwmQ6VdckNjUNorZAR9Z2Y3awcyRBBV6ZiB1+HpZ8Twuwf/MVUzHqDhkvFF84xBti+eMhhBTbn3p2oISCjMIWZnHQRrfgo1LaNcUFknhjOT+XnMkJe47YVljSrxiUmQKBgCwn2njGQMCMR7l3fxrpWevBRcuyZOZMPb4l5XUmOITQGLHvwzCTdMakCSiwPwlDYtwWZ8CvY3Uyrx4k2IPqP+eemTwXhvAmsEDf7TFtJTx3Z+5NVreEF8QdOxfEd6gVYYskEvwLhxJ5SuI7jHrPp6mSs9Do1d5iGT9HpYpBQnyFAoGBALiuq3rEPpeeHYnL9TtkDbR5EEsyJr49Q8OuSOxxtjg92HhRd8V4OpXqbEPemfIIQaQUUYDdMBb/UGwo3sC4Z8zXi1Kmn29GAaoWmCeGyO+4eUakwepzuOoq6ffjjA8NdWFDhuhNCyKjC1Ls9tsmr82X7fKLZJ+F9fuv+7O7OInb'),
('d036fdb2-bbc3-4594-b1ed-e0a07371fc00','cd1a65c1-d767-44b4-a439-d740f5cc2ffb','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('d1020526-9857-46fa-bfa7-34b9cc31a920','85107cbc-2f93-4926-a2a6-b34c4e6ad4f8','host-sending-registration-request-must-match','true'),
('d90ee397-d50d-47dc-9a19-5ff085e05375','b1ab885d-f9bc-4f7e-9ecd-facf7359203e','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('e08ee6dc-5b00-4cca-83a4-d3c2527a773a','fd0b98ad-3007-4ec6-bf79-db122ac6472f','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('e162389b-ee9c-4007-972e-821ecf95bd0b','b1ab885d-f9bc-4f7e-9ecd-facf7359203e','allowed-protocol-mapper-types','saml-user-property-mapper'),
('ea98ae38-4b9b-482b-8b08-e7386f974bce','85107cbc-2f93-4926-a2a6-b34c4e6ad4f8','client-uris-must-match','true'),
('ebc44bb4-165a-4c43-9c77-d47eb6067416','bd876bdb-89d6-41da-9618-66b750b0af57','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('ef563152-adf7-4773-bece-c29aa9cf46fa','b1ab885d-f9bc-4f7e-9ecd-facf7359203e','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('f37e074b-e98a-4277-8a63-e27e14904c78','b1ab885d-f9bc-4f7e-9ecd-facf7359203e','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('f96bef04-ce3d-435a-a3b1-568187363c04','b7023734-b6d9-4389-b40a-f1ce3ec948a5','secret','6JPYwWpNUkqyTgRYwMX2VKGFyCNSVBpyuZq-h-SzWDPg3PjtddG_MfFSjCwpNNiTC6qG3xD0EBaHwtM6ZUeqxw');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES
('008744d2-c014-4c8c-927b-e6ca21784882','554c00ee-7e02-493b-bd97-b373f8d7bd13'),
('008744d2-c014-4c8c-927b-e6ca21784882','cb5a2399-faf1-4d13-b46d-38f157f11d7e'),
('019e93f4-0827-4ba0-8d97-899b3875f3e5','a08fa4f2-c436-442c-bacb-39a63c279eae'),
('05e71921-0426-4eec-b4af-0cb4d2637d44','b7b07e54-4bfe-4a94-ae39-901b27ac0009'),
('0b990a02-439f-49d0-8189-f916b30971ae','0d309de6-be7c-4b39-b9a1-9e4bdf6fd635'),
('0b990a02-439f-49d0-8189-f916b30971ae','0d54dc48-878c-4817-8c59-5b05ade8f3df'),
('0b990a02-439f-49d0-8189-f916b30971ae','15a37d50-92b4-44d9-93ec-dc7026c7ba08'),
('0b990a02-439f-49d0-8189-f916b30971ae','1a767434-f0cf-4923-8f17-a141787bcb85'),
('0b990a02-439f-49d0-8189-f916b30971ae','47e0bbc5-0e67-4770-ac75-bcd59819389e'),
('0b990a02-439f-49d0-8189-f916b30971ae','4a809c6d-cc2a-471c-b85e-ec44f9e7394a'),
('0b990a02-439f-49d0-8189-f916b30971ae','54e9cb66-68b9-4da4-a7e8-58524306bfbe'),
('0b990a02-439f-49d0-8189-f916b30971ae','561d9095-34b1-47d7-b6bd-db3171653b57'),
('0b990a02-439f-49d0-8189-f916b30971ae','5931be34-c269-42bf-80db-871c65b8b9a7'),
('0b990a02-439f-49d0-8189-f916b30971ae','5fbfafad-b928-40c7-88ec-cd4392e86fda'),
('0b990a02-439f-49d0-8189-f916b30971ae','629d1e9f-24eb-42c8-b471-f27cc0d1a672'),
('0b990a02-439f-49d0-8189-f916b30971ae','64a29e5d-3c7a-40f2-beba-b78e33f9460d'),
('0b990a02-439f-49d0-8189-f916b30971ae','65cfe2d7-04ad-480f-94d7-18a584faf221'),
('0b990a02-439f-49d0-8189-f916b30971ae','68d19a91-1cf0-43bf-8456-f367f9047325'),
('0b990a02-439f-49d0-8189-f916b30971ae','7a447a07-684d-4c84-b2ce-165a2c00ce60'),
('0b990a02-439f-49d0-8189-f916b30971ae','83acd6b0-353f-4ca1-babf-bc16a259a122'),
('0b990a02-439f-49d0-8189-f916b30971ae','9373a8aa-65da-4456-b0be-5f743d0fdc79'),
('0b990a02-439f-49d0-8189-f916b30971ae','9ebc43ef-b6a3-4cb1-9963-e81c93ef3025'),
('0b990a02-439f-49d0-8189-f916b30971ae','a57070a5-8b37-4429-95a5-979f2dbf4539'),
('0b990a02-439f-49d0-8189-f916b30971ae','a5919d54-5991-417d-b695-4964499383c3'),
('0b990a02-439f-49d0-8189-f916b30971ae','bc624ef0-e30f-439d-8ee5-74571e927fe6'),
('0b990a02-439f-49d0-8189-f916b30971ae','be5b5f6c-e8d5-44ff-99e1-7ff382c5bf51'),
('0b990a02-439f-49d0-8189-f916b30971ae','cd0d3db2-596a-4a7c-bb67-b45d902cd97c'),
('0b990a02-439f-49d0-8189-f916b30971ae','d0b84620-47bc-4d11-ab14-ecf4545871e4'),
('0b990a02-439f-49d0-8189-f916b30971ae','d42d05cb-65f6-459d-bf31-974a41876d75'),
('0b990a02-439f-49d0-8189-f916b30971ae','e13afb1b-7a07-41b0-9462-cbba2ae30e2c'),
('0b990a02-439f-49d0-8189-f916b30971ae','e2c59dac-2fff-4e97-be0d-2a39c682d45c'),
('0b990a02-439f-49d0-8189-f916b30971ae','e408a432-9227-41b7-85a4-e6ddb5116681'),
('0b990a02-439f-49d0-8189-f916b30971ae','ef9377ce-3e98-45b4-a370-5a04caa2c07e'),
('0b990a02-439f-49d0-8189-f916b30971ae','f1fb46f4-b7c5-4a34-99c6-d8b68cef42e5'),
('0b990a02-439f-49d0-8189-f916b30971ae','f3b6fcae-70a4-4bb8-9550-536d23522df5'),
('0b990a02-439f-49d0-8189-f916b30971ae','f5fe3269-ba15-424a-835b-26ccf761370d'),
('0b990a02-439f-49d0-8189-f916b30971ae','fac9d4c5-a29b-4fb2-9a14-cd5cbe331ad9'),
('0b990a02-439f-49d0-8189-f916b30971ae','fad0089d-f8b9-47ec-8bc3-816f63323da0'),
('0b990a02-439f-49d0-8189-f916b30971ae','fb204e73-6bb0-4aed-b4bb-cc591981d7c2'),
('0b990a02-439f-49d0-8189-f916b30971ae','fe1223de-ffd6-44f8-8d35-564986499fc2'),
('0b990a02-439f-49d0-8189-f916b30971ae','ff8ff4c4-93e4-417d-9e72-cdd98d8ff503'),
('1d9d646a-6d72-4e4d-8cf0-03701eed6808','06eab7ef-27d9-4b0f-9a42-ae70de77a19a'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','09858fe7-c31a-4ee5-a57d-4ad37e6963b1'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','1703e5cd-6009-4510-ac20-3a1ba70f1603'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','181d4cf8-ab14-41fa-a91b-015bd7c1e126'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','1b682ee9-8391-4f83-a1fa-40ee1640d8a5'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','22950bf3-644c-476b-a326-8da196af2a6f'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','35e9a91f-611c-4d54-842f-12cc582c68e7'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','3cf9ae9c-7700-4d69-93d2-13ac8044cc2d'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','5bd24962-ffd0-4484-863d-ff1b231bc492'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','602e365e-018a-48f0-b20e-07828c127cf6'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','6193f690-f21f-4921-a881-f5cf395c2d6f'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','6511071f-b77c-4bbb-994d-78ed8d05b782'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','6f15aa95-3c45-44bb-bb8d-37ae47dc66b0'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','7b28db94-1c12-4abf-9b7f-313e89b4214c'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','7f7c89f6-cdd7-4724-8cf6-0cb3f4c321ea'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','bde17232-36cc-484c-b939-676b54d0046c'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','d7e62593-be81-4949-ae12-dfcae379b00a'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','da61c368-e33b-49e9-86a8-c703a6121a92'),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','fb945782-2759-47dc-af45-2da5a8a6473c'),
('49637acc-e64b-431a-bd32-04e2a174163c','34c9f9af-c3a5-4732-a492-386952ac7ecc'),
('561d9095-34b1-47d7-b6bd-db3171653b57','54e9cb66-68b9-4da4-a7e8-58524306bfbe'),
('561d9095-34b1-47d7-b6bd-db3171653b57','5931be34-c269-42bf-80db-871c65b8b9a7'),
('5bd24962-ffd0-4484-863d-ff1b231bc492','7b28db94-1c12-4abf-9b7f-313e89b4214c'),
('64a29e5d-3c7a-40f2-beba-b78e33f9460d','4a809c6d-cc2a-471c-b85e-ec44f9e7394a'),
('64a29e5d-3c7a-40f2-beba-b78e33f9460d','be5b5f6c-e8d5-44ff-99e1-7ff382c5bf51'),
('a57070a5-8b37-4429-95a5-979f2dbf4539','0d309de6-be7c-4b39-b9a1-9e4bdf6fd635'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','0fc62b94-294f-425f-8ea4-6272ba0060fe'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','49637acc-e64b-431a-bd32-04e2a174163c'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','7d790bae-aa3e-489f-bbde-77ed8b3394b0'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','e0321268-5f9d-4219-abc0-80cd3c5956c4'),
('abc8d8c9-cbc4-453f-9bf0-378dc9cbd3fb','434189b7-82b2-4109-a83d-448dcdfb2672'),
('abc8d8c9-cbc4-453f-9bf0-378dc9cbd3fb','584f882f-8d56-4681-bc8f-53356f2ab7f2'),
('abc8d8c9-cbc4-453f-9bf0-378dc9cbd3fb','cf188ea3-d1ec-49eb-93dd-9e941618e3c4'),
('bde17232-36cc-484c-b939-676b54d0046c','1b682ee9-8391-4f83-a1fa-40ee1640d8a5'),
('bde17232-36cc-484c-b939-676b54d0046c','3cf9ae9c-7700-4d69-93d2-13ac8044cc2d'),
('f574919b-1e63-4602-b577-63ba30f3e6d4','180a40cf-9d9a-4188-9867-b512c0792a5e'),
('f574919b-1e63-4602-b577-63ba30f3e6d4','1d9d646a-6d72-4e4d-8cf0-03701eed6808'),
('f574919b-1e63-4602-b577-63ba30f3e6d4','1f99cb99-f166-4e8b-a79d-626183138c03'),
('f574919b-1e63-4602-b577-63ba30f3e6d4','a9ead280-5ba9-4b1d-b169-5c1e93f0454e'),
('f5fe3269-ba15-424a-835b-26ccf761370d','ef9377ce-3e98-45b4-a370-5a04caa2c07e');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext DEFAULT NULL,
  `CREDENTIAL_DATA` longtext DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES
('05707a07-1d3c-47de-a7e2-23bc8856decb',NULL,'password','0f49a48e-b9d1-4cf2-bea0-38a5c78ee5c2',1626895532292,NULL,'{\"value\":\"OlkoUbS4p9bd2K7k1T12uxls22/B/Fnv6Pcf0bkC1kWKVg74G0cHyUsEZp3oJfl4UZoMW4CG+2+VstysvQ9U+g==\",\"salt\":\"/OMHyEwyWCjxtmefucaV0A==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),
('0b0e8acd-ab87-4abb-b575-c28e726f17ae',NULL,'password','c83ed1c5-71ef-4b73-82c8-1c36477c7855',1646433624713,NULL,'{\"value\":\"FLxP/CXMgDFzzTFRsH49RWCVBbi9iUGzQUR/ZC+TMLzrks+z4xe6QTs05vNSF6aNbUyeldvSiyS1wLfa6NIiPw==\",\"salt\":\"SzdnV4oba+M2WA8guVaprA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),
('a9aa1963-e3dd-4274-b1ec-0167b709f125',NULL,'password','eddd8fe0-1111-443b-ba16-7758a463f89b',1646336990543,NULL,'{\"value\":\"5ukNLrbaDYTgsgQDdZpO59UmDubg/YyirEvb4iTSUwZ2DJ8hn9LSSx+TFMCYZiVOg6SgHQVM+68CFEucytDT1g==\",\"salt\":\"C3+QQvI/CjuA0qdlEh0AAw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),
('b9d646fb-aa74-4084-a91e-5caadd88e405',NULL,'password','1f4b031a-e728-4bab-9899-e678c9484568',1626899386836,NULL,'{\"value\":\"mrkNH+ll6YEKVT6jVkWT+0DptJcgCYXjSii/GP8AyemN1TjAr5zR2QPIPz4eoExSgP6SHhOeFBgpPd+03DLnbA==\",\"salt\":\"ML69gxvRCRRezkri68EWDg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),
('f80f26d9-ee07-4f31-b72c-58bf46c88165',NULL,'password','2957a726-1a26-45fd-b178-00348aea5542',1626899423038,NULL,'{\"value\":\"fnd3gUHUFocGsEdfihvI4L9bRJDAeXdktQqYDLxkpNvTh0RFPbUKPF2CN0d1WiaLq6O+kP2de2spuJ7nhVwdWw==\",\"salt\":\"tuK0Tj/jU3EjzdoNAVRWMA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2021-07-21 19:25:12',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2021-07-21 19:25:12',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2021-07-21 19:25:12',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2021-07-21 19:25:12',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2021-07-21 19:25:13',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2021-07-21 19:25:13',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2021-07-21 19:25:14',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2021-07-21 19:25:14',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2021-07-21 19:25:14',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2021-07-21 19:25:15',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2021-07-21 19:25:16',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2021-07-21 19:25:16',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2021-07-21 19:25:16',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-07-21 19:25:16',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-07-21 19:25:16',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-07-21 19:25:16',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-07-21 19:25:16',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2021-07-21 19:25:17',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2021-07-21 19:25:17',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2021-07-21 19:25:17',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2021-07-21 19:25:17',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2021-07-21 19:25:17',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2021-07-21 19:25:17',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2021-07-21 19:25:17',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2021-07-21 19:25:17',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2021-07-21 19:25:18',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2021-07-21 19:25:18',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2021-07-21 19:25:18',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2021-07-21 19:25:19',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2021-07-21 19:25:19',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2021-07-21 19:25:19',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2021-07-21 19:25:19',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-07-21 19:25:19',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-07-21 19:25:19',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-07-21 19:25:20',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2021-07-21 19:25:20',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-07-21 19:25:20',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2021-07-21 19:25:20',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2021-07-21 19:25:20',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-07-21 19:25:20',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-07-21 19:25:20',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2021-07-21 19:25:20',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-07-21 19:25:21',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2021-07-21 19:25:22',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-21 19:25:22',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-21 19:25:22',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-21 19:25:22',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-21 19:25:22',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-21 19:25:22',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2021-07-21 19:25:23',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2021-07-21 19:25:23',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2021-07-21 19:25:23',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2021-07-21 19:25:23',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2021-07-21 19:25:23',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-07-21 19:25:23',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-07-21 19:25:23',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-07-21 19:25:23',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-07-21 19:25:25',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2021-07-21 19:25:25',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2021-07-21 19:25:25',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-07-21 19:25:25',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-07-21 19:25:25',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2021-07-21 19:25:25',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2021-07-21 19:25:25',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2021-07-21 19:25:25',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2021-07-21 19:25:26',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2021-07-21 19:25:26',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2021-07-21 19:25:26',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2021-07-21 19:25:26',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2021-07-21 19:25:26',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2021-07-21 19:25:26',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-21 19:25:26',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-21 19:25:26',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-21 19:25:26',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-21 19:25:26',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-21 19:25:26',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-07-21 19:25:26',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-07-21 19:25:26',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-07-21 19:25:27',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-07-21 19:25:27',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-21 19:25:27',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-21 19:25:27',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-21 19:25:27',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-21 19:25:27',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-21 19:25:27',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2021-07-21 19:25:27',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-07-21 19:25:27',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-07-21 19:25:27',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-21 19:25:27',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-21 19:25:27',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-21 19:25:27',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-21 19:25:27',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-21 19:25:27',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-21 19:25:27',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-21 19:25:27',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-21 19:25:27',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-21 19:25:27',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-21 19:25:27',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('14.0.0-KEYCLOAK-18286-mysql','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-21 19:25:27',99,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-21 19:25:27',100,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-21 19:25:27',101,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'6895510377'),
('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-02-25 21:40:34',102,'EXECUTED','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'5825234702'),
('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-02-25 21:40:34',103,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'5825234702'),
('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-02-25 21:40:34',104,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'5825234702'),
('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2022-02-25 21:40:34',105,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'5825234702');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES
(1,'\0',NULL,NULL),
(1000,'\0',NULL,NULL),
(1001,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES
('master','35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b',''),
('master','6135e0a0-41d8-44e7-b158-6099e1b9af69',''),
('master','754cd73e-b300-4bcc-8cd9-78ae5e45aa60',''),
('master','7ccf27da-91f0-4ee9-a743-8cfde6ec5578',''),
('master','812c98c1-a666-4e31-abdb-b17f13d3dcf7','\0'),
('master','829ceaa5-e3b7-451c-8f8b-51fc3ab53e47',''),
('master','8fb12bbe-64c1-45a0-b7d4-1c218543f64b','\0'),
('master','ccbb2026-d1ec-4db4-90e0-6b79f9c53555','\0'),
('master','f71f565a-b668-47ec-aa3a-ce1471ef207c','\0'),
('SmplFinance','099049c5-d947-4d92-833a-1802978f0b50','\0'),
('SmplFinance','15a2800e-c27e-4456-81a1-a40979bca698',''),
('SmplFinance','322b3887-2259-4ea0-9c64-9926bc0f9905','\0'),
('SmplFinance','35e5cb10-0112-48db-8e5f-b74dad999397','\0'),
('SmplFinance','41e8df4e-884f-41b9-9869-12945cd27116',''),
('SmplFinance','6af761ea-2f59-448c-9da0-dc4d6ea95b74',''),
('SmplFinance','6e8cedf7-0724-4417-862a-26b656de3d80',''),
('SmplFinance','8bed60a1-3231-46b9-8373-10d77c011f03','\0'),
('SmplFinance','b810e8c0-fda0-4a0b-8c36-0bb6b547eedf','');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
INSERT INTO `FEDERATED_IDENTITY` VALUES
('google','SmplFinance','110803455875001860778','jacob@s56.net',NULL,'709c179f-1dcf-4c8f-8cfc-e1e30bbae226');
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext DEFAULT NULL,
  `CREDENTIAL_DATA` longtext DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
INSERT INTO `IDENTITY_PROVIDER` VALUES
('fc08762e-70cf-4313-9c58-5cb0df1744b6','','google','google','\0','\0','SmplFinance','\0','\0','e4586902-1fa3-49b4-97c8-b01a00a36f4a',NULL,NULL,'\0');
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
INSERT INTO `IDENTITY_PROVIDER_CONFIG` VALUES
('fc08762e-70cf-4313-9c58-5cb0df1744b6','540947802593-cta0ne4j8jjvuauj70fm0hi4uv2j0bdg.apps.googleusercontent.com','clientId'),
('fc08762e-70cf-4313-9c58-5cb0df1744b6','ZRluiCam0FT8EF4DyTkTx5ZL','clientSecret'),
('fc08762e-70cf-4313-9c58-5cb0df1744b6','IMPORT','syncMode'),
('fc08762e-70cf-4313-9c58-5cb0df1744b6','true','useJwksUrl');
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES
('008744d2-c014-4c8c-927b-e6ca21784882','SmplFinance','\0',NULL,'app-admin','SmplFinance',NULL,NULL),
('019e93f4-0827-4ba0-8d97-899b3875f3e5','6779c2da-36fc-4a4d-860e-f2c3eac726cd','','${role_manage-consent}','manage-consent','master','6779c2da-36fc-4a4d-860e-f2c3eac726cd',NULL),
('05e71921-0426-4eec-b4af-0cb4d2637d44','7894795e-a846-4be3-abd8-834c89d5abb5','','${role_manage-consent}','manage-consent','SmplFinance','7894795e-a846-4be3-abd8-834c89d5abb5',NULL),
('06eab7ef-27d9-4b0f-9a42-ae70de77a19a','6779c2da-36fc-4a4d-860e-f2c3eac726cd','','${role_manage-account-links}','manage-account-links','master','6779c2da-36fc-4a4d-860e-f2c3eac726cd',NULL),
('09858fe7-c31a-4ee5-a57d-4ad37e6963b1','7136bef4-e531-407c-ac89-c05a64fca136','','${role_manage-realm}','manage-realm','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('0b990a02-439f-49d0-8189-f916b30971ae','master','\0','${role_admin}','admin','master',NULL,NULL),
('0bd255fc-26dd-430e-b0f5-d69431cc0e8d','6779c2da-36fc-4a4d-860e-f2c3eac726cd','','${role_view-applications}','view-applications','master','6779c2da-36fc-4a4d-860e-f2c3eac726cd',NULL),
('0d309de6-be7c-4b39-b9a1-9e4bdf6fd635','07e3e213-4589-42b9-95d7-3309947272dc','','${role_query-clients}','query-clients','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('0d54dc48-878c-4817-8c59-5b05ade8f3df','07e3e213-4589-42b9-95d7-3309947272dc','','${role_create-client}','create-client','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('0fc62b94-294f-425f-8ea4-6272ba0060fe','7894795e-a846-4be3-abd8-834c89d5abb5','','${role_view-profile}','view-profile','SmplFinance','7894795e-a846-4be3-abd8-834c89d5abb5',NULL),
('143d7e02-551c-4ad5-af40-779a814c2e15','7894795e-a846-4be3-abd8-834c89d5abb5','','${role_delete-account}','delete-account','SmplFinance','7894795e-a846-4be3-abd8-834c89d5abb5',NULL),
('14c137b9-71d6-4953-b3f7-4794631ec0a7','7894795e-a846-4be3-abd8-834c89d5abb5','','${role_view-applications}','view-applications','SmplFinance','7894795e-a846-4be3-abd8-834c89d5abb5',NULL),
('15a37d50-92b4-44d9-93ec-dc7026c7ba08','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_manage-authorization}','manage-authorization','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('1703e5cd-6009-4510-ac20-3a1ba70f1603','7136bef4-e531-407c-ac89-c05a64fca136','','${role_create-client}','create-client','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('180a40cf-9d9a-4188-9867-b512c0792a5e','6779c2da-36fc-4a4d-860e-f2c3eac726cd','','${role_view-profile}','view-profile','master','6779c2da-36fc-4a4d-860e-f2c3eac726cd',NULL),
('181d4cf8-ab14-41fa-a91b-015bd7c1e126','7136bef4-e531-407c-ac89-c05a64fca136','','${role_manage-authorization}','manage-authorization','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('1a767434-f0cf-4923-8f17-a141787bcb85','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_view-realm}','view-realm','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('1b682ee9-8391-4f83-a1fa-40ee1640d8a5','7136bef4-e531-407c-ac89-c05a64fca136','','${role_query-users}','query-users','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('1d9d646a-6d72-4e4d-8cf0-03701eed6808','6779c2da-36fc-4a4d-860e-f2c3eac726cd','','${role_manage-account}','manage-account','master','6779c2da-36fc-4a4d-860e-f2c3eac726cd',NULL),
('1f99cb99-f166-4e8b-a79d-626183138c03','master','\0','${role_offline-access}','offline_access','master',NULL,NULL),
('22950bf3-644c-476b-a326-8da196af2a6f','7136bef4-e531-407c-ac89-c05a64fca136','','${role_manage-users}','manage-users','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('2b74af92-eeb6-4496-bac9-83615e8af7a4','7136bef4-e531-407c-ac89-c05a64fca136','','${role_realm-admin}','realm-admin','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('2e2bcdcc-6a57-4bef-b9e2-acb87763bb5d','SmplFinance','\0',NULL,'ambassador','SmplFinance',NULL,NULL),
('34c9f9af-c3a5-4732-a492-386952ac7ecc','7894795e-a846-4be3-abd8-834c89d5abb5','','${role_manage-account-links}','manage-account-links','SmplFinance','7894795e-a846-4be3-abd8-834c89d5abb5',NULL),
('35e9a91f-611c-4d54-842f-12cc582c68e7','7136bef4-e531-407c-ac89-c05a64fca136','','${role_view-realm}','view-realm','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('3cf9ae9c-7700-4d69-93d2-13ac8044cc2d','7136bef4-e531-407c-ac89-c05a64fca136','','${role_query-groups}','query-groups','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('434189b7-82b2-4109-a83d-448dcdfb2672','c0080901-389e-4396-8762-1b0c6dfc1a00','',NULL,'user','SmplFinance','c0080901-389e-4396-8762-1b0c6dfc1a00',NULL),
('47e0bbc5-0e67-4770-ac75-bcd59819389e','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_view-events}','view-events','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('49637acc-e64b-431a-bd32-04e2a174163c','7894795e-a846-4be3-abd8-834c89d5abb5','','${role_manage-account}','manage-account','SmplFinance','7894795e-a846-4be3-abd8-834c89d5abb5',NULL),
('4a809c6d-cc2a-471c-b85e-ec44f9e7394a','07e3e213-4589-42b9-95d7-3309947272dc','','${role_query-groups}','query-groups','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('54e9cb66-68b9-4da4-a7e8-58524306bfbe','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_query-users}','query-users','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('554c00ee-7e02-493b-bd97-b373f8d7bd13','c0080901-389e-4396-8762-1b0c6dfc1a00','',NULL,'admin','SmplFinance','c0080901-389e-4396-8762-1b0c6dfc1a00',NULL),
('561d9095-34b1-47d7-b6bd-db3171653b57','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_view-users}','view-users','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('584f882f-8d56-4681-bc8f-53356f2ab7f2','1d307da5-7815-455b-92d9-d6e86113dda9','',NULL,'vault-chain-wallet-service-user','SmplFinance','1d307da5-7815-455b-92d9-d6e86113dda9',NULL),
('5931be34-c269-42bf-80db-871c65b8b9a7','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_query-groups}','query-groups','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('5bd24962-ffd0-4484-863d-ff1b231bc492','7136bef4-e531-407c-ac89-c05a64fca136','','${role_view-clients}','view-clients','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('5fbfafad-b928-40c7-88ec-cd4392e86fda','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_create-client}','create-client','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('602e365e-018a-48f0-b20e-07828c127cf6','7136bef4-e531-407c-ac89-c05a64fca136','','${role_view-events}','view-events','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('6193f690-f21f-4921-a881-f5cf395c2d6f','7136bef4-e531-407c-ac89-c05a64fca136','','${role_view-authorization}','view-authorization','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('629d1e9f-24eb-42c8-b471-f27cc0d1a672','master','\0','${role_create-realm}','create-realm','master',NULL,NULL),
('64a29e5d-3c7a-40f2-beba-b78e33f9460d','07e3e213-4589-42b9-95d7-3309947272dc','','${role_view-users}','view-users','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('6511071f-b77c-4bbb-994d-78ed8d05b782','7136bef4-e531-407c-ac89-c05a64fca136','','${role_manage-identity-providers}','manage-identity-providers','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('65cfe2d7-04ad-480f-94d7-18a584faf221','07e3e213-4589-42b9-95d7-3309947272dc','','${role_manage-clients}','manage-clients','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('68d19a91-1cf0-43bf-8456-f367f9047325','07e3e213-4589-42b9-95d7-3309947272dc','','${role_view-events}','view-events','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('6f15aa95-3c45-44bb-bb8d-37ae47dc66b0','7136bef4-e531-407c-ac89-c05a64fca136','','${role_manage-clients}','manage-clients','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('7a447a07-684d-4c84-b2ce-165a2c00ce60','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_manage-clients}','manage-clients','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('7ae1a524-d373-4ee9-8f25-d15f80b8fbc6','117a9570-c3e7-4701-a210-27364557a9ff','','${role_read-token}','read-token','master','117a9570-c3e7-4701-a210-27364557a9ff',NULL),
('7b28db94-1c12-4abf-9b7f-313e89b4214c','7136bef4-e531-407c-ac89-c05a64fca136','','${role_query-clients}','query-clients','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('7d790bae-aa3e-489f-bbde-77ed8b3394b0','SmplFinance','\0','${role_offline-access}','offline_access','SmplFinance',NULL,NULL),
('7f7c89f6-cdd7-4724-8cf6-0cb3f4c321ea','7136bef4-e531-407c-ac89-c05a64fca136','','${role_query-realms}','query-realms','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('83acd6b0-353f-4ca1-babf-bc16a259a122','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_manage-users}','manage-users','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('88ee9e8f-1903-4649-bdb3-b348438322ff','6779c2da-36fc-4a4d-860e-f2c3eac726cd','','${role_delete-account}','delete-account','master','6779c2da-36fc-4a4d-860e-f2c3eac726cd',NULL),
('9373a8aa-65da-4456-b0be-5f743d0fdc79','07e3e213-4589-42b9-95d7-3309947272dc','','${role_manage-identity-providers}','manage-identity-providers','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('9ebc43ef-b6a3-4cb1-9963-e81c93ef3025','07e3e213-4589-42b9-95d7-3309947272dc','','${role_manage-authorization}','manage-authorization','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('a08fa4f2-c436-442c-bacb-39a63c279eae','6779c2da-36fc-4a4d-860e-f2c3eac726cd','','${role_view-consent}','view-consent','master','6779c2da-36fc-4a4d-860e-f2c3eac726cd',NULL),
('a57070a5-8b37-4429-95a5-979f2dbf4539','07e3e213-4589-42b9-95d7-3309947272dc','','${role_view-clients}','view-clients','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('a570f45c-cf46-4e74-8810-89c734e51ad6','SmplFinance','\0','${role_default-roles}','default-roles-smplfinance','SmplFinance',NULL,NULL),
('a5919d54-5991-417d-b695-4964499383c3','07e3e213-4589-42b9-95d7-3309947272dc','','${role_impersonation}','impersonation','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('a9ead280-5ba9-4b1d-b169-5c1e93f0454e','master','\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),
('abc8d8c9-cbc4-453f-9bf0-378dc9cbd3fb','SmplFinance','\0',NULL,'app-user','SmplFinance',NULL,NULL),
('b7b07e54-4bfe-4a94-ae39-901b27ac0009','7894795e-a846-4be3-abd8-834c89d5abb5','','${role_view-consent}','view-consent','SmplFinance','7894795e-a846-4be3-abd8-834c89d5abb5',NULL),
('bc624ef0-e30f-439d-8ee5-74571e927fe6','07e3e213-4589-42b9-95d7-3309947272dc','','${role_query-realms}','query-realms','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('bde17232-36cc-484c-b939-676b54d0046c','7136bef4-e531-407c-ac89-c05a64fca136','','${role_view-users}','view-users','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('be5b5f6c-e8d5-44ff-99e1-7ff382c5bf51','07e3e213-4589-42b9-95d7-3309947272dc','','${role_query-users}','query-users','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('c3862078-e6a2-45b4-8b2a-f39c8a51024a','1d307da5-7815-455b-92d9-d6e86113dda9','',NULL,'uma_protection','SmplFinance','1d307da5-7815-455b-92d9-d6e86113dda9',NULL),
('cb5a2399-faf1-4d13-b46d-38f157f11d7e','3c14b29b-81ab-4b6a-83b1-04e1640759e3','',NULL,'admin','SmplFinance','3c14b29b-81ab-4b6a-83b1-04e1640759e3',NULL),
('cd0d3db2-596a-4a7c-bb67-b45d902cd97c','07e3e213-4589-42b9-95d7-3309947272dc','','${role_view-authorization}','view-authorization','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('cf188ea3-d1ec-49eb-93dd-9e941618e3c4','3c14b29b-81ab-4b6a-83b1-04e1640759e3','',NULL,'user','SmplFinance','3c14b29b-81ab-4b6a-83b1-04e1640759e3',NULL),
('d0b84620-47bc-4d11-ab14-ecf4545871e4','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_impersonation}','impersonation','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('d42d05cb-65f6-459d-bf31-974a41876d75','07e3e213-4589-42b9-95d7-3309947272dc','','${role_view-identity-providers}','view-identity-providers','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('d7e62593-be81-4949-ae12-dfcae379b00a','7136bef4-e531-407c-ac89-c05a64fca136','','${role_impersonation}','impersonation','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('da61c368-e33b-49e9-86a8-c703a6121a92','7136bef4-e531-407c-ac89-c05a64fca136','','${role_manage-events}','manage-events','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('e0321268-5f9d-4219-abc0-80cd3c5956c4','SmplFinance','\0','${role_uma_authorization}','uma_authorization','SmplFinance',NULL,NULL),
('e13afb1b-7a07-41b0-9462-cbba2ae30e2c','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_view-authorization}','view-authorization','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('e2c59dac-2fff-4e97-be0d-2a39c682d45c','07e3e213-4589-42b9-95d7-3309947272dc','','${role_manage-users}','manage-users','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('e408a432-9227-41b7-85a4-e6ddb5116681','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_query-realms}','query-realms','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('ef9377ce-3e98-45b4-a370-5a04caa2c07e','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_query-clients}','query-clients','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('f1fb46f4-b7c5-4a34-99c6-d8b68cef42e5','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_manage-events}','manage-events','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('f3b6fcae-70a4-4bb8-9550-536d23522df5','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_view-identity-providers}','view-identity-providers','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('f574919b-1e63-4602-b577-63ba30f3e6d4','master','\0','${role_default-roles}','default-roles-master','master',NULL,NULL),
('f5fe3269-ba15-424a-835b-26ccf761370d','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_view-clients}','view-clients','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('fac9d4c5-a29b-4fb2-9a14-cd5cbe331ad9','07e3e213-4589-42b9-95d7-3309947272dc','','${role_view-realm}','view-realm','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('fad0089d-f8b9-47ec-8bc3-816f63323da0','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_manage-realm}','manage-realm','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL),
('fb204e73-6bb0-4aed-b4bb-cc591981d7c2','07e3e213-4589-42b9-95d7-3309947272dc','','${role_manage-realm}','manage-realm','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('fb945782-2759-47dc-af45-2da5a8a6473c','7136bef4-e531-407c-ac89-c05a64fca136','','${role_view-identity-providers}','view-identity-providers','SmplFinance','7136bef4-e531-407c-ac89-c05a64fca136',NULL),
('fe1223de-ffd6-44f8-8d35-564986499fc2','07e3e213-4589-42b9-95d7-3309947272dc','','${role_manage-events}','manage-events','master','07e3e213-4589-42b9-95d7-3309947272dc',NULL),
('fe2dc878-e17f-48c7-a263-3a9ec7d0401c','2ec6278e-5f6b-427d-b916-62285789bbea','','${role_read-token}','read-token','SmplFinance','2ec6278e-5f6b-427d-b916-62285789bbea',NULL),
('ff8ff4c4-93e4-417d-9e72-cdd98d8ff503','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a','','${role_manage-identity-providers}','manage-identity-providers','master','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES
('ahhdh','16.1.0',1645825235),
('sdvzh','14.0.0',1626895529),
('yziha','16.1.1',1646090055);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
INSERT INTO `POLICY_CONFIG` VALUES
('05f947f0-ddf0-4ada-935d-69ebaa44c158','defaultResourceType','urn:vault-chain-wallet-service:resources:default'),
('6c39d3e1-7cee-4c9b-ac98-73c208a5abb6','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES
('085215b9-e1c4-4c85-b27d-30f3bc7873ee','username','openid-connect','oidc-usermodel-property-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('0db9357d-94bc-40f1-8be4-25826a80e436','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'322b3887-2259-4ea0-9c64-9926bc0f9905'),
('12283e0c-6cd4-4c5c-82ad-da2ee5ea8662','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('140690e7-748c-478b-9ec9-b76351102ed8','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'754cd73e-b300-4bcc-8cd9-78ae5e45aa60'),
('16ca7752-b295-4f92-a479-569940680f08','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'41e8df4e-884f-41b9-9869-12945cd27116'),
('1c552153-d171-4d18-94be-9ee09e754fcb','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('1ca10999-03f3-41b6-ba28-1f365ba9ba7b','audience resolve','openid-connect','oidc-audience-resolve-mapper','bbe6ce5e-b089-4603-8eda-d379a71fb39e',NULL),
('1db252c6-ecb4-430f-b8b4-d828d148bb66','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('26211afb-6cda-471f-b6e9-a4c43710ac75','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'322b3887-2259-4ea0-9c64-9926bc0f9905'),
('26ad1db2-c13c-4137-9d5b-22a236650b66','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('27d08e5d-e533-47ed-b3b9-1446262ac5c2','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('28535f37-8614-4620-a57f-40e0dab768e4','email','openid-connect','oidc-usermodel-property-mapper',NULL,'35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b'),
('2d492153-17a3-4171-9e78-95436d4e4e42','locale','openid-connect','oidc-usermodel-attribute-mapper','236dc851-c82e-45d5-a197-cc26d974185f',NULL),
('306becde-e9a2-483c-bea9-2fe710f3842b','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'8fb12bbe-64c1-45a0-b7d4-1c218543f64b'),
('3bc4a8b0-ff5c-4af4-beef-6968d79f236b','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','1d307da5-7815-455b-92d9-d6e86113dda9',NULL),
('42b8439c-3678-422b-91e6-9dd438bb8cb7','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('4727c0f6-c1d0-4bc6-b7ee-cbad1f00317a','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','1d307da5-7815-455b-92d9-d6e86113dda9',NULL),
('4abd3f98-a2e7-4de4-b74a-afd574168bf4','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('5144e869-da4f-4755-a561-dbd7da6b2a09','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('526adc42-8137-4472-b69f-8d0b33216d4b','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'754cd73e-b300-4bcc-8cd9-78ae5e45aa60'),
('534080a0-5579-441f-8a7c-8f47edd3fc03','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'8bed60a1-3231-46b9-8373-10d77c011f03'),
('5a6bdaa9-84ca-43dd-81b2-2679f2d4b266','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'41e8df4e-884f-41b9-9869-12945cd27116'),
('5c37be67-e1a6-458f-b688-d1149b239534','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'15a2800e-c27e-4456-81a1-a40979bca698'),
('635e5bf7-9f8d-4cd7-a940-f2547714a914','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('652c4599-2fff-4827-896f-e625c86f29f9','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbb2026-d1ec-4db4-90e0-6b79f9c53555'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','address','openid-connect','oidc-address-mapper',NULL,'35e5cb10-0112-48db-8e5f-b74dad999397'),
('6ad2c305-495e-4734-b3d9-f2c3a1da42a9','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('7312aa82-6cd0-46f0-a829-3a58378d5488','full name','openid-connect','oidc-full-name-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('7b74acd8-d1b1-464d-a121-109d5ece0c43','role list','saml','saml-role-list-mapper',NULL,'6e8cedf7-0724-4417-862a-26b656de3d80'),
('8072d28d-bc62-4c49-912e-d4fe671ee461','username','openid-connect','oidc-usermodel-property-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('815c707e-0e24-407d-999c-ae263ea7c458','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('87d88271-175d-4160-8d38-a50a94610be5','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('8993557e-f795-4ec4-9540-527cecf308f8','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('8d411741-a2e1-4a76-8e78-0d23b28cf4a2','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'7ccf27da-91f0-4ee9-a743-8cfde6ec5578'),
('929f014f-3206-4f3f-9062-993fc4e7ae5b','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('95763e04-0b56-4d62-a7fc-c042b7456dd4','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'8bed60a1-3231-46b9-8373-10d77c011f03'),
('9b5a54b6-b0a3-46bd-ae70-2d3373cc0163','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('9f5d0e66-f24f-4c73-8e31-39356a9a562e','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','1d307da5-7815-455b-92d9-d6e86113dda9',NULL),
('ab4d3d8e-6107-49c4-81d1-dc279e5278ef','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'35e1b0b1-1670-4b3f-8f4e-4f0a98f6f50b'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','address','openid-connect','oidc-address-mapper',NULL,'f71f565a-b668-47ec-aa3a-ce1471ef207c'),
('af6aa55d-126f-40aa-9d4d-0da8a6478efc','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'8fb12bbe-64c1-45a0-b7d4-1c218543f64b'),
('af83443f-e139-4582-900f-443c15159585','email','openid-connect','oidc-usermodel-property-mapper',NULL,'b810e8c0-fda0-4a0b-8c36-0bb6b547eedf'),
('b835fcba-a289-4acb-9498-013751f23838','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'b810e8c0-fda0-4a0b-8c36-0bb6b547eedf'),
('b9216225-dd67-4821-92e5-ef111189d4e8','full name','openid-connect','oidc-full-name-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('cddb92ec-399b-45f4-a7a6-b3b55bf63307','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbb2026-d1ec-4db4-90e0-6b79f9c53555'),
('d05a2b8f-ac75-4359-ba25-3b30316c7685','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('d3b47034-9a52-456a-8cb3-279ade566a7c','role list','saml','saml-role-list-mapper',NULL,'6135e0a0-41d8-44e7-b158-6099e1b9af69'),
('d49d8cab-fe7b-47a8-92c4-b2798dcaa8be','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('d53b38f8-27aa-4c7d-b355-9c2f6cfeb10c','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('d7d65241-ca53-4741-851f-64cc79d0789b','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('d8675d5d-00db-4e30-968d-0aab4447abb3','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('da1f2cc2-7824-4bb2-b681-07734ad05b8b','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('e0f8aa7e-e314-4ece-965e-49442e45245e','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('e32eefb8-4584-4de2-8f2b-354dcc0a9544','audience resolve','openid-connect','oidc-audience-resolve-mapper','0a841986-1cc5-4bfd-bf55-c2cdc15da8f5',NULL),
('eda39d81-3e72-4d7b-baed-d63aca286075','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'829ceaa5-e3b7-451c-8f8b-51fc3ab53e47'),
('f05dff41-e86f-4c01-a719-1bd95b03f4b5','locale','openid-connect','oidc-usermodel-attribute-mapper','5e90ee9d-d34f-49aa-9011-8601b65578e8',NULL),
('f418b8b3-47fe-4d37-952c-007be6f6cef0','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6af761ea-2f59-448c-9da0-dc4d6ea95b74'),
('f6693d2e-59ba-4263-ae9b-0be53b14858c','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'41e8df4e-884f-41b9-9869-12945cd27116'),
('f9662ce4-070c-40a5-a868-0f0617069cc7','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'754cd73e-b300-4bcc-8cd9-78ae5e45aa60');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES
('085215b9-e1c4-4c85-b27d-30f3bc7873ee','true','access.token.claim'),
('085215b9-e1c4-4c85-b27d-30f3bc7873ee','preferred_username','claim.name'),
('085215b9-e1c4-4c85-b27d-30f3bc7873ee','true','id.token.claim'),
('085215b9-e1c4-4c85-b27d-30f3bc7873ee','String','jsonType.label'),
('085215b9-e1c4-4c85-b27d-30f3bc7873ee','username','user.attribute'),
('085215b9-e1c4-4c85-b27d-30f3bc7873ee','true','userinfo.token.claim'),
('0db9357d-94bc-40f1-8be4-25826a80e436','true','access.token.claim'),
('0db9357d-94bc-40f1-8be4-25826a80e436','phone_number_verified','claim.name'),
('0db9357d-94bc-40f1-8be4-25826a80e436','true','id.token.claim'),
('0db9357d-94bc-40f1-8be4-25826a80e436','boolean','jsonType.label'),
('0db9357d-94bc-40f1-8be4-25826a80e436','phoneNumberVerified','user.attribute'),
('0db9357d-94bc-40f1-8be4-25826a80e436','true','userinfo.token.claim'),
('12283e0c-6cd4-4c5c-82ad-da2ee5ea8662','true','access.token.claim'),
('12283e0c-6cd4-4c5c-82ad-da2ee5ea8662','given_name','claim.name'),
('12283e0c-6cd4-4c5c-82ad-da2ee5ea8662','true','id.token.claim'),
('12283e0c-6cd4-4c5c-82ad-da2ee5ea8662','String','jsonType.label'),
('12283e0c-6cd4-4c5c-82ad-da2ee5ea8662','firstName','user.attribute'),
('12283e0c-6cd4-4c5c-82ad-da2ee5ea8662','true','userinfo.token.claim'),
('140690e7-748c-478b-9ec9-b76351102ed8','true','access.token.claim'),
('140690e7-748c-478b-9ec9-b76351102ed8','realm_access.roles','claim.name'),
('140690e7-748c-478b-9ec9-b76351102ed8','String','jsonType.label'),
('140690e7-748c-478b-9ec9-b76351102ed8','true','multivalued'),
('140690e7-748c-478b-9ec9-b76351102ed8','foo','user.attribute'),
('1c552153-d171-4d18-94be-9ee09e754fcb','true','access.token.claim'),
('1c552153-d171-4d18-94be-9ee09e754fcb','nickname','claim.name'),
('1c552153-d171-4d18-94be-9ee09e754fcb','true','id.token.claim'),
('1c552153-d171-4d18-94be-9ee09e754fcb','String','jsonType.label'),
('1c552153-d171-4d18-94be-9ee09e754fcb','nickname','user.attribute'),
('1c552153-d171-4d18-94be-9ee09e754fcb','true','userinfo.token.claim'),
('1db252c6-ecb4-430f-b8b4-d828d148bb66','true','access.token.claim'),
('1db252c6-ecb4-430f-b8b4-d828d148bb66','zoneinfo','claim.name'),
('1db252c6-ecb4-430f-b8b4-d828d148bb66','true','id.token.claim'),
('1db252c6-ecb4-430f-b8b4-d828d148bb66','String','jsonType.label'),
('1db252c6-ecb4-430f-b8b4-d828d148bb66','zoneinfo','user.attribute'),
('1db252c6-ecb4-430f-b8b4-d828d148bb66','true','userinfo.token.claim'),
('26211afb-6cda-471f-b6e9-a4c43710ac75','true','access.token.claim'),
('26211afb-6cda-471f-b6e9-a4c43710ac75','phone_number','claim.name'),
('26211afb-6cda-471f-b6e9-a4c43710ac75','true','id.token.claim'),
('26211afb-6cda-471f-b6e9-a4c43710ac75','String','jsonType.label'),
('26211afb-6cda-471f-b6e9-a4c43710ac75','phoneNumber','user.attribute'),
('26211afb-6cda-471f-b6e9-a4c43710ac75','true','userinfo.token.claim'),
('26ad1db2-c13c-4137-9d5b-22a236650b66','true','access.token.claim'),
('26ad1db2-c13c-4137-9d5b-22a236650b66','picture','claim.name'),
('26ad1db2-c13c-4137-9d5b-22a236650b66','true','id.token.claim'),
('26ad1db2-c13c-4137-9d5b-22a236650b66','String','jsonType.label'),
('26ad1db2-c13c-4137-9d5b-22a236650b66','picture','user.attribute'),
('26ad1db2-c13c-4137-9d5b-22a236650b66','true','userinfo.token.claim'),
('27d08e5d-e533-47ed-b3b9-1446262ac5c2','true','access.token.claim'),
('27d08e5d-e533-47ed-b3b9-1446262ac5c2','website','claim.name'),
('27d08e5d-e533-47ed-b3b9-1446262ac5c2','true','id.token.claim'),
('27d08e5d-e533-47ed-b3b9-1446262ac5c2','String','jsonType.label'),
('27d08e5d-e533-47ed-b3b9-1446262ac5c2','website','user.attribute'),
('27d08e5d-e533-47ed-b3b9-1446262ac5c2','true','userinfo.token.claim'),
('28535f37-8614-4620-a57f-40e0dab768e4','true','access.token.claim'),
('28535f37-8614-4620-a57f-40e0dab768e4','email','claim.name'),
('28535f37-8614-4620-a57f-40e0dab768e4','true','id.token.claim'),
('28535f37-8614-4620-a57f-40e0dab768e4','String','jsonType.label'),
('28535f37-8614-4620-a57f-40e0dab768e4','email','user.attribute'),
('28535f37-8614-4620-a57f-40e0dab768e4','true','userinfo.token.claim'),
('2d492153-17a3-4171-9e78-95436d4e4e42','true','access.token.claim'),
('2d492153-17a3-4171-9e78-95436d4e4e42','locale','claim.name'),
('2d492153-17a3-4171-9e78-95436d4e4e42','true','id.token.claim'),
('2d492153-17a3-4171-9e78-95436d4e4e42','String','jsonType.label'),
('2d492153-17a3-4171-9e78-95436d4e4e42','locale','user.attribute'),
('2d492153-17a3-4171-9e78-95436d4e4e42','true','userinfo.token.claim'),
('306becde-e9a2-483c-bea9-2fe710f3842b','true','access.token.claim'),
('306becde-e9a2-483c-bea9-2fe710f3842b','groups','claim.name'),
('306becde-e9a2-483c-bea9-2fe710f3842b','true','id.token.claim'),
('306becde-e9a2-483c-bea9-2fe710f3842b','String','jsonType.label'),
('306becde-e9a2-483c-bea9-2fe710f3842b','true','multivalued'),
('306becde-e9a2-483c-bea9-2fe710f3842b','foo','user.attribute'),
('3bc4a8b0-ff5c-4af4-beef-6968d79f236b','true','access.token.claim'),
('3bc4a8b0-ff5c-4af4-beef-6968d79f236b','clientId','claim.name'),
('3bc4a8b0-ff5c-4af4-beef-6968d79f236b','true','id.token.claim'),
('3bc4a8b0-ff5c-4af4-beef-6968d79f236b','String','jsonType.label'),
('3bc4a8b0-ff5c-4af4-beef-6968d79f236b','clientId','user.session.note'),
('42b8439c-3678-422b-91e6-9dd438bb8cb7','true','access.token.claim'),
('42b8439c-3678-422b-91e6-9dd438bb8cb7','birthdate','claim.name'),
('42b8439c-3678-422b-91e6-9dd438bb8cb7','true','id.token.claim'),
('42b8439c-3678-422b-91e6-9dd438bb8cb7','String','jsonType.label'),
('42b8439c-3678-422b-91e6-9dd438bb8cb7','birthdate','user.attribute'),
('42b8439c-3678-422b-91e6-9dd438bb8cb7','true','userinfo.token.claim'),
('4727c0f6-c1d0-4bc6-b7ee-cbad1f00317a','true','access.token.claim'),
('4727c0f6-c1d0-4bc6-b7ee-cbad1f00317a','clientAddress','claim.name'),
('4727c0f6-c1d0-4bc6-b7ee-cbad1f00317a','true','id.token.claim'),
('4727c0f6-c1d0-4bc6-b7ee-cbad1f00317a','String','jsonType.label'),
('4727c0f6-c1d0-4bc6-b7ee-cbad1f00317a','clientAddress','user.session.note'),
('4abd3f98-a2e7-4de4-b74a-afd574168bf4','true','access.token.claim'),
('4abd3f98-a2e7-4de4-b74a-afd574168bf4','gender','claim.name'),
('4abd3f98-a2e7-4de4-b74a-afd574168bf4','true','id.token.claim'),
('4abd3f98-a2e7-4de4-b74a-afd574168bf4','String','jsonType.label'),
('4abd3f98-a2e7-4de4-b74a-afd574168bf4','gender','user.attribute'),
('4abd3f98-a2e7-4de4-b74a-afd574168bf4','true','userinfo.token.claim'),
('5144e869-da4f-4755-a561-dbd7da6b2a09','true','access.token.claim'),
('5144e869-da4f-4755-a561-dbd7da6b2a09','given_name','claim.name'),
('5144e869-da4f-4755-a561-dbd7da6b2a09','true','id.token.claim'),
('5144e869-da4f-4755-a561-dbd7da6b2a09','String','jsonType.label'),
('5144e869-da4f-4755-a561-dbd7da6b2a09','firstName','user.attribute'),
('5144e869-da4f-4755-a561-dbd7da6b2a09','true','userinfo.token.claim'),
('534080a0-5579-441f-8a7c-8f47edd3fc03','true','access.token.claim'),
('534080a0-5579-441f-8a7c-8f47edd3fc03','upn','claim.name'),
('534080a0-5579-441f-8a7c-8f47edd3fc03','true','id.token.claim'),
('534080a0-5579-441f-8a7c-8f47edd3fc03','String','jsonType.label'),
('534080a0-5579-441f-8a7c-8f47edd3fc03','username','user.attribute'),
('534080a0-5579-441f-8a7c-8f47edd3fc03','true','userinfo.token.claim'),
('5a6bdaa9-84ca-43dd-81b2-2679f2d4b266','true','access.token.claim'),
('5a6bdaa9-84ca-43dd-81b2-2679f2d4b266','realm_access.roles','claim.name'),
('5a6bdaa9-84ca-43dd-81b2-2679f2d4b266','String','jsonType.label'),
('5a6bdaa9-84ca-43dd-81b2-2679f2d4b266','true','multivalued'),
('5a6bdaa9-84ca-43dd-81b2-2679f2d4b266','foo','user.attribute'),
('635e5bf7-9f8d-4cd7-a940-f2547714a914','true','access.token.claim'),
('635e5bf7-9f8d-4cd7-a940-f2547714a914','middle_name','claim.name'),
('635e5bf7-9f8d-4cd7-a940-f2547714a914','true','id.token.claim'),
('635e5bf7-9f8d-4cd7-a940-f2547714a914','String','jsonType.label'),
('635e5bf7-9f8d-4cd7-a940-f2547714a914','middleName','user.attribute'),
('635e5bf7-9f8d-4cd7-a940-f2547714a914','true','userinfo.token.claim'),
('652c4599-2fff-4827-896f-e625c86f29f9','true','access.token.claim'),
('652c4599-2fff-4827-896f-e625c86f29f9','phone_number','claim.name'),
('652c4599-2fff-4827-896f-e625c86f29f9','true','id.token.claim'),
('652c4599-2fff-4827-896f-e625c86f29f9','String','jsonType.label'),
('652c4599-2fff-4827-896f-e625c86f29f9','phoneNumber','user.attribute'),
('652c4599-2fff-4827-896f-e625c86f29f9','true','userinfo.token.claim'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','true','access.token.claim'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','true','id.token.claim'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','country','user.attribute.country'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','formatted','user.attribute.formatted'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','locality','user.attribute.locality'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','postal_code','user.attribute.postal_code'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','region','user.attribute.region'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','street','user.attribute.street'),
('68b786dc-594d-42a9-b602-5b80bcb930d1','true','userinfo.token.claim'),
('6ad2c305-495e-4734-b3d9-f2c3a1da42a9','true','access.token.claim'),
('6ad2c305-495e-4734-b3d9-f2c3a1da42a9','family_name','claim.name'),
('6ad2c305-495e-4734-b3d9-f2c3a1da42a9','true','id.token.claim'),
('6ad2c305-495e-4734-b3d9-f2c3a1da42a9','String','jsonType.label'),
('6ad2c305-495e-4734-b3d9-f2c3a1da42a9','lastName','user.attribute'),
('6ad2c305-495e-4734-b3d9-f2c3a1da42a9','true','userinfo.token.claim'),
('7312aa82-6cd0-46f0-a829-3a58378d5488','true','access.token.claim'),
('7312aa82-6cd0-46f0-a829-3a58378d5488','true','id.token.claim'),
('7312aa82-6cd0-46f0-a829-3a58378d5488','true','userinfo.token.claim'),
('7b74acd8-d1b1-464d-a121-109d5ece0c43','Role','attribute.name'),
('7b74acd8-d1b1-464d-a121-109d5ece0c43','Basic','attribute.nameformat'),
('7b74acd8-d1b1-464d-a121-109d5ece0c43','false','single'),
('8072d28d-bc62-4c49-912e-d4fe671ee461','true','access.token.claim'),
('8072d28d-bc62-4c49-912e-d4fe671ee461','preferred_username','claim.name'),
('8072d28d-bc62-4c49-912e-d4fe671ee461','true','id.token.claim'),
('8072d28d-bc62-4c49-912e-d4fe671ee461','String','jsonType.label'),
('8072d28d-bc62-4c49-912e-d4fe671ee461','username','user.attribute'),
('8072d28d-bc62-4c49-912e-d4fe671ee461','true','userinfo.token.claim'),
('815c707e-0e24-407d-999c-ae263ea7c458','true','access.token.claim'),
('815c707e-0e24-407d-999c-ae263ea7c458','family_name','claim.name'),
('815c707e-0e24-407d-999c-ae263ea7c458','true','id.token.claim'),
('815c707e-0e24-407d-999c-ae263ea7c458','String','jsonType.label'),
('815c707e-0e24-407d-999c-ae263ea7c458','lastName','user.attribute'),
('815c707e-0e24-407d-999c-ae263ea7c458','true','userinfo.token.claim'),
('87d88271-175d-4160-8d38-a50a94610be5','true','access.token.claim'),
('87d88271-175d-4160-8d38-a50a94610be5','profile','claim.name'),
('87d88271-175d-4160-8d38-a50a94610be5','true','id.token.claim'),
('87d88271-175d-4160-8d38-a50a94610be5','String','jsonType.label'),
('87d88271-175d-4160-8d38-a50a94610be5','profile','user.attribute'),
('87d88271-175d-4160-8d38-a50a94610be5','true','userinfo.token.claim'),
('8993557e-f795-4ec4-9540-527cecf308f8','true','access.token.claim'),
('8993557e-f795-4ec4-9540-527cecf308f8','middle_name','claim.name'),
('8993557e-f795-4ec4-9540-527cecf308f8','true','id.token.claim'),
('8993557e-f795-4ec4-9540-527cecf308f8','String','jsonType.label'),
('8993557e-f795-4ec4-9540-527cecf308f8','middleName','user.attribute'),
('8993557e-f795-4ec4-9540-527cecf308f8','true','userinfo.token.claim'),
('929f014f-3206-4f3f-9062-993fc4e7ae5b','true','access.token.claim'),
('929f014f-3206-4f3f-9062-993fc4e7ae5b','locale','claim.name'),
('929f014f-3206-4f3f-9062-993fc4e7ae5b','true','id.token.claim'),
('929f014f-3206-4f3f-9062-993fc4e7ae5b','String','jsonType.label'),
('929f014f-3206-4f3f-9062-993fc4e7ae5b','locale','user.attribute'),
('929f014f-3206-4f3f-9062-993fc4e7ae5b','true','userinfo.token.claim'),
('95763e04-0b56-4d62-a7fc-c042b7456dd4','true','access.token.claim'),
('95763e04-0b56-4d62-a7fc-c042b7456dd4','groups','claim.name'),
('95763e04-0b56-4d62-a7fc-c042b7456dd4','true','id.token.claim'),
('95763e04-0b56-4d62-a7fc-c042b7456dd4','String','jsonType.label'),
('95763e04-0b56-4d62-a7fc-c042b7456dd4','true','multivalued'),
('95763e04-0b56-4d62-a7fc-c042b7456dd4','foo','user.attribute'),
('95763e04-0b56-4d62-a7fc-c042b7456dd4','true','userinfo.token.claim'),
('9b5a54b6-b0a3-46bd-ae70-2d3373cc0163','true','access.token.claim'),
('9b5a54b6-b0a3-46bd-ae70-2d3373cc0163','updated_at','claim.name'),
('9b5a54b6-b0a3-46bd-ae70-2d3373cc0163','true','id.token.claim'),
('9b5a54b6-b0a3-46bd-ae70-2d3373cc0163','String','jsonType.label'),
('9b5a54b6-b0a3-46bd-ae70-2d3373cc0163','updatedAt','user.attribute'),
('9b5a54b6-b0a3-46bd-ae70-2d3373cc0163','true','userinfo.token.claim'),
('9f5d0e66-f24f-4c73-8e31-39356a9a562e','true','access.token.claim'),
('9f5d0e66-f24f-4c73-8e31-39356a9a562e','clientHost','claim.name'),
('9f5d0e66-f24f-4c73-8e31-39356a9a562e','true','id.token.claim'),
('9f5d0e66-f24f-4c73-8e31-39356a9a562e','String','jsonType.label'),
('9f5d0e66-f24f-4c73-8e31-39356a9a562e','clientHost','user.session.note'),
('ab4d3d8e-6107-49c4-81d1-dc279e5278ef','true','access.token.claim'),
('ab4d3d8e-6107-49c4-81d1-dc279e5278ef','email_verified','claim.name'),
('ab4d3d8e-6107-49c4-81d1-dc279e5278ef','true','id.token.claim'),
('ab4d3d8e-6107-49c4-81d1-dc279e5278ef','boolean','jsonType.label'),
('ab4d3d8e-6107-49c4-81d1-dc279e5278ef','emailVerified','user.attribute'),
('ab4d3d8e-6107-49c4-81d1-dc279e5278ef','true','userinfo.token.claim'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','true','access.token.claim'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','true','id.token.claim'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','country','user.attribute.country'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','formatted','user.attribute.formatted'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','locality','user.attribute.locality'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','postal_code','user.attribute.postal_code'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','region','user.attribute.region'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','street','user.attribute.street'),
('af407bba-43c3-4b70-8cdc-53efba3ef289','true','userinfo.token.claim'),
('af6aa55d-126f-40aa-9d4d-0da8a6478efc','true','access.token.claim'),
('af6aa55d-126f-40aa-9d4d-0da8a6478efc','upn','claim.name'),
('af6aa55d-126f-40aa-9d4d-0da8a6478efc','true','id.token.claim'),
('af6aa55d-126f-40aa-9d4d-0da8a6478efc','String','jsonType.label'),
('af6aa55d-126f-40aa-9d4d-0da8a6478efc','username','user.attribute'),
('af6aa55d-126f-40aa-9d4d-0da8a6478efc','true','userinfo.token.claim'),
('af83443f-e139-4582-900f-443c15159585','true','access.token.claim'),
('af83443f-e139-4582-900f-443c15159585','email','claim.name'),
('af83443f-e139-4582-900f-443c15159585','true','id.token.claim'),
('af83443f-e139-4582-900f-443c15159585','String','jsonType.label'),
('af83443f-e139-4582-900f-443c15159585','email','user.attribute'),
('af83443f-e139-4582-900f-443c15159585','true','userinfo.token.claim'),
('b835fcba-a289-4acb-9498-013751f23838','true','access.token.claim'),
('b835fcba-a289-4acb-9498-013751f23838','email_verified','claim.name'),
('b835fcba-a289-4acb-9498-013751f23838','true','id.token.claim'),
('b835fcba-a289-4acb-9498-013751f23838','boolean','jsonType.label'),
('b835fcba-a289-4acb-9498-013751f23838','emailVerified','user.attribute'),
('b835fcba-a289-4acb-9498-013751f23838','true','userinfo.token.claim'),
('b9216225-dd67-4821-92e5-ef111189d4e8','true','access.token.claim'),
('b9216225-dd67-4821-92e5-ef111189d4e8','true','id.token.claim'),
('b9216225-dd67-4821-92e5-ef111189d4e8','true','userinfo.token.claim'),
('cddb92ec-399b-45f4-a7a6-b3b55bf63307','true','access.token.claim'),
('cddb92ec-399b-45f4-a7a6-b3b55bf63307','phone_number_verified','claim.name'),
('cddb92ec-399b-45f4-a7a6-b3b55bf63307','true','id.token.claim'),
('cddb92ec-399b-45f4-a7a6-b3b55bf63307','boolean','jsonType.label'),
('cddb92ec-399b-45f4-a7a6-b3b55bf63307','phoneNumberVerified','user.attribute'),
('cddb92ec-399b-45f4-a7a6-b3b55bf63307','true','userinfo.token.claim'),
('d05a2b8f-ac75-4359-ba25-3b30316c7685','true','access.token.claim'),
('d05a2b8f-ac75-4359-ba25-3b30316c7685','zoneinfo','claim.name'),
('d05a2b8f-ac75-4359-ba25-3b30316c7685','true','id.token.claim'),
('d05a2b8f-ac75-4359-ba25-3b30316c7685','String','jsonType.label'),
('d05a2b8f-ac75-4359-ba25-3b30316c7685','zoneinfo','user.attribute'),
('d05a2b8f-ac75-4359-ba25-3b30316c7685','true','userinfo.token.claim'),
('d3b47034-9a52-456a-8cb3-279ade566a7c','Role','attribute.name'),
('d3b47034-9a52-456a-8cb3-279ade566a7c','Basic','attribute.nameformat'),
('d3b47034-9a52-456a-8cb3-279ade566a7c','false','single'),
('d49d8cab-fe7b-47a8-92c4-b2798dcaa8be','true','access.token.claim'),
('d49d8cab-fe7b-47a8-92c4-b2798dcaa8be','nickname','claim.name'),
('d49d8cab-fe7b-47a8-92c4-b2798dcaa8be','true','id.token.claim'),
('d49d8cab-fe7b-47a8-92c4-b2798dcaa8be','String','jsonType.label'),
('d49d8cab-fe7b-47a8-92c4-b2798dcaa8be','nickname','user.attribute'),
('d49d8cab-fe7b-47a8-92c4-b2798dcaa8be','true','userinfo.token.claim'),
('d53b38f8-27aa-4c7d-b355-9c2f6cfeb10c','true','access.token.claim'),
('d53b38f8-27aa-4c7d-b355-9c2f6cfeb10c','website','claim.name'),
('d53b38f8-27aa-4c7d-b355-9c2f6cfeb10c','true','id.token.claim'),
('d53b38f8-27aa-4c7d-b355-9c2f6cfeb10c','String','jsonType.label'),
('d53b38f8-27aa-4c7d-b355-9c2f6cfeb10c','website','user.attribute'),
('d53b38f8-27aa-4c7d-b355-9c2f6cfeb10c','true','userinfo.token.claim'),
('d7d65241-ca53-4741-851f-64cc79d0789b','true','access.token.claim'),
('d7d65241-ca53-4741-851f-64cc79d0789b','gender','claim.name'),
('d7d65241-ca53-4741-851f-64cc79d0789b','true','id.token.claim'),
('d7d65241-ca53-4741-851f-64cc79d0789b','String','jsonType.label'),
('d7d65241-ca53-4741-851f-64cc79d0789b','gender','user.attribute'),
('d7d65241-ca53-4741-851f-64cc79d0789b','true','userinfo.token.claim'),
('d8675d5d-00db-4e30-968d-0aab4447abb3','true','access.token.claim'),
('d8675d5d-00db-4e30-968d-0aab4447abb3','picture','claim.name'),
('d8675d5d-00db-4e30-968d-0aab4447abb3','true','id.token.claim'),
('d8675d5d-00db-4e30-968d-0aab4447abb3','String','jsonType.label'),
('d8675d5d-00db-4e30-968d-0aab4447abb3','picture','user.attribute'),
('d8675d5d-00db-4e30-968d-0aab4447abb3','true','userinfo.token.claim'),
('da1f2cc2-7824-4bb2-b681-07734ad05b8b','true','access.token.claim'),
('da1f2cc2-7824-4bb2-b681-07734ad05b8b','locale','claim.name'),
('da1f2cc2-7824-4bb2-b681-07734ad05b8b','true','id.token.claim'),
('da1f2cc2-7824-4bb2-b681-07734ad05b8b','String','jsonType.label'),
('da1f2cc2-7824-4bb2-b681-07734ad05b8b','locale','user.attribute'),
('da1f2cc2-7824-4bb2-b681-07734ad05b8b','true','userinfo.token.claim'),
('e0f8aa7e-e314-4ece-965e-49442e45245e','true','access.token.claim'),
('e0f8aa7e-e314-4ece-965e-49442e45245e','birthdate','claim.name'),
('e0f8aa7e-e314-4ece-965e-49442e45245e','true','id.token.claim'),
('e0f8aa7e-e314-4ece-965e-49442e45245e','String','jsonType.label'),
('e0f8aa7e-e314-4ece-965e-49442e45245e','birthdate','user.attribute'),
('e0f8aa7e-e314-4ece-965e-49442e45245e','true','userinfo.token.claim'),
('eda39d81-3e72-4d7b-baed-d63aca286075','true','access.token.claim'),
('eda39d81-3e72-4d7b-baed-d63aca286075','profile','claim.name'),
('eda39d81-3e72-4d7b-baed-d63aca286075','true','id.token.claim'),
('eda39d81-3e72-4d7b-baed-d63aca286075','String','jsonType.label'),
('eda39d81-3e72-4d7b-baed-d63aca286075','profile','user.attribute'),
('eda39d81-3e72-4d7b-baed-d63aca286075','true','userinfo.token.claim'),
('f05dff41-e86f-4c01-a719-1bd95b03f4b5','true','access.token.claim'),
('f05dff41-e86f-4c01-a719-1bd95b03f4b5','locale','claim.name'),
('f05dff41-e86f-4c01-a719-1bd95b03f4b5','true','id.token.claim'),
('f05dff41-e86f-4c01-a719-1bd95b03f4b5','String','jsonType.label'),
('f05dff41-e86f-4c01-a719-1bd95b03f4b5','locale','user.attribute'),
('f05dff41-e86f-4c01-a719-1bd95b03f4b5','true','userinfo.token.claim'),
('f418b8b3-47fe-4d37-952c-007be6f6cef0','true','access.token.claim'),
('f418b8b3-47fe-4d37-952c-007be6f6cef0','updated_at','claim.name'),
('f418b8b3-47fe-4d37-952c-007be6f6cef0','true','id.token.claim'),
('f418b8b3-47fe-4d37-952c-007be6f6cef0','String','jsonType.label'),
('f418b8b3-47fe-4d37-952c-007be6f6cef0','updatedAt','user.attribute'),
('f418b8b3-47fe-4d37-952c-007be6f6cef0','true','userinfo.token.claim'),
('f6693d2e-59ba-4263-ae9b-0be53b14858c','true','access.token.claim'),
('f6693d2e-59ba-4263-ae9b-0be53b14858c','resource_access.${client_id}.roles','claim.name'),
('f6693d2e-59ba-4263-ae9b-0be53b14858c','String','jsonType.label'),
('f6693d2e-59ba-4263-ae9b-0be53b14858c','true','multivalued'),
('f6693d2e-59ba-4263-ae9b-0be53b14858c','foo','user.attribute'),
('f9662ce4-070c-40a5-a868-0f0617069cc7','true','access.token.claim'),
('f9662ce4-070c-40a5-a868-0f0617069cc7','resource_access.${client_id}.roles','claim.name'),
('f9662ce4-070c-40a5-a868-0f0617069cc7','String','jsonType.label'),
('f9662ce4-070c-40a5-a868-0f0617069cc7','true','multivalued'),
('f9662ce4-070c-40a5-a868-0f0617069cc7','foo','user.attribute');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` text DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT 0,
  `OTP_POLICY_WINDOW` int(11) DEFAULT 1,
  `OTP_POLICY_PERIOD` int(11) DEFAULT 30,
  `OTP_POLICY_DIGITS` int(11) DEFAULT 6,
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT 0,
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT 0,
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT 0,
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES
('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','07e3e213-4589-42b9-95d7-3309947272dc',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','a454be13-d159-4b18-8574-2d901fb5b81e','c3fa5245-e73b-4f1e-96c2-ffd3d740b9b4','5772d09a-ae3f-455d-af79-cfe105520cc4','9a3b5e89-14e7-4131-8632-1c68e0fb44a4','4ffc4fff-0e3f-484f-8155-f1866b163c69',2592000,'\0',900,'','\0','54909597-eb73-4c96-a353-5f2ae979fb25',0,'\0',0,0,'f574919b-1e63-4602-b577-63ba30f3e6d4'),
('SmplFinance',60,300,300,NULL,NULL,NULL,'','\0',0,'SmplFinance','SmplFinance',0,NULL,'','','','\0','EXTERNAL',1800,36000,'\0','','d64602d2-65a9-4d7a-8a9b-51eba9e76d0a',1800,'\0',NULL,'','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','4ca1f4c0-395c-453c-9153-1e0af79079ca','64df7727-7f38-49b6-98c6-d9cb6cbc3040','597d36b7-2f72-428d-90f1-2b76f573b2ab','e1862423-b184-424d-9a17-ef398e7f2d9d','2f8dc40a-4c8e-40d5-8f9d-11b0de919c78',2592000,'\0',900,'','\0','9da874d4-52a8-40b4-b4fd-71a0296d4b62',0,'\0',0,0,'a570f45c-cf46-4e74-8810-89c734e51ad6');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES
('actionTokenGeneratedByAdminLifespan','SmplFinance','43200'),
('actionTokenGeneratedByUserLifespan','SmplFinance','300'),
('bruteForceProtected','master','false'),
('bruteForceProtected','SmplFinance','false'),
('cibaAuthRequestedUserHint','SmplFinance','login_hint'),
('cibaBackchannelTokenDeliveryMode','SmplFinance','poll'),
('cibaExpiresIn','SmplFinance','120'),
('cibaInterval','SmplFinance','5'),
('client-policies.policies','SmplFinance','{\"policies\":[]}'),
('client-policies.profiles','SmplFinance','{\"profiles\":[]}'),
('clientOfflineSessionIdleTimeout','SmplFinance','0'),
('clientOfflineSessionMaxLifespan','SmplFinance','0'),
('clientSessionIdleTimeout','SmplFinance','0'),
('clientSessionMaxLifespan','SmplFinance','0'),
('defaultSignatureAlgorithm','master','RS256'),
('defaultSignatureAlgorithm','SmplFinance','RS256'),
('displayName','master','Keycloak'),
('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),
('failureFactor','master','30'),
('failureFactor','SmplFinance','30'),
('maxDeltaTimeSeconds','master','43200'),
('maxDeltaTimeSeconds','SmplFinance','43200'),
('maxFailureWaitSeconds','master','900'),
('maxFailureWaitSeconds','SmplFinance','900'),
('minimumQuickLoginWaitSeconds','master','60'),
('minimumQuickLoginWaitSeconds','SmplFinance','60'),
('oauth2DeviceCodeLifespan','SmplFinance','600'),
('oauth2DevicePollingInterval','SmplFinance','5'),
('offlineSessionMaxLifespan','master','5184000'),
('offlineSessionMaxLifespan','SmplFinance','5184000'),
('offlineSessionMaxLifespanEnabled','master','false'),
('offlineSessionMaxLifespanEnabled','SmplFinance','false'),
('parRequestUriLifespan','SmplFinance','60'),
('permanentLockout','master','false'),
('permanentLockout','SmplFinance','false'),
('quickLoginCheckMilliSeconds','master','1000'),
('quickLoginCheckMilliSeconds','SmplFinance','1000'),
('waitIncrementSeconds','master','60'),
('waitIncrementSeconds','SmplFinance','60'),
('webAuthnPolicyAttestationConveyancePreference','SmplFinance','not specified'),
('webAuthnPolicyAttestationConveyancePreferencePasswordless','SmplFinance','not specified'),
('webAuthnPolicyAuthenticatorAttachment','SmplFinance','not specified'),
('webAuthnPolicyAuthenticatorAttachmentPasswordless','SmplFinance','not specified'),
('webAuthnPolicyAvoidSameAuthenticatorRegister','SmplFinance','false'),
('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','SmplFinance','false'),
('webAuthnPolicyCreateTimeout','SmplFinance','0'),
('webAuthnPolicyCreateTimeoutPasswordless','SmplFinance','0'),
('webAuthnPolicyRequireResidentKey','SmplFinance','not specified'),
('webAuthnPolicyRequireResidentKeyPasswordless','SmplFinance','not specified'),
('webAuthnPolicyRpEntityName','SmplFinance','keycloak'),
('webAuthnPolicyRpEntityNamePasswordless','SmplFinance','keycloak'),
('webAuthnPolicyRpId','SmplFinance',''),
('webAuthnPolicyRpIdPasswordless','SmplFinance',''),
('webAuthnPolicySignatureAlgorithms','SmplFinance','ES256'),
('webAuthnPolicySignatureAlgorithmsPasswordless','SmplFinance','ES256'),
('webAuthnPolicyUserVerificationRequirement','SmplFinance','not specified'),
('webAuthnPolicyUserVerificationRequirementPasswordless','SmplFinance','not specified'),
('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),
('_browser_header.contentSecurityPolicy','SmplFinance','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),
('_browser_header.contentSecurityPolicyReportOnly','master',''),
('_browser_header.contentSecurityPolicyReportOnly','SmplFinance',''),
('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),
('_browser_header.strictTransportSecurity','SmplFinance','max-age=31536000; includeSubDomains'),
('_browser_header.xContentTypeOptions','master','nosniff'),
('_browser_header.xContentTypeOptions','SmplFinance','nosniff'),
('_browser_header.xFrameOptions','master','SAMEORIGIN'),
('_browser_header.xFrameOptions','SmplFinance','SAMEORIGIN'),
('_browser_header.xRobotsTag','master','none'),
('_browser_header.xRobotsTag','SmplFinance','none'),
('_browser_header.xXSSProtection','master','1; mode=block'),
('_browser_header.xXSSProtection','SmplFinance','1; mode=block');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES
('master','jboss-logging'),
('SmplFinance','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES
('password','password','','','master'),
('password','password','','','SmplFinance');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES
('SmplFinance','');
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','/realms/SmplFinance/account/*'),
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','http://localhost:4200/*'),
('1d307da5-7815-455b-92d9-d6e86113dda9','http://localhost:8081/*'),
('236dc851-c82e-45d5-a197-cc26d974185f','/admin/SmplFinance/console/*'),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','/admin/master/console/*'),
('6779c2da-36fc-4a4d-860e-f2c3eac726cd','/realms/master/account/*'),
('7894795e-a846-4be3-abd8-834c89d5abb5','/realms/SmplFinance/account/*'),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','/realms/master/account/*'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','http://localhost*'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','http://localhost:4200/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES
('0f3849cd-b22e-45b8-ba7d-1c60ead3852c','terms_and_conditions','Terms and Conditions','SmplFinance','\0','\0','terms_and_conditions',20),
('2345fba8-502c-4e25-8869-a13c71fc334f','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD',30),
('2e4bdad7-653d-4cb7-86e4-322fe3f26a30','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL',50),
('2f833bd9-0165-4cc5-9cfa-109bc1b808d0','delete_account','Delete Account','SmplFinance','\0','\0','delete_account',60),
('4e993ddb-524a-4092-b88f-6023216496f4','CONFIGURE_TOTP','Configure OTP','SmplFinance','','\0','CONFIGURE_TOTP',10),
('58e7a57d-ddef-4652-b921-f810a0aac4d2','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE',40),
('6ec674e4-973b-44b3-b06f-8bfce51d632e','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions',20),
('6f89823f-283b-4e38-8e9d-e56d5aa9d9b7','update_user_locale','Update User Locale','SmplFinance','','\0','update_user_locale',1000),
('7e93fa8e-0f92-419f-b70a-5e439a0314e0','VERIFY_EMAIL','Verify Email','SmplFinance','','\0','VERIFY_EMAIL',50),
('89e6bd87-6b8d-49d9-a939-cf78ef063bd1','delete_account','Delete Account','master','\0','\0','delete_account',60),
('a974bec9-93d7-4e06-b488-a4de8765c060','CONFIGURE_TOTP','Configure OTP','master','','\0','CONFIGURE_TOTP',10),
('d16f3d24-bfb1-49c5-825a-55f2d2a5bdd6','UPDATE_PASSWORD','Update Password','SmplFinance','','\0','UPDATE_PASSWORD',30),
('f9980873-c053-4f45-bf8d-813e0f0fe675','update_user_locale','Update User Locale','master','','\0','update_user_locale',1000),
('fd81d697-03b1-4ebc-8cd6-79982f77b6c4','UPDATE_PROFILE','Update Profile','SmplFinance','','\0','UPDATE_PROFILE',40);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES
('1d307da5-7815-455b-92d9-d6e86113dda9','','0',1);
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES
('05f947f0-ddf0-4ada-935d-69ebaa44c158','Default Permission','A permission that applies to the default resource type','resource','1','0','1d307da5-7815-455b-92d9-d6e86113dda9',NULL),
('6c39d3e1-7cee-4c9b-ac98-73c208a5abb6','Default Policy','A policy that grants access only for users within this realm','js','0','0','1d307da5-7815-455b-92d9-d6e86113dda9',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES
('f63a7556-f085-451f-a5d5-93e38a148c66','Default Resource','urn:vault-chain-wallet-service:resources:default',NULL,'1d307da5-7815-455b-92d9-d6e86113dda9','1d307da5-7815-455b-92d9-d6e86113dda9','\0',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
INSERT INTO `RESOURCE_URIS` VALUES
('f63a7556-f085-451f-a5d5-93e38a148c66','/*');
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES
('0a841986-1cc5-4bfd-bf55-c2cdc15da8f5','49637acc-e64b-431a-bd32-04e2a174163c'),
('bbe6ce5e-b089-4603-8eda-d379a71fb39e','1d9d646a-6d72-4e4d-8cf0-03701eed6808');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES
('0f49a48e-b9d1-4cf2-bea0-38a5c78ee5c2',NULL,'7c726197-60bf-4fc6-954e-5c3256592a89','\0','',NULL,NULL,NULL,'master','admin',1626895532254,NULL,0),
('1f4b031a-e728-4bab-9899-e678c9484568',NULL,'e52fe94e-3888-47a0-8ed5-f4de087f234b','','',NULL,'Bob','Jones','SmplFinance','user1',1626899376989,NULL,0),
('2957a726-1a26-45fd-b178-00348aea5542',NULL,'e2c72f57-2017-45e8-bddb-bf4fc9875932','\0','',NULL,'Fred','Smith','SmplFinance','admin1',1626899411283,NULL,0),
('671d5b7f-2604-4de4-8cec-799508cd4451',NULL,'b0a6dc57-e1af-4d94-a381-709dfbf9988d','\0','',NULL,NULL,NULL,'SmplFinance','service-account-vault-chain-wallet-service',1641343342294,'1d307da5-7815-455b-92d9-d6e86113dda9',0),
('709c179f-1dcf-4c8f-8cfc-e1e30bbae226','jacob@s56.net','jacob@s56.net','\0','',NULL,'Jacob','Boswell','SmplFinance','jacob@s56.net',1626899275231,NULL,0),
('c83ed1c5-71ef-4b73-82c8-1c36477c7855','joanne@s56.net','joanne@s56.net','','',NULL,'Joanne','McJoan','SmplFinance','joanne@s56.net',1646433624691,NULL,0),
('d00651c1-1ef0-41b6-92fa-50622d8cdfe8','linuxninja39@gmail.com','linuxninja39@gmail.com','','',NULL,'Jacob','Boswell','SmplFinance','linuxninja39@gmail.com',1645828446424,NULL,0),
('eddd8fe0-1111-443b-ba16-7758a463f89b','billy@s56.net','billy@s56.net','','',NULL,'Billy','McBilly','SmplFinance','billy@s56.net',1646336990510,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES
('008744d2-c014-4c8c-927b-e6ca21784882','2957a726-1a26-45fd-b178-00348aea5542'),
('008744d2-c014-4c8c-927b-e6ca21784882','709c179f-1dcf-4c8f-8cfc-e1e30bbae226'),
('0b990a02-439f-49d0-8189-f916b30971ae','0f49a48e-b9d1-4cf2-bea0-38a5c78ee5c2'),
('2e2bcdcc-6a57-4bef-b9e2-acb87763bb5d','d00651c1-1ef0-41b6-92fa-50622d8cdfe8'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','1f4b031a-e728-4bab-9899-e678c9484568'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','2957a726-1a26-45fd-b178-00348aea5542'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','671d5b7f-2604-4de4-8cec-799508cd4451'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','709c179f-1dcf-4c8f-8cfc-e1e30bbae226'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','c83ed1c5-71ef-4b73-82c8-1c36477c7855'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','d00651c1-1ef0-41b6-92fa-50622d8cdfe8'),
('a570f45c-cf46-4e74-8810-89c734e51ad6','eddd8fe0-1111-443b-ba16-7758a463f89b'),
('abc8d8c9-cbc4-453f-9bf0-378dc9cbd3fb','1f4b031a-e728-4bab-9899-e678c9484568'),
('abc8d8c9-cbc4-453f-9bf0-378dc9cbd3fb','709c179f-1dcf-4c8f-8cfc-e1e30bbae226'),
('abc8d8c9-cbc4-453f-9bf0-378dc9cbd3fb','c83ed1c5-71ef-4b73-82c8-1c36477c7855'),
('abc8d8c9-cbc4-453f-9bf0-378dc9cbd3fb','eddd8fe0-1111-443b-ba16-7758a463f89b'),
('c3862078-e6a2-45b4-8b2a-f39c8a51024a','671d5b7f-2604-4de4-8cec-799508cd4451'),
('f574919b-1e63-4602-b577-63ba30f3e6d4','0f49a48e-b9d1-4cf2-bea0-38a5c78ee5c2');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES
('1c88e2ec-5b60-4619-877f-d41ce25f8baf','*'),
('236dc851-c82e-45d5-a197-cc26d974185f','+'),
('5e90ee9d-d34f-49aa-9011-8601b65578e8','+'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','*'),
('c0080901-389e-4396-8762-1b0c6dfc1a00','http://localhost:4200'),
('cdd20c44-ab46-4367-b8bf-ec4011f7468d','http://localhost:4200');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-08  9:02:49
