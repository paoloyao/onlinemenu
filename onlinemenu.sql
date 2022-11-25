-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2021 at 08:08 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinemenu`
--

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount`, `valid`, `created_at`, `updated_at`) VALUES
(1, '123', '10', 1, NULL, NULL),
(2, 'GO2018', '10', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `category`, `price`, `tax`, `created_at`, `updated_at`) VALUES
(1, 'Hotdog', '1', 25, 5, '2021-03-24 04:26:37', '2021-03-24 04:26:37'),
(2, 'CheeseBurger', '1', 35, 7, '2021-03-25 03:51:50', '2021-03-25 03:51:50'),
(3, 'Fries', '1', 25, 4, '2021-03-25 03:53:01', '2021-03-25 03:53:01'),
(4, 'Coke', '2', 20, 3, '2021-03-25 03:53:24', '2021-03-25 03:53:24'),
(5, 'Sprite', '2', 20, 3, '2021-03-25 03:53:33', '2021-03-25 03:53:33'),
(6, 'Tea', '2', 25, 5, '2021-03-25 03:53:45', '2021-03-25 03:53:45'),
(7, 'Chicken Combo Meal', '3', 80, 13, '2021-03-25 03:54:16', '2021-03-25 03:54:16'),
(8, 'Pork Combo', '3', 90, 15, '2021-03-25 03:57:19', '2021-03-25 03:57:19'),
(9, 'Fish Combo', '3', 75, 10, '2021-03-25 03:58:58', '2021-03-25 03:58:58'),
(10, 'Hawaiian Burger', '1', 45, 6, '2021-03-25 08:58:14', '2021-03-25 08:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_23_191538_create_items_table', 2),
(5, '2021_03_25_103119_create_coupons_table', 3),
(6, '2021_03_25_114821_create_orders_table', 4),
(7, '2021_03_25_115628_create_orders_table', 5),
(8, '2021_03_25_120103_create_orders_table', 6),
(9, '2021_03_25_121203_create_orders_table', 7),
(10, '2021_03_25_124029_create_orders_table', 8),
(11, '2021_03_25_125203_create_order_lists_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `total`, `status`, `created_at`, `updated_at`) VALUES
(18, '1', '145', 'Processing', '2021-03-25 21:04:31', '2021-03-25 21:04:31'),
(19, '1', '240', 'Processing', '2021-03-25 21:19:51', '2021-03-25 21:19:51'),
(20, '1', '113', 'Processing', '2021-03-25 21:28:44', '2021-03-25 21:28:44'),
(21, '1', '113', 'Processing', '2021-03-25 21:30:03', '2021-03-25 21:30:03'),
(22, '1', '161', 'Processing', '2021-03-25 21:32:52', '2021-03-25 21:32:52'),
(23, '1', '218', 'Processing', '2021-03-25 21:33:25', '2021-03-25 21:33:25'),
(24, '1', '205', 'Processing', '2021-03-25 21:37:34', '2021-03-25 21:37:34'),
(25, '1', '246', 'Processing', '2021-03-25 21:39:10', '2021-03-25 21:39:10'),
(26, '1', '111', 'Processing', '2021-03-25 21:57:12', '2021-03-25 21:57:12'),
(27, '1', '190', 'Processing', '2021-03-25 21:57:58', '2021-03-25 21:57:58'),
(28, '1', '113', 'Processing', '2021-03-25 22:00:05', '2021-03-25 22:00:05'),
(29, '1', '162', 'Processing', '2021-03-25 22:03:27', '2021-03-25 22:03:27'),
(30, '1', '137', 'Processing', '2021-03-25 22:06:23', '2021-03-25 22:06:23'),
(31, '1', '409', 'Processing', '2021-03-25 22:07:30', '2021-03-25 22:07:30'),
(32, '1', '110', 'Processing', '2021-03-26 01:34:05', '2021-03-26 01:34:05'),
(33, '1', '140', 'Processing', '2021-03-26 01:46:20', '2021-03-26 01:46:20'),
(34, '1', '82', 'Processing', '2021-03-26 01:48:11', '2021-03-26 01:48:11'),
(35, '1', '167', 'Processing', '2021-03-26 01:49:33', '2021-03-26 01:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_lists`
--

CREATE TABLE `order_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_lists`
--

INSERT INTO `order_lists` (`id`, `order_id`, `customer_id`, `category`, `quantity`, `created_at`, `updated_at`) VALUES
(4, '18', '1', '3', '1', '2021-03-25 21:04:31', '2021-03-25 21:04:31'),
(5, '18', '1', '6', '1', '2021-03-25 21:04:31', '2021-03-25 21:04:31'),
(6, '18', '1', '10', '2', '2021-03-25 21:04:31', '2021-03-25 21:04:31'),
(7, '19', '1', '6', '1', '2021-03-25 21:19:51', '2021-03-25 21:19:51'),
(8, '19', '1', '7', '2', '2021-03-25 21:19:51', '2021-03-25 21:19:51'),
(9, '19', '1', '10', '1', '2021-03-25 21:19:51', '2021-03-25 21:19:51'),
(10, '20', '1', '3', '1', '2021-03-25 21:28:44', '2021-03-25 21:28:44'),
(11, '20', '1', '5', '2', '2021-03-25 21:28:44', '2021-03-25 21:28:44'),
(12, '20', '1', '10', '1', '2021-03-25 21:28:44', '2021-03-25 21:28:44'),
(13, '21', '1', '3', '1', '2021-03-25 21:30:03', '2021-03-25 21:30:03'),
(14, '21', '1', '5', '2', '2021-03-25 21:30:03', '2021-03-25 21:30:03'),
(15, '21', '1', '10', '1', '2021-03-25 21:30:03', '2021-03-25 21:30:03'),
(16, '22', '1', '3', '3', '2021-03-25 21:32:52', '2021-03-25 21:32:52'),
(17, '22', '1', '5', '1', '2021-03-25 21:32:52', '2021-03-25 21:32:52'),
(18, '22', '1', '10', '1', '2021-03-25 21:32:52', '2021-03-25 21:32:52'),
(19, '23', '1', '2', '1', '2021-03-25 21:33:25', '2021-03-25 21:33:25'),
(20, '23', '1', '4', '1', '2021-03-25 21:33:25', '2021-03-25 21:33:25'),
(21, '23', '1', '10', '3', '2021-03-25 21:33:25', '2021-03-25 21:33:25'),
(22, '24', '1', '3', '1', '2021-03-25 21:37:34', '2021-03-25 21:37:34'),
(23, '24', '1', '4', '1', '2021-03-25 21:37:34', '2021-03-25 21:37:34'),
(24, '24', '1', '10', '3', '2021-03-25 21:37:34', '2021-03-25 21:37:34'),
(25, '25', '1', '2', '1', '2021-03-25 21:39:10', '2021-03-25 21:39:10'),
(26, '25', '1', '10', '4', '2021-03-25 21:39:10', '2021-03-25 21:39:10'),
(27, '26', '1', '6', '2', '2021-03-25 21:57:12', '2021-03-25 21:57:12'),
(28, '26', '1', '10', '1', '2021-03-25 21:57:12', '2021-03-25 21:57:12'),
(29, '27', '1', '2', '1', '2021-03-25 21:57:58', '2021-03-25 21:57:58'),
(30, '27', '1', '4', '2', '2021-03-25 21:57:58', '2021-03-25 21:57:58'),
(31, '27', '1', '10', '2', '2021-03-25 21:57:58', '2021-03-25 21:57:58'),
(32, '28', '1', '4', '1', '2021-03-25 22:00:05', '2021-03-25 22:00:05'),
(33, '28', '1', '6', '3', '2021-03-25 22:00:05', '2021-03-25 22:00:05'),
(34, '29', '1', '2', '1', '2021-03-25 22:03:27', '2021-03-25 22:03:27'),
(35, '29', '1', '5', '3', '2021-03-25 22:03:27', '2021-03-25 22:03:27'),
(36, '29', '1', '10', '1', '2021-03-25 22:03:27', '2021-03-25 22:03:27'),
(37, '30', '1', '2', '2', '2021-03-25 22:06:23', '2021-03-25 22:06:23'),
(38, '30', '1', '5', '1', '2021-03-25 22:06:23', '2021-03-25 22:06:23'),
(39, '30', '1', '6', '1', '2021-03-25 22:06:23', '2021-03-25 22:06:23'),
(40, '31', '1', '2', '2', '2021-03-25 22:07:30', '2021-03-25 22:07:30'),
(41, '31', '1', '5', '1', '2021-03-25 22:07:30', '2021-03-25 22:07:30'),
(42, '31', '1', '6', '1', '2021-03-25 22:07:30', '2021-03-25 22:07:30'),
(43, '31', '1', '9', '2', '2021-03-25 22:07:30', '2021-03-25 22:07:30'),
(44, '31', '1', '10', '2', '2021-03-25 22:07:30', '2021-03-25 22:07:30'),
(45, '32', '1', '2', '1', '2021-03-26 01:34:05', '2021-03-26 01:34:05'),
(46, '32', '1', '3', '1', '2021-03-26 01:34:05', '2021-03-26 01:34:05'),
(47, '32', '1', '10', '1', '2021-03-26 01:34:05', '2021-03-26 01:34:05'),
(48, '33', '1', '5', '1', '2021-03-26 01:46:20', '2021-03-26 01:46:20'),
(49, '33', '1', '6', '1', '2021-03-26 01:46:20', '2021-03-26 01:46:20'),
(50, '33', '1', '10', '2', '2021-03-26 01:46:20', '2021-03-26 01:46:20'),
(51, '34', '1', '3', '1', '2021-03-26 01:48:11', '2021-03-26 01:48:11'),
(52, '34', '1', '5', '1', '2021-03-26 01:48:11', '2021-03-26 01:48:11'),
(53, '34', '1', '6', '1', '2021-03-26 01:48:11', '2021-03-26 01:48:11'),
(54, '35', '1', '2', '2', '2021-03-26 01:49:33', '2021-03-26 01:49:33'),
(55, '35', '1', '10', '2', '2021-03-26 01:49:33', '2021-03-26 01:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_lists`
--
ALTER TABLE `order_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `order_lists`
--
ALTER TABLE `order_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
