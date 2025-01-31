-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 31, 2025 at 08:52 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-ewallet`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address_line_1` text NOT NULL,
  `city` varchar(100) DEFAULT 'Manado',
  `state` varchar(100) DEFAULT 'Sulawesi Utara',
  `postal_code` varchar(20) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `recipient_name`, `phone_number`, `address_line_1`, `city`, `state`, `postal_code`, `is_default`, `created_at`, `updated_at`) VALUES
(25, 1, 'Oswald Tan', '082154926917', 'Jl. Sukur Likupang, Homeland Residence Block A no 5', 'Kotamobagu', 'Sulawesi Utara', '95373', 1, '2025-01-24 04:42:53', '2025-01-31 08:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `afiliasi_bonus`
--

CREATE TABLE `afiliasi_bonus` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `referralUserId` int NOT NULL,
  `pesananId` int NOT NULL,
  `bonusAmount` int NOT NULL,
  `bonusLevel` int NOT NULL,
  `expiryDate` datetime NOT NULL,
  `status` enum('pending','claimed','expired') NOT NULL DEFAULT 'pending',
  `claimedAt` datetime DEFAULT NULL,
  `bonusReceivedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `productId` int NOT NULL,
  `berat` int NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `userId`, `productId`, `berat`, `status`, `created_at`, `updated_at`) VALUES
(51, 1, 6, 3, 'active', '2025-01-27 02:44:27', '2025-01-28 06:00:39'),
(54, 1, 5, 400, 'active', '2025-01-28 06:01:18', '2025-01-28 06:01:33'),
(55, 1, 8, 100, 'active', '2025-01-31 07:53:18', '2025-01-31 07:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int NOT NULL,
  `cartId` int NOT NULL,
  `productId` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `totalHargaPoin` int NOT NULL,
  `totalHargaRp` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `provinceId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `provinceId`) VALUES
(6, 'Manado', 5),
(7, 'Tomohon', 5),
(8, 'Tondano', 5),
(9, 'Kotamobagu', 5);

-- --------------------------------------------------------

--
-- Table structure for table `details_users`
--

CREATE TABLE `details_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `photo_profile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `details_users`
--

