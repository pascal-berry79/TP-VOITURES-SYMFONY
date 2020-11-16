-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 16 nov. 2020 à 09:24
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tp-voitures-symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `constructeurs`
--

CREATE TABLE `constructeurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resume` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `constructeurs`
--

INSERT INTO `constructeurs` (`id`, `nom`, `logo`, `image`, `resume`) VALUES
(1, 'Bugatti', 'images/logos/bugatti-logo.png', 'images/constructeurs/bugatti.jpg', 'Bugatti Automobiles4 est un constructeur automobile français appartenant au groupe allemand Volkswagen AG depuis son rachat en 1998. Fondée en 1909 par le constructeur franco-italien Ettore Bugatti, l’entreprise française est longtemps considérée comme pionnière dans le domaine de l’automobile et produit de luxueuses sportives de prestige marquées par l’adage cher à Ettore : « Rien n’est trop beau, rien n’est trop cher »5.'),
(2, 'Chenard & Walcker', 'images/logos/cw-logo.jpg', 'images/constructeurs/chenard.jpg', 'La firme Chenard & Walcker fut fondée en 1899 à Gennevilliers, près de Paris, par Henry Walcker et Ernest Chenard, qui décèdera brutalement en 1922. Son fils Lucien qui lui succéda ne parviendra finalement pas à faire prospérer son entreprise, bien que la firme remporta une victoire mémorable à la première édition des 24 Heures du Mans en 1923. Après avoir été l\'une des plus florissantes firmes automobiles françaises au cours des années 10 et 20, Chenard & Walcker sera en perte de vitesse au cours des années 30, victime comme tant d\'autres de la grave crise économique que traversait le monde à cette époque. Une tentative d\'association de Chenard & Walcker avec la firme Delahaye échouera au début des années 30. Le lancement raté de la traction avant Chenard & Walcker Super Aigle en 1934, dû à la concurrence écrasante des Citroen Traction avant 7 et 11CV lancées en même temps, provoquèrent de graves difficultés financières qui mirent en péril la survie de la marque de Gennevilliers. Lucien Chenard décida alors de changer toutes ses carrosseries en 1935. Pour faire au plus vite, il sadressa aux Usines Chausson pour ses modèles V8. Chausson accepta de livrer ces mêmes caisses tout acier à la firme Chenard & Walcker, à la condition que Chausson devienne le nouveau propriétaire de la firme de Gennevilliers. En 1936, Chenard & Walcker passa donc sous le contrôle de Chausson.'),
(3, 'Delâge', 'images/logos/delage-logo.png', 'images/constructeurs/delage.jpg', 'Delage est une marque automobile française, fondée en 1905 par Louis Delâge à Levallois-Perret, rachetée par Delahaye en 1935 et disparue en 1953. En novembre 2019 , l\'association « Les Amis de Delage », créée en 1956 et propriétaire de la marque Delage, annonce la refondation de la société Delage Automobiles.'),
(4, 'Delahaye', 'images/logos/delahaye-logo.png', 'images/constructeurs/delahaye.jpg', 'Delahaye était un constructeur français d\'automobiles de luxe, de poids lourds et de véhicules d\'incendie, pionnier de l\'automobile depuis 1895. La firme reprit Delage en 1935 puis disparut en 1954 rachetée par Hotchkiss.');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201112094601', '2020-11-12 10:54:05', 294);

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE `voitures` (
  `id` int(11) NOT NULL,
  `id_constructeur_id` int(11) NOT NULL,
  `modele` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annee` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resume` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`id`, `id_constructeur_id`, `modele`, `annee`, `image`, `resume`) VALUES
