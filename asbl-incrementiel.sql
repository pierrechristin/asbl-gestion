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