/*
 Navicat Premium Data Transfer

 Source Server         : message
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : music

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 08/07/2023 12:10:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` (`id`, `name`, `password`) VALUES (1, 'admin', '1');
INSERT INTO `admin` (`id`, `name`, `password`) VALUES (2, 'admin1', '1');
COMMIT;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) DEFAULT NULL COMMENT '收藏类型（0歌曲1歌单）',
  `song_id` int DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int DEFAULT NULL COMMENT '歌单id',
  `create_time` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='收藏';

-- ----------------------------
-- Records of collect
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) DEFAULT NULL COMMENT '评论类型（0歌曲1歌单）',
  `song_id` int DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int DEFAULT NULL COMMENT '歌单id',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime DEFAULT NULL COMMENT '收藏时间',
  `up` int DEFAULT '0' COMMENT '评论点赞数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='评论';

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '密码',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别（1男0女）',
  `phone_num` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '电话',
  `email` char(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '邮箱',
  `birth` datetime DEFAULT NULL COMMENT '生日',
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '签名',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '地区',
  `avator` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='前端用户';

-- ----------------------------
-- Records of consumer
-- ----------------------------
BEGIN;
INSERT INTO `consumer` (`id`, `username`, `password`, `sex`, `phone_num`, `email`, `birth`, `introduction`, `location`, `avator`, `create_time`, `update_time`) VALUES (26, 'yoonaAC', '123', 1, 'null', 'null', '2020-03-11 00:00:00', '', '', '/img/user.jpg', '2020-03-21 22:23:43', '2020-04-05 03:30:34');
INSERT INTO `consumer` (`id`, `username`, `password`, `sex`, `phone_num`, `email`, `birth`, `introduction`, `location`, `avator`, `create_time`, `update_time`) VALUES (27, 'yoonaAD', '123', 1, NULL, NULL, '2020-03-11 00:00:00', '', '', '/img/user.jpg', '2020-03-21 22:24:47', '2020-03-21 22:24:47');
INSERT INTO `consumer` (`id`, `username`, `password`, `sex`, `phone_num`, `email`, `birth`, `introduction`, `location`, `avator`, `create_time`, `update_time`) VALUES (28, 'yoona90', '123', 0, NULL, NULL, '2020-04-28 00:00:00', '', '', '/img/user.jpg', '2020-04-02 22:10:34', '2020-04-02 22:10:34');
INSERT INTO `consumer` (`id`, `username`, `password`, `sex`, `phone_num`, `email`, `birth`, `introduction`, `location`, `avator`, `create_time`, `update_time`) VALUES (29, '123', '123', 1, '123', '3@1.com', '2022-05-24 00:00:00', '123', '辽宁', '/img/user.jpg', '2022-05-29 19:51:18', '2022-05-29 19:51:18');
INSERT INTO `consumer` (`id`, `username`, `password`, `sex`, `phone_num`, `email`, `birth`, `introduction`, `location`, `avator`, `create_time`, `update_time`) VALUES (41, '999', '123456', 1, '2087', '17777@qq.com', '2022-05-24 00:00:00', '', '', '/img/user.jpg', '2022-05-31 19:21:22', '2022-05-31 19:21:22');
INSERT INTO `consumer` (`id`, `username`, `password`, `sex`, `phone_num`, `email`, `birth`, `introduction`, `location`, `avator`, `create_time`, `update_time`) VALUES (43, '1111', '999999', 1, '1382', '3033824368@qq.com', '2023-06-07 00:00:00', '', '', '/img/user.jpg', '2022-06-02 19:48:59', '2023-07-06 15:42:10');
COMMIT;

-- ----------------------------
-- Table structure for list_song
-- ----------------------------
DROP TABLE IF EXISTS `list_song`;
CREATE TABLE `list_song` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `song_id` int DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int DEFAULT NULL COMMENT '歌单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='歌单包含歌曲列表';

-- ----------------------------
-- Records of list_song
-- ----------------------------
BEGIN;
INSERT INTO `list_song` (`id`, `song_id`, `song_list_id`) VALUES (242, 137, 84);
INSERT INTO `list_song` (`id`, `song_id`, `song_list_id`) VALUES (243, 138, 96);
INSERT INTO `list_song` (`id`, `song_id`, `song_list_id`) VALUES (245, 140, 97);
COMMIT;

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone_num` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mail
-- ----------------------------
BEGIN;
INSERT INTO `mail` (`id`, `email`, `phone_num`, `create_time`) VALUES (9, '3033824368@qq.com', '1356', '2022-05-31 18:47:14');
INSERT INTO `mail` (`id`, `email`, `phone_num`, `create_time`) VALUES (10, '3033824368@qq.com', '2019', '2022-05-31 19:01:48');
INSERT INTO `mail` (`id`, `email`, `phone_num`, `create_time`) VALUES (11, '3033824368@qq.com', '2053', '2022-05-31 19:16:57');
INSERT INTO `mail` (`id`, `email`, `phone_num`, `create_time`) VALUES (12, '17777@qq.com', '2087', '2022-05-31 19:20:40');
INSERT INTO `mail` (`id`, `email`, `phone_num`, `create_time`) VALUES (13, '3033824368@qq.com', '1668', '2022-05-31 20:31:36');
INSERT INTO `mail` (`id`, `email`, `phone_num`, `create_time`) VALUES (14, '2576362829@qq.com', '1638', '2022-06-02 18:50:27');
INSERT INTO `mail` (`id`, `email`, `phone_num`, `create_time`) VALUES (15, '3033824368@qq.com', '1660', '2022-06-02 18:52:01');
INSERT INTO `mail` (`id`, `email`, `phone_num`, `create_time`) VALUES (16, '3033824368@qq.com', '1382', '2022-06-02 19:48:34');
COMMIT;

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `song_list_id` int NOT NULL COMMENT '歌单id',
  `consumer_id` int NOT NULL COMMENT '用户id',
  `score` int DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `consumer_id` (`song_list_id`,`consumer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='评价';

-- ----------------------------
-- Records of rank
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别（0女1男2组合3不明）',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '头像',
  `birth` datetime DEFAULT NULL COMMENT '生日',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '地区',
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='歌手';

-- ----------------------------
-- Records of singer
-- ----------------------------
BEGIN;
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1002, '单田芳', 1, '/img/singerPic/1688629502189Screenshot 2023-07-06 at 15.44.39.png', '1987-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1003, '东野圭吾', 1, '/img/singerPic/1688629591158Screenshot 2023-07-06 at 15.46.20.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1004, '桐华', 0, '/img/singerPic/1688629653901Screenshot 2023-07-06 at 15.47.20.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1005, '天下霸唱', 1, '/img/singerPic/1688629866971Screenshot 2023-07-06 at 15.50.57.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1006, '郭德纲', 1, '/img/singerPic/1688630076649Screenshot 2023-07-06 at 15.54.28.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1007, '蝴蝶蓝', 1, '/img/singerPic/1688629958197Screenshot 2023-07-06 at 15.52.20.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1008, '吴承恩', 1, '/img/singerPic/1688630038947Screenshot 2023-07-06 at 15.53.39.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1009, '唐家三少', 1, '/img/singerPic/1688630119126Screenshot 2023-07-06 at 15.55.03.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1010, '于谦', 1, '/img/singerPic/1688630359809Screenshot 2023-07-06 at 15.59.04.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1011, '余华', 1, '/img/singerPic/1688630475177Screenshot 2023-07-06 at 16.00.31.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1012, '莫言', 1, '/img/singerPic/1688630467966Screenshot 2023-07-06 at 16.00.49.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1013, '老舍', 1, '/img/singerPic/1688630562312Screenshot 2023-07-06 at 16.01.46.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1014, '冰心', 0, '/img/singerPic/1688630567913Screenshot 2023-07-06 at 16.02.34.png', '1976-07-07 00:00:00', '', '');
INSERT INTO `singer` (`id`, `name`, `sex`, `pic`, `birth`, `location`, `introduction`) VALUES (1015, '当年明月', 1, '/img/singerPic/1688630635920Screenshot 2023-07-06 at 16.03.41.png', '1976-07-07 00:00:00', '', '');
COMMIT;

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `singer_id` int DEFAULT NULL COMMENT '歌手id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '革命',
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '简介',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '歌曲图片',
  `lyric` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '歌词',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '歌曲地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='歌曲';

-- ----------------------------
-- Records of song
-- ----------------------------
BEGIN;
INSERT INTO `song` (`id`, `singer_id`, `name`, `introduction`, `create_time`, `update_time`, `pic`, `lyric`, `url`) VALUES (137, 1002, '单田芳-乱世枭雄', '', '2023-07-05 15:09:15', '2023-07-05 15:10:47', '/img/songPic/1688541047472tubiao.jpg', '', '/song/1688540955106乱世枭雄-单田芳');
INSERT INTO `song` (`id`, `singer_id`, `name`, `introduction`, `create_time`, `update_time`, `pic`, `lyric`, `url`) VALUES (138, 1004, '桐华-满身风雨我从海上来', '', '2023-07-06 17:29:30', '2023-07-06 17:38:40', '/img/songPic/1688635856935Screenshot 2023-07-06 at 17.30.46.png', '这么多年，我一直在学习一件事情，就是不回头，只为自己没有做过的事情后悔，不为自己做过的事情后悔。人生每一步行来，都是需要付出代价的。我得到了我想要的一些，失去了我不想失去的一些。可这世上的芸芸众生，谁又不是这样呢？\n满身风雨我从海上来\n2008年5月12日，汶川发生了里氏8.0级大地震，陕西、甘肃发生了里氏6.5级到7.0级的余震。\n那一日，身在旧金山的罗琦琦如往常一般开车去上班，提前三十分钟到办公室，边喝牛奶，边上网收发邮件，突然，她看到了汶川地震的消息，震惊地点击进去，确定了这条消息的真实性。\n大脑麻木了几分钟后，她突然意识到四川与陕西接壤，四川发生这么大的地震，陕西肯定也会被波及。顾不上此时是中国时间的凌晨，她给家里打电话，电话没有人接；换爸爸的手机，没有人接；换妈妈的手机，没有人接；换妹妹的手机，依然没有人接。\n琦琦一遍遍拨打着父母的电话，在无人接听的电话声中，她的手开始发颤。\n华人同事小玲的父母在成都，当电话连续打不通时，她趴在办公桌上失声痛哭。\n整个早上，罗琦琦什么都没做，只是一遍遍拨打着电话，一遍遍刷新着网页，可地震刚发生，连震级都没有真正确定，网上的报道少得可怜。她为了了解陕西省受到的冲击，搜出了中国地图，用尺子测量西安和汶川的距离，按照比例尺计算实际的空间距离，又打电话给麻省理工研究地壳运动的大学校友，询问他地震传播的次级递减规律。等到下班的时候，她已经成了半个地震专家。\n晚上，电话终于打通。爸爸说：“人都没有事，房子也没事，就天花板掉了几块，电视机被砸得有点变形，你不用担心，瑗瑗一直陪着我们。”\n琦琦挨个询问了一遍家里的亲戚，确认了每个人的安全，又对妹妹千叮咛万嘱咐。\n正要挂电话，妹妹说：“你过十分钟后给我的手机上打个电话，我有话和你说。”\n十分钟后，罗琦琦打到妹妹的手机上：“什么事情？”\n“姐，你有算过多少年没回过国了吗？你去的是美国，不是月球！昨天下午地震后，我们没敢在屋子里睡，在街头露宿了一晚，爸妈一直在念叨你。就是美国总统也要回家看望一下父母吧？你就日理万机到连回家一趟的时间都没有？我知道你给了家里不少钱，爸妈住的房子、我开的车子都是你的钱，如果没有你，爸妈和我说不定还在挤七十年代的筒子楼，可你知道爸爸有肝硬化吗？你陪妈妈去过医院吗？我们若在震中，你想没想过你就见不到我们了……”罗瑗瑗哭了出来，五分是对生死无常的后怕，五分是对地震惨状的感同身受。\n罗琦琦不吭声，良久后，她说：“我会尽快安排假期，回国一趟。”\n罗瑗瑗一边哭，一边笑：“这还差不多，爸妈肯定会很高兴。”\n虽然决定了要休假，可工作上的事情，不是说走就能走的，等罗琦琦一切安排妥当，已经是九月份。\n周围归国的华人都拎着大包小包，就她只带了一个中等大小的行李箱。从旧金山起飞，十多个小时就到了北京。\n罗琦琦恍惚地想，十多个小时，才是当年坐火车到北京的四分之一时间，原来太平洋的距离并不是那么遥远。\n在西安机场，取了行李，朝外走，听到有人高声叫：“姐，姐。”\n一个打扮靓丽的女子不停地朝她挥手。\n四年没见，有些许陌生，可当妹妹一把抱住她时，源自血缘的熟悉刹那就回来了。\n瑗瑗还是和以前一样，喜欢说话。她一边开车，一边说个不停，询问着美国的事情，絮叨着国内的生活，又兴高采烈地说：“哦，对了，那天我和同事去税务局办事，那帮公务员没有艳若桃李，却绝对冷若冰霜，后来突然出来一个人，我不认识他，他却认识我，说‘你姐是不是罗琦琦’，我说‘是啊’，他就让同事帮我们把事给顺利办了，我们要谢他，人家推辞说‘一点小事举手之劳，我和你姐是老同学’，我以前和同事说你从小就是出类拔萃的风云人物，我同事还不信，总说我吹牛，那次才算信了。”\n罗琦琦装作累了，闭上了眼睛。她从小就是出类拔萃的风云人物？究竟是她的记忆太好，还是别人太健忘？\n车子停在楼下，琦琦没有回家的熟悉感觉，甚至压根不知道房子在几楼，像个客人，任由着瑗瑗带领。\n妈妈准备的饭菜惊人的丰盛，似乎要把罗琦琦四年来未吃的都补回来。\n罗琦琦只负责吃，不负责说，可有罗瑗瑗的饭桌，永远不会冷清，她连说带笑，连比带画，一会讲领导的洋相，一会说同事的八卦，逗得全家人笑了又笑。\n妈妈一边吃着饭，一边试探地说：“琦琦，如果碰到合适的人，自己也上心一些，女孩子不管事业多成功，都要成家。你得给妹妹做个榜样，要不然她老是理直气壮地说‘我姐不也还没男朋友嘛’。”\n瑗瑗朝琦琦皱眉头，以一种小声，却全桌子都能听到的声音说：“还是你聪明，待在国外，压根听不到这些唠叨，下次把我唠叨急了，我就去投奔你。”\n爸爸妈妈都笑起来：“就你这个样子，大学里连四级都考了三次才勉强通过，还出国？”\n“好好的中国人，凭什么要考英语啊？考不过，还不许毕业，神经病！怎么没见英国的大学生考中文啊？”\n“那不说英语，你的专业课成绩……”\n“你们再说，再说我可不吃饭了！”\n瑗瑗骄横地一瞪眼睛，爸爸妈妈立即和以前一样，全部投降：“其实的确没必要考英文，平时也很少用，用的人去考就行了。”\n罗琦琦微笑地听着，享受着这种细碎的幸福。\n吃过饭后，瑗瑗领着琦琦参观她的卧室。\n房子是罗琦琦出国后才买的，她出了四十多万，父母负担装修费用。因为这个卧室是留给琦琦的，一直没有人用，桌子、床、书柜都簇新，没有任何时光的记忆，只有书架上的书看着熟悉。\n琦琦拿了《红楼梦》，坐在床沿，随手翻着。1979年的版本，纸张已经有些发黄，真难相信，这本书竟然要三十岁了。\n瑗瑗邀功一样地说：“怎么样？你的宝贝我都帮你保存完好。”她拉开书柜下方的柜门，“你亲笔签名的密封箱子在这里，我可从没打开看过。”\n琦琦沉默地凝视着箱子，瑗瑗笑着说：“你好好休息，等休息好，我陪你吃遍大街小巷。”\n琦琦拿出箱子，却没有打开，只是用手指摩挲着箱子上的签名。这些签名写于高三毕业那年，那时她才十七岁。这么多年过去，其实连她自己都有些记不清里面究竟装着什么了。\n她默默坐了一会，把箱子塞回床边的书柜里。\n洗完澡后，罗琦琦给沈远哲、杨军、林依然各发了一封电子邮件。他们是她中学时代硕果仅存的朋友，自从出国后，就失去了联系，她也不太确定这些电子邮件是否还管用。\n明明很累，可也许因为时差，也许因为枕头旁就是那只承载着过去的箱子，她翻来覆去，总是睡不安稳。\n第二天早上，她正在刷牙，电话响了。\n“琦琦，你的电话。”\n她急急吐出漱口水，跑过去，拿起电话：“喂？”\n“罗琦琦同学，你声音变化挺大的。”\n这种说话方式，不可能是稳重的沈远哲，“杨军，你在……”她低头看着来电显示，“你在北京工作？”\n“是啊，你呢？你这次回国是暂时，还是长期？”\n“暂时，不过假期挺长的，有一个月。”\n“什么时候回去，会经过北京吗？我和林依然聚会时，总会提起你这个无情无义的浑蛋，想当年我们的三角关系多惹人羡慕啊！”\n“那敢情好，我回头去北京的时候，你请我们吃饭。”\n“成啊，只要你来，吃什么我都奉陪。”\n“看来你现在是有钱人了。”\n“去死，再有钱也不敢和你这赚美元的人比。”\n“少来，美元在贬值，你不知道啊？你有女朋友了吗？和童云珠纠缠出结果了没？”\n杨军只笑不答，过了一会才说：“目前还没有女朋友。”\n“同学，听我一句劝，别一棵树上吊死，亏你还是学计算机的，不知道重要文件要备份啊？”\n杨军好整以暇地问：“同学，那你呢？有男朋友了没？”\n罗琦琦悻悻地说：“目前也还没有。”\n杨军高声大笑：“林依然已经结婚了，孩子都快一岁了，是个女孩，特像她，完全就是一个小依然。”\n“那可太好了，我批准她可以携带家眷出席我们的三角关系宴。”\n“好嘛！反正不是你付钱。对了，你这次回国都想做什么？想过回故乡吗？”\n“主要是陪陪爸妈，别的还没想好。”\n“唉！你这是刚回来，还满怀着革命主义的浪漫情怀，等你和父母在一个屋檐底下住上两周，你就知道阶级敌人的滋味了，我已经总结过我和爸妈的关系，绝对的远香近臭。”\n罗琦琦光笑，不说话。\n杨军说：“我先挂电话了，我的所有联系方式都发到你的邮箱里了，有什么事，你随时找我。我们是一块长大的朋友，你若和我客气，我会生气。”\n“我明白。”\n“把电话给你妈，我给阿姨问个好。”\n罗琦琦把电话递给了妈妈，听到妈妈愉快的笑声，重复着说：“哦，还没女朋友呢？”\n罗琦琦摇头笑笑，继续去刷牙洗脸。\n在家里连续住了两个星期后，罗琦琦开始明白杨军的理论。\n她和爸妈倒还没有沦落成阶级敌人，不过明显不如刚回来时受到重视了。妈妈又开始去公园跳舞，爸爸常常跑去找棋友，都不再抓着她问东问西。\n罗瑗瑗倒还仗义，依旧尽量抽时间出来陪姐姐，可是估计也到最后的忍耐期限了：“姐，你什么时候回美国？”\n罗琦琦笑：“下个周我就离开西安。”\n“去北京？”\n“不是，先回趟我们长大的地方，再去北京见同学，然后回旧金山。”\n一个周后，罗琦琦圆满完成了探亲任务，在爸爸妈妈妹妹的欢送下离开西安。\n经过两小时的飞行，罗琦琦到达了她的目的地。\n一走出机场，热浪就扑面而来，比西安至少高了2℃。风很大，头发被吹得乱飞，罗琦琦一边走，一边不停地左右看着，和周围的旅游观光客一样，一点看不出来她曾在这个城市生活过十年。\n坐在计程车上，罗琦琦看着车窗外，神情很恍惚，道路两侧的变化真的太大了，她寻找不到似曾相识的亲切。\n计程车司机问她：“小姐来旅游吗？对什么景点感兴趣？”\n“不是。”顿了一顿，她又说：“我小时候在这里长大的。”\n司机本来想推销旅游包车业务，没想到看走了眼，碰到本地人，笑着说：“看你这样子好久没回来过了吧？”\n“十年。”\n“哎呦！那可真够久的！”\n“是啊！”是很久。\n到宾馆时，天色已黑。\n罗琦琦洗完澡后，躺在床上翻来覆去都睡不着。\n回到这座城市，她一路上都有些恍惚，还有隐隐的亢奋。\n既然睡不着，就索性爬了起来，站到露台上，眺望城市的迷离灯火，却看不清楚哪一抹灯火是她的家。\n已经这么多年过去，这个地方依旧牵扯着她的心。\n心理学大师弗洛伊德认为一个人所有的行为都受童年经历的影响，所以，一切的因果都要追溯到生命最开始的地方……', '/song/1688635770053那些回不去的年少时光.m4a');
INSERT INTO `song` (`id`, `singer_id`, `name`, `introduction`, `create_time`, `update_time`, `pic`, `lyric`, `url`) VALUES (140, 1003, '东野圭吾-盛夏方程式第一章', '', '2023-07-06 18:03:33', '2023-07-06 18:03:39', '/img/songPic/1688637819450Screenshot 2023-07-06 at 17.45.25.png', '只需一眼，就能看到从新干线转乘在来线的换乘口。沿着楼梯上到月台，只见电车已经进站，车门也已经打开。车里传出了嘈杂声。\r\n\r\n柄崎恭平不由得皱起眉头，从最近的车门上了车。盂兰盆节已经结束，父母也说过应该不会太挤，可电车里却几乎是座无虚席。车里那一排排四人合坐的包厢座位上，几乎全都坐了三个以上的人。恭平在车厢过道里走过，想要找一处只有一两个人坐的座位。\r\n\r\n合坐在座位上的，大部分都是一家人。还有许多和他年龄相仿，念小学五年级的孩子。每个人似乎都很开心，大声地交谈着。\r\n\r\n傻不拉唧的。恭平心想。不就是去个海水浴吗？就这么值得高兴吗？不就是去看海吗？要游泳的话，去游泳池还更有意思些。海边既然没有游泳池里的流水，更没有高高的滑台。\r\n\r\n车厢里最里边的座位上没人。对面的座位上似乎坐着人，但两人合坐的座位上还能坐一个人，光是这一点就很值得庆幸了。\r\n\r\n恭平走到座位旁，把背包放到了那个空着的座位上。对面坐的是个个头很高的男子。男子脸上戴着无框眼镜，正捧着一本杂志在看。杂志的封面上画着许多莫名其妙的图案，写着些恭平从来没有听过的词。看到恭平在对面坐下，男子依旧面无表情地继续看着杂志。男子的衬衫外套着件夹克衫，看样子并不像是游客。\r\n\r\n隔着过道，对面的座位上面对面地坐着一个身材高大、满头白发的老头和一个圆脸的老太。两人似乎是对夫妻。老太把塑料瓶里的茶倒进塑料杯里，递给老头。老头面无表情地接过杯子，喝了一大口，之后稍稍咳了一下。倒太多了，老头咕哝着抱怨了一句。老头和老太身上都穿的便装，看起来并非是出门旅行。或许，他们其实是准备回家去。\r\n\r\n没过多久，电车开动了。恭平把包往身旁一放，拿出了装着午饭的塑料袋。用铝箔包裹住的饭团子上，还稍稍有些余温。特百惠的饭盒里，装着炸鸡块和煎鸡蛋。全都是恭平最爱吃的饭菜。\r\n\r\n一边喝着塑料瓶里的水，恭平一边嚼起了饭团子。不一会儿，大海便出现在了车窗外。云淡风轻，远处的海面闪烁着光芒，近处则翻起着朵朵白浪。\r\n\r\n“我们要去大坂办事，只是几天时间。比起留在宾馆里看家，恭平也更喜欢到海边去玩的吧？”三天前，母亲由里说。在她说出这话之前，恭平从来就没有想过，自己居然会一个人出门，到远方的亲戚家去。\r\n\r\n“不会有事吧？玻璃浦可是很远的啊？”父亲敬一抿了一口杯子里的威士忌，一脸疑惑地说。\r\n\r\n“没事的啦。他已经念小学五年级了。人小林家的小花，还一个人去了澳大利亚呢。”由里一边敲键盘，一边说。在起居室里计算店里的营业额，是她每天夜里的惯例工作。\r\n\r\n“小林家是父母把孩子送到机场，等到了澳大利亚之后，又亲自到机场去接的。光只是坐趟飞机的话，根本就不必担心的。”\r\n\r\n“一样的啦。就只是下了新干线换乘电车罢了。反正离车站也不远，手里有份地图的话，就不会有事的啦。”由里的最后一句话，其实是冲着恭平说的。\r\n\r\n嗯。恭平只是简短地答应了一声。他的目光依旧停留在手里的游戏机上。他知道，不管自己说什么，在父母到大坂去的那段期间里，自己都必须得到玻璃浦那令人感觉乏味的乡下去的。这样的事，之前也曾发生过几次。外婆还在世的时候，每次有事，恭平都会被送到由里的娘家八王子去。去年外婆亡故之后，临时寄养恭平的地点，就改换成敬一的姐姐那里了。\r\n\r\n恭平的父母经营着一家精品店。不光平日很忙，为了宣传原创商品，还经常会出门到各地去。有时候恭平也会跟去，但要是上学的时候就不行了。因此，他已经对独自在家过夜这种事习以为常了。\r\n\r\n这次去大坂的目的，似乎是准备新开一家店。估计至少得有一个星期时间无法回家。\r\n\r\n“说的也是，他已经念五年级了。嗯，应该没什么问题的吧。恭平，你就到海边去好好玩上一个星期吧。那边的食物可是很美味的哦。我跟你姑妈说过了，拜托她准备些新鲜的鱼，让你好好品尝美味大餐。”或许是威士忌起到润滑的作用，舌头变得灵活起来，敬一轻佻地说道。夫妻俩虽然在形式上讨论了一下，但最后还是达成了把儿子送过去的结论。每次都如此。\r\n\r\n特快电车平稳地行驶在海岸边。吃完饭团，打了一会儿游戏，装在背包里的手机响了起来。恭平把游戏机关成睡眠状态，伸手到背包里摸了一阵。他的手机，是那种儿童用的特殊手机。\r\n\r\n电话是由里打来的。真够心烦的。心里一边想着，恭平一边接起了电话。\r\n\r\n“啊，恭平。你现在在哪儿？”\r\n\r\n这问题简直就是莫名其妙。做好安排，买好车票的人不就是你自己吗？\r\n\r\n“电车上。”恭平小声地回答。至少，恭平还懂得坐车时的礼节。\r\n\r\n“是吗？那你也没误车啊？”\r\n\r\n“嗯。”别小看人。恭平心里很不爽。\r\n\r\n“到了之后，记得要叫人哦？还有，别忘了把礼物给人家。”\r\n\r\n“知道了啦。我挂电话啦。”\r\n\r\n“别忘了作业。哪怕每天一点，也要记得好好做哦。要是全堆到最后的话，可就来不及啦。”\r\n\r\n“说了知道了啦。”恭平不耐烦地说了一句，之后便挂断了电话。这些话，恭平离开家之前就都听过了。为什么当妈的人都这么罗唆？\r\n\r\n恭平把电话放回背包，准备继续开始游戏。喂。不知何处，传来了一声低沉的声音。恭平以为不是和自己说话，所以干脆就没有理会，可立刻，又传来了一句“喂，小孩”。这次的声音，听起来似乎稍稍有些不耐烦。', '/song/1688637813405盛夏方程式.m4a');
COMMIT;

-- ----------------------------
-- Table structure for song_list
-- ----------------------------
DROP TABLE IF EXISTS `song_list`;
CREATE TABLE `song_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '标题',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '歌单图片',
  `introduction` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '简介',
  `style` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '风格',
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='歌单';

-- ----------------------------
-- Records of song_list
-- ----------------------------
BEGIN;
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (81, '最强龙魂', '/img/songListPic/1688523571854最强龙魂.jpeg', '龙队的最强战兵高成，代号龙吻，无奈退役回归都市，只当了一名司机，不过司机福利好，美人被人扰，但没有想到的是，高成从此有了修仙、炼丹、闯荡异界的各种故事。', '网络小说', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (82, '西游记少儿版', '/img/songListPic/1688523409567西游记.png', '西游记主要讲的是唐僧师徒四人西天取经的故事。大徒弟孙悟空，是个机智勇敢的人物，他不辞辛苦，跟着师傅保护师傅。二徒弟猪八戒，憨厚老实。三徒弟沙僧，忠心耿耿。\n唐僧是一位道德高尚的和尚，不仅对老百姓仁慈，还对几个徒弟教导有加，最终经历九九八十一难，取得了真经。', '经典', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (83, '郭德纲21年相声精选', '/img/songListPic/1688523414646郭德纲.png', '老郭经典相声，入坑必备！\n每一集都有你意料之外的包袱\n每一场都是德云粉丝的必修课\n每一句都是老郭的经典爆笑演绎\n每一秒都是你不容错过的快乐时光', '评书', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (84, '乱世枭雄（单田芳经典）', '/img/songListPic/1688523420533乱世枭雄.png', '《乱世枭雄》讲的是东北王张作霖和其子少帅张学良的传奇故事，是著名评书艺术家单田芳先生根据大量的历史材料和广为流传的民间传说创作而成。这部评书语言生动，人物鲜明，悬念环环相扣，故事引人入胜。', '评书', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (85, '鬼吹灯', '/img/songListPic/1688523424840鬼吹灯.png', '悬疑类题材殿堂级作品\n盗墓小说开山之作\n超人气王牌主播有声的紫襟倾情演绎\n3D音效制作\n喜马拉雅年度巨献\n内含《精绝古城》《龙岭迷窟》《云南虫谷》《昆仑神宫》', '网络小说', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (86, '梁冬&徐文兵《黄帝内经》第一季', '/img/songListPic/1688523431245黄帝内经.png', '2008年底，中央人民广播电台“中国之声”开办《国学堂》栏目,旨在解读我国博大精深的国学文化，并以全新风格演绎，使其获得新生。著名中医专家、中医教育家徐文兵受正安中医创始人梁冬所邀，与其在节目中畅谈《重新发现中医太美之黄帝内经》。\n《黄帝内经》是一部关于天地宇宙、生命现象的伟大著作，是智慧之书，分为《素问》和《灵枢》两部分，其中《素问》和《灵枢》各八十一篇。', '经典', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (88, '人生励志', '/img/songListPic/1688523442786人生励志.png', '生命韧性惊人，跟自己向上的心合作，不要放弃对自己的爱护。\n\n青春不是一段时光，而是一群人。学会独处，直面自己的内心，在时光中洒下奋斗的种子。\n\n霓虹闪烁的城市，川流不息的街道，忙碌了一天的你，终于可以远离喧嚣，平复心情，静静品读生活，聆听内心的声音。\n\n人生之旅，看世间风景，品人生百味，无论眼下是好是坏，只要我们整装待发，步履坚定，就一定能走出自己的一片天。', '评书', 40);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (89, '中国历史未解之谜', '/img/songListPic/1688523453816未解之谜.png', '磁性声音讲述有趣历史，扑朔迷离的历史真相，不为人知的尘封往事！', '评书', 40);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (90, '股票知识｜入门到精通', '/img/songListPic/1688523462557股票.png', '本节目适合以下人群：\n\n\n1. 刚入市或准备入市的新手\n\n2. 入市多年却技术匮乏的老股民\n\n3. 无技术理论基础的散户', '知识', 42);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (91, '斗罗大陆4终极斗罗|唐家三少玄幻经典 | VIP免费有声小说', '/img/songListPic/1688523471610斗罗大陆.png', '斗罗联邦科考队在极北之地科考时，发现了一个有着金银双色花纹的蛋。他们用仪器探查之后，发现里面居然有生命迹象，于是赶忙将其带回研究所进行孵化。蛋孵化出来了，可孵出来的是一个婴儿，一个和人类一模一样的孩子，一个蛋生的孩子；与此同时，联邦研究所正在解冻一名银色长发的女子，而一名蓝发的青年则在海滨被人发现……', '网络小说', 43);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (92, '大奉打更人', '/img/songListPic/1688532609140GKwRIW4Fm0fRAAWzMgEGTa17.jpg', '这个世界，有儒；有道；有佛；有妖；有术士。\n\n警校毕业的许七安幽幽醒来，发现自己身处牢狱之中，三日后流放边陲......\n\n他起初的目的是自保，顺便在这个没有人权的社会里当个富家翁悠闲度日。\n\n.......\n\n多年后，许七安回首前尘，身后是早已逝去的敌人，以及累累白骨。\n\n滚滚长江东逝水，浪花淘尽英雄，是非成败转头空。\n\n青山依旧在，几度夕阳红。', '网络小说', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (93, '农家小福女', '/img/songListPic/1688532743651GMCoOSUIVfC_AAPeJQImeiJd.jpg', '文里没有极品狗血，反而很温馨，女主家有六个哥哥，但有一个聪慧的娘，一家人虽有摩擦，但最后逐渐兴旺变成耕读传家的兴旺之家。而且全家兴旺并不是靠女主金手指，而是每个人都在自己的能力范围里努力奋斗，女主的系统存在比较合理，并没有变成金手指，而更像一位引导她的老师。男主是她师弟，两人一起长大，青梅竹马。', '网络小说', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (94, '全职高手', '/img/songListPic/1688532750703wKgLfFw1y_qRAwGxAAHwlkgZ25E773.jpg', '网游荣耀中被誉为教科书级别的顶尖高手叶修，因为种种原因遭到俱乐部的驱逐，离开职业圈的他寄身于一家网吧成了一个小小的网管，但是，拥有十年游戏经验的他，在荣耀新开的第十区重新投入了游戏，带着对往昔的回忆，和一把未完成的自制武器，开始了重返巅峰之路。\n\n勾心斗角之后，谁夺走了我的荣耀，风雨飘摇之下，希望却不曾破灭。花团锦簇之中，没有迷失方向。万众瞩目之前，我，就在这里回归！', '网络小说', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (95, '一剑独尊', '/img/songListPic/1688532757633wKgO1l5KJFKw0tcAAASYY7quejc319.jpg', '天生道体、双重灵根，本是天才少年却被神秘人偷袭，破了丹田！意外间闯入界狱塔，重修剑道。诸天神佛仙，不过一剑间！', '网络小说', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (96, '那些回不去的年少时光', '/img/songListPic/1688636379729Screenshot 2023-07-06 at 17.39.31.png', '《那些回不去的年少时光》以真挚的感情，真实的细节，讲述了一段发生在那个年代精彩扣人的青春和爱——少女罗琦琦天性桀骜，从不妥协。青春期的她游走在两种截然不同的世界里：作业、考试、小团体的校园；游戏机房、歌舞厅、小混混斗殴泡妞的社会。', '网络小说', NULL);
INSERT INTO `song_list` (`id`, `title`, `pic`, `introduction`, `style`, `userid`) VALUES (97, '盛夏方程式', '/img/songListPic/1688636759099Screenshot 2023-07-06 at 17.45.25.png', '安静的海滨小镇上，成实家经营着一间年久失修的旅馆，游客日渐稀少。盛夏的一天，旅馆迎来了三位与东京有关的客人：帝都大学物理系副教授汤川学、警视厅退休刑警和小学五年级男孩。当晚，汤川学去了居酒屋；男孩和成实的父亲在后院放烟花；刑警晚餐后不见踪影，第二天被发现死在了海边。', '经典', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
