-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Aug 22, 2016 at 09:38 AM
-- Server version: 10.0.25-MariaDB-cll-lve
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spiritb1_livingbliss`
--
CREATE DATABASE IF NOT EXISTS `spiritb1_livingbliss` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `spiritb1_livingbliss`;

-- --------------------------------------------------------

--
-- Table structure for table `action`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `action` (
  `act_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(50) DEFAULT NULL,
  `act_descr_short` varchar(100) DEFAULT NULL,
  `act_descr_long` varchar(200) DEFAULT NULL,
  `act_auth_id` int(10) unsigned DEFAULT NULL,
  `act_public` tinyint(1) DEFAULT NULL,
  `act_image_icon` varchar(100) DEFAULT NULL,
  `act_image_thnl` varchar(100) DEFAULT NULL,
  `act_image_full` varchar(100) DEFAULT NULL,
  `act_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=212 ;

-- --------------------------------------------------------

--
-- Table structure for table `act_cat`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `act_cat` (
  `acca_cat_id` int(10) unsigned NOT NULL,
  `acca_act_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`acca_cat_id`,`acca_act_id`),
  KEY `fk_acca_act` (`acca_act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `act_intu`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `act_intu` (
  `acin_act_id` int(10) unsigned NOT NULL,
  `acin_intu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`acin_act_id`,`acin_intu_id`),
  KEY `fk_acin_intu` (`acin_intu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blisslistitem`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `blisslistitem` (
  `blisti_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blisti_user_id` int(10) unsigned NOT NULL,
  `blisti_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `blisti_act_id` int(10) unsigned NOT NULL,
  `blisti_status` tinyint(1) DEFAULT NULL,
  `blisti_note` varchar(100) DEFAULT NULL,
  `blisti_bliss_rating` tinyint(3) unsigned NOT NULL,
  `blisti_change` tinyint(4) NOT NULL,
  `blisti_completed` datetime DEFAULT NULL,
  PRIMARY KEY (`blisti_id`),
  KEY `fk_blist_act` (`blisti_act_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=167 ;

--
-- Triggers `blisslistitem`
--
DROP TRIGGER IF EXISTS `trig_blisti_OnInsert`;
DELIMITER //
CREATE TRIGGER `trig_blisti_OnInsert` BEFORE INSERT ON `blisslistitem`
 FOR EACH ROW SET NEW.blisti_created = IFNULL(NEW.blisti_created, NOW())
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blissrating`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `blissrating` (
  `blr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blr_user_id` int(11) NOT NULL,
  `blr_rating` tinyint(3) unsigned NOT NULL,
  `blr_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blr_comment` varchar(100) DEFAULT NULL,
  `blr_diary` text,
  PRIMARY KEY (`blr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name_intu_short` varchar(50) DEFAULT NULL,
  `cat_name_act_short` varchar(50) DEFAULT NULL,
  `cat_order` tinyint(4) DEFAULT NULL,
  `cat_descr_intu_short` varchar(50) DEFAULT NULL,
  `cat_descr_intu_long` varchar(3000) DEFAULT NULL,
  `cat_descr_act_short` varchar(50) DEFAULT NULL,
  `cat_descr_act_long` varchar(3000) DEFAULT NULL,
  `cat_image_icon` varchar(100) DEFAULT NULL,
  `cat_image_thnl` varchar(100) DEFAULT NULL,
  `cat_image_full` varchar(100) DEFAULT NULL,
  `cat_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- Table structure for table `cat_cat`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `cat_cat` (
  `parent_cat_id` int(10) unsigned NOT NULL,
  `child_cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`parent_cat_id`,`child_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cat_intu`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `cat_intu` (
  `cain_cat_id` int(10) unsigned NOT NULL,
  `cain_intu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cain_cat_id`,`cain_intu_id`),
  KEY `fk_cain_intu` (`cain_intu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `intuition`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `intuition` (
  `intu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intu_name` varchar(50) DEFAULT NULL,
  `intu_descr` varchar(200) DEFAULT NULL,
  `intu_descr_long` varchar(3000) DEFAULT NULL,
  `intu_auth_id` int(10) unsigned DEFAULT NULL,
  `intu_image_icon` varchar(100) DEFAULT NULL,
  `intu_image_thnl` varchar(100) DEFAULT NULL,
  `intu_image_full` varchar(100) DEFAULT NULL,
  `intu_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`intu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--
-- Creation: Aug 21, 2016 at 02:16 AM
--

CREATE TABLE IF NOT EXISTS `source` (
  `src_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src_name` varchar(50) DEFAULT NULL,
  `src_descr` varchar(200) DEFAULT NULL,
  `src_desc_long` varchar(3000) DEFAULT NULL,
  `src_auth_id` int(10) unsigned NOT NULL,
  `src_image_icon` varchar(100) DEFAULT NULL,
  `src_image_thnl` varchar(100) DEFAULT NULL,
  `src_image_full` varchar(100) DEFAULT NULL,
  `src_url` varchar(200) DEFAULT NULL,
  `src_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `src_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`src_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userpref`
--
-- Creation: Aug 18, 2016 at 01:55 PM
--

CREATE TABLE IF NOT EXISTS `userpref` (
  `uspr_user_id` int(10) unsigned NOT NULL,
  `uspr_timezone` tinyint(4) DEFAULT NULL COMMENT 'Store difference from UTC',
  `uspr_phone` varchar(10) DEFAULT NULL,
  `uspr_bpct1rem_on` bit(1) NOT NULL DEFAULT b'0',
  `uspr_bpct1rem_time` time NOT NULL DEFAULT '09:00:00',
  `uspr_bpct1rem_email` bit(1) NOT NULL DEFAULT b'0',
  `uspr_bpct1rem_phone` bit(1) NOT NULL DEFAULT b'1',
  `uspr_bpct1rem_sms` bit(1) NOT NULL DEFAULT b'0',
  `uspr_bpct2rem_on` bit(1) NOT NULL DEFAULT b'0',
  `uspr_bpct2rem_time` time NOT NULL DEFAULT '12:00:00',
  `uspr_bpct2rem_email` bit(1) NOT NULL DEFAULT b'0',
  `uspr_bpct2rem_phone` bit(1) NOT NULL DEFAULT b'1',
  `uspr_bpct2rem_sms` bit(1) NOT NULL DEFAULT b'0',
  `uspr_bpct3rem_on` bit(1) NOT NULL DEFAULT b'0',
  `uspr_bpct3rem_time` time NOT NULL DEFAULT '17:00:00',
  `uspr_bpct3rem_email` bit(1) NOT NULL DEFAULT b'1',
  `uspr_bpct3rem_phone` bit(1) NOT NULL DEFAULT b'1',
  `uspr_bpct3rem_sms` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`uspr_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `act_cat`
--
ALTER TABLE `act_cat`
  ADD CONSTRAINT `fk_acca_act` FOREIGN KEY (`acca_act_id`) REFERENCES `action` (`act_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_acca_cat` FOREIGN KEY (`acca_cat_id`) REFERENCES `category` (`cat_id`) ON UPDATE CASCADE;

--
-- Constraints for table `act_intu`
--
ALTER TABLE `act_intu`
  ADD CONSTRAINT `fk_acin_act` FOREIGN KEY (`acin_act_id`) REFERENCES `action` (`act_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_acin_intu` FOREIGN KEY (`acin_intu_id`) REFERENCES `intuition` (`intu_id`);

--
-- Constraints for table `blisslistitem`
--
ALTER TABLE `blisslistitem`
  ADD CONSTRAINT `fk_blist_act` FOREIGN KEY (`blisti_act_id`) REFERENCES `action` (`act_id`);

--
-- Constraints for table `cat_intu`
--
ALTER TABLE `cat_intu`
  ADD CONSTRAINT `fk_cain_cat` FOREIGN KEY (`cain_cat_id`) REFERENCES `category` (`cat_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cain_intu` FOREIGN KEY (`cain_intu_id`) REFERENCES `intuition` (`intu_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
