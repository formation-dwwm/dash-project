-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 28 fév. 2020 à 07:28
-- Version du serveur :  10.1.40-MariaDB
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `dash`
--

-- --------------------------------------------------------

--
-- Structure de la table `access`
--

DROP TABLE IF EXISTS `access`;
CREATE TABLE IF NOT EXISTS `access` (
  `id_theme` int(11) NOT NULL,
  `id_group_dash` int(11) NOT NULL,
  PRIMARY KEY (`id_theme`,`id_group_dash`),
  KEY `IDX_6692B5417BE06A7` (`id_group_dash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id_content` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  PRIMARY KEY (`id_content`,`id_post`),
  KEY `IDX_FEC530A9D1AA708F` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `group_dash`
--

DROP TABLE IF EXISTS `group_dash`;
CREATE TABLE IF NOT EXISTS `group_dash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `group_dash`
--

INSERT INTO `group_dash` (`id`, `groupName`, `date`) VALUES
(1, 'test', '2020-02-26');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200226145533', '2020-02-26 14:58:50');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `author` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `id_source` int(11) DEFAULT NULL,
  `id_theme` int(11) DEFAULT NULL,
  `alert` tinyint(1) NOT NULL,
  `post_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_source_FK` (`id_source`),
  KEY `post_theme0_FK` (`id_theme`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `date`, `author`, `state`, `id_source`, `id_theme`, `alert`, `post_url`) VALUES
(1, 'Disney+ may not be the Netflix killer everyone thought it would be', 'While most everyone anticipated that Disney+ would be popular, the extent of the streaming service\'s success even caught a few Disney executives off guard. Bolstered by a huge catalog of familiar and beloved content, along with new programming like The Mandalorian, Disney+ struck like a lightning bolt when it initially launched in early November. To this point, Disney+, just two weeks after launch, had already amassed an estimated 15 million subscribers. Most recently, former Disney CEO Bob Iger disclosed during an earnings conference call that the Disney+ subscriber total had eclipsed 28.6 million. Those figures are beyond impressive and prompted many to posit that Disney+ could prove to be a serious threat to Netflix\'s ongoing streaming domination. A new report from DecisionData, however, relays that interest in Disney+ may be waning a bit. Specifically, the report notes that Disney+ search engine traffic, media stories, and brand name mentions across social media ...', '2020-02-27', 'bgr', 'published', 1, 1, 0, 'https://bgr.com/2020/02/26/disney-plus-vs-netflix-subscribers-declining/'),
(3, 'Is new Disney CEO Bob Chapek up to the task?', 'A global pandemic and the challenge of figuring out the future of entertainment greeted Bob Chapek on Wednesday as he took over as Chief Executive Officer of Walt Disney Co . ', '2020-02-27', 'Pas moi', 'published', 1, 1, 0, 'https://www.reuters.com/article/us-media-walt-disney-ceo/is-new-disney-ceo-bob-chapek-up-to-the-task-idUSKCN20L01K?feedType=RSS&feedName=businessNews&utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+reuters%2FbusinessNews+%28Business+News%29'),
(4, '\r\n\r\nGoogle News Initiative is focused on local news ‘deserts’', 'The Google News Initiative Subscriptions Lab took a long game approach to helping local publishers build digital-first, consumer-revenue based businesses. The post Google News Initiative is focused on local news ‘deserts’ appeared first on Digiday.', '2020-02-27', 'marion', 'published', 1, 1, 0, 'https://digiday.com/media/google-news-initiative-focused-local-news-deserts/');

-- --------------------------------------------------------

--
-- Structure de la table `source`
--

DROP TABLE IF EXISTS `source`;
CREATE TABLE IF NOT EXISTS `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rss_url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `source`
--

INSERT INTO `source` (`id`, `rss_url`, `name`) VALUES
(1, 'https://syndication.lesechos.fr/rss/rss_tech_medias.xml', 'Les Echos');

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `theme`
--

INSERT INTO `theme` (`id`, `name`) VALUES
(1, 'Mobile');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_group_dash` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_group_dash_FK` (`id_group_dash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `user`, `password`, `id_group_dash`, `email`) VALUES
(1, 'Marion', 'marion', 1, 'marion@free.fr');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `access`
--
ALTER TABLE `access`
  ADD CONSTRAINT `access_group_dash0_FK` FOREIGN KEY (`id_group_dash`) REFERENCES `group_dash` (`id`),
  ADD CONSTRAINT `access_theme_FK` FOREIGN KEY (`id_theme`) REFERENCES `theme` (`id`);

--
-- Contraintes pour la table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_post0_FK` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `content_tag_FK` FOREIGN KEY (`id_content`) REFERENCES `tag` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_source_FK` FOREIGN KEY (`id_source`) REFERENCES `source` (`id`),
  ADD CONSTRAINT `post_theme0_FK` FOREIGN KEY (`id_theme`) REFERENCES `theme` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_group_dash_FK` FOREIGN KEY (`id_group_dash`) REFERENCES `group_dash` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
