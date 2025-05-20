-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 03:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matching-job`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `skills` text NOT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`preferences`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `name`, `skills`, `requirements`, `preferences`, `created_at`, `updated_at`) VALUES
(401, 'Lafayette Beier', '[\"react\",\"laravel\",\"mysql\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[165,182,164,166,167,168,169,170,171,173,176,178,181,172,174,175,177,179,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(402, 'Lola Kunde II', '[\"mysql\",\"javascript\",\"laravel\",\"node\",\"html\"]', '[\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\"]', '[166,176,179,164,165,167,168,169,170,171,172,173,174,175,177,178,180,181,182,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(403, 'Robert Kling', '[\"mysql\",\"laravel\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '[166,178,179,164,165,168,170,171,172,175,176,177,180,182,167,169,173,174,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(404, 'Dr. Pansy Brekke Sr.', '[\"node\",\"css\",\"laravel\"]', '[\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[165,168,182,164,166,167,169,170,171,172,173,176,178,174,175,177,179,180,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(405, 'Mose Lueilwitz', '[\"node\",\"react\",\"laravel\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[164,166,171,165,167,168,169,173,175,176,177,178,179,180,182,170,172,174,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(406, 'Gregory Lakin', '[\"react\",\"javascript\"]', '[\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\"]', '[165,166,168,176,182,164,167,169,170,171,172,173,178,179,174,175,177,180,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(407, 'Abdul Konopelski', '[\"css\",\"php\",\"node\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\"]', '[166,178,179,164,165,170,171,175,176,177,180,181,182,167,168,169,172,173,174,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(408, 'Serenity Ziemann', '[\"laravel\",\"react\"]', '[\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '[165,170,178,182,166,168,172,176,179,181,164,167,169,171,173,174,175,177,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(409, 'Aurore Stanton', '[\"mysql\",\"node\",\"css\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '[178,164,165,166,168,170,171,172,175,177,179,180,182,167,169,173,174,176,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(410, 'Marcellus McGlynn I', '[\"html\",\"react\",\"css\",\"laravel\",\"mysql\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[164,166,171,175,177,178,179,180,165,167,168,169,170,172,173,174,176,181,182,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(411, 'Efren Brekke', '[\"mysql\",\"javascript\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[166,178,179,164,165,170,171,175,176,177,180,181,182,167,168,169,172,173,174,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(412, 'Corrine Weissnat', '[\"react\",\"laravel\",\"node\",\"css\",\"javascript\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\"]', '[165,170,178,181,182,164,166,167,168,169,171,172,173,174,175,176,177,179,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(413, 'Larue Hackett', '[\"css\",\"laravel\",\"javascript\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\"]', '[178,164,165,166,170,171,175,177,179,180,181,182,167,168,169,172,173,174,176,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(414, 'Rowena Spencer', '[\"mysql\",\"laravel\",\"react\"]', '[\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '[165,166,168,170,172,176,178,179,182,164,167,169,171,173,174,175,177,180,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(415, 'Mr. Isom Prohaska Jr.', '[\"html\",\"node\",\"react\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[164,165,166,168,171,178,182,167,169,170,172,173,175,176,177,179,180,174,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(416, 'Prof. Estelle Botsford MD', '[\"php\",\"mysql\"]', '[\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\"]', '[165,166,170,176,178,179,181,182,164,167,168,169,171,172,173,174,175,177,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(417, 'Maybell Gibson', '[\"node\",\"vue\",\"javascript\",\"html\",\"css\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\"]', '[165,170,178,181,182,164,166,167,168,169,171,172,173,174,175,176,177,179,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(418, 'Dr. Kaci Buckridge II', '[\"javascript\",\"react\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\"]', '[165,170,178,181,182,164,166,167,168,169,171,172,173,174,175,176,177,179,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(419, 'Lukas Adams', '[\"mysql\",\"php\"]', '[\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '[165,168,170,178,182,164,172,173,174,181,183,166,167,169,171,175,176,177,179,180]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(420, 'Pearlie Leannon', '[\"html\",\"laravel\",\"vue\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[164,166,171,165,167,168,169,173,175,176,177,178,179,180,182,170,172,174,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(421, 'Mr. Jay Krajcik', '[\"mysql\",\"react\",\"css\",\"html\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[165,182,164,166,167,168,169,170,171,173,176,178,181,172,174,175,177,179,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(422, 'Brannon Waters', '[\"css\",\"php\"]', '[\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\"]', '[166,176,179,164,165,167,168,169,170,171,172,173,174,175,177,178,180,181,182,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(423, 'Stephania Upton', '[\"mysql\",\"javascript\",\"php\",\"css\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[178,164,165,166,170,171,175,177,179,180,181,182,167,168,169,172,173,174,176,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(424, 'Isobel Fadel', '[\"react\",\"php\",\"vue\",\"node\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[178,164,165,166,170,171,175,177,179,180,181,182,167,168,169,172,173,174,176,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(425, 'Enid Stracke', '[\"javascript\",\"mysql\",\"node\",\"vue\",\"laravel\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[164,165,166,167,168,169,171,173,176,182,170,172,174,175,177,178,179,180,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(426, 'Prof. Kurtis Rice', '[\"css\",\"html\",\"javascript\",\"laravel\"]', '[\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '[168,164,165,170,172,173,174,178,182,183,166,167,169,171,175,176,177,179,180,181]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(427, 'Mercedes Heaney', '[\"react\",\"css\"]', '[\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[164,166,168,171,173,174,175,177,178,179,180,183,165,167,169,170,172,176,181,182]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(428, 'Mrs. Flo Heidenreich DVM', '[\"javascript\",\"node\",\"php\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[164,165,166,167,168,169,171,173,176,182,170,172,174,175,177,178,179,180,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(429, 'Susie Leuschke', '[\"mysql\",\"react\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '[178,164,165,166,168,170,171,172,175,177,179,180,182,167,169,173,174,176,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(430, 'Prof. Zakary Lueilwitz PhD', '[\"mysql\",\"html\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '[164,166,168,173,176,165,167,169,171,174,179,182,183,170,172,175,177,178,180,181]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(431, 'Prof. Jaron Cummings', '[\"vue\",\"node\"]', '[\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\"]', '[166,176,179,164,165,167,168,169,170,171,172,173,174,175,177,178,180,181,182,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(432, 'Lily Brown', '[\"css\",\"php\",\"vue\"]', '[\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '[164,168,173,174,183,165,166,167,169,170,171,172,175,176,177,178,179,180,181,182]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(433, 'Clark Muller', '[\"vue\",\"javascript\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[164,166,171,175,177,178,179,180,165,167,168,169,170,172,173,174,176,181,182,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(434, 'Dr. Fletcher Feil', '[\"node\",\"react\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '[164,178,165,166,168,170,171,173,174,175,177,179,180,181,182,183,167,169,172,176]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(435, 'Westley Fritsch', '[\"html\",\"php\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '[164,178,165,166,168,170,171,173,174,175,177,179,180,181,182,183,167,169,172,176]', '2025-05-12 18:54:22', '2025-05-12 18:55:26'),
(436, 'Payton Senger', '[\"php\",\"laravel\",\"html\",\"mysql\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[165,166,176,182,164,167,168,169,170,171,173,178,179,181,172,174,175,177,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(437, 'Elise Ratke', '[\"mysql\",\"node\",\"javascript\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[164,166,171,175,177,178,179,180,165,167,168,169,170,172,173,174,176,181,182,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(438, 'Tressie Gottlieb', '[\"react\",\"javascript\",\"node\"]', '[\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '[165,168,170,172,178,182,164,166,167,169,171,173,174,175,176,177,179,180,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(439, 'Mia Schroeder', '[\"javascript\",\"css\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\"]', '[165,170,178,181,182,164,166,167,168,169,171,172,173,174,175,176,177,179,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(440, 'Reyna Watsica', '[\"javascript\",\"node\",\"react\",\"css\",\"laravel\"]', '[\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[164,166,168,171,173,174,175,177,178,179,180,183,165,167,169,170,172,176,181,182]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(441, 'Kelvin Grant DDS', '[\"mysql\",\"vue\",\"html\",\"laravel\"]', '[\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[165,168,182,164,166,167,169,170,171,172,173,176,178,174,175,177,179,180,181,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(442, 'Ms. Tianna Dickens', '[\"html\",\"mysql\",\"php\",\"node\",\"laravel\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '[164,166,168,171,173,165,167,169,174,175,176,177,178,179,180,182,183,170,172,181]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(443, 'Bonita Barrows III', '[\"vue\",\"react\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '[164,165,168,173,182,166,167,169,170,171,174,176,178,181,183,172,175,177,179,180]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(444, 'Prof. Polly Sporer DDS', '[\"vue\",\"html\",\"node\",\"react\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\"]', '[165,182,164,166,167,168,169,170,171,173,176,178,181,172,174,175,177,179,180,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(445, 'Eddie Watsica', '[\"html\",\"php\",\"react\",\"laravel\"]', '[\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[164,166,168,171,173,174,175,177,178,179,180,183,165,167,169,170,172,176,181,182]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(446, 'Arielle Johnston', '[\"laravel\",\"node\",\"css\",\"react\",\"mysql\"]', '[\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '[165,168,170,178,182,164,172,173,174,181,183,166,167,169,171,175,176,177,179,180]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(447, 'Prof. Scottie Halvorson Jr.', '[\"javascript\",\"mysql\",\"php\",\"css\",\"node\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '[164,165,166,171,178,182,167,168,169,170,173,175,176,177,179,180,181,172,174,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(448, 'Cora Lynch', '[\"laravel\",\"vue\"]', '[\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '[164,168,173,174,183,165,166,167,169,170,171,172,175,176,177,178,179,180,181,182]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(449, 'Mr. Santos Von', '[\"laravel\",\"vue\"]', '[\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\"]', '[166,176,179,164,165,167,168,169,170,171,172,173,174,175,177,178,180,181,182,183]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(450, 'Josephine Huel', '[\"html\",\"javascript\",\"react\",\"php\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '[164,168,173,165,166,167,169,171,174,176,182,183,170,172,175,177,178,179,180,181]', '2025-05-12 18:54:22', '2025-05-12 18:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `employers`
--

CREATE TABLE `employers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `job_description` text NOT NULL,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`preferences`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employers`
--

INSERT INTO `employers` (`id`, `name`, `job_description`, `preferences`, `created_at`, `updated_at`) VALUES
(81, 'Hoeger-Gulgowski', 'Optio ipsam et sed corrupti.', '[412,417,440,424,425,438,444,446,447,402,404,405,406,407,409,410,413,415,418,421,423,426,427,428,431,432,433,434,437,439,443,450,401,408,411,414,420,422,429,441,442,445,448,449,403,416,419,430,435,436]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(82, 'Feest-Bode', 'Laboriosam aut quis sunt beatae.', '[409,446,447,402,404,407,410,412,417,421,423,425,437,440,442,401,403,405,411,413,414,415,416,419,422,424,426,427,428,429,430,431,432,434,436,438,439,441,444,406,408,418,420,433,435,443,445,448,449,450]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(83, 'Cronin-Beatty', 'Accusantium unde eaque qui tempore possimus provident eligendi nesciunt.', '[410,412,440,446,401,405,408,414,445,421,427,404,406,413,415,418,424,426,429,434,438,443,444,450,402,403,420,425,436,441,442,448,449,407,409,417,422,423,432,439,447,411,416,419,428,430,431,433,435,437]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(84, 'Schiller, Marvin and Crooks', 'Illum quo tenetur nulla.', '[423,447,412,425,440,450,402,410,413,417,424,426,428,432,436,442,445,446,401,406,407,411,414,416,418,419,421,422,433,437,438,439,441,403,404,405,408,409,420,427,429,435,443,444,448,449,415,430,431,434]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(85, 'Lehner-Krajcik', 'Aperiam nihil eveniet laudantium eum velit perspiciatis dolorem.', '[436,441,442,420,425,445,402,410,424,432,448,449,401,403,414,416,417,419,423,426,435,444,446,447,450,404,405,407,408,412,413,421,422,428,430,431,433,440,443,409,411,415,429,437,406,418,427,434,438,439]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(86, 'Lakin-Jones', 'Unde voluptatem consequatur molestias quam necessitatibus ipsam nemo.', '[442,444,445,402,410,415,417,420,424,436,441,450,405,412,421,425,426,435,440,446,401,404,407,408,414,428,430,431,432,434,438,443,447,448,449,403,406,409,413,416,418,419,422,423,427,429,433,437,411,439]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(87, 'Moore, Collins and Considine', 'Ipsam minima assumenda id ducimus voluptatem.', '[424,401,410,414,416,419,421,423,425,429,432,436,441,442,443,444,445,446,447,450,402,403,405,406,407,408,409,411,412,415,417,418,420,422,427,428,430,431,433,434,435,437,438,440,448,449,404,413,426,439]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(88, 'Balistreri PLC', 'Expedita sint necessitatibus alias ratione non distinctio est.', '[436,441,442,402,410,416,417,419,420,421,423,424,425,430,432,435,444,445,447,450,401,403,407,409,411,414,415,422,426,428,429,431,433,437,443,446,448,449,404,405,406,408,412,413,418,427,434,438,439,440]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(89, 'Douglas PLC', 'Mollitia reprehenderit reiciendis et aut in perferendis dolores.', '[412,440,445,450,401,402,405,406,408,410,413,414,418,423,424,425,426,428,436,438,442,446,447,403,404,407,411,415,416,417,419,420,421,422,427,429,432,433,434,435,437,439,441,443,444,448,449,409,430,431]', '2025-05-12 18:54:22', '2025-05-12 18:55:27'),
(90, 'Kutch, Goodwin and Torphy', 'Sed earum deserunt tempora itaque dolorem.', '[412,424,438,440,417,425,428,444,447,450,402,405,406,415,418,434,437,446,407,423,431,433,442,443,445,401,404,408,409,410,411,413,414,421,426,427,429,432,439,416,419,420,422,435,436,441,448,449,403,430]', '2025-05-12 18:54:22', '2025-05-12 18:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_positions`
--

