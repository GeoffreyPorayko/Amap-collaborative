-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 04 jan. 2022 à 00:12
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `amap`
--

-- --------------------------------------------------------

--
-- Structure de la table `aime`
--

CREATE TABLE `aime` (
  `id_user` int(11) NOT NULL,
  `id_recette` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `annotation`
--

CREATE TABLE `annotation` (
  `id_user` int(11) NOT NULL,
  `id_recette` int(11) NOT NULL,
  `note` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id` int(11) NOT NULL,
  `texte` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `compteutilisateur`
--

CREATE TABLE `compteutilisateur` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `mdp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `etape`
--

CREATE TABLE `etape` (
  `id` int(11) NOT NULL,
  `id_recette` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `contenu` int(11) NOT NULL,
  `temps` datetime NOT NULL,
  `numero` int(11) NOT NULL,
  `url_img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `expertise`
--

CREATE TABLE `expertise` (
  `id` int(11) NOT NULL,
  `nom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `expertise_utilisateur`
--

CREATE TABLE `expertise_utilisateur` (
  `id_user` int(11) NOT NULL,
  `id_expertise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `url_img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `producteur`
--

CREATE TABLE `producteur` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `url_img` varchar(500) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produitrecette`
--

CREATE TABLE `produitrecette` (
  `id_produit` int(11) NOT NULL,
  `id_recette` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `unité` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit_panier`
--

CREATE TABLE `produit_panier` (
  `id_panier` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `unite` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit_producteur`
--

CREATE TABLE `produit_producteur` (
  `id_producteur` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `statut` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

CREATE TABLE `recette` (
  `id` int(11) NOT NULL,
  `id_createur` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `url_img` varchar(500) NOT NULL,
  `saison` varchar(20) NOT NULL,
  `difficulte` tinyint(1) NOT NULL,
  `temps` datetime NOT NULL,
  `nb_pers` tinyint(3) NOT NULL,
  `type` varchar(50) NOT NULL,
  `regime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `recette_question`
--

CREATE TABLE `recette_question` (
  `id` int(11) NOT NULL,
  `id_recette` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reponse_question`
--

CREATE TABLE `reponse_question` (
  `id_question` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `reponse` varchar(2000) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `suivi`
--

CREATE TABLE `suivi` (
  `id_suiveur` int(11) NOT NULL,
  `id_suivi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ustensile`
--

CREATE TABLE `ustensile` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ustensile_recette`
--

CREATE TABLE `ustensile_recette` (
  `id_ustensile` int(11) NOT NULL,
  `id_recette` int(11) NOT NULL,
  `nombre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `url_img` varchar(500) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` int(10) NOT NULL,
  `id_prod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aime`
--
ALTER TABLE `aime`
  ADD PRIMARY KEY (`id_user`,`id_recette`),
  ADD KEY `id_recette` (`id_recette`);

--
-- Index pour la table `annotation`
--
ALTER TABLE `annotation`
  ADD PRIMARY KEY (`id_user`,`id_recette`),
  ADD KEY `id_recette` (`id_recette`);

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `compteutilisateur`
--
ALTER TABLE `compteutilisateur`
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `etape`
--
ALTER TABLE `etape`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_recette` (`id_recette`);

--
-- Index pour la table `expertise`
--
ALTER TABLE `expertise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `expertise_utilisateur`
--
ALTER TABLE `expertise_utilisateur`
  ADD PRIMARY KEY (`id_user`,`id_expertise`),
  ADD KEY `id_expertise` (`id_expertise`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `producteur`
--
ALTER TABLE `producteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD KEY `id` (`id`);

--
-- Index pour la table `produitrecette`
--
ALTER TABLE `produitrecette`
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_recette` (`id_recette`);

--
-- Index pour la table `produit_panier`
--
ALTER TABLE `produit_panier`
  ADD PRIMARY KEY (`id_panier`,`id_produit`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Index pour la table `produit_producteur`
--
ALTER TABLE `produit_producteur`
  ADD PRIMARY KEY (`id_produit`,`id_producteur`),
  ADD KEY `id_producteur` (`id_producteur`);

--
-- Index pour la table `recette`
--
ALTER TABLE `recette`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_createur` (`id_createur`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `recette_question`
--
ALTER TABLE `recette_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_recette` (`id_recette`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `reponse_question`
--
ALTER TABLE `reponse_question`
  ADD PRIMARY KEY (`id_question`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `suivi`
--
ALTER TABLE `suivi`
  ADD PRIMARY KEY (`id_suiveur`,`id_suivi`),
  ADD KEY `id_suivi` (`id_suivi`);

--
-- Index pour la table `ustensile`
--
ALTER TABLE `ustensile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `ustensile_recette`
--
ALTER TABLE `ustensile_recette`
  ADD PRIMARY KEY (`id_ustensile`,`id_recette`),
  ADD KEY `id_recette` (`id_recette`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD KEY `id` (`id`),
  ADD KEY `id_prod` (`id_prod`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etape`
--
ALTER TABLE `etape`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `expertise`
--
ALTER TABLE `expertise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `producteur`
--
ALTER TABLE `producteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recette`
--
ALTER TABLE `recette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recette_question`
--
ALTER TABLE `recette_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ustensile`
--
ALTER TABLE `ustensile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aime`
--
ALTER TABLE `aime`
  ADD CONSTRAINT `aime_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id`),
  ADD CONSTRAINT `aime_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `annotation`
--
ALTER TABLE `annotation`
  ADD CONSTRAINT `annotation_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id`),
  ADD CONSTRAINT `annotation_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `compteutilisateur`
--
ALTER TABLE `compteutilisateur`
  ADD CONSTRAINT `compteutilisateur_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `etape`
--
ALTER TABLE `etape`
  ADD CONSTRAINT `etape_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id`);

--
-- Contraintes pour la table `expertise_utilisateur`
--
ALTER TABLE `expertise_utilisateur`
  ADD CONSTRAINT `expertise_utilisateur_ibfk_1` FOREIGN KEY (`id_expertise`) REFERENCES `expertise` (`id`),
  ADD CONSTRAINT `expertise_utilisateur_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `producteur`
--
ALTER TABLE `producteur`
  ADD CONSTRAINT `producteur_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `produitrecette`
--
ALTER TABLE `produitrecette`
  ADD CONSTRAINT `produitrecette_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `produitrecette_ibfk_2` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id`);

--
-- Contraintes pour la table `produit_panier`
--
ALTER TABLE `produit_panier`
  ADD CONSTRAINT `produit_panier_ibfk_1` FOREIGN KEY (`id_panier`) REFERENCES `panier` (`id`),
  ADD CONSTRAINT `produit_panier_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit_producteur`
--
ALTER TABLE `produit_producteur`
  ADD CONSTRAINT `produit_producteur_ibfk_1` FOREIGN KEY (`id_producteur`) REFERENCES `producteur` (`id`),
  ADD CONSTRAINT `produit_producteur_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `recette`
--
ALTER TABLE `recette`
  ADD CONSTRAINT `recette_ibfk_1` FOREIGN KEY (`id_createur`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `recette_question`
--
ALTER TABLE `recette_question`
  ADD CONSTRAINT `recette_question_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id`),
  ADD CONSTRAINT `recette_question_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `reponse_question`
--
ALTER TABLE `reponse_question`
  ADD CONSTRAINT `reponse_question_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `recette_question` (`id`),
  ADD CONSTRAINT `reponse_question_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `suivi`
--
ALTER TABLE `suivi`
  ADD CONSTRAINT `suivi_ibfk_1` FOREIGN KEY (`id_suiveur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `suivi_ibfk_2` FOREIGN KEY (`id_suivi`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `ustensile_recette`
--
ALTER TABLE `ustensile_recette`
  ADD CONSTRAINT `ustensile_recette_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id`),
  ADD CONSTRAINT `ustensile_recette_ibfk_2` FOREIGN KEY (`id_ustensile`) REFERENCES `ustensile` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `producteur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
