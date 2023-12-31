-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2023 at 05:12 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `certification_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_adherents`
--

CREATE TABLE IF NOT EXISTS `t_adherents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_bin NOT NULL,
  `post_nom` varchar(255) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date_naissance` datetime NOT NULL,
  `adresse` varchar(255) COLLATE utf8_bin NOT NULL,
  `tel` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `profession` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nom_cours` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `motivation` varchar(255) COLLATE utf8_bin NOT NULL,
  `etude_id` int(11) DEFAULT NULL,
  `niveau_etude_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_adherents_email_unique` (`email`),
  KEY `etude_id` (`etude_id`),
  KEY `niveau_etude_id` (`niveau_etude_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_certifications`
--

CREATE TABLE IF NOT EXISTS `t_certifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_bin NOT NULL,
  `prix_inscription` int(11) NOT NULL,
  `prix_certification` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_certifications_libelle_unique` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_etudes`
--

CREATE TABLE IF NOT EXISTS `t_etudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_etudes_libelle_unique` (`libelle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `t_etudes`
--

INSERT INTO `t_etudes` (`id`, `libelle`) VALUES
(1, 'En cours');

-- --------------------------------------------------------

--
-- Table structure for table `t_inscriptions`
--

CREATE TABLE IF NOT EXISTS `t_inscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `adherent_id` int(11) DEFAULT NULL,
  `tAdherentId` int(11) DEFAULT NULL,
  `certification_id` int(11) DEFAULT NULL,
  `tCertificationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adherent_id` (`adherent_id`),
  KEY `tAdherentId` (`tAdherentId`),
  KEY `certification_id` (`certification_id`),
  KEY `tCertificationId` (`tCertificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_niveau_etudes`
--

CREATE TABLE IF NOT EXISTS `t_niveau_etudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_niveau_etudes_libelle_unique` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_payements`
--

CREATE TABLE IF NOT EXISTS `t_payements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frais_inscription` int(11) DEFAULT NULL,
  `frais_certification` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `inscription_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inscription_id` (`inscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_adherents`
--
ALTER TABLE `t_adherents`
  ADD CONSTRAINT `t_adherents_ibfk_1` FOREIGN KEY (`etude_id`) REFERENCES `t_etudes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `t_adherents_ibfk_2` FOREIGN KEY (`niveau_etude_id`) REFERENCES `t_niveau_etudes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `t_inscriptions`
--
ALTER TABLE `t_inscriptions`
  ADD CONSTRAINT `t_inscriptions_ibfk_1` FOREIGN KEY (`adherent_id`) REFERENCES `t_adherents` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `t_inscriptions_ibfk_2` FOREIGN KEY (`tAdherentId`) REFERENCES `t_adherents` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `t_inscriptions_ibfk_3` FOREIGN KEY (`certification_id`) REFERENCES `t_certifications` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `t_inscriptions_ibfk_4` FOREIGN KEY (`tCertificationId`) REFERENCES `t_certifications` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `t_payements`
--
ALTER TABLE `t_payements`
  ADD CONSTRAINT `t_payements_ibfk_1` FOREIGN KEY (`inscription_id`) REFERENCES `t_inscriptions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Database: `students`
--

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

CREATE TABLE IF NOT EXISTS `etudiants` (
  `matricule` varchar(7) COLLATE utf8_bin NOT NULL,
  `nom` varchar(25) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(25) COLLATE utf8_bin NOT NULL,
  `promotion` varchar(10) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `genre` char(1) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

--
-- Dumping data for table `etudiants`
--

INSERT INTO `etudiants` (`matricule`, `nom`, `prenom`, `promotion`, `email`, `genre`, `id`) VALUES
('20AM001', 'Adirodu', 'Richard', 'L4 DSG', '20am001@esisalama.org', 'M', 19);
--
-- Database: `test`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
