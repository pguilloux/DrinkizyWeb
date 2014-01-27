-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Dim 26 Janvier 2014 à 18:23
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `drinkizy`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_6ba0f519` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add bar', 6, 'add_bar'),
(17, 'Can change bar', 6, 'change_bar'),
(18, 'Can delete bar', 6, 'delete_bar'),
(19, 'Can add opening hours', 7, 'add_openinghours'),
(20, 'Can change opening hours', 7, 'change_openinghours'),
(21, 'Can delete opening hours', 7, 'delete_openinghours'),
(22, 'Can add opening hours bar', 8, 'add_openinghoursbar'),
(23, 'Can change opening hours bar', 8, 'change_openinghoursbar'),
(24, 'Can delete opening hours bar', 8, 'delete_openinghoursbar'),
(25, 'Can add theme', 9, 'add_theme'),
(26, 'Can change theme', 9, 'change_theme'),
(27, 'Can delete theme', 9, 'delete_theme'),
(28, 'Can add drink', 10, 'add_drink'),
(29, 'Can change drink', 10, 'change_drink'),
(30, 'Can delete drink', 10, 'delete_drink'),
(31, 'Can add drink category', 11, 'add_drinkcategory'),
(32, 'Can change drink category', 11, 'change_drinkcategory'),
(33, 'Can delete drink category', 11, 'delete_drinkcategory'),
(34, 'Can add drink sub category', 12, 'add_drinksubcategory'),
(35, 'Can change drink sub category', 12, 'change_drinksubcategory'),
(36, 'Can delete drink sub category', 12, 'delete_drinksubcategory'),
(37, 'Can add drink bar', 13, 'add_drinkbar'),
(38, 'Can change drink bar', 13, 'change_drinkbar'),
(39, 'Can delete drink bar', 13, 'delete_drinkbar'),
(40, 'Can add user', 14, 'add_customuser'),
(41, 'Can change user', 14, 'change_customuser'),
(42, 'Can delete user', 14, 'delete_customuser'),
(43, 'Can add migration history', 15, 'add_migrationhistory'),
(44, 'Can change migration history', 15, 'change_migrationhistory'),
(45, 'Can delete migration history', 15, 'delete_migrationhistory');

-- --------------------------------------------------------

--
-- Structure de la table `bars_bar`
--

CREATE TABLE IF NOT EXISTS `bars_bar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `coordinates` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `approval` int(11) NOT NULL,
  `disapproval` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_id_refs_id_6a053be6` (`theme_id`),
  KEY `creator_id_refs_id_89339927` (`creator_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `bars_bar`
--

