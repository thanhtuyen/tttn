-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mer 02 Janvier 2013 à 07:03
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `tttn`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity_log`
--

CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `activity_date` int(12) NOT NULL,
  `user_id` int(12) unsigned NOT NULL,
  `activity_type` int(4) unsigned NOT NULL,
  `action_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_activity_log2` (`user_id`),
  KEY `FK_activity_log1` (`activity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `activity_log`
--


-- --------------------------------------------------------

--
-- Structure de la table `activity_type`
--

CREATE TABLE IF NOT EXISTS `activity_type` (
  `id` int(4) unsigned NOT NULL,
  `activity_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `activity_type`
--


-- --------------------------------------------------------

--
-- Structure de la table `authassignment`
--

CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `authassignment`
--


-- --------------------------------------------------------

--
-- Structure de la table `authitem`
--

CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `authitem`
--


-- --------------------------------------------------------

--
-- Structure de la table `authitemchild`
--

CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `authitemchild`
--


-- --------------------------------------------------------

--
-- Structure de la table `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (
  `id` int(12) unsigned NOT NULL,
  `probation_start_date` int(12) DEFAULT NULL COMMENT 'probation start date',
  `probation_length` int(2) unsigned DEFAULT NULL,
  `probation_end_date` int(12) DEFAULT NULL COMMENT 'probation end date',
  `contract_start_date` int(12) NOT NULL,
  `contract_length` int(2) NOT NULL,
  `contract_end_date` int(12) NOT NULL,
  `contract_stop_date` int(12) DEFAULT NULL,
  `contract_stop_reason` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contract_status` int(1) NOT NULL DEFAULT '1' COMMENT '1: working; 0: non-working;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `contract`
--


-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `types` int(2) unsigned NOT NULL COMMENT 'Message''s type',
  `status` int(2) NOT NULL COMMENT 'Message''s status',
  `created_date` int(12) NOT NULL,
  `message_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mod_user_id` int(12) unsigned NOT NULL COMMENT 'Receiver',
  `mod_sender_id` int(12) unsigned NOT NULL COMMENT 'Sender',
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Title',
  PRIMARY KEY (`id`),
  KEY `FK_message` (`mod_sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `message`
--


-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `user_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'employee id',
  `user_first_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'first name',
  `user_last_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'last name',
  `user_full_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'full name',
  `user_dob` int(12) NOT NULL COMMENT 'date of birth',
  `user_job_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'job title',
  `user_job_function` enum('Management','Admin','Software','HR','Account') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'job function',
  `user_degree_type` enum('Associates','Diploma/Certificate','Bachelors','Masters','Doctorate','N/A') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'degree type',
  `user_background` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'background of user',
  `user_telephone_number` int(12) unsigned DEFAULT NULL,
  `user_mobile_number` int(12) unsigned DEFAULT NULL,
  `user_home_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_education` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `user_skill` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `user_employment` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `user_avatar` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Avatar',
  `user_cv` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'CV',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `profile`
--


-- --------------------------------------------------------

--
-- Structure de la table `salary`
--

CREATE TABLE IF NOT EXISTS `salary` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `probation_salary` float unsigned DEFAULT NULL,
  `gross_salary` float unsigned DEFAULT NULL,
  `net_salary` float unsigned DEFAULT NULL,
  `petrol_allowance` float unsigned DEFAULT NULL,
  `other_allowance` float unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `salary`
--


-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `user_email` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_lastvisit` int(12) DEFAULT NULL,
  `user_created_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `user_email`, `user_password`, `username`, `user_lastvisit`, `user_created_date`) VALUES
(1, 'tuandeveloper@gmail.com', 'e99a18c428cb38d5f260853678922e03', 'thanhtuan_pj', 1357014305, 1357014287);

-- --------------------------------------------------------

--
-- Structure de la table `vacation`
--

CREATE TABLE IF NOT EXISTS `vacation` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` int(12) NOT NULL,
  `end_date` int(12) NOT NULL,
  `total_date` decimal(4,1) NOT NULL,
  `type` int(2) DEFAULT NULL COMMENT '1:vacation, 2:illness, 3:wedding, 4:bereavement, 5:maternity;',
  `reason` varchar(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(12) unsigned NOT NULL,
  `request_date` int(12) NOT NULL,
  `status` int(2) unsigned DEFAULT '1' COMMENT '1:waiting, 2:request_cancel, 3:accept, 4:cancel, 5:decline;',
  PRIMARY KEY (`id`),
  KEY `FK_vacation` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `vacation`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `FK_activity_log1` FOREIGN KEY (`activity_type`) REFERENCES `activity_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_activity_log2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `authassignment`
--
ALTER TABLE `authassignment`
  ADD CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `authitemchild`
--
ALTER TABLE `authitemchild`
  ADD CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `FK_contract` FOREIGN KEY (`id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_message` FOREIGN KEY (`mod_sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `FK_profile` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `FK_salary` FOREIGN KEY (`id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vacation`
--
ALTER TABLE `vacation`
  ADD CONSTRAINT `FK_vacation` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