(1, 1, 'Bugatti Type 32', 1923, 'images/bugatti/bugatti-type32-1923.png', 'La type 32 étrennait une carrosserie pour le moins originale, en forme d\'aile d\'avion. Son style sans fioriture lui valut rapidement le surnom de tank. Basée sur la type 30, son châssis surbaissé passait sous les essieux. Ettore Bugatti, sans formation spécifique sur les questions d\'aérodynamique, s\'était aventuré sur un terrain qu\'il connaissait mal. La voiture devenait impossible à maîtriser à hautes vitesses, et tout le talent de Friederich fut nécessaire pour conduire le tank Bugatti à la troisième place lors de sa première course, le Grand Prix de l\'ACF en 1923. Malgré ce résultat mitigé, la voiture fut exposée sur le stand Bugatti du salon de Paris cette même année. Ettore tirait les conclusions qui s\'imposaient, et orientait ses recherches vers un autre type d\'automobile radicalement différent. La Bugatti 35 allait bientôt prendre forme.'),
(2, 1, 'Bugatti Type 73', 1947, 'images/bugatti/bugatti-type73-1947.png', 'Au sortir de la guerre, Ettore Bugatti lançait l\'étude d\'un 4 cylindres de 1488 cm3 en deux versions, d\'une part un modèle 73 A à simple arbre à cames pour une voiture de sport, d\'autre part un modèle 73 C à double arbre à cames pour la course. Cette seconde version était destinée à une série de vingt cinq voitures très attendues par les sportifs. Ces deux moteurs étaient exposés sur un châssis au salon de Paris en octobre 1947. Un prototype fut construit, qui reprenait quelques-uns des traits caractéristiques des types 64 et 68. Un moteur type 75 B fut également étudiée. Il s\'agissait d\'une version dérivée du 73 A qui se distinguait par sa culasse détachable à huit soupapes. Avec la 68, la type 73 devait permettre à la firme de retrouver sa place sur un marché resserré et en pleine mutation. Mais malgré les projets, Ettore Bugatti n\'avait plus les moyens de reprendre la production automobile. De plus, en ces années troubles 1945/47, l\'administration française ne cessait de le tracasser. Les types 68 et 73 avaient montré que l\'étude de formes aérodynamiques était devenue systématique, et que les progrès réalisés dans ce domaine par la plupart des constructeurs étaient visibles au premier coup d\'oeil. Pourtant, la type 101 qui allait succéder à ces deux projets allait évoluer dans une autre direction stylistique. Une type 78 fut étudiée en 1946 mais jamais produite. Il s\'agissait d\'une grande routière munie d\'un 8 cylindres de 4,3 litres.'),
(3, 2, 'Chenard & Walcker Aigle 8', 1939, 'images/chenardwalcker/chenard-walcker-aigle8-1939.png', 'La Chenard & Walcker Aigle 8 U16 fut produite en 1937 en 15 exemplaires. Caractéristiques: Le modèle U16 (phares en dehors et capot à l\'ancienne) avec le V8 Ford, 3,6 litres, est une présérie de 15 automobiles qui a servi de test pour relancer en 37 la marque CW qui avait fait faillite 4 mois avant.'),
(4, 2, 'Chenard & Walcker Aigle 22', 1939, 'images/chenardwalcker/chenard-walcker-aigle22-1939.png', 'La Chenard & Walcker Aigle 22 est une berline moyenne gamme, déclinée en plusieurs versions de carrosseries. Depuis la reprise en main par le carrossier Chausson, le catalogue ne comprend plus que deux modèles, l\'Aigle 22, à moteur Citroën 4 cylindres et l\'Aigle 8 à moteur V8 Matford. Chausson, qui construisait déjà les carrosseries tout acier sous licence Budd des Matford Alsace, obtient du constructeur de pouvoir utiliser ses carrosseries également pour Chenard & Walcker. L\'allure de la Matford Alsace est reconnaissable à ses phares globuleux encastrés dans les ailes, mais l\'avant est différent, avec une calandre et un entourage de capot crocodile très réussis. Une version Familiale à 6 glaces est également fabriquée seulement pour Chenard. Vers 1935, le carrossier parisien Henri Labourdette, propose un système de pare-brise sans montant pour les cabriolets haut de gamme conçu par l\'ingénieur Joseph Vigroux. Le modèle le plus emblématique est sûrement la Rolls-Royce Phantom III de 1938. Après-guerre,on retrouve le Vutotal sur un prototype de Renault 4 CV et sur le prototype Georges Irat.'),
(5, 3, 'Delage D6 60', 1936, 'images/delage/delage-D6-60-1936.png', 'En 1932, arriva la D6-11 et deux ans plus tard la nouvelle Delage huit cylindres, la D8-15. Les derniers modèles qui voient le jour à Courbevoie sont les D6-65, D8-85 et D8-105 et ce sera la fermeture de l\'usine. La toute première Delage fut une 9cv motorisée par un moteur de marque De Dion. Plus tard arriva un modèle quatre cylindres de 9 CV, puis une 12 CV et une six cylindres, Delage dispose dès 1908 de 4000 m2 d\'atelier.'),
(6, 3, 'Delage D6 3 Litres', 1953, 'images/delage/delage-D6-3Litres-1953.jpg', 'La Delage D6 3 Litres ou D6 - 75, photo d\'époque, cette ancienne voiture fut produite de 1946 à 1954 en 2 motorisations de 2.9 L présentant des puissances de 90 ch à 100 ch. La gamme Delage de 1939 comportait 3 modèles principaux dont seul le D6-75 subsiste en 1946 dans une version avec moteur 3 litres dont les premiers exemplaires étaient apparus au printemps 1939. Ce 3 litres est le descendant de la famille des six cylindres créée en 1934 par l’ingénieur Michelat. Tout ces moteurs se caractérisaient par leur course commune de 90.5mm. Le 3 litres de 2984 cc était déjà celle du prototype Grand Sport apparu au printemps 1936 dont l’alésage de 83.7mm constitue l’extrême limite possible. Doté de soupapes en tête commandées par des culbuteurs et un arbre à cames latéral, ce moteur 3 litres reçoit un carburateur Solex type 40 AIP avec starter, sa puissance atteint 100ch. La Delage D6-3 litres dispose d’une boîte électromagnétique Cotal 4 rapports, un sélecteur sous le volant agissant, par l’intermédiaire d’un connecteur sur les 4 électro-aimants des vitesses. Un levier inverseur est prévu au plancher, il actionne la marche arrière qui agit sur les 4 rapports. Le reste de la voiture est classique avec un châssis à longerons et traverses, une suspension avant à roues indépendantes et un essieu arrière rigide. Cette Delage D6-3 Litres est livrable en version normale sur châssis de 3150mm d’empattement ou en version avec empattement rallongé de 150mm.'),
(7, 4, 'Delahaye Type 135', 1937, 'images/delahaye/delahaye-135-1937.png', 'Avec ses variantes Type 145, 165, et 175, la Type 135 (motorisée par un moteur 6 cylindres de 3,2 à 3,5 L pour 95 à 120 ch) remporte un important succès en compétition, victorieuse entre autres des Rallye des Alpes françaises 1935, et 24 Heures du Mans 1938. Elle remporte également un important succès commercial, plus vendue que ses concurrentes de l\'époque, les Bugatti Type 57, Talbot-Lago T150, Delage D6, Panhard et Levassor Dynamic, Renault Vivastella, Hotchkiss 20 CV Grand Sport (686 GS), Salmson S4 E, et autres Talbot-Lago Baby.'),
(8, 4, 'Delahaye Type 235', 1957, 'images/delahaye/delahaye-235-1951.png', 'Dérivé du type 135, la 235 reprend son moteur 6 cylindres poussé de 130 à 152 ch réels pour 180 km/h en pointe. La conduite est toujours à droite (selon la tradition) et les freins toujours à câbles (solutions dépassées pour l\'époque). Le coach d\'origine dessiné par Philippe Charbonneaux est exécuté en Italie par Motto puis en France par Antem. Le type 235 sera produits à 84 exemplaires, dont beaucoup carrossés par Henri Chapron. En juillet 1954, le type 235 disparaît avec Delahaye.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `constructeurs`
--
ALTER TABLE `constructeurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8B58301B614B758D` (`id_constructeur_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `constructeurs`
--
ALTER TABLE `constructeurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `voitures`
--
ALTER TABLE `voitures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD CONSTRAINT `FK_8B58301B614B758D` FOREIGN KEY (`id_constructeur_id`) REFERENCES `constructeurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
