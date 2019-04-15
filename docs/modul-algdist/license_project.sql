-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: apr. 15, 2019 la 02:15 PM
-- Versiune server: 10.1.38-MariaDB
-- Versiune PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `license_project`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `admini`
--

CREATE TABLE `admini` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `parola` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `comisii`
--

CREATE TABLE `comisii` (
  `id` int(10) UNSIGNED NOT NULL,
  `nume_sala` varchar(32) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `orar`
--

CREATE TABLE `orar` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_comisie` int(10) UNSIGNED DEFAULT NULL,
  `id_prof` int(10) UNSIGNED DEFAULT NULL,
  `id_student` int(10) UNSIGNED DEFAULT NULL,
  `ora` time NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `profesori`
--

CREATE TABLE `profesori` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_comisie` int(10) UNSIGNED DEFAULT NULL,
  `nume` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `prenume` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `grad_didactic` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `rol` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `parola` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `studenti`
--

CREATE TABLE `studenti` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_comisie` int(10) UNSIGNED DEFAULT NULL,
  `id_prof` int(10) UNSIGNED DEFAULT NULL,
  `nr_matricol` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `nume` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `prenume` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `data_nastere` date NOT NULL,
  `repository` text COLLATE latin1_general_ci NOT NULL,
  `email` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `parola` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `admini`
--
ALTER TABLE `admini`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexuri pentru tabele `comisii`
--
ALTER TABLE `comisii`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `orar`
--
ALTER TABLE `orar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_comisie` (`id_comisie`),
  ADD KEY `id_prof` (`id_prof`),
  ADD KEY `id_student` (`id_student`);

--
-- Indexuri pentru tabele `profesori`
--
ALTER TABLE `profesori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_comisie` (`id_comisie`);

--
-- Indexuri pentru tabele `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nr_matricol` (`nr_matricol`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_comisie` (`id_comisie`),
  ADD KEY `id_prof` (`id_prof`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `admini`
--
ALTER TABLE `admini`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `comisii`
--
ALTER TABLE `comisii`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `orar`
--
ALTER TABLE `orar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `profesori`
--
ALTER TABLE `profesori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `studenti`
--
ALTER TABLE `studenti`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `orar`
--
ALTER TABLE `orar`
  ADD CONSTRAINT `orar_ibfk_1` FOREIGN KEY (`id_comisie`) REFERENCES `comisii` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `orar_ibfk_2` FOREIGN KEY (`id_prof`) REFERENCES `profesori` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `orar_ibfk_3` FOREIGN KEY (`id_student`) REFERENCES `studenti` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constrângeri pentru tabele `profesori`
--
ALTER TABLE `profesori`
  ADD CONSTRAINT `profesori_ibfk_1` FOREIGN KEY (`id_comisie`) REFERENCES `comisii` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constrângeri pentru tabele `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`id_comisie`) REFERENCES `comisii` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `studenti_ibfk_2` FOREIGN KEY (`id_prof`) REFERENCES `profesori` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
