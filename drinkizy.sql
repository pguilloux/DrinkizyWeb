-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Mar 04 Février 2014 à 00:40
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

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
(45, 'Can delete migration history', 15, 'delete_migrationhistory'),
(46, 'Can add station', 16, 'add_station'),
(47, 'Can change station', 16, 'change_station'),
(48, 'Can delete station', 16, 'delete_station'),
(49, 'Can add slider', 17, 'add_slider'),
(50, 'Can change slider', 17, 'change_slider'),
(51, 'Can delete slider', 17, 'delete_slider');

-- --------------------------------------------------------

--
-- Structure de la table `bars_bar`
--

CREATE TABLE IF NOT EXISTS `bars_bar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(200),
  `approval` int(11) NOT NULL,
  `disapproval` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  `website` varchar(200),
  `nb_pictures` int(11) NOT NULL,
  `latitude` double,
  `longitude` double,
  PRIMARY KEY (`id`),
  KEY `theme_id_refs_id_6a053be6` (`theme_id`),
  KEY `creator_id_refs_id_89339927` (`creator_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `bars_bar`
--

INSERT INTO `bars_bar` (`id`, `slug`, `name`, `address`, `phone`, `approval`, `disapproval`, `creator_id`, `theme_id`, `website`, `nb_pictures`, `latitude`, `longitude`) VALUES
(1, 'le-beho', 'Le Beho', '8 place Sainte-Opportune 75001 PARIS', '01-53-40-81-56; 06-66-19-46-82', 0, 0, 1, 1, 'http://www.lebeho.fr', 1, 48.859788, 2.347328),
(2, 'guinness-tavern', 'Guinness Tavern', '31 rue des Lombards 75001 PARIS', '01-42-33-26-45', 0, 0, 1, 2, 'http://www.guinness-tavern.com', 1, 48.859929, 2.348517),
(3, 'la-fine-mousse', 'La Fine Mousse', '6 avenue Jean Aicard 75011 PARIS', '09-80-45-94-64', 0, 0, 1, 8, 'http://www.lafinemousse.fr', 1, 48.865032, 2.381778),
(4, 'nimporte-quoi', 'N''importe quoi', '16 rue du Roule 75001 PARIS', '01-40-26-29-71', 0, 0, 1, 3, 'http://www.nimportequoi.fr', 1, 48.860925, 2.343863),
(5, 'le-dernier-bar-avant-la-fin-du-monde', 'Le dernier bar avant la fin du monde', '19 avenue Victoria 75001 PARIS', '01-53-00-98-95', 0, 0, 1, 4, 'http://www.dernierbar.com', 1, 48.857953, 2.346277);

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
-- Structure de la table `bars_station`
--

