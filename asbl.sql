-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 28 Août 2017 à 00:16
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `asbl`
--

-- --------------------------------------------------------

--
-- Structure de la table `beneficiaires`
--

CREATE TABLE `beneficiaires` (
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `nbracharge` int(11) NOT NULL,
  `heurepassage` time NOT NULL,
  `ref` bigint(20) NOT NULL,
  `sem1` tinyint(1) NOT NULL,
  `sem2` tinyint(1) NOT NULL,
  `sem3` tinyint(1) NOT NULL,
  `sem4` tinyint(1) NOT NULL,
  `solde` decimal(10,2) NOT NULL COMMENT 'Solde actuel d''un bénéficiaire',
  `commentaire` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Commentaire actuel d''un bénéficaire',
  `jourpassage` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Contenu de la table `beneficiaires`
--

INSERT INTO `beneficiaires` (`nom`, `prenom`, `tel`, `adresse`, `nbracharge`, `heurepassage`, `ref`, `sem1`, `sem2`, `sem3`, `sem4`, `solde`, `commentaire`, `jourpassage`) VALUES
('Picceu', 'Alexis', '+32484892317', 'rue de pÃ¢turages, 56a', 2, '13:00:00', 2, 1, 0, 0, 1, '0.00', '', 6),
('dupont', 'maxime', '0484892317', '4, rue du village, 7340', 2, '17:45:00', 9, 0, 0, 0, 1, '0.00', '', 5),
('Linus', 'Benjamin', '0474886092', '6, rue du village, 7340', 2, '13:15:00', 10, 0, 1, 0, 0, '17.00', '', 3),
('personne', 'age', '0111144', '1231321', 2, '09:00:00', 11, 1, 1, 0, 0, '2.00', '', 4),
('Bonjour', 'bernard', '245534534', '54 rue  ici', 4, '14:30:00', 12, 1, 1, 0, 0, '0.00', '', 3),
('teste', 'test', '0453543', 'non disponible', 2, '09:30:00', 13, 1, 0, 0, 0, '0.00', '', 2),
('bonjour', 'test', '', 'gfgd', 2, '09:00:00', 14, 0, 0, 1, 0, '27.00', '', 2);

-- --------------------------------------------------------

--
-- Structure de la table `benevoles`
--

CREATE TABLE `benevoles` (
  `nom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `secteur` int(100) NOT NULL,
  `mail` text COLLATE utf8_unicode_ci NOT NULL,
  `mdp` text COLLATE utf8_unicode_ci NOT NULL,
  `ref` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Contenu de la table `benevoles`
--

INSERT INTO `benevoles` (`nom`, `prenom`, `tel`, `adresse`, `secteur`, `mail`, `mdp`, `ref`) VALUES
('testett', 'testestt', '0tttt', '0tt', 4, '', '', 1),
('Baire', 'Nard', 'non', '123 rue test', 4, 'test@test.com', '$2y$10$TyMKZWyuRNSpy74BEYlgkuwZgIvY103TWiE56Amqbz4TlQCqZanvK', 3),
('LE', 'Patron', '0110100101', 'central', 1, '', '', 4),
('Admin', 'Admin', '0477070070', '97 pomme de terre', 1, 'admin@admin.com', '$2y$10$BDb1JGNKhHKuYT7STQQcXOzoq8cU1UM5jOMGbMl56MpUQFSfrUm4O', 5);

-- --------------------------------------------------------

--
-- Structure de la table `districolis`
--

CREATE TABLE `districolis` (
  `identifiant` bigint(20) UNSIGNED NOT NULL COMMENT 'identifie de manière unique un colis',
  `refbeneficiaire` bigint(20) UNSIGNED NOT NULL COMMENT 'Indique quel client a acheté ce colis',
  `montantpaye` decimal(10,2) NOT NULL COMMENT 'Montant payé le jour où la personne à acheté le colis',
  `datedistri` datetime NOT NULL,
  `commentaire` text COLLATE ascii_bin,
  `solde` decimal(10,2) NOT NULL COMMENT 'Avances ou retards du client',
  `sem1` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 1 à l''époque où le colis a été distribué',
  `sem2` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 2 à l''époque où le colis a été distribué',
  `sem3` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 3 à l''époque où le colis a été distribué',
  `sem4` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 4 à l''époque où le colis a été distribué',
  `nbracharge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Contenu de la table `districolis`
--

INSERT INTO `districolis` (`identifiant`, `refbeneficiaire`, `montantpaye`, `datedistri`, `commentaire`, `solde`, `sem1`, `sem2`, `sem3`, `sem4`, `nbracharge`) VALUES
(1, 2, '3.00', '2017-03-04 13:15:00', '<p><strong>coucou !</strong></p>\r\n', '0.00', 1, 0, 0, 0, 2),
(2, 9, '3.00', '2017-03-04 13:15:00', '<p><strong>coucou !</strong></p>\r\n', '0.00', 1, 0, 0, 0, 2),
(3, 10, '3.00', '2017-03-07 13:00:00', NULL, '0.00', 1, 0, 0, 0, 2),
(8, 9, '5.00', '2017-05-19 00:14:36', '<p>&amp;variablePourrie=null</p>\r\n', '1.00', 0, 0, 0, 1, 2),
(11, 11, '5.00', '2017-05-22 11:48:08', '<p>Tets</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1.00', 1, 1, 0, 0, 2),
(12, 13, '12.00', '2017-06-12 21:36:13', NULL, '8.00', 1, 0, 0, 0, 2),
(13, 13, '12.00', '2017-06-12 21:36:55', NULL, '8.00', 1, 0, 0, 0, 2),
(14, 10, '12.00', '2017-06-12 21:38:13', NULL, '20.00', 0, 1, 0, 0, 2),
(15, 13, '0.00', '2017-06-12 21:39:42', NULL, '6.00', 1, 0, 0, 0, 2),
(25, 11, '4.00', '2017-06-15 22:19:46', NULL, '0.00', 1, 1, 0, 0, 2),
(28, 9, '4.00', '2017-06-16 00:00:00', NULL, '0.00', 0, 0, 0, 1, 2),
(31, 13, '12.00', '2017-06-20 23:00:00', NULL, '18.00', 1, 0, 0, 0, 2),
(34, 13, '6.00', '2017-06-13 23:06:00', NULL, '0.00', 1, 0, 0, 0, 2),
(35, 10, '4.00', '2017-06-14 09:29:00', '<p>TESTT</p>\r\n', '12.00', 0, 1, 0, 0, 2),
(36, 10, '9.00', '2017-06-21 09:35:00', NULL, '17.00', 0, 1, 0, 0, 2),
(37, 14, '11.00', '2017-07-11 21:05:00', NULL, '27.00', 0, 0, 1, 0, 2),
(38, 11, '5.00', '2017-08-17 22:04:00', NULL, '2.00', 1, 1, 0, 0, 2);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `beneficiaires`
--
ALTER TABLE `beneficiaires`
  ADD PRIMARY KEY (`ref`),
  ADD KEY `ref` (`ref`);

--
-- Index pour la table `benevoles`
--
ALTER TABLE `benevoles`
  ADD PRIMARY KEY (`ref`);

--
-- Index pour la table `districolis`
--
ALTER TABLE `districolis`
  ADD PRIMARY KEY (`identifiant`),
  ADD UNIQUE KEY `identifiant` (`identifiant`),
  ADD KEY `refbeneficiaire` (`refbeneficiaire`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `beneficiaires`
--
ALTER TABLE `beneficiaires`
  MODIFY `ref` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `benevoles`
--
ALTER TABLE `benevoles`
  MODIFY `ref` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `districolis`
--
ALTER TABLE `districolis`
  MODIFY `identifiant` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'identifie de manière unique un colis', AUTO_INCREMENT=39;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
