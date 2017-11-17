CREATE TABLE `sys_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `app_key` varchar(100) DEFAULT NULL,
  `app_secret` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_app_app_key` (`app_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `sys_config` (
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `configValue` varchar(500) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置';

CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_organization_parent_id` (`parent_id`),
  KEY `idx_sys_organization_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_resource_parent_id` (`parent_id`),
  KEY `idx_sys_resource_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=7304 DEFAULT CHARSET=utf8;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(1000) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_role_resource_ids` (`resource_ids`(255))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `sys_sessions` (
  `id` varchar(200) NOT NULL DEFAULT '',
  `session` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_user` (
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

CREATE TABLE `sys_user_app_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `role_ids` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_app_roles_user_id_app_id` (`user_id`,`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `work_notice` (
  `id` varchar(36) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社区通知';

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

CREATE TABLE `yqfw_land_point` (
  `id` varchar(36) NOT NULL,
  `landid` varchar(45) DEFAULT NULL COMMENT '所属土地',
  `lng` decimal(10,4) DEFAULT NULL,
  `lat` decimal(10,4) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='园区土地绘制点';

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='园区监测分类';

CREATE TABLE `yqfw_monit_vals` (
  `id` varchar(36) NOT NULL,
  `type_id` varchar(50) DEFAULT NULL COMMENT '类型ID',
  `corp_id` varchar(50) DEFAULT NULL COMMENT '企业ID',
  `monitval` decimal(10,2) DEFAULT NULL COMMENT '监测值',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '监测时间',
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='园区企业监测值';

CREATE TABLE `yqfw_overproof` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyid` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `overproofvalue` varchar(200) DEFAULT NULL,
  `standardvalue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `yqfw_pipe_point` (
  `id` varchar(36) NOT NULL,
  `pipeid` varchar(45) DEFAULT NULL,
  `lng` decimal(10,4) DEFAULT NULL,
  `lat` decimal(10,4) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管线数据点';

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

CREATE TABLE `yqfw_warn_rule` (
  `id` varchar(36) NOT NULL,
  `type_id` varchar(45) DEFAULT NULL COMMENT '指标',
  `rule` varchar(45) DEFAULT NULL COMMENT '条件',
  `threshold` decimal(10,2) DEFAULT NULL COMMENT '阀值',
  `remark` varchar(255) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='监测值预警规则';
