/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2019-10-29 16:43:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL COMMENT '唯一ID',
  `age` int(11) NOT NULL COMMENT '年齡',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '32', '李修改', null);
INSERT INTO `user` VALUES ('132b62b5-fa27-11e9-9e14-e0db55d6116a', '25', '123456', '123');
INSERT INTO `user` VALUES ('359dbd64-fa27-11e9-9e14-e0db55d6116a', '25', 'aaa', 'a');
INSERT INTO `user` VALUES ('4', '25', 'admin', '123');
INSERT INTO `user` VALUES ('4ed8368a-fa27-11e9-9e14-e0db55d6116a', '25', 'b', 'b');
INSERT INTO `user` VALUES ('5', '25', '李测试', null);
INSERT INTO `user` VALUES ('5b5b81e3-fa27-11e9-9e14-e0db55d6116a', '25', 'c', 'c');
INSERT INTO `user` VALUES ('aef5e7e7-fa26-11e9-9e14-e0db55d6116a', '25', 'admin1', 'admin1');
