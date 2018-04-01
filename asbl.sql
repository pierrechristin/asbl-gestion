-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 22 fév. 2018 à 23:03
-- Version du serveur :  10.1.30-MariaDB
-- Version de PHP :  7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
-- Structure de la table `agenda`
--

CREATE TABLE `agenda` (
  `id` int(4) NOT NULL,
  `dt` date NOT NULL,
  `lieu` varchar(100) NOT NULL,
  `event` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `solde_colis` decimal(10,2) NOT NULL COMMENT 'Solde colis actuel d''un bénéficiaire',
  `solde_magasin` decimal(10,2) NOT NULL COMMENT 'Solde magasin actuel d''un bénéficiaire',
  `commentaire` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Commentaire actuel d''un bénéficaire',
  `jourpassage` int(3) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `id_utilisateur_creation` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `id_utilisateur_modification` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `beneficiaires`
--

INSERT INTO `beneficiaires` (`nom`, `prenom`, `tel`, `adresse`, `nbracharge`, `heurepassage`, `ref`, `sem1`, `sem2`, `sem3`, `sem4`, `solde_colis`, `solde_magasin`, `commentaire`, `jourpassage`, `date_creation`, `id_utilisateur_creation`, `date_modification`, `id_utilisateur_modification`) VALUES
('REBULL', 'VINCENT', '', '', 1, '09:00:00', 1, 1, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 20:39:56', 6, NULL, NULL),
('REBULL', 'LOMBARDO', '0477433044', '', 4, '09:00:00', 2, 1, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 20:42:50', 6, NULL, NULL),
('DEMOUSTIER', 'PAUL', '', '', 1, '09:00:00', 3, 0, 0, 0, 0, '-4.00', '0.00', '', 5, '2018-02-22 20:47:31', 6, '2018-02-22 22:35:36', 6),
('GRASSI', 'LORENZO', '0477 26 58 17', '', 1, '09:00:00', 4, 1, 1, 1, 0, '-20.00', '0.00', '', 5, '2018-02-22 20:48:04', 6, '2018-02-22 20:50:31', 6),
('BIENFAIT', 'PASCALE', '0475 27 61 71', '', 1, '09:00:00', 5, 1, 0, 1, 0, '-4.00', '0.00', '', 5, '2018-02-22 20:49:56', 6, NULL, NULL),
('SOQUET', 'ISABELLE', '0486 41 74 53', '', 4, '09:00:00', 6, 1, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 20:51:17', 6, NULL, NULL),
('LIENARD', 'MEAGAN', '0479 67 53 97', '', 4, '09:00:00', 7, 1, 0, 0, 0, '1.00', '0.00', '', 5, '2018-02-22 20:54:55', 6, NULL, NULL),
('RICHER', 'CATHY', '0476 25 22 78', '', 5, '09:00:00', 8, 0, 0, 0, 0, '0.00', '-61.00', '', 5, '2018-02-22 20:56:11', 6, NULL, NULL),
('Pierrequin', 'Camille', '0477362102', '', 4, '09:00:00', 9, 0, 0, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 20:57:03', 6, NULL, NULL),
('TIFLATI', 'VANESSA', '0485262736', '', 6, '09:00:00', 10, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 20:57:44', 6, NULL, NULL),
('QUAIRIAUX', 'VANESSA', '0479317214', '', 3, '09:00:00', 11, 1, 0, 0, 0, '1.00', '0.00', '', 5, '2018-02-22 20:58:19', 6, NULL, NULL),
('CAILLAUX', 'BETTY', '0485 044 464', '', 6, '09:00:00', 12, 1, 0, 1, 0, '-6.00', '-4.00', '', 5, '2018-02-22 20:57:54', 6, NULL, NULL),
('EVRARD', 'THIBAUD', '0497 53 56 09', '', 3, '09:00:00', 13, 0, 1, 1, 0, '-4.00', '0.00', '', 5, '2018-02-22 20:59:13', 6, NULL, NULL),
('GENEVIEVE', 'CLAUS', '0494658889', '', 1, '09:00:00', 14, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 20:59:52', 6, NULL, NULL),
('BURGEON', 'ANAIS', '0494 47 71 82', '', 3, '09:00:00', 15, 0, 0, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:00:30', 6, NULL, NULL),
('HARDUINAU', 'VALERIA', '0499 438066', '', 2, '09:00:00', 16, 1, 1, 1, 0, '1.00', '0.00', '', 5, '2018-02-22 21:01:33', 6, NULL, NULL),
('BELLATRECHE', 'DJAMI', '0485 53 30 12', '', 2, '09:00:00', 17, 1, 0, 0, 0, '2.00', '0.00', '', 5, '2018-02-22 21:02:11', 6, NULL, NULL),
('CROUSSE', 'NANCY', '0468 36 97 27', '', 4, '09:00:00', 18, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:02:48', 6, NULL, NULL),
('TALEB-AHMED', 'LEILA', '0497 26 73 43', '', -1, '09:00:00', 19, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:03:48', 6, NULL, NULL),
('URBAIN', 'FREDERIC', '0492 10 67 51', '', 4, '09:00:00', 20, 1, 0, 0, 0, '2.00', '0.00', '', 5, '2018-02-22 21:04:27', 6, NULL, NULL),
('URBAIN', 'ISABELLE', '', '', 1, '09:00:00', 21, 1, 0, 0, 0, '2.00', '0.00', '', 5, '2018-02-22 21:04:52', 6, NULL, NULL),
('BOLOME', 'NATHALIE', '', '', 1, '09:00:00', 22, 0, 0, 0, 0, '4.00', '0.00', '', 5, '2018-02-22 21:05:24', 6, NULL, NULL),
('FRANCOIS', 'MONIQUE', '', '', 2, '09:00:00', 23, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:06:03', 6, '2018-02-22 22:36:02', 6),
('DUFOUR', 'SIMONE', '', '', -1, '09:00:00', 24, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:06:26', 6, NULL, NULL),
('DUFOUR', 'LESLY', '', '', -1, '09:00:00', 25, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:06:47', 6, NULL, NULL),
('KAMDEM', 'DOMINIQUE', '0885 65 04 09', '', 7, '09:00:00', 26, 1, 0, 0, 0, '-4.00', '0.00', '', 5, '2018-02-22 21:07:36', 6, NULL, NULL),
('BROGNIEZ', 'Christophe', '', '', 1, '09:00:00', 27, 0, 1, 0, 0, '8.00', '0.00', '', 5, '2018-02-22 21:08:55', 6, NULL, NULL),
('RENAUT', 'GEOFFREY', '0496 61 41 44', '', 0, '09:00:00', 28, 0, 1, 0, 0, '-8.00', '0.00', '', 5, '2018-02-22 21:09:26', 6, '2018-02-22 21:25:59', 6),
('PROUVOYEUR', 'Solange', '', '', 1, '09:00:00', 29, 0, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:10:02', 6, NULL, NULL),
('WILLAME', 'DANIELLE', '0494 18 61 03', '', 1, '09:00:00', 30, 0, 0, 0, 0, '-124.00', '-11.00', '', 5, '2018-02-22 21:10:57', 6, NULL, NULL),
('SOB MBEKU', 'NORA', '0466 348458', '', 2, '09:00:00', 31, 0, 0, 0, 0, '-2.50', '-1.70', '', 5, '2018-02-22 21:12:33', 6, NULL, NULL),
('CUVELIER', 'Beatrice', '0476 63 06 17', '', 3, '09:00:00', 32, 0, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:13:22', 6, NULL, NULL),
('THEATRE', 'MONIQUE', '065 66 79 54', '', 1, '09:00:00', 33, 0, 1, 0, 0, '-9.50', '0.00', '', 5, '2018-02-22 21:15:00', 6, NULL, NULL),
('THIRY', 'PHILIPPE', '0476 65 48 61', '', 3, '09:00:00', 35, 0, 1, 0, 0, '-4.00', '0.00', '', 5, '2018-02-22 21:27:17', 6, NULL, NULL),
('WATTIEZ', 'ANNIE', '0470 85 44 54', '', 1, '09:00:00', 36, 0, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:27:44', 6, NULL, NULL),
('ALTOVINO', 'GAETANE', '0465 49 40 88', '', 5, '09:00:00', 37, 0, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:28:10', 6, NULL, NULL),
('DEGLACE', 'jean-louis', '0492 87 61 89', '', 4, '09:00:00', 38, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:28:41', 6, NULL, NULL),
('FILLEUL', 'PATRICK', '0470 63 01 05', '', 2, '09:00:00', 39, 0, 1, 0, 0, '-0.50', '0.00', '', 5, '2018-02-22 21:29:11', 6, NULL, NULL),
('DOPCHIE', 'Roberta', '0474 55 25 98', '', 1, '09:00:00', 40, 0, 1, 0, 0, '-4.00', '-4.00', '', 5, '2018-02-22 21:29:49', 6, NULL, NULL),
('MONTICELLI', 'PASQUALE', '0493 65 45 25', '', 1, '09:00:00', 41, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:30:13', 6, NULL, NULL),
('MASSY', 'JEAN-PIERRE', '0476 60 32 40', '', 1, '09:00:00', 42, 0, 1, 0, 0, '0.00', '-5.00', '', 5, '2018-02-22 21:31:03', 6, NULL, NULL),
('MPENGO BOLUMBU', 'DAISY', '0488 37 63 22', '', 4, '09:00:00', 43, 0, 0, 0, 0, '-16.00', '-9.00', '', 5, '2018-02-22 21:31:41', 6, NULL, NULL),
('DEBEAUMONT', 'MICHEL', '0595 19 46 84', '', 3, '09:00:00', 44, 0, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:32:09', 6, NULL, NULL),
('FORIEZ', 'BERNARD', '', '', 1, '09:00:00', 45, 0, 0, 0, 0, '-8.00', '0.00', '', 5, '2018-02-22 21:32:36', 6, NULL, NULL),
('MONIER', 'SARA', '0471 68 92 36', '', 2, '09:00:00', 46, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:33:23', 6, NULL, NULL),
('LOUIS', 'JOELLE', '0497 91 47 60', '', 2, '09:00:00', 47, 0, 0, 0, 0, '-12.00', '0.00', '', 5, '2018-02-22 21:33:54', 6, NULL, NULL),
('BEUKHELIL', 'MARIE-JANE', '0477 50 80 57', '', 1, '09:00:00', 48, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:34:32', 6, NULL, NULL),
('BEURIOT', 'ANGELIQUE', '', '', 2, '09:00:00', 49, 0, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:34:47', 6, NULL, NULL),
('ZARBO', 'ANTHONY', '', '', 1, '09:00:00', 50, 0, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:35:09', 6, NULL, NULL),
('MAIHEU', 'LOUISETTE', '0472 55 96 30', '', 2, '09:00:00', 51, 0, 0, 0, 0, '-4.00', '0.00', '', 5, '2018-02-22 21:35:36', 6, NULL, NULL),
('RÃ©veillon', 'Gilberte', '', '', 1, '09:00:00', 52, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:35:57', 6, NULL, NULL),
('LIETARD', 'MAGALY', '0479 70 86 98', '', 3, '09:00:00', 53, 0, 0, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:36:49', 6, NULL, NULL),
('HENAUT', 'PATRICK', '0497 80 55 54', '', 3, '09:00:00', 54, 0, 1, 1, 0, '8.50', '0.00', '', 5, '2018-02-22 21:37:39', 6, '2018-02-22 21:38:02', 6),
('DeclÃ¨ve', 'Marie-Christine', '0495 20 53 86', '', 3, '09:00:00', 55, 0, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:40:00', 6, NULL, NULL),
('Dessars', 'MÃ©lanie', '0490 19 91 13', '', 4, '09:00:00', 56, 0, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:40:27', 6, NULL, NULL),
('JAUNIAUX', 'CANDICE', '0494 63 48 31', '', 6, '09:00:00', 57, 0, 1, 1, 0, '-8.00', '-42.00', '', 5, '2018-02-22 21:41:09', 6, NULL, NULL),
('MEZA SANCHEZ', 'MONICA', '0496 410 583', '', 6, '09:00:00', 58, 0, 1, 1, 0, '1.50', '-2.00', '', 5, '2018-02-22 21:41:53', 6, '2018-02-22 22:36:41', 6),
('PICHON', 'SÃ©bastien', '0497 67 28 47', '', 4, '09:00:00', 59, 0, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:42:34', 6, NULL, NULL),
('NACHEZ', 'AURORE', '0479 99 55 55', '', 2, '09:00:00', 60, 0, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:42:57', 6, NULL, NULL),
('COLLE ', 'CHRISTOPHE', '0493 13 30 87', '', 1, '09:00:00', 61, 0, 1, 1, 0, '-8.00', '0.00', '', 5, '2018-02-22 21:43:26', 6, '2018-02-22 22:13:57', 15),
('PRESTIGIACOMO', 'AURURA', '0496 957 648', '', 4, '09:00:00', 62, 0, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:43:54', 6, NULL, NULL),
('DASCOTTE', 'SYLVIE', '0491 20 51 22', '', 3, '09:00:00', 63, 0, 1, 0, 0, '4.00', '0.00', '', 5, '2018-02-22 21:44:34', 6, NULL, NULL),
('DASCOTTE', 'NICOLE', '0494 88 33 11', '', 1, '09:00:00', 64, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:44:56', 6, NULL, NULL),
('LIENARD', 'SANDRA', '0497 25 97 13', '', 2, '09:00:00', 65, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:45:22', 6, NULL, NULL),
('ZAMPINI', 'FREDERIC', '0494 81 36 96', '', 1, '09:00:00', 66, 0, 0, 0, 0, '6.00', '0.00', '', 5, '2018-02-22 21:45:51', 6, NULL, NULL),
('DANAJ', 'LORENA', '0487 85 62 35', '', 6, '09:00:00', 67, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:46:16', 6, NULL, NULL),
('LOPOMO', 'MARIA', '0499 72 27 32', '', 4, '09:00:00', 68, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:46:38', 6, NULL, NULL),
('FERNAND', 'MARECHALE', '', '', 3, '09:00:00', 69, 0, 1, 1, 0, '-48.00', '0.00', '', 5, '2018-02-22 21:47:10', 6, NULL, NULL),
('CHEVAL', 'PASCAL', '', '', 1, '09:00:00', 70, 0, 1, 0, 0, '-27.00', '0.00', '', 5, '2018-02-22 21:47:48', 6, NULL, NULL),
('PORSOL', 'VILIA', '0467 12 86 25', '', 4, '09:00:00', 71, 1, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 21:48:14', 6, NULL, NULL),
('BOUZAGAOUI', 'FATNA', '0484 28 63 29', '', 2, '09:00:00', 72, 0, 0, 0, 0, '-12.00', '-10.00', '', 5, '2018-02-22 21:48:57', 6, NULL, NULL),
('OUSSAD', 'ZAHRA', '0486 07 16 38', '', 6, '09:00:00', 73, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:50:01', 6, NULL, NULL),
('IVANO', 'DUMIMUCO', '', '', 1, '09:00:00', 74, 0, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:50:21', 6, NULL, NULL),
('COLMONT', 'PASCAL', '0474 56 54 20', '', 1, '09:00:00', 75, 1, 0, 0, 0, '10.00', '-10.00', '', 5, '2018-02-22 21:52:15', 6, NULL, NULL),
('LIENARD', 'GINETTE', '0479 96 40 22', '', 1, '09:00:00', 76, 1, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:52:43', 6, NULL, NULL),
('WAGNIES', 'MICHELLE', '0479 52 39 46', '', 1, '09:00:00', 77, 1, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:53:14', 6, NULL, NULL),
('CARION', 'AURELIE', '065 46 51 98', '', 5, '09:00:00', 78, 0, 0, 0, 0, '0.00', '-45.80', '', 5, '2018-02-22 21:53:48', 6, '2018-02-22 21:56:31', 6),
('KREUTZENBERGER', 'CHRISTIANE', '0479 76 39 36', '', 1, '09:00:00', 79, 1, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:55:21', 6, NULL, NULL),
('ODEN', 'FRANCK', '0490 39 31 68', '', 1, '09:00:00', 80, 1, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:55:49', 6, NULL, NULL),
('KELLY', 'MAGDA', '', '', 1, '09:00:00', 81, 1, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:56:54', 6, NULL, NULL),
('POURTOIS', 'BEATRICE', '065/33 51 88', '', 1, '09:00:00', 82, 0, 0, 0, 0, '4.00', '-8.50', '', 5, '2018-02-22 21:56:15', 6, NULL, NULL),
('VAN WANZELE', 'SANDRA', '0471 09 19 04', '', 3, '09:00:00', 83, 1, 0, 0, 0, '-28.00', '-18.00', '', 5, '2018-02-22 21:57:22', 6, NULL, NULL),
('DUBOIS', 'Suzy', '0491 44 22 84', '', 2, '09:00:00', 84, 1, 1, 0, 0, '8.00', '-1.50', '', 5, '2018-02-22 21:58:32', 6, NULL, NULL),
('DE PUES', 'Candice', '0472 65 37 19', '', 3, '09:00:00', 85, 1, 1, 0, 0, '16.50', '0.00', '', 5, '2018-02-22 21:59:08', 6, '2018-02-22 22:43:40', 6),
('LEONE', 'JENIFER', '0494 41 65 73', '', 7, '09:00:00', 86, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:59:57', 6, NULL, NULL),
('DUFRASNE', 'NICOLE', '0496 95 50 11', '', 2, '09:00:00', 87, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:00:52', 6, NULL, NULL),
('INGABIRE', 'MARIE-CLAIRE', '0487 558 867', '', 4, '09:00:00', 88, 1, 1, 0, 0, '-6.00', '-20.00', '', 5, '2018-02-22 22:01:44', 6, NULL, NULL),
('test2', 'test2', '', '', 0, '09:00:00', 89, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:11:06', 15, '2018-02-22 22:11:24', 15),
('AZIZOSKA', 'GANIMET', '', '', 1, '09:00:00', 90, 0, 0, 0, 0, '-4.00', '0.00', '', 5, '2018-02-22 22:44:40', 6, NULL, NULL),
('ALI', 'NATACHA', '', '', 6, '09:00:00', 91, 1, 1, 0, 0, '-32.00', '0.00', '', 5, '2018-02-22 22:45:19', 6, NULL, NULL),
('ASAN', 'JASAR', '', '', 1, '09:00:00', 92, 1, 1, 0, 0, '-20.00', '0.00', '', 5, '2018-02-22 22:45:48', 6, NULL, NULL),
('BECATTINI', 'Morena', '0484 78 50 27', '', 2, '09:00:00', 93, 1, 0, 0, 0, '-4.00', '0.00', '', 5, '2018-02-22 22:46:18', 6, NULL, NULL),
('DENNE', 'MELISSA', '0498 48 24 39', '', 2, '09:00:00', 94, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:46:43', 6, NULL, NULL),
('WANTIEZ', 'PAULETTE', '', '', 2, '09:00:00', 95, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:47:02', 6, NULL, NULL),
('BADULLAH', 'DENIS', '', '', 2, '09:00:00', 96, 0, 0, 0, 0, '-2.50', '0.00', '', 5, '2018-02-22 22:47:24', 6, NULL, NULL),
('MOUSSET', 'GAUTHIER', '0476 64 04 70', '', 1, '09:00:00', 97, 0, 0, 0, 0, '-4.00', '0.00', '', 5, '2018-02-22 22:48:07', 6, NULL, NULL),
('FICHEROULLE', 'MARJORIE', '', '', 6, '09:00:00', 98, 0, 0, 0, 0, '-16.00', '0.00', '', 5, '2018-02-22 22:48:38', 6, NULL, NULL),
('LETOR', 'MARIE-CHRISTINE', '0485 340 569', '', 6, '09:00:00', 99, 0, 1, 0, 0, '-28.00', '-57.50', '', 5, '2018-02-22 22:49:36', 6, NULL, NULL),
('DENIS', 'RÃ©jane', '0493 17 26 00', '', 4, '09:00:00', 100, 0, 1, 0, 0, '13.00', '0.00', '', 5, '2018-02-22 22:50:15', 6, '2018-02-22 22:51:36', 6),
('LIENARD', 'SYLVIE', '0486 73 03 80', '', 2, '09:00:00', 101, 0, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 22:51:15', 6, NULL, NULL),
('ZINGA', 'Isabella', '0476 50 75 51', '', 4, '09:00:00', 102, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:52:03', 6, NULL, NULL),
('WATTIER', 'CATHERINE', '0492072217', '', 4, '09:00:00', 103, 1, 0, 0, 0, '12.00', '0.00', '', 5, '2018-02-22 22:52:52', 6, NULL, NULL),
('PARDINI', 'VANESSA', '0498 44 08 71', '', 5, '09:00:00', 104, 1, 0, 0, 0, '-8.00', '-10.00', '', 5, '2018-02-22 22:53:42', 6, NULL, NULL),
('URBAIN', 'DANY', '0470 59 04 52', '', 3, '09:00:00', 105, 0, 1, 0, 0, '-41.00', '-25.00', '', 5, '2018-02-22 22:54:18', 6, NULL, NULL),
('DEHON', 'JONATHAN', '', '', 4, '09:00:00', 106, 0, 0, 0, 0, '-31.00', '-10.00', '', 5, '2018-02-22 22:54:45', 6, NULL, NULL),
('GLINEUR', 'Nathalie', '0470 87 51 06', '', 3, '09:00:00', 107, 0, 1, 0, 0, '-4.00', '-110.50', '', 5, '2018-02-22 22:55:25', 6, NULL, NULL),
('FRANCOIS', 'JACQUELINE', '', '', 1, '09:00:00', 108, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:54:28', 6, NULL, NULL),
('LIENARD', 'FREDERIQUE', '0471 72 54 82', '', 2, '09:00:00', 109, 1, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:55:02', 6, NULL, NULL),
('DEFRISE', 'EMMANUEL', '0487 42 24 20', '', 5, '09:00:00', 110, 1, 0, 0, 0, '0.00', '-10.00', '', 5, '2018-02-22 22:55:33', 6, NULL, NULL),
('MOUHTADI', 'HAFIDA', '0495 25 28 45', '', 6, '09:00:00', 111, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:55:56', 6, NULL, NULL),
('PERSENNEL', 'MICHELINE', '0477 70 77 51', '', 3, '09:00:00', 112, 0, 1, 0, 0, '-8.00', '-96.10', '', 5, '2018-02-22 22:56:33', 6, NULL, NULL),
('VAN WYMEERSCH', 'XAVIER', '0476 209 867', '', 2, '09:00:00', 113, 0, 0, 0, 0, '-4.00', '0.00', '', 5, '2018-02-22 22:57:10', 6, NULL, NULL),
('ESTIEVENART', 'GEORGETTE', '065 75 58 02', '', 1, '09:00:00', 114, 0, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:57:43', 6, NULL, NULL),
('RICOUR', 'Alexandre', '0470248814', '', 2, '09:00:00', 115, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:58:05', 6, NULL, NULL),
('CORNEZ', 'JESSICA', '0477 88 41 98', '', 3, '09:00:00', 116, 0, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:58:35', 6, NULL, NULL),
('BARA', 'MARIE-THERESE', '', '', 2, '09:00:00', 117, 0, 0, 0, 0, '-6.00', '0.00', '', 5, '2018-02-22 22:59:04', 6, NULL, NULL),
('HUBIN', 'FRANCOISE', '0491 92 04 02', '', 6, '09:00:00', 118, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:59:21', 6, NULL, NULL);

--
-- Déclencheurs `beneficiaires`
--
DELIMITER $$
CREATE TRIGGER `after_delete_beneficiaires` AFTER DELETE ON `beneficiaires` FOR EACH ROW BEGIN
    INSERT INTO beneficiaires_historique (
  `nom`,
  `prenom`,
  `tel`,
  `adresse`,
  `nbracharge`,
  `heurepassage`,
  `ref`,
  `sem1`,
  `sem2`,
  `sem3`,
  `sem4`,
  `solde_colis`,
  `solde_magasin`,
  `commentaire`,
  `jourpassage`,
  date_creation, -- date de création du beneficiaire
  id_utilisateur_creation, -- utilisateur ayant créé le beneficiaire
  date_modification, -- date de dernière modification du beneficiaire
  id_utilisateur_modification,
  
  date_histo,
  evenement_histo)
    VALUES (
        OLD.nom,
        OLD.prenom,
        OLD.tel,
        OLD.adresse,
        OLD.nbracharge,
        OLD.heurepassage,
        OLD.ref,
		OLD.sem1,
		OLD.sem2,
		OLD.sem3,
		OLD.sem4,
		OLD.solde_colis,
		OLD.solde_magasin,
		OLD.commentaire,
		OLD.jourpassage,
        OLD.date_creation,
        OLD.id_utilisateur_creation,
        OLD.date_modification,
        OLD.id_utilisateur_modification,

        NOW(),
        'D');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_beneficiaires` AFTER UPDATE ON `beneficiaires` FOR EACH ROW BEGIN
    INSERT INTO beneficiaires_historique (
  `nom`,
  `prenom`,
  `tel`,
  `adresse`,
  `nbracharge`,
  `heurepassage`,
  `ref`,
  `sem1`,
  `sem2`,
  `sem3`,
  `sem4`,
  `solde_colis`,
  `solde_magasin`,
  `commentaire`,
  `jourpassage`,
  date_creation, -- date de création du beneficiaire
  id_utilisateur_creation, -- utilisateur ayant créé le beneficiaire
  date_modification, -- date de dernière modification du beneficiaire
  id_utilisateur_modification,
  
  date_histo,
  id_utilisateur_histo,
  evenement_histo)
    VALUES (
        OLD.nom,
        OLD.prenom,
        OLD.tel,
        OLD.adresse,
        OLD.nbracharge,
        OLD.heurepassage,
        OLD.ref,
		OLD.sem1,
		OLD.sem2,
		OLD.sem3,
		OLD.sem4,
		OLD.solde_colis,
		OLD.solde_magasin,
		OLD.commentaire,
		OLD.jourpassage,
        OLD.date_creation,
        OLD.id_utilisateur_creation,
        OLD.date_modification,
        OLD.id_utilisateur_modification,

        NOW(),
        NEW.id_utilisateur_modification,
        'U');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_beneficiaires` BEFORE INSERT ON `beneficiaires` FOR EACH ROW BEGIN
    SET NEW.date_creation = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_beneficiaires` BEFORE UPDATE ON `beneficiaires` FOR EACH ROW BEGIN
    SET NEW.date_modification = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `beneficiaires_historique`
--

CREATE TABLE `beneficiaires_historique` (
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
  `solde_colis` decimal(10,2) NOT NULL COMMENT 'Solde colis actuel d''un bénéficiaire',
  `solde_magasin` decimal(10,2) NOT NULL COMMENT 'Solde magasin actuel d''un bénéficiaire',
  `commentaire` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Commentaire actuel d''un bénéficaire',
  `jourpassage` int(3) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `id_utilisateur_creation` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `id_utilisateur_modification` int(11) DEFAULT NULL,
  `date_histo` datetime NOT NULL,
  `id_utilisateur_histo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `evenement_histo` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `beneficiaires_historique`
--

INSERT INTO `beneficiaires_historique` (`nom`, `prenom`, `tel`, `adresse`, `nbracharge`, `heurepassage`, `ref`, `sem1`, `sem2`, `sem3`, `sem4`, `solde_colis`, `solde_magasin`, `commentaire`, `jourpassage`, `date_creation`, `id_utilisateur_creation`, `date_modification`, `id_utilisateur_modification`, `date_histo`, `id_utilisateur_histo`, `evenement_histo`) VALUES
('GRASSI', 'LORENZO', '0477 26 58 17', '', 0, '10:15:00', 4, 1, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 20:48:04', 6, NULL, NULL, '2018-02-22 20:48:45', '6', 'U'),
('GRASSI', 'LORENZO', '0477 26 58 17', '', 0, '10:15:00', 4, 1, 1, 1, 0, '0.00', '0.00', '', 5, '2018-02-22 20:48:04', 6, '2018-02-22 20:48:45', 6, '2018-02-22 20:50:31', '6', 'U'),
('DEMOUSTIER', 'PAUL', '', '', 1, '09:00:00', 3, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 20:47:31', 6, NULL, NULL, '2018-02-22 21:18:18', '6', 'U'),
('RENAUT', 'GEOFFREY', '0496 61 41 44', '', 0, '09:00:00', 28, 0, 1, 0, 0, '-8.00', '0.00', '', 5, '2018-02-22 21:09:26', 6, NULL, NULL, '2018-02-22 21:19:32', '6', 'U'),
('RENAUT', 'GEOFFREY', '0496 61 41 44', '', 0, '09:00:00', 28, 0, 1, 0, 0, '-8.00', '0.00', '', 5, '2018-02-22 21:09:26', 6, '2018-02-22 21:19:32', 6, '2018-02-22 21:19:57', '6', 'U'),
('FRANCOIS', 'MONIQUE', '', '', 2, '09:00:00', 23, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:06:03', 6, NULL, NULL, '2018-02-22 21:20:29', '6', 'U'),
('test', 'test', '', '', 0, '09:00:00', 34, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:22:13', 6, NULL, NULL, '2018-02-22 21:24:05', '6', 'U'),
('RENAUT', 'GEOFFREY', '0496 61 41 44', '', 0, '09:00:00', 28, 0, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:09:26', 6, '2018-02-22 21:19:57', 6, '2018-02-22 21:25:59', '6', 'U'),
('HENAUT', 'PATRICK', '0497 80 55 54', '', 3, '09:00:00', 54, 0, 1, 1, 0, '8.50', '0.00', '', 5, '2018-02-22 21:37:39', 6, NULL, NULL, '2018-02-22 21:37:49', '6', 'U'),
('HENAUT', 'PATRICK', '0497 80 55 54', '', 3, '09:00:00', 54, 0, 1, 1, 0, '8.00', '0.00', '', 5, '2018-02-22 21:37:39', 6, '2018-02-22 21:37:49', 6, '2018-02-22 21:38:02', '6', 'U'),
('CARION', 'AURELIE', '065 46 51 98', '', 5, '09:00:00', 78, 0, 0, 0, 0, '0.00', '-45.00', '', 5, '2018-02-22 21:53:48', 6, NULL, NULL, '2018-02-22 21:56:31', '6', 'U'),
('test', 'test', '', '', 0, '09:00:00', 34, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:22:13', 6, '2018-02-22 21:24:05', 6, '2018-02-22 22:05:15', '15', 'U'),
('test2', 'test2', '', '', 0, '09:00:00', 89, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:11:06', 15, NULL, NULL, '2018-02-22 22:11:24', '15', 'U'),
('COLLE ', 'CHRISTOPHE', '0493 13 30 87', '', 1, '09:00:00', 61, 0, 1, 1, 0, '-8.00', '0.00', '', 5, '2018-02-22 21:43:26', 6, NULL, NULL, '2018-02-22 22:13:57', '15', 'U'),
('DEMOUSTIER', 'PAUL', '', '', 1, '09:00:00', 3, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 20:47:31', 6, '2018-02-22 21:18:18', 6, '2018-02-22 22:14:54', '15', 'U'),
('FRANCOIS', 'MONIQUE', '', '', 2, '09:00:00', 23, 0, 0, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 21:06:03', 6, '2018-02-22 21:20:29', 6, '2018-02-22 22:15:48', '15', 'U'),
('MEZA SANCHEZ', 'MONICA', '0496 410 583', '', 6, '09:00:00', 58, 0, 1, 1, 0, '1.50', '-2.00', '', 5, '2018-02-22 21:41:53', 6, NULL, NULL, '2018-02-22 22:21:32', '15', 'U'),
('test', 'test', '', '', 0, '09:00:00', 34, 0, 0, 0, 0, '1.00', '0.00', '', 5, '2018-02-22 21:22:13', 6, '2018-02-22 22:05:15', 15, '2018-02-22 22:23:18', '15', 'U'),
('DEMOUSTIER', 'PAUL', '', '', 1, '09:00:00', 3, 0, 0, 0, 0, '16.00', '0.00', '', 5, '2018-02-22 20:47:31', 6, '2018-02-22 22:14:54', 15, '2018-02-22 22:35:36', '6', 'U'),
('FRANCOIS', 'MONIQUE', '', '', 2, '09:00:00', 23, 0, 0, 0, 0, '-4.00', '0.00', '', 5, '2018-02-22 21:06:03', 6, '2018-02-22 22:15:48', 15, '2018-02-22 22:36:02', '6', 'U'),
('MEZA SANCHEZ', 'MONICA', '0496 410 583', '', 6, '09:00:00', 58, 0, 1, 1, 0, '0.00', '-2.00', '', 5, '2018-02-22 21:41:53', 6, '2018-02-22 22:21:32', 15, '2018-02-22 22:36:41', '6', 'U'),
('DE PUES', 'Candace', '0472 65 37 19', '', 3, '09:00:00', 85, 1, 1, 0, 0, '16.50', '0.00', '', 5, '2018-02-22 21:59:08', 6, NULL, NULL, '2018-02-22 22:43:40', '6', 'U'),
('DENIS', 'RÃ©jane', '0493 17 26 00', '', 4, '09:00:00', 100, 0, 1, 0, 0, '0.00', '0.00', '', 5, '2018-02-22 22:50:15', 6, NULL, NULL, '2018-02-22 22:51:36', '6', 'U'),
('test', 'test', '', '', 0, '09:00:00', 34, 0, 0, 0, 0, '17.00', '0.00', '', 5, '2018-02-22 21:22:13', 6, '2018-02-22 22:23:18', 15, '2018-02-22 23:01:30', '6', 'D');

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
  `mail` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `mdp` text COLLATE utf8_unicode_ci NOT NULL,
  `ref` int(11) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `id_utilisateur_creation` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `id_utilisateur_modification` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `benevoles`
--

INSERT INTO `benevoles` (`nom`, `prenom`, `tel`, `adresse`, `secteur`, `mail`, `mdp`, `ref`, `date_creation`, `id_utilisateur_creation`, `date_modification`, `id_utilisateur_modification`) VALUES
('Picceu', 'Marielle', '0491915377', '17 rue marÃ©chal 59163 CondÃ© sur l\'Escaut', 3, 'marielle-et-pierre@hotmail.fr', '$2y$10$Q0iDeoFZvJgx8B9pKFN7NuprXSCZleoEz4twMxaAd.tAejOvj7CO6', 6, NULL, NULL, '2018-02-22 20:32:22', 6),
('PICCEU', 'Luc', '0478808688', 'Rue de PÃ¢turages, 56A, 7340 Wasmes', 1, 'lucaigleblanc@outlook.fr', '$2y$10$HlW8LWzjI2ZSWX8L3xhwX..hpkEQgWbM0pIsueMAkOCZfsGHIQgWG', 7, NULL, NULL, '2018-02-22 20:32:37', 6),
('HÃ©raut', 'Jason', '0499 82 43 51', '', 2, 'jason.heraut@gmail.com', '$2y$10$59elk45PX/ManKKbh5irxOSPOBDa8YDxDxOzApgtqzq5N85MqXA0S', 15, '2018-02-22 22:03:42', 6, NULL, NULL);

--
-- Déclencheurs `benevoles`
--
DELIMITER $$
CREATE TRIGGER `after_delete_benevoles` AFTER DELETE ON `benevoles` FOR EACH ROW BEGIN
    INSERT INTO benevoles_historique (
  `nom`,
  `prenom`,
  `tel`,
  `adresse`,
  `secteur`,
  `mail`,
  `mdp`,
  `ref`,
  date_creation, -- date de création du bénévole
  id_utilisateur_creation, -- utilisateur ayant créé le bénévole
  date_modification, -- date de dernière modification du bénévole
  id_utilisateur_modification,
  date_histo,
  evenement_histo)
    VALUES (
        OLD.nom,
        OLD.prenom,
        OLD.tel,
        OLD.adresse,
        OLD.secteur,
        OLD.mail,
        OLD.mdp,
        OLD.ref,
        OLD.date_creation,
        OLD.id_utilisateur_creation,
        OLD.date_modification,
        OLD.id_utilisateur_modification,

        NOW(),
        'D');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_benevoles` AFTER UPDATE ON `benevoles` FOR EACH ROW BEGIN
    INSERT INTO benevoles_historique (
  `nom`,
  `prenom`,
  `tel`,
  `adresse`,
  `secteur`,
  `mail`,
  `mdp`,
  `ref`,
  date_creation, -- date de création du bénévole
  id_utilisateur_creation, -- utilisateur ayant créé le bénévole
  date_modification, -- date de dernière modification du bénévole
  id_utilisateur_modification,
  
  date_histo,
  id_utilisateur_histo,
  evenement_histo)
    VALUES (
        OLD.nom,
        OLD.prenom,
        OLD.tel,
        OLD.adresse,
        OLD.secteur,
        OLD.mail,
        OLD.mdp,
        OLD.ref,
        OLD.date_creation,
        OLD.id_utilisateur_creation,
        OLD.date_modification,
        OLD.id_utilisateur_modification,

        NOW(),
        NEW.id_utilisateur_modification,
        'U');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_benevoles` BEFORE INSERT ON `benevoles` FOR EACH ROW BEGIN
    SET NEW.date_creation = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_benevoles` BEFORE UPDATE ON `benevoles` FOR EACH ROW BEGIN
    SET NEW.date_modification = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `benevoles_historique`
--

CREATE TABLE `benevoles_historique` (
  `nom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `secteur` int(100) NOT NULL,
  `mail` text COLLATE utf8_unicode_ci NOT NULL,
  `mdp` text COLLATE utf8_unicode_ci NOT NULL,
  `ref` int(11) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `id_utilisateur_creation` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `id_utilisateur_modification` int(11) DEFAULT NULL,
  `date_histo` datetime NOT NULL,
  `id_utilisateur_histo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `evenement_histo` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `benevoles_historique`
--

INSERT INTO `benevoles_historique` (`nom`, `prenom`, `tel`, `adresse`, `secteur`, `mail`, `mdp`, `ref`, `date_creation`, `id_utilisateur_creation`, `date_modification`, `id_utilisateur_modification`, `date_histo`, `id_utilisateur_histo`, `evenement_histo`) VALUES
('Picceu', 'Marielle', '04562315', '17 rue maréchal 59163 Condé sur l\'Escaut', 3, 'marielle-et-pierre@hotmail.fr', '$2y$10$Q0iDeoFZvJgx8B9pKFN7NuprXSCZleoEz4twMxaAd.tAejOvj7CO6', 6, NULL, NULL, '2018-02-22 14:15:25', 7, '2018-02-22 20:32:22', '6', 'U'),
('PICCEU', 'Luc', '0478808688', 'Rue de PÃ¢turages, 56A, 7340 Wasmes', 1, 'lucaigleblanc@outlook.fr', '$2y$10$HlW8LWzjI2ZSWX8L3xhwX..hpkEQgWbM0pIsueMAkOCZfsGHIQgWG', 7, NULL, NULL, NULL, NULL, '2018-02-22 20:32:37', '6', 'U');

-- --------------------------------------------------------

--
-- Structure de la table `districolis`
--

CREATE TABLE `districolis` (
  `identifiant` bigint(20) UNSIGNED NOT NULL COMMENT 'identifie de manière unique un colis',
  `refbeneficiaire` bigint(20) UNSIGNED NOT NULL COMMENT 'Indique quel client a acheté ce colis',
  `montantcolis` decimal(10,2) NOT NULL COMMENT 'Somme qu''il a été demandé au bénéficiaire pour payer le colis.',
  `montantpaye` decimal(10,2) NOT NULL COMMENT 'Montant payé le jour où la personne à acheté le colis',
  `datedistri` datetime NOT NULL,
  `commentaire` text COLLATE ascii_bin,
  `solde_colis` decimal(10,2) NOT NULL COMMENT 'Avances ou retards du client pour ses colis',
  `sem1` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 1 à l''époque où le colis a été distribué',
  `sem2` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 2 à l''époque où le colis a été distribué',
  `sem3` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 3 à l''époque où le colis a été distribué',
  `sem4` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 4 à l''époque où le colis a été distribué',
  `nbracharge` int(11) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `id_utilisateur_creation` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `id_utilisateur_modification` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Déclencheurs `districolis`
--
DELIMITER $$
CREATE TRIGGER `after_delete_districolis` AFTER DELETE ON `districolis` FOR EACH ROW BEGIN
    INSERT INTO districolis_historique (
  `identifiant`,
  `refbeneficiaire`,
  `montantcolis`,
  `montantpaye`,
  `datedistri`,
  `commentaire`,
  `solde_colis`,
  `sem1`,
  `sem2`,
  `sem3`,
  `sem4`,
  `nbracharge`,
  date_creation, -- date de création du beneficiaire
  id_utilisateur_creation, -- utilisateur ayant créé le beneficiaire
  date_modification, -- date de dernière modification du beneficiaire
  id_utilisateur_modification,
  
  date_histo,
  evenement_histo)
    VALUES (
        OLD.identifiant,
        OLD.refbeneficiaire,
        OLD.montantcolis,
        OLD.montantpaye,
        OLD.datedistri,
        OLD.commentaire,
		OLD.solde_colis,
		OLD.sem1,
		OLD.sem2,
		OLD.sem3,
		OLD.sem4,
		OLD.nbracharge,
        OLD.date_creation,
        OLD.id_utilisateur_creation,
        OLD.date_modification,
        OLD.id_utilisateur_modification,

        NOW(),
        'D');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_districolis` AFTER UPDATE ON `districolis` FOR EACH ROW BEGIN
    INSERT INTO districolis_historique (
  `identifiant`,
  `refbeneficiaire`,
  `montantcolis`,
  `montantpaye`,
  `datedistri`,
  `commentaire`,
  `solde_colis`,
  `sem1`,
  `sem2`,
  `sem3`,
  `sem4`,
  `nbracharge`,
  date_creation, -- date de création du beneficiaire
  id_utilisateur_creation, -- utilisateur ayant créé le beneficiaire
  date_modification, -- date de dernière modification du beneficiaire
  id_utilisateur_modification,
  
  date_histo,
  id_utilisateur_histo,
  evenement_histo)
    VALUES (
        OLD.identifiant,
        OLD.refbeneficiaire,
        OLD.montantcolis,
        OLD.montantpaye,
        OLD.datedistri,
        OLD.commentaire,
		OLD.solde_colis,
		OLD.sem1,
		OLD.sem2,
		OLD.sem3,
		OLD.sem4,
		OLD.nbracharge,
        OLD.date_creation,
        OLD.id_utilisateur_creation,
        OLD.date_modification,
        OLD.id_utilisateur_modification,

        NOW(),
        NEW.id_utilisateur_modification,
        'U');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_districolis` BEFORE INSERT ON `districolis` FOR EACH ROW BEGIN
    SET NEW.date_creation = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_districolis` BEFORE UPDATE ON `districolis` FOR EACH ROW BEGIN
    SET NEW.date_modification = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `districolis_historique`
--

CREATE TABLE `districolis_historique` (
  `identifiant` bigint(20) UNSIGNED NOT NULL COMMENT 'identifie de manière unique un colis',
  `refbeneficiaire` bigint(20) UNSIGNED NOT NULL COMMENT 'Indique quel client a acheté ce colis',
  `montantcolis` decimal(10,2) NOT NULL COMMENT 'Somme qu''il a été demandé au bénéficiaire pour payer le colis.',
  `montantpaye` decimal(10,2) NOT NULL COMMENT 'Montant payé le jour où la personne à acheté le colis',
  `datedistri` datetime NOT NULL,
  `commentaire` text CHARACTER SET ascii COLLATE ascii_bin,
  `solde_colis` decimal(10,2) NOT NULL COMMENT 'Avances ou retards du client pour ses colis',
  `sem1` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 1 à l''époque où le colis a été distribué',
  `sem2` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 2 à l''époque où le colis a été distribué',
  `sem3` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 3 à l''époque où le colis a été distribué',
  `sem4` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 4 à l''époque où le colis a été distribué',
  `nbracharge` int(11) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `id_utilisateur_creation` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `id_utilisateur_modification` int(11) DEFAULT NULL,
  `date_histo` datetime NOT NULL,
  `id_utilisateur_histo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `evenement_histo` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Structure de la table `parametres`
--

CREATE TABLE `parametres` (
  `cle` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valeur` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Paramètres du site de gestion';

--
-- Déchargement des données de la table `parametres`
--

INSERT INTO `parametres` (`cle`, `valeur`, `description`) VALUES
('MONTANT_COLIS_PAR_DEFAUT', '4', '');

-- --------------------------------------------------------

--
-- Structure de la table `signalement_presence`
--

CREATE TABLE `signalement_presence` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'identifie de manière unique un signalement de présence d''un bénéficiaire.',
  `refbeneficiaire` bigint(20) UNSIGNED NOT NULL COMMENT 'Identifiant du bénéficiaire afin de savoir de qui il s''agit.',
  `datesignalement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`ref`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Index pour la table `districolis`
--
ALTER TABLE `districolis`
  ADD PRIMARY KEY (`identifiant`),
  ADD UNIQUE KEY `identifiant` (`identifiant`),
  ADD KEY `refbeneficiaire` (`refbeneficiaire`);

--
-- Index pour la table `parametres`
--
ALTER TABLE `parametres`
  ADD PRIMARY KEY (`cle`);

--
-- Index pour la table `signalement_presence`
--
ALTER TABLE `signalement_presence`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `beneficiaires`
--
ALTER TABLE `beneficiaires`
  MODIFY `ref` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT pour la table `benevoles`
--
ALTER TABLE `benevoles`
  MODIFY `ref` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `districolis`
--
ALTER TABLE `districolis`
  MODIFY `identifiant` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'identifie de manière unique un colis';

--
-- AUTO_INCREMENT pour la table `signalement_presence`
--
ALTER TABLE `signalement_presence`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'identifie de manière unique un signalement de présence d''un bénéficiaire.';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