INSERT INTO `details_users` (`id`, `user_id`, `fullname`, `phone_number`, `photo_profile`) VALUES
(2, 1, 'Oswald Tanlee Pongayow', '082154926917', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int NOT NULL,
  `percentage` float NOT NULL,
  `poinId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `percentage`, `poinId`) VALUES
(1, 10, 3),
(3, 30, 8);

-- --------------------------------------------------------

--
-- Table structure for table `hargapoin`
--

CREATE TABLE `hargapoin` (
  `id` int NOT NULL,
  `harga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hargapoin`
--

INSERT INTO `hargapoin` (`id`, `harga`) VALUES
(5, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `invoiceNumber` varchar(255) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `metodePembayaran` varchar(255) NOT NULL,
  `hargaRp` int DEFAULT NULL,
  `hargaPoin` int DEFAULT NULL,
  `ongkir` int DEFAULT NULL,
  `totalBayar` int NOT NULL,
  `paymentStatus` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `orderId`, `userId`, `invoiceNumber`, `nama`, `metodePembayaran`, `hargaRp`, `hargaPoin`, `ongkir`, `totalBayar`, `paymentStatus`, `status`, `created_at`, `updated_at`) VALUES
(236, 'ORD_30012025_1dc28ed6', 1, 'INV-1738218715510', 'Bawang Putih (5 Kilogram)', 'COD', 75000, NULL, 10000, 85000, 'paid', 'delivered', '2025-01-30 06:31:56', '2025-01-30 19:02:49'),
(237, 'ORD_30012025_0a47bdd3', 1, 'INV-1738218923242', 'Bawang Merah (500 Gram)', 'Poin', NULL, 100, 10, 110, 'paid', 'pending', '2025-01-30 06:35:24', '2025-01-30 06:35:24'),
(238, 'ORD_31012025_0c7a8026', 1, 'INV-1738310969724', 'Bawang Merah (200 Gram)', 'COD', 40000, NULL, 20000, 60000, 'unpaid', 'pending', '2025-01-31 08:09:28', '2025-01-31 08:09:28'),
(239, 'ORD_31012025_2c5ad18a', 1, 'INV-1738311528913', 'Cabai Merah (3 Ikat)', 'Poin', NULL, 6, 10, 16, 'paid', 'pending', '2025-01-31 08:18:49', '2025-01-31 08:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `poin`
--

CREATE TABLE `poin` (
  `id` int NOT NULL,
  `poin` int NOT NULL,
  `discountPercentage` float DEFAULT '0',
  `discountValue` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poin`
--

INSERT INTO `poin` (`id`, `poin`, `discountPercentage`, `discountValue`) VALUES
(3, 200, 10, 20),
(5, 100, 0, 0),
(6, 150, 0, 0),
(7, 250, 20, 0),
(10, 300, 0, 0),
(11, 350, 0, 0),
(12, 400, 0, 0),
(13, 450, 0, 0),
(14, 500, 0, 0),
(15, 550, 30, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `nameProduk` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `hargaPoin` int NOT NULL,
  `hargaRp` int NOT NULL,
  `jumlah` int NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `nameProduk`, `deskripsi`, `hargaPoin`, `hargaRp`, `jumlah`, `satuan`, `image`, `created_at`, `updated_at`) VALUES
(5, 'Tomat', 'Tomat segar berkualitas tinggi, kaya akan vitamin dan mineral. Memiliki rasa manis asam yang alami, tomat ini sangat cocok untuk masakan, salad, jus, atau dijadikan bahan dasar saus. Pilihan sempurna untuk gaya hidup sehat.', 40, 40000, 100, 'Gram', 'image-1736494296857-777074453.png', '2025-01-10 07:31:36', '2025-01-23 08:57:20'),
(6, 'Bawang Putih', 'Bawang putih segar pilihan terbaik untuk bumbu dapur Anda. Menghasilkan aroma dan rasa yang khas, cocok untuk menyempurnakan berbagai masakan. Dikenal dengan khasiat kesehatan, bawang putih juga digunakan sebagai bahan alami untuk meningkatkan daya tahan tubuh.', 15, 15000, 1, 'Kilogram', 'image-1736494339066-496828230.png', '2025-01-10 07:32:19', '2025-01-23 08:57:20'),
(7, 'Cabai Merah', 'Cabai merah segar dengan rasa pedas yang menggugah selera. Cocok untuk digunakan dalam berbagai jenis masakan, mulai dari tumisan hingga sambal. Warna merah cerahnya menambah daya tarik pada hidangan Anda.', 2, 2000, 1, 'Ikat', 'image-1736494384040-512809065.png', '2025-01-10 07:33:04', '2025-01-23 08:57:20'),
(8, 'Bawang Merah', 'Bawang merah segar dengan kualitas terbaik, memberikan rasa manis dan harum pada masakan Anda. Cocok untuk digunakan sebagai bumbu dasar dalam berbagai resep, dari gorengan hingga sup. Wajib ada di dapur Anda!', 20, 20000, 100, 'Gram', 'image-1736494428448-511946290.png', '2025-01-10 07:33:48', '2025-01-23 08:57:20'),
(14, 'Daun Bawang', 'Daun bawang segar adalah bahan masakan yang sering digunakan untuk memberikan rasa dan aroma khas pada berbagai jenis hidangan. Memiliki daun hijau yang renyah dan batang putih yang lembut, daun bawang merupakan pilihan sempurna untuk menambah cita rasa pada sup, tumisan, salad, atau bahkan sebagai garnish pada berbagai makanan.', 3, 3000, 1, 'Ikat', 'image-1737622732715-523551412.png', '2025-01-23 08:58:52', '2025-01-23 09:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`) VALUES
(5, 'Sulawesi Utara');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(2, 'admin'),
(3, 'delivery'),
(1, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('_flkzQv2Z5B-PvgL3bavFILE7m1G2S3x', '2025-01-31 19:03:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":3}', '2025-01-30 18:51:15', '2025-01-30 19:03:27'),
('_pExEeU1J7yKdyW9jusdyL7G_63wYCqU', '2025-01-31 18:37:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:27', '2025-01-30 18:37:27'),
('_zZtsm06Ao9eNjCpietJjhWiK6xnlLNb', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('-9Hp9oSa0bqE104TayCgPFTKdTGLhtI-', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('0pB6Qo5bEtrD01QCCyg-7Hkxw-plIKvK', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('0yXsD56pAM2F5u-iRzoMQHi5DNVAiD6I', '2025-02-01 07:43:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 07:43:13', '2025-01-31 07:43:13'),
('2YBZQWq_y7K94XT9D8FFhRUrCo6m6BRG', '2025-01-31 11:41:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('31qKVomtUDc_V3P2FNcAKPAA7J0FwkEP', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('3KoofFG1-q7qhboTBMh33X443AGMWMVY', '2025-01-31 17:31:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:31:23', '2025-01-30 17:31:23'),
('3ugQaC7JRl6QxEG5kZ_VgQO7sfWUfjnZ', '2025-01-31 11:41:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('44abs7tye1J19UZwlvSWAuljpaP1zXM-', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('47qmvGLwEzr06bOhiKwIKtF5T5Nhfk6J', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('4yj3Z7o7kNXUlC0sqxQMW-rRu0d9U0b6', '2025-02-01 03:22:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 03:22:12', '2025-01-31 03:22:12'),
('5htBAjahhHCdwXL9uusIBHz9gUnTrsTD', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('64YWn8ipwPhj-mk213yKLQGLopiXfB5t', '2025-01-31 09:58:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 09:58:20', '2025-01-30 09:58:20'),
('8KXZ7N9cQvYq5Kuc0x-yLggJrLChjpPt', '2025-01-31 18:37:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:27', '2025-01-30 18:37:27'),
('8QmIljy-vgE8XqsQIB0vb8HHpwzhCN2E', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('8z4gZseaQPQpaTQjy56X3l6J29TggB9y', '2025-01-31 17:31:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:31:23', '2025-01-30 17:31:23'),
('aKrW9ct5m2q2Q75caAsxUX_YOtgVeM1k', '2025-01-31 11:41:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('aouZl3t08GIHkZyRVVIO38FsAllhWdPm', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('aWGVXyKug820SmlfXPIb7D09LMsxPmM_', '2025-01-31 11:41:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('aZnXv5r7UD5ZIO-0zHy8k01almduH42O', '2025-01-31 11:41:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('BAopNDsSFcXy7RJHV5SIuUsPSWF9Wamw', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('bJbXXwvva5MW7_lWBIJynZJLUhvx8CgL', '2025-01-31 18:37:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:27', '2025-01-30 18:37:27'),
('BZjMoANYRM4A8r5cwkMY8w9Yng9POqh9', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('C9MMOjX0zuR74Wszj2ajP5PZnkOJkfTT', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('cHBy7_cDq8HZ64r3E_SCGDCZsEEsJGbH', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('chE9fiSdU72DfaLBaDxaGwL40qOOKBtT', '2025-01-31 18:37:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:26', '2025-01-30 18:37:26'),
('cogXeA1F1-DyX_63IGS9zeQwW88fVj_t', '2025-01-31 18:37:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:27', '2025-01-30 18:37:27'),
('CqBvKe7V-0kLSWN8zRzOvfRQC22j71rE', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('CQtc1DUmpZRSFuh6cm2kbpDFhCUyu4VW', '2025-02-01 08:11:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 08:11:38', '2025-01-31 08:11:38'),
('CwwVkF2JZze1iD5koWr9IGkUe0yK5wkW', '2025-02-01 08:10:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 08:10:58', '2025-01-31 08:10:58'),
('CyKwDu5R0iy10BKm8V3SUOJ23hgRBKur', '2025-02-01 07:53:37', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 07:53:37', '2025-01-31 07:53:37'),
('D3Mj5ruwdciWPl46QYand2D5rvRAmnp7', '2025-01-31 11:41:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('DBDaiL1FcQGdfJvKI_1x8W8RxvkLnRHw', '2025-02-01 08:11:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 08:11:10', '2025-01-31 08:11:10'),
('dHAjhfzVXAv-Im97FS7AcssH1KiN5YUx', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('dSWano_zVYNoO0D4oXpNcpnmnPQSyFnW', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('E3bfGL__IpIhLEA2dGnxCLYXlDG22d24', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('ejeK0ucfVcYYLAU4mgautjf2_6Fci_uK', '2025-01-31 11:41:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('evEkjg5sdgOLQPNL8yaOKrAXFlbau9QF', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('f7b-Mc4RT8M0RclL99qs96FhHOuysT9G', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('FCrnzVCOjQMdm42NHyIceBHvCgvPksvF', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('Fi3K4BwA7LZMXiLH7Q1KBiJ0ReppxP1R', '2025-02-01 08:24:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 08:24:43', '2025-01-31 08:24:43'),
('fKYXhGBoU6FEwEg5dvnnpQ7ObkxGoMI9', '2025-01-31 11:41:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('fq8eNZ7iDLmvBNs4rkbYQLhutivZe_7C', '2025-02-01 03:18:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 03:18:42', '2025-01-31 03:18:42'),
('Ftf8TJLLRdEzEQ4v5wskZk4RPbpbX9r_', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('GaVfKASsBSbZ6z5aXFPOSHFi2cbB-vrt', '2025-02-01 07:53:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 07:53:32', '2025-01-31 07:53:32'),
('gx-s9DPGw9Jxf5673ZQqH4SgSPA20bq_', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('H-A045cCru_x5QXPefyLbPWbOhbKlJwr', '2025-01-31 11:41:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('HJuY9cSd2OvzXk_Tq_sNXJ9xiq1Mo3Wm', '2025-02-01 07:53:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 07:53:41', '2025-01-31 07:53:41'),
('HlAwmDcEZ-fFJSdXihBrW4pENByWZyQ2', '2025-01-31 17:10:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:10:42', '2025-01-30 17:10:42'),
('Hri5R7uwe0Gw3wRxTpBklIOwgxDUNQun', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('HX_Xi43WyNXs_ETOCvyo99gizAcUDV_X', '2025-02-01 06:11:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":3}', '2025-01-30 05:01:02', '2025-01-31 06:11:36'),
('I51dUM3HIjYCZyFMLo-CFWM2IKMv4O7k', '2025-01-31 11:41:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('IjXKMXYn_lY3rSVAIxDk31iUPDgK8vZV', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('iQTmj6r8_e7jgmCKaj7Lp6lSDnzCI9rn', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('ITtvBud5cIvIUrWCOvJYasmrnW50LjeE', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('IYcH7vm9DURGHS__F1jRxUIM5VEaOYPE', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('jP3AV2VkqdZdlUsC3PZGToDRNoAziXwm', '2025-01-31 17:10:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:10:42', '2025-01-30 17:10:42'),
('k6lV7qpC0OIHlyWx-HUh8-pxbUJdWbEV', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('KqA82uEzQ9YBy_0-oTLGcvt8UFH_o2th', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('KTqmjeq6XAnmCv-yRcT73lbCr_jfxRfr', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('kW3kx4KsvlrdhImbHOfm5aZsUgBFnP5l', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('KXpBBLaJ4_VSMtXGu25qgxwUXsuLuF9Z', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('KZGhyq4jGfei3MpOAbbM1SGXq_71uuDn', '2025-02-01 06:52:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 06:52:56', '2025-01-31 06:52:56'),
('kzMSg6WyfuD5WZGJl7W5YmuVjQvuU1sN', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('L88Llbi4quU3jJjWVr73MasOLiViezwJ', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('lFmS3sZKNI9ECJHuGqESLeljJ09fOe7y', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('McVFgMAc-LxbaZMSgt7v9axnBxKCFjPx', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('mHXR_NOFBvy-oCQfnXgCxGg2SUo3F_ry', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('nh67cnG9io_soFSWNOnbhNq04t_wxibC', '2025-02-01 08:43:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":3}', '2025-01-31 03:26:27', '2025-01-31 08:43:35'),
('ntAQdsz60jOoMa_vSUU0OzIVvTzeZq6A', '2025-01-31 11:41:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 11:41:06', '2025-01-30 11:41:06'),
('O-9Ypemf2BgFq02uGMcJa75Noq8xlIsv', '2025-01-31 17:10:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:10:42', '2025-01-30 17:10:42'),
('o4hc3veUu7N-ceWWptzQ6AWP_y_y1j4G', '2025-01-31 18:37:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:27', '2025-01-30 18:37:27'),
('orfLb05O8Zm7XUGdKj7BucNjiWMiNc0Y', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('PaRxvm4yRBaF1SCM6x-T66Q94tKyEpEu', '2025-01-31 18:37:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:27', '2025-01-30 18:37:27'),
('pD-A0mjHEBY2eX44L9Q8IpwXlCQKIFPe', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('pJS0iTNv8c6hOff33mVuEXPzNLVZhEyw', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('Qsq3RU6caPbQeeZ-yjFL9CgFbuC7hnGY', '2025-01-31 17:31:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:31:23', '2025-01-30 17:31:23'),
('r3a17GZ8ibaMRYWb4UaT5iLbysWgFq2Y', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('rP-dbulLP-e8ojOSg5dWag0KcosWtvg_', '2025-01-31 18:37:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:27', '2025-01-30 18:37:27'),
('Sf7XFBSxQpe3p-XBL9DY3WoFWddVXRl_', '2025-01-31 17:31:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:31:23', '2025-01-30 17:31:23'),
('sXHiMFzt5-APucoCuVFezlehirBzKIhW', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('SXP1I8v-MTt3a58hHrWMwWnIYHafbVqc', '2025-02-01 03:22:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 03:22:12', '2025-01-31 03:22:12'),
('t6KJluNOZion9CxSmtUjsfmtZ5gVkYrA', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('ToR4GvMwjVB6ex-a_AHkZPA8YUbMjGu_', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('TVCxZDrsU86SGjAFyvOo_4fO5D8eut7D', '2025-01-31 17:31:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:31:23', '2025-01-30 17:31:23'),
('Uj3Rv1Gb1XIWb7PT0gzPjAzJvL06Sql-', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('UrbkLLlWIuAsGAnEg3uIi2Hbyn0QvSEA', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('uvxzpyqyxMqPFbHWfyzduDL6UeU5qA6k', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('W-EZWzyoEcrAuhwIjTIgU1FzkJvQ4jx0', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('W2CL1iszBJQYLoBUv6i8kD6ch64N1sCY', '2025-02-01 03:26:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 03:26:27', '2025-01-31 03:26:27'),
('WBc4ZykRgzFYRISGBE9v6kux1x2mNbX7', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('WpdzpmoXeUwHAlSIeK_phY6a9dLvOcnD', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59'),
('wPewLxeaFgLv2tBr-xwUX6GI1uABYx03', '2025-01-31 18:06:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:06:40', '2025-01-30 18:06:40'),
('x7FlbumQPY8xwbh8vKJJIEKudxjFwo25', '2025-01-31 17:31:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:31:23', '2025-01-30 17:31:23'),
('xVkUAHj5SN-NjHp84sjqGqp5XRX9HylN', '2025-01-31 18:37:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:27', '2025-01-30 18:37:27'),
('y6ReEXbkUMtkDt765hpzxMaB6iFNEEzK', '2025-01-31 18:37:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:26', '2025-01-30 18:37:26'),
('Y7PAcmrKWnjMGg2nILz_l6jUveAD_9yu', '2025-01-31 18:49:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:49:11', '2025-01-30 18:49:11'),
('YBO5KfNFEdxBsnnLqAkYEOW922gtTts1', '2025-01-31 18:37:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 18:37:27', '2025-01-30 18:37:27'),
('YKQ_zRRY8hHBYL3dV4AWGGwGjfHWykeN', '2025-01-31 16:52:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 16:52:17', '2025-01-30 16:52:17'),
('ZEIYB6ReUgAYqPfXzbjofoGIV_AO3B_j', '2025-02-01 03:22:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 03:22:12', '2025-01-31 03:22:12'),
('Zy_KQXuxiZdpAuIwoiJ6U8CzBF5ylPQ_', '2025-01-31 17:51:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-30 17:51:29', '2025-01-30 17:51:29'),
('ZZkMXdCttqAc3b4hUbFyz2BxZurDa6ZD', '2025-02-01 02:57:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-31 02:57:59', '2025-01-31 02:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`key`, `value`) VALUES
('hargaPoin', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_rates`
--

CREATE TABLE `shipping_rates` (
  `id` int NOT NULL,
  `cityId` int NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_rates`
--

INSERT INTO `shipping_rates` (`id`, `cityId`, `price`) VALUES
(1, 6, 10000),
(2, 7, 10000),
(3, 8, 10000),
(4, 9, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `topuppoin`
--

CREATE TABLE `topuppoin` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `points` int NOT NULL,
  `price` int NOT NULL,
  `date` datetime NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topuppoin`
--

INSERT INTO `topuppoin` (`id`, `userId`, `points`, `price`, `date`, `bankName`, `status`) VALUES
(13, 1, 250, 200000, '2025-01-08 13:47:45', 'BCA', 'approved'),
(14, 1, 250, 200000, '2025-01-08 17:01:29', 'BCA', 'approved'),
(17, 1, 350, 280000, '2025-01-08 18:11:22', 'BCA', 'approved'),
(22, 1, 300, 300000, '2025-01-09 06:21:16', 'BCA', 'approved'),
(31, 1, 100, 100000, '2025-01-12 15:44:47', 'BCA', 'approved'),
(32, 1, 550, 385000, '2025-01-12 19:54:36', 'BCA', 'approved'),
(41, 1, 550, 385000, '2025-01-17 05:05:24', 'BCA', 'approved'),
(45, 1, 500, 500000, '2025-01-20 16:39:52', 'BCA', 'approved'),
(46, 1, 550, 385000, '2025-01-22 05:31:24', 'BCA', 'approved'),
(47, 1, 550, 385000, '2025-01-23 09:07:39', 'BCA', 'approved'),
(48, 1, 550, 385000, '2025-01-28 07:50:32', 'BCA', 'approved'),
(49, 1, 450, 450000, '2025-01-28 07:55:28', 'BCA', 'approved'),
(50, 1, 350, 350000, '2025-01-28 08:21:59', 'BCA', 'approved'),
(51, 1, 550, 385000, '2025-01-28 08:24:38', 'BCA', 'approved'),
(52, 1, 400, 400000, '2025-01-28 08:24:51', 'BCA', 'approved'),
(53, 1, 150, 150000, '2025-01-28 08:26:18', 'BCA', 'approved'),
(54, 1, 500, 500000, '2025-01-28 08:26:29', 'BCA', 'approved'),
(55, 1, 100, 100000, '2025-01-28 08:27:58', 'BCA', 'approved'),
(56, 1, 350, 350000, '2025-01-28 08:30:40', 'BCA', 'approved'),
(57, 1, 500, 500000, '2025-01-28 08:31:17', 'BCA', 'approved'),
(58, 1, 150, 150000, '2025-01-28 08:31:30', 'BCA', 'approved'),
(59, 1, 100, 100000, '2025-01-28 08:42:55', 'BCA', 'approved'),
(60, 1, 150, 150000, '2025-01-28 08:45:47', 'BCA', 'approved'),
(61, 1, 500, 500000, '2025-01-28 08:50:28', 'BCA', 'approved'),
(62, 1, 150, 150000, '2025-01-28 08:51:38', 'BCA', 'approved'),
(63, 1, 400, 400000, '2025-01-28 08:53:56', 'BCA', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int DEFAULT NULL,
  `referralCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referredBy` int DEFAULT NULL,
  `referralUsedAt` date DEFAULT NULL,
  `resetOtp` varchar(6) DEFAULT NULL,
  `resetOtpExpires` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role_id`, `referralCode`, `referredBy`, `referralUsedAt`, `resetOtp`, `resetOtpExpires`, `created_at`, `updated_at`) VALUES
(1, 'Oswald Tan', 'oswaldtanlee44@gmail.com', '$2b$10$9.B0e76.fhQXDkuZvCn2/eUw1BQLvdXBb66yHDpGqvO8xftoZ5Kfm', 1, 'OS2JIN', NULL, NULL, NULL, NULL, '2024-11-13 03:48:12', '2025-01-30 09:53:22'),
(3, 'Admin', 'admin@gmail.com', '$2a$12$k58ndNxumBJxvuPzFBB9JO47TOJOoUZMPdBE5IIHHl0IXVp/VNBrm', 2, 'REF3', NULL, NULL, NULL, NULL, '2024-12-31 18:18:00', '2025-01-28 02:04:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_points`
--

CREATE TABLE `user_points` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_points`
--

INSERT INTO `user_points` (`id`, `userId`, `points`, `created_at`, `updated_at`) VALUES
(1, 1, 5480, '2025-01-08 17:00:01', '2025-01-31 08:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_stats`
--

CREATE TABLE `user_stats` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `total_logins` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_stats`
--

INSERT INTO `user_stats` (`id`, `user_id`, `last_login`, `total_logins`) VALUES
(1, 1, '2025-01-31 07:48:20', 85),
(4, 3, '2025-01-31 05:04:27', 51);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `user_id` int NOT NULL,
  `points` int DEFAULT '0',
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postal_code` (`postal_code`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `afiliasi_bonus`
--
ALTER TABLE `afiliasi_bonus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `referralUserId` (`referralUserId`),
  ADD KEY `pesananId` (`pesananId`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartId` (`cartId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_ibfk_1` (`provinceId`);

--
-- Indexes for table `details_users`
--
ALTER TABLE `details_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_discount_poin` (`poinId`);

--
-- Indexes for table `hargapoin`
--
ALTER TABLE `hargapoin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `poin`
--
ALTER TABLE `poin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `shipping_rates`
--
ALTER TABLE `shipping_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cityId` (`cityId`);

--
-- Indexes for table `topuppoin`
--
ALTER TABLE `topuppoin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `referralCode` (`referralCode`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `FK_ReferredBy` (`referredBy`);

--
-- Indexes for table `user_points`
--
ALTER TABLE `user_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Indexes for table `user_stats`
--
ALTER TABLE `user_stats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `afiliasi_bonus`
--
ALTER TABLE `afiliasi_bonus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `details_users`
--
ALTER TABLE `details_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hargapoin`
--
ALTER TABLE `hargapoin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `poin`
--
ALTER TABLE `poin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_rates`
--
ALTER TABLE `shipping_rates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `topuppoin`
--
ALTER TABLE `topuppoin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user_points`
--
ALTER TABLE `user_points`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_stats`
--
ALTER TABLE `user_stats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `afiliasi_bonus`
--
ALTER TABLE `afiliasi_bonus`
  ADD CONSTRAINT `afiliasi_bonus_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `afiliasi_bonus_ibfk_2` FOREIGN KEY (`referralUserId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `afiliasi_bonus_ibfk_3` FOREIGN KEY (`pesananId`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`provinceId`) REFERENCES `provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `details_users`
--
ALTER TABLE `details_users`
  ADD CONSTRAINT `details_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipping_rates`
--
ALTER TABLE `shipping_rates`
  ADD CONSTRAINT `shipping_rates_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topuppoin`
--
ALTER TABLE `topuppoin`
  ADD CONSTRAINT `topuppoin_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_ReferredBy` FOREIGN KEY (`referredBy`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_referredBy_user` FOREIGN KEY (`referredBy`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_points`
--
ALTER TABLE `user_points`
  ADD CONSTRAINT `user_points_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_stats`
--
ALTER TABLE `user_stats`
  ADD CONSTRAINT `user_stats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
