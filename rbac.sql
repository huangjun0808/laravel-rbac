/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost
 Source Database       : rbac

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : utf-8

 Date: 09/16/2017 07:54:09 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin_permission`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL DEFAULT '' COMMENT '权限规则',
  `uri` varchar(125) NOT NULL DEFAULT '' COMMENT '路由地址',
  `label` varchar(125) NOT NULL DEFAULT '' COMMENT '权限解释名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述与备注',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0权限（默认） 1左侧菜单 2顶部菜单 3左侧+顶部菜单',
  `icon` varchar(125) NOT NULL DEFAULT '' COMMENT '图标',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permission_name_index` (`name`),
  KEY `admin_permission_cid_index` (`cid`),
  KEY `admin_permission_level_index` (`level`),
  KEY `admin_permission_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `admin_permission`
-- ----------------------------
BEGIN;
INSERT INTO `admin_permission` VALUES ('1', 'admin.permission', '', '权限管理', '', '0', '1', '0', 'fa-users', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('2', 'admin.permission.create', 'admin/permission/create', '添加权限', '', '1', '2', '0', 'fa-plus-square', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('3', 'admin.permission.destroy', 'admin/permission/{permission}', '删除权限', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('4', 'admin.permission.edit', 'admin/permission/{permission}/edit', '编辑权限', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('5', 'admin.permission.index', 'admin/permission/index', '权限列表', '', '1', '2', '1', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('6', 'admin.permission.show', 'admin/permission/{role}', '权限详情', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('7', 'admin.role.create', 'admin/role/create', '添加角色', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('8', 'admin.role.destory', 'admin/role/{role}', '删除角色', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('9', 'admin.role.edit', 'admin/role/{role}/edit ', '编辑角色', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('10', 'admin.role.index', 'admin/role/index', '角色列表', '', '1', '2', '1', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('11', 'admin.role.show', 'admin/role/index', '角色详情', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('12', 'admin.user.create', 'admin/user/create', '添加用户', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('13', 'admin.user.destory', 'admin/user/{user}', '删除用户', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('14', 'admin.user.edit', 'admin/user/{user}/edit', '编辑用户', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('15', 'admin.user.index', 'admin/user/index', '用户列表', '', '1', '2', '1', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('16', 'admin.user.show', 'admin/user/{user}', '用户详情', '', '1', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('17', 'log-viewer::dashboard', 'admin/log-viewer', '日志面板', '', '18', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('18', 'log-viewer::logs', '', '日志管理', '系统日志', '0', '1', '0', 'fa-files-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('19', 'log-viewer::logs.delete', 'admin/log-viewer/logs/delete', '删除日志', '', '18', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('20', 'log-viewer::logs.download', 'admin/log-viewer/logs/{date}/download', '日志下载', '', '18', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('21', 'log-viewer::logs.list', 'admin/log-viewer/logs', '日志列表', '', '18', '2', '1', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13'), ('22', 'log-viewer::logs.show#log-viewer::logs.filter', 'admin/log-viewer/logs/{date}||admin/log-viewer/logs/{date}/{level}', '日志详情', '', '18', '2', '0', 'fa-circle-o', '2017-05-09 20:40:13', '2017-05-09 20:40:13');
COMMIT;

-- ----------------------------
--  Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(125) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `admin_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  KEY `admin_role_permission_role_id_index` (`role_id`),
  KEY `admin_role_permission_permission_id_index` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员用户表ID',
  `name` varchar(125) NOT NULL DEFAULT '',
  `email` varchar(125) NOT NULL DEFAULT '',
  `password` varchar(125) NOT NULL DEFAULT '',
  `remember_token` varchar(100) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_user_name_unique` (`name`),
  UNIQUE KEY `admin_user_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `admin_user`
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES ('1', '超级管理员', 'root@admin.com', '$2y$10$VRbkwtHUHqhh/7Icvi4nH.gmjVdiMvPXb7BJ3VGKVoIXPfv1coebS', '', '2017-05-09 20:40:13', '2017-05-09 20:40:13');
COMMIT;

-- ----------------------------
--  Table structure for `admin_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `admin_user_role_user_id_index` (`user_id`),
  KEY `admin_user_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1'), ('2', '2014_10_12_100000_create_password_resets_table', '1'), ('3', '2017_04_26_052450_create_admin_users_table', '1'), ('4', '2017_04_26_052706_create_admin_permissions_table', '1'), ('5', '2017_04_26_052742_create_admin_roles_table', '1');
COMMIT;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(125) NOT NULL,
  `token` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL DEFAULT '',
  `email` varchar(125) NOT NULL DEFAULT '',
  `password` varchar(125) NOT NULL DEFAULT '',
  `remember_token` varchar(100) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
