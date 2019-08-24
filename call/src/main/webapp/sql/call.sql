/*
Navicat MySQL Data Transfer

Source Server         : hptest
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : hptest

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2019-08-24 20:48:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `call`
-- ----------------------------
DROP TABLE IF EXISTS `call`;
CREATE TABLE `call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `ismanager` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of call
-- ----------------------------
INSERT INTO `call` VALUES ('1', '陈', '123', '1234123', 'we', '1');
INSERT INTO `call` VALUES ('2', '双', '123', '123', '郑州', '0');
INSERT INTO `call` VALUES ('3', '阳', '123', '12345', '商丘', '0');
INSERT INTO `call` VALUES ('4', 'chen', '123', '12345', '商丘', '0');
INSERT INTO `call` VALUES ('5', 'chen1', '123', '12345', '商丘', '0');
INSERT INTO `call` VALUES ('6', 'shuang', '123', '12345', '商丘', '0');
INSERT INTO `call` VALUES ('7', 'yang', '123', '12345', '商丘', '0');
INSERT INTO `call` VALUES ('8', '陈1', '123', '12345', '商丘', '0');
INSERT INTO `call` VALUES ('9', '双1', '123', '123', '123', '0');
INSERT INTO `call` VALUES ('10', '阳1', '123', '12', '12', '0');
