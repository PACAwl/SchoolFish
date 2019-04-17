/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50168
Source Host           : localhost:3306
Source Database       : test15

Target Server Type    : MYSQL
Target Server Version : 50168
File Encoding         : 65001

Date: 2019-04-17 14:45:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add commodity', '7', 'add_commodity');
INSERT INTO `auth_permission` VALUES ('20', 'Can change commodity', '7', 'change_commodity');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete commodity', '7', 'delete_commodity');
INSERT INTO `auth_permission` VALUES ('22', 'Can add control', '8', 'add_control');
INSERT INTO `auth_permission` VALUES ('23', 'Can change control', '8', 'change_control');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete control', '8', 'delete_control');
INSERT INTO `auth_permission` VALUES ('25', 'Can add user', '9', 'add_user');
INSERT INTO `auth_permission` VALUES ('26', 'Can change user', '9', 'change_user');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete user', '9', 'delete_user');
INSERT INTO `auth_permission` VALUES ('28', 'Can add usercom', '10', 'add_usercom');
INSERT INTO `auth_permission` VALUES ('29', 'Can change usercom', '10', 'change_usercom');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete usercom', '10', 'delete_usercom');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'sqlapp', 'commodity');
INSERT INTO `django_content_type` VALUES ('8', 'sqlapp', 'control');
INSERT INTO `django_content_type` VALUES ('9', 'sqlapp', 'user');
INSERT INTO `django_content_type` VALUES ('10', 'sqlapp', 'usercom');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-09-14 09:29:00');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-09-14 09:29:04');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-09-14 09:29:05');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-09-14 09:29:05');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-09-14 09:29:06');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-09-14 09:29:06');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-09-14 09:29:06');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-09-14 09:29:06');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-09-14 09:29:06');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-09-14 09:29:07');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-09-14 09:29:07');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2018-09-14 09:29:07');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2018-09-14 09:29:08');
INSERT INTO `django_migrations` VALUES ('14', 'sqlapp', '0001_initial', '2018-09-14 09:29:09');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('09mt5e4cgxp2u0fmqnu0lnyl7hq05x3h', 'YjNmZTg5MzM3NDI0MzA4ZDJlYzllYTE3MjZkMjhiMzY4ZGRjNTEzYjp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2019-04-14 12:50:55');
INSERT INTO `django_session` VALUES ('19f1wg4ortkffsxigplm8su96gv1tha5', 'NTc1NDJkMGQ4YWYzZDJiOGI4NWJiZjFhYzkxYjYwYTcwZjdiOGNjMzp7ImNvbmlkIjoyLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0=', '2019-04-14 15:13:55');
INSERT INTO `django_session` VALUES ('2vzmnkkbv0vqkh5ngog2n1s7w22zafcx', 'YjNmZTg5MzM3NDI0MzA4ZDJlYzllYTE3MjZkMjhiMzY4ZGRjNTEzYjp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2018-10-17 11:14:44');
INSERT INTO `django_session` VALUES ('52fxkcp2sls95uc9gs1xib9xkh2c3z4y', 'YzY2ZWE0Yjc2MzIwZWE3NzQxZGMyN2IyYWExZGY2YzljNGNjZmZjZTp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2019-04-10 06:14:04');
INSERT INTO `django_session` VALUES ('5lrjiziuiayi7ftyb1yseqknad6idx5v', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-03 04:46:33');
INSERT INTO `django_session` VALUES ('6ea0wwdal3yx07xs5dnr5fqnw9liiemn', 'YjNmZTg5MzM3NDI0MzA4ZDJlYzllYTE3MjZkMjhiMzY4ZGRjNTEzYjp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2018-09-20 01:18:18');
INSERT INTO `django_session` VALUES ('754t2zzv3qx0tig8w5wcyhg5eprxn3oj', 'YzY2ZWE0Yjc2MzIwZWE3NzQxZGMyN2IyYWExZGY2YzljNGNjZmZjZTp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2019-04-10 06:01:52');
INSERT INTO `django_session` VALUES ('7eonjakscid1q2lbbvgrrbldplqoe86f', 'YzY2ZWE0Yjc2MzIwZWE3NzQxZGMyN2IyYWExZGY2YzljNGNjZmZjZTp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2019-04-10 05:50:58');
INSERT INTO `django_session` VALUES ('838it8sjwcf2mwmvhjm88homgk232kl5', 'YWQ4MjlmMDY4YTNiMTAzZGYzODJjYjJkNjk0OTcyYTcwMzRiZDZlZTp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2018-09-19 12:21:54');
INSERT INTO `django_session` VALUES ('8lq26b30i219r7escp7nn47wygwkcrl3', 'YzY2ZWE0Yjc2MzIwZWE3NzQxZGMyN2IyYWExZGY2YzljNGNjZmZjZTp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2019-04-13 07:25:25');
INSERT INTO `django_session` VALUES ('8oa3h7dsqy9x93isaqsbwxwqu4wg4zzh', 'NTI5MmZmMmViYzg5Mzk4Nzc5MjE5MzMwNDhlMTQyN2NlNDEzOGM3Mzp7InVzZXJpZCI6IjEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2018-10-17 10:51:57');
INSERT INTO `django_session` VALUES ('92i2cppfa7z78noh741752a97td5kgiv', 'NTc1NDJkMGQ4YWYzZDJiOGI4NWJiZjFhYzkxYjYwYTcwZjdiOGNjMzp7ImNvbmlkIjoyLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0=', '2019-04-14 15:30:05');
INSERT INTO `django_session` VALUES ('9b3sd3rto7t1fq5ike78zoa20hh9o9a2', 'ZmNmMDhhNGEzMmJkMjBmZTE2MGZhZTQyNWE3OTU1OGQxNjExMDBmMjp7InVzZXJpZCI6MywiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2019-04-12 07:03:40');
INSERT INTO `django_session` VALUES ('9e8dq8or2prbh9uy65b8bv1bbes48fc0', 'YzY2ZWE0Yjc2MzIwZWE3NzQxZGMyN2IyYWExZGY2YzljNGNjZmZjZTp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2018-09-20 03:19:33');
INSERT INTO `django_session` VALUES ('9mdlk6x47t7dxyptuhga1h6uz9kpxn37', 'ODE3ODAwYTdiNjNkOTg1NTljZTFmODdiZjlkODNhNWZhZmUzMmIxZDp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2018-09-19 12:19:16');
INSERT INTO `django_session` VALUES ('ablo2aytlar4m2ocqrlzxqr1t56q9lmh', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-03 03:51:42');
INSERT INTO `django_session` VALUES ('aukf29lbr373b28hghrz7dhqkuar1han', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-09-30 09:50:52');
INSERT INTO `django_session` VALUES ('b85me2ewjieu6wjub1wrbkiey8rml75g', 'YjNmZTg5MzM3NDI0MzA4ZDJlYzllYTE3MjZkMjhiMzY4ZGRjNTEzYjp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2018-09-20 01:34:17');
INSERT INTO `django_session` VALUES ('c7ww9lih848rjsv1q4tnbw0ov521eoj5', 'NTc1NDJkMGQ4YWYzZDJiOGI4NWJiZjFhYzkxYjYwYTcwZjdiOGNjMzp7ImNvbmlkIjoyLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0=', '2019-04-14 15:59:32');
INSERT INTO `django_session` VALUES ('ds2tjgcpa96x55rhrpyorbgspzs79hk9', 'ODE3ODAwYTdiNjNkOTg1NTljZTFmODdiZjlkODNhNWZhZmUzMmIxZDp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2018-10-17 10:04:17');
INSERT INTO `django_session` VALUES ('ed8ekfn1k6nl8ifo6zrqqarv2n7xkg8p', 'ZTc3NzY4N2JkNGI2YzlkOGQ5NjZmNDNjYWQ0MGM5Zjc0MGVhYjgyNzp7InVzZXJpZCI6MywiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2018-09-19 15:34:09');
INSERT INTO `django_session` VALUES ('f1guvwll0omnbs8pj8z8cix70qzzubvj', 'ODE3ODAwYTdiNjNkOTg1NTljZTFmODdiZjlkODNhNWZhZmUzMmIxZDp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2018-09-19 14:48:58');
INSERT INTO `django_session` VALUES ('fo0m37bkcr5ep8n72bqp9q008912xw5m', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-02 13:08:33');
INSERT INTO `django_session` VALUES ('gmhw9eetk4xn5mys8om62459enclsqzj', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-03 00:47:42');
INSERT INTO `django_session` VALUES ('h9zt6yv78zppmdy4edtv6qefxq1g2xca', 'YjNmZTg5MzM3NDI0MzA4ZDJlYzllYTE3MjZkMjhiMzY4ZGRjNTEzYjp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2018-09-20 01:44:32');
INSERT INTO `django_session` VALUES ('hm5smnrtnko8t9egwmmxu2r34xb5mrqr', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-03 05:37:24');
INSERT INTO `django_session` VALUES ('hqfwsje6hj370qsg97n0cxwns1sium13', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-03 03:16:53');
INSERT INTO `django_session` VALUES ('i8p2ya7s3qe4m9wzj387pt1rhank7q1a', 'YWQ4MjlmMDY4YTNiMTAzZGYzODJjYjJkNjk0OTcyYTcwMzRiZDZlZTp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2018-09-19 11:45:48');
INSERT INTO `django_session` VALUES ('kxs6qhywp5e969ndbz3uyi7abq6ulv5y', 'YjNmZTg5MzM3NDI0MzA4ZDJlYzllYTE3MjZkMjhiMzY4ZGRjNTEzYjp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2018-09-20 01:03:27');
INSERT INTO `django_session` VALUES ('mcpl98gmkbgamrkxe8bqj4idl8xub659', 'ODE3ODAwYTdiNjNkOTg1NTljZTFmODdiZjlkODNhNWZhZmUzMmIxZDp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2018-09-19 15:46:36');
INSERT INTO `django_session` VALUES ('mi9gnj7cslqmaxrl10qhh0yscmlecmgv', 'ODE3ODAwYTdiNjNkOTg1NTljZTFmODdiZjlkODNhNWZhZmUzMmIxZDp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2018-09-19 11:58:33');
INSERT INTO `django_session` VALUES ('n7tb4kys3w1qtmycwhoo3q1wrnet4n6i', 'NTc1NDJkMGQ4YWYzZDJiOGI4NWJiZjFhYzkxYjYwYTcwZjdiOGNjMzp7ImNvbmlkIjoyLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0=', '2019-04-14 13:23:15');
INSERT INTO `django_session` VALUES ('nfa100qyvgm6wi7f88wbe8mxkufy5oxh', 'NTc1NDJkMGQ4YWYzZDJiOGI4NWJiZjFhYzkxYjYwYTcwZjdiOGNjMzp7ImNvbmlkIjoyLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0=', '2019-04-14 15:36:18');
INSERT INTO `django_session` VALUES ('o6kso41z52pnqq63kw4hufsy3ggxsjgr', 'ZDc5NWM4ZjIwZjRiMzIzZDdjYmYzZmI1OTU0OTFhMWQ4OGQzNDUyOTp7InVzZXJpZCI6Mn0=', '2018-10-03 06:30:57');
INSERT INTO `django_session` VALUES ('oukamvzor28xj44fl0cy81kktjmfmx7j', 'YTlhZDg4MDgxOWJkMDE0YjBmOWNlNmU2Mjc3NWNkODNmNTQxMDg4Mzp7InVzZXJpZCI6MTIzNDU2Nzg5LCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0=', '2019-04-13 06:24:49');
INSERT INTO `django_session` VALUES ('oz9elfi0y5tsfdp88q7y7wrnv8ctuqr2', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-02 01:21:07');
INSERT INTO `django_session` VALUES ('r9jclc2oxuxf2dow6uz5j5tdv1g42wwa', 'ZDc5NWM4ZjIwZjRiMzIzZDdjYmYzZmI1OTU0OTFhMWQ4OGQzNDUyOTp7InVzZXJpZCI6Mn0=', '2018-10-03 06:23:29');
INSERT INTO `django_session` VALUES ('regevejyh39crjla7gj01r8abyzmgzea', 'ZDc5NWM4ZjIwZjRiMzIzZDdjYmYzZmI1OTU0OTFhMWQ4OGQzNDUyOTp7InVzZXJpZCI6Mn0=', '2018-10-03 11:15:43');
INSERT INTO `django_session` VALUES ('sin1v0mwv1s25bmbwtimb25b11uidi81', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-02 06:36:49');
INSERT INTO `django_session` VALUES ('u5zsshawpiq9fxne5i50tamucjnsb3zi', 'YjNmZTg5MzM3NDI0MzA4ZDJlYzllYTE3MjZkMjhiMzY4ZGRjNTEzYjp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2018-09-20 02:27:50');
INSERT INTO `django_session` VALUES ('uv30rna5d58v4gd1hcmhvnukfmbiyjq0', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-03 01:44:13');
INSERT INTO `django_session` VALUES ('uvt9vwqtfywaip6ydtimsvugl28r01ex', 'YjNmZTg5MzM3NDI0MzA4ZDJlYzllYTE3MjZkMjhiMzY4ZGRjNTEzYjp7InVzZXJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjozMDB9', '2018-10-17 11:52:59');
INSERT INTO `django_session` VALUES ('v95lm4xmlhle5791t69zl2lkokugo01v', 'ODE3ODAwYTdiNjNkOTg1NTljZTFmODdiZjlkODNhNWZhZmUzMmIxZDp7InVzZXJpZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2018-09-19 13:19:26');
INSERT INTO `django_session` VALUES ('vhxb49wmkm0rjfx1l2m3y2o7or7pryoi', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-03 01:44:13');
INSERT INTO `django_session` VALUES ('vtz9bpkohy2gc9jvr3iatt758rxip9fu', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-03 06:01:53');
INSERT INTO `django_session` VALUES ('x6pwqp6ifwyuhb3ijzqt2hblvtixb5z1', 'MTI4MWNlMTljNDY3ODgwMzBmZTZlYmVhNzZjNTA2YjI2NzM5YWUzMzp7InVzZXJpZCI6MX0=', '2018-10-03 09:19:23');
INSERT INTO `django_session` VALUES ('xgb04wrdhcaj5p7xkckptlkhu57vjs2s', 'NTc1NDJkMGQ4YWYzZDJiOGI4NWJiZjFhYzkxYjYwYTcwZjdiOGNjMzp7ImNvbmlkIjoyLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0=', '2019-04-14 14:57:22');
INSERT INTO `django_session` VALUES ('y65rd81yi6a0dyscmo96pgl91u0y1gdq', 'NTc1NDJkMGQ4YWYzZDJiOGI4NWJiZjFhYzkxYjYwYTcwZjdiOGNjMzp7ImNvbmlkIjoyLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0=', '2019-04-14 14:48:39');

-- ----------------------------
-- Table structure for sqlapp_commodity
-- ----------------------------
DROP TABLE IF EXISTS `sqlapp_commodity`;
CREATE TABLE `sqlapp_commodity` (
  `comid` varchar(11) NOT NULL,
  `comname` varchar(50) NOT NULL,
  `comdescribe` varchar(300) NOT NULL,
  `complace` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `userqq` varchar(20) NOT NULL,
  `usertel` varchar(20) NOT NULL,
  `dtime` date DEFAULT NULL,
  `commoney` double NOT NULL,
  `comtype` varchar(50) NOT NULL,
  PRIMARY KEY (`comid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sqlapp_commodity
-- ----------------------------
INSERT INTO `sqlapp_commodity` VALUES ('1031', '地垫', '实用，7成新', '7栋', '1', '1142000044', '13125126808', null, '10', '开学好物');
INSERT INTO `sqlapp_commodity` VALUES ('1034', '防晒霜', '全新', '7栋', '1', '1142000044', '13125126808', null, '25.6', '开学好物');
INSERT INTO `sqlapp_commodity` VALUES ('1035', '行李箱', '结实耐用,8成新', '7栋', '1', '1142000044', '13125126808', null, '100', '开学好物');
INSERT INTO `sqlapp_commodity` VALUES ('1038', '芦荟胶', '保湿效果好,全新', '7栋', '1', '1142000044', '13125126808', null, '25.6', '开学好物');
INSERT INTO `sqlapp_commodity` VALUES ('1039', '瑜伽垫', '糖果色,9成新', '7栋', '1', '1142000044', '13125126808', null, '25.6', '开学好物');
INSERT INTO `sqlapp_commodity` VALUES ('1040', '笛子', '传统乐器,8成新', '6栋', '2', '1605219059', '13125126808', null, '135.8', '乐器产品');
INSERT INTO `sqlapp_commodity` VALUES ('1041', '电子琴', '新兴乐器,9成新', '6栋', '2', '1605219059', '13125126808', null, '105.8', '乐器产品');
INSERT INTO `sqlapp_commodity` VALUES ('1042', '钢琴', '新兴乐器,8成新', '6栋', '2', '1605219059', '13125126808', null, '3356.6', '乐器产品');
INSERT INTO `sqlapp_commodity` VALUES ('1043', '古筝', '传统乐器,6成新', '6栋', '2', '1605219059', '13125126808', null, '886.8', '乐器产品');
INSERT INTO `sqlapp_commodity` VALUES ('1044', '葫芦丝', '传统乐器,8成新', '6栋', '2', '1605219059', '13125126808', null, '235.8', '乐器产品');
INSERT INTO `sqlapp_commodity` VALUES ('1045', '吉他', '新兴乐器,8成新', '6栋', '2', '1605219059', '13125126808', null, '635.4', '乐器产品');
INSERT INTO `sqlapp_commodity` VALUES ('1046', '架子鼓', '新兴乐器,8成新', '6栋', '2', '1605219059', '13125126808', null, '2035', '乐器产品');
INSERT INTO `sqlapp_commodity` VALUES ('1048', '琵琶', '传统乐器,8成新', '6栋', '2', '1605219059', '13125126808', null, '1735.8', '乐器产品');
INSERT INTO `sqlapp_commodity` VALUES ('1049', '手鼓', '传统乐器,7成新', '6栋', '2', '1605219059', '13125126808', null, '335.6', '乐器产品');
INSERT INTO `sqlapp_commodity` VALUES ('1050', '插座', '生活用品,7成新', '6栋', '2', '1605219059', '13125126808', null, '12.6', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1051', '床帘', '生活用品,7成新', '6栋', '2', '1605219059', '13125126808', null, '26.8', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1052', '风铃', '生活用品,6成新', '6栋', '2', '1605219059', '13125126808', null, '8.6', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1053', '帽子', '生活用品,8成新', '6栋', '2', '1605219059', '13125126808', null, '22.6', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1054', '盆栽', '绿色植物,', '6栋', '2', '1605219059', '13125126808', null, '12', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1055', '收纳盒', '生活用品,7成新', '6栋', '2', '1605219059', '13125126808', null, '24', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1056', '手表', '生活用品,8成新', '6栋', '2', '1605219059', '13125126808', null, '138.6', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1057', '梳妆镜', '生活用品,7成新', '6栋', '2', '1605219059', '13125126808', null, '14.8', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1058', '水晶球', '装饰品,7成新', '6栋', '2', '1605219059', '13125126808', null, '8.6', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1059', '台灯', '生活用品,7成新', '6栋', '2', '1605219059', '13125126808', null, '18', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1060', '小电风扇', '生活用品,7成新', '6栋', '2', '1605219059', '13125126808', null, '36.8', '生活用品');
INSERT INTO `sqlapp_commodity` VALUES ('1062', '耳机', '数码产品,8成新', '7栋', '1', '1142000044', '13125126808', null, '34.5', '数码产品');
INSERT INTO `sqlapp_commodity` VALUES ('1063', '华硕笔记本', '数码产品,8成新', '7栋', '1', '1142000044', '13125126808', null, '6428', '数码产品');
INSERT INTO `sqlapp_commodity` VALUES ('1064', '键盘', '数码产品,8成新', '7栋', '1', '1142000044', '13125126808', null, '128.6', '数码产品');
INSERT INTO `sqlapp_commodity` VALUES ('1065', '路由器', '数码产品,8成新', '7栋', '1', '1142000044', '13125126808', null, '80', '数码产品');
INSERT INTO `sqlapp_commodity` VALUES ('1067', '苹果手机', '数码产品,8成新', '7栋', '1', '1142000044', '13125126808', null, '6788', '数码产品');
INSERT INTO `sqlapp_commodity` VALUES ('1068', '苹果数据线', '数码产品,8成新', '7栋', '1', '1142000044', '13125126808', null, '68', '数码产品');
INSERT INTO `sqlapp_commodity` VALUES ('1069', '手表', '数码产品,8成新', '7栋', '1', '1142000044', '13125126808', null, '78.6', '数码产品');
INSERT INTO `sqlapp_commodity` VALUES ('1070', '小米手机', '数码产品,8成新', '7栋', '1', '1142000044', '13125126808', null, '3648', '数码产品');
INSERT INTO `sqlapp_commodity` VALUES ('1071', '本子', '学习资料,全新', '7栋', '1', '1142000044', '13125126808', null, '6.8', '学习资料');
INSERT INTO `sqlapp_commodity` VALUES ('1072', '笔盒', '学习用具,8成新', '7栋', '1', '1142000044', '13125126808', null, '12', '学习资料');
INSERT INTO `sqlapp_commodity` VALUES ('1073', '彩铅', '学习用具,全新', '7栋', '1', '1142000044', '13125126808', null, '3.2', '学习资料');
INSERT INTO `sqlapp_commodity` VALUES ('1074', '尺子', '学习用具,7成新', '7栋', '1', '1142000044', '13125126808', null, '1', '学习资料');
INSERT INTO `sqlapp_commodity` VALUES ('1075', '钢笔', '学习用具,9成新', '7栋', '1', '1142000044', '13125126808', null, '78.8', '学习资料');
INSERT INTO `sqlapp_commodity` VALUES ('1076', '夹子', '学习用具,8成新', '7栋', '1', '1142000044', '13125126808', null, '5', '学习资料');
INSERT INTO `sqlapp_commodity` VALUES ('1077', '书包', '学习用具,8成新', '7栋', '1', '1142000044', '13125126808', null, '54.6', '学习资料');
INSERT INTO `sqlapp_commodity` VALUES ('1078', '书架', '学习用具,6成新', '7栋', '1', '1142000044', '13125126808', null, '24', '学习资料');
INSERT INTO `sqlapp_commodity` VALUES ('1079', '圆珠笔', '学习用具,全新', '7栋', '1', '1142000044', '13125126808', null, '2', '学习资料');
INSERT INTO `sqlapp_commodity` VALUES ('1080', '字帖', '学习资料,全新', '7栋', '1', '1142000044', '13125126808', null, '16', '学习资料');

-- ----------------------------
-- Table structure for sqlapp_control
-- ----------------------------
DROP TABLE IF EXISTS `sqlapp_control`;
CREATE TABLE `sqlapp_control` (
  `conid` int(11) NOT NULL,
  `conpwd` varchar(30) NOT NULL,
  `conname` varchar(20) NOT NULL,
  `command` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`conid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sqlapp_control
-- ----------------------------
INSERT INTO `sqlapp_control` VALUES ('1', '1', '分功', '1');
INSERT INTO `sqlapp_control` VALUES ('2', '2', '斯蒂芬', null);

-- ----------------------------
-- Table structure for sqlapp_user
-- ----------------------------
DROP TABLE IF EXISTS `sqlapp_user`;
CREATE TABLE `sqlapp_user` (
  `userid` int(11) NOT NULL,
  `userpwd` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sqlapp_user
-- ----------------------------
INSERT INTO `sqlapp_user` VALUES ('1', '1', '孙国武');
INSERT INTO `sqlapp_user` VALUES ('2', '2', '宋帅');
INSERT INTO `sqlapp_user` VALUES ('3', '3', '从法国');
INSERT INTO `sqlapp_user` VALUES ('65041122', '65041122', '宋帅');
INSERT INTO `sqlapp_user` VALUES ('123456789', '123456qwe', '国文');
INSERT INTO `sqlapp_user` VALUES ('1234567891', '123456789', '宋帅');

-- ----------------------------
-- Table structure for sqlapp_usercom
-- ----------------------------
DROP TABLE IF EXISTS `sqlapp_usercom`;
CREATE TABLE `sqlapp_usercom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `comid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sqlapp_usercom
-- ----------------------------
INSERT INTO `sqlapp_usercom` VALUES ('16', '1', '1037');
INSERT INTO `sqlapp_usercom` VALUES ('17', '2', '1035');
INSERT INTO `sqlapp_usercom` VALUES ('18', '2', '1037');