CREATE TABLE IF NOT EXISTS `bars_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `district` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `lines_numbers` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=484 ;

--
-- Contenu de la table `bars_station`
--

INSERT INTO `bars_station` (`id`, `name`, `city`, `district`, `type`, `latitude`, `longitude`, `lines_numbers`) VALUES
(1, 'Abbesses', 'PARIS', '18EME', 'metro', 48.8844176451841, 2.33871281165883, '12'),
(2, 'Alésia', 'PARIS', '14EME', 'metro', 48.828398514348, 2.32674567371924, '4'),
(3, 'Alexandre-Dumas', 'PARIS', '11EME', 'metro', 48.8561744489676, 2.3949898158233, '2'),
(4, 'Alma-Marceau', 'PARIS', '16EME', 'metro', 48.8646460306735, 2.30088336611718, '9'),
(5, 'Anatole-France', 'LEVALLOIS-PERRET', '', 'metro', 48.8924723754181, 2.285373878396, '3'),
(6, 'Antony', 'ANTONY', '', 'metro', 48.7547197227554, 2.30131372490699, 'ORV'),
(7, 'Anvers', 'PARIS', '18EME', 'metro', 48.8831322902739, 2.34397282520569, '2'),
(8, 'Argentine', 'PARIS', '17EME', 'metro', 48.875533092935, 2.2893216639617, '1'),
(9, 'Arts-et-Métiers', 'PARIS', '03EME', 'metro', 48.8652929436681, 2.35637778086357, '11, 3'),
(10, 'Asnieres-Gennevilliers Les Courtilles', 'ASNIERES-SUR-SEINE', '', 'metro', 48.9301634125573, 2.28407447167184, '13'),
(11, 'Assemblée Nationale', 'PARIS', '07EME', 'metro', 48.8608996856827, 2.32063223779825, '12'),
(12, 'Aubervilliers Pantin (4 Chemins)', 'AUBERVILLIERS', '', 'metro', 48.9038299162483, 2.3920219501423, '7'),
(13, 'Avenue Emile-Zola', 'PARIS', '15EME', 'metro', 48.8469642745973, 2.29493807524416, '10'),
(14, 'Avron', 'PARIS', '11EME', 'metro', 48.8509782113622, 2.39798013009568, '2'),
(15, 'Balard', 'PARIS', '15EME', 'metro', 48.8362754634973, 2.27821832700082, '8'),
(16, 'Barbès-Rochechouart', 'PARIS', '09EME', 'metro', 48.8836207315381, 2.34973719426844, '2, 4'),
(17, 'Basilique de Saint-Denis', 'SAINT-DENIS', '', 'metro', 48.9366033097107, 2.35941471750625, '13'),
(18, 'Bastille', 'PARIS', '04EME', 'metro', 48.8528417309667, 2.36918060506559, '1, 5, 8'),
(19, 'Bel-Air', 'PARIS', '12EME', 'metro', 48.8418961424237, 2.40120562705964, '6'),
(20, 'Belleville', 'PARIS', '19EME', 'metro', 48.8720416041714, 2.37680560769084, '11, 2'),
(21, 'Bérault', 'VINCENNES', '', 'metro', 48.8453342425325, 2.42923849792977, '1'),
(22, 'Bercy', 'PARIS', '12EME', 'metro', 48.8404280893475, 2.37958296880394, '14, 6'),
(23, 'Bibliotheque-Francois Mitterrand', 'PARIS', '13EME', 'metro', 48.8296059726948, 2.3760926116913, '14'),
(24, 'Billancourt', 'BOULOGNE-BILLANCOURT', '', 'metro', 48.8319437593265, 2.23810999708736, '9'),
(25, 'Bir-Hakeim (Grenelle)', 'PARIS', '15EME', 'metro', 48.8543331586284, 2.28878285580103, '6'),
(26, 'Blanche', 'PARIS', '18EME', 'metro', 48.8836536085134, 2.33166752315741, '2'),
(27, 'Bobigny-Pablo-Picasso', 'BOBIGNY', '', 'metro', 48.9069699442981, 2.44962071744096, '5'),
(28, 'Bobigny-Pantin (Raymond Queneau)', 'BOBIGNY', '', 'metro', 48.8952689905167, 2.42480187771966, '5'),
(29, 'Boissière', 'PARIS', '16EME', 'metro', 48.8670270457182, 2.29047384540453, '6'),
(30, 'Bolivar', 'PARIS', '19EME', 'metro', 48.8805834299155, 2.37397783298056, '7B'),
(31, 'Bonne Nouvelle', 'PARIS', '09EME', 'metro', 48.8705587205312, 2.34867956971335, '8, 9'),
(32, 'Botzaris', 'PARIS', '19EME', 'metro', 48.8793377265439, 2.38873399145736, '7B'),
(33, 'Boucicaut', 'PARIS', '15EME', 'metro', 48.8412408953716, 2.28763431751091, '8'),
(34, 'Boulogne-Jean-Jaurès', 'BOULOGNE-BILLANCOURT', '', 'metro', 48.8422216612984, 2.23883585019659, '10'),
(35, 'Boulogne Pont de Saint-Cloud', 'BOULOGNE-BILLANCOURT', '', 'metro', 48.8407983651067, 2.22821129036639, '10'),
(36, 'Bourse', 'PARIS', '02EME', 'metro', 48.8687976838596, 2.34123268333609, '3'),
(37, 'Bréguet-Sabin', 'PARIS', '11EME', 'metro', 48.8565162145681, 2.3709371333348, '5'),
(38, 'Brochant', 'PARIS', '17EME', 'metro', 48.8903794211931, 2.32002765158099, '13'),
(39, 'Buttes-Chaumont', 'PARIS', '19EME', 'metro', 48.8777769835483, 2.38112931956877, '7B'),
(40, 'Buzenval', 'PARIS', '20EME', 'metro', 48.8517360615634, 2.40102482535231, '9'),
(41, 'Cadet', 'PARIS', '09EME', 'metro', 48.875475187116, 2.34305895381275, '7'),
(42, 'Cambronne', 'PARIS', '15EME', 'metro', 48.8474563362776, 2.30180780419231, '6'),
(43, 'Campo-Formio', 'PARIS', '13EME', 'metro', 48.8357759721732, 2.35815314107711, '5'),
(44, 'Cardinal-Lemoine', 'PARIS', '05EME', 'metro', 48.8463912485782, 2.35147807315592, '10'),
(45, 'Carrefour-Pleyel', 'SAINT-DENIS', '', 'metro', 48.9194552102366, 2.34320024908898, '13'),
(46, 'Censier-Daubenton', 'PARIS', '05EME', 'metro', 48.8405358795008, 2.35142881208972, '7'),
(47, 'Champs-Elysées-Clémenceau', 'PARIS', '08EME', 'metro', 48.8674114214171, 2.31395945009909, '13, 1'),
(48, 'Chardon-Lagache', 'PARIS', '16EME', 'metro', 48.8447174018404, 2.26654168725371, '10'),
(49, 'Charenton-Ecoles', 'CHARENTON-LE-PONT', '', 'metro', 48.8213638104296, 2.41407434683562, '8'),
(50, 'Charles de Gaulle-Etoile', 'PARIS', '08EME', 'metro', 48.8744076036607, 2.29576268465124, '1, 2, 6'),
(51, 'Charles Michels', 'PARIS', '15EME', 'metro', 48.8463362741362, 2.28633238561987, '10'),
(52, 'Charonne', 'PARIS', '11EME', 'metro', 48.8547662368488, 2.38527064781972, '9'),
(53, 'Château d''Eau', 'PARIS', '10EME', 'metro', 48.8725890109106, 2.35547036877069, '4'),
(54, 'Château de Vincennes', 'VINCENNES', '', 'metro', 48.8445363116503, 2.43950970545674, '1'),
(55, 'Château Landon', 'PARIS', '10EME', 'metro', 48.8783126784077, 2.36229890860251, '7'),
(56, 'Château Rouge', 'PARIS', '18EME', 'metro', 48.8871760670966, 2.34982663344309, '4'),
(57, 'Châtelet', 'PARIS', '01ER', 'metro', 48.8585195224421, 2.34711940104793, '11, 14, 1, 4, 7'),
(58, 'Châtillon Montrouge', 'CHATILLON', '', 'metro', 48.8103147675511, 2.30124802198432, '13'),
(59, 'Chaussée d''Antin (La Fayette)', 'PARIS', '09EME', 'metro', 48.8728970365659, 2.33350116136944, '7, 9'),
(60, 'Chemin Vert', 'PARIS', '03EME', 'metro', 48.8575640614859, 2.36793452563335, '8'),
(61, 'Chevaleret', 'PARIS', '13EME', 'metro', 48.8344079354527, 2.36716524071823, '6'),
(62, 'Cité', 'PARIS', '04EME', 'metro', 48.8551005857888, 2.3467203742446, '4'),
(63, 'Cluny-La Sorbonne', 'PARIS', '05EME', 'metro', 48.8510383641319, 2.34522158237992, '10'),
(64, 'Colonel Fabien', 'PARIS', '10EME', 'metro', 48.8779422921331, 2.37014713779616, '2'),
(65, 'Commerce', 'PARIS', '15EME', 'metro', 48.844811191807, 2.29335345012085, '8'),
(66, 'Concorde', 'PARIS', '08EME', 'metro', 48.8661829956315, 2.32329987859148, '12, 1, 8'),
(67, 'Convention', 'PARIS', '15EME', 'metro', 48.8374696207371, 2.29689958279762, '12'),
(68, 'Corentin-Cariou', 'PARIS', '19EME', 'metro', 48.8949061258374, 2.38244550268222, '7'),
(69, 'Corentin-Celton', 'ISSY-LES-MOULINEAUX', '', 'metro', 48.8272434444069, 2.27930670368976, '12'),
(70, 'Corvisart', 'PARIS', '13EME', 'metro', 48.8296116848646, 2.34943832730731, '6'),
(71, 'Courcelles', 'PARIS', '08EME', 'metro', 48.8792362487704, 2.30360515293852, '2'),
(72, 'Couronnes', 'PARIS', '11EME', 'metro', 48.8689698757764, 2.379868518699, '2'),
(73, 'Cour Saint-Emilion', 'PARIS', '12EME', 'metro', 48.8334843071503, 2.38761298844824, '14'),
(74, 'Créteil-L''Echat (Hôpital Henri Mondor)', 'CRETEIL', '', 'metro', 48.7964623870188, 2.44906187102647, '8'),
(75, 'Créteil-Préfecture (Hôtel de Ville)', 'CRETEIL', '', 'metro', 48.7797484034104, 2.45914426746537, '8'),
(76, 'Créteil-Université', 'CRETEIL', '', 'metro', 48.7893506910917, 2.45144739751129, '8'),
(77, 'Crimée', 'PARIS', '19EME', 'metro', 48.8906811628606, 2.37681528947191, '7'),
(78, 'Croix-de-Chavaux (Jacques Duclos)', 'MONTREUIL', '', 'metro', 48.8579269412394, 2.43609830308268, '9'),
(79, 'Danube', 'PARIS', '19EME', 'metro', 48.8820231366362, 2.39270205235331, '7B'),
(80, 'Daumesnil (Félix Eboué)', 'PARIS', '12EME', 'metro', 48.8393629125482, 2.39584590805199, '6, 8'),
(81, 'Denfert-Rochereau', 'PARIS', '14EME', 'metro', 48.8335919035577, 2.33189346001924, '4, 6'),
(82, 'Dugommier', 'PARIS', '12EME', 'metro', 48.8389122332307, 2.38895257216093, '6'),
(83, 'Dupleix', 'PARIS', '15EME', 'metro', 48.8508056365633, 2.29276958714394, '6'),
(84, 'Duroc', 'PARIS', '07EME', 'metro', 48.8467835319339, 2.31672285703746, '10, 13'),
(85, 'Ecole Militaire', 'PARIS', '07EME', 'metro', 48.8545185491092, 2.30554381620113, '8'),
(86, 'Ecole Vétérinaire de Maisons-Alfort', 'MAISONS-ALFORT', '', 'metro', 48.8151517942859, 2.42075635931134, '8'),
(87, 'Edgar-Quinet', 'PARIS', '14EME', 'metro', 48.8403339877984, 2.3261713916465, '6'),
(88, 'Eglise d''Auteuil', 'PARIS', '16EME', 'metro', 48.8471813581933, 2.26890098784783, '10'),
(89, 'Eglise de Pantin', 'PANTIN', '', 'metro', 48.893113981741, 2.41328568033304, '5'),
(90, 'Esplanade de la Défense', 'PUTEAUX', '', 'metro', 48.887843122138, 2.25044232471862, '1'),
(91, 'Etienne Marcel', 'PARIS', '01ER', 'metro', 48.8634946589771, 2.34866984004444, '4'),
(92, 'Europe', 'PARIS', '08EME', 'metro', 48.8787098768874, 2.32282484061213, '3'),
(93, 'Exelmans', 'PARIS', '16EME', 'metro', 48.8424273379119, 2.25973661579821, '9'),
(94, 'Faidherbe-Chaligny', 'PARIS', '11EME', 'metro', 48.8502384503521, 2.38427458098634, '8'),
(95, 'Falguière', 'PARIS', '15EME', 'metro', 48.844637894177, 2.31749646866691, '12'),
(96, 'Félix Faure', 'PARIS', '15EME', 'metro', 48.8429772288922, 2.29199788779218, '8'),
(97, 'Filles du Calvaire', 'PARIS', '03EME', 'metro', 48.8633028923386, 2.36645313804373, '8'),
(98, 'Fort d''Aubervilliers', 'AUBERVILLIERS', '', 'metro', 48.9146921997335, 2.40417710143886, '7'),
(99, 'Franklin-Roosevelt', 'PARIS', '08EME', 'metro', 48.8693052286485, 2.30830876451203, '1, 9'),
(100, 'Front Populaire', 'AUBERVILLIERS', '', 'metro', 48.9065795187205, 2.36587539174522, '12'),
(101, 'Funiculaire Gare basse', 'PARIS', '18EME', 'metro', 48.8844354700414, 2.34340064272908, 'FUN'),
(102, 'Funiculaire Gare haute', 'PARIS', '18EME', 'metro', 48.8856217864643, 2.34334627251386, 'FUN'),
(103, 'Gabriel-Péri', 'ASNIERES-SUR-SEINE', '', 'metro', 48.9162335021232, 2.29492376422254, '13'),
(104, 'Gaité', 'PARIS', '14EME', 'metro', 48.8384911503461, 2.32258277982791, '13'),
(105, 'Gallieni (Parc de Bagnolet)', 'BAGNOLET', '', 'metro', 48.8633345779424, 2.41568260426712, '3'),
(106, 'Gambetta', 'PARIS', '20EME', 'metro', 48.8648347782704, 2.39846223866212, '3B, 3'),
(107, 'Gare d''Austerlitz', 'PARIS', '13EME', 'metro', 48.8431055835176, 2.36431304821499, '10, 5'),
(108, 'Gare de l''Est (Verdun)', 'PARIS', '10EME', 'metro', 48.8760613055252, 2.35791867724751, '4, 5, 7'),
(109, 'Gare de Lyon', 'PARIS', '12EME', 'metro', 48.8447045450658, 2.37406590751466, '14, 1'),
(110, 'Gare du Nord', 'PARIS', '10EME', 'metro', 48.8799654432891, 2.35470307836603, '4, 5'),
(111, 'Garibaldi', 'SAINT-OUEN', '', 'metro', 48.9060316197727, 2.33173327604333, '13'),
(112, 'George V', 'PARIS', '08EME', 'metro', 48.8719825731694, 2.30046268343343, '1'),
(113, 'Glacière', 'PARIS', '13EME', 'metro', 48.8313647071449, 2.34393889430969, '6'),
(114, 'Goncourt (Hôpital Saint-Louis)', 'PARIS', '10EME', 'metro', 48.8696803933807, 2.3712726500969, '11'),
(115, 'Grands Boulevards', 'PARIS', '09EME', 'metro', 48.8714189081641, 2.34319701067138, '8, 9'),
(116, 'Guy-Môquet', 'PARIS', '18EME', 'metro', 48.8924675161233, 2.32722675495985, '13'),
(117, 'Havre-Caumartin', 'PARIS', '09EME', 'metro', 48.8733427700542, 2.3285077502868, '3, 9'),
(118, 'Hoche', 'PANTIN', '', 'metro', 48.8913165639098, 2.40319741378238, '5'),
(119, 'Hôtel de Ville', 'PARIS', '04EME', 'metro', 48.8567695272423, 2.35149453979435, '11, 1'),
(120, 'Iéna', 'PARIS', '16EME', 'metro', 48.8644728974464, 2.2937999591139, '9'),
(121, 'Invalides', 'PARIS', '07EME', 'metro', 48.8616865404563, 2.31435704324728, '13, 8'),
(122, 'Jacques-Bonsergent', 'PARIS', '10EME', 'metro', 48.8709749040173, 2.36053788394075, '5'),
(123, 'Jasmin', 'PARIS', '16EME', 'metro', 48.8523396005309, 2.26790681383725, '9'),
(124, 'Jaurès', 'PARIS', '19EME', 'metro', 48.8825437461168, 2.37023181919226, '2, 5, 7B'),
(125, 'Javel-André-Citroen', 'PARIS', '15EME', 'metro', 48.8461034637876, 2.27845497841475, '10'),
(126, 'Jourdain', 'PARIS', '20EME', 'metro', 48.8751674276782, 2.38919309981893, '11'),
(127, 'Jules Joffrin', 'PARIS', '18EME', 'metro', 48.8924519921638, 2.34446469630622, '12'),
(128, 'Jussieu', 'PARIS', '05EME', 'metro', 48.8458380895278, 2.35469159842714, '10, 7'),
(129, 'Kléber', 'PARIS', '16EME', 'metro', 48.8710948130145, 2.29307915421584, '6'),
(130, 'La Chapelle', 'PARIS', '10EME', 'metro', 48.8839663987791, 2.35849962591676, '2'),
(131, 'La Courneuve-8-Mai-1945', 'LA COURNEUVE', '', 'metro', 48.9209043594324, 2.41045542691904, '7'),
(132, 'La Défense (Grande Arche)', 'PUTEAUX', '', 'metro', 48.8919344692345, 2.23788279833084, '1'),
(133, 'La Fourche', 'PARIS', '17EME', 'metro', 48.8873918956469, 2.32603867708385, '13'),
(134, 'Lamarck-Caulaincourt', 'PARIS', '18EME', 'metro', 48.8897560451806, 2.33889013654466, '12'),
(135, 'La Motte-Picquet-Grenelle', 'PARIS', '15EME', 'metro', 48.8491605024288, 2.29794929910712, '10, 6, 8'),
(136, 'La Muette', 'PARIS', '16EME', 'metro', 48.8579377398982, 2.27411706697758, '9'),
(137, 'La Tour-Maubourg', 'PARIS', '07EME', 'metro', 48.8573850541664, 2.30959864479432, '8'),
(138, 'Laumière', 'PARIS', '19EME', 'metro', 48.8850422338428, 2.3795955531979, '5'),
(139, 'Ledru-Rollin', 'PARIS', '12EME', 'metro', 48.8511941201646, 2.37594535235887, '8'),
(140, 'Le Kremlin-Bicêtre', 'LE KREMLIN-BICETRE', '', 'metro', 48.8103806352167, 2.36161295005801, '7'),
(141, 'Le Peletier', 'PARIS', '09EME', 'metro', 48.8749360634737, 2.33980253815072, '7'),
(142, 'Les Agnettes', 'ASNIERES-SUR-SEINE', '', 'metro', 48.9229162320519, 2.28582751788663, '13'),
(143, 'Les Gobelins', 'PARIS', '13EME', 'metro', 48.8366105352574, 2.35164217355525, '7'),
(144, 'Les Halles', 'PARIS', '01ER', 'metro', 48.862194721152, 2.34583626729201, '4'),
(145, 'Les Sablons (Jardin d''acclimatation)', 'NEUILLY-SUR-SEINE', '', 'metro', 48.880901799077, 2.27253908542214, '1'),
(146, 'Liberté', 'CHARENTON-LE-PONT', '', 'metro', 48.8258380800419, 2.40692557755493, '8'),
(147, 'Liège', 'PARIS', '08EME', 'metro', 48.8795640572124, 2.32651728518985, '13'),
(148, 'Louis Blanc', 'PARIS', '10EME', 'metro', 48.8810261029957, 2.3655569576092, '7B, 7'),
(149, 'Louise Michel', 'LEVALLOIS-PERRET', '', 'metro', 48.8888292427619, 2.28813731087893, '3'),
(150, 'Lourmel', 'PARIS', '15EME', 'metro', 48.8384881095778, 2.28175852328733, '8'),
(151, 'Louvre-Rivoli', 'PARIS', '01ER', 'metro', 48.8605382946574, 2.34100049025543, '1'),
(152, 'Mabillon', 'PARIS', '06EME', 'metro', 48.8528181349058, 2.33540928887416, '10'),
(153, 'Madeleine', 'PARIS', '08EME', 'metro', 48.8700643517776, 2.32516370025939, '12, 14, 8'),
(154, 'Mairie de Clichy', 'CLICHY', '', 'metro', 48.9036594416322, 2.30556600125528, '13'),
(155, 'Mairie de Montreuil', 'MONTREUIL', '', 'metro', 48.8623601850863, 2.44165620310216, '9'),
(156, 'Mairie de Montrouge', 'MONTROUGE', '', 'metro', 48.8180648291392, 2.31953674036336, '4'),
(157, 'Mairie de Saint-Ouen', 'SAINT-OUEN', '', 'metro', 48.9120620157054, 2.334163015407, '13'),
(158, 'Mairie des Lilas', 'LES LILAS', '', 'metro', 48.8797989953663, 2.41623893515656, '11'),
(159, 'Mairie d''Issy', 'ISSY-LES-MOULINEAUX', '', 'metro', 48.8248138108686, 2.27350399984748, '12'),
(160, 'Mairie d''Ivry', 'IVRY-SUR-SEINE', '', 'metro', 48.8111784269088, 2.3838082733405, '7'),
(161, 'Maison Blanche', 'PARIS', '13EME', 'metro', 48.8226203194274, 2.35818867672494, '7'),
(162, 'Maisons-Alfort-Les Juilliottes', 'MAISONS-ALFORT', '', 'metro', 48.8031418697523, 2.44499102669377, '8'),
(163, 'Maisons-Alfort-Stade', 'MAISONS-ALFORT', '', 'metro', 48.8084176209203, 2.43558220356454, '8'),
(164, 'Malakoff-Plateau de Vanves', 'CHATILLON', '', 'metro', 48.8231314024501, 2.29701508516275, '13'),
(165, 'Malakoff-Rue Etienne Dolet', 'CHATILLON', '', 'metro', 48.8146679725106, 2.29699896350216, '13'),
(166, 'Malesherbes', 'PARIS', '17EME', 'metro', 48.8828147397743, 2.30969409432085, '3'),
(167, 'Maraichers', 'PARIS', '20EME', 'metro', 48.8526633633247, 2.40623072117296, '9'),
(168, 'Marcadet-Poissonniers', 'PARIS', '18EME', 'metro', 48.8908769929214, 2.34983707163005, '12, 4'),
(169, 'Marcel Sembat', 'BOULOGNE-BILLANCOURT', '', 'metro', 48.8339143013551, 2.24408138825371, '9'),
(170, 'Marx-Dormoy', 'PARIS', '18EME', 'metro', 48.8903020649568, 2.36020584275635, '12'),
(171, 'Maubert-Mutualité', 'PARIS', '05EME', 'metro', 48.8499086726722, 2.34850342965795, '10'),
(172, 'Ménilmontant', 'PARIS', '11EME', 'metro', 48.8659488111593, 2.38339427851543, '2'),
(173, 'Michel-Ange-Auteuil', 'PARIS', '16EME', 'metro', 48.8477403459598, 2.2642974417474, '10, 9'),
(174, 'Michel-Ange-Molitor', 'PARIS', '16EME', 'metro', 48.844867436543, 2.26204786419272, '10, 9'),
(175, 'Michel Bizot', 'PARIS', '12EME', 'metro', 48.8367033669766, 2.40296916119538, '8'),
(176, 'Mirabeau', 'PARIS', '16EME', 'metro', 48.8473396417237, 2.27340595925819, '10'),
(177, 'Miromesnil', 'PARIS', '08EME', 'metro', 48.8737063841262, 2.31519918493339, '13, 9'),
(178, 'Monceau', 'PARIS', '08EME', 'metro', 48.8806306676395, 2.30896624223491, '2'),
(179, 'Montgallet', 'PARIS', '12EME', 'metro', 48.8442504626131, 2.38980213751236, '8'),
(180, 'Montparnasse-Bienvenue', 'PARIS', '14EME', 'metro', 48.8430428502558, 2.32263505064878, '12, 13, 4, 6'),
(181, 'Mouton-Duvernet', 'PARIS', '14EME', 'metro', 48.8313196995984, 2.32942693483694, '4'),
(182, 'Nation', 'PARIS', '12EME', 'metro', 48.8484657505532, 2.39590574456544, '1, 2, 6, 9'),
(183, 'Nationale', 'PARIS', '13EME', 'metro', 48.8327104551183, 2.36204546183122, '6'),
(184, 'Notre-Dame de Lorette', 'PARIS', '09EME', 'metro', 48.8766256956919, 2.33845371043763, '12'),
(185, 'Notre-Dame des Champs', 'PARIS', '06EME', 'metro', 48.8449178498434, 2.32885296806704, '12'),
(186, 'Oberkampf', 'PARIS', '11EME', 'metro', 48.8645156235565, 2.36867423637139, '5, 9'),
(187, 'Odéon', 'PARIS', '06EME', 'metro', 48.8522489363668, 2.33855755868422, '10, 4'),
(188, 'Olympiades', 'PARIS', '13EME', 'metro', 48.8268582996999, 2.36729701204889, '14'),
(189, 'Opéra', 'PARIS', '09EME', 'metro', 48.8707029411588, 2.33180515640395, '3, 7, 8'),
(190, 'Orly-Ouest', 'ORLY', '', 'metro', 48.728513469933, 2.35872141880901, 'ORV'),
(191, 'Orly-Sud', 'ORLY', '', 'metro', 48.727837315206, 2.36795987285204, 'ORV'),
(192, 'Ourcq', 'PARIS', '19EME', 'metro', 48.8869750227319, 2.38602958795485, '5'),
(193, 'Palais-Royal (Musée du Louvre)', 'PARIS', '01ER', 'metro', 48.8628468213553, 2.33581661194832, '1, 7'),
(194, 'Parmentier', 'PARIS', '11EME', 'metro', 48.8651606067898, 2.37584679468414, '3'),
(195, 'Passy', 'PARIS', '16EME', 'metro', 48.8576333212361, 2.28586501138629, '6'),
(196, 'Pasteur', 'PARIS', '15EME', 'metro', 48.8429383503106, 2.31265644504969, '12, 6'),
(197, 'Pelleport', 'PARIS', '20EME', 'metro', 48.868519874537, 2.40135199013901, '3B'),
(198, 'Péreire', 'PARIS', '17EME', 'metro', 48.8845503317922, 2.29751704870328, '3'),
(199, 'Père-Lachaise', 'PARIS', '11EME', 'metro', 48.8626131584417, 2.38672181193918, '2, 3'),
(200, 'Pernéty', 'PARIS', '14EME', 'metro', 48.8338169001883, 2.31766395823272, '13'),
(201, 'Philippe Auguste', 'PARIS', '11EME', 'metro', 48.8583654720925, 2.38938739145325, '2'),
(202, 'Picpus', 'PARIS', '12EME', 'metro', 48.8452604478542, 2.40125516453104, '6'),
(203, 'Pierre et Marie Curie', 'IVRY-SUR-SEINE', '', 'metro', 48.8156836605119, 2.3772866229916, '7'),
(204, 'Pigalle', 'PARIS', '18EME', 'metro', 48.8824943850352, 2.3376226051814, '12, 2'),
(205, 'Place de Clichy', 'PARIS', '09EME', 'metro', 48.8836233671973, 2.32730682210246, '13, 2'),
(206, 'Place des Fêtes', 'PARIS', '19EME', 'metro', 48.8768191471423, 2.39347313514395, '11, 7B'),
(207, 'Place d''Italie', 'PARIS', '13EME', 'metro', 48.8314061535553, 2.35572137338498, '5, 6, 7'),
(208, 'Place Monge (Jardin des Plantes)', 'PARIS', '05EME', 'metro', 48.8431960998294, 2.35217845099659, '7'),
(209, 'Plaisance', 'PARIS', '14EME', 'metro', 48.8317625860832, 2.31406734480211, '13'),
(210, 'Pointe du Lac', 'CRETEIL', '', 'metro', 48.7679578710506, 2.46598982922341, '8'),
(211, 'Poissonnière', 'PARIS', '10EME', 'metro', 48.8773395505122, 2.34960623902438, '7'),
(212, 'Pont de Levallois-Bécon', 'LEVALLOIS-PERRET', '', 'metro', 48.8971187551468, 2.28048941733931, '3'),
(213, 'Pont de Neuilly', 'NEUILLY-SUR-SEINE', '', 'metro', 48.8845093796136, 2.25989172465632, '1'),
(214, 'Pont de Sèvres', 'BOULOGNE-BILLANCOURT', '', 'metro', 48.8295929841028, 2.23025364790437, '9'),
(215, 'Pont Marie (Cité des Arts)', 'PARIS', '04EME', 'metro', 48.8533107454827, 2.35745881597611, '7'),
(216, 'Pont Neuf', 'PARIS', '01ER', 'metro', 48.8584022524727, 2.34194923634659, '7'),
(217, 'Porte Dauphine (Maréchal de Lattre de Tassigny)', 'PARIS', '16EME', 'metro', 48.8716448024995, 2.2766480745793, '2'),
(218, 'Porte d''Auteuil', 'PARIS', '16EME', 'metro', 48.8480737822692, 2.25864782764785, '10'),
(219, 'Porte de Bagnolet', 'PARIS', '20EME', 'metro', 48.8643963044636, 2.40799995272687, '3'),
(220, 'Porte de Champerret', 'PARIS', '17EME', 'metro', 48.8855507197363, 2.29274204135011, '3'),
(221, 'Porte de Charenton', 'PARIS', '12EME', 'metro', 48.8325258939597, 2.39970109937032, '8'),
(222, 'Porte de Choisy', 'PARIS', '13EME', 'metro', 48.8201452157747, 2.36434644526859, '7'),
(223, 'Porte de Clichy', 'PARIS', '17EME', 'metro', 48.8943611610735, 2.31373834378485, '13'),
(224, 'Porte de Clignancourt', 'PARIS', '18EME', 'metro', 48.8972870603971, 2.34477887737988, '4'),
(225, 'Porte de la Chapelle', 'PARIS', '18EME', 'metro', 48.8980716716703, 2.35909154194382, '12'),
(226, 'Porte de la Villette', 'PARIS', '19EME', 'metro', 48.8978102190581, 2.38580611263705, '7'),
(227, 'Porte de Montreuil', 'PARIS', '20EME', 'metro', 48.8534495044418, 2.41043444867178, '9'),
(228, 'Porte de Pantin', 'PARIS', '19EME', 'metro', 48.8883327364608, 2.39146861403051, '5'),
(229, 'Porte de Saint-Cloud', 'PARIS', '16EME', 'metro', 48.8378883866228, 2.25680251499702, '9'),
(230, 'Porte de Saint-Ouen', 'PARIS', '18EME', 'metro', 48.8972510523147, 2.32883766969025, '13'),
(231, 'Porte des Lilas', 'PARIS', '20EME', 'metro', 48.8770699912197, 2.40638582344912, '11, 3B'),
(232, 'Porte de Vanves', 'PARIS', '14EME', 'metro', 48.8276756893336, 2.30534014881766, '13'),
(233, 'Porte de Versailles', 'PARIS', '15EME', 'metro', 48.8324619819728, 2.28800279639373, '12'),
(234, 'Porte de Vincennes', 'PARIS', '20EME', 'metro', 48.8472657113718, 2.40888352534985, '1'),
(235, 'Porte d''Italie', 'PARIS', '13EME', 'metro', 48.8189346110715, 2.35985580265649, '7'),
(236, 'Porte d''Ivry', 'PARIS', '13EME', 'metro', 48.8212704974684, 2.36909494347048, '7'),
(237, 'Porte Dorée', 'PARIS', '12EME', 'metro', 48.8354388891914, 2.40601835314784, '8'),
(238, 'Porte d''Orléans (Général Leclerc)', 'PARIS', '14EME', 'metro', 48.8226012875276, 2.3248055530705, '4'),
(239, 'Porte Maillot', 'PARIS', '17EME', 'metro', 48.877964502968, 2.28183617255428, '1'),
(240, 'Pré-Saint-Gervais', 'PARIS', '19EME', 'metro', 48.8799349564117, 2.39907689689178, '7B'),
(241, 'Pyramides', 'PARIS', '01ER', 'metro', 48.8669463020695, 2.33366506577888, '7'),
(242, 'Pyramides', 'PARIS', '02EME', 'metro', 48.8669463020695, 2.33366506577888, '14'),
(243, 'Pyrenees', 'PARIS', '20EME', 'metro', 48.8738907818268, 2.38488983901602, '11'),
(244, 'Quai de la Gare', 'PARIS', '13EME', 'metro', 48.8373989542089, 2.37378388489769, '6'),
(245, 'Quai de la Rapée', 'PARIS', '12EME', 'metro', 48.8457951983436, 2.36703563413483, '5'),
(246, 'Quatre Septembre', 'PARIS', '02EME', 'metro', 48.8693729306069, 2.33574247484458, '3'),
(247, 'Rambuteau', 'PARIS', '04EME', 'metro', 48.8614000355035, 2.35350496222254, '11'),
(248, 'Ranelagh', 'PARIS', '16EME', 'metro', 48.8553920307943, 2.26997975035107, '9'),
(249, 'Raspail', 'PARIS', '14EME', 'metro', 48.8389637143162, 2.33058309684112, '4, 6'),
(250, 'Réaumur-Sébastopol', 'PARIS', '02EME', 'metro', 48.8663118301881, 2.35203525525425, '3, 4'),
(251, 'Rennes', 'PARIS', '06EME', 'metro', 48.8480544328681, 2.32808305123987, '12'),
(252, 'République', 'PARIS', '11EME', 'metro', 48.8674860390566, 2.36366959820676, '11, 3, 5, 8, 9'),
(253, 'Reuilly-Diderot', 'PARIS', '12EME', 'metro', 48.8472381327386, 2.38611818658013, '1, 8'),
(254, 'Richard-Lenoir', 'PARIS', '11EME', 'metro', 48.8608927535125, 2.3720977804711, '5'),
(255, 'Richelieu-Drouot', 'PARIS', '09EME', 'metro', 48.8720139167525, 2.33908809938486, '8, 9'),
(256, 'Riquet', 'PARIS', '19EME', 'metro', 48.8881235581407, 2.37448742568144, '7'),
(257, 'Robespierre', 'MONTREUIL', '', 'metro', 48.85556400483, 2.42355673885079, '9'),
(258, 'Rome', 'PARIS', '17EME', 'metro', 48.8825292240735, 2.32098414419979, '2'),
(259, 'Rue de la Pompe (Avenue Georges Mandel)', 'PARIS', '16EME', 'metro', 48.8641004131629, 2.27762632988678, '9'),
(260, 'Rue des Boulets', 'PARIS', '11EME', 'metro', 48.8521417733756, 2.38914280457034, '9'),
(261, 'Rue du Bac', 'PARIS', '07EME', 'metro', 48.8557564721823, 2.32556882179391, '12'),
(262, 'Rue Saint-Maur', 'PARIS', '11EME', 'metro', 48.8639878082439, 2.38007329534159, '3'),
(263, 'Saint-Ambroise', 'PARIS', '11EME', 'metro', 48.8612121032505, 2.37409760383489, '9'),
(264, 'Saint-Augustin', 'PARIS', '08EME', 'metro', 48.8746742716311, 2.32043139650991, '9'),
(265, 'Saint-Denis-Porte de Paris', 'SAINT-DENIS', '', 'metro', 48.9296276098426, 2.35741016429387, '13'),
(266, 'Saint-Denis-Universite', 'SAINT-DENIS', '', 'metro', 48.9456254805762, 2.36235875823436, '13'),
(267, 'Saint-Fargeau', 'PARIS', '20EME', 'metro', 48.871951099492, 2.40485763553065, '3B'),
(268, 'Saint-Francois-Xavier', 'PARIS', '07EME', 'metro', 48.8518632147979, 2.31403452688812, '13'),
(269, 'Saint-Georges', 'PARIS', '09EME', 'metro', 48.8785085363002, 2.33758851215148, '12'),
(270, 'Saint-Germain des Prés', 'PARIS', '06EME', 'metro', 48.8536134867907, 2.33372046538119, '4'),
(271, 'Saint-Jacques', 'PARIS', '14EME', 'metro', 48.8332522883745, 2.33622001540028, '6'),
(272, 'Saint-Lazare', 'PARIS', '08EME', 'metro', 48.8755778691635, 2.326185658552, '12, 13, 14, 3'),
(273, 'Saint-Mandé', 'SAINT-MANDE', '', 'metro', 48.8462977572576, 2.41867310093048, '1'),
(274, 'Saint-Marcel', 'PARIS', '13EME', 'metro', 48.8395141857768, 2.36140877914038, '5'),
(275, 'Saint-Michel', 'PARIS', '05EME', 'metro', 48.8532875817267, 2.34346845196892, '4'),
(276, 'Saint-Paul (Le Marais)', 'PARIS', '04EME', 'metro', 48.8551436006388, 2.36065335403361, '1'),
(277, 'Saint-Philippe du Roule', 'PARIS', '08EME', 'metro', 48.8721798206485, 2.30982009380661, '9'),
(278, 'Saint-Placide', 'PARIS', '06EME', 'metro', 48.8465803886283, 2.32693263560201, '4'),
(279, 'Saint-Sébastien-Froissart', 'PARIS', '03EME', 'metro', 48.8612805878047, 2.36702409525746, '8'),
(280, 'Saint-Sulpice', 'PARIS', '06EME', 'metro', 48.8508047851976, 2.33086756439724, '4'),
(281, 'Ségur', 'PARIS', '15EME', 'metro', 48.8467524550776, 2.30782041849586, '10'),
(282, 'Sentier', 'PARIS', '02EME', 'metro', 48.8674133308826, 2.3466136387446, '3'),
(283, 'Sèvres-Babylone', 'PARIS', '07EME', 'metro', 48.8512043552606, 2.32587286292213, '10, 12'),
(284, 'Sèvres-Lecourbe', 'PARIS', '15EME', 'metro', 48.8451307700065, 2.31018390371145, '6'),
(285, 'Simplon', 'PARIS', '18EME', 'metro', 48.8946326891969, 2.34709106533484, '4'),
(286, 'Solférino', 'PARIS', '07EME', 'metro', 48.8585512442859, 2.32268062216292, '12'),
(287, 'Stalingrad', 'PARIS', '19EME', 'metro', 48.88430478953, 2.3670850145355, '2, 5, 7'),
(288, 'Strasbourg-Saint-Denis', 'PARIS', '02EME', 'metro', 48.8691997057755, 2.35409710573389, '4, 8, 9'),
(289, 'Sully-Morland', 'PARIS', '04EME', 'metro', 48.8510338403896, 2.36186696356924, '7'),
(290, 'Telegraphe', 'PARIS', '20EME', 'metro', 48.8753936353787, 2.3985900637686, '11'),
(291, 'Temple', 'PARIS', '03EME', 'metro', 48.8663687823143, 2.36108072227889, '3'),
(292, 'Ternes', 'PARIS', '17EME', 'metro', 48.8780661989513, 2.29803071264819, '2'),
(293, 'Tolbiac', 'PARIS', '13EME', 'metro', 48.8265068988465, 2.35724192740466, '7'),
(294, 'Trinité-d''Estienne d''Orves', 'PARIS', '09EME', 'metro', 48.87650879316, 2.33305807671909, '12'),
(295, 'Trocadéro', 'PARIS', '16EME', 'metro', 48.8629708358403, 2.2870198439694, '6, 9'),
(296, 'Tuileries', 'PARIS', '01ER', 'metro', 48.8644970966975, 2.33031418026416, '1'),
(297, 'Vaneau', 'PARIS', '07EME', 'metro', 48.848871662506, 2.32193434751113, '10'),
(298, 'Varenne', 'PARIS', '07EME', 'metro', 48.8575166012889, 2.31553023354222, '13'),
(299, 'Vaugirard (Adolphe Chérioux)', 'PARIS', '15EME', 'metro', 48.839568032804, 2.30098263992519, '12'),
(300, 'Vavin', 'PARIS', '06EME', 'metro', 48.8420036541946, 2.32900321886739, '4'),
(301, 'Victor Hugo', 'PARIS', '16EME', 'metro', 48.8696716618644, 2.28526726839526, '2'),
(302, 'Villejuif-Léo Lagrange', 'VILLEJUIF', '', 'metro', 48.8041740664156, 2.36394352657996, '7'),
(303, 'Villejuif-Louis Aragon', 'VILLEJUIF', '', 'metro', 48.7870020157205, 2.36697471484243, '7'),
(304, 'Villejuif-Paul Vaillant Couturier (Hôpital Paul Brousse)', 'VILLEJUIF', '', 'metro', 48.7959447270881, 2.3679661373898, '7'),
(305, 'Villiers', 'PARIS', '17EME', 'metro', 48.8810543983372, 2.31527055095629, '2, 3'),
(306, 'Volontaires', 'PARIS', '15EME', 'metro', 48.8416970273909, 2.30804114557479, '12'),
(307, 'Voltaire (Léon Blum)', 'PARIS', '11EME', 'metro', 48.8578758428685, 2.37988391957515, '9'),
(308, 'Wagram', 'PARIS', '17EME', 'metro', 48.8838739610152, 2.30465144209881, '3'),
(309, 'Antony', 'ANTONY', '', 'rer', 48.7550073109313, 2.30120477822829, 'B'),
(310, 'Arcueil-Cachan', 'CACHAN', '', 'rer', 48.7989637452115, 2.3278264234916, 'B'),
(311, 'Auber', 'PARIS', '09EME', 'rer', 48.8728028703553, 2.32979761427205, 'A'),
(312, 'Bagneux', 'CACHAN', '', 'rer', 48.7935073907561, 2.32113446607002, 'B'),
(313, 'Boissy-Saint-Léger', 'BOISSY-SAINT-LEGER', '', 'rer', 48.75310090772, 2.50525718810179, 'A'),
(314, 'Bourg-la-Reine', 'BOURG-LA-REINE', '', 'rer', 48.7801183311519, 2.31227819045007, 'B'),
(315, 'Bry-sur-Marne', 'BRY-SUR-MARNE', '', 'rer', 48.844336863334, 2.52618908361756, 'A'),
(316, 'Bures-sur-Yvette', 'BURES-SUR-YVETTE', '', 'rer', 48.6959214088611, 2.16311619600879, 'B'),
(317, 'Bussy-Saint-Georges', 'BUSSY-SAINT-GEORGES', '', 'rer', 48.8368591172941, 2.70933817857896, 'A'),
(318, 'Champigny', 'SAINT-MAUR-DES-FOSSES', '', 'rer', 48.806933551171, 2.51014171776252, 'A'),
(319, 'Charles de Gaulle-Etoile', 'PARIS', '17EME', 'rer', 48.8740492794881, 2.29482513792001, 'A'),
(320, 'Chatou-Croissy', 'CHATOU', '', 'rer', 48.8852963322756, 2.15514835431857, 'A'),
(321, 'Cité Universitaire', 'PARIS', '14EME', 'rer', 48.8199505116218, 2.34098394909947, 'B'),
(322, 'Courcelle-sur-Yvette', 'GIF-SUR-YVETTE', '', 'rer', 48.7002331731339, 2.09936095415186, 'B'),
(323, 'Denfert-Rochereau', 'PARIS', '14EME', 'rer', 48.8335919035577, 2.33189346001924, 'B'),
(324, 'Fontaine-Michalon', 'ANTONY', '', 'rer', 48.7437886832867, 2.29698589922482, 'B'),
(325, 'Fontenay-aux-Roses', 'FONTENAY-AUX-ROSES', '', 'rer', 48.7877115245683, 2.29164025123294, 'B'),
(326, 'Fontenay-sous-Bois', 'FONTENAY-SOUS-BOIS', '', 'rer', 48.8437625064903, 2.46465286127281, 'A'),
(327, 'Gentilly', 'GENTILLY', '', 'rer', 48.815573502265, 2.340738666424, 'B'),
(328, 'Gif-sur-Yvette', 'GIF-SUR-YVETTE', '', 'rer', 48.6985407790816, 2.13695473827724, 'B'),
(329, 'Joinville-le-Pont', 'JOINVILLE-LE-PONT', '', 'rer', 48.8210036992678, 2.46386201370874, 'A'),
(330, 'La Croix-de-Berny', 'ANTONY', '', 'rer', 48.7619694674283, 2.30410934209306, 'B'),
(331, 'La Défense (Grande Arche)', 'PUTEAUX', '', 'rer', 48.8918864546148, 2.23778294202689, 'A'),
(332, 'La Hacquinière', 'BURES-SUR-YVETTE', '', 'rer', 48.6949629337936, 2.15338410493974, 'B'),
(333, 'Laplace', 'ARCUEIL', '', 'rer', 48.807924912672, 2.3334990531545, 'B'),
(334, 'La Varenne-Chennevières', 'SAINT-MAUR-DES-FOSSES', '', 'rer', 48.7948325765358, 2.51291857633747, 'A'),
(335, 'Le Guichet', 'ORSAY', '', 'rer', 48.7047418078257, 2.1917819885305, 'B'),
(336, 'Le Parc de Saint-Maur', 'SAINT-MAUR-DES-FOSSES', '', 'rer', 48.805095526587, 2.48575027055873, 'A'),
(337, 'Les Baconnets', 'ANTONY', '', 'rer', 48.7394976208092, 2.28732714443584, 'B'),
(338, 'Le Vésinet-Centre', 'LE VESINET', '', 'rer', 48.890015499552, 2.13479742151308, 'A'),
(339, 'Le Vésinet-Le Pecq', 'LE VESINET', '', 'rer', 48.8984273174854, 2.12186949767266, 'A'),
(340, 'Lognes', 'LOGNES', '', 'rer', 48.8390665706901, 2.63376007764926, 'A'),
(341, 'Lozère', 'PALAISEAU', '', 'rer', 48.7062113003843, 2.21133414998585, 'B'),
(342, 'Luxembourg', 'PARIS', '05EME', 'rer', 48.8459336877987, 2.34061361217477, 'B'),
(343, 'Marne-la-Vallée Chessy', 'CHESSY', '', 'rer', 48.8714327360736, 2.78308875356856, 'A'),
(344, 'Nanterre-Préfecture', 'NANTERRE', '', 'rer', 48.8953636025288, 2.22340084401069, 'A'),
(345, 'Nanterre-Université', 'NANTERRE', '', 'rer', 48.9012605332833, 2.21568588975438, 'A'),
(346, 'Nanterre-Ville', 'NANTERRE', '', 'rer', 48.8952591634623, 2.19580884693953, 'A'),
(347, 'Nation', 'PARIS', '12EME', 'rer', 48.8483471801306, 2.39594992326625, 'A'),
(348, 'Neuilly-Plaisance', 'NEUILLY-PLAISANCE', '', 'rer', 48.8533527868298, 2.51352194233088, 'A'),
(349, 'Nogent-sur-Marne', 'NOGENT-SUR-MARNE', '', 'rer', 48.8349751721145, 2.47216551811292, 'A'),
(350, 'Noisiel', 'NOISIEL', '', 'rer', 48.8434939490491, 2.61662827549023, 'A'),
(351, 'Noisy-Champs', 'NOISY-LE-GRAND', '', 'rer', 48.8426615529117, 2.57801189139333, 'A'),
(352, 'Noisy-le-Grand (Mont d''Est)', 'NOISY-LE-GRAND', '', 'rer', 48.8411187758474, 2.54793586078871, 'A'),
(353, 'Orsay-Ville', 'ORSAY', '', 'rer', 48.6975300700721, 2.18236510671545, 'B'),
(354, 'Palaiseau', 'PALAISEAU', '', 'rer', 48.7179912720136, 2.24646053615073, 'B'),
(355, 'Palaiseau Villebon', 'PALAISEAU', '', 'rer', 48.7079438633038, 2.23736509678945, 'B'),
(356, 'Parc de Sceaux', 'ANTONY', '', 'rer', 48.770658015939, 2.31031788911288, 'B'),
(357, 'Port Royal', 'PARIS', '05EME', 'rer', 48.8389863698281, 2.3370368298491, 'B'),
(358, 'Robinson', 'SCEAUX', '', 'rer', 48.7803728780303, 2.28117460658218, 'B'),
(359, 'Rueil-Malmaison', 'RUEIL-MALMAISON', '', 'rer', 48.8872296169075, 2.1709148202125, 'A'),
(360, 'Saint-Germain-en-Laye', 'SAINT-GERMAIN-EN-LAYE', '', 'rer', 48.8983940002723, 2.09513896553659, 'A'),
(361, 'Saint-Maur Créteil', 'SAINT-MAUR-DES-FOSSES', '', 'rer', 48.8062801804394, 2.47211272031285, 'A'),
(362, 'Saint-Rémy-lès-Chevreuse', 'SAINT-REMY-LES-CHEVREUSE', '', 'rer', 48.7030674560445, 2.07107449147842, 'B'),
(363, 'Sceaux', 'SCEAUX', '', 'rer', 48.7814354425141, 2.29720152282349, 'B'),
(364, 'Sucy Bonneuil', 'SUCY-EN-BRIE', '', 'rer', 48.7711274129549, 2.50784465806546, 'A'),
(365, 'Torcy', 'TORCY', '', 'rer', 48.8395400090998, 2.65576579751211, 'A'),
(366, 'Val d''europe', 'SERRIS', '', 'rer', 48.8551968299676, 2.77458654031172, 'A'),
(367, 'Vincennes', 'VINCENNES', '', 'rer', 48.8472269351, 2.43106661912721, 'A'),
(368, 'Massy-Palaiseau', 'MASSY', '', 'rer', 48.7244896946069, 2.25881199978123, 'B'),
(369, 'Saint-Michel Notre-Dame', 'PARIS', '05EME', 'rer', 48.8526938691253, 2.34501755059198, 'B'),
(370, 'Chatelet-Les Halles', 'PARIS', '01ER', 'rer', 48.8611491276514, 2.34663294001898, 'B, A'),
(371, 'Gare du Nord', 'PARIS', '10EME', 'rer', 48.8800360157373, 2.35454912540286, 'B'),
(372, 'Gare de Lyon', 'PARIS', '12EME', 'rer', 48.844757269576, 2.37407229997982, 'A'),
(373, 'Massy-Verrières', 'MASSY', '', 'rer', 48.44612102, 2.1625, 'B'),
(374, 'Val de Fontenay', 'FONTENAY-SOUS-BOIS', '', '2', 48.511674, 2.292148, 'A'),
(375, 'ADRIENNE BOLLAND', 'PARIS', '20EME', 'tram', 48.8721691081024, 2.40859776154048, 'T3B'),
(376, 'ALEXANDRA DAVID-NEEL', 'PARIS', '12EME', 'tram', 48.8435747376978, 2.41003584738325, 'T3A'),
(377, 'AUGUSTE DELAUNE', 'BOBIGNY', '', 'tram', 48.906697097401, 2.45943609081747, 'T1'),
(378, 'AVENUE DE FRANCE', 'PARIS', '13EME', 'tram', 48.8254834414312, 2.38098301732518, 'T3A'),
(379, 'BALARD', 'PARIS', '15EME', 'tram', 48.8361001462484, 2.2780987169111, 'T3A'),
(380, 'BARON LEROY', 'PARIS', '12EME', 'tram', 48.830268818073, 2.39303472504905, 'T3A'),
(381, 'BASILIQUE DE SAINT-DENIS', 'SAINT-DENIS', '', 'tram', 48.9375958835908, 2.36182285037693, 'T1'),
(382, 'BELVEDERE', 'SURESNES', '', 'tram', 48.8765333524342, 2.22603101382263, 'T2'),
(383, 'BOBIGNY - PABLO PICASSO', 'BOBIGNY', '', 'tram', 48.906585259732, 2.44979711546528, 'T1'),
(384, 'BRANCION', 'PARIS', '15EME', 'tram', 48.8286765199254, 2.30084051192976, 'T3A'),
(385, 'BRIMBORION', 'MEUDON', '', 'tram', 48.821871966287, 2.23157894388315, 'T2'),
(386, 'BRIMBORION', 'SEVRES', '', 'tram', 48.8219619638074, 2.23171487086591, 'T2'),
(387, 'BUTTE DU CHAPEAU ROUGE', 'PARIS', '19EME', 'tram', 48.8850903758455, 2.39665052083985, 'T3B'),
(388, 'CANAL SAINT DENIS', 'PARIS', '19EME', 'tram', 48.898870234798, 2.38033612178792, 'T3B'),
(389, 'CHARLEBOURG', 'LA GARENNE-COLOMBES', '', 'tram', 48.9075815062497, 2.23843221269761, 'T2'),
(390, 'CHEMIN DES RENIERS', 'VILLENEUVE-LA-GARENNE', '', 'tram', 48.9346182522321, 2.32163616924495, 'T1'),
(391, 'CIMETIERE DE SAINT-DENIS', 'SAINT-DENIS', '', 'tram', 48.9363012850823, 2.36411393497228, 'T1'),
(392, 'CITE UNIVERSITAIRE', 'PARIS', '14EME', 'tram', 48.8203370331967, 2.33862254050977, 'T3A'),
(393, 'COLETTE BESSON', 'PARIS', '18EME', 'tram', 48.8985472451883, 2.36283348646326, 'T3B'),
(394, 'COSMONAUTES', 'SAINT-DENIS', '', 'tram', 48.9320153071647, 2.37742428959459, 'T1'),
(395, 'COSMONAUTES', 'LA COURNEUVE', '', 'tram', 48.9316467716009, 2.37764224115598, 'T1'),
(396, 'DANTON', 'LA COURNEUVE', '', 'tram', 48.9226869546748, 2.40664217821568, 'T1'),
(397, 'DELPHINE SEYRIG', 'PANTIN', '', 'tram', 48.8944859588706, 2.39769717384562, 'T3B'),
(398, 'DESNOUETTES', 'PARIS', '15EME', 'tram', 48.8343862270764, 2.28383227976527, 'T3A'),
(399, 'DIDOT', 'PARIS', '14EME', 'tram', 48.8259070128131, 2.31341317966581, 'T3A'),
(400, 'DRANCY-AVENIR', 'DRANCY', '', 'tram', 48.9181194385692, 2.41723145097352, 'T1'),
(401, 'DRANCY-AVENIR', 'BOBIGNY', '', 'tram', 48.917787011844, 2.41709457576743, 'T1'),
(402, 'ELLA FITZGERALD - GRANDS MOULINS DE PANTIN', 'PARIS', '19EME', 'tram', 48.8973415754459, 2.39319552116119, 'T3B'),
(403, 'ESCADRILLE NORMANDIE-NIEMEN', 'BOBIGNY', '', 'tram', 48.9132036843636, 2.43512660474404, 'T1'),
(404, 'FAUBOURG DE L''ARCHE', 'COURBEVOIE', '', 'tram', 48.8968433724045, 2.24020423299722, 'T2'),
(405, 'GARE DE GENNEVILLIERS', 'GENNEVILLIERS', '', 'tram', 48.9333168819557, 2.30717786681876, 'T1'),
(406, 'GARE DE ST-DENIS RER', 'SAINT-DENIS', '', 'tram', 48.9359715234943, 2.34530967666892, 'T1'),
(407, 'GASTON ROULAUD', 'DRANCY', '', 'tram', 48.9149555096477, 2.43031659953867, 'T1'),
(408, 'GASTON ROULAUD', 'BOBIGNY', '', 'tram', 48.9146950249276, 2.43013887159837, 'T1'),
(409, 'GEORGES BRASSENS', 'PARIS', '15EME', 'tram', 48.8298342391211, 2.29569395650457, 'T3A'),
(410, 'HENRI FARMAN', 'PARIS', '15EME', 'tram', 48.8349064280108, 2.27259304891558, 'T2'),
(411, 'HOPITAL AVICENNE', 'BOBIGNY', '', 'tram', 48.9156510461004, 2.42566809745386, 'T1'),
(412, 'HOPITAL AVICENNE', 'DRANCY', '', 'tram', 48.9158666428332, 2.42579118664877, 'T1'),
(413, 'HOPITAL DELAFONTAINE', 'SAINT-DENIS', '', 'tram', 48.9339407100428, 2.3702031683557, 'T1'),
(414, 'HOPITAL ROBERT DEBRE', 'PARIS', '19EME', 'tram', 48.8793811765532, 2.40109289782322, 'T3B'),
(415, 'HOTEL DE VILLE DE BOBIGNY', 'BOBIGNY', '', 'tram', 48.9065596142388, 2.4434644166626, 'T1'),
(416, 'HOTEL DE VILLE DE LA COURNEUVE', 'LA COURNEUVE', '', 'tram', 48.9272730173584, 2.39285960667936, 'T1'),
(417, 'ISSY - VAL DE SEINE', 'ISSY-LES-MOULINEAUX', '', 'tram', 48.8293373341873, 2.26273740578347, 'T2'),
(418, 'JACQUELINE AURIOL', 'COLOMBES', '', 'tram', 48.9107503528726, 2.23419952059866, 'T2'),
(419, 'JACQUES-HENRI LARTIGUE', 'ISSY-LES-MOULINEAUX', '', 'tram', 48.8238750489213, 2.25917222491321, 'T2'),
(420, 'JEAN MOULIN', 'PARIS', '14EME', 'tram', 48.8247081187782, 2.31881078177456, 'T3A'),
(421, 'JEAN ROSTAND', 'BOBIGNY', '', 'tram', 48.9077721466046, 2.45385567981373, 'T1'),
(422, 'LA COURNEUVE - 8 MAI 1945', 'LA COURNEUVE', '', 'tram', 48.9207254126076, 2.41062836351795, 'T1'),
(423, 'LA COURNEUVE - SIX ROUTES', 'LA COURNEUVE', '', 'tram', 48.930103095549, 2.38426298216103, 'T1'),
(424, 'LA DEFENSE', 'PUTEAUX', '', 'tram', 48.8918972901127, 2.23641771047807, 'T2'),
(425, 'LA FERME', 'BOBIGNY', '', 'tram', 48.9096743362744, 2.43745817936778, 'T1'),
(426, 'LA NOUE', 'VILLENEUVE-LA-GARENNE', '', 'tram', 48.9349737947418, 2.32677179093878, 'T1'),
(427, 'LE LUTH', 'GENNEVILLIERS', '', 'tram', 48.9316391521181, 2.28849908383256, 'T1'),
(428, 'LES COTEAUX', 'SAINT-CLOUD', '', 'tram', 48.8567332361984, 2.22035301247059, 'T2'),
(429, 'LES COURTILLES', 'ASNIERES-SUR-SEINE', '', 'tram', 48.9300102647517, 2.28324944464076, 'T1'),
(430, 'LES FAUVELLES', 'LA GARENNE-COLOMBES', '', 'tram', 48.9024417344135, 2.23945079487089, 'T2'),
(431, 'LES MILONS', 'SAINT-CLOUD', '', 'tram', 48.8499933641322, 2.22109678526621, 'T2'),
(432, 'LES MOULINEAUX', 'ISSY-LES-MOULINEAUX', '', 'tram', 48.8215148922789, 2.25135631324916, 'T2'),
(433, 'LE VILLAGE', 'GENNEVILLIERS', '', 'tram', 48.9332951014774, 2.29467656895352, 'T1'),
(434, 'LIBERATION', 'BOBIGNY', '', 'tram', 48.9068738690984, 2.43863886272332, 'T1'),
(435, 'L''ILE-SAINT-DENIS', 'L''ILE-SAINT-DENIS', '', 'tram', 48.9357830430896, 2.33986691734332, 'T1'),
(436, 'MAIRIE DE VILLENEUVE-LA GARENNE', 'VILLENEUVE-LA-GARENNE', '', 'tram', 48.9355943066754, 2.33411727792386, 'T1'),
(437, 'MARCHE DE SAINT-DENIS', 'SAINT-DENIS', '', 'tram', 48.9385316221225, 2.35567090935926, 'T1'),
(438, 'MARIE DE MIRIBEL', 'PARIS', '20EME', 'tram', 48.8588222270759, 2.40964862479711, 'T3B'),
(439, 'MARYSE BASTIE', 'PARIS', '13EME', 'tram', 48.8242534045346, 2.37736809751795, 'T3A'),
(440, 'MAURICE LACHATRE', 'DRANCY', '', 'tram', 48.9190919350681, 2.41434200630114, 'T1'),
(441, 'MAURICE LACHATRE', 'BOBIGNY', '', 'tram', 48.9188134710873, 2.41413704491281, 'T1'),
(442, 'MEUDON SUR-SEINE', 'MEUDON', '', 'tram', 48.8192277635677, 2.23998869052697, 'T2'),
(443, 'MONTEMPOIVRE', 'PARIS', '12EME', 'tram', 48.840524052395, 2.40907164766505, 'T3A'),
(444, 'MONTSOURIS', 'PARIS', '14EME', 'tram', 48.8214379781018, 2.33362737917325, 'T3A'),
(445, 'MUSEE DE SEVRES', 'SEVRES', '', 'tram', 48.828683337868, 2.22526235345025, 'T2'),
(446, 'NOISY-LE-SEC RER', 'NOISY-LE-SEC', '', 'tram', 48.8953328034556, 2.45951834006075, 'T1'),
(447, 'PARC DES CHANTERAINES', 'GENNEVILLIERS', '', 'tram', 48.9339204416829, 2.31356806119225, 'T1'),
(448, 'PARC DE ST-CLOUD', 'SAINT-CLOUD', '', 'tram', 48.8429702843216, 2.22177972032894, 'T2'),
(449, 'PARC PIERRE LAGRAVERE', 'COLOMBES', '', 'tram', 48.917639128237, 2.22451777695119, 'T2'),
(450, 'PETIT NOISY', 'NOISY-LE-SEC', '', 'tram', 48.9001081024747, 2.46510491253035, 'T1'),
(451, 'PONT DE BEZONS', 'BEZONS', '', 'tram', 48.9233479903808, 2.2174887713866, 'T2'),
(452, 'PONT DE BONDY', 'NOISY-LE-SEC', '', 'tram', 48.9052704317164, 2.46991643608493, 'T1'),
(453, 'PONT GARIGLIANO - HOPITAL EUROPEEN GEORGE POMPIDOU', 'PARIS', '15EME', 'tram', 48.8379613092664, 2.2709622239273, 'T3A'),
(454, 'PORTE D''AUBERVILLIERS', 'PARIS', '18EME', 'tram', 48.8986536474348, 2.36885169363032, 'T3B'),
(455, 'PORTE DE BAGNOLET', 'PARIS', '20EME', 'tram', 48.8635591194467, 2.4087698120476, 'T3B'),
(456, 'PORTE DE CHARENTON', 'PARIS', '12EME', 'tram', 48.8319604054521, 2.39829140735388, 'T3A'),
(457, 'PORTE DE CHOISY', 'PARIS', '13EME', 'tram', 48.8198172631532, 2.36391073971091, 'T3A'),
(458, 'PORTE DE LA CHAPELLE', 'PARIS', '18EME', 'tram', 48.8984987868191, 2.35781721285278, 'T3B'),
(459, 'PORTE DE LA VILLETTE - CITE DES SCIENCES ET DE L''INDUSTRIE', 'PARIS', '19EME', 'tram', 48.8980008488859, 2.38586957854023, 'T3B'),
(460, 'PORTE DE MONTREUIL', 'PARIS', '20EME', 'tram', 48.8531819873301, 2.41066219297729, 'T3B'),
(461, 'PORTE DE PANTIN - PARC DE LA VILLETTE', 'PARIS', '19EME', 'tram', 48.8888205286535, 2.39572123839136, 'T3B'),
(462, 'PORTE DES LILAS', 'PARIS', '20EME', 'tram', 48.8768704925935, 2.40686698887072, 'T3B'),
(463, 'PORTE DE VANVES', 'PARIS', '14EME', 'tram', 48.8274602446116, 2.30632037796183, 'T3A'),
(464, 'PORTE DE VERSAILLES', 'PARIS', '15EME', 'tram', 48.8321677996835, 2.2873128615217, 'T2'),
(465, 'PORTE DE VERSAILLES - PARC DES EXPOSITIONS', 'PARIS', '15EME', 'tram', 48.8327388525271, 2.2881291423162, 'T3A'),
(466, 'PORTE DE VINCENNES', 'PARIS', '12EME', 'tram', 48.84692733686, 2.40961840670738, 'T3A'),
(467, 'PORTE DE VINCENNES', 'PARIS', '20EME', 'tram', 48.847264376325, 2.4096052592298, 'T3B'),
(468, 'PORTE D''ISSY', 'ISSY-LES-MOULINEAUX', '', 'tram', 48.8317740310433, 2.28101695641237, 'T2'),
(469, 'PORTE D''ITALIE', 'PARIS', '13EME', 'tram', 48.8190946629611, 2.35948022920578, 'T3A'),
(470, 'PORTE D''IVRY', 'PARIS', '13EME', 'tram', 48.8217840195029, 2.37010473888322, 'T3A'),
(471, 'PORTE DOREE', 'PARIS', '12EME', 'tram', 48.8356137618706, 2.40668229651099, 'T3A'),
(472, 'PORTE D''ORLEANS', 'PARIS', '14EME', 'tram', 48.8228666213637, 2.32686248925964, 'T3A'),
(473, 'POTERNE DES PEUPLIERS', 'PARIS', '13EME', 'tram', 48.8209294496501, 2.35087222190799, 'T3A'),
(474, 'PUTEAUX', 'PUTEAUX', '', 'tram', 48.883158897771, 2.23313695315614, 'T2'),
(475, 'ROSA PARKS', 'PARIS', '19EME', 'tram', 48.8974258843192, 2.37249037707827, 'T3B'),
(476, 'SEVERINE', 'PARIS', '20EME', 'tram', 48.8674280733386, 2.40895224652756, 'T3B'),
(477, 'STADE CHARLETY - PORTE DE GENTILLY', 'PARIS', '13EME', 'tram', 48.8196267078302, 2.34577478594422, 'T3A'),
(478, 'STADE GEO ANDRE', 'LA COURNEUVE', '', 'tram', 48.9245862357246, 2.40120998634057, 'T1'),
(479, 'SURESNES LONGCHAMP', 'SURESNES', '', 'tram', 48.8679505323939, 2.22139713654109, 'T2'),
(480, 'SUZANNE LENGLEN', 'PARIS', '15EME', 'tram', 48.8336141577488, 2.27627726552119, 'T2'),
(481, 'THEATRE GERARD PHILIPE', 'SAINT-DENIS', '', 'tram', 48.9372382404843, 2.35017300102966, 'T1'),
(482, 'TIMBAUD', 'GENNEVILLIERS', '', 'tram', 48.9331175130385, 2.30119674337625, 'T1'),
(483, 'VICTOR BASCH', 'COLOMBES', '', 'tram', 48.9137080056912, 2.23014400439772, 'T2');

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
(13, 'bars-a-cocktails-moleculaires', 'Bar à Cocktails Moléculaires', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

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
(15, 'migration history', 'south', 'migrationhistory'),
(16, 'station', 'bars', 'station'),
(17, 'slider', 'home', 'slider');

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

--
-- Contenu de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('hmwjaegirhect1xmwgdtgxqmrodyfhq7', 'NWRmODBkYTM4ZThkYTgyMjlhMTZiMDFjM2Q1NjUzZGI1YWMwYmE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=', '2014-02-14 22:42:06');

-- --------------------------------------------------------

--
-- Structure de la table `drinks_drink`
--

CREATE TABLE IF NOT EXISTS `drinks_drink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `creator_id` int(11),
  PRIMARY KEY (`id`),
  KEY `subcategory_id_refs_id_57c0f03b` (`subcategory_id`),
  KEY `drinks_drink_ad376f8d` (`creator_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `drinks_drink`
--

INSERT INTO `drinks_drink` (`id`, `slug`, `name`, `description`, `subcategory_id`, `creator_id`) VALUES
(1, 'bloody-mary', 'Bloody-Mary', '', 10, NULL),
(2, 'cosmopolitan', 'Cosmopolitan', '', 10, NULL),
(3, 'daiquiri', 'Daïquiri', '', 10, NULL),
(4, 'mai-tai', 'Mai Tai', '', 10, NULL),
(5, 'mojito', 'Mojito', '', 10, NULL),
(6, 'pina-colada', 'Piña Colada', '', 10, NULL),
(7, 'heineken', 'Heineken', '', 4, 1),
(8, 'chouffe-blonde', 'Chouffe Blonde', '', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `drinks_drinkbar`
--

CREATE TABLE IF NOT EXISTS `drinks_drinkbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `price_happy_hour` double NOT NULL,
  `drink_id` int(11) NOT NULL,
  `bar_id` int(11) NOT NULL,
  `approval` int(11) NOT NULL,
  `disapproval` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bar_id_refs_id_6a0b1d41` (`bar_id`),
  KEY `drink_id_refs_id_ffaa485a` (`drink_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `drinks_drinkbar`
--

INSERT INTO `drinks_drinkbar` (`id`, `price`, `price_happy_hour`, `drink_id`, `bar_id`, `approval`, `disapproval`) VALUES
(1, 4, 3, 1, 1, 0, 0),
(2, 3, 2.5, 2, 1, 0, 0),
(3, 6, 4.5, 1, 2, 0, 0),
(4, 5, 4.5, 2, 2, 0, 0),
(5, 3.5, 2.75, 5, 1, 0, 0),
(6, 7.1, 6.2, 6, 2, 0, 0),
(7, 5, 3.5, 7, 4, 0, 0),
(8, 6.5, 5, 8, 3, 0, 0),
(9, 4, 3.2, 7, 5, 0, 0),
(10, 5.6, 4.2, 6, 5, 0, 0);

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
(2, 'bieres', 'Bières', ''),
(3, 'cocktails-alcoolises', 'Cocktails Alcoolisés', ''),
(4, 'boissons-lactees', 'Boissons Lactées', ''),
(5, 'boissons-energisantes', 'Boissons Energisantes', ''),
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
(5, 'ambree', 'Ambrée', '', 2),
(6, 'brune', 'Brune', '', 2),
(7, 'rousse', 'Rousse', '', 2),
(8, 'aromatisee', 'Aromatisée', '', 2),
(9, 'blanche', 'Blanche', '', 2),
(10, 'cocktails-aperitifs', 'Cocktails Apéritifs', '', 3),
(11, 'cocktails-digestifs', 'Cocktails Digestifs', '', 3),
(12, 'long-drink', 'Long Drink', '', 3),
(13, 'milk-shakes', 'Milk-Shakes', '', 4),
(14, 'jus-de-fruits', 'Jus de Fruits', '', 7),
(15, 'smoothie', 'Smoothie', '', 7),
(16, 'colas', 'Colas', '', 8),
(17, 'limonades', 'Limonades', '', 8),
(18, 'diabolos', 'Diabolos', '', 8),
(19, 'sirops', 'Sirops', '', 8),
(20, 'cafes', 'Cafés', '', 9),
(21, 'tisanes', 'Tisanes', '', 9),
(22, 'infusions', 'Infusions', '', 9);

-- --------------------------------------------------------

--
-- Structure de la table `home_slider`
--

CREATE TABLE IF NOT EXISTS `home_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `subtitle` varchar(200) NOT NULL,
  `slug_object_linked` varchar(200) NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `south_migrationhistory`
--

INSERT INTO `south_migrationhistory` (`id`, `app_name`, `migration`, `applied`) VALUES
(1, 'users', '0001_initial', '2014-01-10 17:37:22'),
(2, 'bars', '0001_initial', '2014-01-10 17:37:31'),
(3, 'drinks', '0001_initial', '2014-01-10 17:37:38'),
(4, 'bars', '0002_auto__add_field_bar_website', '2014-02-01 22:08:34'),
(5, 'bars', '0003_auto__del_field_bar_picture__del_field_bar_coordinates__add_field_bar_', '2014-02-02 19:00:48'),
(6, 'bars', '0004_auto__chg_field_bar_website__chg_field_bar_phone', '2014-02-02 19:03:36'),
(7, 'bars', '0005_auto__add_station__del_field_bar_lat__del_field_bar_lon__add_field_bar', '2014-02-02 21:03:16'),
(8, 'home', '0001_initial', '2014-02-02 21:21:02'),
(9, 'drinks', '0002_auto__del_field_drinkbar_slug__add_field_drinkbar_approval__add_field_', '2014-02-02 22:27:49');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `users_customuser`
--

INSERT INTO `users_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `pseudo`, `avatar_url`, `type`) VALUES
(1, 'admin', '0000-00-00 00:00:00', 1, 'drinkizy', '', '', '', 1, 1, '0000-00-00 00:00:00', 'drinkizy', '', '1'),
(2, 'pbkdf2_sha256$12000$kGNtjCYPTrzF$JKz/mqegmPD/3TObo2f2ZP3zaNTqIRTmIEM7WEd9pyM=', '2014-01-31 22:42:06', 1, 'admin', '', '', 'pguilloux53@gmail.com', 1, 1, '2014-01-31 22:41:51', '', '', 'user');

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
  ADD CONSTRAINT `creator_id_refs_id_0fccc545` FOREIGN KEY (`creator_id`) REFERENCES `users_customuser` (`id`),
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
