-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-11-29 11:00:57
-- 服务器版本： 5.7.19-log
-- PHP Version: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `we7`
--

-- --------------------------------------------------------

--
-- 表的结构 `ims_account`
--

CREATE TABLE IF NOT EXISTS `ims_account` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account`
--

INSERT INTO `ims_account` (`acid`, `uniacid`, `hash`, `type`, `isconnect`, `isdeleted`, `endtime`) VALUES
(1, 1, 'uRr8qvQV', 1, 0, 0, 0),
(2, 2, 'Q2GC3ZD5', 4, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_aliapp`
--

CREATE TABLE IF NOT EXISTS `ims_account_aliapp` (
  `acid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `key` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_phoneapp`
--

CREATE TABLE IF NOT EXISTS `ims_account_phoneapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_webapp`
--

CREATE TABLE IF NOT EXISTS `ims_account_webapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_wechats`
--

CREATE TABLE IF NOT EXISTS `ims_account_wechats` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account_wechats`
--

INSERT INTO `ims_account_wechats` (`acid`, `uniacid`, `token`, `encodingaeskey`, `level`, `name`, `account`, `original`, `signature`, `country`, `province`, `city`, `username`, `password`, `lastupdate`, `key`, `secret`, `styleid`, `subscribeurl`, `auth_refresh_token`) VALUES
(1, 1, 'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP', '', 1, 'we7team', '', '', '', '', '', '', '', '', 0, '', '', 1, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_wxapp`
--

CREATE TABLE IF NOT EXISTS `ims_account_wxapp` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(43) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `appdomain` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account_wxapp`
--

INSERT INTO `ims_account_wxapp` (`acid`, `uniacid`, `token`, `encodingaeskey`, `level`, `account`, `original`, `key`, `secret`, `name`, `appdomain`) VALUES
(2, 2, 'nYYdSjWB3y5O5wwb9dW4y292oY9z942D', 'A1hIY4VX849yzCIeiHey4L8144gLR8RYZglDi8CVddi', 1, '', 'wx586e7c59d6e94375', 'wx586e7c59d6e94375', '176e3e71526b9880ca199f63f486d793', '抽奖', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_xzapp`
--

CREATE TABLE IF NOT EXISTS `ims_account_xzapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `original` varchar(50) NOT NULL,
  `lastupdate` int(10) NOT NULL,
  `styleid` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `xzapp_id` varchar(30) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `key` varchar(80) NOT NULL,
  `secret` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_category`
--

CREATE TABLE IF NOT EXISTS `ims_article_category` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_comment`
--

CREATE TABLE IF NOT EXISTS `ims_article_comment` (
  `id` int(10) NOT NULL,
  `articleid` int(10) NOT NULL,
  `parentid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `is_like` tinyint(1) NOT NULL,
  `is_reply` tinyint(1) NOT NULL,
  `like_num` int(10) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_news`
--

CREATE TABLE IF NOT EXISTS `ims_article_news` (
  `id` int(10) unsigned NOT NULL,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_notice`
--

CREATE TABLE IF NOT EXISTS `ims_article_notice` (
  `id` int(10) unsigned NOT NULL,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `style` varchar(200) NOT NULL,
  `group` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_unread_notice`
--

CREATE TABLE IF NOT EXISTS `ims_article_unread_notice` (
  `id` int(10) unsigned NOT NULL,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_attachment_group`
--

CREATE TABLE IF NOT EXISTS `ims_attachment_group` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_basic_reply`
--

CREATE TABLE IF NOT EXISTS `ims_basic_reply` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_business`
--

CREATE TABLE IF NOT EXISTS `ims_business` (
  `id` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_ad`
--

CREATE TABLE IF NOT EXISTS `ims_cj_ad` (
  `id` int(10) NOT NULL,
  `ad_type` int(1) NOT NULL,
  `a_unit_id` varchar(100) NOT NULL,
  `d_pic` varchar(128) NOT NULL,
  `d_appid` varchar(32) NOT NULL,
  `d_page` varchar(32) NOT NULL,
  `d_para` varchar(32) NOT NULL,
  `show_place` varchar(32) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_address`
--

CREATE TABLE IF NOT EXISTS `ims_cj_address` (
  `address_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址';

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_appoint`
--

CREATE TABLE IF NOT EXISTS `ims_cj_appoint` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `ranking` char(3) NOT NULL,
  `created` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指定中奖人';

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_common_problem`
--

CREATE TABLE IF NOT EXISTS `ims_cj_common_problem` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '问题标题',
  `describe` varchar(1000) NOT NULL COMMENT '问题描述',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:显示 2:不显示'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='常见问题';

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_config`
--

CREATE TABLE IF NOT EXISTS `ims_cj_config` (
  `id` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_cj_config`
--

INSERT INTO `ims_cj_config` (`id`, `key`, `value`) VALUES
(23, 'home_recommendation', '1500'),
(24, 'pay_function', '5'),
(25, 'open_first', '2'),
(26, 'js_default_shop', '0'),
(27, 'voucher_open', '1'),
(28, 'apply_number', '0'),
(29, 'red_bag', '0'),
(30, 'robot', '0'),
(31, 'title', ''),
(32, 'apiclient_cert', ''),
(33, 'apiclient_key', ''),
(34, 'open_prize_notice', ''),
(35, 'switch_examine', '0'),
(36, 'advertisement', ''),
(37, 'red_package_fee', '0'),
(38, 'is_release', '1'),
(39, 'release_msg', '无发布权限'),
(40, 'advertisement_type', '0'),
(41, 'popup_adv', '{"image":"","appId":"","xcx_path":"","extradata":""}'),
(42, 'is_oss', '0'),
(43, 'default_prize_img', ''),
(44, 'tpl_to_organiser', ''),
(45, 'tpl_to_allfans_begin', ''),
(46, 'home_max_peoples', ''),
(47, 'home_recommendation_need_check', ''),
(48, 'robot_m', '0'),
(49, 'robot_m_percent', ''),
(50, 'relief_desc', ''),
(51, 'robot_of_not_home', ''),
(52, 'alipay_pwd', ''),
(53, 'list_show_type', '0');

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_form_id`
--

CREATE TABLE IF NOT EXISTS `ims_cj_form_id` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `form_id` varchar(50) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_goods`
--

CREATE TABLE IF NOT EXISTS `ims_cj_goods` (
  `id` int(11) NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `goods_img` varchar(255) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_group_join`
--

CREATE TABLE IF NOT EXISTS `ims_cj_group_join` (
  `id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL COMMENT '抽奖id',
  `member_id` int(11) NOT NULL COMMENT '组队创建者id',
  `number` int(11) NOT NULL DEFAULT '3' COMMENT '允许组队人数',
  `apply_num` int(11) NOT NULL DEFAULT '0' COMMENT '已加入该团人数',
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_home_recommend`
--

CREATE TABLE IF NOT EXISTS `ims_cj_home_recommend` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `contact` varchar(500) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_jump_program`
--

CREATE TABLE IF NOT EXISTS `ims_cj_jump_program` (
  `jump_id` int(10) unsigned NOT NULL,
  `prize_id` int(10) unsigned NOT NULL,
  `app_name` varchar(30) NOT NULL,
  `appid` varchar(30) NOT NULL,
  `path` varchar(150) NOT NULL,
  `extraData` text COMMENT 'json格式字符串'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抽奖跳转到小程序 信息';

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_member`
--

CREATE TABLE IF NOT EXISTS `ims_cj_member` (
  `id` int(8) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL COMMENT '用户唯一标识',
  `form_id` varchar(50) NOT NULL,
  `effective_time` int(11) NOT NULL COMMENT 'form_id有效时间',
  `nickname` varchar(50) NOT NULL COMMENT '用户昵称',
  `user_img` varchar(200) NOT NULL COMMENT '用户头像路径',
  `gender` tinyint(1) NOT NULL COMMENT '用户性别 0：未知  1：男  2：女',
  `province` varchar(50) NOT NULL COMMENT '省份',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `country` varchar(50) NOT NULL COMMENT '国家',
  `money` decimal(10,2) NOT NULL COMMENT '账户余额',
  `frozen_money` decimal(10,2) NOT NULL COMMENT '冻结资金',
  `add_time` int(11) NOT NULL COMMENT '用户注册时间',
  `set_time` int(12) NOT NULL COMMENT '用户登录时间',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_robot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0用户1机器人',
  `is_release` tinyint(4) NOT NULL DEFAULT '1',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `blacklist` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户信息';

--
-- 转存表中的数据 `ims_cj_member`
--

INSERT INTO `ims_cj_member` (`id`, `openid`, `form_id`, `effective_time`, `nickname`, `user_img`, `gender`, `province`, `city`, `country`, `money`, `frozen_money`, `add_time`, `set_time`, `status`, `is_robot`, `is_release`, `shop_id`, `blacklist`) VALUES
(5, 'o5zVZ5N9HijSJ_yv_sy4Pmmaf7_Q', '', 0, 'doing', 'https://wx.qlogo.cn/mmopen/vi_32/Rjs0bHUHtbW3HG2iceLnHRmxGjOTrxbc7efLtwxlOhc7uAXwuiaUvpEl8xsn8Il0Nraiarlxww6qItpJ78Pg2DdcA/132', 1, 'Zhejiang', 'Hangzhou', 'China', '0.00', '0.00', 1543398755, 1543398755, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_member_voucher`
--

CREATE TABLE IF NOT EXISTS `ims_cj_member_voucher` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `voucher` char(18) NOT NULL,
  `write_off_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未核销1已核销',
  `shop_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` char(20) NOT NULL,
  `write_off_time` int(11) NOT NULL COMMENT '核销时间',
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_money_log`
--

CREATE TABLE IF NOT EXISTS `ims_cj_money_log` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `money` decimal(10,2) NOT NULL COMMENT '变动金额',
  `type` tinyint(4) NOT NULL COMMENT '1:充值 2:提现 3:冻结 4:解冻 5:发红包 6:领取红包 7:红包退回 8:手续费',
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_order`
--

CREATE TABLE IF NOT EXISTS `ims_cj_order` (
  `order_id` int(11) NOT NULL,
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `prize_id` int(11) NOT NULL,
  `group_join_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL,
  `is_prize` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否中奖0:未中奖1:中奖',
  `code_num` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_pay_order`
--

CREATE TABLE IF NOT EXISTS `ims_cj_pay_order` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `trade_no` char(50) NOT NULL,
  `transaction_id` char(32) NOT NULL,
  `pay_time` int(11) NOT NULL COMMENT '支付成功时间',
  `money` decimal(10,2) NOT NULL COMMENT '充值金额',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:发红包',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付 2:已支付',
  `crested` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_pre_prize`
--

CREATE TABLE IF NOT EXISTS `ims_cj_pre_prize` (
  `prize_id` int(11) NOT NULL,
  `in_task` int(1) NOT NULL,
  `uname` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `desc_type` tinyint(4) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `opentime` int(11) NOT NULL DEFAULT '0',
  `fir_cname` varchar(255) NOT NULL,
  `in_task_time` int(11) NOT NULL DEFAULT '0',
  `fir_val` varchar(200) NOT NULL DEFAULT '' COMMENT '根据fir_ptype、ptype 一等奖值 实物 表示奖品名称 奖金代表金额 虚拟商品代表分比例',
  `fir_ptype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '一等奖类型 0实物 1现金',
  `fir_num` int(11) NOT NULL DEFAULT '0' COMMENT '一等奖人数',
  `sec_cname` varchar(255) NOT NULL,
  `sec_val` varchar(200) NOT NULL DEFAULT '',
  `sec_ptype` tinyint(1) NOT NULL DEFAULT '0',
  `sec_num` int(11) NOT NULL DEFAULT '0',
  `trd_cname` varchar(255) NOT NULL,
  `trd_val` varchar(200) NOT NULL DEFAULT '',
  `trd_ptype` tinyint(1) NOT NULL DEFAULT '0',
  `trd_num` int(11) NOT NULL DEFAULT '0',
  `max_group_num` int(11) NOT NULL,
  `attach_id` int(25) NOT NULL DEFAULT '0',
  `path` varchar(150) DEFAULT '',
  `appid` varchar(30) NOT NULL DEFAULT '',
  `app_name` varchar(30) NOT NULL DEFAULT '',
  `wechat_no` varchar(30) NOT NULL DEFAULT '',
  `wechat_title` varchar(255) NOT NULL,
  `extraData` text NOT NULL,
  `appoint_id` varchar(1000) DEFAULT '' COMMENT '指定人id,json格式',
  `is_image` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不用上传图片1需要上传图片',
  `addtime` int(11) NOT NULL,
  `brief_description` varchar(255) DEFAULT NULL,
  `copy_type` tinyint(4) NOT NULL DEFAULT '1',
  `is_command` tinyint(4) DEFAULT '0' COMMENT '0不是口令抽奖1是口令抽奖',
  `command` varchar(255) DEFAULT NULL,
  `is_robot` int(1) NOT NULL,
  `is_robot_max` int(4) NOT NULL DEFAULT '0' COMMENT '机器人最多数量',
  `page_order` int(10) NOT NULL,
  `default_shop_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_cj_pre_prize`
--

INSERT INTO `ims_cj_pre_prize` (`prize_id`, `in_task`, `uname`, `type`, `desc_type`, `title`, `description`, `opentime`, `fir_cname`, `in_task_time`, `fir_val`, `fir_ptype`, `fir_num`, `sec_cname`, `sec_val`, `sec_ptype`, `sec_num`, `trd_cname`, `trd_val`, `trd_ptype`, `trd_num`, `max_group_num`, `attach_id`, `path`, `appid`, `app_name`, `wechat_no`, `wechat_title`, `extraData`, `appoint_id`, `is_image`, `addtime`, `brief_description`, `copy_type`, `is_command`, `command`, `is_robot`, `is_robot_max`, `page_order`, `default_shop_id`) VALUES
(1, 1, '地球联盟', 2, 0, '最大的奖品', '&lt;p&gt;这是详细说明&lt;/p&gt;', 3, '', 1543399257, '地球', 0, 1, '', '', 0, 0, '', '', 0, 0, 0, 1, '', '', '', '', '', '', '', 0, 0, '这是广告', 1, 0, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_prize`
--

CREATE TABLE IF NOT EXISTS `ims_cj_prize` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `member_id` int(11) DEFAULT '0',
  `uname` varchar(255) DEFAULT NULL COMMENT '赞助商',
  `wechat_no` varchar(100) DEFAULT NULL COMMENT '付款复制的公众号',
  `wechat_title` varchar(255) DEFAULT NULL,
  `typevalue` int(11) DEFAULT '0' COMMENT '开奖方式 people 人数开奖 time时间开奖 manual 手动开奖',
  `max_group_num` tinyint(4) DEFAULT '0' COMMENT '0不组团',
  `desc_type` tinyint(4) DEFAULT '0' COMMENT '详细说明类型0:文字1:图片',
  `desc_text` text COMMENT '详细描述',
  `type` tinyint(1) DEFAULT '1' COMMENT '1:时间,2人数,3手动',
  `attach_id` int(11) DEFAULT NULL,
  `fir_cname` varchar(255) DEFAULT NULL COMMENT '虚拟商品名称',
  `fir_ptype` tinyint(1) DEFAULT '1' COMMENT '0:实物2:虚拟',
  `fir_num` int(11) DEFAULT NULL,
  `fir_val` varchar(2000) DEFAULT NULL COMMENT '根据fir_ptype、ptype 一等奖值 实物 表示奖品名称 奖金代表金额 虚拟商品存入json格式',
  `fir_cardid` int(11) DEFAULT '0',
  `sec_cname` varchar(255) DEFAULT NULL,
  `sec_ptype` tinyint(1) DEFAULT '1' COMMENT '1实物2现金',
  `sec_num` int(11) DEFAULT NULL,
  `sec_val` varchar(2000) DEFAULT NULL,
  `sec_cardid` int(11) DEFAULT '0',
  `trd_cname` varchar(255) DEFAULT NULL,
  `trd_ptype` tinyint(1) DEFAULT NULL,
  `trd_num` int(11) DEFAULT NULL,
  `trd_val` varchar(2000) DEFAULT NULL,
  `trd_cardid` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0' COMMENT '0进行中,1已结束',
  `is_cancel` tinyint(4) DEFAULT '0' COMMENT '0未取消,1已取消',
  `is_global` tinyint(4) DEFAULT '1' COMMENT '0公共抽奖1用户发布',
  `apply_num` int(11) DEFAULT '0' COMMENT '参与人数',
  `description` text,
  `created` int(11) DEFAULT NULL,
  `open_time` int(11) DEFAULT '0' COMMENT '开奖时间',
  `brief_description` varchar(255) DEFAULT NULL,
  `is_share` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0允许分享,1不允许分享',
  `is_command` tinyint(4) DEFAULT '0' COMMENT '0不是口令抽奖1是口令抽奖',
  `command` varchar(255) DEFAULT NULL,
  `is_robot` int(1) NOT NULL,
  `is_robot_max` int(4) NOT NULL DEFAULT '0' COMMENT '机器人最多数量',
  `page_order` int(10) NOT NULL,
  `default_shop_id` int(10) NOT NULL,
  `recommend_id` int(10) NOT NULL,
  `to_allfans_flag` int(1) NOT NULL,
  `chk_flag` int(1) NOT NULL,
  `tpl_flag_begin` varchar(8) NOT NULL,
  `tpl_flag_open` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_prize_code`
--

CREATE TABLE IF NOT EXISTS `ims_cj_prize_code` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `be_invited_id` int(11) NOT NULL,
  `code` char(20) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:抽奖或者2:召集好友获得',
  `is_prize` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:未中奖1:已中奖',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:普通用户2:机器人',
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_prize_result`
--

CREATE TABLE IF NOT EXISTS `ims_cj_prize_result` (
  `result_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `type` char(3) NOT NULL COMMENT '中奖类型 fir sec trd',
  `ptype` int(255) NOT NULL COMMENT '0:实物1:红包2:虚拟',
  `cardnum` varchar(100) NOT NULL COMMENT '虚拟中奖卡号',
  `cardpass` varchar(100) NOT NULL COMMENT '虚拟中奖密码',
  `pvalue` varchar(255) NOT NULL COMMENT '实物中奖名称',
  `code` varchar(20) NOT NULL,
  `is_write_off` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未核销.1:已核销',
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开奖结果';

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_program`
--

CREATE TABLE IF NOT EXISTS `ims_cj_program` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `appid` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_red_bag`
--

CREATE TABLE IF NOT EXISTS `ims_cj_red_bag` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL COMMENT '奖品id',
  `red_bag_money` decimal(10,2) NOT NULL COMMENT '红包金额',
  `receive_member_id` int(11) NOT NULL COMMENT '领取用户id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未领取 2:已领取 3:已退回',
  `receive_time` int(11) NOT NULL COMMENT '领取时间',
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_resource`
--

CREATE TABLE IF NOT EXISTS `ims_cj_resource` (
  `id` int(10) unsigned NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '上传者',
  `route` varchar(255) NOT NULL COMMENT '路径',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:图片',
  `created` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资源';

--
-- 转存表中的数据 `ims_cj_resource`
--

INSERT INTO `ims_cj_resource` (`id`, `member_id`, `route`, `type`, `created`) VALUES
(1, 0, 'images/2/2018/11/KQUf841fx1Q6181qDhH21bnx3881HD.jpg', 1, 1543399422);

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_shop`
--

CREATE TABLE IF NOT EXISTS `ims_cj_shop` (
  `id` int(11) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未删除1已经删除',
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_template_message`
--

CREATE TABLE IF NOT EXISTS `ims_cj_template_message` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:开奖通知',
  `relation_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:未发送,1:已发送',
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_token`
--

CREATE TABLE IF NOT EXISTS `ims_cj_token` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_cj_token`
--

INSERT INTO `ims_cj_token` (`id`, `token`, `member_id`, `created`) VALUES
(9, 'be314530adf1deffaad9aa91d6a6b83d', 5, 1543398746);

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_voucher`
--

CREATE TABLE IF NOT EXISTS `ims_cj_voucher` (
  `id` int(11) NOT NULL,
  `voucher` char(18) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未使用1已使用3已核销',
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cj_withdrawals`
--

CREATE TABLE IF NOT EXISTS `ims_cj_withdrawals` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL COMMENT '提现金额',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:申请成功 2:提现才成功 3:提现失败',
  `success_time` int(11) NOT NULL COMMENT '提现成功时间',
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_attachment`
--

CREATE TABLE IF NOT EXISTS `ims_core_attachment` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `module_upload_dir` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_attachment`
--

INSERT INTO `ims_core_attachment` (`id`, `uniacid`, `uid`, `filename`, `attachment`, `type`, `createtime`, `module_upload_dir`, `group_id`) VALUES
(1, 2, 1, 'earth.jpg', 'images/2/2018/11/KQUf841fx1Q6181qDhH21bnx3881HD.jpg', 1, 1543399413, '', -1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cache`
--

CREATE TABLE IF NOT EXISTS `ims_core_cache` (
  `key` varchar(100) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_cache`
--

INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('setting', 'a:4:{s:9:"copyright";a:1:{s:6:"slides";a:3:{i:0;s:58:"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg";i:1;s:58:"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg";i:2;s:58:"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg";}}s:8:"authmode";i:1;s:5:"close";a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}s:8:"register";a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}}'),
('we7:system_frame:0', 'a:12:{s:8:"platform";a:7:{s:5:"title";s:6:"平台";s:4:"icon";s:14:"wi wi-platform";s:3:"url";s:44:"./index.php?c=account&a=display&do=platform&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:2;}s:7:"account";a:7:{s:5:"title";s:9:"公众号";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:41:"./index.php?c=home&a=welcome&do=platform&";s:7:"section";a:5:{s:13:"platform_plus";a:3:{s:5:"title";s:12:"增强功能";s:4:"menu";a:5:{s:14:"platform_reply";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"自动回复";s:3:"url";s:31:"./index.php?c=platform&a=reply&";s:15:"permission_name";s:14:"platform_reply";s:4:"icon";s:11:"wi wi-reply";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:13:"platform_menu";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:15:"自定义菜单";s:3:"url";s:38:"./index.php?c=platform&a=menu&do=post&";s:15:"permission_name";s:13:"platform_menu";s:4:"icon";s:16:"wi wi-custommenu";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:11:"platform_qr";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:22:"二维码/转化链接";s:3:"url";s:28:"./index.php?c=platform&a=qr&";s:15:"permission_name";s:11:"platform_qr";s:4:"icon";s:12:"wi wi-qrcode";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:17:"platform_material";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:16:"素材/编辑器";s:3:"url";s:34:"./index.php?c=platform&a=material&";s:15:"permission_name";s:17:"platform_material";s:4:"icon";s:12:"wi wi-redact";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:3:{s:5:"title";s:13:"添加/编辑";s:3:"url";s:39:"./index.php?c=platform&a=material-post&";s:15:"permission_name";s:13:"material_post";}i:1;a:2:{s:5:"title";s:6:"删除";s:15:"permission_name";s:24:"platform_material_delete";}}}s:13:"platform_site";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:16:"微官网-文章";s:3:"url";s:38:"./index.php?c=site&a=multi&do=display&";s:15:"permission_name";s:13:"platform_site";s:4:"icon";s:10:"wi wi-home";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}s:10:"is_display";i:0;}s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:3:{s:5:"title";s:6:"粉丝";s:4:"menu";a:2:{s:7:"mc_fans";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"粉丝管理";s:3:"url";s:24:"./index.php?c=mc&a=fans&";s:15:"permission_name";s:7:"mc_fans";s:4:"icon";s:16:"wi wi-fansmanage";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:9:"mc_member";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"会员管理";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:9:"mc_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}s:7:"profile";a:3:{s:5:"title";s:6:"配置";s:4:"menu";a:4:{s:7:"profile";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:15:"profile_setting";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:7:"payment";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"支付参数";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:19:"profile_pay_setting";s:4:"icon";s:17:"wi wi-pay-setting";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:15:"app_module_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:44:"./index.php?c=profile&a=module-link-uniacid&";s:15:"permission_name";s:31:"profile_app_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:11:"bind_domain";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"域名绑定";s:3:"url";s:36:"./index.php?c=profile&a=bind-domain&";s:15:"permission_name";s:19:"profile_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}s:10:"statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:2:{s:14:"statistics_app";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:14:"statistics_app";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:15:"statistics_fans";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"用户统计";s:3:"url";s:32:"./index.php?c=statistics&a=fans&";s:15:"permission_name";s:15:"statistics_fans";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:3;}s:5:"wxapp";a:7:{s:5:"title";s:15:"微信小程序";s:4:"icon";s:19:"wi wi-small-routine";s:3:"url";s:38:"./index.php?c=wxapp&a=display&do=home&";s:7:"section";a:5:{s:14:"wxapp_entrance";a:3:{s:5:"title";s:15:"小程序入口";s:4:"menu";a:1:{s:20:"module_entrance_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"入口页面";s:3:"url";s:36:"./index.php?c=wxapp&a=entrance-link&";s:15:"permission_name";s:19:"wxapp_entrance_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:3:{s:5:"title";s:6:"粉丝";s:4:"menu";a:1:{s:12:"wxapp_member";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:6:"会员";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:12:"wxapp_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}s:13:"wxapp_profile";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:5:{s:17:"wxapp_module_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:42:"./index.php?c=wxapp&a=module-link-uniacid&";s:15:"permission_name";s:25:"wxapp_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:13:"wxapp_payment";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"支付参数";s:3:"url";s:30:"./index.php?c=wxapp&a=payment&";s:15:"permission_name";s:13:"wxapp_payment";s:4:"icon";s:16:"wi wi-appsetting";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:14:"front_download";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"上传微信审核";s:3:"url";s:37:"./index.php?c=wxapp&a=front-download&";s:15:"permission_name";s:20:"wxapp_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:17:"parameter_setting";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:13:"wxapp_setting";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:23:"wxapp_platform_material";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"素材管理";s:3:"url";N;s:15:"permission_name";s:23:"wxapp_platform_material";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:1:{i:0;a:2:{s:5:"title";s:6:"删除";s:15:"permission_name";s:30:"wxapp_platform_material_delete";}}}}}s:10:"statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:15:"statistics_fans";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:33:"./index.php?c=wxapp&a=statistics&";s:15:"permission_name";s:15:"statistics_fans";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:4;}s:6:"webapp";a:7:{s:5:"title";s:2:"PC";s:4:"icon";s:8:"wi wi-pc";s:3:"url";s:39:"./index.php?c=webapp&a=home&do=display&";s:7:"section";a:4:{s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:2:{s:5:"title";s:6:"粉丝";s:4:"menu";a:1:{s:9:"mc_member";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"会员管理";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:9:"mc_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:6:"webapp";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:3:{s:18:"webapp_module_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"数据同步";s:3:"url";s:43:"./index.php?c=webapp&a=module-link-uniacid&";s:15:"permission_name";s:26:"webapp_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:14:"webapp_rewrite";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"伪静态";s:3:"url";s:31:"./index.php?c=webapp&a=rewrite&";s:15:"permission_name";s:14:"webapp_rewrite";s:4:"icon";s:13:"wi wi-rewrite";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:18:"webapp_bind_domain";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"域名访问设置";s:3:"url";s:35:"./index.php?c=webapp&a=bind-domain&";s:15:"permission_name";s:18:"webapp_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:10:"statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:14:"statistics_app";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:14:"statistics_app";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:5;}s:8:"phoneapp";a:7:{s:5:"title";s:3:"APP";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:41:"./index.php?c=phoneapp&a=display&do=home&";s:7:"section";a:2:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:16:"phoneapp_profile";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:1:{s:14:"front_download";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"下载APP";s:3:"url";s:40:"./index.php?c=phoneapp&a=front-download&";s:15:"permission_name";s:23:"phoneapp_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:6;}s:5:"xzapp";a:7:{s:5:"title";s:9:"熊掌号";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:38:"./index.php?c=xzapp&a=home&do=display&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:7;}s:6:"aliapp";a:7:{s:5:"title";s:18:"支付宝小程序";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:8;}s:6:"module";a:7:{s:5:"title";s:6:"应用";s:4:"icon";s:11:"wi wi-apply";s:3:"url";s:31:"./index.php?c=module&a=display&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:9;}s:6:"system";a:7:{s:5:"title";s:6:"系统";s:4:"icon";s:13:"wi wi-setting";s:3:"url";s:39:"./index.php?c=home&a=welcome&do=system&";s:7:"section";a:13:{s:10:"wxplatform";a:2:{s:5:"title";s:9:"公众号";s:4:"menu";a:4:{s:14:"system_account";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:16:" 微信公众号";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=1";s:15:"permission_name";s:14:"system_account";s:4:"icon";s:12:"wi wi-wechat";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:6:{i:0;a:2:{s:5:"title";s:21:"公众号管理设置";s:15:"permission_name";s:21:"system_account_manage";}i:1;a:2:{s:5:"title";s:15:"添加公众号";s:15:"permission_name";s:19:"system_account_post";}i:2;a:2:{s:5:"title";s:15:"公众号停用";s:15:"permission_name";s:19:"system_account_stop";}i:3;a:2:{s:5:"title";s:18:"公众号回收站";s:15:"permission_name";s:22:"system_account_recycle";}i:4;a:2:{s:5:"title";s:15:"公众号删除";s:15:"permission_name";s:21:"system_account_delete";}i:5;a:2:{s:5:"title";s:15:"公众号恢复";s:15:"permission_name";s:22:"system_account_recover";}}}s:13:"system_module";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"公众号应用";s:3:"url";s:60:"./index.php?c=module&a=manage-system&support=account_support";s:15:"permission_name";s:13:"system_module";s:4:"icon";s:14:"wi wi-wx-apply";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:15:"system_template";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"微官网模板";s:3:"url";s:32:"./index.php?c=system&a=template&";s:15:"permission_name";s:15:"system_template";s:4:"icon";s:17:"wi wi-wx-template";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:15:"system_platform";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:19:" 微信开放平台";s:3:"url";s:32:"./index.php?c=system&a=platform&";s:15:"permission_name";s:15:"system_platform";s:4:"icon";s:20:"wi wi-exploitsetting";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:6:"module";a:2:{s:5:"title";s:9:"小程序";s:4:"menu";a:2:{s:12:"system_wxapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"微信小程序";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=4";s:15:"permission_name";s:12:"system_wxapp";s:4:"icon";s:11:"wi wi-wxapp";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:6:{i:0;a:2:{s:5:"title";s:21:"小程序管理设置";s:15:"permission_name";s:19:"system_wxapp_manage";}i:1;a:2:{s:5:"title";s:15:"添加小程序";s:15:"permission_name";s:17:"system_wxapp_post";}i:2;a:2:{s:5:"title";s:15:"小程序停用";s:15:"permission_name";s:17:"system_wxapp_stop";}i:3;a:2:{s:5:"title";s:18:"小程序回收站";s:15:"permission_name";s:20:"system_wxapp_recycle";}i:4;a:2:{s:5:"title";s:15:"小程序删除";s:15:"permission_name";s:19:"system_wxapp_delete";}i:5;a:2:{s:5:"title";s:15:"小程序恢复";s:15:"permission_name";s:20:"system_wxapp_recover";}}}s:19:"system_module_wxapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"小程序应用";s:3:"url";s:58:"./index.php?c=module&a=manage-system&support=wxapp_support";s:15:"permission_name";s:19:"system_module_wxapp";s:4:"icon";s:17:"wi wi-wxapp-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"welcome";a:3:{s:5:"title";s:12:"系统首页";s:4:"menu";a:1:{s:14:"system_welcome";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"系统首页应用";s:3:"url";s:60:"./index.php?c=module&a=manage-system&support=welcome_support";s:15:"permission_name";s:14:"system_welcome";s:4:"icon";s:11:"wi wi-wxapp";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:7:"founder";b:1;}s:6:"webapp";a:2:{s:5:"title";s:2:"PC";s:4:"menu";a:2:{s:13:"system_webapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:2:"PC";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=5";s:15:"permission_name";s:13:"system_webapp";s:4:"icon";s:8:"wi wi-pc";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:20:"system_module_webapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:8:"PC应用";s:3:"url";s:59:"./index.php?c=module&a=manage-system&support=webapp_support";s:15:"permission_name";s:20:"system_module_webapp";s:4:"icon";s:14:"wi wi-pc-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:8:"phoneapp";a:2:{s:5:"title";s:3:"APP";s:4:"menu";a:2:{s:15:"system_phoneapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:3:"APP";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=6";s:15:"permission_name";s:15:"system_phoneapp";s:4:"icon";s:9:"wi wi-app";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:22:"system_module_phoneapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"APP应用";s:3:"url";s:61:"./index.php?c=module&a=manage-system&support=phoneapp_support";s:15:"permission_name";s:22:"system_module_phoneapp";s:4:"icon";s:15:"wi wi-app-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:5:"xzapp";a:2:{s:5:"title";s:9:"熊掌号";s:4:"menu";a:2:{s:12:"system_xzapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"熊掌号";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=9";s:15:"permission_name";s:12:"system_xzapp";s:4:"icon";s:11:"wi wi-xzapp";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:19:"system_module_xzapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"熊掌号应用";s:3:"url";s:58:"./index.php?c=module&a=manage-system&support=xzapp_support";s:15:"permission_name";s:19:"system_module_xzapp";s:4:"icon";s:17:"wi wi-xzapp-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:6:"aliapp";a:2:{s:5:"title";s:18:"支付宝小程序";s:4:"menu";a:2:{s:13:"system_aliapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"支付宝小程序";s:3:"url";s:46:"./index.php?c=account&a=manage&account_type=11";s:15:"permission_name";s:13:"system_aliapp";s:4:"icon";s:12:"wi wi-aliapp";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:20:"system_module_aliapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:24:"支付宝小程序应用";s:3:"url";s:59:"./index.php?c=module&a=manage-system&support=aliapp_support";s:15:"permission_name";s:20:"system_module_aliapp";s:4:"icon";s:18:"wi wi-aliapp-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:4:"user";a:2:{s:5:"title";s:13:"帐户/用户";s:4:"menu";a:3:{s:9:"system_my";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"我的帐户";s:3:"url";s:29:"./index.php?c=user&a=profile&";s:15:"permission_name";s:9:"system_my";s:4:"icon";s:10:"wi wi-user";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:11:"system_user";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"用户管理";s:3:"url";s:29:"./index.php?c=user&a=display&";s:15:"permission_name";s:11:"system_user";s:4:"icon";s:16:"wi wi-user-group";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:7:{i:0;a:2:{s:5:"title";s:12:"编辑用户";s:15:"permission_name";s:16:"system_user_post";}i:1;a:2:{s:5:"title";s:12:"审核用户";s:15:"permission_name";s:17:"system_user_check";}i:2;a:2:{s:5:"title";s:12:"店员管理";s:15:"permission_name";s:17:"system_user_clerk";}i:3;a:2:{s:5:"title";s:15:"用户回收站";s:15:"permission_name";s:19:"system_user_recycle";}i:4;a:2:{s:5:"title";s:18:"用户属性设置";s:15:"permission_name";s:18:"system_user_fields";}i:5;a:2:{s:5:"title";s:31:"用户属性设置-编辑字段";s:15:"permission_name";s:23:"system_user_fields_post";}i:6;a:2:{s:5:"title";s:18:"用户注册设置";s:15:"permission_name";s:23:"system_user_registerset";}}}s:25:"system_user_founder_group";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"副创始人组";s:3:"url";s:32:"./index.php?c=founder&a=display&";s:15:"permission_name";s:21:"system_founder_manage";s:4:"icon";s:16:"wi wi-co-founder";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:6:{i:0;a:2:{s:5:"title";s:18:"添加创始人组";s:15:"permission_name";s:24:"system_founder_group_add";}i:1;a:2:{s:5:"title";s:18:"编辑创始人组";s:15:"permission_name";s:25:"system_founder_group_post";}i:2;a:2:{s:5:"title";s:18:"删除创始人组";s:15:"permission_name";s:24:"system_founder_group_del";}i:3;a:2:{s:5:"title";s:15:"添加创始人";s:15:"permission_name";s:23:"system_founder_user_add";}i:4;a:2:{s:5:"title";s:15:"编辑创始人";s:15:"permission_name";s:24:"system_founder_user_post";}i:5;a:2:{s:5:"title";s:15:"删除创始人";s:15:"permission_name";s:23:"system_founder_user_del";}}}}}s:10:"permission";a:2:{s:5:"title";s:12:"权限管理";s:4:"menu";a:2:{s:19:"system_module_group";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"应用权限组";s:3:"url";s:29:"./index.php?c=module&a=group&";s:15:"permission_name";s:19:"system_module_group";s:4:"icon";s:21:"wi wi-appjurisdiction";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:3:{i:0;a:2:{s:5:"title";s:21:"添加应用权限组";s:15:"permission_name";s:23:"system_module_group_add";}i:1;a:2:{s:5:"title";s:21:"编辑应用权限组";s:15:"permission_name";s:24:"system_module_group_post";}i:2;a:2:{s:5:"title";s:21:"删除应用权限组";s:15:"permission_name";s:23:"system_module_group_del";}}}s:17:"system_user_group";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"用户权限组";s:3:"url";s:27:"./index.php?c=user&a=group&";s:15:"permission_name";s:17:"system_user_group";s:4:"icon";s:22:"wi wi-userjurisdiction";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:3:{i:0;a:2:{s:5:"title";s:15:"添加用户组";s:15:"permission_name";s:21:"system_user_group_add";}i:1;a:2:{s:5:"title";s:15:"编辑用户组";s:15:"permission_name";s:22:"system_user_group_post";}i:2;a:2:{s:5:"title";s:15:"删除用户组";s:15:"permission_name";s:21:"system_user_group_del";}}}}}s:7:"article";a:2:{s:5:"title";s:13:"文章/公告";s:4:"menu";a:2:{s:14:"system_article";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"文章管理";s:3:"url";s:29:"./index.php?c=article&a=news&";s:15:"permission_name";s:19:"system_article_news";s:4:"icon";s:13:"wi wi-article";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:21:"system_article_notice";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"公告管理";s:3:"url";s:31:"./index.php?c=article&a=notice&";s:15:"permission_name";s:21:"system_article_notice";s:4:"icon";s:12:"wi wi-notice";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"message";a:2:{s:5:"title";s:12:"消息提醒";s:4:"menu";a:1:{s:21:"system_message_notice";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"消息提醒";s:3:"url";s:31:"./index.php?c=message&a=notice&";s:15:"permission_name";s:21:"system_message_notice";s:4:"icon";s:10:"wi wi-bell";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:17:"system_statistics";a:2:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:23:"system_account_analysis";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:35:"./index.php?c=statistics&a=account&";s:15:"permission_name";s:23:"system_account_analysis";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:5:"cache";a:2:{s:5:"title";s:6:"缓存";s:4:"menu";a:1:{s:26:"system_setting_updatecache";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"更新缓存";s:3:"url";s:35:"./index.php?c=system&a=updatecache&";s:15:"permission_name";s:26:"system_setting_updatecache";s:4:"icon";s:12:"wi wi-update";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:10;}s:4:"site";a:8:{s:5:"title";s:6:"站点";s:4:"icon";s:17:"wi wi-system-site";s:3:"url";s:28:"./index.php?c=system&a=site&";s:7:"section";a:3:{s:7:"setting";a:2:{s:5:"title";s:6:"设置";s:4:"menu";a:9:{s:19:"system_setting_site";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"站点设置";s:3:"url";s:28:"./index.php?c=system&a=site&";s:15:"permission_name";s:19:"system_setting_site";s:4:"icon";s:18:"wi wi-site-setting";s:12:"displayorder";i:9;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_menu";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"菜单设置";s:3:"url";s:28:"./index.php?c=system&a=menu&";s:15:"permission_name";s:19:"system_setting_menu";s:4:"icon";s:18:"wi wi-menu-setting";s:12:"displayorder";i:8;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_attachment";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"附件设置";s:3:"url";s:34:"./index.php?c=system&a=attachment&";s:15:"permission_name";s:25:"system_setting_attachment";s:4:"icon";s:16:"wi wi-attachment";s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_systeminfo";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"系统信息";s:3:"url";s:34:"./index.php?c=system&a=systeminfo&";s:15:"permission_name";s:25:"system_setting_systeminfo";s:4:"icon";s:17:"wi wi-system-info";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_logs";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"查看日志";s:3:"url";s:28:"./index.php?c=system&a=logs&";s:15:"permission_name";s:19:"system_setting_logs";s:4:"icon";s:9:"wi wi-log";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:26:"system_setting_ipwhitelist";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:11:"IP白名单";s:3:"url";s:35:"./index.php?c=system&a=ipwhitelist&";s:15:"permission_name";s:26:"system_setting_ipwhitelist";s:4:"icon";s:8:"wi wi-ip";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:28:"system_setting_sensitiveword";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"过滤敏感词";s:3:"url";s:37:"./index.php?c=system&a=sensitiveword&";s:15:"permission_name";s:28:"system_setting_sensitiveword";s:4:"icon";s:15:"wi wi-sensitive";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_thirdlogin";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:25:"用户登录/注册设置";s:3:"url";s:33:"./index.php?c=user&a=registerset&";s:15:"permission_name";s:25:"system_setting_thirdlogin";s:4:"icon";s:10:"wi wi-user";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:20:"system_setting_oauth";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:17:"oauth全局设置";s:3:"url";s:29:"./index.php?c=system&a=oauth&";s:15:"permission_name";s:20:"system_setting_oauth";s:4:"icon";s:11:"wi wi-oauth";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"utility";a:2:{s:5:"title";s:12:"常用工具";s:4:"menu";a:5:{s:24:"system_utility_filecheck";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"系统文件校验";s:3:"url";s:33:"./index.php?c=system&a=filecheck&";s:15:"permission_name";s:24:"system_utility_filecheck";s:4:"icon";s:10:"wi wi-file";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_optimize";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"性能优化";s:3:"url";s:32:"./index.php?c=system&a=optimize&";s:15:"permission_name";s:23:"system_utility_optimize";s:4:"icon";s:14:"wi wi-optimize";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_database";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"数据库";s:3:"url";s:32:"./index.php?c=system&a=database&";s:15:"permission_name";s:23:"system_utility_database";s:4:"icon";s:9:"wi wi-sql";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_utility_scan";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"木马查杀";s:3:"url";s:28:"./index.php?c=system&a=scan&";s:15:"permission_name";s:19:"system_utility_scan";s:4:"icon";s:12:"wi wi-safety";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:18:"system_utility_bom";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"检测文件BOM";s:3:"url";s:27:"./index.php?c=system&a=bom&";s:15:"permission_name";s:18:"system_utility_bom";s:4:"icon";s:9:"wi wi-bom";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"backjob";a:2:{s:5:"title";s:12:"后台任务";s:4:"menu";a:1:{s:10:"system_job";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"后台任务";s:3:"url";s:38:"./index.php?c=system&a=job&do=display&";s:15:"permission_name";s:10:"system_job";s:4:"icon";s:9:"wi wi-job";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:7:"founder";b:1;s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:11;}s:4:"help";a:8:{s:5:"title";s:12:"系统帮助";s:4:"icon";s:12:"wi wi-market";s:3:"url";s:29:"./index.php?c=help&a=display&";s:7:"section";a:0:{}s:5:"blank";b:0;s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:12;}s:5:"store";a:7:{s:5:"title";s:6:"商城";s:4:"icon";s:11:"wi wi-store";s:3:"url";s:43:"./index.php?c=home&a=welcome&do=ext&m=store";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:13;}}'),
('we7:setting', 'a:4:{s:9:"copyright";a:1:{s:6:"slides";a:3:{i:0;s:58:"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg";i:1;s:58:"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg";i:2;s:58:"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg";}}s:8:"authmode";i:1;s:5:"close";a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}s:8:"register";a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}}'),
('we7:userbasefields', 'a:46:{s:7:"uniacid";s:17:"同一公众号id";s:7:"groupid";s:8:"分组id";s:7:"credit1";s:6:"积分";s:7:"credit2";s:6:"余额";s:7:"credit3";s:19:"预留积分类型3";s:7:"credit4";s:19:"预留积分类型4";s:7:"credit5";s:19:"预留积分类型5";s:7:"credit6";s:19:"预留积分类型6";s:10:"createtime";s:12:"加入时间";s:6:"mobile";s:12:"手机号码";s:5:"email";s:12:"电子邮箱";s:8:"realname";s:12:"真实姓名";s:8:"nickname";s:6:"昵称";s:6:"avatar";s:6:"头像";s:2:"qq";s:5:"QQ号";s:6:"gender";s:6:"性别";s:5:"birth";s:6:"生日";s:13:"constellation";s:6:"星座";s:6:"zodiac";s:6:"生肖";s:9:"telephone";s:12:"固定电话";s:6:"idcard";s:12:"证件号码";s:9:"studentid";s:6:"学号";s:5:"grade";s:6:"班级";s:7:"address";s:6:"地址";s:7:"zipcode";s:6:"邮编";s:11:"nationality";s:6:"国籍";s:6:"reside";s:9:"居住地";s:14:"graduateschool";s:12:"毕业学校";s:7:"company";s:6:"公司";s:9:"education";s:6:"学历";s:10:"occupation";s:6:"职业";s:8:"position";s:6:"职位";s:7:"revenue";s:9:"年收入";s:15:"affectivestatus";s:12:"情感状态";s:10:"lookingfor";s:13:" 交友目的";s:9:"bloodtype";s:6:"血型";s:6:"height";s:6:"身高";s:6:"weight";s:6:"体重";s:6:"alipay";s:15:"支付宝帐号";s:3:"msn";s:3:"MSN";s:6:"taobao";s:12:"阿里旺旺";s:4:"site";s:6:"主页";s:3:"bio";s:12:"自我介绍";s:8:"interest";s:12:"兴趣爱好";s:8:"password";s:6:"密码";s:12:"pay_password";s:12:"支付密码";}'),
('we7:usersfields', 'a:47:{s:8:"realname";s:12:"真实姓名";s:8:"nickname";s:6:"昵称";s:6:"avatar";s:6:"头像";s:2:"qq";s:5:"QQ号";s:6:"mobile";s:12:"手机号码";s:3:"vip";s:9:"VIP级别";s:6:"gender";s:6:"性别";s:9:"birthyear";s:12:"出生生日";s:13:"constellation";s:6:"星座";s:6:"zodiac";s:6:"生肖";s:9:"telephone";s:12:"固定电话";s:6:"idcard";s:12:"证件号码";s:9:"studentid";s:6:"学号";s:5:"grade";s:6:"班级";s:7:"address";s:12:"邮寄地址";s:7:"zipcode";s:6:"邮编";s:11:"nationality";s:6:"国籍";s:14:"resideprovince";s:12:"居住地址";s:14:"graduateschool";s:12:"毕业学校";s:7:"company";s:6:"公司";s:9:"education";s:6:"学历";s:10:"occupation";s:6:"职业";s:8:"position";s:6:"职位";s:7:"revenue";s:9:"年收入";s:15:"affectivestatus";s:12:"情感状态";s:10:"lookingfor";s:13:" 交友目的";s:9:"bloodtype";s:6:"血型";s:6:"height";s:6:"身高";s:6:"weight";s:6:"体重";s:6:"alipay";s:15:"支付宝帐号";s:3:"msn";s:3:"MSN";s:5:"email";s:12:"电子邮箱";s:6:"taobao";s:12:"阿里旺旺";s:4:"site";s:6:"主页";s:3:"bio";s:12:"自我介绍";s:8:"interest";s:12:"兴趣爱好";s:7:"uniacid";s:17:"同一公众号id";s:7:"groupid";s:8:"分组id";s:7:"credit1";s:6:"积分";s:7:"credit2";s:6:"余额";s:7:"credit3";s:19:"预留积分类型3";s:7:"credit4";s:19:"预留积分类型4";s:7:"credit5";s:19:"预留积分类型5";s:7:"credit6";s:19:"预留积分类型6";s:10:"createtime";s:12:"加入时间";s:8:"password";s:12:"用户密码";s:12:"pay_password";s:12:"支付密码";}'),
('we7:module_receive_enable', 'a:0:{}'),
('we7:module_info:hu_couda', 'a:32:{s:3:"mid";s:2:"13";s:4:"name";s:8:"hu_couda";s:4:"type";s:5:"other";s:5:"title";s:18:"最新抽奖助手";s:7:"version";s:5:"5.2.5";s:7:"ability";s:18:"抽奖助手卡券";s:11:"description";s:12:"抽奖助手";s:6:"author";s:24:"趣味淘QQ：3086811716";s:3:"url";s:20:"https://wx.hzweb.top";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:0:{}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:13:"title_initial";s:1:"Z";s:13:"wxapp_support";s:1:"2";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"1";s:15:"account_support";s:1:"1";s:13:"xzapp_support";s:1:"1";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"1";s:9:"isdisplay";i:1;s:4:"logo";s:57:"http://c.oggogg.com/addons/hu_couda/icon.jpg?v=1543397489";s:7:"preview";s:47:"http://c.oggogg.com/addons/hu_couda/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:store', 'a:32:{s:3:"mid";s:2:"12";s:4:"name";s:5:"store";s:4:"type";s:8:"business";s:5:"title";s:12:"站内商城";s:7:"version";s:3:"1.0";s:7:"ability";s:12:"站内商城";s:11:"description";s:12:"站内商城";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:54:"http://c.oggogg.com/addons/store/icon.jpg?v=1543397452";s:7:"preview";s:44:"http://c.oggogg.com/addons/store/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:wxcard', 'a:32:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:11:"description";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:55:"http://c.oggogg.com/addons/wxcard/icon.jpg?v=1543397452";s:7:"preview";s:45:"http://c.oggogg.com/addons/wxcard/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:chats', 'a:32:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:11:"description";s:0:"";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:54:"http://c.oggogg.com/addons/chats/icon.jpg?v=1543397452";s:7:"preview";s:44:"http://c.oggogg.com/addons/chats/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:voice', 'a:32:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:11:"description";s:132:"在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:54:"http://c.oggogg.com/addons/voice/icon.jpg?v=1543397452";s:7:"preview";s:44:"http://c.oggogg.com/addons/voice/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:video', 'a:32:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:11:"description";s:132:"在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:54:"http://c.oggogg.com/addons/video/icon.jpg?v=1543397452";s:7:"preview";s:44:"http://c.oggogg.com/addons/video/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:images', 'a:32:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:11:"description";s:132:"在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:55:"http://c.oggogg.com/addons/images/icon.jpg?v=1543397452";s:7:"preview";s:45:"http://c.oggogg.com/addons/images/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:custom', 'a:32:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:11:"description";s:0:"";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:17:"http://bbs.we7.cc";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:55:"http://c.oggogg.com/addons/custom/icon.jpg?v=1543397452";s:7:"preview";s:45:"http://c.oggogg.com/addons/custom/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:recharge', 'a:32:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:11:"description";s:0:"";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:57:"http://c.oggogg.com/addons/recharge/icon.jpg?v=1543397452";s:7:"preview";s:47:"http://c.oggogg.com/addons/recharge/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:userapi', 'a:32:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:11:"description";s:141:"自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:56:"http://c.oggogg.com/addons/userapi/icon.jpg?v=1543397452";s:7:"preview";s:46:"http://c.oggogg.com/addons/userapi/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:music', 'a:32:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:11:"description";s:183:"在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:54:"http://c.oggogg.com/addons/music/icon.jpg?v=1543397452";s:7:"preview";s:44:"http://c.oggogg.com/addons/music/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:news', 'a:32:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:11:"description";s:272:"一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:53:"http://c.oggogg.com/addons/news/icon.jpg?v=1543397452";s:7:"preview";s:43:"http://c.oggogg.com/addons/news/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:module_info:basic', 'a:32:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:11:"description";s:201:"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:9:"isdisplay";i:1;s:4:"logo";s:54:"http://c.oggogg.com/addons/basic/icon.jpg?v=1543397452";s:7:"preview";s:44:"http://c.oggogg.com/addons/basic/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}}'),
('we7:unisetting:1', 'a:29:{s:7:"uniacid";s:1:"1";s:8:"passport";a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}s:5:"oauth";a:2:{s:6:"status";s:1:"0";s:7:"account";s:1:"0";}s:11:"jsauth_acid";s:1:"0";s:2:"uc";a:1:{s:6:"status";i:0;}s:6:"notify";a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}s:11:"creditnames";a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}s:15:"creditbehaviors";a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}s:7:"welcome";s:0:"";s:7:"default";s:0:"";s:15:"default_message";s:0:"";s:7:"payment";a:4:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";}s:6:"wechat";a:5:{s:6:"switch";b:0;s:7:"account";b:0;s:7:"signkey";s:0:"";s:7:"partner";s:0:"";s:3:"key";s:0:"";}s:8:"delivery";a:1:{s:6:"switch";b:0;}}s:4:"stat";s:0:"";s:12:"default_site";s:1:"1";s:4:"sync";s:1:"0";s:8:"recharge";s:0:"";s:9:"tplnotice";s:0:"";s:10:"grouplevel";s:1:"0";s:8:"mcplugin";s:0:"";s:15:"exchange_enable";s:1:"0";s:11:"coupon_type";s:1:"0";s:7:"menuset";s:0:"";s:10:"statistics";s:0:"";s:11:"bind_domain";s:0:"";s:14:"comment_status";s:1:"0";s:13:"reply_setting";s:1:"0";s:14:"default_module";s:0:"";s:16:"attachment_limit";N;s:15:"attachment_size";N;}'),
('we7:uniaccount:1', 'a:37:{s:4:"acid";s:1:"1";s:7:"uniacid";s:1:"1";s:5:"token";s:32:"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP";s:14:"encodingaeskey";s:0:"";s:5:"level";s:1:"1";s:4:"name";s:7:"we7team";s:7:"account";s:0:"";s:8:"original";s:0:"";s:9:"signature";s:0:"";s:7:"country";s:0:"";s:8:"province";s:0:"";s:4:"city";s:0:"";s:8:"username";s:0:"";s:8:"password";s:0:"";s:10:"lastupdate";s:1:"0";s:3:"key";s:0:"";s:6:"secret";s:0:"";s:7:"styleid";s:1:"1";s:12:"subscribeurl";s:0:"";s:18:"auth_refresh_token";s:0:"";s:11:"encrypt_key";s:0:"";s:4:"type";s:1:"1";s:9:"isconnect";s:1:"0";s:9:"isdeleted";s:1:"0";s:7:"endtime";s:1:"0";s:9:"type_sign";s:7:"account";s:3:"uid";s:1:"1";s:9:"starttime";s:1:"0";s:6:"groups";a:1:{i:1;a:5:{s:7:"groupid";s:1:"1";s:7:"uniacid";s:1:"1";s:5:"title";s:15:"默认会员组";s:6:"credit";s:1:"0";s:9:"isdefault";s:1:"1";}}s:7:"setting";a:29:{s:7:"uniacid";s:1:"1";s:8:"passport";a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}s:5:"oauth";a:2:{s:6:"status";s:1:"0";s:7:"account";s:1:"0";}s:11:"jsauth_acid";s:1:"0";s:2:"uc";a:1:{s:6:"status";i:0;}s:6:"notify";a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}s:11:"creditnames";a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}s:15:"creditbehaviors";a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}s:7:"welcome";s:0:"";s:7:"default";s:0:"";s:15:"default_message";s:0:"";s:7:"payment";a:4:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";}s:6:"wechat";a:5:{s:6:"switch";b:0;s:7:"account";b:0;s:7:"signkey";s:0:"";s:7:"partner";s:0:"";s:3:"key";s:0:"";}s:8:"delivery";a:1:{s:6:"switch";b:0;}}s:4:"stat";s:0:"";s:12:"default_site";s:1:"1";s:4:"sync";s:1:"0";s:8:"recharge";s:0:"";s:9:"tplnotice";s:0:"";s:10:"grouplevel";s:1:"0";s:8:"mcplugin";s:0:"";s:15:"exchange_enable";s:1:"0";s:11:"coupon_type";s:1:"0";s:7:"menuset";s:0:"";s:10:"statistics";s:0:"";s:11:"bind_domain";s:0:"";s:14:"comment_status";s:1:"0";s:13:"reply_setting";s:1:"0";s:14:"default_module";s:0:"";s:16:"attachment_limit";N;s:15:"attachment_size";N;}s:10:"grouplevel";s:1:"0";s:4:"logo";s:60:"http://c.oggogg.com/attachment/headimg_1.jpg?time=1543397458";s:6:"qrcode";s:59:"http://c.oggogg.com/attachment/qrcode_1.jpg?time=1543397458";s:9:"type_name";s:9:"公众号";s:9:"switchurl";s:51:"./index.php?c=account&a=display&do=switch&uniacid=1";s:3:"sms";i:0;s:7:"setmeal";a:5:{s:3:"uid";i:-1;s:8:"username";s:9:"创始人";s:9:"timelimit";s:9:"未设置";s:7:"groupid";s:2:"-1";s:9:"groupname";s:12:"所有服务";}}'),
('we7:unimodules:0:', 'a:13:{s:5:"basic";a:1:{s:4:"name";s:5:"basic";}s:4:"news";a:1:{s:4:"name";s:4:"news";}s:5:"music";a:1:{s:4:"name";s:5:"music";}s:7:"userapi";a:1:{s:4:"name";s:7:"userapi";}s:8:"recharge";a:1:{s:4:"name";s:8:"recharge";}s:6:"custom";a:1:{s:4:"name";s:6:"custom";}s:6:"images";a:1:{s:4:"name";s:6:"images";}s:5:"video";a:1:{s:4:"name";s:5:"video";}s:5:"voice";a:1:{s:4:"name";s:5:"voice";}s:5:"chats";a:1:{s:4:"name";s:5:"chats";}s:6:"wxcard";a:1:{s:4:"name";s:6:"wxcard";}s:5:"store";a:1:{s:4:"name";s:5:"store";}s:8:"hu_couda";a:1:{s:4:"name";s:8:"hu_couda";}}'),
('we7:user_modules:1', 'a:13:{s:8:"hu_couda";s:3:"all";s:5:"store";s:3:"all";s:6:"wxcard";s:3:"all";s:5:"chats";s:3:"all";s:5:"voice";s:3:"all";s:5:"video";s:3:"all";s:6:"images";s:3:"all";s:6:"custom";s:3:"all";s:8:"recharge";s:3:"all";s:7:"userapi";s:3:"all";s:5:"music";s:3:"all";s:4:"news";s:3:"all";s:5:"basic";s:3:"all";}'),
('we7:last_account:x5IH7', 'i:2;'),
('we7:last_account_type', 's:5:"wxapp";');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:system_frame:1', 'a:12:{s:8:"platform";a:7:{s:5:"title";s:6:"平台";s:4:"icon";s:14:"wi wi-platform";s:3:"url";s:44:"./index.php?c=account&a=display&do=platform&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:2;}s:7:"account";a:7:{s:5:"title";s:9:"公众号";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:41:"./index.php?c=home&a=welcome&do=platform&";s:7:"section";a:5:{s:13:"platform_plus";a:2:{s:5:"title";s:12:"增强功能";s:4:"menu";a:5:{s:14:"platform_reply";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"自动回复";s:3:"url";s:31:"./index.php?c=platform&a=reply&";s:15:"permission_name";s:14:"platform_reply";s:4:"icon";s:11:"wi wi-reply";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:13:"platform_menu";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"自定义菜单";s:3:"url";s:38:"./index.php?c=platform&a=menu&do=post&";s:15:"permission_name";s:13:"platform_menu";s:4:"icon";s:16:"wi wi-custommenu";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:11:"platform_qr";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:22:"二维码/转化链接";s:3:"url";s:28:"./index.php?c=platform&a=qr&";s:15:"permission_name";s:11:"platform_qr";s:4:"icon";s:12:"wi wi-qrcode";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:17:"platform_material";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:16:"素材/编辑器";s:3:"url";s:34:"./index.php?c=platform&a=material&";s:15:"permission_name";s:17:"platform_material";s:4:"icon";s:12:"wi wi-redact";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:3:{s:5:"title";s:13:"添加/编辑";s:3:"url";s:39:"./index.php?c=platform&a=material-post&";s:15:"permission_name";s:13:"material_post";}i:1;a:2:{s:5:"title";s:6:"删除";s:15:"permission_name";s:24:"platform_material_delete";}}}s:13:"platform_site";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:16:"微官网-文章";s:3:"url";s:38:"./index.php?c=site&a=multi&do=display&";s:15:"permission_name";s:13:"platform_site";s:4:"icon";s:10:"wi wi-home";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:2:{s:5:"title";s:6:"粉丝";s:4:"menu";a:2:{s:7:"mc_fans";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"粉丝管理";s:3:"url";s:24:"./index.php?c=mc&a=fans&";s:15:"permission_name";s:7:"mc_fans";s:4:"icon";s:16:"wi wi-fansmanage";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:9:"mc_member";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"会员管理";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:9:"mc_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"profile";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:4:{s:7:"profile";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:15:"profile_setting";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:7:"payment";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"支付参数";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:19:"profile_pay_setting";s:4:"icon";s:17:"wi wi-pay-setting";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:15:"app_module_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"数据同步";s:3:"url";s:44:"./index.php?c=profile&a=module-link-uniacid&";s:15:"permission_name";s:31:"profile_app_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:11:"bind_domain";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"域名绑定";s:3:"url";s:36:"./index.php?c=profile&a=bind-domain&";s:15:"permission_name";s:19:"profile_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:10:"statistics";a:2:{s:5:"title";s:6:"统计";s:4:"menu";a:2:{s:14:"statistics_app";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:14:"statistics_app";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:15:"statistics_fans";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"用户统计";s:3:"url";s:32:"./index.php?c=statistics&a=fans&";s:15:"permission_name";s:15:"statistics_fans";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:3;}s:5:"wxapp";a:7:{s:5:"title";s:15:"微信小程序";s:4:"icon";s:19:"wi wi-small-routine";s:3:"url";s:38:"./index.php?c=wxapp&a=display&do=home&";s:7:"section";a:5:{s:14:"wxapp_entrance";a:3:{s:5:"title";s:15:"小程序入口";s:4:"menu";a:1:{s:20:"module_entrance_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"入口页面";s:3:"url";s:36:"./index.php?c=wxapp&a=entrance-link&";s:15:"permission_name";s:19:"wxapp_entrance_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:3:{s:5:"title";s:6:"粉丝";s:4:"menu";a:1:{s:12:"wxapp_member";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:6:"会员";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:12:"wxapp_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}s:13:"wxapp_profile";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:5:{s:17:"wxapp_module_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:42:"./index.php?c=wxapp&a=module-link-uniacid&";s:15:"permission_name";s:25:"wxapp_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:13:"wxapp_payment";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"支付参数";s:3:"url";s:30:"./index.php?c=wxapp&a=payment&";s:15:"permission_name";s:13:"wxapp_payment";s:4:"icon";s:16:"wi wi-appsetting";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:14:"front_download";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"上传微信审核";s:3:"url";s:37:"./index.php?c=wxapp&a=front-download&";s:15:"permission_name";s:20:"wxapp_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:17:"parameter_setting";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:13:"wxapp_setting";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:23:"wxapp_platform_material";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"素材管理";s:3:"url";N;s:15:"permission_name";s:23:"wxapp_platform_material";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:1:{i:0;a:2:{s:5:"title";s:6:"删除";s:15:"permission_name";s:30:"wxapp_platform_material_delete";}}}}}s:10:"statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:15:"statistics_fans";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:33:"./index.php?c=wxapp&a=statistics&";s:15:"permission_name";s:15:"statistics_fans";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:4;}s:6:"webapp";a:7:{s:5:"title";s:2:"PC";s:4:"icon";s:8:"wi wi-pc";s:3:"url";s:39:"./index.php?c=webapp&a=home&do=display&";s:7:"section";a:4:{s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:2:{s:5:"title";s:6:"粉丝";s:4:"menu";a:1:{s:9:"mc_member";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"会员管理";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:9:"mc_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:6:"webapp";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:3:{s:18:"webapp_module_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"数据同步";s:3:"url";s:43:"./index.php?c=webapp&a=module-link-uniacid&";s:15:"permission_name";s:26:"webapp_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:14:"webapp_rewrite";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"伪静态";s:3:"url";s:31:"./index.php?c=webapp&a=rewrite&";s:15:"permission_name";s:14:"webapp_rewrite";s:4:"icon";s:13:"wi wi-rewrite";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:18:"webapp_bind_domain";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"域名访问设置";s:3:"url";s:35:"./index.php?c=webapp&a=bind-domain&";s:15:"permission_name";s:18:"webapp_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:10:"statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:14:"statistics_app";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:14:"statistics_app";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:5;}s:8:"phoneapp";a:7:{s:5:"title";s:3:"APP";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:41:"./index.php?c=phoneapp&a=display&do=home&";s:7:"section";a:2:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:16:"phoneapp_profile";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:1:{s:14:"front_download";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"下载APP";s:3:"url";s:40:"./index.php?c=phoneapp&a=front-download&";s:15:"permission_name";s:23:"phoneapp_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:6;}s:5:"xzapp";a:7:{s:5:"title";s:9:"熊掌号";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:38:"./index.php?c=xzapp&a=home&do=display&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:7;}s:6:"aliapp";a:7:{s:5:"title";s:18:"支付宝小程序";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:8;}s:6:"module";a:7:{s:5:"title";s:6:"应用";s:4:"icon";s:11:"wi wi-apply";s:3:"url";s:31:"./index.php?c=module&a=display&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:9;}s:6:"system";a:7:{s:5:"title";s:6:"系统";s:4:"icon";s:13:"wi wi-setting";s:3:"url";s:39:"./index.php?c=home&a=welcome&do=system&";s:7:"section";a:13:{s:10:"wxplatform";a:2:{s:5:"title";s:9:"公众号";s:4:"menu";a:4:{s:14:"system_account";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:16:" 微信公众号";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=1";s:15:"permission_name";s:14:"system_account";s:4:"icon";s:12:"wi wi-wechat";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:6:{i:0;a:2:{s:5:"title";s:21:"公众号管理设置";s:15:"permission_name";s:21:"system_account_manage";}i:1;a:2:{s:5:"title";s:15:"添加公众号";s:15:"permission_name";s:19:"system_account_post";}i:2;a:2:{s:5:"title";s:15:"公众号停用";s:15:"permission_name";s:19:"system_account_stop";}i:3;a:2:{s:5:"title";s:18:"公众号回收站";s:15:"permission_name";s:22:"system_account_recycle";}i:4;a:2:{s:5:"title";s:15:"公众号删除";s:15:"permission_name";s:21:"system_account_delete";}i:5;a:2:{s:5:"title";s:15:"公众号恢复";s:15:"permission_name";s:22:"system_account_recover";}}}s:13:"system_module";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"公众号应用";s:3:"url";s:60:"./index.php?c=module&a=manage-system&support=account_support";s:15:"permission_name";s:13:"system_module";s:4:"icon";s:14:"wi wi-wx-apply";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:15:"system_template";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"微官网模板";s:3:"url";s:32:"./index.php?c=system&a=template&";s:15:"permission_name";s:15:"system_template";s:4:"icon";s:17:"wi wi-wx-template";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:15:"system_platform";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:19:" 微信开放平台";s:3:"url";s:32:"./index.php?c=system&a=platform&";s:15:"permission_name";s:15:"system_platform";s:4:"icon";s:20:"wi wi-exploitsetting";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:6:"module";a:2:{s:5:"title";s:9:"小程序";s:4:"menu";a:2:{s:12:"system_wxapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"微信小程序";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=4";s:15:"permission_name";s:12:"system_wxapp";s:4:"icon";s:11:"wi wi-wxapp";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:6:{i:0;a:2:{s:5:"title";s:21:"小程序管理设置";s:15:"permission_name";s:19:"system_wxapp_manage";}i:1;a:2:{s:5:"title";s:15:"添加小程序";s:15:"permission_name";s:17:"system_wxapp_post";}i:2;a:2:{s:5:"title";s:15:"小程序停用";s:15:"permission_name";s:17:"system_wxapp_stop";}i:3;a:2:{s:5:"title";s:18:"小程序回收站";s:15:"permission_name";s:20:"system_wxapp_recycle";}i:4;a:2:{s:5:"title";s:15:"小程序删除";s:15:"permission_name";s:19:"system_wxapp_delete";}i:5;a:2:{s:5:"title";s:15:"小程序恢复";s:15:"permission_name";s:20:"system_wxapp_recover";}}}s:19:"system_module_wxapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"小程序应用";s:3:"url";s:58:"./index.php?c=module&a=manage-system&support=wxapp_support";s:15:"permission_name";s:19:"system_module_wxapp";s:4:"icon";s:17:"wi wi-wxapp-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"welcome";a:3:{s:5:"title";s:12:"系统首页";s:4:"menu";a:1:{s:14:"system_welcome";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"系统首页应用";s:3:"url";s:60:"./index.php?c=module&a=manage-system&support=welcome_support";s:15:"permission_name";s:14:"system_welcome";s:4:"icon";s:11:"wi wi-wxapp";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:7:"founder";b:1;}s:6:"webapp";a:2:{s:5:"title";s:2:"PC";s:4:"menu";a:2:{s:13:"system_webapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:2:"PC";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=5";s:15:"permission_name";s:13:"system_webapp";s:4:"icon";s:8:"wi wi-pc";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:20:"system_module_webapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:8:"PC应用";s:3:"url";s:59:"./index.php?c=module&a=manage-system&support=webapp_support";s:15:"permission_name";s:20:"system_module_webapp";s:4:"icon";s:14:"wi wi-pc-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:8:"phoneapp";a:2:{s:5:"title";s:3:"APP";s:4:"menu";a:2:{s:15:"system_phoneapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:3:"APP";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=6";s:15:"permission_name";s:15:"system_phoneapp";s:4:"icon";s:9:"wi wi-app";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:22:"system_module_phoneapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"APP应用";s:3:"url";s:61:"./index.php?c=module&a=manage-system&support=phoneapp_support";s:15:"permission_name";s:22:"system_module_phoneapp";s:4:"icon";s:15:"wi wi-app-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:5:"xzapp";a:2:{s:5:"title";s:9:"熊掌号";s:4:"menu";a:2:{s:12:"system_xzapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"熊掌号";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=9";s:15:"permission_name";s:12:"system_xzapp";s:4:"icon";s:11:"wi wi-xzapp";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:19:"system_module_xzapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"熊掌号应用";s:3:"url";s:58:"./index.php?c=module&a=manage-system&support=xzapp_support";s:15:"permission_name";s:19:"system_module_xzapp";s:4:"icon";s:17:"wi wi-xzapp-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:6:"aliapp";a:2:{s:5:"title";s:18:"支付宝小程序";s:4:"menu";a:2:{s:13:"system_aliapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"支付宝小程序";s:3:"url";s:46:"./index.php?c=account&a=manage&account_type=11";s:15:"permission_name";s:13:"system_aliapp";s:4:"icon";s:12:"wi wi-aliapp";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:20:"system_module_aliapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:24:"支付宝小程序应用";s:3:"url";s:59:"./index.php?c=module&a=manage-system&support=aliapp_support";s:15:"permission_name";s:20:"system_module_aliapp";s:4:"icon";s:18:"wi wi-aliapp-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:4:"user";a:2:{s:5:"title";s:13:"帐户/用户";s:4:"menu";a:3:{s:9:"system_my";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"我的帐户";s:3:"url";s:29:"./index.php?c=user&a=profile&";s:15:"permission_name";s:9:"system_my";s:4:"icon";s:10:"wi wi-user";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:11:"system_user";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"用户管理";s:3:"url";s:29:"./index.php?c=user&a=display&";s:15:"permission_name";s:11:"system_user";s:4:"icon";s:16:"wi wi-user-group";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:7:{i:0;a:2:{s:5:"title";s:12:"编辑用户";s:15:"permission_name";s:16:"system_user_post";}i:1;a:2:{s:5:"title";s:12:"审核用户";s:15:"permission_name";s:17:"system_user_check";}i:2;a:2:{s:5:"title";s:12:"店员管理";s:15:"permission_name";s:17:"system_user_clerk";}i:3;a:2:{s:5:"title";s:15:"用户回收站";s:15:"permission_name";s:19:"system_user_recycle";}i:4;a:2:{s:5:"title";s:18:"用户属性设置";s:15:"permission_name";s:18:"system_user_fields";}i:5;a:2:{s:5:"title";s:31:"用户属性设置-编辑字段";s:15:"permission_name";s:23:"system_user_fields_post";}i:6;a:2:{s:5:"title";s:18:"用户注册设置";s:15:"permission_name";s:23:"system_user_registerset";}}}s:25:"system_user_founder_group";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"副创始人组";s:3:"url";s:32:"./index.php?c=founder&a=display&";s:15:"permission_name";s:21:"system_founder_manage";s:4:"icon";s:16:"wi wi-co-founder";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:6:{i:0;a:2:{s:5:"title";s:18:"添加创始人组";s:15:"permission_name";s:24:"system_founder_group_add";}i:1;a:2:{s:5:"title";s:18:"编辑创始人组";s:15:"permission_name";s:25:"system_founder_group_post";}i:2;a:2:{s:5:"title";s:18:"删除创始人组";s:15:"permission_name";s:24:"system_founder_group_del";}i:3;a:2:{s:5:"title";s:15:"添加创始人";s:15:"permission_name";s:23:"system_founder_user_add";}i:4;a:2:{s:5:"title";s:15:"编辑创始人";s:15:"permission_name";s:24:"system_founder_user_post";}i:5;a:2:{s:5:"title";s:15:"删除创始人";s:15:"permission_name";s:23:"system_founder_user_del";}}}}}s:10:"permission";a:2:{s:5:"title";s:12:"权限管理";s:4:"menu";a:2:{s:19:"system_module_group";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"应用权限组";s:3:"url";s:29:"./index.php?c=module&a=group&";s:15:"permission_name";s:19:"system_module_group";s:4:"icon";s:21:"wi wi-appjurisdiction";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:3:{i:0;a:2:{s:5:"title";s:21:"添加应用权限组";s:15:"permission_name";s:23:"system_module_group_add";}i:1;a:2:{s:5:"title";s:21:"编辑应用权限组";s:15:"permission_name";s:24:"system_module_group_post";}i:2;a:2:{s:5:"title";s:21:"删除应用权限组";s:15:"permission_name";s:23:"system_module_group_del";}}}s:17:"system_user_group";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"用户权限组";s:3:"url";s:27:"./index.php?c=user&a=group&";s:15:"permission_name";s:17:"system_user_group";s:4:"icon";s:22:"wi wi-userjurisdiction";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:3:{i:0;a:2:{s:5:"title";s:15:"添加用户组";s:15:"permission_name";s:21:"system_user_group_add";}i:1;a:2:{s:5:"title";s:15:"编辑用户组";s:15:"permission_name";s:22:"system_user_group_post";}i:2;a:2:{s:5:"title";s:15:"删除用户组";s:15:"permission_name";s:21:"system_user_group_del";}}}}}s:7:"article";a:2:{s:5:"title";s:13:"文章/公告";s:4:"menu";a:2:{s:14:"system_article";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"文章管理";s:3:"url";s:29:"./index.php?c=article&a=news&";s:15:"permission_name";s:19:"system_article_news";s:4:"icon";s:13:"wi wi-article";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:21:"system_article_notice";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"公告管理";s:3:"url";s:31:"./index.php?c=article&a=notice&";s:15:"permission_name";s:21:"system_article_notice";s:4:"icon";s:12:"wi wi-notice";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"message";a:2:{s:5:"title";s:12:"消息提醒";s:4:"menu";a:1:{s:21:"system_message_notice";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"消息提醒";s:3:"url";s:31:"./index.php?c=message&a=notice&";s:15:"permission_name";s:21:"system_message_notice";s:4:"icon";s:10:"wi wi-bell";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:17:"system_statistics";a:2:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:23:"system_account_analysis";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:35:"./index.php?c=statistics&a=account&";s:15:"permission_name";s:23:"system_account_analysis";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:5:"cache";a:2:{s:5:"title";s:6:"缓存";s:4:"menu";a:1:{s:26:"system_setting_updatecache";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"更新缓存";s:3:"url";s:35:"./index.php?c=system&a=updatecache&";s:15:"permission_name";s:26:"system_setting_updatecache";s:4:"icon";s:12:"wi wi-update";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:10;}s:4:"site";a:8:{s:5:"title";s:6:"站点";s:4:"icon";s:17:"wi wi-system-site";s:3:"url";s:28:"./index.php?c=system&a=site&";s:7:"section";a:3:{s:7:"setting";a:2:{s:5:"title";s:6:"设置";s:4:"menu";a:9:{s:19:"system_setting_site";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"站点设置";s:3:"url";s:28:"./index.php?c=system&a=site&";s:15:"permission_name";s:19:"system_setting_site";s:4:"icon";s:18:"wi wi-site-setting";s:12:"displayorder";i:9;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_menu";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"菜单设置";s:3:"url";s:28:"./index.php?c=system&a=menu&";s:15:"permission_name";s:19:"system_setting_menu";s:4:"icon";s:18:"wi wi-menu-setting";s:12:"displayorder";i:8;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_attachment";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"附件设置";s:3:"url";s:34:"./index.php?c=system&a=attachment&";s:15:"permission_name";s:25:"system_setting_attachment";s:4:"icon";s:16:"wi wi-attachment";s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_systeminfo";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"系统信息";s:3:"url";s:34:"./index.php?c=system&a=systeminfo&";s:15:"permission_name";s:25:"system_setting_systeminfo";s:4:"icon";s:17:"wi wi-system-info";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_logs";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"查看日志";s:3:"url";s:28:"./index.php?c=system&a=logs&";s:15:"permission_name";s:19:"system_setting_logs";s:4:"icon";s:9:"wi wi-log";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:26:"system_setting_ipwhitelist";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:11:"IP白名单";s:3:"url";s:35:"./index.php?c=system&a=ipwhitelist&";s:15:"permission_name";s:26:"system_setting_ipwhitelist";s:4:"icon";s:8:"wi wi-ip";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:28:"system_setting_sensitiveword";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"过滤敏感词";s:3:"url";s:37:"./index.php?c=system&a=sensitiveword&";s:15:"permission_name";s:28:"system_setting_sensitiveword";s:4:"icon";s:15:"wi wi-sensitive";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_thirdlogin";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:25:"用户登录/注册设置";s:3:"url";s:33:"./index.php?c=user&a=registerset&";s:15:"permission_name";s:25:"system_setting_thirdlogin";s:4:"icon";s:10:"wi wi-user";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:20:"system_setting_oauth";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:17:"oauth全局设置";s:3:"url";s:29:"./index.php?c=system&a=oauth&";s:15:"permission_name";s:20:"system_setting_oauth";s:4:"icon";s:11:"wi wi-oauth";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"utility";a:2:{s:5:"title";s:12:"常用工具";s:4:"menu";a:5:{s:24:"system_utility_filecheck";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"系统文件校验";s:3:"url";s:33:"./index.php?c=system&a=filecheck&";s:15:"permission_name";s:24:"system_utility_filecheck";s:4:"icon";s:10:"wi wi-file";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_optimize";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"性能优化";s:3:"url";s:32:"./index.php?c=system&a=optimize&";s:15:"permission_name";s:23:"system_utility_optimize";s:4:"icon";s:14:"wi wi-optimize";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_database";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"数据库";s:3:"url";s:32:"./index.php?c=system&a=database&";s:15:"permission_name";s:23:"system_utility_database";s:4:"icon";s:9:"wi wi-sql";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_utility_scan";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"木马查杀";s:3:"url";s:28:"./index.php?c=system&a=scan&";s:15:"permission_name";s:19:"system_utility_scan";s:4:"icon";s:12:"wi wi-safety";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:18:"system_utility_bom";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"检测文件BOM";s:3:"url";s:27:"./index.php?c=system&a=bom&";s:15:"permission_name";s:18:"system_utility_bom";s:4:"icon";s:9:"wi wi-bom";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"backjob";a:2:{s:5:"title";s:12:"后台任务";s:4:"menu";a:1:{s:10:"system_job";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"后台任务";s:3:"url";s:38:"./index.php?c=system&a=job&do=display&";s:15:"permission_name";s:10:"system_job";s:4:"icon";s:9:"wi wi-job";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:7:"founder";b:1;s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:11;}s:4:"help";a:8:{s:5:"title";s:12:"系统帮助";s:4:"icon";s:12:"wi wi-market";s:3:"url";s:29:"./index.php?c=help&a=display&";s:7:"section";a:0:{}s:5:"blank";b:0;s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:12;}s:5:"store";a:7:{s:5:"title";s:6:"商城";s:4:"icon";s:11:"wi wi-store";s:3:"url";s:43:"./index.php?c=home&a=welcome&do=ext&m=store";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:13;}}'),
('we7:unimodules:1:', 'a:13:{s:5:"basic";a:1:{s:4:"name";s:5:"basic";}s:4:"news";a:1:{s:4:"name";s:4:"news";}s:5:"music";a:1:{s:4:"name";s:5:"music";}s:7:"userapi";a:1:{s:4:"name";s:7:"userapi";}s:8:"recharge";a:1:{s:4:"name";s:8:"recharge";}s:6:"custom";a:1:{s:4:"name";s:6:"custom";}s:6:"images";a:1:{s:4:"name";s:6:"images";}s:5:"video";a:1:{s:4:"name";s:5:"video";}s:5:"voice";a:1:{s:4:"name";s:5:"voice";}s:5:"chats";a:1:{s:4:"name";s:5:"chats";}s:6:"wxcard";a:1:{s:4:"name";s:6:"wxcard";}s:5:"store";a:1:{s:4:"name";s:5:"store";}s:8:"hu_couda";a:1:{s:4:"name";s:8:"hu_couda";}}'),
('we7:module_setting:basic:1', 'a:1:{s:6:"module";s:5:"basic";}'),
('we7:module_setting:news:1', 'a:1:{s:6:"module";s:4:"news";}'),
('we7:module_setting:music:1', 'a:1:{s:6:"module";s:5:"music";}'),
('we7:module_setting:userapi:1', 'a:1:{s:6:"module";s:7:"userapi";}'),
('we7:module_setting:recharge:1', 'a:1:{s:6:"module";s:8:"recharge";}'),
('we7:module_setting:custom:1', 'a:1:{s:6:"module";s:6:"custom";}'),
('we7:module_setting:images:1', 'a:1:{s:6:"module";s:6:"images";}'),
('we7:module_setting:video:1', 'a:1:{s:6:"module";s:5:"video";}'),
('we7:module_setting:voice:1', 'a:1:{s:6:"module";s:5:"voice";}'),
('we7:module_setting:chats:1', 'a:1:{s:6:"module";s:5:"chats";}'),
('we7:module_setting:wxcard:1', 'a:1:{s:6:"module";s:6:"wxcard";}'),
('we7:module_setting:store:1', 'a:1:{s:6:"module";s:5:"store";}'),
('we7:module_setting:hu_couda:1', 'a:1:{s:6:"module";s:8:"hu_couda";}'),
('we7:stat_todaylock:1', 'a:1:{s:6:"expire";i:1543404721;}'),
('we7:unimodules:1:1', 'a:13:{s:5:"basic";a:1:{s:4:"name";s:5:"basic";}s:4:"news";a:1:{s:4:"name";s:4:"news";}s:5:"music";a:1:{s:4:"name";s:5:"music";}s:7:"userapi";a:1:{s:4:"name";s:7:"userapi";}s:8:"recharge";a:1:{s:4:"name";s:8:"recharge";}s:6:"custom";a:1:{s:4:"name";s:6:"custom";}s:6:"images";a:1:{s:4:"name";s:6:"images";}s:5:"video";a:1:{s:4:"name";s:5:"video";}s:5:"voice";a:1:{s:4:"name";s:5:"voice";}s:5:"chats";a:1:{s:4:"name";s:5:"chats";}s:6:"wxcard";a:1:{s:4:"name";s:6:"wxcard";}s:5:"store";a:1:{s:4:"name";s:5:"store";}s:8:"hu_couda";a:1:{s:4:"name";s:8:"hu_couda";}}'),
('we7:unisetting:2', 'a:29:{s:7:"uniacid";s:1:"2";s:8:"passport";s:0:"";s:5:"oauth";s:0:"";s:11:"jsauth_acid";s:1:"0";s:2:"uc";s:0:"";s:6:"notify";s:0:"";s:11:"creditnames";s:0:"";s:15:"creditbehaviors";s:0:"";s:7:"welcome";s:0:"";s:7:"default";s:0:"";s:15:"default_message";s:0:"";s:7:"payment";s:0:"";s:4:"stat";s:0:"";s:12:"default_site";N;s:4:"sync";s:1:"0";s:8:"recharge";s:0:"";s:9:"tplnotice";s:0:"";s:10:"grouplevel";s:1:"0";s:8:"mcplugin";s:0:"";s:15:"exchange_enable";s:1:"0";s:11:"coupon_type";s:1:"0";s:7:"menuset";s:0:"";s:10:"statistics";s:0:"";s:11:"bind_domain";s:0:"";s:14:"comment_status";s:1:"0";s:13:"reply_setting";s:1:"0";s:14:"default_module";s:0:"";s:16:"attachment_limit";N;s:15:"attachment_size";s:3:"127";}'),
('we7:uniaccount:2', 'a:28:{s:4:"acid";s:1:"2";s:7:"uniacid";s:1:"2";s:5:"token";s:32:"nYYdSjWB3y5O5wwb9dW4y292oY9z942D";s:14:"encodingaeskey";s:43:"A1hIY4VX849yzCIeiHey4L8144gLR8RYZglDi8CVddi";s:5:"level";s:1:"1";s:7:"account";s:0:"";s:8:"original";s:18:"wx586e7c59d6e94375";s:3:"key";s:18:"wx586e7c59d6e94375";s:6:"secret";s:32:"176e3e71526b9880ca199f63f486d793";s:4:"name";s:6:"抽奖";s:9:"appdomain";s:0:"";s:11:"encrypt_key";s:18:"wx586e7c59d6e94375";s:4:"type";s:1:"4";s:9:"isconnect";s:1:"0";s:9:"isdeleted";s:1:"0";s:7:"endtime";s:1:"0";s:9:"type_sign";s:5:"wxapp";s:3:"uid";s:1:"1";s:9:"starttime";s:1:"0";s:6:"groups";a:0:{}s:7:"setting";a:0:{}s:10:"grouplevel";N;s:4:"logo";s:60:"http://c.oggogg.com/attachment/headimg_2.jpg?time=1543398385";s:6:"qrcode";s:59:"http://c.oggogg.com/attachment/qrcode_2.jpg?time=1543398385";s:9:"type_name";s:15:"微信小程序";s:9:"switchurl";s:51:"./index.php?c=account&a=display&do=switch&uniacid=2";s:3:"sms";i:0;s:7:"setmeal";a:5:{s:3:"uid";i:-1;s:8:"username";s:9:"创始人";s:9:"timelimit";s:9:"未设置";s:7:"groupid";s:2:"-1";s:9:"groupname";s:12:"所有服务";}}'),
('we7:unimodules:2:1', 'a:13:{s:5:"basic";a:1:{s:4:"name";s:5:"basic";}s:4:"news";a:1:{s:4:"name";s:4:"news";}s:5:"music";a:1:{s:4:"name";s:5:"music";}s:7:"userapi";a:1:{s:4:"name";s:7:"userapi";}s:8:"recharge";a:1:{s:4:"name";s:8:"recharge";}s:6:"custom";a:1:{s:4:"name";s:6:"custom";}s:6:"images";a:1:{s:4:"name";s:6:"images";}s:5:"video";a:1:{s:4:"name";s:5:"video";}s:5:"voice";a:1:{s:4:"name";s:5:"voice";}s:5:"chats";a:1:{s:4:"name";s:5:"chats";}s:6:"wxcard";a:1:{s:4:"name";s:6:"wxcard";}s:5:"store";a:1:{s:4:"name";s:5:"store";}s:8:"hu_couda";a:1:{s:4:"name";s:8:"hu_couda";}}'),
('we7:module_setting:basic:2', 'a:1:{s:6:"module";s:5:"basic";}'),
('we7:module_setting:news:2', 'a:1:{s:6:"module";s:4:"news";}'),
('we7:module_setting:music:2', 'a:1:{s:6:"module";s:5:"music";}'),
('we7:module_setting:userapi:2', 'a:1:{s:6:"module";s:7:"userapi";}'),
('we7:module_setting:recharge:2', 'a:1:{s:6:"module";s:8:"recharge";}'),
('we7:module_setting:custom:2', 'a:1:{s:6:"module";s:6:"custom";}'),
('we7:module_setting:images:2', 'a:1:{s:6:"module";s:6:"images";}'),
('we7:module_setting:video:2', 'a:1:{s:6:"module";s:5:"video";}'),
('we7:module_setting:voice:2', 'a:1:{s:6:"module";s:5:"voice";}'),
('we7:module_setting:chats:2', 'a:1:{s:6:"module";s:5:"chats";}'),
('we7:module_setting:wxcard:2', 'a:1:{s:6:"module";s:6:"wxcard";}'),
('we7:module_setting:store:2', 'a:1:{s:6:"module";s:5:"store";}'),
('we7:module_setting:hu_couda:2', 'a:1:{s:6:"module";s:8:"hu_couda";}'),
('we7:miniapp_version:1', 'a:19:{s:2:"id";s:1:"1";s:7:"uniacid";s:1:"2";s:7:"multiid";s:1:"0";s:7:"version";s:4:"1.01";s:11:"description";s:3:"111";s:7:"modules";a:1:{i:0;a:39:{s:3:"mid";s:2:"13";s:4:"name";s:8:"hu_couda";s:4:"type";s:5:"other";s:5:"title";s:18:"最新抽奖助手";s:7:"version";s:5:"5.2.5";s:7:"ability";s:18:"抽奖助手卡券";s:11:"description";s:12:"抽奖助手";s:6:"author";s:24:"趣味淘QQ：3086811716";s:3:"url";s:20:"https://wx.hzweb.top";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:0:{}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:13:"title_initial";s:1:"Z";s:13:"wxapp_support";s:1:"2";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:14:"webapp_support";s:1:"1";s:16:"phoneapp_support";s:1:"1";s:15:"account_support";s:1:"1";s:13:"xzapp_support";s:1:"1";s:11:"app_support";s:1:"0";s:14:"aliapp_support";s:1:"1";s:9:"isdisplay";i:1;s:4:"logo";s:57:"http://c.oggogg.com/addons/hu_couda/icon.jpg?v=1543397489";s:7:"preview";s:47:"http://c.oggogg.com/addons/hu_couda/preview.jpg";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:6:"config";a:0:{}s:7:"enabled";i:1;s:12:"displayorder";N;s:8:"shortcut";N;s:12:"cover_entrys";a:0:{}s:12:"defaultentry";N;s:7:"newicon";N;}}s:13:"design_method";s:1:"3";s:8:"template";s:1:"0";s:9:"quickmenu";a:6:{s:5:"color";s:7:"#428bca";s:14:"selected_color";s:4:"#0f0";s:8:"boundary";s:4:"#fff";s:7:"bgcolor";s:7:"#bebebe";s:4:"show";i:1;s:5:"menus";a:2:{i:0;a:5:{s:4:"name";s:6:"首页";s:4:"icon";s:36:"./resource/images/bottom-default.png";s:12:"selectedicon";s:36:"./resource/images/bottom-default.png";s:3:"url";N;s:12:"defaultentry";N;}i:1;a:5:{s:4:"name";s:6:"首页";s:4:"icon";s:36:"./resource/images/bottom-default.png";s:12:"selectedicon";s:36:"./resource/images/bottom-default.png";s:3:"url";N;s:12:"defaultentry";N;}}}s:10:"createtime";s:10:"1543398385";s:4:"type";s:1:"0";s:8:"entry_id";s:1:"0";s:7:"appjson";s:0:"";s:15:"default_appjson";s:0:"";s:11:"use_default";s:1:"0";s:8:"redirect";s:0:"";s:10:"connection";s:0:"";s:12:"last_modules";a:0:{}s:12:"cover_entrys";a:0:{}}');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:system_frame:2', 'a:12:{s:8:"platform";a:7:{s:5:"title";s:6:"平台";s:4:"icon";s:14:"wi wi-platform";s:3:"url";s:44:"./index.php?c=account&a=display&do=platform&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:2;}s:7:"account";a:7:{s:5:"title";s:9:"公众号";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:41:"./index.php?c=home&a=welcome&do=platform&";s:7:"section";a:5:{s:13:"platform_plus";a:3:{s:5:"title";s:12:"增强功能";s:4:"menu";a:5:{s:14:"platform_reply";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"自动回复";s:3:"url";s:31:"./index.php?c=platform&a=reply&";s:15:"permission_name";s:14:"platform_reply";s:4:"icon";s:11:"wi wi-reply";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:13:"platform_menu";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:15:"自定义菜单";s:3:"url";s:38:"./index.php?c=platform&a=menu&do=post&";s:15:"permission_name";s:13:"platform_menu";s:4:"icon";s:16:"wi wi-custommenu";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:11:"platform_qr";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:22:"二维码/转化链接";s:3:"url";s:28:"./index.php?c=platform&a=qr&";s:15:"permission_name";s:11:"platform_qr";s:4:"icon";s:12:"wi wi-qrcode";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:17:"platform_material";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:16:"素材/编辑器";s:3:"url";s:34:"./index.php?c=platform&a=material&";s:15:"permission_name";s:17:"platform_material";s:4:"icon";s:12:"wi wi-redact";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:3:{s:5:"title";s:13:"添加/编辑";s:3:"url";s:39:"./index.php?c=platform&a=material-post&";s:15:"permission_name";s:13:"material_post";}i:1;a:2:{s:5:"title";s:6:"删除";s:15:"permission_name";s:24:"platform_material_delete";}}}s:13:"platform_site";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:16:"微官网-文章";s:3:"url";s:38:"./index.php?c=site&a=multi&do=display&";s:15:"permission_name";s:13:"platform_site";s:4:"icon";s:10:"wi wi-home";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}s:10:"is_display";i:0;}s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:3:{s:5:"title";s:6:"粉丝";s:4:"menu";a:2:{s:7:"mc_fans";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"粉丝管理";s:3:"url";s:24:"./index.php?c=mc&a=fans&";s:15:"permission_name";s:7:"mc_fans";s:4:"icon";s:16:"wi wi-fansmanage";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:9:"mc_member";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"会员管理";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:9:"mc_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}s:7:"profile";a:3:{s:5:"title";s:6:"配置";s:4:"menu";a:4:{s:7:"profile";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:15:"profile_setting";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:7:"payment";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"支付参数";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:19:"profile_pay_setting";s:4:"icon";s:17:"wi wi-pay-setting";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:15:"app_module_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:44:"./index.php?c=profile&a=module-link-uniacid&";s:15:"permission_name";s:31:"profile_app_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:11:"bind_domain";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"域名绑定";s:3:"url";s:36:"./index.php?c=profile&a=bind-domain&";s:15:"permission_name";s:19:"profile_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}s:10:"statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:2:{s:14:"statistics_app";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:14:"statistics_app";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:15:"statistics_fans";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"用户统计";s:3:"url";s:32:"./index.php?c=statistics&a=fans&";s:15:"permission_name";s:15:"statistics_fans";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:3;}s:5:"wxapp";a:7:{s:5:"title";s:15:"微信小程序";s:4:"icon";s:19:"wi wi-small-routine";s:3:"url";s:38:"./index.php?c=wxapp&a=display&do=home&";s:7:"section";a:5:{s:14:"wxapp_entrance";a:2:{s:5:"title";s:15:"小程序入口";s:4:"menu";a:1:{s:20:"module_entrance_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"入口页面";s:3:"url";s:36:"./index.php?c=wxapp&a=entrance-link&";s:15:"permission_name";s:19:"wxapp_entrance_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:2:{s:5:"title";s:6:"粉丝";s:4:"menu";a:1:{s:12:"wxapp_member";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:6:"会员";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:12:"wxapp_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:13:"wxapp_profile";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:5:{s:17:"wxapp_module_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"数据同步";s:3:"url";s:42:"./index.php?c=wxapp&a=module-link-uniacid&";s:15:"permission_name";s:25:"wxapp_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:13:"wxapp_payment";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"支付参数";s:3:"url";s:30:"./index.php?c=wxapp&a=payment&";s:15:"permission_name";s:13:"wxapp_payment";s:4:"icon";s:16:"wi wi-appsetting";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:14:"front_download";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"上传微信审核";s:3:"url";s:37:"./index.php?c=wxapp&a=front-download&";s:15:"permission_name";s:20:"wxapp_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:17:"parameter_setting";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:13:"wxapp_setting";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:23:"wxapp_platform_material";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"素材管理";s:3:"url";N;s:15:"permission_name";s:23:"wxapp_platform_material";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:1:{i:0;a:2:{s:5:"title";s:6:"删除";s:15:"permission_name";s:30:"wxapp_platform_material_delete";}}}}}s:10:"statistics";a:2:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:15:"statistics_fans";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:33:"./index.php?c=wxapp&a=statistics&";s:15:"permission_name";s:15:"statistics_fans";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:4;}s:6:"webapp";a:7:{s:5:"title";s:2:"PC";s:4:"icon";s:8:"wi wi-pc";s:3:"url";s:39:"./index.php?c=webapp&a=home&do=display&";s:7:"section";a:4:{s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:2:{s:5:"title";s:6:"粉丝";s:4:"menu";a:1:{s:9:"mc_member";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"会员管理";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:9:"mc_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:6:"webapp";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:3:{s:18:"webapp_module_link";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"数据同步";s:3:"url";s:43:"./index.php?c=webapp&a=module-link-uniacid&";s:15:"permission_name";s:26:"webapp_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:14:"webapp_rewrite";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"伪静态";s:3:"url";s:31:"./index.php?c=webapp&a=rewrite&";s:15:"permission_name";s:14:"webapp_rewrite";s:4:"icon";s:13:"wi wi-rewrite";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:18:"webapp_bind_domain";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"域名访问设置";s:3:"url";s:35:"./index.php?c=webapp&a=bind-domain&";s:15:"permission_name";s:18:"webapp_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:10:"statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:14:"statistics_app";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:14:"statistics_app";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:5;}s:8:"phoneapp";a:7:{s:5:"title";s:3:"APP";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:41:"./index.php?c=phoneapp&a=display&do=home&";s:7:"section";a:2:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:16:"phoneapp_profile";a:2:{s:5:"title";s:6:"配置";s:4:"menu";a:1:{s:14:"front_download";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"下载APP";s:3:"url";s:40:"./index.php?c=phoneapp&a=front-download&";s:15:"permission_name";s:23:"phoneapp_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:6;}s:5:"xzapp";a:7:{s:5:"title";s:9:"熊掌号";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:38:"./index.php?c=xzapp&a=home&do=display&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:7;}s:6:"aliapp";a:7:{s:5:"title";s:18:"支付宝小程序";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:8;}s:6:"module";a:7:{s:5:"title";s:6:"应用";s:4:"icon";s:11:"wi wi-apply";s:3:"url";s:31:"./index.php?c=module&a=display&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:9;}s:6:"system";a:7:{s:5:"title";s:6:"系统";s:4:"icon";s:13:"wi wi-setting";s:3:"url";s:39:"./index.php?c=home&a=welcome&do=system&";s:7:"section";a:13:{s:10:"wxplatform";a:2:{s:5:"title";s:9:"公众号";s:4:"menu";a:4:{s:14:"system_account";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:16:" 微信公众号";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=1";s:15:"permission_name";s:14:"system_account";s:4:"icon";s:12:"wi wi-wechat";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:6:{i:0;a:2:{s:5:"title";s:21:"公众号管理设置";s:15:"permission_name";s:21:"system_account_manage";}i:1;a:2:{s:5:"title";s:15:"添加公众号";s:15:"permission_name";s:19:"system_account_post";}i:2;a:2:{s:5:"title";s:15:"公众号停用";s:15:"permission_name";s:19:"system_account_stop";}i:3;a:2:{s:5:"title";s:18:"公众号回收站";s:15:"permission_name";s:22:"system_account_recycle";}i:4;a:2:{s:5:"title";s:15:"公众号删除";s:15:"permission_name";s:21:"system_account_delete";}i:5;a:2:{s:5:"title";s:15:"公众号恢复";s:15:"permission_name";s:22:"system_account_recover";}}}s:13:"system_module";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"公众号应用";s:3:"url";s:60:"./index.php?c=module&a=manage-system&support=account_support";s:15:"permission_name";s:13:"system_module";s:4:"icon";s:14:"wi wi-wx-apply";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:15:"system_template";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"微官网模板";s:3:"url";s:32:"./index.php?c=system&a=template&";s:15:"permission_name";s:15:"system_template";s:4:"icon";s:17:"wi wi-wx-template";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:15:"system_platform";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:19:" 微信开放平台";s:3:"url";s:32:"./index.php?c=system&a=platform&";s:15:"permission_name";s:15:"system_platform";s:4:"icon";s:20:"wi wi-exploitsetting";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:6:"module";a:2:{s:5:"title";s:9:"小程序";s:4:"menu";a:2:{s:12:"system_wxapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"微信小程序";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=4";s:15:"permission_name";s:12:"system_wxapp";s:4:"icon";s:11:"wi wi-wxapp";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:6:{i:0;a:2:{s:5:"title";s:21:"小程序管理设置";s:15:"permission_name";s:19:"system_wxapp_manage";}i:1;a:2:{s:5:"title";s:15:"添加小程序";s:15:"permission_name";s:17:"system_wxapp_post";}i:2;a:2:{s:5:"title";s:15:"小程序停用";s:15:"permission_name";s:17:"system_wxapp_stop";}i:3;a:2:{s:5:"title";s:18:"小程序回收站";s:15:"permission_name";s:20:"system_wxapp_recycle";}i:4;a:2:{s:5:"title";s:15:"小程序删除";s:15:"permission_name";s:19:"system_wxapp_delete";}i:5;a:2:{s:5:"title";s:15:"小程序恢复";s:15:"permission_name";s:20:"system_wxapp_recover";}}}s:19:"system_module_wxapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"小程序应用";s:3:"url";s:58:"./index.php?c=module&a=manage-system&support=wxapp_support";s:15:"permission_name";s:19:"system_module_wxapp";s:4:"icon";s:17:"wi wi-wxapp-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"welcome";a:3:{s:5:"title";s:12:"系统首页";s:4:"menu";a:1:{s:14:"system_welcome";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"系统首页应用";s:3:"url";s:60:"./index.php?c=module&a=manage-system&support=welcome_support";s:15:"permission_name";s:14:"system_welcome";s:4:"icon";s:11:"wi wi-wxapp";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:7:"founder";b:1;}s:6:"webapp";a:2:{s:5:"title";s:2:"PC";s:4:"menu";a:2:{s:13:"system_webapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:2:"PC";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=5";s:15:"permission_name";s:13:"system_webapp";s:4:"icon";s:8:"wi wi-pc";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:20:"system_module_webapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:8:"PC应用";s:3:"url";s:59:"./index.php?c=module&a=manage-system&support=webapp_support";s:15:"permission_name";s:20:"system_module_webapp";s:4:"icon";s:14:"wi wi-pc-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:8:"phoneapp";a:2:{s:5:"title";s:3:"APP";s:4:"menu";a:2:{s:15:"system_phoneapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:3:"APP";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=6";s:15:"permission_name";s:15:"system_phoneapp";s:4:"icon";s:9:"wi wi-app";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:22:"system_module_phoneapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"APP应用";s:3:"url";s:61:"./index.php?c=module&a=manage-system&support=phoneapp_support";s:15:"permission_name";s:22:"system_module_phoneapp";s:4:"icon";s:15:"wi wi-app-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:5:"xzapp";a:2:{s:5:"title";s:9:"熊掌号";s:4:"menu";a:2:{s:12:"system_xzapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"熊掌号";s:3:"url";s:45:"./index.php?c=account&a=manage&account_type=9";s:15:"permission_name";s:12:"system_xzapp";s:4:"icon";s:11:"wi wi-xzapp";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:19:"system_module_xzapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"熊掌号应用";s:3:"url";s:58:"./index.php?c=module&a=manage-system&support=xzapp_support";s:15:"permission_name";s:19:"system_module_xzapp";s:4:"icon";s:17:"wi wi-xzapp-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:6:"aliapp";a:2:{s:5:"title";s:18:"支付宝小程序";s:4:"menu";a:2:{s:13:"system_aliapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"支付宝小程序";s:3:"url";s:46:"./index.php?c=account&a=manage&account_type=11";s:15:"permission_name";s:13:"system_aliapp";s:4:"icon";s:12:"wi wi-aliapp";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:20:"system_module_aliapp";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:24:"支付宝小程序应用";s:3:"url";s:59:"./index.php?c=module&a=manage-system&support=aliapp_support";s:15:"permission_name";s:20:"system_module_aliapp";s:4:"icon";s:18:"wi wi-aliapp-apply";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:4:"user";a:2:{s:5:"title";s:13:"帐户/用户";s:4:"menu";a:3:{s:9:"system_my";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"我的帐户";s:3:"url";s:29:"./index.php?c=user&a=profile&";s:15:"permission_name";s:9:"system_my";s:4:"icon";s:10:"wi wi-user";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:11:"system_user";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"用户管理";s:3:"url";s:29:"./index.php?c=user&a=display&";s:15:"permission_name";s:11:"system_user";s:4:"icon";s:16:"wi wi-user-group";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:7:{i:0;a:2:{s:5:"title";s:12:"编辑用户";s:15:"permission_name";s:16:"system_user_post";}i:1;a:2:{s:5:"title";s:12:"审核用户";s:15:"permission_name";s:17:"system_user_check";}i:2;a:2:{s:5:"title";s:12:"店员管理";s:15:"permission_name";s:17:"system_user_clerk";}i:3;a:2:{s:5:"title";s:15:"用户回收站";s:15:"permission_name";s:19:"system_user_recycle";}i:4;a:2:{s:5:"title";s:18:"用户属性设置";s:15:"permission_name";s:18:"system_user_fields";}i:5;a:2:{s:5:"title";s:31:"用户属性设置-编辑字段";s:15:"permission_name";s:23:"system_user_fields_post";}i:6;a:2:{s:5:"title";s:18:"用户注册设置";s:15:"permission_name";s:23:"system_user_registerset";}}}s:25:"system_user_founder_group";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"副创始人组";s:3:"url";s:32:"./index.php?c=founder&a=display&";s:15:"permission_name";s:21:"system_founder_manage";s:4:"icon";s:16:"wi wi-co-founder";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:6:{i:0;a:2:{s:5:"title";s:18:"添加创始人组";s:15:"permission_name";s:24:"system_founder_group_add";}i:1;a:2:{s:5:"title";s:18:"编辑创始人组";s:15:"permission_name";s:25:"system_founder_group_post";}i:2;a:2:{s:5:"title";s:18:"删除创始人组";s:15:"permission_name";s:24:"system_founder_group_del";}i:3;a:2:{s:5:"title";s:15:"添加创始人";s:15:"permission_name";s:23:"system_founder_user_add";}i:4;a:2:{s:5:"title";s:15:"编辑创始人";s:15:"permission_name";s:24:"system_founder_user_post";}i:5;a:2:{s:5:"title";s:15:"删除创始人";s:15:"permission_name";s:23:"system_founder_user_del";}}}}}s:10:"permission";a:2:{s:5:"title";s:12:"权限管理";s:4:"menu";a:2:{s:19:"system_module_group";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"应用权限组";s:3:"url";s:29:"./index.php?c=module&a=group&";s:15:"permission_name";s:19:"system_module_group";s:4:"icon";s:21:"wi wi-appjurisdiction";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:3:{i:0;a:2:{s:5:"title";s:21:"添加应用权限组";s:15:"permission_name";s:23:"system_module_group_add";}i:1;a:2:{s:5:"title";s:21:"编辑应用权限组";s:15:"permission_name";s:24:"system_module_group_post";}i:2;a:2:{s:5:"title";s:21:"删除应用权限组";s:15:"permission_name";s:23:"system_module_group_del";}}}s:17:"system_user_group";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"用户权限组";s:3:"url";s:27:"./index.php?c=user&a=group&";s:15:"permission_name";s:17:"system_user_group";s:4:"icon";s:22:"wi wi-userjurisdiction";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:3:{i:0;a:2:{s:5:"title";s:15:"添加用户组";s:15:"permission_name";s:21:"system_user_group_add";}i:1;a:2:{s:5:"title";s:15:"编辑用户组";s:15:"permission_name";s:22:"system_user_group_post";}i:2;a:2:{s:5:"title";s:15:"删除用户组";s:15:"permission_name";s:21:"system_user_group_del";}}}}}s:7:"article";a:2:{s:5:"title";s:13:"文章/公告";s:4:"menu";a:2:{s:14:"system_article";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"文章管理";s:3:"url";s:29:"./index.php?c=article&a=news&";s:15:"permission_name";s:19:"system_article_news";s:4:"icon";s:13:"wi wi-article";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:21:"system_article_notice";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"公告管理";s:3:"url";s:31:"./index.php?c=article&a=notice&";s:15:"permission_name";s:21:"system_article_notice";s:4:"icon";s:12:"wi wi-notice";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"message";a:2:{s:5:"title";s:12:"消息提醒";s:4:"menu";a:1:{s:21:"system_message_notice";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"消息提醒";s:3:"url";s:31:"./index.php?c=message&a=notice&";s:15:"permission_name";s:21:"system_message_notice";s:4:"icon";s:10:"wi wi-bell";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:17:"system_statistics";a:2:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:23:"system_account_analysis";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:35:"./index.php?c=statistics&a=account&";s:15:"permission_name";s:23:"system_account_analysis";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:5:"cache";a:2:{s:5:"title";s:6:"缓存";s:4:"menu";a:1:{s:26:"system_setting_updatecache";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"更新缓存";s:3:"url";s:35:"./index.php?c=system&a=updatecache&";s:15:"permission_name";s:26:"system_setting_updatecache";s:4:"icon";s:12:"wi wi-update";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:10;}s:4:"site";a:8:{s:5:"title";s:6:"站点";s:4:"icon";s:17:"wi wi-system-site";s:3:"url";s:28:"./index.php?c=system&a=site&";s:7:"section";a:3:{s:7:"setting";a:2:{s:5:"title";s:6:"设置";s:4:"menu";a:9:{s:19:"system_setting_site";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"站点设置";s:3:"url";s:28:"./index.php?c=system&a=site&";s:15:"permission_name";s:19:"system_setting_site";s:4:"icon";s:18:"wi wi-site-setting";s:12:"displayorder";i:9;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_menu";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"菜单设置";s:3:"url";s:28:"./index.php?c=system&a=menu&";s:15:"permission_name";s:19:"system_setting_menu";s:4:"icon";s:18:"wi wi-menu-setting";s:12:"displayorder";i:8;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_attachment";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"附件设置";s:3:"url";s:34:"./index.php?c=system&a=attachment&";s:15:"permission_name";s:25:"system_setting_attachment";s:4:"icon";s:16:"wi wi-attachment";s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_systeminfo";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"系统信息";s:3:"url";s:34:"./index.php?c=system&a=systeminfo&";s:15:"permission_name";s:25:"system_setting_systeminfo";s:4:"icon";s:17:"wi wi-system-info";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_logs";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"查看日志";s:3:"url";s:28:"./index.php?c=system&a=logs&";s:15:"permission_name";s:19:"system_setting_logs";s:4:"icon";s:9:"wi wi-log";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:26:"system_setting_ipwhitelist";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:11:"IP白名单";s:3:"url";s:35:"./index.php?c=system&a=ipwhitelist&";s:15:"permission_name";s:26:"system_setting_ipwhitelist";s:4:"icon";s:8:"wi wi-ip";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:28:"system_setting_sensitiveword";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"过滤敏感词";s:3:"url";s:37:"./index.php?c=system&a=sensitiveword&";s:15:"permission_name";s:28:"system_setting_sensitiveword";s:4:"icon";s:15:"wi wi-sensitive";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_thirdlogin";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:25:"用户登录/注册设置";s:3:"url";s:33:"./index.php?c=user&a=registerset&";s:15:"permission_name";s:25:"system_setting_thirdlogin";s:4:"icon";s:10:"wi wi-user";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:20:"system_setting_oauth";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:17:"oauth全局设置";s:3:"url";s:29:"./index.php?c=system&a=oauth&";s:15:"permission_name";s:20:"system_setting_oauth";s:4:"icon";s:11:"wi wi-oauth";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"utility";a:2:{s:5:"title";s:12:"常用工具";s:4:"menu";a:5:{s:24:"system_utility_filecheck";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"系统文件校验";s:3:"url";s:33:"./index.php?c=system&a=filecheck&";s:15:"permission_name";s:24:"system_utility_filecheck";s:4:"icon";s:10:"wi wi-file";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_optimize";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"性能优化";s:3:"url";s:32:"./index.php?c=system&a=optimize&";s:15:"permission_name";s:23:"system_utility_optimize";s:4:"icon";s:14:"wi wi-optimize";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_database";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:9:"数据库";s:3:"url";s:32:"./index.php?c=system&a=database&";s:15:"permission_name";s:23:"system_utility_database";s:4:"icon";s:9:"wi wi-sql";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_utility_scan";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"木马查杀";s:3:"url";s:28:"./index.php?c=system&a=scan&";s:15:"permission_name";s:19:"system_utility_scan";s:4:"icon";s:12:"wi wi-safety";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:18:"system_utility_bom";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"检测文件BOM";s:3:"url";s:27:"./index.php?c=system&a=bom&";s:15:"permission_name";s:18:"system_utility_bom";s:4:"icon";s:9:"wi wi-bom";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"backjob";a:2:{s:5:"title";s:12:"后台任务";s:4:"menu";a:1:{s:10:"system_job";a:9:{s:9:"is_system";i:1;s:10:"is_display";i:1;s:5:"title";s:12:"后台任务";s:3:"url";s:38:"./index.php?c=system&a=job&do=display&";s:15:"permission_name";s:10:"system_job";s:4:"icon";s:9:"wi wi-job";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:7:"founder";b:1;s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:11;}s:4:"help";a:8:{s:5:"title";s:12:"系统帮助";s:4:"icon";s:12:"wi wi-market";s:3:"url";s:29:"./index.php?c=help&a=display&";s:7:"section";a:0:{}s:5:"blank";b:0;s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:12;}s:5:"store";a:7:{s:5:"title";s:6:"商城";s:4:"icon";s:11:"wi wi-store";s:3:"url";s:43:"./index.php?c=home&a=welcome&do=ext&m=store";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:13;}}'),
('we7:unimodules:2:', 'a:13:{s:5:"basic";a:1:{s:4:"name";s:5:"basic";}s:4:"news";a:1:{s:4:"name";s:4:"news";}s:5:"music";a:1:{s:4:"name";s:5:"music";}s:7:"userapi";a:1:{s:4:"name";s:7:"userapi";}s:8:"recharge";a:1:{s:4:"name";s:8:"recharge";}s:6:"custom";a:1:{s:4:"name";s:6:"custom";}s:6:"images";a:1:{s:4:"name";s:6:"images";}s:5:"video";a:1:{s:4:"name";s:5:"video";}s:5:"voice";a:1:{s:4:"name";s:5:"voice";}s:5:"chats";a:1:{s:4:"name";s:5:"chats";}s:6:"wxcard";a:1:{s:4:"name";s:6:"wxcard";}s:5:"store";a:1:{s:4:"name";s:5:"store";}s:8:"hu_couda";a:1:{s:4:"name";s:8:"hu_couda";}}'),
('we7:accesstoken_key:wx586e7c59d6e94375', 'a:2:{s:5:"token";s:157:"16_-OuGrSU0gQ9pLT_ORh1y7mqTKNntRZpvPWt1WT18u_ifxC9zhdbcxi4SoYcrGqrxI0SxU9IFer-QpVkZy_n1qGtA1IAjqhU1zfzANIu6yH0a9NaQZa9eeG6X8YfdKrtd71AWWwJieQZtXO1OJGCeAJAPMI";s:6:"expire";i:1543466542;}'),
('we7:site_store_buy:6:2', 'i:0;'),
('we7:user_modules:', 'a:13:{s:8:"hu_couda";s:3:"all";s:5:"store";s:3:"all";s:6:"wxcard";s:3:"all";s:5:"chats";s:3:"all";s:5:"voice";s:3:"all";s:5:"video";s:3:"all";s:6:"images";s:3:"all";s:6:"custom";s:3:"all";s:8:"recharge";s:3:"all";s:7:"userapi";s:3:"all";s:5:"music";s:3:"all";s:4:"news";s:3:"all";s:5:"basic";s:3:"all";}'),
('we7:unicount:2', 's:1:"0";'),
('we7:unicount:0', 's:1:"0";'),
('we7:last_account:rhC5h', 'i:2;'),
('we7:unisetting:', 'a:1:{s:15:"attachment_size";d:127;}'),
('wechat_access_tokenwx586e7c59d6e94375', 'a:2:{s:6:"expire";i:1543466666;s:4:"data";s:157:"16_EAIcsPZ87dZzXBcMmkt-DTPCIj7kHp7ecdLz9gQW223MQ112EFeIRDhR1vvuzTMGHP0E7Fk8TLp4v8QUIIoqxwdqkPVwJ4vJJjFc0dGThIJu8x9II86lbJ4z7q7CEEAx_bITJRlGfDSwkGvnKKAbAHAOOE";}'),
('we7:uni_groups', 'a:1:{i:1;a:12:{s:2:"id";s:1:"1";s:9:"owner_uid";s:1:"0";s:4:"name";s:18:"体验套餐服务";s:7:"modules";a:0:{}s:9:"templates";a:0:{}s:7:"uniacid";s:1:"0";s:3:"uid";s:1:"0";s:6:"aliapp";a:0:{}s:5:"xzapp";a:0:{}s:8:"phoneapp";a:0:{}s:6:"webapp";a:0:{}s:5:"wxapp";a:1:{i:0;s:8:"hu_couda";}}}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron`
--

CREATE TABLE IF NOT EXISTS `ims_core_cron` (
  `id` int(10) unsigned NOT NULL,
  `cloudid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) unsigned NOT NULL,
  `nextruntime` int(10) unsigned NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron_record`
--

CREATE TABLE IF NOT EXISTS `ims_core_cron_record` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_job`
--

CREATE TABLE IF NOT EXISTS `ims_core_job` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `title` varchar(22) NOT NULL,
  `handled` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `isdeleted` tinyint(1) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_menu`
--

CREATE TABLE IF NOT EXISTS `ims_core_menu` (
  `id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  `group_name` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_paylog`
--

CREATE TABLE IF NOT EXISTS `ims_core_paylog` (
  `plid` bigint(11) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_performance`
--

CREATE TABLE IF NOT EXISTS `ims_core_performance` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_queue`
--

CREATE TABLE IF NOT EXISTS `ims_core_queue` (
  `qid` bigint(20) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_refundlog`
--

CREATE TABLE IF NOT EXISTS `ims_core_refundlog` (
  `id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `refund_uniontid` varchar(64) NOT NULL,
  `reason` varchar(80) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_resource`
--

CREATE TABLE IF NOT EXISTS `ims_core_resource` (
  `mid` int(11) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sendsms_log`
--

CREATE TABLE IF NOT EXISTS `ims_core_sendsms_log` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sessions`
--

CREATE TABLE IF NOT EXISTS `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_sessions`
--

INSERT INTO `ims_core_sessions` (`sid`, `uniacid`, `openid`, `data`, `expiretime`) VALUES
('bc2f4ae1b3577ac3a6071e503f545021', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Ofes";i:1543398745;}', 1543402345),
('686e7eb7baa8496f67e80adca3aa0d0d', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"feE3";i:1543398745;}member_id|s:1:"5";openid|s:28:"o5zVZ5N9HijSJ_yv_sy4Pmmaf7_Q";session_key|s:24:"5dSUG9vUGw5R2APhugzFsA==";', 1543402345),
('bd68fd33492e8d794b1ffcf1960e7dae', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"L04M";i:1543398747;}', 1543402347),
('8dc30a5af47e24d674cef08277f71d42', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"LEQi";i:1543398747;}', 1543402347),
('2fa40d51fedc194bdfffdbf3d48836e7', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"zTgm";i:1543398747;}', 1543402347),
('7bc1bbc58d713431db88ff2de2afa390', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"ybp7";i:1543398747;}', 1543402347),
('5c486bdcd957bbd37bac0a6a95a16280', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"tgaw";i:1543398750;}', 1543402350),
('d2cd6ba0254fa37c05f27214b91e2bdd', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"yiqq";i:1543398750;}', 1543402350),
('34f6c427f0d69479d7ae17614e34106a', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"IMqC";i:1543398750;}', 1543402350),
('d8f7940ea64c8832d7ebf9beb41a9512', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"syvD";i:1543398750;}', 1543402350),
('1fe2bcc3e1d1733b88fea5d6bf1044af', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Rx7r";i:1543398751;}', 1543402351),
('7a0ef5cb9f310ac4d88afa00bb5c74ee', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"JC22";i:1543398751;}', 1543402351),
('b9f58a119c0f4c4d42dd3be7840a0ba0', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"RwVg";i:1543398751;}', 1543402351),
('0745a86a465968b9e48664f477e4158e', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"mp0t";i:1543398751;}', 1543402351),
('bccb465746535749ca89713ddf33cc95', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"fD2s";i:1543398751;}', 1543402351),
('b062637e50663e1ce499127c19961442', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"P4XH";i:1543398751;}', 1543402351),
('9ec0eba094ca1955ea0871ebed626d74', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"IT8Z";i:1543398751;}', 1543402351),
('fdd8569b8261eab9e0a7cce6696d1330', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"zTKd";i:1543398751;}', 1543402351),
('6611ac129e362f74d4d88d09ad9808ab', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"i8z6";i:1543398751;}', 1543402351),
('4459297f4d998f23e93f264399dd7acb', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"OZWI";i:1543398755;}', 1543402355),
('918cac835911e344ff2fda12fff90caf', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"f4l2";i:1543399434;}', 1543403034),
('88d5761d1ad031a84a82405a3c94b2eb', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"ApKU";i:1543399435;}', 1543403035),
('cad5727b372bd863512047230582dc34', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"c77L";i:1543399435;}', 1543403035),
('d9fffdc5269f25117dfc2a1adf4d5508', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"g0G3";i:1543399435;}', 1543403035),
('d243e46f6ff44f9b5b9454f578a0850c', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"d31c";i:1543399435;}', 1543403035),
('01dfe9308203499d7c7cca38fa9c2b16', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Jg3D";i:1543399491;}', 1543403091),
('8596e3b8c2e633dacb422890f0708da4', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Jutz";i:1543399491;}', 1543403091),
('5a82b8e9f804b5acf8066346dbea3577', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"K4G2";i:1543399491;}', 1543403091),
('2429578308c57bb3f713d333850575e1', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"qAf5";i:1543399493;}', 1543403093),
('dea5e51d7eed5f24613d86e797092e6a', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"yDN4";i:1543399493;}', 1543403093),
('a41f9352c9cd990dbc0aa69f7d4fb35f', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"atb8";i:1543399493;}', 1543403093),
('1d72e66309882fb900ba7bd260232dbd', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"YUSO";i:1543399493;}', 1543403093),
('0526f50dff09871d26636de15e6a2599', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"hSXL";i:1543399493;}', 1543403093),
('210af09a8f6a700d0036e727e10517dc', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"xIRi";i:1543399493;}', 1543403093),
('bb75cbe1f24ed5d28841b40313b6a4bc', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Iv2c";i:1543399493;}', 1543403093),
('ef75dc1e9b4d8e73ba62feb8512c7358', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"IBc1";i:1543399493;}', 1543403093),
('7f8f898b03fe389e89a9e3226c17ff83', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"pJsb";i:1543399493;}', 1543403093),
('cc6ac92e2d4a30b14817df6220765430', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"y6t6";i:1543399525;}', 1543403125),
('0380d6a093ea4f99f313f88a38982364', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"a4S4";i:1543399525;}', 1543403125),
('b14647c19339432193007ad20d772dbc', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"EAP9";i:1543399525;}', 1543403125),
('754f91d1fa891228a54926c9e874c069', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"S1Jt";i:1543399525;}', 1543403125),
('2339d830b190b4ca71ff2630e78103fe', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Iu8O";i:1543399526;}', 1543403126),
('9eb30f6a5f6c308b0902d49eba9d58a0', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"lHQr";i:1543399526;}', 1543403126),
('5825a42bd125c6e05064d430d467dac4', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"bsT5";i:1543399526;}', 1543403126),
('b6884cc0c01cad19118f2c46cef04f2e', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"isOS";i:1543399528;}', 1543403128),
('8e1a1424221de980548382ded62e9821', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"LXGv";i:1543399528;}', 1543403128),
('2261e353a02b0be526eb72b517610c98', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"F8wW";i:1543399529;}', 1543403129),
('181bbdb8fff1f9d8d78ab085866f3b34', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"WuN3";i:1543399534;}', 1543403134),
('4482436447b6596f6bc9094e23320863', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"nK57";i:1543399534;}', 1543403134),
('8fae09eaf19c16d72878eb2552dcb081', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"KkRm";i:1543399539;}', 1543403139),
('7a1268fa126ff4ebb7cf6f441b52aece', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"ujJO";i:1543399539;}', 1543403139),
('5ccf41dcc420a5628b04c3aa894cf0e9', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"y117";i:1543399539;}', 1543403139),
('acfa6f85f1ec044f1abc045273507775', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"INS2";i:1543399539;}', 1543403139),
('4e6c02f0a63878c974283dcc623ce9b3', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"t2Cd";i:1543399539;}', 1543403139),
('3bff257c21c548d62b26f714c2418098', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"q6tm";i:1543399539;}', 1543403139),
('1fd5546d867568e5c583548d9d654a6d', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"jaJC";i:1543399539;}', 1543403139),
('e9aec5a89646faa49b3bf489bb8ee8fd', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"jU85";i:1543399539;}', 1543403139),
('6c6a50790b9084aa20531950ae4ef194', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"iX3z";i:1543399539;}', 1543403139),
('4326e222450ef52afd07d89fc2f56da1', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"wVnQ";i:1543399548;}', 1543403148),
('0bebfefea4f818d0e86de30268ea5f3f', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"bWNw";i:1543399548;}', 1543403148),
('0ccb6603244a1c3c9a48671cb3d42b9e', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"PRoO";i:1543399548;}', 1543403148),
('d5d0f9a70e08bd174e945b497338b828', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"F3ak";i:1543399548;}', 1543403148),
('def5054de068af72dcd2a620720ea8bf', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"g6Q2";i:1543399549;}', 1543403149),
('8695516deb1cee947aab70de18c2eb9c', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"yZy0";i:1543399549;}', 1543403149),
('2e38041e55284c4ac02a0d0992bfd0b0', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Y8y4";i:1543399549;}', 1543403149),
('66f92e7a32acf8ed7269fe1fbd080458', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"kL7I";i:1543399549;}', 1543403149),
('25ceda371a919d0bc33bf14bf035863d', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"vK9a";i:1543399549;}', 1543403149),
('991bf4b3ce977011647eb233321786b9', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"MT8q";i:1543399549;}', 1543403149),
('872903576914dde52923760fb3414511', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"IcMw";i:1543399549;}', 1543403149),
('71c9486a44cb3ca85965ab06bc76c85d', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"c7E2";i:1543399549;}', 1543403149),
('055c04c1ae41e2ab699bcf4dc0397c69', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"u2Qa";i:1543399549;}', 1543403149),
('d7e0453ef5a00428b85f81c796069fb7', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"jDOi";i:1543399557;}', 1543403157),
('b45dc13cd452d14ad941cb1364ed3e39', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"uzmq";i:1543399557;}', 1543403157),
('d47551be616e4a08be021dbcb23ca6de', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"fm3Q";i:1543399557;}', 1543403157),
('5995be28d16fe1d595f85b754ad10b3f', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"F1A6";i:1543399557;}', 1543403157),
('22e091dbbbdc81b13f397ecb902e02ae', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"w8sr";i:1543399558;}', 1543403158),
('cdd62b11104cd23b9fe66d1390ba8eee', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"BvJe";i:1543399558;}', 1543403158),
('39b1985fa257a19d0accd3c96a969859', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"XZ8W";i:1543399558;}', 1543403158),
('5cc6ac74b7f187003972f7ebd7774361', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"PSEd";i:1543399558;}', 1543403158),
('536e6866b237696cb002a89bb0655c5a', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"qEWW";i:1543399559;}', 1543403159),
('972d55539dca02485243fd5558833daf', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"guuU";i:1543399559;}', 1543403159),
('01857d85afc0ab2353c5e6ef92bb4f03', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"YO1r";i:1543399559;}', 1543403159),
('fe87453a26e0012706a8442e2fb0acf3', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"QyJV";i:1543399559;}', 1543403159),
('88478ee49e5a4ea6688609b27d2b3563', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Wkge";i:1543399559;}', 1543403159),
('f5b218a70073e1d62ce693200153c00f', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"OG5s";i:1543399559;}', 1543403159),
('95a3dfdc627a3192f8816f6e29aaa5d6', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"d59g";i:1543399559;}', 1543403159),
('4007adeee4a7ba256169b3512bf48761', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"H1PQ";i:1543399559;}', 1543403159),
('30039b3e51404a23f9b16efd64f8b125', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"DMk5";i:1543399559;}', 1543403159),
('dde204e24f0e45a9a5248c38b9798a7a', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"d0w0";i:1543399574;}', 1543403174),
('62d2b58de1481355c552dbf51e13e00b', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"wlAt";i:1543399576;}', 1543403176),
('97460fe6e44d0d9b0b774c88c64988dd', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"EHMh";i:1543399576;}', 1543403176),
('2d9a4f0518b841ebdf07c9b0771bcf53', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"i9uJ";i:1543399576;}', 1543403176),
('3e2c77f5fae42af6a0df86fb725caa3a', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Kb7J";i:1543399576;}', 1543403176),
('de9b184e3d5c73b78c90a35bd40feafa', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"fmpP";i:1543399599;}', 1543403199),
('c78199ab7f613c5e4426eb1bf12af101', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"SmLS";i:1543399599;}', 1543403199),
('fd34e0ca8dc78d357c05c2243b1d1d8e', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"YEAT";i:1543399599;}', 1543403199),
('92cf3b36d5feb2d057c2a5c8b777a188', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"x43n";i:1543399599;}', 1543403199),
('c94d4c8d6816e17f009058bd83929932', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"sANo";i:1543399599;}', 1543403199),
('376d55d3c45daf52e3541a66a18c07ba', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"hpKc";i:1543399599;}', 1543403199),
('2ca2a80c3119693de8bfd854851da8a4', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"pEME";i:1543399599;}', 1543403199),
('79ab14b8c6c13ebeedb404f8ac1b86b5', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"uwwC";i:1543399600;}', 1543403200),
('49582a517a0d8b2b885c43c60569f8ea', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"w9AO";i:1543399600;}', 1543403200),
('02776ecd71e11491c98f7cdbdef0f2b7', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"smA8";i:1543399830;}', 1543403430),
('906bf0e6e153ac2e9a028d28c93fcd00', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"RJ3R";i:1543399832;}', 1543403432),
('a449c1e66e208da1412ccb61798d292a', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"h9AB";i:1543399832;}', 1543403432),
('0e8ff6f11068b624616e32c4e75356be', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"s52r";i:1543399832;}', 1543403432),
('d5618784da4d6e86878c70b7ad73c5e0', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"VEEM";i:1543399832;}', 1543403432),
('3f49999d9002622a008b32dcb223af24', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"GP9F";i:1543399851;}', 1543403451),
('d07dc4f03a9e9a6be68ab515d606f206', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"b65N";i:1543399851;}', 1543403451),
('d48c6353773c09b7bb9c21629ef7ca38', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"uDl9";i:1543399851;}', 1543403451),
('446cd02cc66ab8affbdd104c9ad66c72', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"bq43";i:1543399852;}', 1543403452),
('068a053447b3b6901a6bf40d7d1e4747', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"H4JZ";i:1543399854;}', 1543403454),
('cc36ed6b7762d31f11673c9b439e0a67', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Hf2w";i:1543399854;}', 1543403454),
('c47001034ebd74523c50506d05633141', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"jK5k";i:1543399854;}', 1543403454),
('ed4108d92f856c89c5b091a0ae64e0e0', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"qUYh";i:1543399854;}', 1543403454),
('db1baa979cd89d7b3c007414c4496c14', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"dtj3";i:1543399854;}', 1543403454),
('bd648df973e9cdec33b3957ce068d203', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"PWth";i:1543399854;}', 1543403454),
('5f1fb7d54d0b67ed801535f74be313d8', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"mcyx";i:1543399854;}', 1543403454),
('1d11636cafd1fe79d7f63c54c44dd9c7', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"oW3A";i:1543399854;}', 1543403454),
('d3e97ac3742f491665bf1565c117d85b', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"s0ZH";i:1543399854;}', 1543403454),
('03cbff56b0ff7d5d785eb57b862e0fd0', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"NhzG";i:1543399857;}', 1543403457),
('21eaac9faa2e75641bf39216aabcd875', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"llHl";i:1543399857;}', 1543403457),
('8882e4c9ff7d553777b0e83737d5ac55', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Iile";i:1543399857;}', 1543403457),
('712777b100ad6c54d7fdd24667dfdfcc', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"K9mD";i:1543399857;}', 1543403457),
('d7a11b518e727217c4d40d9263f01fa2', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"R7CM";i:1543399861;}', 1543403461),
('42c04e1906e8b1c00d2dc013904f8a2e', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"c8w4";i:1543399862;}', 1543403462),
('be91b8ed52f64b31b7ef830e66cc3174', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"VG50";i:1543399862;}', 1543403462),
('8d41d78ea4930c3959c5f8db366656e4', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"q4rw";i:1543399862;}', 1543403462),
('1eac9eb1ad31e56fd49158561f9cc3ea', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"pFrm";i:1543399862;}', 1543403462),
('4bd08787cc017e55f717537096e4dc15', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"i77c";i:1543400070;}', 1543403670),
('710ed50ce491e08e02e7224f079ab6be', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"uDCZ";i:1543400070;}', 1543403670),
('18cd2495c13ecc376dabd097fbeecca4', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"IRQ4";i:1543400070;}', 1543403670),
('c6c791b7222c17b8efa00a5d089f7c8e', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"QoG6";i:1543400072;}', 1543403672),
('9e2f2eeb9c66237922d7c5e518fad26a', 2, '60.176.144.119', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"hb1G";i:1543400072;}', 1543403672),
('c8b9bbfdad8bb0ed4d5d62ca0dbef51c', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"n3yq";i:1543459349;}', 1543462949),
('ac187b6ff3756268e04f79d32bad13f0', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Hboq";i:1543459351;}', 1543462951),
('b3ac88c605380ee85f033cfc1fffac54', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"F49R";i:1543459351;}', 1543462951),
('f3ae3235d94265687f070547842ad923', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"VEUh";i:1543459351;}', 1543462951),
('7e999fd33bb5461d09b449b73c82f475', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"lIjP";i:1543459351;}', 1543462951),
('d0d9e20a6bccaab48035481f56dbbc98', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"HPtL";i:1543459376;}', 1543462976),
('8d24dfe5918e096ce470649e7f45b4e3', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"bUWd";i:1543459376;}', 1543462976),
('2651d12456cf4a846c6466a893185dae', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"t0DY";i:1543459376;}', 1543462976),
('087778f2a8c4f701db24764ceb21faac', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Zxzv";i:1543459379;}', 1543462979),
('ac5d9e98f1570e2cf49afa4a557a8945', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"nB2t";i:1543459379;}', 1543462979),
('132f2c422e67d81d18ae4965c479c8c1', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"gN9s";i:1543459379;}', 1543462979),
('e70995629f0fbca864b962a6cd2ed728', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"L4Tx";i:1543459379;}', 1543462979),
('9b21b1a1113064dbc009bcfbc64abb3e', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"VmKx";i:1543459509;}', 1543463109),
('152e908f6cd3593bcfdc603416430992', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"bgg9";i:1543459509;}', 1543463109),
('334a7b363ebacea6908dec8ffadf22ca', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"tIxq";i:1543459509;}', 1543463109),
('c1c6673d5091646d408f1ea416324b70', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"V1uv";i:1543459509;}', 1543463109),
('616bf2cb8675e6e6954df005475cf1dd', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"XQ99";i:1543459509;}', 1543463109),
('2fe12e9d84470fcb330b7cd1ed234669', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"p7GX";i:1543459509;}', 1543463109),
('bc645b64c0d154e065c4de56c77ae400', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"eXQ1";i:1543459509;}', 1543463109),
('fab95dc75d49f0a21a0239151137da24', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"rt30";i:1543459509;}', 1543463109),
('dadb6588409dc151101c67bfb25e9b22', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"AvML";i:1543459509;}', 1543463109),
('d10b5b247f83ddb52fc481fb2cd94139', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"bVpa";i:1543459604;}', 1543463204),
('1d63535b33f7a8accf5bb3194d5b5c27', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"f3R6";i:1543459604;}', 1543463204),
('942ed287516967a004c502d7a8b9709e', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Z567";i:1543459604;}', 1543463204),
('e57172800de45cc25c74d17db28a1314', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"F6sP";i:1543459604;}', 1543463204),
('6d593fa21373b6eab3cf754270dfa505', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"uYeP";i:1543459686;}', 1543463286),
('88e6d4b0093175f715bff4fa00ce0787', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"mlLs";i:1543459686;}', 1543463286),
('7c5434b662c91a4ff1ce99ca145f61e1', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"tInp";i:1543459686;}', 1543463286),
('51a06110c56ffd8648107c22debd46a9', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"p84d";i:1543459686;}', 1543463286),
('8df7a9bb0f9ab54b5f5ca0496818625e', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"M77R";i:1543459686;}', 1543463286),
('5062e14ddc987e1922b9f7465a68250a', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"c63K";i:1543459686;}', 1543463286),
('71bc4b42eb9d4aa96ece61cec7ade9ac', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"myYy";i:1543459686;}', 1543463286),
('e5026eb013d073bcf78a8adad3d201c7', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"C2A9";i:1543459686;}', 1543463286),
('1128b0b65242ecc47589a863e188c5d7', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"P1Ky";i:1543459686;}', 1543463286),
('57f74d477fe60c5c9fb928bb27bc003a', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"S9NS";i:1543459738;}', 1543463338),
('90df628feebf32986a47b187d83c42df', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"sc8l";i:1543459738;}', 1543463338),
('1b177a31d6063be14a32bf01d6c93de6', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"urEZ";i:1543459738;}', 1543463338),
('814f25b39471f4b6bdccf98d7a1675df', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Otsf";i:1543459738;}', 1543463338),
('787fb9b50acebfa32a6a70d492ebac0d', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"lDkz";i:1543459740;}', 1543463340),
('456aad200cb097c41af659847c156cea', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"xZl1";i:1543459740;}', 1543463340),
('d06c288bda0dd23a0ef4bfdaa7f96cb2', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"d2Nn";i:1543459740;}', 1543463340),
('796c766f9ca5d70b57d8cc6b0413b517', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"gnmR";i:1543459740;}', 1543463340),
('65b725b10284efc950272d5d3056eef7', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"DxzC";i:1543459740;}', 1543463340),
('ebfa466e472fe2cad0eb7656ecfa4409', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Zann";i:1543459741;}', 1543463341),
('45f9203b7bb0e1c13a37c9b824092d55', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"uXXU";i:1543459741;}', 1543463341),
('3c660ed73eecad6d1347efb43752e071', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"A4S5";i:1543459741;}', 1543463341),
('9791bd5327eff2dd66750253a84d8228', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"U2Nu";i:1543459741;}', 1543463341),
('1c78c1cf6eea5cea350c30f56fcdcb63', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"J9oK";i:1543459748;}', 1543463348),
('6b067f069ce52bc31f780ba6f00521db', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"zhbC";i:1543459748;}', 1543463348),
('9f68c1305e46df2694dcd5492cb6f32a', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"a2hx";i:1543459748;}', 1543463348),
('6b548154aa5605b3637a51555ca47174', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"AX04";i:1543459748;}', 1543463348),
('232ea3846e07a990498964607189d169', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"NF99";i:1543459749;}', 1543463349),
('1a99be43fbec37a69dbfdea19fe4dfc3', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"BXxc";i:1543459749;}', 1543463349),
('4e4ab281a15021d26e0d9ac31032c9e1', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"wfxn";i:1543459749;}', 1543463349),
('2e549a6fa3964f64bb41d3308500b294', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"hdNa";i:1543459751;}', 1543463351),
('9db6f7d143649c98a0a684bae47f1476', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"l9up";i:1543459751;}', 1543463351),
('97b947c9f59bf6b0afc1d1aeeffc08d5', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"kQKX";i:1543459751;}', 1543463351),
('dd61508be42e67a2ee32ae3c138f69d0', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"uiFc";i:1543459751;}', 1543463351),
('8c3af36560d13bb9040211883fb125a7', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"s950";i:1543459757;}', 1543463357),
('6a86291647fc5927307fa293363d602a', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"V0Ma";i:1543459757;}', 1543463357),
('a19af28910c596989e7561bef4b651bf', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"qQKK";i:1543459757;}', 1543463357),
('16ade3f496e12bed350fb6353197e332', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"qfx5";i:1543459757;}', 1543463357),
('d9ed103e7dc66e6c5526e278e307a078', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"xuwu";i:1543459757;}', 1543463357),
('6878f988d4685727671bafe12a876e65', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"laA5";i:1543459757;}', 1543463357),
('a0cd5eb75218a28b89f7a80ae9c92a55', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"DR1w";i:1543459757;}', 1543463357),
('f16cf2f481dbcb1e9581ad7464c49034', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"w3L6";i:1543459757;}', 1543463357),
('85b005ff20ac92b0af7840ff3f698d7c', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"fZE4";i:1543459757;}', 1543463357),
('c5a09609a4a6cb519a3a5c5ea37f6568', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"KSRe";i:1543459769;}', 1543463369),
('aa56231be8edc00203b656cff2c583a3', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"eOeO";i:1543459788;}', 1543463388),
('fe692d04b73077c246c76c2e523d0403', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"lP7l";i:1543459788;}', 1543463388),
('74d78736fb83b968c22d8b7c09a2b85a', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"qmNv";i:1543459788;}', 1543463388),
('d5ec31c0c019829fb1a08c166bdc35f2', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"d0mq";i:1543459788;}', 1543463388),
('fba082857d82940bc25a6cd95e312fbc', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"DETG";i:1543459848;}', 1543463448),
('630cd16471a76ac810360886f962fe78', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"YqK2";i:1543459848;}', 1543463448),
('b5638f64b11a9d095a8f46ffb93cdcca', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"J3w3";i:1543459848;}', 1543463448),
('4767f84500798a0458fe9447c31c887c', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"e5cP";i:1543459848;}', 1543463448),
('6d038c3bf4d5e49a64df6d59f4b29dd5', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"S54n";i:1543459848;}', 1543463448),
('633c8a351659b02bf93c38c8b753cb93', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"q48U";i:1543459848;}', 1543463448),
('928854f663d5bbf52a86e7355ef4b906', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"U4Xx";i:1543459848;}', 1543463448),
('360f33b0955843f6ded3db6f94cffca3', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"WzD4";i:1543459848;}', 1543463448),
('03fb66ef9104dcd7b3152e4e6b3e4984', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"NcRs";i:1543459848;}', 1543463448),
('4559fa30d18093cb613612be3812e3ba', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"TJSs";i:1543459871;}', 1543463471),
('53dc62afce384f0301c9a9216ccb39ff', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"C3hI";i:1543459872;}', 1543463472),
('e060eafd5156bb45168c8040e9d99c13', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"oxt7";i:1543459872;}', 1543463472),
('e413d804cc8329eded27f2e992b78b46', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"WMvU";i:1543459872;}', 1543463472),
('a75c8f9d359d3eeb73c5ec18fab2547e', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"VsWb";i:1543459874;}', 1543463474),
('af77709a673f18ef8a25e6d80898eaf4', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"v2h7";i:1543459874;}', 1543463474),
('d7a88ff3804fc168ad2639a08959923c', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Z7Br";i:1543459874;}', 1543463474),
('38d5193e22b25964010bd75f05288b88', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"Ts43";i:1543459874;}', 1543463474),
('6efc989b3b23c328d74021875260b3df', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"C8sv";i:1543459874;}', 1543463474),
('2b2403a0c532a37980470c7920cd4f0b', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"P320";i:1543459874;}', 1543463474),
('e8453623769b21fa0a5085f6e2061cb7', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"htdD";i:1543459874;}', 1543463474),
('4478e25d8e35db20d39c7919ad45d698', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"I3kz";i:1543459874;}', 1543463474),
('1283d9c85955d39d33081c6f08439b79', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"mx4F";i:1543459874;}', 1543463474),
('4814255622970b29d4ea0420434b4f08', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"V1S6";i:1543459951;}', 1543463551),
('b69d1aa73a73998e17515057f95f0d38', 2, '115.192.33.37', 'acid|s:1:"2";uniacid|i:2;token|a:1:{s:4:"PzW8";i:1543459958;}', 1543463558);

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_settings`
--

CREATE TABLE IF NOT EXISTS `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_settings`
--

INSERT INTO `ims_core_settings` (`key`, `value`) VALUES
('copyright', 'a:1:{s:6:"slides";a:3:{i:0;s:58:"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg";i:1;s:58:"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg";i:2;s:58:"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg";}}'),
('authmode', 'i:1;'),
('close', 'a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}'),
('register', 'a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_location`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_location` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cover_reply`
--

CREATE TABLE IF NOT EXISTS `ims_cover_reply` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_cover_reply`
--

INSERT INTO `ims_cover_reply` (`id`, `uniacid`, `multiid`, `rid`, `module`, `do`, `title`, `description`, `thumb`, `url`) VALUES
(1, 1, 0, 7, 'mc', '', '进入个人中心', '', '', './index.php?c=mc&a=home&i=1'),
(2, 1, 1, 8, 'site', '', '进入首页', '', '', './index.php?c=home&i=1&t=1');

-- --------------------------------------------------------

--
-- 表的结构 `ims_custom_reply`
--

CREATE TABLE IF NOT EXISTS `ims_custom_reply` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_images_reply`
--

CREATE TABLE IF NOT EXISTS `ims_images_reply` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_job`
--

CREATE TABLE IF NOT EXISTS `ims_job` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `title` varchar(22) NOT NULL,
  `handled` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_cash_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_cash_record` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `return_cash` decimal(10,2) unsigned NOT NULL,
  `final_cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `trade_type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_chats_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_recharge`
--

CREATE TABLE IF NOT EXISTS `ims_mc_credits_recharge` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `backtype` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_credits_record` (
  `id` int(11) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL,
  `real_uniacid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_groups`
--

CREATE TABLE IF NOT EXISTS `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_tag_mapping`
--

CREATE TABLE IF NOT EXISTS `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_groups`
--

CREATE TABLE IF NOT EXISTS `ims_mc_groups` (
  `groupid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_mc_groups`
--

INSERT INTO `ims_mc_groups` (`groupid`, `uniacid`, `title`, `credit`, `isdefault`) VALUES
(1, 1, '默认会员组', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_handsel`
--

CREATE TABLE IF NOT EXISTS `ims_mc_handsel` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) unsigned NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_fans`
--

CREATE TABLE IF NOT EXISTS `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(60) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_ucenter`
--

CREATE TABLE IF NOT EXISTS `ims_mc_mapping_ucenter` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `centeruid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mass_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_mass_record` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) unsigned NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `cron_id` int(10) unsigned NOT NULL,
  `sendtime` int(10) unsigned NOT NULL,
  `finalsendtime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_members`
--

CREATE TABLE IF NOT EXISTS `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `pay_password` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_address`
--

CREATE TABLE IF NOT EXISTS `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_fields`
--

CREATE TABLE IF NOT EXISTS `ims_mc_member_fields` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_property`
--

CREATE TABLE IF NOT EXISTS `ims_mc_member_property` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `property` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_oauth_fans`
--

CREATE TABLE IF NOT EXISTS `ims_mc_oauth_fans` (
  `id` int(10) unsigned NOT NULL,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_menu_event`
--

CREATE TABLE IF NOT EXISTS `ims_menu_event` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_message_notice_log`
--

CREATE TABLE IF NOT EXISTS `ims_message_notice_log` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_read` tinyint(3) NOT NULL,
  `uid` int(11) NOT NULL,
  `sign` varchar(22) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mobilenumber`
--

CREATE TABLE IF NOT EXISTS `ims_mobilenumber` (
  `id` int(11) NOT NULL,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `dateline` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules`
--

CREATE TABLE IF NOT EXISTS `ims_modules` (
  `mid` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `iscard` tinyint(3) unsigned NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `wxapp_support` tinyint(1) NOT NULL,
  `welcome_support` int(2) NOT NULL,
  `oauth_type` tinyint(1) NOT NULL,
  `webapp_support` tinyint(1) NOT NULL,
  `phoneapp_support` tinyint(1) NOT NULL,
  `account_support` tinyint(1) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `app_support` tinyint(1) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_modules`
--

INSERT INTO `ims_modules` (`mid`, `name`, `type`, `title`, `version`, `ability`, `description`, `author`, `url`, `settings`, `subscribes`, `handles`, `isrulefields`, `issystem`, `target`, `iscard`, `permissions`, `title_initial`, `wxapp_support`, `welcome_support`, `oauth_type`, `webapp_support`, `phoneapp_support`, `account_support`, `xzapp_support`, `app_support`, `aliapp_support`) VALUES
(1, 'basic', 'system', '基本文字回复', '1.0', '和您进行简单对话', '一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(2, 'news', 'system', '基本混合图文回复', '1.0', '为你提供生动的图文资讯', '一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(3, 'music', 'system', '基本音乐回复', '1.0', '提供语音、音乐等音频类回复', '在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(4, 'userapi', 'system', '自定义接口回复', '1.1', '更方便的第三方接口设置', '自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(5, 'recharge', 'system', '会员中心充值模块', '1.0', '提供会员充值功能', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(6, 'custom', 'system', '多客服转接', '1.0.0', '用来接入腾讯的多客服系统', '', 'WeEngine Team', 'http://bbs.we7.cc', 0, 'a:0:{}', 'a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(7, 'images', 'system', '基本图片回复', '1.0', '提供图片回复', '在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(8, 'video', 'system', '基本视频回复', '1.0', '提供图片回复', '在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(9, 'voice', 'system', '基本语音回复', '1.0', '提供语音回复', '在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(10, 'chats', 'system', '发送客服消息', '1.0', '公众号可以在粉丝最后发送消息的48小时内无限制发送消息', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(11, 'wxcard', 'system', '微信卡券回复', '1.0', '微信卡券回复', '微信卡券回复', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(12, 'store', 'business', '站内商城', '1.0', '站内商城', '站内商城', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, '', '', 1, 1, 1, 1, 0, 2, 0, 0, 0),
(13, 'hu_couda', 'other', '最新抽奖助手', '5.2.5', '抽奖助手卡券', '抽奖助手', '趣味淘QQ：3086811716', 'https://wx.hzweb.top', 0, 'a:0:{}', 'a:0:{}', 0, 0, 0, 0, 'a:0:{}', 'Z', 2, 1, 1, 1, 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_bindings`
--

CREATE TABLE IF NOT EXISTS `ims_modules_bindings` (
  `eid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `entry` varchar(30) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_modules_bindings`
--

INSERT INTO `ims_modules_bindings` (`eid`, `module`, `entry`, `call`, `title`, `do`, `state`, `direct`, `url`, `icon`, `displayorder`) VALUES
(1, 'hu_couda', 'menu', '', '首页推荐', 'recommend', '', 0, '', 'fa fa-puzzle-piece', 0),
(2, 'hu_couda', 'menu', '', '卡券管理', 'goods', '', 0, '', 'fa fa-puzzle-piece', 0),
(3, 'hu_couda', 'menu', '', '店铺管理', 'shop', '', 0, '', 'fa fa-puzzle-piece', 0),
(4, 'hu_couda', 'menu', '', '群发消息', 'tpl', '', 0, '', 'fa fa-puzzle-piece', 0),
(5, 'hu_couda', 'menu', '', '用户列表', 'member', '', 0, '', 'fa fa-puzzle-piece', 0),
(6, 'hu_couda', 'menu', '', '更多小程序', 'xcx', '', 0, '', 'fa fa-puzzle-piece', 0),
(7, 'hu_couda', 'menu', '', '常见问题', 'question', '', 0, '', 'fa fa-puzzle-piece', 0),
(8, 'hu_couda', 'menu', '', '添加奖品', 'add', '', 0, '', 'fa fa-puzzle-piece', 0),
(9, 'hu_couda', 'menu', '', '奖品管理', 'index', '', 0, '', 'fa fa-puzzle-piece', 0),
(10, 'hu_couda', 'menu', '', '基本设置', 'config', '', 0, '', 'fa fa-puzzle-piece', 0),
(11, 'hu_couda', 'menu', '', '开通多开', 'openMore', '', 0, '', 'fa fa-puzzle-piece', 0),
(12, 'hu_couda', 'menu', '', '抽奖管理', 'statistics1', '', 0, '', 'fa fa-puzzle-piece', 0),
(13, 'hu_couda', 'menu', '', '提现记录', 'mlog', '', 0, '', 'fa fa-puzzle-piece', 0),
(14, 'hu_couda', 'menu', '', '广告管理', 'ad_mng', '', 0, '', 'fa fa-puzzle-piece', 0),
(15, 'hu_couda', 'page', '', '首页', '/pages/index/index', '', 0, '', 'fa fa-puzzle-piece', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_cloud`
--

CREATE TABLE IF NOT EXISTS `ims_modules_cloud` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `install_status` tinyint(4) NOT NULL,
  `account_support` tinyint(4) NOT NULL,
  `wxapp_support` tinyint(4) NOT NULL,
  `webapp_support` tinyint(4) NOT NULL,
  `phoneapp_support` tinyint(4) NOT NULL,
  `welcome_support` tinyint(4) NOT NULL,
  `main_module_name` varchar(50) NOT NULL,
  `main_module_logo` varchar(100) NOT NULL,
  `has_new_version` tinyint(1) NOT NULL,
  `has_new_branch` tinyint(1) NOT NULL,
  `is_ban` tinyint(4) NOT NULL,
  `lastupdatetime` int(11) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `cloud_id` int(11) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_ignore`
--

CREATE TABLE IF NOT EXISTS `ims_modules_ignore` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_plugin`
--

CREATE TABLE IF NOT EXISTS `ims_modules_plugin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `main_module` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_rank`
--

CREATE TABLE IF NOT EXISTS `ims_modules_rank` (
  `id` int(10) unsigned NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `uid` int(10) NOT NULL,
  `rank` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_recycle`
--

CREATE TABLE IF NOT EXISTS `ims_modules_recycle` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `modulename` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_music_reply`
--

CREATE TABLE IF NOT EXISTS `ims_music_reply` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_news_reply`
--

CREATE TABLE IF NOT EXISTS `ims_news_reply` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `media_id` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_phoneapp_versions`
--

CREATE TABLE IF NOT EXISTS `ims_phoneapp_versions` (
  `id` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `version` varchar(20) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `modules` text,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_profile_fields`
--

CREATE TABLE IF NOT EXISTS `ims_profile_fields` (
  `id` int(10) unsigned NOT NULL,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_profile_fields`
--

INSERT INTO `ims_profile_fields` (`id`, `field`, `available`, `title`, `description`, `displayorder`, `required`, `unchangeable`, `showinregister`, `field_length`) VALUES
(1, 'realname', 1, '真实姓名', '', 0, 1, 1, 1, 0),
(2, 'nickname', 1, '昵称', '', 1, 1, 0, 1, 0),
(3, 'avatar', 1, '头像', '', 1, 0, 0, 0, 0),
(4, 'qq', 1, 'QQ号', '', 0, 0, 0, 1, 0),
(5, 'mobile', 1, '手机号码', '', 0, 0, 0, 0, 0),
(6, 'vip', 1, 'VIP级别', '', 0, 0, 0, 0, 0),
(7, 'gender', 1, '性别', '', 0, 0, 0, 0, 0),
(8, 'birthyear', 1, '出生生日', '', 0, 0, 0, 0, 0),
(9, 'constellation', 1, '星座', '', 0, 0, 0, 0, 0),
(10, 'zodiac', 1, '生肖', '', 0, 0, 0, 0, 0),
(11, 'telephone', 1, '固定电话', '', 0, 0, 0, 0, 0),
(12, 'idcard', 1, '证件号码', '', 0, 0, 0, 0, 0),
(13, 'studentid', 1, '学号', '', 0, 0, 0, 0, 0),
(14, 'grade', 1, '班级', '', 0, 0, 0, 0, 0),
(15, 'address', 1, '邮寄地址', '', 0, 0, 0, 0, 0),
(16, 'zipcode', 1, '邮编', '', 0, 0, 0, 0, 0),
(17, 'nationality', 1, '国籍', '', 0, 0, 0, 0, 0),
(18, 'resideprovince', 1, '居住地址', '', 0, 0, 0, 0, 0),
(19, 'graduateschool', 1, '毕业学校', '', 0, 0, 0, 0, 0),
(20, 'company', 1, '公司', '', 0, 0, 0, 0, 0),
(21, 'education', 1, '学历', '', 0, 0, 0, 0, 0),
(22, 'occupation', 1, '职业', '', 0, 0, 0, 0, 0),
(23, 'position', 1, '职位', '', 0, 0, 0, 0, 0),
(24, 'revenue', 1, '年收入', '', 0, 0, 0, 0, 0),
(25, 'affectivestatus', 1, '情感状态', '', 0, 0, 0, 0, 0),
(26, 'lookingfor', 1, ' 交友目的', '', 0, 0, 0, 0, 0),
(27, 'bloodtype', 1, '血型', '', 0, 0, 0, 0, 0),
(28, 'height', 1, '身高', '', 0, 0, 0, 0, 0),
(29, 'weight', 1, '体重', '', 0, 0, 0, 0, 0),
(30, 'alipay', 1, '支付宝帐号', '', 0, 0, 0, 0, 0),
(31, 'msn', 1, 'MSN', '', 0, 0, 0, 0, 0),
(32, 'email', 1, '电子邮箱', '', 0, 0, 0, 0, 0),
(33, 'taobao', 1, '阿里旺旺', '', 0, 0, 0, 0, 0),
(34, 'site', 1, '主页', '', 0, 0, 0, 0, 0),
(35, 'bio', 1, '自我介绍', '', 0, 0, 0, 0, 0),
(36, 'interest', 1, '兴趣爱好', '', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode`
--

CREATE TABLE IF NOT EXISTS `ims_qrcode` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) unsigned NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  `subnum` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode_stat`
--

CREATE TABLE IF NOT EXISTS `ims_qrcode_stat` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `qid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `qrcid` bigint(20) unsigned NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule`
--

CREATE TABLE IF NOT EXISTS `ims_rule` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `containtype` varchar(100) NOT NULL,
  `reply_type` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_rule`
--

INSERT INTO `ims_rule` (`id`, `uniacid`, `name`, `module`, `displayorder`, `status`, `containtype`, `reply_type`) VALUES
(1, 0, '城市天气', 'userapi', 255, 1, '', 0),
(2, 0, '百度百科', 'userapi', 255, 1, '', 0),
(3, 0, '即时翻译', 'userapi', 255, 1, '', 0),
(4, 0, '今日老黄历', 'userapi', 255, 1, '', 0),
(5, 0, '看新闻', 'userapi', 255, 1, '', 0),
(6, 0, '快递查询', 'userapi', 255, 1, '', 0),
(7, 1, '个人中心入口设置', 'cover', 0, 1, '', 0),
(8, 1, '微擎团队入口设置', 'cover', 0, 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule_keyword`
--

CREATE TABLE IF NOT EXISTS `ims_rule_keyword` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_rule_keyword`
--

INSERT INTO `ims_rule_keyword` (`id`, `rid`, `uniacid`, `module`, `content`, `type`, `displayorder`, `status`) VALUES
(1, 1, 0, 'userapi', '^.+天气$', 3, 255, 1),
(2, 2, 0, 'userapi', '^百科.+$', 3, 255, 1),
(3, 2, 0, 'userapi', '^定义.+$', 3, 255, 1),
(4, 3, 0, 'userapi', '^@.+$', 3, 255, 1),
(5, 4, 0, 'userapi', '日历', 1, 255, 1),
(6, 4, 0, 'userapi', '万年历', 1, 255, 1),
(7, 4, 0, 'userapi', '黄历', 1, 255, 1),
(8, 4, 0, 'userapi', '几号', 1, 255, 1),
(9, 5, 0, 'userapi', '新闻', 1, 255, 1),
(10, 6, 0, 'userapi', '^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$', 3, 255, 1),
(11, 7, 1, 'cover', '个人中心', 1, 0, 1),
(12, 8, 1, 'cover', '首页', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_article`
--

CREATE TABLE IF NOT EXISTS `ims_site_article` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL,
  `ccate` int(10) unsigned NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `edittime` int(10) NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_article_comment`
--

CREATE TABLE IF NOT EXISTS `ims_site_article_comment` (
  `id` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `articleid` int(10) NOT NULL,
  `parentid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `content` text,
  `is_read` tinyint(1) NOT NULL,
  `iscomment` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_category`
--

CREATE TABLE IF NOT EXISTS `ims_site_category` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `nid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) unsigned NOT NULL,
  `css` varchar(500) NOT NULL,
  `multiid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_multi`
--

CREATE TABLE IF NOT EXISTS `ims_site_multi` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `bindhost` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_site_multi`
--

INSERT INTO `ims_site_multi` (`id`, `uniacid`, `title`, `styleid`, `site_info`, `status`, `bindhost`) VALUES
(1, 1, '微擎团队', 1, '', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_nav`
--

CREATE TABLE IF NOT EXISTS `ims_site_nav` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `categoryid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_page`
--

CREATE TABLE IF NOT EXISTS `ims_site_page` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `multipage` longtext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodnum` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_slide`
--

CREATE TABLE IF NOT EXISTS `ims_site_slide` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_create_account`
--

CREATE TABLE IF NOT EXISTS `ims_site_store_create_account` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `endtime` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_goods`
--

CREATE TABLE IF NOT EXISTS `ims_site_store_goods` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `module` varchar(50) NOT NULL,
  `account_num` int(10) NOT NULL,
  `wxapp_num` int(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `slide` varchar(1000) NOT NULL,
  `category_id` int(10) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `synopsis` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `module_group` int(10) NOT NULL,
  `api_num` int(10) NOT NULL,
  `user_group` int(10) NOT NULL,
  `user_group_price` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_order`
--

CREATE TABLE IF NOT EXISTS `ims_site_store_order` (
  `id` int(10) unsigned NOT NULL,
  `orderid` varchar(28) NOT NULL,
  `goodsid` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `buyerid` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `changeprice` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `endtime` int(15) NOT NULL,
  `wxapp` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles`
--

CREATE TABLE IF NOT EXISTS `ims_site_styles` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_site_styles`
--

INSERT INTO `ims_site_styles` (`id`, `uniacid`, `templateid`, `name`) VALUES
(1, 1, 1, '微站默认模板_gC5C');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles_vars`
--

CREATE TABLE IF NOT EXISTS `ims_site_styles_vars` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_templates`
--

CREATE TABLE IF NOT EXISTS `ims_site_templates` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_site_templates`
--

INSERT INTO `ims_site_templates` (`id`, `name`, `title`, `version`, `description`, `author`, `url`, `type`, `sections`) VALUES
(1, 'default', '微站默认模板', '', '由微擎提供默认微站模板套系', '微擎团队', 'http://we7.cc', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_fans`
--

CREATE TABLE IF NOT EXISTS `ims_stat_fans` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `new` int(10) unsigned NOT NULL,
  `cancel` int(10) unsigned NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_stat_fans`
--

INSERT INTO `ims_stat_fans` (`id`, `uniacid`, `new`, `cancel`, `cumulate`, `date`) VALUES
(1, 1, 0, 0, 0, '20181127'),
(2, 1, 0, 0, 0, '20181126'),
(3, 1, 0, 0, 0, '20181125'),
(4, 1, 0, 0, 0, '20181124'),
(5, 1, 0, 0, 0, '20181123'),
(6, 1, 0, 0, 0, '20181122'),
(7, 1, 0, 0, 0, '20181121');

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_keyword`
--

CREATE TABLE IF NOT EXISTS `ims_stat_keyword` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_msg_history`
--

CREATE TABLE IF NOT EXISTS `ims_stat_msg_history` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_rule`
--

CREATE TABLE IF NOT EXISTS `ims_stat_rule` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_visit`
--

CREATE TABLE IF NOT EXISTS `ims_stat_visit` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) NOT NULL,
  `module` varchar(100) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_stat_visit`
--

INSERT INTO `ims_stat_visit` (`id`, `uniacid`, `module`, `count`, `date`, `type`) VALUES
(2, 0, '', 15, 20181128, 'web'),
(3, 1, 'we7_account', 11, 20181128, 'web'),
(4, 2, '', 13, 20181128, 'web'),
(5, 2, 'we7_account', 6, 20181128, 'web'),
(6, 2, '', 7, 20181129, 'web'),
(7, 2, 'we7_account', 2, 20181129, 'web');

-- --------------------------------------------------------

--
-- 表的结构 `ims_system_stat_visit`
--

CREATE TABLE IF NOT EXISTS `ims_system_stat_visit` (
  `id` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `modulename` varchar(100) NOT NULL,
  `uid` int(10) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `updatetime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account` (
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) unsigned NOT NULL,
  `rank` int(10) DEFAULT NULL,
  `title_initial` varchar(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_account`
--

INSERT INTO `ims_uni_account` (`uniacid`, `groupid`, `name`, `description`, `default_acid`, `rank`, `title_initial`) VALUES
(1, -1, '微擎团队', '一个朝气蓬勃的团队', 1, NULL, 'W'),
(2, 0, '抽奖', '111', 2, NULL, 'C');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_group`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_group` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_menus`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_menus` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `menuid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) unsigned NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_modules`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_modules` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `settings` text NOT NULL,
  `shortcut` tinyint(1) unsigned NOT NULL,
  `displayorder` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_users`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_users` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_group`
--

CREATE TABLE IF NOT EXISTS `ims_uni_group` (
  `id` int(10) unsigned NOT NULL,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `modules` text NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_group`
--

INSERT INTO `ims_uni_group` (`id`, `owner_uid`, `name`, `modules`, `templates`, `uniacid`, `uid`) VALUES
(1, 0, '体验套餐服务', 'a:5:{s:7:"modules";a:1:{i:0;s:8:"hu_couda";}s:5:"wxapp";a:1:{i:0;s:8:"hu_couda";}s:6:"webapp";a:1:{i:0;s:8:"hu_couda";}s:5:"xzapp";a:1:{i:0;s:8:"hu_couda";}s:8:"phoneapp";a:1:{i:0;s:8:"hu_couda";}}', 'N;', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_settings`
--

CREATE TABLE IF NOT EXISTS `ims_uni_settings` (
  `uniacid` int(10) unsigned NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) unsigned NOT NULL,
  `uc` varchar(500) NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `payment` text NOT NULL,
  `stat` varchar(300) NOT NULL,
  `default_site` int(10) unsigned DEFAULT NULL,
  `sync` tinyint(3) unsigned NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(1000) NOT NULL,
  `grouplevel` tinyint(3) unsigned NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) unsigned NOT NULL,
  `coupon_type` tinyint(3) unsigned NOT NULL,
  `menuset` text NOT NULL,
  `statistics` varchar(100) NOT NULL,
  `bind_domain` varchar(200) NOT NULL,
  `comment_status` tinyint(1) NOT NULL,
  `reply_setting` tinyint(4) NOT NULL,
  `default_module` varchar(100) NOT NULL,
  `attachment_limit` int(11) DEFAULT NULL,
  `attachment_size` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_settings`
--

INSERT INTO `ims_uni_settings` (`uniacid`, `passport`, `oauth`, `jsauth_acid`, `uc`, `notify`, `creditnames`, `creditbehaviors`, `welcome`, `default`, `default_message`, `payment`, `stat`, `default_site`, `sync`, `recharge`, `tplnotice`, `grouplevel`, `mcplugin`, `exchange_enable`, `coupon_type`, `menuset`, `statistics`, `bind_domain`, `comment_status`, `reply_setting`, `default_module`, `attachment_limit`, `attachment_size`) VALUES
(1, 'a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}', 'a:2:{s:6:"status";s:1:"0";s:7:"account";s:1:"0";}', 0, 'a:1:{s:6:"status";i:0;}', 'a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}', 'a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', 'a:4:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";}s:6:"wechat";a:5:{s:6:"switch";b:0;s:7:"account";b:0;s:7:"signkey";s:0:"";s:7:"partner";s:0:"";s:3:"key";s:0:"";}s:8:"delivery";a:1:{s:6:"switch";b:0;}}', '', 1, 0, '', '', 0, '', 0, 0, '', '', '', 0, 0, '', NULL, NULL),
(2, '', '', 0, '', '', '', '', '', '', '', '', '', NULL, 0, '', '', 0, '', 0, 0, '', '', '', 0, 0, '', NULL, '127');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_verifycode`
--

CREATE TABLE IF NOT EXISTS `ims_uni_verifycode` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_cache`
--

CREATE TABLE IF NOT EXISTS `ims_userapi_cache` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_reply`
--

CREATE TABLE IF NOT EXISTS `ims_userapi_reply` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_userapi_reply`
--

INSERT INTO `ims_userapi_reply` (`id`, `rid`, `description`, `apiurl`, `token`, `default_text`, `cachetime`) VALUES
(1, 1, '"城市名+天气", 如: "北京天气"', 'weather.php', '', '', 0),
(2, 2, '"百科+查询内容" 或 "定义+查询内容", 如: "百科姚明", "定义自行车"', 'baike.php', '', '', 0),
(3, 3, '"@查询内容(中文或英文)"', 'translate.php', '', '', 0),
(4, 4, '"日历", "万年历", "黄历"或"几号"', 'calendar.php', '', '', 0),
(5, 5, '"新闻"', 'news.php', '', '', 0),
(6, 6, '"快递+单号", 如: "申通1200041125"', 'express.php', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users`
--

CREATE TABLE IF NOT EXISTS `ims_users` (
  `uid` int(10) unsigned NOT NULL,
  `owner_uid` int(10) NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `founder_groupid` tinyint(4) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) unsigned NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `register_type` tinyint(3) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `welcome_link` tinyint(4) NOT NULL,
  `is_bind` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users`
--

INSERT INTO `ims_users` (`uid`, `owner_uid`, `groupid`, `founder_groupid`, `username`, `password`, `salt`, `type`, `status`, `joindate`, `joinip`, `lastvisit`, `lastip`, `remark`, `starttime`, `endtime`, `register_type`, `openid`, `welcome_link`, `is_bind`) VALUES
(1, 0, 1, 0, 'admin', 'a5b9afe5316447e10291f635f66f7b100c12bb7b', 'dda67457', 0, 0, 1543397442, '', 1543459521, '115.192.33.37', '', 0, 0, 0, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_bind`
--

CREATE TABLE IF NOT EXISTS `ims_users_bind` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `bind_sign` varchar(50) NOT NULL,
  `third_type` tinyint(4) NOT NULL,
  `third_nickname` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_failed_login`
--

CREATE TABLE IF NOT EXISTS `ims_users_failed_login` (
  `id` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_group`
--

CREATE TABLE IF NOT EXISTS `ims_users_founder_group` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `maxsubaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  `maxwxapp` int(10) unsigned NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_group`
--

CREATE TABLE IF NOT EXISTS `ims_users_group` (
  `id` int(10) unsigned NOT NULL,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `maxsubaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  `maxwxapp` int(10) unsigned NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_invitation`
--

CREATE TABLE IF NOT EXISTS `ims_users_invitation` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) unsigned NOT NULL,
  `inviteuid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_permission`
--

CREATE TABLE IF NOT EXISTS `ims_users_permission` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(100) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_profile`
--

CREATE TABLE IF NOT EXISTS `ims_users_profile` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `edittime` int(10) NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  `is_send_mobile_status` tinyint(3) NOT NULL,
  `send_expire_status` tinyint(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_video_reply`
--

CREATE TABLE IF NOT EXISTS `ims_video_reply` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_voice_reply`
--

CREATE TABLE IF NOT EXISTS `ims_voice_reply` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_attachment`
--

CREATE TABLE IF NOT EXISTS `ims_wechat_attachment` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `module_upload_dir` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_news`
--

CREATE TABLE IF NOT EXISTS `ims_wechat_news` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) unsigned NOT NULL,
  `url` varchar(200) NOT NULL,
  `displayorder` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxapp_general_analysis`
--

CREATE TABLE IF NOT EXISTS `ims_wxapp_general_analysis` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) NOT NULL,
  `session_cnt` int(10) NOT NULL,
  `visit_pv` int(10) NOT NULL,
  `visit_uv` int(10) NOT NULL,
  `visit_uv_new` int(10) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `stay_time_uv` varchar(10) NOT NULL,
  `stay_time_session` varchar(10) NOT NULL,
  `visit_depth` varchar(10) NOT NULL,
  `ref_date` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxapp_versions`
--

CREATE TABLE IF NOT EXISTS `ims_wxapp_versions` (
  `id` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `version` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `modules` varchar(1000) NOT NULL,
  `design_method` tinyint(1) NOT NULL,
  `template` int(10) NOT NULL,
  `quickmenu` varchar(2500) NOT NULL,
  `createtime` int(10) NOT NULL,
  `type` int(2) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `appjson` text NOT NULL,
  `default_appjson` text NOT NULL,
  `use_default` tinyint(1) NOT NULL,
  `redirect` varchar(300) NOT NULL,
  `connection` varchar(1000) NOT NULL,
  `last_modules` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_wxapp_versions`
--

INSERT INTO `ims_wxapp_versions` (`id`, `uniacid`, `multiid`, `version`, `description`, `modules`, `design_method`, `template`, `quickmenu`, `createtime`, `type`, `entry_id`, `appjson`, `default_appjson`, `use_default`, `redirect`, `connection`, `last_modules`) VALUES
(1, 2, 0, '1.01', '111', 'a:1:{s:8:"hu_couda";a:4:{s:4:"name";s:8:"hu_couda";s:7:"newicon";N;s:7:"version";s:5:"5.2.5";s:12:"defaultentry";N;}}', 3, 0, 'a:6:{s:5:"color";s:7:"#428bca";s:14:"selected_color";s:4:"#0f0";s:8:"boundary";s:4:"#fff";s:7:"bgcolor";s:7:"#bebebe";s:4:"show";i:1;s:5:"menus";a:2:{i:0;a:5:{s:4:"name";s:6:"首页";s:4:"icon";s:36:"./resource/images/bottom-default.png";s:12:"selectedicon";s:36:"./resource/images/bottom-default.png";s:3:"url";N;s:12:"defaultentry";N;}i:1;a:5:{s:4:"name";s:6:"首页";s:4:"icon";s:36:"./resource/images/bottom-default.png";s:12:"selectedicon";s:36:"./resource/images/bottom-default.png";s:3:"url";N;s:12:"defaultentry";N;}}}', 1543398385, 0, 0, '', '', 0, '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxcard_reply`
--

CREATE TABLE IF NOT EXISTS `ims_wxcard_reply` (
  `id` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ims_account`
--
ALTER TABLE `ims_account`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `idx_uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_aliapp`
--
ALTER TABLE `ims_account_aliapp`
  ADD PRIMARY KEY (`acid`);

--
-- Indexes for table `ims_account_phoneapp`
--
ALTER TABLE `ims_account_phoneapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_webapp`
--
ALTER TABLE `ims_account_webapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_wechats`
--
ALTER TABLE `ims_account_wechats`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `idx_key` (`key`);

--
-- Indexes for table `ims_account_wxapp`
--
ALTER TABLE `ims_account_wxapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_xzapp`
--
ALTER TABLE `ims_account_xzapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_article_category`
--
ALTER TABLE `ims_article_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ims_article_comment`
--
ALTER TABLE `ims_article_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articleid` (`articleid`) USING BTREE;

--
-- Indexes for table `ims_article_news`
--
ALTER TABLE `ims_article_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `cateid` (`cateid`);

--
-- Indexes for table `ims_article_notice`
--
ALTER TABLE `ims_article_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `cateid` (`cateid`);

--
-- Indexes for table `ims_article_unread_notice`
--
ALTER TABLE `ims_article_unread_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `notice_id` (`notice_id`);

--
-- Indexes for table `ims_attachment_group`
--
ALTER TABLE `ims_attachment_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_basic_reply`
--
ALTER TABLE `ims_basic_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_business`
--
ALTER TABLE `ims_business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lat_lng` (`lng`,`lat`);

--
-- Indexes for table `ims_cj_ad`
--
ALTER TABLE `ims_cj_ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_address`
--
ALTER TABLE `ims_cj_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `member_id` (`member_id`,`addtime`);

--
-- Indexes for table `ims_cj_appoint`
--
ALTER TABLE `ims_cj_appoint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_common_problem`
--
ALTER TABLE `ims_cj_common_problem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_config`
--
ALTER TABLE `ims_cj_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`) USING BTREE;

--
-- Indexes for table `ims_cj_form_id`
--
ALTER TABLE `ims_cj_form_id`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`) USING BTREE;

--
-- Indexes for table `ims_cj_goods`
--
ALTER TABLE `ims_cj_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`) USING BTREE;

--
-- Indexes for table `ims_cj_group_join`
--
ALTER TABLE `ims_cj_group_join`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`) USING BTREE,
  ADD KEY `prize_id` (`prize_id`) USING BTREE;

--
-- Indexes for table `ims_cj_home_recommend`
--
ALTER TABLE `ims_cj_home_recommend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_jump_program`
--
ALTER TABLE `ims_cj_jump_program`
  ADD PRIMARY KEY (`jump_id`),
  ADD KEY `prize_id` (`prize_id`);

--
-- Indexes for table `ims_cj_member`
--
ALTER TABLE `ims_cj_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_member_voucher`
--
ALTER TABLE `ims_cj_member_voucher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`) USING BTREE;

--
-- Indexes for table `ims_cj_money_log`
--
ALTER TABLE `ims_cj_money_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`) USING BTREE;

--
-- Indexes for table `ims_cj_order`
--
ALTER TABLE `ims_cj_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `redpackage_id` (`prize_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `addtime` (`addtime`);

--
-- Indexes for table `ims_cj_pay_order`
--
ALTER TABLE `ims_cj_pay_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_pre_prize`
--
ALTER TABLE `ims_cj_pre_prize`
  ADD PRIMARY KEY (`prize_id`),
  ADD KEY `fir_ptype` (`fir_ptype`),
  ADD KEY `sec_ptype` (`sec_ptype`),
  ADD KEY `trd_ptype` (`trd_ptype`);

--
-- Indexes for table `ims_cj_prize`
--
ALTER TABLE `ims_cj_prize`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_prize_code`
--
ALTER TABLE `ims_cj_prize_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prize_id` (`prize_id`) USING BTREE;

--
-- Indexes for table `ims_cj_prize_result`
--
ALTER TABLE `ims_cj_prize_result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `prize_id` (`prize_id`,`member_id`,`addtime`);

--
-- Indexes for table `ims_cj_program`
--
ALTER TABLE `ims_cj_program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_red_bag`
--
ALTER TABLE `ims_cj_red_bag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prize_id` (`prize_id`) USING BTREE;

--
-- Indexes for table `ims_cj_resource`
--
ALTER TABLE `ims_cj_resource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_shop`
--
ALTER TABLE `ims_cj_shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_template_message`
--
ALTER TABLE `ims_cj_template_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_token`
--
ALTER TABLE `ims_cj_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_voucher`
--
ALTER TABLE `ims_cj_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_cj_withdrawals`
--
ALTER TABLE `ims_cj_withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_attachment`
--
ALTER TABLE `ims_core_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_cache`
--
ALTER TABLE `ims_core_cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `ims_core_cron`
--
ALTER TABLE `ims_core_cron`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createtime` (`createtime`),
  ADD KEY `nextruntime` (`nextruntime`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `cloudid` (`cloudid`);

--
-- Indexes for table `ims_core_cron_record`
--
ALTER TABLE `ims_core_cron_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `module` (`module`);

--
-- Indexes for table `ims_core_job`
--
ALTER TABLE `ims_core_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_menu`
--
ALTER TABLE `ims_core_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_paylog`
--
ALTER TABLE `ims_core_paylog`
  ADD PRIMARY KEY (`plid`),
  ADD KEY `idx_openid` (`openid`),
  ADD KEY `idx_tid` (`tid`),
  ADD KEY `idx_uniacid` (`uniacid`),
  ADD KEY `uniontid` (`uniontid`);

--
-- Indexes for table `ims_core_performance`
--
ALTER TABLE `ims_core_performance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_queue`
--
ALTER TABLE `ims_core_queue`
  ADD PRIMARY KEY (`qid`),
  ADD KEY `uniacid` (`uniacid`,`acid`),
  ADD KEY `module` (`module`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `ims_core_refundlog`
--
ALTER TABLE `ims_core_refundlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_uniontid` (`refund_uniontid`),
  ADD KEY `uniontid` (`uniontid`);

--
-- Indexes for table `ims_core_resource`
--
ALTER TABLE `ims_core_resource`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `acid` (`uniacid`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ims_core_sendsms_log`
--
ALTER TABLE `ims_core_sendsms_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_sessions`
--
ALTER TABLE `ims_core_sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `ims_core_settings`
--
ALTER TABLE `ims_core_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `ims_coupon_location`
--
ALTER TABLE `ims_coupon_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`acid`);

--
-- Indexes for table `ims_cover_reply`
--
ALTER TABLE `ims_cover_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_custom_reply`
--
ALTER TABLE `ims_custom_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_images_reply`
--
ALTER TABLE `ims_images_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_job`
--
ALTER TABLE `ims_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_mc_cash_record`
--
ALTER TABLE `ims_mc_cash_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_mc_chats_record`
--
ALTER TABLE `ims_mc_chats_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`acid`),
  ADD KEY `openid` (`openid`),
  ADD KEY `createtime` (`createtime`);

--
-- Indexes for table `ims_mc_credits_recharge`
--
ALTER TABLE `ims_mc_credits_recharge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  ADD KEY `idx_tid` (`tid`);

--
-- Indexes for table `ims_mc_credits_record`
--
ALTER TABLE `ims_mc_credits_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_mc_fans_groups`
--
ALTER TABLE `ims_mc_fans_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_fans_tag_mapping`
--
ALTER TABLE `ims_mc_fans_tag_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mapping` (`fanid`,`tagid`),
  ADD KEY `fanid_index` (`fanid`),
  ADD KEY `tagid_index` (`tagid`);

--
-- Indexes for table `ims_mc_groups`
--
ALTER TABLE `ims_mc_groups`
  ADD PRIMARY KEY (`groupid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_handsel`
--
ALTER TABLE `ims_mc_handsel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`touid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_mapping_fans`
--
ALTER TABLE `ims_mc_mapping_fans`
  ADD PRIMARY KEY (`fanid`),
  ADD UNIQUE KEY `openid_2` (`openid`),
  ADD KEY `acid` (`acid`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `nickname` (`nickname`),
  ADD KEY `updatetime` (`updatetime`),
  ADD KEY `uid` (`uid`),
  ADD KEY `openid` (`openid`);

--
-- Indexes for table `ims_mc_mapping_ucenter`
--
ALTER TABLE `ims_mc_mapping_ucenter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_mc_mass_record`
--
ALTER TABLE `ims_mc_mass_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`acid`);

--
-- Indexes for table `ims_mc_members`
--
ALTER TABLE `ims_mc_members`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `groupid` (`groupid`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `email` (`email`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `ims_mc_member_address`
--
ALTER TABLE `ims_mc_member_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uinacid` (`uniacid`),
  ADD KEY `idx_uid` (`uid`);

--
-- Indexes for table `ims_mc_member_fields`
--
ALTER TABLE `ims_mc_member_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uniacid` (`uniacid`),
  ADD KEY `idx_fieldid` (`fieldid`);

--
-- Indexes for table `ims_mc_member_property`
--
ALTER TABLE `ims_mc_member_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_mc_oauth_fans`
--
ALTER TABLE `ims_mc_oauth_fans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`);

--
-- Indexes for table `ims_menu_event`
--
ALTER TABLE `ims_menu_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `picmd5` (`picmd5`);

--
-- Indexes for table `ims_message_notice_log`
--
ALTER TABLE `ims_message_notice_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_mobilenumber`
--
ALTER TABLE `ims_mobilenumber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_modules`
--
ALTER TABLE `ims_modules`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `ims_modules_bindings`
--
ALTER TABLE `ims_modules_bindings`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `idx_module` (`module`);

--
-- Indexes for table `ims_modules_cloud`
--
ALTER TABLE `ims_modules_cloud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `lastupdatetime` (`lastupdatetime`);

--
-- Indexes for table `ims_modules_ignore`
--
ALTER TABLE `ims_modules_ignore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ims_modules_plugin`
--
ALTER TABLE `ims_modules_plugin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `main_module` (`main_module`);

--
-- Indexes for table `ims_modules_rank`
--
ALTER TABLE `ims_modules_rank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_modules_recycle`
--
ALTER TABLE `ims_modules_recycle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `modulename` (`modulename`) USING BTREE;

--
-- Indexes for table `ims_music_reply`
--
ALTER TABLE `ims_music_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_news_reply`
--
ALTER TABLE `ims_news_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_phoneapp_versions`
--
ALTER TABLE `ims_phoneapp_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `version` (`version`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_profile_fields`
--
ALTER TABLE `ims_profile_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_qrcode`
--
ALTER TABLE `ims_qrcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qrcid` (`qrcid`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `ticket` (`ticket`);

--
-- Indexes for table `ims_qrcode_stat`
--
ALTER TABLE `ims_qrcode_stat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_rule`
--
ALTER TABLE `ims_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_rule_keyword`
--
ALTER TABLE `ims_rule_keyword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_content` (`content`),
  ADD KEY `rid` (`rid`),
  ADD KEY `idx_rid` (`rid`),
  ADD KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`);

--
-- Indexes for table `ims_site_article`
--
ALTER TABLE `ims_site_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_iscommend` (`iscommend`),
  ADD KEY `idx_ishot` (`ishot`);

--
-- Indexes for table `ims_site_article_comment`
--
ALTER TABLE `ims_site_article_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `articleid` (`articleid`);

--
-- Indexes for table `ims_site_category`
--
ALTER TABLE `ims_site_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_site_multi`
--
ALTER TABLE `ims_site_multi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `bindhost` (`bindhost`);

--
-- Indexes for table `ims_site_nav`
--
ALTER TABLE `ims_site_nav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `multiid` (`multiid`);

--
-- Indexes for table `ims_site_page`
--
ALTER TABLE `ims_site_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `multiid` (`multiid`);

--
-- Indexes for table `ims_site_slide`
--
ALTER TABLE `ims_site_slide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `multiid` (`multiid`);

--
-- Indexes for table `ims_site_store_create_account`
--
ALTER TABLE `ims_site_store_create_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_site_store_goods`
--
ALTER TABLE `ims_site_store_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `price` (`price`);

--
-- Indexes for table `ims_site_store_order`
--
ALTER TABLE `ims_site_store_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goodid` (`goodsid`),
  ADD KEY `buyerid` (`buyerid`);

--
-- Indexes for table `ims_site_styles`
--
ALTER TABLE `ims_site_styles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_site_styles_vars`
--
ALTER TABLE `ims_site_styles_vars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_site_templates`
--
ALTER TABLE `ims_site_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_stat_fans`
--
ALTER TABLE `ims_stat_fans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`date`);

--
-- Indexes for table `ims_stat_keyword`
--
ALTER TABLE `ims_stat_keyword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_createtime` (`createtime`);

--
-- Indexes for table `ims_stat_msg_history`
--
ALTER TABLE `ims_stat_msg_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_createtime` (`createtime`);

--
-- Indexes for table `ims_stat_rule`
--
ALTER TABLE `ims_stat_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_createtime` (`createtime`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_stat_visit`
--
ALTER TABLE `ims_stat_visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `module` (`module`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_system_stat_visit`
--
ALTER TABLE `ims_system_stat_visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_uni_account`
--
ALTER TABLE `ims_uni_account`
  ADD PRIMARY KEY (`uniacid`);

--
-- Indexes for table `ims_uni_account_group`
--
ALTER TABLE `ims_uni_account_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_uni_account_menus`
--
ALTER TABLE `ims_uni_account_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `menuid` (`menuid`);

--
-- Indexes for table `ims_uni_account_modules`
--
ALTER TABLE `ims_uni_account_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_module` (`module`),
  ADD KEY `idx_uniacid` (`uniacid`);

--
-- Indexes for table `ims_uni_account_users`
--
ALTER TABLE `ims_uni_account_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_memberid` (`uid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_uni_group`
--
ALTER TABLE `ims_uni_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_uni_settings`
--
ALTER TABLE `ims_uni_settings`
  ADD PRIMARY KEY (`uniacid`);

--
-- Indexes for table `ims_uni_verifycode`
--
ALTER TABLE `ims_uni_verifycode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_userapi_cache`
--
ALTER TABLE `ims_userapi_cache`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_userapi_reply`
--
ALTER TABLE `ims_userapi_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_users`
--
ALTER TABLE `ims_users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `ims_users_bind`
--
ALTER TABLE `ims_users_bind`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `bind_sign` (`bind_sign`);

--
-- Indexes for table `ims_users_failed_login`
--
ALTER TABLE `ims_users_failed_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_username` (`ip`,`username`);

--
-- Indexes for table `ims_users_founder_group`
--
ALTER TABLE `ims_users_founder_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_users_group`
--
ALTER TABLE `ims_users_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_users_invitation`
--
ALTER TABLE `ims_users_invitation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_code` (`code`);

--
-- Indexes for table `ims_users_permission`
--
ALTER TABLE `ims_users_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_users_profile`
--
ALTER TABLE `ims_users_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_video_reply`
--
ALTER TABLE `ims_video_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_voice_reply`
--
ALTER TABLE `ims_voice_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_wechat_attachment`
--
ALTER TABLE `ims_wechat_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `media_id` (`media_id`),
  ADD KEY `acid` (`acid`);

--
-- Indexes for table `ims_wechat_news`
--
ALTER TABLE `ims_wechat_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `attach_id` (`attach_id`);

--
-- Indexes for table `ims_wxapp_general_analysis`
--
ALTER TABLE `ims_wxapp_general_analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `ref_date` (`ref_date`);

--
-- Indexes for table `ims_wxapp_versions`
--
ALTER TABLE `ims_wxapp_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `version` (`version`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_wxcard_reply`
--
ALTER TABLE `ims_wxcard_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ims_account`
--
ALTER TABLE `ims_account`
  MODIFY `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ims_account_wxapp`
--
ALTER TABLE `ims_account_wxapp`
  MODIFY `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ims_article_category`
--
ALTER TABLE `ims_article_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_article_comment`
--
ALTER TABLE `ims_article_comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_article_news`
--
ALTER TABLE `ims_article_news`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_article_notice`
--
ALTER TABLE `ims_article_notice`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_article_unread_notice`
--
ALTER TABLE `ims_article_unread_notice`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_attachment_group`
--
ALTER TABLE `ims_attachment_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_basic_reply`
--
ALTER TABLE `ims_basic_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_business`
--
ALTER TABLE `ims_business`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_ad`
--
ALTER TABLE `ims_cj_ad`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_address`
--
ALTER TABLE `ims_cj_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_appoint`
--
ALTER TABLE `ims_cj_appoint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_common_problem`
--
ALTER TABLE `ims_cj_common_problem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ims_cj_config`
--
ALTER TABLE `ims_cj_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `ims_cj_form_id`
--
ALTER TABLE `ims_cj_form_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_goods`
--
ALTER TABLE `ims_cj_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_group_join`
--
ALTER TABLE `ims_cj_group_join`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_home_recommend`
--
ALTER TABLE `ims_cj_home_recommend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_jump_program`
--
ALTER TABLE `ims_cj_jump_program`
  MODIFY `jump_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_member`
--
ALTER TABLE `ims_cj_member`
  MODIFY `id` int(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ims_cj_member_voucher`
--
ALTER TABLE `ims_cj_member_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_money_log`
--
ALTER TABLE `ims_cj_money_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_order`
--
ALTER TABLE `ims_cj_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_pay_order`
--
ALTER TABLE `ims_cj_pay_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_pre_prize`
--
ALTER TABLE `ims_cj_pre_prize`
  MODIFY `prize_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_cj_prize`
--
ALTER TABLE `ims_cj_prize`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_prize_code`
--
ALTER TABLE `ims_cj_prize_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_prize_result`
--
ALTER TABLE `ims_cj_prize_result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_program`
--
ALTER TABLE `ims_cj_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ims_cj_red_bag`
--
ALTER TABLE `ims_cj_red_bag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_resource`
--
ALTER TABLE `ims_cj_resource`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_cj_shop`
--
ALTER TABLE `ims_cj_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_template_message`
--
ALTER TABLE `ims_cj_template_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_token`
--
ALTER TABLE `ims_cj_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ims_cj_voucher`
--
ALTER TABLE `ims_cj_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cj_withdrawals`
--
ALTER TABLE `ims_cj_withdrawals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_attachment`
--
ALTER TABLE `ims_core_attachment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_core_cron`
--
ALTER TABLE `ims_core_cron`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_cron_record`
--
ALTER TABLE `ims_core_cron_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_job`
--
ALTER TABLE `ims_core_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_menu`
--
ALTER TABLE `ims_core_menu`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_paylog`
--
ALTER TABLE `ims_core_paylog`
  MODIFY `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_performance`
--
ALTER TABLE `ims_core_performance`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_queue`
--
ALTER TABLE `ims_core_queue`
  MODIFY `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_refundlog`
--
ALTER TABLE `ims_core_refundlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_resource`
--
ALTER TABLE `ims_core_resource`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_core_sendsms_log`
--
ALTER TABLE `ims_core_sendsms_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_coupon_location`
--
ALTER TABLE `ims_coupon_location`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_cover_reply`
--
ALTER TABLE `ims_cover_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ims_custom_reply`
--
ALTER TABLE `ims_custom_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_images_reply`
--
ALTER TABLE `ims_images_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_job`
--
ALTER TABLE `ims_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_cash_record`
--
ALTER TABLE `ims_mc_cash_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_chats_record`
--
ALTER TABLE `ims_mc_chats_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_credits_recharge`
--
ALTER TABLE `ims_mc_credits_recharge`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_credits_record`
--
ALTER TABLE `ims_mc_credits_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_fans_groups`
--
ALTER TABLE `ims_mc_fans_groups`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_fans_tag_mapping`
--
ALTER TABLE `ims_mc_fans_tag_mapping`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_groups`
--
ALTER TABLE `ims_mc_groups`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_mc_handsel`
--
ALTER TABLE `ims_mc_handsel`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_mapping_fans`
--
ALTER TABLE `ims_mc_mapping_fans`
  MODIFY `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_mapping_ucenter`
--
ALTER TABLE `ims_mc_mapping_ucenter`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_mass_record`
--
ALTER TABLE `ims_mc_mass_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_members`
--
ALTER TABLE `ims_mc_members`
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_member_address`
--
ALTER TABLE `ims_mc_member_address`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_member_fields`
--
ALTER TABLE `ims_mc_member_fields`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_member_property`
--
ALTER TABLE `ims_mc_member_property`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mc_oauth_fans`
--
ALTER TABLE `ims_mc_oauth_fans`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_menu_event`
--
ALTER TABLE `ims_menu_event`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_message_notice_log`
--
ALTER TABLE `ims_message_notice_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_mobilenumber`
--
ALTER TABLE `ims_mobilenumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_modules`
--
ALTER TABLE `ims_modules`
  MODIFY `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `ims_modules_bindings`
--
ALTER TABLE `ims_modules_bindings`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ims_modules_cloud`
--
ALTER TABLE `ims_modules_cloud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_modules_ignore`
--
ALTER TABLE `ims_modules_ignore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_modules_plugin`
--
ALTER TABLE `ims_modules_plugin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_modules_rank`
--
ALTER TABLE `ims_modules_rank`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_modules_recycle`
--
ALTER TABLE `ims_modules_recycle`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_music_reply`
--
ALTER TABLE `ims_music_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_news_reply`
--
ALTER TABLE `ims_news_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_phoneapp_versions`
--
ALTER TABLE `ims_phoneapp_versions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_profile_fields`
--
ALTER TABLE `ims_profile_fields`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `ims_qrcode`
--
ALTER TABLE `ims_qrcode`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_qrcode_stat`
--
ALTER TABLE `ims_qrcode_stat`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_rule`
--
ALTER TABLE `ims_rule`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ims_rule_keyword`
--
ALTER TABLE `ims_rule_keyword`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ims_site_article`
--
ALTER TABLE `ims_site_article`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_article_comment`
--
ALTER TABLE `ims_site_article_comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_category`
--
ALTER TABLE `ims_site_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_multi`
--
ALTER TABLE `ims_site_multi`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_site_nav`
--
ALTER TABLE `ims_site_nav`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_page`
--
ALTER TABLE `ims_site_page`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_slide`
--
ALTER TABLE `ims_site_slide`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_store_create_account`
--
ALTER TABLE `ims_site_store_create_account`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_store_goods`
--
ALTER TABLE `ims_site_store_goods`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_store_order`
--
ALTER TABLE `ims_site_store_order`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_styles`
--
ALTER TABLE `ims_site_styles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_site_styles_vars`
--
ALTER TABLE `ims_site_styles_vars`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_site_templates`
--
ALTER TABLE `ims_site_templates`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_stat_fans`
--
ALTER TABLE `ims_stat_fans`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ims_stat_keyword`
--
ALTER TABLE `ims_stat_keyword`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_stat_msg_history`
--
ALTER TABLE `ims_stat_msg_history`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_stat_rule`
--
ALTER TABLE `ims_stat_rule`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_stat_visit`
--
ALTER TABLE `ims_stat_visit`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ims_system_stat_visit`
--
ALTER TABLE `ims_system_stat_visit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_uni_account`
--
ALTER TABLE `ims_uni_account`
  MODIFY `uniacid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ims_uni_account_group`
--
ALTER TABLE `ims_uni_account_group`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_uni_account_menus`
--
ALTER TABLE `ims_uni_account_menus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_uni_account_modules`
--
ALTER TABLE `ims_uni_account_modules`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_uni_account_users`
--
ALTER TABLE `ims_uni_account_users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_uni_group`
--
ALTER TABLE `ims_uni_group`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_uni_verifycode`
--
ALTER TABLE `ims_uni_verifycode`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_userapi_cache`
--
ALTER TABLE `ims_userapi_cache`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_userapi_reply`
--
ALTER TABLE `ims_userapi_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ims_users`
--
ALTER TABLE `ims_users`
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_users_bind`
--
ALTER TABLE `ims_users_bind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_users_failed_login`
--
ALTER TABLE `ims_users_failed_login`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_users_founder_group`
--
ALTER TABLE `ims_users_founder_group`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_users_group`
--
ALTER TABLE `ims_users_group`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_users_invitation`
--
ALTER TABLE `ims_users_invitation`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_users_permission`
--
ALTER TABLE `ims_users_permission`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_users_profile`
--
ALTER TABLE `ims_users_profile`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_video_reply`
--
ALTER TABLE `ims_video_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_voice_reply`
--
ALTER TABLE `ims_voice_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_wechat_attachment`
--
ALTER TABLE `ims_wechat_attachment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_wechat_news`
--
ALTER TABLE `ims_wechat_news`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_wxapp_general_analysis`
--
ALTER TABLE `ims_wxapp_general_analysis`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ims_wxapp_versions`
--
ALTER TABLE `ims_wxapp_versions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ims_wxcard_reply`
--
ALTER TABLE `ims_wxcard_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
