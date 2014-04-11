-- phpMyAdmin SQL Dump
-- version 4.1.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-01-25 17:39:07
-- 服务器版本： 5.5.35
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ucenter`
--

-- --------------------------------------------------------

--
-- 表的结构 `uc_admins`
--

CREATE TABLE IF NOT EXISTS `uc_admins` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `allowadminsetting` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminapp` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminuser` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminbadword` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmintag` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminpm` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincredits` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindomain` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindb` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminnote` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincache` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminlog` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_applications`
--

CREATE TABLE IF NOT EXISTS `uc_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `authkey` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `viewprourl` varchar(255) NOT NULL,
  `apifilename` varchar(30) NOT NULL DEFAULT 'uc.php',
  `charset` varchar(8) NOT NULL DEFAULT '',
  `dbcharset` varchar(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  `recvnote` tinyint(1) DEFAULT '0',
  `extra` text NOT NULL,
  `tagtemplates` text NOT NULL,
  `allowips` text NOT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `uc_applications`
--

INSERT INTO `uc_applications` (`appid`, `type`, `name`, `url`, `authkey`, `ip`, `viewprourl`, `apifilename`, `charset`, `dbcharset`, `synlogin`, `recvnote`, `extra`, `tagtemplates`, `allowips`) VALUES
(1, 'OTHER', 'demo', 'http://localhost：1105', '1b38uoPj95H3rhoHRr6TpUl7LwH58b3u3n5jvxCzjXW8', '', '', 'uc.php', '', '', 0, 0, 'a:2:{s:7:"apppath";s:0:"";s:8:"extraurl";a:0:{}}', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="template"><![CDATA[]]></item>\r\n</root>', '');

-- --------------------------------------------------------

--
-- 表的结构 `uc_badwords`
--

CREATE TABLE IF NOT EXISTS `uc_badwords` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `findpattern` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `find` (`find`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_domains`
--

CREATE TABLE IF NOT EXISTS `uc_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` char(40) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_failedlogins`
--

CREATE TABLE IF NOT EXISTS `uc_failedlogins` (
  `ip` char(15) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_feeds`
--

CREATE TABLE IF NOT EXISTS `uc_feeds` (
  `feedid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(30) NOT NULL DEFAULT '',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`feedid`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_friends`
--

CREATE TABLE IF NOT EXISTS `uc_friends` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `friendid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `direction` tinyint(1) NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delstatus` tinyint(1) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`version`),
  KEY `uid` (`uid`),
  KEY `friendid` (`friendid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_mailqueue`
--

CREATE TABLE IF NOT EXISTS `uc_mailqueue` (
  `mailid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tomail` varchar(32) NOT NULL,
  `frommail` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `charset` varchar(15) NOT NULL,
  `htmlon` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `failures` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mailid`),
  KEY `appid` (`appid`),
  KEY `level` (`level`,`failures`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_memberfields`
--

CREATE TABLE IF NOT EXISTS `uc_memberfields` (
  `uid` mediumint(8) unsigned NOT NULL,
  `blacklist` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_memberfields`
--

INSERT INTO `uc_memberfields` (`uid`, `blacklist`) VALUES
(1, ''),
(2, '');

-- --------------------------------------------------------

--
-- 表的结构 `uc_members`
--

CREATE TABLE IF NOT EXISTS `uc_members` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `myid` char(30) NOT NULL DEFAULT '',
  `myidkey` char(16) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `salt` char(6) NOT NULL,
  `secques` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `uc_members`
--

INSERT INTO `uc_members` (`uid`, `username`, `password`, `email`, `myid`, `myidkey`, `regip`, `regdate`, `lastloginip`, `lastlogintime`, `salt`, `secques`) VALUES
(1, 'test0', '012be46b518b27b632539070dd98bc69', 'test0@evildao.com', '', '', '127.0.0.1', 1390636778, 0, 0, 'a632ea', ''),
(2, 'test1', '22a4e5e7c9ce2479fbd5ffe13eb9e82b', 'test1@evildao.com', '', '', '127.0.0.1', 1390636816, 0, 0, '0c65d4', '');

-- --------------------------------------------------------

--
-- 表的结构 `uc_mergemembers`
--

CREATE TABLE IF NOT EXISTS `uc_mergemembers` (
  `appid` smallint(6) unsigned NOT NULL,
  `username` char(15) NOT NULL,
  PRIMARY KEY (`appid`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_newpm`
--

CREATE TABLE IF NOT EXISTS `uc_newpm` (
  `uid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_notelist`
--

CREATE TABLE IF NOT EXISTS `uc_notelist` (
  `noteid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `succeednum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `getdata` mediumtext NOT NULL,
  `postdata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `pri` tinyint(3) NOT NULL DEFAULT '0',
  `app1` tinyint(4) NOT NULL,
  PRIMARY KEY (`noteid`),
  KEY `closed` (`closed`,`pri`,`noteid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `uc_notelist`
--

INSERT INTO `uc_notelist` (`noteid`, `operation`, `closed`, `totalnum`, `succeednum`, `getdata`, `postdata`, `dateline`, `pri`, `app1`) VALUES
(1, 'renameuser', 1, 0, 0, 'uid=1&oldusername=test&newusername=test0', '', 0, 0, 0),
(2, 'updateapps', 1, 0, 0, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="1">\r\n		<item id="appid"><![CDATA[1]]></item>\r\n		<item id="type"><![CDATA[OTHER]]></item>\r\n		<item id="name"><![CDATA[demo]]></item>\r\n		<item id="url"><![CDATA[http://localhost:1104]]></item>\r\n		<item id="ip"><![CDATA[]]></item>\r\n		<item id="viewprourl"><![CDATA[]]></item>\r\n		<item id="apifilename"><![CDATA[uc.php]]></item>\r\n		<item id="charset"><![CDATA[]]></item>\r\n		<item id="synlogin"><![CDATA[0]]></item>\r\n		<item id="extra">\r\n			<item id="apppath"><![CDATA[]]></item>\r\n		</item>\r\n		<item id="recvnote"><![CDATA[0]]></item>\r\n	</item>\r\n	<item id="UC_API"><![CDATA[http://localhost:1104]]></item>\r\n</root>', 0, 0, 0),
(3, 'updateapps', 1, 0, 0, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="1">\r\n		<item id="appid"><![CDATA[1]]></item>\r\n		<item id="type"><![CDATA[OTHER]]></item>\r\n		<item id="name"><![CDATA[demo]]></item>\r\n		<item id="url"><![CDATA[http://localhost:1105]]></item>\r\n		<item id="ip"><![CDATA[]]></item>\r\n		<item id="viewprourl"><![CDATA[]]></item>\r\n		<item id="apifilename"><![CDATA[uc.php]]></item>\r\n		<item id="charset"><![CDATA[]]></item>\r\n		<item id="synlogin"><![CDATA[0]]></item>\r\n		<item id="extra">\r\n			<item id="apppath"><![CDATA[]]></item>\r\n			<item id="extraurl">\r\n			</item>\r\n		</item>\r\n		<item id="recvnote"><![CDATA[0]]></item>\r\n	</item>\r\n	<item id="UC_API"><![CDATA[http://localhost:1104]]></item>\r\n</root>', 0, 0, 0),
(4, 'updateapps', 1, 0, 0, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="1">\r\n		<item id="appid"><![CDATA[1]]></item>\r\n		<item id="type"><![CDATA[OTHER]]></item>\r\n		<item id="name"><![CDATA[demo]]></item>\r\n		<item id="url"><![CDATA[http://localhost]]></item>\r\n		<item id="ip"><![CDATA[]]></item>\r\n		<item id="viewprourl"><![CDATA[]]></item>\r\n		<item id="apifilename"><![CDATA[uc.php]]></item>\r\n		<item id="charset"><![CDATA[]]></item>\r\n		<item id="synlogin"><![CDATA[0]]></item>\r\n		<item id="extra">\r\n			<item id="apppath"><![CDATA[]]></item>\r\n			<item id="extraurl">\r\n			</item>\r\n		</item>\r\n		<item id="recvnote"><![CDATA[0]]></item>\r\n	</item>\r\n	<item id="UC_API"><![CDATA[http://localhost:1104]]></item>\r\n</root>', 0, 0, 0),
(5, 'updateapps', 1, 0, 0, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="1">\r\n		<item id="appid"><![CDATA[1]]></item>\r\n		<item id="type"><![CDATA[OTHER]]></item>\r\n		<item id="name"><![CDATA[demo]]></item>\r\n		<item id="url"><![CDATA[http://localhost:1105]]></item>\r\n		<item id="ip"><![CDATA[]]></item>\r\n		<item id="viewprourl"><![CDATA[]]></item>\r\n		<item id="apifilename"><![CDATA[uc.php]]></item>\r\n		<item id="charset"><![CDATA[]]></item>\r\n		<item id="synlogin"><![CDATA[0]]></item>\r\n		<item id="extra">\r\n			<item id="apppath"><![CDATA[]]></item>\r\n			<item id="extraurl">\r\n			</item>\r\n		</item>\r\n		<item id="recvnote"><![CDATA[0]]></item>\r\n	</item>\r\n	<item id="UC_API"><![CDATA[http://localhost:1104]]></item>\r\n</root>', 0, 0, 0),
(6, 'updateapps', 1, 0, 0, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="1">\r\n		<item id="appid"><![CDATA[1]]></item>\r\n		<item id="type"><![CDATA[OTHER]]></item>\r\n		<item id="name"><![CDATA[demo]]></item>\r\n		<item id="url"><![CDATA[http://localhost:1105/api]]></item>\r\n		<item id="ip"><![CDATA[]]></item>\r\n		<item id="viewprourl"><![CDATA[]]></item>\r\n		<item id="apifilename"><![CDATA[uc.php]]></item>\r\n		<item id="charset"><![CDATA[]]></item>\r\n		<item id="synlogin"><![CDATA[0]]></item>\r\n		<item id="extra">\r\n			<item id="apppath"><![CDATA[]]></item>\r\n			<item id="extraurl">\r\n			</item>\r\n		</item>\r\n		<item id="recvnote"><![CDATA[0]]></item>\r\n	</item>\r\n	<item id="UC_API"><![CDATA[http://localhost:1104]]></item>\r\n</root>', 0, 0, 0),
(7, 'updateapps', 1, 0, 0, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="1">\r\n		<item id="appid"><![CDATA[1]]></item>\r\n		<item id="type"><![CDATA[OTHER]]></item>\r\n		<item id="name"><![CDATA[demo]]></item>\r\n		<item id="url"><![CDATA[http://localhost:1105]]></item>\r\n		<item id="ip"><![CDATA[]]></item>\r\n		<item id="viewprourl"><![CDATA[]]></item>\r\n		<item id="apifilename"><![CDATA[uc.php]]></item>\r\n		<item id="charset"><![CDATA[]]></item>\r\n		<item id="synlogin"><![CDATA[0]]></item>\r\n		<item id="extra">\r\n			<item id="apppath"><![CDATA[]]></item>\r\n			<item id="extraurl">\r\n			</item>\r\n		</item>\r\n		<item id="recvnote"><![CDATA[0]]></item>\r\n	</item>\r\n	<item id="UC_API"><![CDATA[http://localhost:1104]]></item>\r\n</root>', 0, 0, 0),
(8, 'updateapps', 1, 0, 0, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="1">\r\n		<item id="appid"><![CDATA[1]]></item>\r\n		<item id="type"><![CDATA[OTHER]]></item>\r\n		<item id="name"><![CDATA[demo]]></item>\r\n		<item id="url"><![CDATA[http://localhost]]></item>\r\n		<item id="ip"><![CDATA[]]></item>\r\n		<item id="viewprourl"><![CDATA[]]></item>\r\n		<item id="apifilename"><![CDATA[uc.php]]></item>\r\n		<item id="charset"><![CDATA[]]></item>\r\n		<item id="synlogin"><![CDATA[0]]></item>\r\n		<item id="extra">\r\n			<item id="apppath"><![CDATA[]]></item>\r\n			<item id="extraurl">\r\n			</item>\r\n		</item>\r\n		<item id="recvnote"><![CDATA[0]]></item>\r\n	</item>\r\n	<item id="UC_API"><![CDATA[http://localhost:1104]]></item>\r\n</root>', 0, 0, 0),
(9, 'updateapps', 1, 0, 0, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="1">\r\n		<item id="appid"><![CDATA[1]]></item>\r\n		<item id="type"><![CDATA[OTHER]]></item>\r\n		<item id="name"><![CDATA[demo]]></item>\r\n		<item id="url"><![CDATA[http://localhost：1105]]></item>\r\n		<item id="ip"><![CDATA[]]></item>\r\n		<item id="viewprourl"><![CDATA[]]></item>\r\n		<item id="apifilename"><![CDATA[uc.php]]></item>\r\n		<item id="charset"><![CDATA[]]></item>\r\n		<item id="synlogin"><![CDATA[0]]></item>\r\n		<item id="extra">\r\n			<item id="apppath"><![CDATA[]]></item>\r\n			<item id="extraurl">\r\n			</item>\r\n		</item>\r\n		<item id="recvnote"><![CDATA[0]]></item>\r\n	</item>\r\n	<item id="UC_API"><![CDATA[http://localhost:1104]]></item>\r\n</root>', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_indexes`
--

CREATE TABLE IF NOT EXISTS `uc_pm_indexes` (
  `pmid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_lists`
--

CREATE TABLE IF NOT EXISTS `uc_pm_lists` (
  `plid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pmtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL,
  `members` smallint(5) unsigned NOT NULL DEFAULT '0',
  `min_max` varchar(17) NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `lastmessage` text NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `pmtype` (`pmtype`),
  KEY `min_max` (`min_max`),
  KEY `authorid` (`authorid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_members`
--

CREATE TABLE IF NOT EXISTS `uc_pm_members` (
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pmnum` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`plid`,`uid`),
  KEY `isnew` (`isnew`),
  KEY `lastdateline` (`uid`,`lastdateline`),
  KEY `lastupdate` (`uid`,`lastupdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_0`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_0` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_1`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_1` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_2`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_2` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_3`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_3` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_4`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_4` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_5`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_5` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_6`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_6` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_7`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_7` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_8`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_8` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_9`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_9` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_protectedmembers`
--

CREATE TABLE IF NOT EXISTS `uc_protectedmembers` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `appid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `admin` char(15) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_settings`
--

CREATE TABLE IF NOT EXISTS `uc_settings` (
  `k` varchar(32) NOT NULL DEFAULT '',
  `v` text NOT NULL,
  PRIMARY KEY (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_settings`
--

INSERT INTO `uc_settings` (`k`, `v`) VALUES
('accessemail', ''),
('censoremail', ''),
('censorusername', ''),
('dateformat', 'y-n-j'),
('doublee', '0'),
('nextnotetime', '0'),
('timeoffset', '28800'),
('privatepmthreadlimit', '25'),
('chatpmthreadlimit', '30'),
('chatpmmemberlimit', '35'),
('pmfloodctrl', '15'),
('pmcenter', '1'),
('sendpmseccode', '1'),
('pmsendregdays', '0'),
('maildefault', 'username@21cn.com'),
('mailsend', '1'),
('mailserver', 'smtp.21cn.com'),
('mailport', '25'),
('mailauth', '1'),
('mailfrom', 'UCenter <username@21cn.com>'),
('mailauth_username', 'username@21cn.com'),
('mailauth_password', 'password'),
('maildelimiter', '0'),
('mailusername', '1'),
('mailsilent', '1'),
('version', '1.6.0');

-- --------------------------------------------------------

--
-- 表的结构 `uc_sqlcache`
--

CREATE TABLE IF NOT EXISTS `uc_sqlcache` (
  `sqlid` char(6) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL,
  `expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sqlid`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_tags`
--

CREATE TABLE IF NOT EXISTS `uc_tags` (
  `tagname` char(20) NOT NULL,
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext,
  `expiration` int(10) unsigned NOT NULL,
  KEY `tagname` (`tagname`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_vars`
--

CREATE TABLE IF NOT EXISTS `uc_vars` (
  `name` char(32) NOT NULL DEFAULT '',
  `value` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_vars`
--

INSERT INTO `uc_vars` (`name`, `value`) VALUES
('noteexists', '0'),
('noteexists1', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
