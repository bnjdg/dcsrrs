-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 21, 2012 at 07:35 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dcsrrs`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
(25, 'Can add calendar', 9, 'add_calendar'),
(26, 'Can change calendar', 9, 'change_calendar'),
(27, 'Can delete calendar', 9, 'delete_calendar'),
(28, 'Can add calendar relation', 10, 'add_calendarrelation'),
(29, 'Can change calendar relation', 10, 'change_calendarrelation'),
(30, 'Can delete calendar relation', 10, 'delete_calendarrelation'),
(31, 'Can add rule', 11, 'add_rule'),
(32, 'Can change rule', 11, 'change_rule'),
(33, 'Can delete rule', 11, 'delete_rule'),
(34, 'Can add event', 12, 'add_event'),
(35, 'Can change event', 12, 'change_event'),
(36, 'Can delete event', 12, 'delete_event'),
(37, 'Can add event relation', 13, 'add_eventrelation'),
(38, 'Can change event relation', 13, 'change_eventrelation'),
(39, 'Can delete event relation', 13, 'delete_eventrelation'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'admin', '', '', 'bjdag1234@gmail.com', 'sha1$c2120$17e30e24132d19842db804f28ba139a585a5a8ea', 1, 1, 1, '2012-03-20 14:12:03', '2012-03-13 09:27:10'),
(10, 'benj', '', '', 'bjdag1234@gmail.com', 'sha1$8f467$ec4ee8a9a064823771f2d433d522dbe3a9f5ae6f', 1, 1, 1, '2012-03-20 18:24:09', '2012-03-20 10:52:46'),
(11, 'test', '', '', '', 'sha1$5ac2b$e5ad60cdccd416b316e538ea118b5e4888b3c940', 0, 1, 0, '2012-03-20 15:07:07', '2012-03-20 10:52:55'),
(12, 'test2', '', '', '', 'sha1$89614$a9bec670cde493e6223c5285abf8ab7e522ce516', 0, 1, 0, '2012-03-20 10:53:10', '2012-03-20 10:53:10'),
(13, 'test3', '', '', '', 'sha1$8c846$2ab10a2cb98bba696f95dbc0d10cd394af56afd0', 0, 1, 0, '2012-03-20 10:53:26', '2012-03-20 10:53:26');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2012-03-13 10:43:04', 1, 15, '1', 'Registration information for benj', 3, ''),
(2, '2012-03-13 10:43:30', 1, 3, '2', 'benj', 3, ''),
(3, '2012-03-13 10:50:17', 1, 3, '3', 'benj', 3, ''),
(4, '2012-03-13 11:12:53', 1, 9, '1', 'ERDT', 1, ''),
(5, '2012-03-13 11:13:06', 1, 9, '2', 'teaching lab 1', 1, ''),
(6, '2012-03-13 11:13:10', 1, 9, '3', 'teaching lab 2', 1, ''),
(7, '2012-03-14 07:18:17', 1, 3, '5', 'benj', 3, ''),
(8, '2012-03-14 07:42:00', 1, 3, '6', 'benj', 3, ''),
(9, '2012-03-14 11:43:22', 1, 3, '9', 'test', 1, ''),
(10, '2012-03-14 11:45:04', 1, 3, '9', 'test', 2, 'Changed first_name, last_name, email and user_permissions.'),
(11, '2012-03-14 11:45:42', 1, 15, '8', 'Registration information for test', 1, ''),
(12, '2012-03-20 10:49:36', 1, 12, '9', 'CS30: Wednesday, March 21, 2012-Wednesday, March 21, 2012', 3, ''),
(13, '2012-03-20 10:49:36', 1, 12, '7', 'bbbbbb: Tuesday, March 20, 2012-Tuesday, March 20, 2012', 3, ''),
(14, '2012-03-20 10:49:36', 1, 12, '6', 'cs34: Tuesday, March 20, 2012-Tuesday, March 20, 2012', 3, ''),
(15, '2012-03-20 10:49:36', 1, 12, '4', 'hjdfvgbh: Tuesday, March 20, 2012-Tuesday, March 20, 2012', 3, ''),
(16, '2012-03-20 10:49:36', 1, 12, '1', 'dsds: Thursday, March 1, 2012-Thursday, March 1, 2012', 3, ''),
(17, '2012-03-20 10:49:55', 1, 9, '3', 'teaching lab 2', 3, ''),
(18, '2012-03-20 10:49:55', 1, 9, '2', 'teaching lab 1', 3, ''),
(19, '2012-03-20 10:49:55', 1, 9, '1', 'ERDT', 3, ''),
(20, '2012-03-20 10:50:13', 1, 3, '7', 'benj', 3, ''),
(21, '2012-03-20 10:50:13', 1, 3, '9', 'test', 3, ''),
(22, '2012-03-20 10:52:46', 1, 3, '10', 'benj', 1, ''),
(23, '2012-03-20 10:52:55', 1, 3, '11', 'test', 1, ''),
(24, '2012-03-20 10:53:10', 1, 3, '12', 'test2', 1, ''),
(25, '2012-03-20 10:53:26', 1, 3, '13', 'test3', 1, ''),
(26, '2012-03-20 10:53:55', 1, 3, '10', 'benj', 2, 'Changed email, is_staff and is_superuser.'),
(27, '2012-03-20 10:54:41', 1, 15, '9', 'Registration information for benj', 1, ''),
(28, '2012-03-20 10:55:22', 1, 15, '10', 'Registration information for test', 1, ''),
(29, '2012-03-20 10:55:38', 1, 15, '11', 'Registration information for test2', 1, ''),
(30, '2012-03-20 10:55:55', 1, 15, '12', 'Registration information for test3', 1, ''),
(31, '2012-03-20 11:05:55', 1, 11, '1', 'Weekly', 1, ''),
(32, '2012-03-20 11:19:24', 1, 9, '4', 'ERDT', 1, ''),
(33, '2012-03-20 11:19:38', 1, 9, '5', 'Teaching Lab 1', 1, ''),
(34, '2012-03-20 11:19:38', 1, 9, '6', 'Teaching Lab 1', 1, ''),
(35, '2012-03-20 11:19:47', 1, 9, '7', 'Teaching Lab 2', 1, ''),
(36, '2012-03-20 11:19:53', 1, 9, '8', 'Teaching Lab 3', 1, ''),
(37, '2012-03-20 11:20:04', 1, 9, '5', 'Teaching Lab 1', 3, ''),
(38, '2012-03-20 11:20:11', 1, 9, '6', 'Teaching Lab 1', 2, 'No fields changed.'),
(39, '2012-03-20 11:20:27', 1, 9, '9', 'Classroom 1', 1, ''),
(40, '2012-03-20 11:20:34', 1, 9, '10', 'Classroom 2', 1, ''),
(41, '2012-03-20 11:20:39', 1, 9, '11', 'Classroom 3', 1, ''),
(42, '2012-03-20 11:21:16', 1, 9, '12', 'Classroom 4', 1, ''),
(43, '2012-03-20 11:21:43', 1, 9, '13', 'Lecture Hall', 1, ''),
(44, '2012-03-20 11:22:01', 1, 9, '14', 'Conference Room', 1, ''),
(45, '2012-03-20 11:29:00', 1, 11, '1', 'Monday', 2, 'Changed name, description and params.'),
(46, '2012-03-20 11:29:49', 1, 11, '1', 'Monday', 2, 'No fields changed.'),
(47, '2012-03-20 11:30:18', 1, 11, '2', 'Tuesdays', 1, ''),
(48, '2012-03-20 11:30:53', 1, 11, '3', 'Wednesdays', 1, ''),
(49, '2012-03-20 11:31:27', 1, 11, '4', 'Thursdays', 1, ''),
(50, '2012-03-20 11:31:46', 1, 11, '5', 'Fridays', 1, ''),
(51, '2012-03-20 11:32:12', 1, 11, '6', 'Saturdays', 1, ''),
(52, '2012-03-20 11:32:39', 1, 11, '7', 'Sundays', 1, ''),
(53, '2012-03-20 18:11:42', 10, 7, '1', 'example.com', 3, ''),
(54, '2012-03-20 18:28:29', 10, 11, '8', 'Weekly', 1, ''),
(55, '2012-03-20 18:31:15', 10, 11, '8', 'Weekly', 2, 'Changed description and params.'),
(56, '2012-03-20 18:33:41', 10, 11, '8', 'Weekly', 2, 'Changed frequency and params.');

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
(9, 'calendar', 'schedule', 'calendar'),
(10, 'calendar relation', 'schedule', 'calendarrelation'),
(11, 'rule', 'schedule', 'rule'),
(12, 'event', 'schedule', 'event'),
(13, 'event relation', 'schedule', 'eventrelation'),
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

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2c3457bf8171bb2d012c77cbc43ee67f', 'YTJhYzI3NWU4MjdlMjQ0YzY2NWI1MWNiYzFiNmY2YmMzYmI4NTY3MzqAAn1xAS4=\n', '2012-04-03 18:35:21'),
('569e2bdebee3c0cd32ebe30bd537e30d', 'YzllNDZmNjFmOWQ5MzQ2MDQ1ZTA0OTY1ZTFkZWQ5OGRhYjYwNmE3MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQd1Lg==\n', '2012-03-31 22:44:01'),
('6ccee873e065b70b709290cee49eb9e3', 'YjY2NGFkNGJhYWFhNWI1ZDc5YjQ0ZmE4MjhkYmJlZWU1NDUwMWRjMDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-03-27 10:42:43'),
('8ac4f88cc668698b9b414bef912949c9', 'OGFjNjA2ZDk4NTMyN2VkZTBjMGIyZWQ1MzI1YzRkODgwNDliY2E5ODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n', '2012-04-03 18:14:58'),
('a32141a7a12b6817c21ad49ba9b8acf3', 'OGFjNjA2ZDk4NTMyN2VkZTBjMGIyZWQ1MzI1YzRkODgwNDliY2E5ODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n', '2012-04-03 18:18:32'),
('a3645f70540ccd333dafc3f8d972bd5b', 'ZDk5YmI2ZmExMTE3YzdhMmRmNzY0YTk0NjA5NDg1ZDM2NTg2NTJkMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQp1Lg==\n', '2012-04-03 17:27:43'),
('a847f8dc7f2159fdceeff7f90898c241', 'ZDk5YmI2ZmExMTE3YzdhMmRmNzY0YTk0NjA5NDg1ZDM2NTg2NTJkMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQp1Lg==\n', '2012-04-03 18:07:30'),
('ffc87b9a6422e06edd2ef18798f29b1d', 'ZDk5YmI2ZmExMTE3YzdhMmRmNzY0YTk0NjA5NDg1ZDM2NTg2NTJkMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQp1Lg==\n', '2012-04-03 16:03:23');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `registration_registrationprofile`
--

INSERT INTO `registration_registrationprofile` (`id`, `user_id`, `activation_key`) VALUES
(9, 10, 'sha$djy6ejuydf67uf67iws45ksoo969o'),
(10, 11, 'sha$djy6ejuyddfghj4567fgjdgj'),
(11, 12, 'sha$djy34567u8i9345t6yudfg'),
(12, 13, 'sha$d456789dfghjkrtyjukijlretrgthj');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_calendar`
--

