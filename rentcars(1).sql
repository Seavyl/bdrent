-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 19 oct. 2022 à 16:36
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rentcars`
--

-- --------------------------------------------------------

--
-- Structure de la table `appliquer`
--

CREATE TABLE `appliquer` (
  `Id_commande` int(11) NOT NULL,
  `Id_promos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `Id_avis` int(11) NOT NULL,
  `commentaire` varchar(50) DEFAULT NULL,
  `datePub` varchar(50) DEFAULT NULL,
  `note` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `Id_commande` int(11) NOT NULL,
  `prix_location` double DEFAULT NULL,
  `prix_vente` double DEFAULT NULL,
  `date_depart` varchar(50) DEFAULT NULL,
  `date_arrivee` varchar(50) DEFAULT NULL,
  `facture_commande` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `laisser`
--

CREATE TABLE `laisser` (
  `Id_membre` int(11) NOT NULL,
  `Id_avis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `Id_membre` int(11) NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `pseudo` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `adressePostale` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `codePostal` int(50) NOT NULL,
  `ville` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `mdp` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `confirmationmdp` int(11) NOT NULL,
  `validation_token` varchar(60) DEFAULT NULL,
  `confirmation_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`Id_membre`, `prenom`, `nom`, `pseudo`, `email`, `adressePostale`, `codePostal`, `ville`, `mdp`, `confirmationmdp`, `validation_token`, `confirmation_at`) VALUES
(14, 'charlene', 'lombardi', 'lomb', 'charlene.lombardi@ik.me', '2 rue du vent', 83140, 'six fours', '$2y$10$34PFUy2z9.Pz4xMl9kPyo.UjfFRjHLrT6DdVxAbaiTv', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `passer`
--

CREATE TABLE `passer` (
  `Id_membre` int(11) NOT NULL,
  `Id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `promos`
--

CREATE TABLE `promos` (
  `Id_promos` int(11) NOT NULL,
  `code_promo` varchar(50) DEFAULT NULL,
  `remise` double DEFAULT NULL,
  `dateExpi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `id_vehicule` int(11) NOT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `modele` varchar(50) DEFAULT NULL,
  `catégorie` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `immatriculation` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `Id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appliquer`
--
ALTER TABLE `appliquer`
  ADD PRIMARY KEY (`Id_commande`,`Id_promos`),
  ADD KEY `Id_promos` (`Id_promos`);

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`Id_avis`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`Id_commande`);

--
-- Index pour la table `laisser`
--
ALTER TABLE `laisser`
  ADD PRIMARY KEY (`Id_membre`,`Id_avis`),
  ADD KEY `Id_avis` (`Id_avis`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`Id_membre`);

--
-- Index pour la table `passer`
--
ALTER TABLE `passer`
  ADD PRIMARY KEY (`Id_membre`,`Id_commande`),
  ADD KEY `Id_commande` (`Id_commande`);

--
-- Index pour la table `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`Id_promos`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`id_vehicule`),
  ADD KEY `Id_commande` (`Id_commande`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `Id_avis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `Id_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `Id_membre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `promos`
--
ALTER TABLE `promos`
  MODIFY `Id_promos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `id_vehicule` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appliquer`
--
ALTER TABLE `appliquer`
  ADD CONSTRAINT `appliquer_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`),
  ADD CONSTRAINT `appliquer_ibfk_2` FOREIGN KEY (`Id_promos`) REFERENCES `promos` (`Id_promos`);

--
-- Contraintes pour la table `laisser`
--
ALTER TABLE `laisser`
  ADD CONSTRAINT `laisser_ibfk_1` FOREIGN KEY (`Id_membre`) REFERENCES `membre` (`Id_membre`),
  ADD CONSTRAINT `laisser_ibfk_2` FOREIGN KEY (`Id_avis`) REFERENCES `avis` (`Id_avis`);

--
-- Contraintes pour la table `passer`
--
ALTER TABLE `passer`
  ADD CONSTRAINT `passer_ibfk_1` FOREIGN KEY (`Id_membre`) REFERENCES `membre` (`Id_membre`),
  ADD CONSTRAINT `passer_ibfk_2` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`);

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
