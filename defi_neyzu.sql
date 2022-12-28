/*
 Navicat Premium Data Transfer

 Source Server         : Dofus
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : defi_neyzu

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 28/12/2022 17:17:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'test', '$2b$10$pZ/WuEf1.sXznWoPHoWkk.mT15eXnyEllHzW2740smlqEhD8nMxzu');
INSERT INTO `account` VALUES (2, 'oui', '$2b$10$/xTPv0n1ibKP1VgwAaZ7KewOsHkdXI.ztHgfRsGbrNOnMY5dmjsfK');
INSERT INTO `account` VALUES (3, 'non', '$2b$10$LBfcPgZb/eX2xu7iGIBc3.i9KV3MxSA.c5xarUdGeMQRhDek5YAa2');
INSERT INTO `account` VALUES (4, 'neyzu', '$2b$10$3OODa2tNiB1/KuGV8QJJ.uwDXsYRbf7.XMCtL43WiVYxxIk6aIaUi');

SET FOREIGN_KEY_CHECKS = 1;
