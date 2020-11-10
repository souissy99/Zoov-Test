-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 11 Novembre 2020 à 00:03
-- Version du serveur :  5.6.17-log
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `zoov`
--

-- --------------------------------------------------------

--
-- Structure de la table `bikes`
--

CREATE TABLE IF NOT EXISTS `bikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(6) NOT NULL,
  `lng` decimal(10,8) NOT NULL,
  `lat` decimal(11,8) NOT NULL,
  `in_order` tinyint(4) NOT NULL,
  `service_status` int(11) NOT NULL,
  `battery_level` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Contenu de la table `bikes`
--

INSERT INTO `bikes` (`id`, `serial_number`, `lng`, `lat`, `in_order`, `service_status`, `battery_level`, `created_at`, `updated_at`) VALUES
(15, 'AZX76B', '2.30082000', '48.75460000', 1, 1, 85, '2020-11-09 18:17:01', '2020-11-09 18:17:01'),
(16, 'P3DB6F', '2.30091000', '48.75440000', 1, 1, 34, '2020-11-09 18:17:01', '2020-11-09 18:17:01'),
(18, 'XVX0IO', '2.32013000', '48.75430000', 1, 1, 0, '2020-11-09 18:17:01', '2020-11-09 18:17:01'),
(19, '22CZPM', '2.32025000', '48.76470000', 1, 3, 78, '2020-11-09 18:17:01', '2020-11-09 18:17:01'),
(20, 'OJBG76', '2.32025000', '48.76470000', 1, 3, 35, '2020-11-09 18:17:01', '2020-11-09 18:17:01'),
(21, 'CPG7EF', '2.37085000', '48.65660000', 1, 1, 100, '2020-11-09 18:17:01', '2020-11-09 18:17:01'),
(22, 'GKEJ2E', '2.37087000', '48.65460000', 1, 1, 14, '2020-11-09 18:17:01', '2020-11-09 18:17:01'),
(23, 'ABKLMN', '2.24344000', '48.77110000', 0, 1, 21, '2020-11-09 18:17:01', '2020-11-09 18:17:01'),
(24, 'JZ345V', '2.43560000', '48.77230000', 1, 2, 54, '2020-11-09 18:17:01', '2020-11-09 18:17:01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
