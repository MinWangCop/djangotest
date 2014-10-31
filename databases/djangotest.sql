/*
Navicat MySQL Data Transfer

Source Server         : Python
Source Server Version : 50620
Source Host           : 192.168.111.102:3306
Source Database       : djangotest

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2014-10-31 15:04:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
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
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$12000$J2aKyuwuvEgw$jMyNWDLGl7Y6ET0RSmR0sFiNfDyZvKJ+ZD4KQDWMW4E=', '2014-10-19 00:57:58', '1', 'ming', '', '', '', '1', '1', '2014-10-19 00:56:59');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `Course`
-- ----------------------------
DROP TABLE IF EXISTS `Course`;
CREATE TABLE `Course` (
  `CourseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程Id',
  `SchoolId` int(11) DEFAULT NULL COMMENT '学校Id',
  PRIMARY KEY (`CourseId`),
  KEY `FK_Reference_1` (`SchoolId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`SchoolId`) REFERENCES `School` (`SchoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Course
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
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
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'log entry', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'session', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2014-10-19 00:56:45');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2014-10-19 00:56:46');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2014-10-19 00:56:46');
INSERT INTO `django_migrations` VALUES ('4', 'sessions', '0001_initial', '2014-10-19 00:56:46');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0iidyjcdnpll88imp77i60hlfrqhn0db', 'YWQ3YTZlMjViMWI3MTc0MmUxNjc3ZmJkNjk1ZmQzYjYwODk4ZDQ3Mzp7InZhbGlkYXRlY29kZSI6WyJHIiwiViIsIk0iLCJQIl0sIl9kamFuZ29fY2FwdGNoYV9rZXkiOiJbJ0gnLCAnWicsICdSJywgJ0wnXSJ9', '2014-11-12 15:55:52');
INSERT INTO `django_session` VALUES ('pa2p19diwouwicb32o5pov2l6irdpkwb', 'MmMzNTczYWJjZTk2NDlmMTkyNjJlNjc0MjY1OTU5ZDE3NGRmMTg2Yzp7InZhbGlkYXRlY29kZSI6WyJXIiwiUSIsIk4iLCJVIl19', '2014-11-12 15:58:25');
INSERT INTO `django_session` VALUES ('vstgotg70df5fz48pzwcyp6ew17j0z76', 'YTg3N2E0NzQ4Nzg4ZTBhYmU3MTBlNmMzM2I2NGE5ZmEzZjMzOTAwYjp7InZhbGlkYXRlY29kZSI6WyJLIiwiVCIsIk0iLCJCIl19', '2014-11-14 07:03:13');
INSERT INTO `django_session` VALUES ('w8ajtybyavqpfme7l8pmo8p57fuow82c', 'NGU3ZDNhM2MwMGI5N2RiYjU2MTAxZWE0ZmFiMTEwYmY3YjJmZTJhMDp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIiLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInN1Ym1pdHRpbWUiOnRydWUsInZhbGlkYXRlY29kZSI6WyJNIiwiQyIsIksiLCJMIl0sIl9hdXRoX3VzZXJfaGFzaCI6IjFkMDA4MWFlMjhjOTU4YWUzNTIxZGIzNzdlNzk0YjAwYzhkMjRiYmIifQ==', '2014-11-09 09:49:58');
INSERT INTO `django_session` VALUES ('y719khomvrovnykrpplhtzzo6g0kzzeq', 'MGE0ZmMwNGQ2ZDZmMDUzNTgxNmU4NGFkN2UxZDljZWM3OTFlNDdiMTp7fQ==', '2014-11-12 02:45:25');

-- ----------------------------
-- Table structure for `Friends`
-- ----------------------------
DROP TABLE IF EXISTS `Friends`;
CREATE TABLE `Friends` (
  `FriendsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '合作机构Id',
  `SchoolId` int(11) DEFAULT NULL COMMENT '学校Id',
  `Logo` varchar(1024) DEFAULT NULL COMMENT '合作机构图标',
  `Content` varchar(1024) DEFAULT NULL COMMENT '合作机构简介',
  `SiteUrl` varchar(1024) DEFAULT NULL,
  `ShowHomePage` int(11) DEFAULT NULL,
  PRIMARY KEY (`FriendsId`),
  KEY `FK_Reference_4` (`SchoolId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`SchoolId`) REFERENCES `School` (`SchoolId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Friends
-- ----------------------------
INSERT INTO `Friends` VALUES ('1', null, '/static/images/flogo01.jpg', '优美缔（上海）有限公司，这是Unity在全球建立的第九个本地化分公司，标志着Unity从此正式登陆中国市场。仅仅这六个月，Unity Web Player下载量就达到4000万次，而Unity 大中华区的用户也在稳步增加，几乎达到全球数量的三分之一；与此同时，Unity 大中华区分公司开始全力为各类中国游戏开发企业及非游戏应用开发企业提供技术支持和培训工作。', 'http://unity3d.com/', '1');
INSERT INTO `Friends` VALUES ('2', null, '/static/images/flogo02.jpg', 'Unity Games中国致力于发布各平台的优质游戏，因此我们的宗旨是让游戏发行更加民主化、国际化，把好的游戏带到国内外。并为各家战略发行商合作伙伴提供最好的内容，为开发者提供最完善的增值云服务。', 'http://unity3d.com/', '1');
INSERT INTO `Friends` VALUES ('3', null, '/static/images/flogo03.jpg', '深圳英宝通科技有限公司(Powerwin)是宝德集团旗下子公司,拥有一支具有多年从事软件销售,软件研发,企业信息化产品增值服务的优秀团 队.英宝通成立以来秉承与国际领先企业共成长的理念,先后签约Microsoft, Google等国际巨擘,并成为其中国区总代理商,为其提供软件销售与增值业务服务;2012年英宝通进军游戏3D领域携手国际领先跨平台3D引擎Unity 3D,成为其中国区总代理商.经过几年磨砺,英宝通已经成长为以软件产品为核心,企业增值服务为导向的信息化企业.\r\n', 'http://unity3d.com/', '1');
INSERT INTO `Friends` VALUES ('4', null, '/static/images/flogo04.jpg', '蓝港在线一直是中国领先的网络游戏研发商和发行商，近年来，已经发展成为一家专注于研发及发行精品手机游戏的公司。\r\n我们在游戏开发过程中注重质量，并专门研发中度和重度游戏，这些游戏实现出极致的格斗体验、宏大的场面、精致的影像、丰富的内容、多元化的玩法，因此要求很强的游戏开发能力。中度和重度游戏普遍比一般游戏备有较长的生命周期及较高的充值流水，并且近期移动设备均具备高分辨率大触控屏幕，使图案影像显示更为突出，这些新控制技术对中度及重度游戏研发尤为重要。我们相信，凭借我们研发及发行中度和重度游戏的丰富经验，我们定能抓紧中度和重度手机游戏的庞大市场商机。\r\n', 'http://unity3d.com/', '1');
INSERT INTO `Friends` VALUES ('5', null, '/static/images/flogo05.jpg', '上奇科技于1991年7月在台北成立，由一群对计算机绘图软件怀抱热诚的年轻人，禀持专业负责的精神，以推动台湾计算机绘图的普及为使命，凭着专业的知识及丰富的经验，已为台湾绘图软件市场开创出一片美丽天空，俨然为此专业领域的佼佼者。在跨越21世纪的同时，上奇科技成功的建构了全亚洲（大中华区、东南亚国协(ASEAN)、韩国）区域行销服务平台，目前为大中华地区绘图、影像、多媒体及网际网络领域的专业领导者，是亚洲区最大加值行销服务提供者。总部设于台湾的上奇科技，目前于香港、北京、上海、广州、新加坡、马来西亚及韩国等地设有分公司，员工逾200名。精英齐聚的上奇科技，怀着丰沛的企图心，朝着成为亚洲信息界小巨人的愿景而迈进。\r\n', 'http://unity3d.com/', '1');
INSERT INTO `Friends` VALUES ('6', null, '/static/images/flogo06.jpg', '完美世界（北京）网络技术有限公司（以下简称：完美世界）是中国领先的网络游戏开发商和运营商之一。公司成立于2004年，致力于以自主原创为根本，以研发优质的精品网游为宗旨，以推广东方文化于世界为长远目标。\r\n凭借强大的技术实力及富有创意的游戏设计能力，完美世界迅速推出广受大众欢迎的游戏产品，以满足全球用户不断变化的需求及市场发展。作为网络游戏产品提供商，完美世界正面向全球开展业务，全面拓展海外市场。目前，已经成功的将旗下部分产品出口到了海外一百多个国家和地区。', 'http://unity3d.com/', '1');
INSERT INTO `Friends` VALUES ('7', null, '/static/images/flogo01.jpg', '优美缔（上海）有限公司，这是Unity在全球建立的第九个本地化分公司，标志着Unity从此正式登陆中国市场。仅仅这六个月，Unity Web Player下载量就达到4000万次，而Unity 大中华区的用户也在稳步增加，几乎达到全球数量的三分之一；与此同时，Unity 大中华区分公司开始全力为各类中国游戏开发企业及非游戏应用开发企业提供技术支持和培训工作。', 'http://unity3d.com/', null);
INSERT INTO `Friends` VALUES ('8', null, '/static/images/flogo02.jpg', 'Unity Games中国致力于发布各平台的优质游戏，因此我们的宗旨是让游戏发行更加民主化、国际化，把好的游戏带到国内外。并为各家战略发行商合作伙伴提供最好的内容，为开发者提供最完善的增值云服务。', 'http://unity3d.com/', null);
INSERT INTO `Friends` VALUES ('9', null, '/static/images/flogo03.jpg', '深圳英宝通科技有限公司(Powerwin)是宝德集团旗下子公司,拥有一支具有多年从事软件销售,软件研发,企业信息化产品增值服务的优秀团 队.英宝通成立以来秉承与国际领先企业共成长的理念,先后签约Microsoft, Google等国际巨擘,并成为其中国区总代理商,为其提供软件销售与增值业务服务;2012年英宝通进军游戏3D领域携手国际领先跨平台3D引擎Unity 3D,成为其中国区总代理商.经过几年磨砺,英宝通已经成长为以软件产品为核心,企业增值服务为导向的信息化企业.\r\n', 'http://unity3d.com/', null);
INSERT INTO `Friends` VALUES ('10', null, '/static/images/flogo04.jpg', '蓝港在线一直是中国领先的网络游戏研发商和发行商，近年来，已经发展成为一家专注于研发及发行精品手机游戏的公司。\r\n我们在游戏开发过程中注重质量，并专门研发中度和重度游戏，这些游戏实现出极致的格斗体验、宏大的场面、精致的影像、丰富的内容、多元化的玩法，因此要求很强的游戏开发能力。中度和重度游戏普遍比一般游戏备有较长的生命周期及较高的充值流水，并且近期移动设备均具备高分辨率大触控屏幕，使图案影像显示更为突出，这些新控制技术对中度及重度游戏研发尤为重要。我们相信，凭借我们研发及发行中度和重度游戏的丰富经验，我们定能抓紧中度和重度手机游戏的庞大市场商机。\r\n', 'http://unity3d.com/', null);
INSERT INTO `Friends` VALUES ('11', null, '/static/images/flogo05.jpg', '上奇科技于1991年7月在台北成立，由一群对计算机绘图软件怀抱热诚的年轻人，禀持专业负责的精神，以推动台湾计算机绘图的普及为使命，凭着专业的知识及丰富的经验，已为台湾绘图软件市场开创出一片美丽天空，俨然为此专业领域的佼佼者。在跨越21世纪的同时，上奇科技成功的建构了全亚洲（大中华区、东南亚国协(ASEAN)、韩国）区域行销服务平台，目前为大中华地区绘图、影像、多媒体及网际网络领域的专业领导者，是亚洲区最大加值行销服务提供者。总部设于台湾的上奇科技，目前于香港、北京、上海、广州、新加坡、马来西亚及韩国等地设有分公司，员工逾200名。精英齐聚的上奇科技，怀着丰沛的企图心，朝着成为亚洲信息界小巨人的愿景而迈进。\r\n', 'http://unity3d.com/', null);
INSERT INTO `Friends` VALUES ('12', null, '/static/images/flogo06.jpg', '完美世界（北京）网络技术有限公司（以下简称：完美世界）是中国领先的网络游戏开发商和运营商之一。公司成立于2004年，致力于以自主原创为根本，以研发优质的精品网游为宗旨，以推广东方文化于世界为长远目标。\r\n凭借强大的技术实力及富有创意的游戏设计能力，完美世界迅速推出广受大众欢迎的游戏产品，以满足全球用户不断变化的需求及市场发展。作为网络游戏产品提供商，完美世界正面向全球开展业务，全面拓展海外市场。目前，已经成功的将旗下部分产品出口到了海外一百多个国家和地区。', 'http://unity3d.com/', null);

-- ----------------------------
-- Table structure for `News`
-- ----------------------------
DROP TABLE IF EXISTS `News`;
CREATE TABLE `News` (
  `NewsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻Id',
  `SchoolId` int(11) DEFAULT NULL COMMENT '学校Id',
  `Title` varchar(512) DEFAULT NULL COMMENT '新闻标题',
  `PublishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `Content` varchar(8000) DEFAULT NULL COMMENT '新闻内容',
  `Picture` varchar(1024) DEFAULT NULL COMMENT '新闻图片',
  `BigPic` varchar(1024) DEFAULT NULL,
  `ShowHomePage` int(11) DEFAULT NULL,
  PRIMARY KEY (`NewsId`),
  KEY `FK_Reference_6` (`SchoolId`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`SchoolId`) REFERENCES `School` (`SchoolId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of News
-- ----------------------------
INSERT INTO `News` VALUES ('1', null, 'Unity 3D 在线学院正式上线', '2014-10-17 11:25:39', '此次事件发生的所在地，在湖北襄阳市保康县马桥镇尧治河村。所谓“最牛村规”，是指在今年7月22日，尧治河村出台的《尧治河村婚丧喜庆事宜管理办法》，该办法为了提倡勤俭节约，杜绝铺张浪费，规定“领导家庭（村“两委”班子成员）吸烟不得超过10元/盒，酒不得超过60元/瓶；干部家庭（企业中层副职以上干部）和中等以上收入家庭吸烟不得超过5元/盒，酒不得超过50元/瓶；普通职工家庭和普通村民家庭吸烟不得超过2元/盒，酒不得超过20元/瓶。”而10月10日，村纪委、督办室联合下发了督办处罚通报，在全村对严小平、周定福通报批评，因为他们办酒席时用了接近40元一瓶的酒和18元一包的烟，并分别给予2000元的罚款。\r\n这份村规，最引人注目的一点就是烟酒的规格分成了三个档次——这又不是发工资按贡献大小区分，自己家的婚丧喜庆事宜凭什么能规定等级？这是不是反映出当地已经出现了特权阶层，已经分化为三六九等？是不是说明当地领导干部已经相对普通民众有了深入骨髓的优越感？\r\n18元一盒的香烟，并不是什么高档产品\r\n18元一盒的香烟，并不是什么高档产品\r\n仅从这份规定来看，如果规定不仅仅是针对普通家庭执行的话，很难得到这样的结论——毕竟领导家庭允许的规格也不超过烟10元一盒、酒60元一瓶，这只能算非常普通的烟酒。而尧治河村是全国范围内都小有名气的“土豪村”。按村党委书记孙开林的说法，“我们这个山区的小城工农业总产值十几个亿，村民百分之百住上别墅，50%的家庭有车。”并不存在用不起好烟好酒的问题。尧治河村也不存在很严重的贫富悬殊，据孙开林称，被处罚的两家是村里条件最差的两家，“每年也有十几万的收入”。而且，这个村规也只是限定了在婚丧喜庆事宜上烟酒消费有上限，平时并不限制。\r\n', '/static/images/online.jpg', '/static/images/hotimg01.jpg', '1');
INSERT INTO `News` VALUES ('2', null, '应用学习班级下月将开设', '2014-10-17 11:26:03', '网易娱乐10月16日报道(文/小易) 10月16日晚，有网友在微博曝光了一张王菲和谢霆锋同行被拍的照片，并写道：“所以@veggieg 和小谢谢同行了么！”照片中，王菲和谢霆锋全副武装，戴着口罩，穿情侣帽衫，把自己遮得严严实实。这是“锋菲恋”复合后两人首次同行被拍。\r\n\r\n网友纷纷留言祝福二人“终于等到这个画面了，好幸福，祝福”，“谢霆锋王菲=终于等待这一刻了”。\r\n\r\n王菲和谢霆锋的世纪复合曾经让多人卷人了事件当中，之后两人虽忙各自事业，但在公众面前始终表露着幸福的味道。据悉，谢霆锋被曝分手后对王菲始终思念，曾两度为对方落泪。而王菲也曾私下跟闺蜜们透露，他们决定复合，单纯是因为爱。\r\n\r\n', '/static/images/unityclass.jpg', '/static/images/hotimg1.jpg', '1');
INSERT INTO `News` VALUES ('3', null, 'Unity 3D 荣获 XXX 大奖', '2014-10-17 11:26:13', '近日，知名博主“长春国贸”在其博客中曝光了朱琳和徐少华的近照。日前朱琳和徐少华在一次节目中再次相遇，有网友拍下了这张“唐僧”与“女儿国国王”的再聚首合影。\r\n\r\n不过提起老版《西游记》里的女性人物形象，很多人会想起那个多情的“女儿国国王”。 而其扮演者朱琳更被传出在拍戏时，与“唐僧”徐少华假戏真做一见钟情，默守20年未嫁。朱琳和徐少华的关系也成为中国娱乐界被炒作时间最长的绯闻。对于此事，朱琳进行了辟谣：我在进《西游记》剧组前早就结婚了。徐少华也是有家室的人。演戏就是演戏，怎能等同于生活？\r\n\r\n', '/static/images/jiangbei.jpg', '/static/images/hotimg2.jpg', '1');
INSERT INTO `News` VALUES ('4', null, 'Unity 3D 与 XXX 在线学院合作', '2014-10-17 11:28:57', '网易财经10月17日讯 周五，创业板指低位震荡，盘中一度跌破1500点，之后跌势有所缓和，截至收盘，创业板指报1511.05点，跌幅1.02%，跌破20日均线。\r\n\r\n个股方面，94只个股上涨，花园生物、利德曼、飞凯材料等9股涨停；245只个股下跌，占比近7成，飞利信下跌9.23%，领跌创业板。\r\n\r\n在外围市场低迷、IPO批文再发、经济数据低迷等多因素影响之下，A股市场迎来“黑周五”，创业板指也不例外。由此，创业板指自10月9日触及高点1569.06点以来，已经连续调整了6个交易日。\r\n\r\n创业板企业业绩方面，根据规定，创业板公司原则上需在10月15日之前披露第三季度业绩预告。截至15日，397家创业板公司已有394家预告前三季度业绩，超过六成公司报喜。不过，从数据上来看，创业板公司业绩预喜的原因更多的还是靠并购带来的提振。\r\n\r\n值得关注的创业板还出现了多家首亏公司。例如，慈星股份、沃森生物两公司预计的前三季度亏损都在亿元以上，同期，神农大丰、向日葵等公司的预计亏损也都是千万级。\r\n\r\n对于创业板的后市走向，业内人士的意见出现分歧，有分析人士指出，随着三季报披露时点的到来以及美国纳斯达克指数持续调整，创业板压力正处于持续增加的状态中，建议投资者对该板块中不具备业绩支撑的品种保持高度谨慎。\r\n\r\n', '/static/images/new.jpg', '/static/images/hotimg3.jpg', '1');

-- ----------------------------
-- Table structure for `Register`
-- ----------------------------
DROP TABLE IF EXISTS `Register`;
CREATE TABLE `Register` (
  `RegisterId` int(11) NOT NULL AUTO_INCREMENT COMMENT '注册Id',
  `SchoolId` int(11) DEFAULT NULL COMMENT '学校Id',
  `FullName` varchar(512) DEFAULT NULL COMMENT '全名',
  `Qualifications` varchar(512) DEFAULT NULL COMMENT '最高学历',
  `City` varchar(512) DEFAULT NULL COMMENT '所在城市',
  `Address1` varchar(1024) DEFAULT NULL COMMENT '详细地址1',
  `Address2` varchar(1024) DEFAULT NULL COMMENT '详细地址2',
  `Mobile` varchar(512) DEFAULT NULL COMMENT '手机号码',
  `QQNumber` varchar(512) DEFAULT NULL COMMENT 'QQ号码',
  `CurrentState` varchar(512) DEFAULT NULL COMMENT '目前状况',
  `Extended` varchar(2048) DEFAULT NULL COMMENT '补充内容',
  `regtime` datetime DEFAULT NULL,
  PRIMARY KEY (`RegisterId`),
  KEY `FK_Reference_5` (`SchoolId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`SchoolId`) REFERENCES `School` (`SchoolId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Register
-- ----------------------------
INSERT INTO `Register` VALUES ('1', null, 'dsfdsf', '中学', '天津河东区', 'dsfdsf', 'dsfdsf', 'sdfdsf', 'sdfdsf', '了解', 'dsfdsf', '2014-10-21 02:59:13');
INSERT INTO `Register` VALUES ('2', null, 'dsfsf', '中学', '河北石家庄', '第三方地方热热我', '第三方地方热热我', '18601776173', '54864963', '不了解', '第三方第三方', '2014-10-21 03:03:06');
INSERT INTO `Register` VALUES ('3', null, 'dsfd', '中专/技校', '北京东城区', 'dsfdsf', 'dsfdsf', '17728372837', 'dfdsf', '了解', 'dfdsf', '2014-10-21 03:21:00');
INSERT INTO `Register` VALUES ('4', null, 'dsfdsfdsf', '中学', '天津河东区', 'dsfdsfds', 'dsfdsfds', '18672787878', '21323424324', '了解', 'dsfdsf', '2014-10-21 03:29:56');
INSERT INTO `Register` VALUES ('5', null, 'sdfdsfdsf', '中专/技校', '山西阳泉', 'dsfdsfdsf', 'dsfdsfdsf', '12345678909', '1232344324324', '不了解', 'sdfdsfdsf', '2014-10-21 04:17:57');
INSERT INTO `Register` VALUES ('6', null, '第三方第三方', '', 'undefined', '', '', '12345678909', '43567544', '', '', '2014-10-21 04:35:54');
INSERT INTO `Register` VALUES ('7', null, '斯蒂芬第三方的', '', '', '', '', '12343543454', '234535', '', '', '2014-10-21 04:38:06');
INSERT INTO `Register` VALUES ('8', null, '斯蒂芬第三方的', '中专/技校', '河北秦皇岛', '斯蒂芬第三方', '斯蒂芬第三方', '12343543454', '234535', '了解', '的sere万人', '2014-10-21 04:38:36');
INSERT INTO `Register` VALUES ('9', null, '第三方第三方', '中学', '北京东城区', '第三方第三方', '第三方第三方', '18601776173', '234324', '了解', '第三方第三方', '2014-10-21 05:15:21');

-- ----------------------------
-- Table structure for `School`
-- ----------------------------
DROP TABLE IF EXISTS `School`;
CREATE TABLE `School` (
  `SchoolId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学校Id',
  `Content` varchar(2048) DEFAULT NULL COMMENT '学院简介',
  PRIMARY KEY (`SchoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of School
-- ----------------------------

-- ----------------------------
-- Table structure for `Student`
-- ----------------------------
DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student` (
  `StudentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学员Id',
  `SchoolId` int(11) DEFAULT NULL COMMENT '学校Id',
  `Pic` varchar(1024) DEFAULT NULL COMMENT '学员头像',
  `Content` varchar(1024) DEFAULT NULL COMMENT '学员简介',
  `title` varchar(512) DEFAULT NULL,
  `fullname` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`StudentId`),
  KEY `FK_Reference_2` (`SchoolId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`SchoolId`) REFERENCES `School` (`SchoolId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Student
-- ----------------------------
INSERT INTO `Student` VALUES ('1', null, '/static/images/person.jpg', 'fddsfdsf', 'dfdsf', '李强');
INSERT INTO `Student` VALUES ('2', null, '/static/images/person2.jpg', 'fddsfdsf', 'l;k;lk;', '李强');
INSERT INTO `Student` VALUES ('3', null, '/static/images/person.jpg', 'fddsfdsf', 'asd', '李强');
INSERT INTO `Student` VALUES ('4', null, '/static/images/person.jpg', 'fddsfdsf', 'vcxvcxv', '李强');
INSERT INTO `Student` VALUES ('6', null, '/static/images/person.jpg', 'fddsfdsf', 'wqewqe', '李强');
INSERT INTO `Student` VALUES ('13', null, '/static/images/person.jpg', 'fddsfdsf', 'dfdsf', '李强');
INSERT INTO `Student` VALUES ('14', null, '/static/images/person2.jpg', 'fddsfdsf', 'l;k;lk;', '李强');
INSERT INTO `Student` VALUES ('15', null, '/static/images/person.jpg', 'fddsfdsf', 'asd', '李强');
INSERT INTO `Student` VALUES ('16', null, '/static/images/person.jpg', 'fddsfdsf', 'vcxvcxv', '李强');
INSERT INTO `Student` VALUES ('17', null, '/static/images/person.jpg', 'fddsfdsf', 'wqewqe', '李强');

-- ----------------------------
-- Table structure for `StudentWorks`
-- ----------------------------
DROP TABLE IF EXISTS `StudentWorks`;
CREATE TABLE `StudentWorks` (
  `StudentworksId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学员作品Id',
  `SchoolId` int(11) DEFAULT NULL COMMENT '学校Id',
  `StudentId` int(11) DEFAULT NULL COMMENT '学员Id',
  `worksUrl` varchar(1024) DEFAULT NULL COMMENT '作品Url',
  `publishtime` datetime DEFAULT NULL COMMENT '发布时间',
  `studentName` varchar(1024) DEFAULT NULL COMMENT '学员姓名',
  `worksName` varchar(1024) DEFAULT NULL COMMENT '作品名称',
  `smallimg` varchar(1024) DEFAULT NULL,
  `originimg` varchar(1024) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`StudentworksId`),
  KEY `FK_Reference_7` (`SchoolId`),
  KEY `FK_Reference_9` (`StudentId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`SchoolId`) REFERENCES `School` (`SchoolId`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`StudentId`) REFERENCES `Student` (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of StudentWorks
-- ----------------------------
INSERT INTO `StudentWorks` VALUES ('1', null, '1', '/static/images/zuopin02.jpg', '2014-10-17 22:17:10', '张三', '飞越黄河', '/static/images/zuopin.jpg', '/static/images/zuopin02.jpg', 'dsfdsf');
INSERT INTO `StudentWorks` VALUES ('2', null, '2', '/static/images/zuopin02.jpg', '2014-10-08 22:17:30', '李四', '横渡长江', '/static/images/zuopin.jpg', '/static/images/zuopin02.jpg', 'dsfdsf');
INSERT INTO `StudentWorks` VALUES ('3', null, '3', '/static/images/zuopin02.jpg', '2014-10-09 22:17:51', '王武', '横跨太平洋', '/static/images/zuopin.jpg', '/static/images/zuopin02.jpg', 'dsfdsf');
INSERT INTO `StudentWorks` VALUES ('4', null, '4', '/static/images/zuopin3.jpg', '2014-10-14 22:18:13', 'Nick', '我的奋斗', '/static/images/zuopin.jpg', '/static/images/zuopin3.jpg', 'dsfdsfds');
INSERT INTO `StudentWorks` VALUES ('5', null, null, '/static/images/zuopin02.jpg', '2014-10-17 22:17:10', '张三', '飞越黄河', '/static/images/zuopin.jpg', '/static/images/zuopin02.jpg', 'dsfdsf');
INSERT INTO `StudentWorks` VALUES ('6', null, null, '/static/images/zuopin02.jpg', '2014-10-08 22:17:30', '李四', '横渡长江', '/static/images/zuopin.jpg', '/static/images/zuopin02.jpg', 'dsfdsf');
INSERT INTO `StudentWorks` VALUES ('7', null, null, '/static/images/zuopin02.jpg', '2014-10-09 22:17:51', '王武', '横跨太平洋', '/static/images/zuopin.jpg', '/static/images/zuopin02.jpg', 'dsfdsf');
INSERT INTO `StudentWorks` VALUES ('8', null, null, '/static/images/zuopin3.jpg', '2014-10-14 22:18:13', 'Nick', '我的奋斗', '/static/images/zuopin.jpg', '/static/images/zuopin3.jpg', 'dsfdsfds');

-- ----------------------------
-- Table structure for `Teacher`
-- ----------------------------
DROP TABLE IF EXISTS `Teacher`;
CREATE TABLE `Teacher` (
  `TeacherId` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师Id',
  `SchoolId` int(11) DEFAULT NULL COMMENT '学校Id',
  `photo` varchar(1024) DEFAULT NULL,
  `fullname` varchar(1024) DEFAULT NULL,
  `title` varchar(1024) DEFAULT NULL,
  `content` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`TeacherId`),
  KEY `FK_Reference_8` (`SchoolId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`SchoolId`) REFERENCES `School` (`SchoolId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Teacher
-- ----------------------------
INSERT INTO `Teacher` VALUES ('1', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('2', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('3', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('4', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('5', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('6', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('7', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('8', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('12', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('13', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('14', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('15', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('16', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('17', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('18', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
INSERT INTO `Teacher` VALUES ('19', null, '/static/images/teacher.jpg', '袁蔚 Yoyo Yuan', '世界会向那些有目标和远见的人让路', '朱培君先生在游戏领域工作多年，在中国率先利用Unity引擎开发手机游戏、虚拟应用。对游戏程序开发方面有着浓厚的功底，曾负责及参与多款游戏和大型军事模拟演练项目的程序开发工作。近年来一直从事着Unity引擎主讲工作，参与或主持课件设计及教材编写工作，在Unity教学培训方面有着丰富的经验。现担任Unity中国区教育培训师，并参与设计教育学习产品和工程的开发工作，首批持有Unity官方培训师资格认证证书（Unity Certified Instructor）。');