CREATE TABLE `job_positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employer_id` bigint(20) UNSIGNED NOT NULL,
  `job_description` varchar(255) NOT NULL,
  `required_skills` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`required_skills`)),
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_positions`
--

INSERT INTO `job_positions` (`id`, `employer_id`, `job_description`, `required_skills`, `features`, `created_at`, `updated_at`, `candidate_id`) VALUES
(164, 81, 'Barber', '[\"vue\",\"react\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 440),
(165, 81, 'Sociologist', '[\"css\",\"javascript\",\"node\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 412),
(166, 82, 'Financial Services Sales Agent', '[\"css\",\"mysql\",\"node\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 409),
(167, 83, 'Computer Software Engineer', '[\"laravel\",\"react\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 410),
(168, 83, 'Maid', '[\"css\",\"react\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 446),
(169, 83, 'Shuttle Car Operator', '[\"laravel\",\"react\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 401),
(170, 84, 'Sales Representative', '[\"laravel\",\"css\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 423),
(171, 84, 'Computer Operator', '[\"javascript\",\"react\",\"php\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 447),
(172, 84, 'Annealing Machine Operator', '[\"javascript\",\"vue\",\"mysql\",\"php\"]', '[\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 425),
(173, 85, 'Health Specialties Teacher', '[\"php\",\"mysql\"]', '[\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 436),
(174, 85, 'Material Moving Worker', '[\"php\",\"vue\",\"laravel\"]', '[\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 441),
(175, 85, 'Talent Director', '[\"laravel\",\"vue\",\"html\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 442),
(176, 86, 'Market Research Analyst', '[\"react\",\"laravel\",\"vue\",\"html\"]', '[\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\",\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 444),
(177, 86, 'Sculptor', '[\"php\",\"html\",\"node\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 445),
(178, 87, 'Artillery Crew Member', '[\"php\",\"vue\",\"mysql\",\"react\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 424),
(179, 88, 'Milling Machine Operator', '[\"vue\",\"php\",\"html\",\"mysql\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\",\"L\\u00e0m vi\\u1ec7c t\\u1eeb xa\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 402),
(180, 89, 'Medical Equipment Repairer', '[\"laravel\",\"php\",\"javascript\",\"react\"]', '[\"B\\u1ea3o hi\\u1ec3m y t\\u1ebf\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 450),
(181, 90, 'Recyclable Material Collector', '[\"node\",\"javascript\"]', '[\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 417),
(182, 90, 'Entertainer and Performer', '[\"node\",\"react\",\"javascript\",\"php\"]', '[\"Quy\\u1ec1n ch\\u1ecdn c\\u1ed5 phi\\u1ebfu\",\"Ng\\u00e2n s\\u00e1ch \\u0111\\u00e0o t\\u1ea1o\",\"Gi\\u1edd l\\u00e0m vi\\u1ec7c linh ho\\u1ea1t\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 438),
(183, 90, 'Shampooer', '[\"react\",\"vue\"]', '[\"Th\\u1ebb th\\u00e0nh vi\\u00ean ph\\u00f2ng gym\"]', '2025-05-12 18:54:22', '2025-05-12 18:56:22', 428);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '0001_01_01_000000_create_users_table', 1),
(10, '0001_01_01_000001_create_cache_table', 1),
(11, '0001_01_01_000002_create_jobs_table', 1),
(12, '2025_04_12_183927_create_candidates_table', 1),
(13, '2025_04_12_184002_create_employers_table', 1),
(14, '2025_04_12_184027_create_job_positions_table', 1),
(15, '2025_04_19_121528_add_requirements_to_candidates', 1),
(16, '2025_04_19_121537_add_features_to_job_positions', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('73mohO8oVgf4Z7s499t5GgsfrVLC1TZfF4Ahbzpf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRndZT0dDdGhNZGcwelVsMjlURXdNT056MnJQTnJzM01EWmpVMU5jNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tYXRjaC1jYW5kaWRhdGVzLWJ5LWVtcGxveWVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747041331),
('sDookXRTW2930k4iguEl9nYGOgXII5gV2RZQZXmO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielBQb3JtTllFQ0VLMFQ4eWhmNTBRY0V6Tm9JdFVxd1NFSVV5ODFSNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaG9vc2UtbWF0Y2gtdHlwZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747102577),
('zVkz8UHNe2xprKW6WtMAVEORQfk4I5ses35ugzec', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnd4TEF0bENiTVZzV3Y4Q0FrY2M0VjMwako3eXRPMWdXWVBaY1A1MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tYXRjaC1jYW5kaWRhdGVzLWJ5LWNhbmRpZGF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747078787);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employers`
--
ALTER TABLE `employers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_positions`
--
ALTER TABLE `job_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_positions_employer_id_foreign` (`employer_id`),
  ADD KEY `job_positions_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT for table `employers`
--
ALTER TABLE `employers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_positions`
--
ALTER TABLE `job_positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job_positions`
--
ALTER TABLE `job_positions`
  ADD CONSTRAINT `job_positions_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_positions_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
