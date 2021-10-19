-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 17, 2021 at 07:17 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestform`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competences`
--

CREATE TABLE `competences` (
  `id_competence` int(11) NOT NULL,
  `id_savoir_faire` int(11) NOT NULL,
  `titre_competence` varchar(255) NOT NULL,
  `duree_competence` int(11) NOT NULL,
  `classement_competence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `competences`
--
DELIMITER $$
CREATE TRIGGER `maj_savoir_faire_delete` AFTER DELETE ON `competences` FOR EACH ROW CALL MAJ_savoir_faire(id_competence)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `maj_savoir_faire_insert` AFTER INSERT ON `competences` FOR EACH ROW CALL MAJ_savoir_faire(NEW.id_competence)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `maj_savoir_faire_update` AFTER UPDATE ON `competences` FOR EACH ROW CALL MAJ_savoir_faire(NEW.id_competence)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `formateurs`
--

CREATE TABLE `formateurs` (
  `id_formateur` int(11) NOT NULL,
  `nom_formateur` varchar(255) NOT NULL,
  `prenom_formateur` varchar(255) NOT NULL,
  `mail_formateur` varchar(255) NOT NULL,
  `tel_formateur` int(15) NOT NULL,
  `adresse_formateur` text NOT NULL,
  `naissance_formateur` date NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `formateur_module`
--

CREATE TABLE `formateur_module` (
  `id_module` int(11) NOT NULL,
  `id_formateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `formations`
--

CREATE TABLE `formations` (
  `id_formation` int(11) NOT NULL,
  `titre_formation` varchar(255) NOT NULL,
  `description_formation` text NOT NULL,
  `duree_formation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `formation_module`
--

CREATE TABLE `formation_module` (
  `id_formation` int(11) NOT NULL,
  `id_module` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `historique`
--

CREATE TABLE `historique` (
  `id_historique` int(11) NOT NULL,
  `id_stagiaire` int(11) NOT NULL,
  `id_formateur` int(11) NOT NULL,
  `id_savoir_faire` int(11) NOT NULL,
  `id_competence` int(11) NOT NULL,
  `note_stagiaire` varchar(255) NOT NULL,
  `note_formateur` varchar(255) NOT NULL,
  `commentaire_public` text NOT NULL,
  `commentaire_privee` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (  
  `id_module` int(11) NOT NULL,
  `titre_module` varchar(255) NOT NULL,
  `duree_module` int(11) NOT NULL,
  `classement_module` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `modules`
--
DELIMITER $$
CREATE TRIGGER `maj_formation_delete` AFTER DELETE ON `modules` FOR EACH ROW CALL MAJ_formation(id_module)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `maj_formation_insert` AFTER INSERT ON `modules` FOR EACH ROW CALL MAJ_formation(NEW.id_module)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `maj_formation_update` AFTER UPDATE ON `modules` FOR EACH ROW CALL MAJ_formation(NEW.id_module)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ressources`
--

CREATE TABLE `ressources` (
  `id_ressource` int(11) NOT NULL,
  `id_competence` int(11) NOT NULL,
  `titre_ressource` varchar(255) NOT NULL,
  `lien_ressource` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `savoir_faire`
--

CREATE TABLE `savoir_faire` (
  `id_savoir_faire` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `titre_savoir_faire` varchar(255) NOT NULL,
  `duree_savoir_faire` int(11) NOT NULL,
  `classement_savoir_faire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `savoir_faire`
--
DELIMITER $$
CREATE TRIGGER `maj_module_delete` AFTER DELETE ON `savoir_faire` FOR EACH ROW CALL MAJ_module(id_savoir_faire)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `maj_module_insert` AFTER INSERT ON `savoir_faire` FOR EACH ROW CALL MAJ_module(NEW.id_savoir_faire)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `maj_module_update` AFTER UPDATE ON `savoir_faire` FOR EACH ROW CALL MAJ_module(NEW.id_savoir_faire)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stagiaires`
--

CREATE TABLE `stagiaires` (
  `id_stagiaire` int(11) NOT NULL,
  `nom_stagiaire` varchar(250) NOT NULL,
  `prenom_stagiaire` varchar(250) NOT NULL,
  `mail_stagiaire` varchar(250) NOT NULL,
  `tel_stagiaire` int(15) NOT NULL,
  `adresse_stagiaire` varchar(1000) NOT NULL,
  `naissance_stagiaire` date NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stagiaires_formations`
--

CREATE TABLE `stagiaires_formations` (
  `id_entree_formation` int(11) NOT NULL,
  `id_stagiaire` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL,
  `date_entree` date NOT NULL,
  `date_sortie` date NOT NULL,
  `date_debut_stage` date NOT NULL,
  `date_fin_stage` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competences`
--
ALTER TABLE `competences`
  ADD PRIMARY KEY (`id_competence`),
  ADD KEY `id_savoir_faire` (`id_savoir_faire`);

--
-- Indexes for table `formateurs`
--
ALTER TABLE `formateurs`
  ADD PRIMARY KEY (`id_formateur`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `formateur_module`
--
ALTER TABLE `formateur_module`
  ADD KEY `id_module` (`id_module`),
  ADD KEY `id_formateur` (`id_formateur`);

--
-- Indexes for table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`id_formation`);

--
-- Indexes for table `formation_module`
--
ALTER TABLE `formation_module`
  ADD KEY `id_formation` (`id_formation`),
  ADD KEY `id_module` (`id_module`);

--
-- Indexes for table `historique`
--
ALTER TABLE `historique`
  ADD PRIMARY KEY (`id_historique`),
  ADD KEY `id_stagiaire` (`id_stagiaire`),
  ADD KEY `id_formateur` (`id_formateur`),
  ADD KEY `id_savoir_faire` (`id_savoir_faire`),
  ADD KEY `id_competence` (`id_competence`) USING BTREE;

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id_module`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ressources`
--
ALTER TABLE `ressources`
  ADD PRIMARY KEY (`id_ressource`),
  ADD KEY `id_competence` (`id_competence`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexes for table `savoir_faire`
--
ALTER TABLE `savoir_faire`
  ADD PRIMARY KEY (`id_savoir_faire`),
  ADD KEY `id_module` (`id_module`);

--
-- Indexes for table `stagiaires`
--
ALTER TABLE `stagiaires`
  ADD PRIMARY KEY (`id_stagiaire`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `stagiaires_formations`
--
ALTER TABLE `stagiaires_formations`
  ADD PRIMARY KEY (`id_entree_formation`),
  ADD KEY `id_stagiaire` (`id_stagiaire`),
  ADD KEY `id_formation` (`id_formation`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competences`
--
ALTER TABLE `competences`
  MODIFY `id_competence` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formateurs`
--
ALTER TABLE `formateurs`
  MODIFY `id_formateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formations`
--
ALTER TABLE `formations`
  MODIFY `id_formation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historique`
--
ALTER TABLE `historique`
  MODIFY `id_historique` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id_module` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ressources`
--
ALTER TABLE `ressources`
  MODIFY `id_ressource` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savoir_faire`
--
ALTER TABLE `savoir_faire`
  MODIFY `id_savoir_faire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stagiaires`
--
ALTER TABLE `stagiaires`
  MODIFY `id_stagiaire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stagiaires_formations`
--
ALTER TABLE `stagiaires_formations`
  MODIFY `id_entree_formation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competences`
--
ALTER TABLE `competences`
  ADD CONSTRAINT `competences_ibfk_1` FOREIGN KEY (`id_savoir_faire`) REFERENCES `savoir_faire` (`id_savoir_faire`) ON UPDATE CASCADE;

--
-- Constraints for table `formateurs`
--
ALTER TABLE `formateurs`
  ADD CONSTRAINT `formateurs_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `formateur_module`
--
ALTER TABLE `formateur_module`
  ADD CONSTRAINT `formateur_module_ibfk_1` FOREIGN KEY (`id_module`) REFERENCES `modules` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formateur_module_ibfk_2` FOREIGN KEY (`id_formateur`) REFERENCES `formateurs` (`id_formateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `formation_module`
--
ALTER TABLE `formation_module`
  ADD CONSTRAINT `formation_module_ibfk_1` FOREIGN KEY (`id_module`) REFERENCES `modules` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formation_module_ibfk_2` FOREIGN KEY (`id_formation`) REFERENCES `formations` (`id_formation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `historique_ibfk_1` FOREIGN KEY (`id_formateur`) REFERENCES `formateurs` (`id_formateur`) ON UPDATE CASCADE,
  ADD CONSTRAINT `historique_ibfk_2` FOREIGN KEY (`id_stagiaire`) REFERENCES `stagiaires` (`id_stagiaire`) ON UPDATE CASCADE,
  ADD CONSTRAINT `historique_ibfk_3` FOREIGN KEY (`id_competence`) REFERENCES `competences` (`id_competence`) ON UPDATE CASCADE,
  ADD CONSTRAINT `historique_ibfk_4` FOREIGN KEY (`id_savoir_faire`) REFERENCES `savoir_faire` (`id_savoir_faire`) ON UPDATE CASCADE;

--
-- Constraints for table `ressources`
--
ALTER TABLE `ressources`
  ADD CONSTRAINT `ressources_ibfk_1` FOREIGN KEY (`id_competence`) REFERENCES `competences` (`id_competence`) ON UPDATE CASCADE;

--
-- Constraints for table `savoir_faire`
--
ALTER TABLE `savoir_faire`
  ADD CONSTRAINT `savoir_faire_ibfk_1` FOREIGN KEY (`id_module`) REFERENCES `modules` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stagiaires`
--
ALTER TABLE `stagiaires`
  ADD CONSTRAINT `stagiaires_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `stagiaires_formations`
--
ALTER TABLE `stagiaires_formations`
  ADD CONSTRAINT `stagiaires_formations_ibfk_1` FOREIGN KEY (`id_stagiaire`) REFERENCES `stagiaires` (`id_stagiaire`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stagiaires_formations_ibfk_2` FOREIGN KEY (`id_formation`) REFERENCES `formations` (`id_formation`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


DELIMITER $$
CREATE PROCEDURE `MAJ_savoir_faire`(IN `p_id_competence` INT)
BEGIN
      DECLARE done INT DEFAULT 0;
      DECLARE id_savoir_faire INTEGER;
      DECLARE cur CURSOR FOR SELECT `savoir_faire`.`id_savoir_faire` FROM `competences`,`savoir_faire` WHERE `competences`.`id_competence` = p_id_competence AND `competences`.`id_competence` = `savoir_faire`.`id_savoir_faire`;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      OPEN cur;
      label: LOOP
      FETCH cur INTO id_savoir_faire;
      UPDATE `savoir_faire` SET `duree_savoir_faire` = (SELECT SUM(`competences`.`duree_competence`) FROM `competences` WHERE `competences`.`id_competence` AND `competences`.`id_savoir_faire` = `savoir_faire`.`id_savoir_faire`);
      IF done = 1 THEN LEAVE label;
      END IF;
      END LOOP;
      CLOSE cur;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `MAJ_formation`(IN `p_id_module` INT)
BEGIN
      DECLARE done INT DEFAULT 0;
      DECLARE id_formation INTEGER;
      DECLARE cur CURSOR FOR 
        SELECT `formation_module`.`id_formation` 
        FROM `modules`, `formation_module` WHERE `modules`.`id_module` = p_id_module 
        AND `modules`.`id_module` = `formation_module`.`id_module`;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      OPEN cur;
      label: LOOP
      FETCH cur INTO id_formation;
        UPDATE `formations` 
        SET `duree_formation` = 
          (SELECT SUM(`modules`.`duree_module`) 
          FROM `modules`, `formation_module` 
          WHERE `modules`.`id_module` = `formation_module`.`id_module`    
          AND  `formation_module`.`id_formation` = id_formation) 
          WHERE `formations`.`id_formation` = id_formation;
      IF done = 1 THEN LEAVE label;
      END IF;
      END LOOP;
      CLOSE cur;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `MAJ_module`(IN `p_id_savoir_faire` INT)
BEGIN
      DECLARE done INT DEFAULT 0;
      DECLARE id_module INTEGER;
      DECLARE cur CURSOR FOR SELECT `modules`.`id_module` FROM `modules`,`savoir_faire`
      WHERE `savoir_faire`.`id_savoir_faire` = p_id_savoir_faire AND `savoir_faire`.`id_savoir_faire` = `modules`.`id_module`;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      OPEN cur;
      label: LOOP
      FETCH cur INTO id_module;
      UPDATE `modules` SET `duree_module` = (SELECT SUM(`savoir_faire`.`duree_savoir_faire`) FROM `savoir_faire` WHERE `savoir_faire`.`id_savoir_faire` AND `savoir_faire`.`id_module` = `modules`.`id_module`);
      IF done = 1 THEN LEAVE label;
  END IF;
  END LOOP;
  CLOSE cur;
END$$
DELIMITER ;