INSERT INTO `bars_bar` (`id`, `slug`, `name`, `address`, `coordinates`, `phone`, `approval`, `disapproval`, `picture`, `creator_id`, `theme_id`) VALUES
(1, 'le-beho', 'Le Beho', '8 place Sainte-Opportune 75001 PARIS', '', '01-53-40-81-56; 06-66-19-46-82', 0, 0, 'le-beho.jpg', 1, 1),
(2, 'guinness-tavern', 'Guinness Tavern', '31 rue des Lombards 75001 PARIS', '', '01-42-33-26-45', 0, 0, 'guinness-tavern.jpg', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `bars_openinghours`
--

CREATE TABLE IF NOT EXISTS `bars_openinghours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_hour` int(11) NOT NULL,
  `end_hour` int(11) NOT NULL,
  `start_happy_hour` int(11) NOT NULL,
  `end_happy_hour` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `bars_openinghoursbar`
--

CREATE TABLE IF NOT EXISTS `bars_openinghoursbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bar_id` int(11) NOT NULL,
  `hours_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bar_id_refs_id_27dfbe7d` (`bar_id`),
  KEY `hours_id_refs_id_204c6105` (`hours_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `bars_theme`
--

CREATE TABLE IF NOT EXISTS `bars_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `bars_theme`
--

INSERT INTO `bars_theme` (`id`, `slug`, `name`, `description`) VALUES
(1, 'bars-lounge', 'Bar Lounge', ''),
(2, 'bars-concerts', 'Bar Concerts', ''),
(3, 'bars-a-cocktails', 'Bar à Cocktail', ''),
(4, 'bars-geek', 'Bar Geek', ''),
(5, 'pubs', 'Pub', ''),
(6, 'bars-sportifs', 'Bar Sportif', ''),
(7, 'pubs-irlandais', 'Pub Irlandais', ''),
(8, 'bar-a-bieres', 'Bar à Bières', ''),
(9, 'bars-a-themes', 'Bar à Thèmes', ''),
(10, 'bars-rock', 'Bar Rock', ''),
(11, 'bars-brasserie', 'Bar Brasserie', ''),
(12, 'bars-a-cocktails-et-tapas', 'Bar à Cocktails et Tapas', ''),
(13, 'bars-a-cocktails-moléculaires', 'Bar à Cocktails Moléculaires', '');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
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
  KEY `content_type_id_refs_id_93d2d1f8` (`content_type_id`),
  KEY `user_id_refs_id_ff9a36b6` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
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
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'bar', 'bars', 'bar'),
(7, 'opening hours', 'bars', 'openinghours'),
(8, 'opening hours bar', 'bars', 'openinghoursbar'),
(9, 'theme', 'bars', 'theme'),
(10, 'drink', 'drinks', 'drink'),
(11, 'drink category', 'drinks', 'drinkcategory'),
(12, 'drink sub category', 'drinks', 'drinksubcategory'),
(13, 'drink bar', 'drinks', 'drinkbar'),
(14, 'user', 'users', 'customuser'),
(15, 'migration history', 'south', 'migrationhistory');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `drinks_drink`
--

CREATE TABLE IF NOT EXISTS `drinks_drink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `approval` int(11) NOT NULL,
  `disapproval` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subcategory_id_refs_id_57c0f03b` (`subcategory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `drinks_drink`
--

INSERT INTO `drinks_drink` (`id`, `slug`, `name`, `description`, `approval`, `disapproval`, `subcategory_id`) VALUES
(1, 'bloody-mary', 'Bloody-Mary', '', 0, 0, 10),
(2, 'cosmopolitan', 'Cosmopolitan', '', 0, 0, 10),
(3, 'daïquiri', 'Daïquiri', '', 0, 0, 10),
(4, 'mai-tai', 'Mai Tai', '', 0, 0, 10),
(5, 'mojito', 'Mojito', '', 0, 0, 10),
(6, 'piña-colada', 'Piña Colada', '', 0, 0, 10);

-- --------------------------------------------------------

--
-- Structure de la table `drinks_drinkbar`
--

CREATE TABLE IF NOT EXISTS `drinks_drinkbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `price_happy_hour` double NOT NULL,
  `drink_id` int(11) NOT NULL,
  `bar_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bar_id_refs_id_6a0b1d41` (`bar_id`),
  KEY `drink_id_refs_id_ffaa485a` (`drink_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `drinks_drinkbar`
--

INSERT INTO `drinks_drinkbar` (`id`, `slug`, `price`, `price_happy_hour`, `drink_id`, `bar_id`) VALUES
(1, '', 4, 3, 1, 1),
(2, '', 3, 2.5, 2, 1),
(3, '', 6, 4.5, 1, 2),
(4, '', 5, 4.5, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `drinks_drinkcategory`
--

CREATE TABLE IF NOT EXISTS `drinks_drinkcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `drinks_drinkcategory`
--

INSERT INTO `drinks_drinkcategory` (`id`, `slug`, `name`, `description`) VALUES
(1, 'spiritueux', 'Spiritueux', ''),
(2, 'bières', 'Bières', ''),
(3, 'cocktails-alcoolisés', 'Cocktails Alcoolisés', ''),
(4, 'boissons-lactées', 'Boissons Lactées', ''),
(5, 'boissons-énergisantes', 'Boissons Energisantes', ''),
(6, 'cocktails-sans-alcool', 'Cocktails Sans Alcool', ''),
(7, 'jus', 'Jus', ''),
(8, 'sodas', 'Sodas', ''),
(9, 'boissons-chaudes', 'Boissons Chaudes', '');

-- --------------------------------------------------------

--
-- Structure de la table `drinks_drinksubcategory`
--

CREATE TABLE IF NOT EXISTS `drinks_drinksubcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_refs_id_f7cf3b26` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `drinks_drinksubcategory`
--

INSERT INTO `drinks_drinksubcategory` (`id`, `slug`, `name`, `description`, `category_id`) VALUES
(1, 'alcools-forts', 'Alcools Forts', '', 1),
(2, 'vins', 'Vins', '', 1),
(3, 'champagne', 'Champagne', '', 1),
(4, 'blonde', 'Blonde', '', 2),
(5, 'ambrée', 'Ambrée', '', 2),
(6, 'brune', 'Brune', '', 2),
(7, 'rousse', 'Rousse', '', 2),
(8, 'aromatisée', 'Aromatisée', '', 2),
(9, 'blanche', 'Blanche', '', 2),
(10, 'cocktails-apéritifs', 'Cocktails Apéritifs', '', 3),
(11, 'cocktails-digestifs', 'Cocktails Digestifs', '', 3),
(12, 'long-drink', 'Long Drink', '', 3),
(13, 'milk-shakes', 'Milk-Shakes', '', 4),
(14, 'jus-de-fruits', 'Jus de Fruits', '', 7),
(15, 'smoothie', 'Smoothie', '', 7),
(16, 'colas', 'Colas', '', 8),
(17, 'limonades', 'Limonades', '', 8),
(18, 'diabolos', 'Diabolos', '', 8),
(19, 'sirops', 'Sirops', '', 8),
(20, 'cafés', 'Cafés', '', 9),
(21, 'tisanes', 'Tisanes', '', 9),
(22, 'infusions', 'Infusions', '', 9);

-- --------------------------------------------------------

--
-- Structure de la table `south_migrationhistory`
--

CREATE TABLE IF NOT EXISTS `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `south_migrationhistory`
--

INSERT INTO `south_migrationhistory` (`id`, `app_name`, `migration`, `applied`) VALUES
(1, 'users', '0001_initial', '2014-01-10 17:37:22'),
(2, 'bars', '0001_initial', '2014-01-10 17:37:31'),
(3, 'drinks', '0001_initial', '2014-01-10 17:37:38');

-- --------------------------------------------------------

--
-- Structure de la table `users_customuser`
--

CREATE TABLE IF NOT EXISTS `users_customuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `pseudo` varchar(200) NOT NULL,
  `avatar_url` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users_customuser`
--

INSERT INTO `users_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `pseudo`, `avatar_url`, `type`) VALUES
(1, 'admin', '0000-00-00 00:00:00', 1, 'drinkizy', '', '', '', 1, 1, '0000-00-00 00:00:00', 'drinkizy', '', '1');

-- --------------------------------------------------------

--
-- Structure de la table `users_customuser_groups`
--

CREATE TABLE IF NOT EXISTS `users_customuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customuser_id` (`customuser_id`,`group_id`),
  KEY `group_id_refs_id_6eb7a9ad` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `users_customuser_user_permissions`
--

CREATE TABLE IF NOT EXISTS `users_customuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customuser_id` (`customuser_id`,`permission_id`),
  KEY `permission_id_refs_id_26b8f05c` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `bars_bar`
--
ALTER TABLE `bars_bar`
  ADD CONSTRAINT `creator_id_refs_id_89339927` FOREIGN KEY (`creator_id`) REFERENCES `users_customuser` (`id`),
  ADD CONSTRAINT `theme_id_refs_id_6a053be6` FOREIGN KEY (`theme_id`) REFERENCES `bars_theme` (`id`);

--
-- Contraintes pour la table `bars_openinghoursbar`
--
ALTER TABLE `bars_openinghoursbar`
  ADD CONSTRAINT `bar_id_refs_id_27dfbe7d` FOREIGN KEY (`bar_id`) REFERENCES `bars_bar` (`id`),
  ADD CONSTRAINT `hours_id_refs_id_204c6105` FOREIGN KEY (`hours_id`) REFERENCES `bars_openinghours` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_ff9a36b6` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`);

--
-- Contraintes pour la table `drinks_drink`
--
ALTER TABLE `drinks_drink`
  ADD CONSTRAINT `subcategory_id_refs_id_57c0f03b` FOREIGN KEY (`subcategory_id`) REFERENCES `drinks_drinksubcategory` (`id`);

--
-- Contraintes pour la table `drinks_drinkbar`
--
ALTER TABLE `drinks_drinkbar`
  ADD CONSTRAINT `bar_id_refs_id_6a0b1d41` FOREIGN KEY (`bar_id`) REFERENCES `bars_bar` (`id`),
  ADD CONSTRAINT `drink_id_refs_id_ffaa485a` FOREIGN KEY (`drink_id`) REFERENCES `drinks_drink` (`id`);

--
-- Contraintes pour la table `drinks_drinksubcategory`
--
ALTER TABLE `drinks_drinksubcategory`
  ADD CONSTRAINT `category_id_refs_id_f7cf3b26` FOREIGN KEY (`category_id`) REFERENCES `drinks_drinkcategory` (`id`);

--
-- Contraintes pour la table `users_customuser_groups`
--
ALTER TABLE `users_customuser_groups`
  ADD CONSTRAINT `customuser_id_refs_id_87477e43` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  ADD CONSTRAINT `group_id_refs_id_6eb7a9ad` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `users_customuser_user_permissions`
--
ALTER TABLE `users_customuser_user_permissions`
  ADD CONSTRAINT `customuser_id_refs_id_55fe159d` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_26b8f05c` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
