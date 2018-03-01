-- 09/11/2017 - Ajout du montant du colis
ALTER TABLE `districolis` ADD `montantcolis` DECIMAL(10,2) NOT NULL COMMENT 'Somme qu\'il a été demandé au bénéficiaire pour payer le colis.' AFTER `refbeneficiaire`;



-- 09/11/2017 - Création d'une table de paramétres et insertion d'un paramétre pour avoir un montant colis par défaut.
CREATE TABLE `parametres` (
  `cle` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valeur` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Paramètres du site de gestion';

ALTER TABLE `parametres`
  ADD PRIMARY KEY (`cle`);

INSERT INTO `parametres` (`cle`, `valeur`, `description`) VALUES ('MONTANT_COLIS_PAR_DEFAUT', '4', '');



-- 20/02/2018 - On modifie la table benevoles pour y ajouter des infos de tracing
ALTER TABLE benevoles 
    ADD COLUMN date_creation DATETIME, -- date de création du bénévole
    ADD COLUMN id_utilisateur_creation int(11), -- utilisateur ayant créé le bénévole
    ADD COLUMN date_modification DATETIME, -- date de dernière modification du bénévole
    ADD COLUMN id_utilisateur_modification int(11); -- utilisateur ayant fait la dernière modification du bénévole

DELIMITER |
CREATE TRIGGER before_insert_benevoles BEFORE INSERT
ON benevoles FOR EACH ROW
BEGIN
    SET NEW.date_creation = NOW();
END |

CREATE TRIGGER before_update_benevoles BEFORE UPDATE
ON benevoles FOR EACH ROW
BEGIN
    SET NEW.date_modification = NOW();
END |
DELIMITER ;


-- 20/02/2018 - On cree une table de tracing pour un historique de chaque benevole
CREATE TABLE `benevoles_historique` (
  `nom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `secteur` int(100) NOT NULL,
  `mail` text COLLATE utf8_unicode_ci NOT NULL,
  `mdp` text COLLATE utf8_unicode_ci NOT NULL,
  `ref` int(11) NOT NULL,
  date_creation DATETIME, -- date de création du bénévole
  id_utilisateur_creation int(11), -- utilisateur ayant créé le bénévole
  date_modification DATETIME, -- date de dernière modification du bénévole
  id_utilisateur_modification int(11), -- utilisateur ayant fait la dernière modification du bénévole
  
  -- Colonnes techniques
  date_histo DATETIME NOT NULL,
  id_utilisateur_histo VARCHAR(20) NOT NULL,
  evenement_histo CHAR(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT


DELIMITER |
CREATE TRIGGER after_update_benevoles AFTER UPDATE
ON benevoles FOR EACH ROW
BEGIN
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
END |

CREATE TRIGGER after_delete_benevoles AFTER DELETE
ON benevoles FOR EACH ROW
BEGIN
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
END |
DELIMITER ;



-- 20/02/2018 - On modifie la table benevoles pour y ajouter des infos de tracing
ALTER TABLE beneficiaires
    ADD COLUMN date_creation DATETIME, -- date de création du beneficiaire
    ADD COLUMN id_utilisateur_creation int(11), -- utilisateur ayant créé le beneficiaire
    ADD COLUMN date_modification DATETIME, -- date de dernière modification du beneficiaire
    ADD COLUMN id_utilisateur_modification int(11); -- utilisateur ayant fait la dernière modification du beneficiaire

DELIMITER |
CREATE TRIGGER before_insert_beneficiaires BEFORE INSERT
ON beneficiaires FOR EACH ROW
BEGIN
    SET NEW.date_creation = NOW();
END |

CREATE TRIGGER before_update_beneficiaires BEFORE UPDATE
ON beneficiaires FOR EACH ROW
BEGIN
    SET NEW.date_modification = NOW();
END |
DELIMITER ;


-- 20/02/2018 - On cree une table de tracing pour avoir un historique de chaque beneficiaire
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
  `solde` decimal(10,2) NOT NULL COMMENT 'Solde actuel d''un bénéficiaire',
  `commentaire` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Commentaire actuel d''un bénéficaire',
  `jourpassage` int(3) NOT NULL,
  date_creation DATETIME, -- date de création du beneficiaire
  id_utilisateur_creation int(11), -- utilisateur ayant créé le beneficiaire
  date_modification DATETIME, -- date de dernière modification du beneficiaire
  id_utilisateur_modification int(11), -- utilisateur ayant fait la dernière modification du beneficiaire
  
  -- Colonnes techniques
  date_histo DATETIME NOT NULL,
  id_utilisateur_histo VARCHAR(20) NOT NULL,
  evenement_histo CHAR(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT


DELIMITER |
CREATE TRIGGER after_update_beneficiaires AFTER UPDATE
ON beneficiaires FOR EACH ROW
BEGIN
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
  `solde`,
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
		OLD.solde,
		OLD.commentaire,
		OLD.jourpassage,
        OLD.date_creation,
        OLD.id_utilisateur_creation,
        OLD.date_modification,
        OLD.id_utilisateur_modification,

        NOW(),
        NEW.id_utilisateur_modification,
        'U');
END |

CREATE TRIGGER after_delete_beneficiaires AFTER DELETE
ON beneficiaires FOR EACH ROW
BEGIN
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
  `solde`,
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
		OLD.solde,
		OLD.commentaire,
		OLD.jourpassage,
        OLD.date_creation,
        OLD.id_utilisateur_creation,
        OLD.date_modification,
        OLD.id_utilisateur_modification,

        NOW(),
        'D');
END |
DELIMITER ;



-- 20/02/2018 - On rends impossible l'attribution d'une même adresse email à plusieurs bénévoles.
ALTER TABLE `benevoles` CHANGE `mail` `mail` VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `benevoles` ADD UNIQUE( `mail`);


-- 20/02/2018 - On modifie la table districolis pour y ajouter des infos de tracing
ALTER TABLE districolis 
    ADD COLUMN date_creation DATETIME, -- date de création du colis
    ADD COLUMN id_utilisateur_creation int(11), -- utilisateur ayant créé le colis
    ADD COLUMN date_modification DATETIME, -- date de dernière modification du colis
    ADD COLUMN id_utilisateur_modification int(11); -- utilisateur ayant fait la dernière modification du colis

DELIMITER |
CREATE TRIGGER before_insert_districolis BEFORE INSERT
ON districolis FOR EACH ROW
BEGIN
    SET NEW.date_creation = NOW();
END |

CREATE TRIGGER before_update_districolis BEFORE UPDATE
ON districolis FOR EACH ROW
BEGIN
    SET NEW.date_modification = NOW();
END |
DELIMITER ;


-- 20/02/2018 - On cree une table de tracing pour avoir un historique de chaque colis distribué
CREATE TABLE `districolis_historique` (
  `identifiant` bigint(20) UNSIGNED NOT NULL COMMENT 'identifie de manière unique un colis',
  `refbeneficiaire` bigint(20) UNSIGNED NOT NULL COMMENT 'Indique quel client a acheté ce colis',
  `montantcolis` decimal(10,2) NOT NULL COMMENT 'Somme qu''il a été demandé au bénéficiaire pour payer le colis.',
  `montantpaye` decimal(10,2) NOT NULL COMMENT 'Montant payé le jour où la personne à acheté le colis',
  `datedistri` datetime NOT NULL,
  `commentaire` text COLLATE ascii_bin,
  `solde` decimal(10,2) NOT NULL COMMENT 'Avances ou retards du client',
  `sem1` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 1 à l''époque où le colis a été distribué',
  `sem2` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 2 à l''époque où le colis a été distribué',
  `sem3` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 3 à l''époque où le colis a été distribué',
  `sem4` tinyint(1) NOT NULL COMMENT 'Historique : Semaine de passage 4 à l''époque où le colis a été distribué',
  `nbracharge` int(11) NOT NULL,
  date_creation DATETIME, -- date de création du colis
  id_utilisateur_creation int(11), -- utilisateur ayant créé le colis
  date_modification DATETIME, -- date de dernière modification du colis
  id_utilisateur_modification int(11), -- utilisateur ayant fait la dernière modification du colis
  
  -- Colonnes techniques
  date_histo DATETIME NOT NULL,
  id_utilisateur_histo VARCHAR(20) NOT NULL,
  evenement_histo CHAR(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT


DELIMITER |
CREATE TRIGGER after_update_districolis AFTER UPDATE
ON districolis FOR EACH ROW
BEGIN
    INSERT INTO districolis_historique (
  `identifiant`,
  `refbeneficiaire`,
  `montantcolis`,
  `montantpaye`,
  `datedistri`,
  `commentaire`,
  `solde`,
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
		OLD.solde,
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
END |

CREATE TRIGGER after_delete_districolis AFTER DELETE
ON districolis FOR EACH ROW
BEGIN
    INSERT INTO districolis_historique (
  `identifiant`,
  `refbeneficiaire`,
  `montantcolis`,
  `montantpaye`,
  `datedistri`,
  `commentaire`,
  `solde`,
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
		OLD.solde,
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
END |
DELIMITER ;



-- 22/02/2018 - Ajout d'une colonne solde pour le magasin.
ALTER TABLE `beneficiaires` CHANGE `solde` `solde_colis` DECIMAL(10,2) NOT NULL COMMENT 'Solde colis actuel d\'un bénéficiaire';

ALTER TABLE `beneficiaires` ADD `solde_magasin` DECIMAL(10,2) NOT NULL COMMENT 'Solde magasin actuel d\'un bénéficiaire' AFTER `solde_colis`;

ALTER TABLE `beneficiaires_historique` CHANGE `solde` `solde_colis` DECIMAL(10,2) NOT NULL COMMENT 'Solde colis actuel d\'un bénéficiaire';

ALTER TABLE `beneficiaires_historique` ADD `solde_magasin` DECIMAL(10,2) NOT NULL COMMENT 'Solde magasin actuel d\'un bénéficiaire' AFTER `solde_colis`;

DROP TRIGGER IF EXISTS `after_update_beneficiaires`;CREATE DEFINER=`root`@`localhost` TRIGGER `after_update_beneficiaires` AFTER UPDATE ON `beneficiaires` FOR EACH ROW BEGIN
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

DROP TRIGGER IF EXISTS `after_delete_beneficiaires`;CREATE DEFINER=`root`@`localhost` TRIGGER `after_delete_beneficiaires` AFTER DELETE ON `beneficiaires` FOR EACH ROW BEGIN
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

ALTER TABLE `districolis` CHANGE `solde` `solde_colis` DECIMAL(10,2) NOT NULL COMMENT 'Avances ou retards du client pour ses colis';

ALTER TABLE `districolis_historique` CHANGE `solde` `solde_colis` DECIMAL(10,2) NOT NULL COMMENT 'Avances ou retards du client pour ses colis';

DROP TRIGGER IF EXISTS `after_update_districolis`;CREATE DEFINER=`root`@`localhost` TRIGGER `after_update_districolis` AFTER UPDATE ON `districolis` FOR EACH ROW BEGIN
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

DROP TRIGGER IF EXISTS `after_delete_districolis`;CREATE DEFINER=`root`@`localhost` TRIGGER `after_delete_districolis` AFTER DELETE ON `districolis` FOR EACH ROW BEGIN
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



-- 01/03/2018 - Ajout d'une colonne aide_familiale pour les bénéficiares.
ALTER TABLE `beneficiaires` ADD `aide_familiale` BOOLEAN NOT NULL COMMENT 'Indique si le bénéficiaire dispose d\'une aide familiale.' AFTER `sem4`;

ALTER TABLE `beneficiaires_historique` ADD `aide_familiale` BOOLEAN NOT NULL COMMENT 'Indique si le bénéficiaire dispose d\'une aide familiale.' AFTER `sem4`;

DROP TRIGGER IF EXISTS `after_delete_beneficiaires`;CREATE DEFINER=`root`@`localhost` TRIGGER `after_delete_beneficiaires` AFTER DELETE ON `beneficiaires` FOR EACH ROW BEGIN
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
  `aide_familiale`,
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
        OLD.aide_familiale,
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

DROP TRIGGER IF EXISTS `after_update_beneficiaires`;CREATE DEFINER=`root`@`localhost` TRIGGER `after_update_beneficiaires` AFTER UPDATE ON `beneficiaires` FOR EACH ROW BEGIN
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
  `aide_familiale`,
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
        OLD.aide_familiale,
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