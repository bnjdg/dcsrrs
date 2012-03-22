-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2012 at 06:42 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dcsrrs_prod2`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'Admins'),
(1, 'Staff'),
(2, 'Users');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=169 ;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(139, 1, 7),
(140, 1, 8),
(141, 1, 9),
(142, 1, 10),
(143, 1, 11),
(144, 1, 12),
(145, 1, 13),
(146, 1, 14),
(147, 1, 15),
(148, 1, 22),
(149, 1, 23),
(150, 1, 24),
(151, 1, 25),
(152, 1, 26),
(153, 1, 27),
(154, 1, 28),
(155, 1, 29),
(156, 1, 30),
(157, 1, 31),
(158, 1, 32),
(159, 1, 33),
(160, 1, 34),
(161, 1, 35),
(162, 1, 36),
(163, 1, 37),
(164, 1, 38),
(165, 1, 39),
(166, 1, 40),
(167, 1, 41),
(168, 1, 42),
(132, 2, 10),
(133, 2, 12),
(134, 2, 13),
(135, 2, 14),
(136, 2, 15),
(138, 2, 31),
(125, 2, 32),
(126, 2, 33),
(127, 2, 34),
(128, 2, 35),
(129, 2, 36),
(130, 2, 40),
(131, 2, 41),
(137, 2, 42),
(52, 3, 1),
(53, 3, 2),
(54, 3, 3),
(55, 3, 4),
(56, 3, 5),
(57, 3, 6),
(58, 3, 7),
(59, 3, 8),
(60, 3, 9),
(61, 3, 10),
(62, 3, 11),
(63, 3, 12),
(64, 3, 13),
(65, 3, 14),
(66, 3, 15),
(67, 3, 16),
(68, 3, 17),
(69, 3, 18),
(70, 3, 19),
(71, 3, 20),
(72, 3, 21),
(73, 3, 22),
(74, 3, 23),
(75, 3, 24),
(76, 3, 25),
(77, 3, 26),
(78, 3, 27),
(79, 3, 28),
(80, 3, 29),
(81, 3, 30),
(82, 3, 31),
(83, 3, 32),
(84, 3, 33),
(85, 3, 34),
(86, 3, 35),
(87, 3, 36),
(88, 3, 37),
(89, 3, 38),
(90, 3, 39),
(91, 3, 40),
(92, 3, 41),
(93, 3, 42),
(94, 3, 43),
(95, 3, 44),
(96, 3, 45);

-- --------------------------------------------------------

--
-- Table structure for table `auth_message`
--

CREATE TABLE IF NOT EXISTS `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add message', 4, 'add_message'),
(11, 'Can change message', 4, 'change_message'),
(12, 'Can delete message', 4, 'delete_message'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add log entry', 8, 'add_logentry'),
(23, 'Can change log entry', 8, 'change_logentry'),
(24, 'Can delete log entry', 8, 'delete_logentry'),
(25, 'Can add room', 9, 'add_room'),
(26, 'Can change room', 9, 'change_room'),
(27, 'Can delete room', 9, 'delete_room'),
(28, 'Can add room relation', 10, 'add_roomrelation'),
(29, 'Can change room relation', 10, 'change_roomrelation'),
(30, 'Can delete room relation', 10, 'delete_roomrelation'),
(31, 'Can add rule', 11, 'add_rule'),
(32, 'Can change rule', 11, 'change_rule'),
(33, 'Can delete rule', 11, 'delete_rule'),
(34, 'Can add reservation', 12, 'add_reservation'),
(35, 'Can change reservation', 12, 'change_reservation'),
(36, 'Can delete reservation', 12, 'delete_reservation'),
(37, 'Can add reservation relation', 13, 'add_reservationrelation'),
(38, 'Can change reservation relation', 13, 'change_reservationrelation'),
(39, 'Can delete reservation relation', 13, 'delete_reservationrelation'),
(40, 'Can add occurrence', 14, 'add_occurrence'),
(41, 'Can change occurrence', 14, 'change_occurrence'),
(42, 'Can delete occurrence', 14, 'delete_occurrence'),
(43, 'Can add registration profile', 15, 'add_registrationprofile'),
(44, 'Can change registration profile', 15, 'change_registrationprofile'),
(45, 'Can delete registration profile', 15, 'delete_registrationprofile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'admin', 'Administrator', 'Admin', 'admin@admin.admin', 'sha1$b8071$9dbd0860398706a1834e118c7a99106ad5bf4b83', 1, 1, 1, '2012-03-23 01:39:50', '2012-03-22 16:07:17'),
(6, 'staff', '', '', '', 'sha1$1c39b$49e9c5b5059330db139fbe9a0b615d328cb4faee', 1, 1, 0, '2012-03-23 01:33:34', '2012-03-23 01:26:13'),
(7, 'user2', '', '', '', 'sha1$b640d$ba5c67ce1f380e68e71d77d1b7ae4edf901b2b94', 0, 1, 0, '2012-03-23 01:26:23', '2012-03-23 01:26:23'),
(8, 'user1', '', '', '', 'sha1$829b0$6f743b549eabb936c9573980446b947c211f5776', 0, 1, 0, '2012-03-23 01:38:20', '2012-03-23 01:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 6, 1),
(7, 7, 2),
(6, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(29, 6, 1),
(30, 6, 2),
(31, 6, 3),
(32, 6, 4),
(33, 6, 5),
(34, 6, 6),
(35, 6, 7),
(36, 6, 8),
(37, 6, 9),
(44, 6, 25),
(47, 6, 26),
(46, 6, 27),
(40, 6, 31),
(28, 6, 32),
(45, 6, 33),
(39, 6, 34),
(42, 6, 35),
(48, 6, 36),
(41, 6, 40),
(43, 6, 41),
(38, 6, 42),
(61, 7, 34),
(62, 7, 35),
(63, 7, 36),
(64, 7, 40),
(65, 7, 41),
(66, 7, 42);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(31, '2012-03-23 01:28:56', 1, 3, '7', 'user2', 2, 'Changed username and user_permissions.'),
(32, '2012-03-23 01:29:43', 1, 2, '1', 'Staff', 1, ''),
(33, '2012-03-23 01:31:39', 1, 2, '2', 'Users', 1, ''),
(34, '2012-03-23 01:32:02', 1, 2, '3', 'Admins', 1, ''),
(35, '2012-03-23 01:32:18', 1, 3, '6', 'staff', 2, 'Changed groups.'),
(36, '2012-03-23 01:32:28', 1, 3, '8', 'user1', 2, 'Changed groups.'),
(37, '2012-03-23 01:32:38', 1, 3, '7', 'user2', 2, 'Changed groups.'),
(38, '2012-03-23 01:33:54', 6, 3, '8', 'user1', 2, 'Changed is_staff.'),
(39, '2012-03-23 01:34:05', 6, 3, '7', 'user2', 2, 'Changed is_staff.'),
(40, '2012-03-23 01:35:10', 8, 2, '2', 'Users', 2, 'Changed permissions.'),
(41, '2012-03-23 01:36:06', 8, 2, '2', 'Users', 2, 'Changed permissions.'),
(42, '2012-03-23 01:37:02', 1, 2, '2', 'Users', 2, 'No fields changed.'),
(43, '2012-03-23 01:37:56', 1, 2, '1', 'Staff', 2, 'Changed permissions.'),
(44, '2012-03-23 01:39:04', 1, 3, '8', 'user1', 2, 'Changed is_staff.'),
(45, '2012-03-23 01:39:14', 1, 3, '7', 'user2', 2, 'Changed is_staff.');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'message', 'auth', 'message'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'site', 'sites', 'site'),
(8, 'log entry', 'admin', 'logentry'),
(9, 'room', 'schedule', 'room'),
(10, 'room relation', 'schedule', 'roomrelation'),
(11, 'rule', 'schedule', 'rule'),
(12, 'reservation', 'schedule', 'reservation'),
(13, 'reservation relation', 'schedule', 'reservationrelation'),
(14, 'occurrence', 'schedule', 'occurrence'),
(15, 'registration profile', 'registration', 'registrationprofile');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `registration_registrationprofile`
--

CREATE TABLE IF NOT EXISTS `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_occurrence`
--

CREATE TABLE IF NOT EXISTS `schedule_occurrence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `cancelled` tinyint(1) NOT NULL,
  `original_start` datetime NOT NULL,
  `original_end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_occurrence_5ef52cd9` (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_reservation`
--

CREATE TABLE IF NOT EXISTS `schedule_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `creator_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `end_recurring_period` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_reservation_685aee7` (`creator_id`),
  KEY `schedule_reservation_1c671d36` (`rule_id`),
  KEY `schedule_reservation_109d8a5f` (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_reservationrelation`
--

CREATE TABLE IF NOT EXISTS `schedule_reservationrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `distinction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_reservationrelation_5ef52cd9` (`reservation_id`),
  KEY `schedule_reservationrelation_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_room`
--

CREATE TABLE IF NOT EXISTS `schedule_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_room_56ae2a2a` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `schedule_room`
--

INSERT INTO `schedule_room` (`id`, `name`, `slug`) VALUES
(1, 'ERDT', 'erdt'),
(2, 'Teaching Lab 1', 'teaching-lab-1'),
(3, 'Teaching Lab 2', 'teaching-lab-2'),
(4, 'Teaching Lab 3', 'teaching-lab-3'),
(5, 'Classroom 1', 'classroom-1'),
(6, 'Classroom 2', 'classroom-2'),
(7, 'Classroom 3', 'classroom-3'),
(8, 'Classroom 4', 'classroom-4'),
(9, 'Conference Room', 'conference-room'),
(10, 'Lecture Hall', 'lecture-hall');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_roomrelation`
--

CREATE TABLE IF NOT EXISTS `schedule_roomrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `distinction` varchar(20) DEFAULT NULL,
  `inheritable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_roomrelation_109d8a5f` (`room_id`),
  KEY `schedule_roomrelation_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_rule`
--

CREATE TABLE IF NOT EXISTS `schedule_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  `frequency` varchar(10) NOT NULL,
  `params` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `schedule_rule`
--

INSERT INTO `schedule_rule` (`id`, `name`, `description`, `frequency`, `params`) VALUES
(1, 'Weekly', 'Recurs weekly.', 'WEEKLY', 'byweekday'),
(2, 'Daily', 'Recurs daily', 'DAILY', 'byday');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_message`
--
ALTER TABLE `auth_message`
  ADD CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `registration_registrationprofile`
--
ALTER TABLE `registration_registrationprofile`
  ADD CONSTRAINT `user_id_refs_id_313280c4` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `schedule_occurrence`
--
ALTER TABLE `schedule_occurrence`
  ADD CONSTRAINT `reservation_id_refs_id_68259497` FOREIGN KEY (`reservation_id`) REFERENCES `schedule_reservation` (`id`);

--
-- Constraints for table `schedule_reservation`
--
ALTER TABLE `schedule_reservation`
  ADD CONSTRAINT `creator_id_refs_id_28f6d494` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `room_id_refs_id_7dd51417` FOREIGN KEY (`room_id`) REFERENCES `schedule_room` (`id`),
  ADD CONSTRAINT `rule_id_refs_id_52abdec0` FOREIGN KEY (`rule_id`) REFERENCES `schedule_rule` (`id`);

--
-- Constraints for table `schedule_reservationrelation`
--
ALTER TABLE `schedule_reservationrelation`
  ADD CONSTRAINT `content_type_id_refs_id_34baa41c` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `reservation_id_refs_id_66695627` FOREIGN KEY (`reservation_id`) REFERENCES `schedule_reservation` (`id`);

--
-- Constraints for table `schedule_roomrelation`
--
ALTER TABLE `schedule_roomrelation`
  ADD CONSTRAINT `content_type_id_refs_id_35f6a172` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `room_id_refs_id_5e69dd53` FOREIGN KEY (`room_id`) REFERENCES `schedule_room` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