CREATE TABLE IF NOT EXISTS `schedule_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_calendar_56ae2a2a` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `schedule_calendar`
--

INSERT INTO `schedule_calendar` (`id`, `name`, `slug`) VALUES
(4, 'ERDT', 'erdt'),
(6, 'Teaching Lab 1', 'teaching-lab-1'),
(7, 'Teaching Lab 2', 'teaching-lab-2'),
(8, 'Teaching Lab 3', 'teaching-lab-3'),
(9, 'Classroom 1', 'classroom-1'),
(10, 'Classroom 2', 'classroom-2'),
(11, 'Classroom 3', 'classroom-3'),
(12, 'Classroom 4', 'classroom-4'),
(13, 'Lecture Hall', 'lecture-hall'),
(14, 'Conference Room', 'conference-room');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_calendarrelation`
--

CREATE TABLE IF NOT EXISTS `schedule_calendarrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `distinction` varchar(20) DEFAULT NULL,
  `inheritable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_calendarrelation_447205e2` (`calendar_id`),
  KEY `schedule_calendarrelation_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_event`
--

CREATE TABLE IF NOT EXISTS `schedule_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `creator_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `end_recurring_period` datetime DEFAULT NULL,
  `calendar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_event_685aee7` (`creator_id`),
  KEY `schedule_event_1c671d36` (`rule_id`),
  KEY `schedule_event_447205e2` (`calendar_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `schedule_event`
--

INSERT INTO `schedule_event` (`id`, `start`, `end`, `title`, `description`, `creator_id`, `created_on`, `rule_id`, `end_recurring_period`, `calendar_id`) VALUES
(15, '2012-03-22 05:00:00', '2012-03-22 05:30:00', 'dddd', 'djdjdj', 10, '2012-03-20 18:29:28', 8, '2012-06-27 00:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_eventrelation`
--

CREATE TABLE IF NOT EXISTS `schedule_eventrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `distinction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_eventrelation_1647d06b` (`event_id`),
  KEY `schedule_eventrelation_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_occurrence`
--

CREATE TABLE IF NOT EXISTS `schedule_occurrence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `cancelled` tinyint(1) NOT NULL,
  `original_start` datetime NOT NULL,
  `original_end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_occurrence_1647d06b` (`event_id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `schedule_rule`
--

INSERT INTO `schedule_rule` (`id`, `name`, `description`, `frequency`, `params`) VALUES
(1, 'Monday', 'Reccurs every Monday', 'WEEKLY', 'byweekday:MO'),
(2, 'Tuesdays', 'every tuesday', 'WEEKLY', 'byweekday:TU'),
(3, 'Wednesdays', 'Wednesdays', 'WEEKLY', 'byweekday:WE'),
(4, 'Thursdays', 'Every Thursdays', 'WEEKLY', 'byweekday:TH'),
(5, 'Fridays', 'Every friday', 'WEEKLY', 'byweekday:FR'),
(6, 'Saturdays', 'Every Saturday', 'WEEKLY', 'Saturday'),
(7, 'Sundays', 'Every Sunday', 'WEEKLY', 'byweekno:SU'),
(8, 'Weekly', 'every week, 100 occurences', 'DAILY', 'interval:7');

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
-- Constraints for table `schedule_calendarrelation`
--
ALTER TABLE `schedule_calendarrelation`
  ADD CONSTRAINT `calendar_id_refs_id_679e6b27` FOREIGN KEY (`calendar_id`) REFERENCES `schedule_calendar` (`id`),
  ADD CONSTRAINT `content_type_id_refs_id_1789be3d` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `schedule_event`
--
ALTER TABLE `schedule_event`
  ADD CONSTRAINT `calendar_id_refs_id_335d0cf0` FOREIGN KEY (`calendar_id`) REFERENCES `schedule_calendar` (`id`),
  ADD CONSTRAINT `creator_id_refs_id_6d7cb7f0` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `rule_id_refs_id_747df0fc` FOREIGN KEY (`rule_id`) REFERENCES `schedule_rule` (`id`);

--
-- Constraints for table `schedule_eventrelation`
--
ALTER TABLE `schedule_eventrelation`
  ADD CONSTRAINT `content_type_id_refs_id_1db76564` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `event_id_refs_id_6921d83b` FOREIGN KEY (`event_id`) REFERENCES `schedule_event` (`id`);

--
-- Constraints for table `schedule_occurrence`
--
ALTER TABLE `schedule_occurrence`
  ADD CONSTRAINT `event_id_refs_id_7c4b45ed` FOREIGN KEY (`event_id`) REFERENCES `schedule_event` (`id`);

--
-- Constraints for table `schedule_roomrelation`
--
ALTER TABLE `schedule_roomrelation`
  ADD CONSTRAINT `content_type_id_refs_id_35f6a172` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `room_id_refs_id_5e69dd53` FOREIGN KEY (`room_id`) REFERENCES `schedule_room` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
