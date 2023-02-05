-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 05, 2023 at 10:21 PM
-- Server version: 10.5.18-MariaDB-1:10.5.18+maria~ubu1804
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yuksalish`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `name`, `desc`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Chakana savdo', 'Tovarlarni donalab yoki kichik toʻp bilan sotish va sotib olish', 'bx bxl-dribbble', '2023-02-05 08:40:48', '2023-02-05 08:40:48'),
(2, 'Muddatli to\'lov', 'Muddatli toʼlovga maishiy texnikalar, uy-roʼzgʼor buyumlari, mebellar, sarpolar, gilamlar sotish', 'bi bi-calendar-date', '2023-02-05 08:41:24', '2023-02-05 08:41:24'),
(3, 'Tezkor yetkazish', 'Do\'konlarimizdan xarid qilingan mahsulotlarni qisqa fursatda o\'z egalariga yetkazib beriladi', 'bx bx-tachometer', '2023-02-05 08:42:59', '2023-02-05 08:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-02-05 03:39:41', '2023-02-05 03:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(63, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 10, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(65, 10, 'class_name', 'text', 'Class Name', 0, 0, 1, 1, 1, 1, '{}', 3),
(66, 10, 'class_icon', 'text', 'Class Icon', 0, 0, 1, 1, 1, 1, '{}', 4),
(67, 10, 'url', 'text', 'Url', 0, 1, 1, 1, 1, 1, '{}', 5),
(68, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
(69, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(70, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 11, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(72, 11, 'desc', 'text', 'Desc', 0, 1, 1, 1, 1, 1, '{}', 3),
(73, 11, 'icon', 'text', 'Icon', 0, 0, 1, 1, 1, 1, '{}', 4),
(74, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 5),
(75, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(76, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(77, 12, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(78, 12, 'desc', 'text_area', 'Desc', 0, 1, 1, 1, 1, 1, '{}', 3),
(79, 12, 'icon', 'text', 'Icon', 0, 0, 1, 1, 1, 1, '{}', 4),
(80, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 5),
(81, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(82, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(83, 13, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(84, 13, 'adress', 'text_area', 'Adress', 0, 0, 1, 1, 1, 1, '{}', 3),
(85, 13, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"}]}', 4),
(86, 13, 'location', 'text', 'Location', 0, 0, 1, 1, 1, 1, '{}', 5),
(87, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 6),
(88, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(89, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(90, 14, 'client_name', 'text', 'Client Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(91, 14, 'client_occupation', 'text', 'Client Occupation', 0, 1, 1, 1, 1, 1, '{}', 3),
(92, 14, 'comment', 'text_area', 'Comment', 0, 0, 1, 1, 1, 1, '{}', 4),
(93, 14, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"}]}', 5),
(94, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 6),
(95, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(10, 'socials', 'socials', 'Social', 'Socials', NULL, 'App\\Models\\Social', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-05 08:29:29', '2023-02-05 08:31:38'),
(11, 'activities', 'activities', 'Activity', 'Activities', NULL, 'App\\Activity', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"name\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-05 08:38:24', '2023-02-05 08:39:47'),
(12, 'priorities', 'priorities', 'Priority', 'Priorities', NULL, 'App\\Priority', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"name\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-05 10:22:35', '2023-02-05 10:23:46'),
(13, 'filials', 'filials', 'Filial', 'Filials', NULL, 'App\\Filial', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"name\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-05 10:33:37', '2023-02-05 10:38:00'),
(14, 'reviews', 'reviews', 'Review', 'Reviews', NULL, 'App\\Review', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"client_name\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-02-05 11:00:28', '2023-02-05 11:00:28');

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
-- Table structure for table `filials`
--

CREATE TABLE `filials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filials`
--

INSERT INTO `filials` (`id`, `name`, `adress`, `image`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Uchko\'prik filliali', NULL, NULL, '#', '2023-02-05 10:46:11', '2023-02-05 10:46:11'),
(2, 'Qo\'shtepa filliali', 'Qo\'shtepa filliali', NULL, '#', '2023-02-05 10:46:31', '2023-02-05 10:46:31'),
(3, 'Yozvoyon filliali', NULL, NULL, '#', '2023-02-05 10:46:54', '2023-02-05 10:46:54'),
(4, 'Uychi filliali', NULL, NULL, '#', '2023-02-05 10:47:10', '2023-02-05 10:47:10'),
(5, 'Chust filliali', NULL, NULL, '#', '2023-02-05 10:47:24', '2023-02-05 10:47:24'),
(6, 'Pop filliali', NULL, NULL, '#', '2023-02-05 10:47:33', '2023-02-05 10:47:33'),
(7, 'Pop', NULL, NULL, '#', '2023-02-05 10:47:43', '2023-02-05 10:47:43'),
(8, 'Uchqo\'rg\'on filliali', NULL, NULL, '#', '2023-02-05 10:48:16', '2023-02-05 10:48:16'),
(9, 'Guliston filliali', NULL, NULL, '#', '2023-02-05 10:48:32', '2023-02-05 10:48:32'),
(10, 'Jizzax filliali', NULL, NULL, '#', '2023-02-05 10:49:00', '2023-02-05 10:49:00'),
(11, 'Qamashi filliali', NULL, NULL, '#', '2023-02-05 10:49:12', '2023-02-05 10:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-02-05 03:39:40', '2023-02-05 03:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-02-05 03:39:40', '2023-02-05 03:39:40', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2023-02-05 03:39:40', '2023-02-05 03:39:40', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2023-02-05 03:39:40', '2023-02-05 03:39:40', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2023-02-05 03:39:40', '2023-02-05 03:39:40', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-02-05 03:39:40', '2023-02-05 03:39:40', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2023-02-05 03:39:40', '2023-02-05 03:39:40', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2023-02-05 03:39:40', '2023-02-05 03:39:40', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2023-02-05 03:39:40', '2023-02-05 03:39:40', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2023-02-05 03:39:40', '2023-02-05 03:39:40', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2023-02-05 03:39:40', '2023-02-05 03:39:40', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2023-02-05 03:39:41', '2023-02-05 03:39:41', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2023-02-05 03:39:41', '2023-02-05 03:39:41', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2023-02-05 03:39:41', '2023-02-05 03:39:41', 'voyager.pages.index', NULL),
(15, 1, 'Socials', '', '_self', NULL, NULL, NULL, 15, '2023-02-05 08:29:29', '2023-02-05 08:29:29', 'voyager.socials.index', NULL),
(16, 1, 'Activities', '', '_self', NULL, NULL, NULL, 16, '2023-02-05 08:38:24', '2023-02-05 08:38:24', 'voyager.activities.index', NULL),
(17, 1, 'Priorities', '', '_self', NULL, NULL, NULL, 17, '2023-02-05 10:22:35', '2023-02-05 10:22:35', 'voyager.priorities.index', NULL),
(18, 1, 'Filials', '', '_self', NULL, NULL, NULL, 18, '2023-02-05 10:33:37', '2023-02-05 10:33:37', 'voyager.filials.index', NULL),
(19, 1, 'Reviews', '', '_self', NULL, NULL, NULL, 19, '2023-02-05 11:00:28', '2023-02-05 11:00:28', 'voyager.reviews.index', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Biz haqimizda', '«Yuksalish» do\'konlar tarmog\'iga 2010-yilda asos solingan. Xozirgi kunda 10 dan ortiq fillialimiz mijozlarga sifatli xizmat ko\'rsatib kelmoqda.\r\n\r\nMaqsadlarimiz:\r\n\r\nOʼzbekistondagi eng ishonchli va qulay boʼlgan savdo markaziga aylanish.\r\n2025-yilda Oʼzbekistonda 40+ doʼkonlar tarmogʼini shakllantirish\r\nJamoa va tizim\r\nKuchli jamoa, ishonchli tizim yordamida missiya tomon xarkat\r\n\r\nDoimiy harakat\r\nKichik imkoniyatlar bilan katta yutuqlarga erishish', '<h3>Biz haqimizda</h3>\r\n<p>&laquo;Yuksalish&raquo; do\'konlar tarmog\'iga 2010-yilda asos solingan. Xozirgi kunda 10 dan ortiq fillialimiz mijozlarga sifatli xizmat ko\'rsatib kelmoqda.</p>\r\n<p>Maqsadlarimiz:</p>\r\n<ul>\r\n<li>Oʼzbekistondagi eng ishonchli va qulay boʼlgan savdo markaziga aylanish.</li>\r\n<li>2025-yilda Oʼzbekistonda 40+ doʼkonlar tarmogʼini shakllantirish</li>\r\n</ul>\r\n<div class=\"row icon-boxes\">\r\n<div class=\"col-md-6\">\r\n<h4>Jamoa va tizim</h4>\r\n<p>Kuchli jamoa, ishonchli tizim yordamida missiya tomon xarkat</p>\r\n</div>\r\n<div class=\"col-md-6 mt-4 mt-md-0\">\r\n<h4>Doimiy harakat</h4>\r\n<p>Kichik imkoniyatlar bilan katta yutuqlarga erishish</p>\r\n</div>\r\n</div>', 'pages/February2023/LdivgWGGY6DoJ8zhOJ5m.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-02-05 03:39:41', '2023-02-05 08:44:56');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(2, 'browse_bread', NULL, '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(3, 'browse_database', NULL, '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(4, 'browse_media', NULL, '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(5, 'browse_compass', NULL, '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(6, 'browse_menus', 'menus', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(7, 'read_menus', 'menus', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(8, 'edit_menus', 'menus', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(9, 'add_menus', 'menus', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(10, 'delete_menus', 'menus', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(11, 'browse_roles', 'roles', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(12, 'read_roles', 'roles', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(13, 'edit_roles', 'roles', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(14, 'add_roles', 'roles', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(15, 'delete_roles', 'roles', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(16, 'browse_users', 'users', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(17, 'read_users', 'users', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(18, 'edit_users', 'users', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(19, 'add_users', 'users', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(20, 'delete_users', 'users', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(21, 'browse_settings', 'settings', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(22, 'read_settings', 'settings', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(23, 'edit_settings', 'settings', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(24, 'add_settings', 'settings', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(25, 'delete_settings', 'settings', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(26, 'browse_categories', 'categories', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(27, 'read_categories', 'categories', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(28, 'edit_categories', 'categories', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(29, 'add_categories', 'categories', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(30, 'delete_categories', 'categories', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(31, 'browse_posts', 'posts', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(32, 'read_posts', 'posts', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(33, 'edit_posts', 'posts', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(34, 'add_posts', 'posts', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(35, 'delete_posts', 'posts', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(36, 'browse_pages', 'pages', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(37, 'read_pages', 'pages', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(38, 'edit_pages', 'pages', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(39, 'add_pages', 'pages', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(40, 'delete_pages', 'pages', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(46, 'browse_socials', 'socials', '2023-02-05 08:29:29', '2023-02-05 08:29:29'),
(47, 'read_socials', 'socials', '2023-02-05 08:29:29', '2023-02-05 08:29:29'),
(48, 'edit_socials', 'socials', '2023-02-05 08:29:29', '2023-02-05 08:29:29'),
(49, 'add_socials', 'socials', '2023-02-05 08:29:29', '2023-02-05 08:29:29'),
(50, 'delete_socials', 'socials', '2023-02-05 08:29:29', '2023-02-05 08:29:29'),
(51, 'browse_activities', 'activities', '2023-02-05 08:38:24', '2023-02-05 08:38:24'),
(52, 'read_activities', 'activities', '2023-02-05 08:38:24', '2023-02-05 08:38:24'),
(53, 'edit_activities', 'activities', '2023-02-05 08:38:24', '2023-02-05 08:38:24'),
(54, 'add_activities', 'activities', '2023-02-05 08:38:24', '2023-02-05 08:38:24'),
(55, 'delete_activities', 'activities', '2023-02-05 08:38:24', '2023-02-05 08:38:24'),
(56, 'browse_priorities', 'priorities', '2023-02-05 10:22:35', '2023-02-05 10:22:35'),
(57, 'read_priorities', 'priorities', '2023-02-05 10:22:35', '2023-02-05 10:22:35'),
(58, 'edit_priorities', 'priorities', '2023-02-05 10:22:35', '2023-02-05 10:22:35'),
(59, 'add_priorities', 'priorities', '2023-02-05 10:22:35', '2023-02-05 10:22:35'),
(60, 'delete_priorities', 'priorities', '2023-02-05 10:22:35', '2023-02-05 10:22:35'),
(61, 'browse_filials', 'filials', '2023-02-05 10:33:37', '2023-02-05 10:33:37'),
(62, 'read_filials', 'filials', '2023-02-05 10:33:37', '2023-02-05 10:33:37'),
(63, 'edit_filials', 'filials', '2023-02-05 10:33:37', '2023-02-05 10:33:37'),
(64, 'add_filials', 'filials', '2023-02-05 10:33:37', '2023-02-05 10:33:37'),
(65, 'delete_filials', 'filials', '2023-02-05 10:33:37', '2023-02-05 10:33:37'),
(66, 'browse_reviews', 'reviews', '2023-02-05 11:00:28', '2023-02-05 11:00:28'),
(67, 'read_reviews', 'reviews', '2023-02-05 11:00:28', '2023-02-05 11:00:28'),
(68, 'edit_reviews', 'reviews', '2023-02-05 11:00:28', '2023-02-05 11:00:28'),
(69, 'add_reviews', 'reviews', '2023-02-05 11:00:28', '2023-02-05 11:00:28'),
(70, 'delete_reviews', 'reviews', '2023-02-05 11:00:28', '2023-02-05 11:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-02-05 03:39:41', '2023-02-05 03:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `name`, `desc`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Faqat passport', 'Shartnoma uchun ortiqcha xujjat talab etilmaydi faqat passport', 'bi bi-files', '2023-02-05 10:23:20', '2023-02-05 10:23:20'),
(2, 'Bepul yetkazish', 'O\'z vaqtida bepul yetkazish va o\'rnatib berish xizmati', 'bi bi-truck', '2023-02-05 10:24:12', '2023-02-05 10:24:12'),
(3, 'Tez rasmiylashtirish', 'Malakali xodimlar tomonidan shartnomalar 15 daqidada rasmiylashtirib beriladi', 'bi bi-card-checklist', '2023-02-05 10:24:40', '2023-02-05 10:24:40'),
(4, 'Aksiyalar', 'Doimiy va mavsumiy aksiyalarda muntazam qatnashib borish imkoniyati', 'bi bi-brightness-high', '2023-02-05 10:25:04', '2023-02-05 10:25:04'),
(5, 'Bonus', 'Xarid uchun kafolatlangan bonus va sovg\'alar aynan siz uchun taqdim qilinadi', 'bi bi-gift', '2023-02-05 10:25:38', '2023-02-05 10:25:38'),
(6, 'Keng turdagi mahsulotlar', '5000 xildan ortiq mahsulot va yuqori sifat', 'bi bi-list-ol', '2023-02-05 10:26:12', '2023-02-05 10:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `client_occupation` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `client_name`, `client_occupation`, `comment`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Saul Goodman', 'Ceo & Founder', 'Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper', 'reviews/February2023/vqX2xVHrVZGLn0CZAkkp.jpg', '2023-02-05 11:02:26', '2023-02-05 11:02:26'),
(2, 'Sara Wilsson', 'Designer', 'Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.', 'reviews/February2023/bWyuDurgtWSThNkulgJX.jpg', '2023-02-05 11:03:13', '2023-02-05 11:04:00'),
(3, 'Jena Karlis', 'Store Owner', 'Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim', 'reviews/February2023/loCbqJSdbLtbVdiEm2GC.jpg', '2023-02-05 11:04:43', '2023-02-05 11:04:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-02-05 03:39:40', '2023-02-05 03:39:40'),
(2, 'user', 'Normal User', '2023-02-05 03:39:40', '2023-02-05 03:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', '«Yuksalish» do\'konlar tarmog\'ining rasmiy veb sayti', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', '«Yuksalish» do\'konlar tarmog\'ining rasmiy veb sayti', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/February2023/H0O6HAtLm5PPvPSCznx2.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(14, 'site.address', 'Address', '', NULL, 'rich_text_box', 6, 'Site'),
(15, 'site.email', 'Email', '', NULL, 'rich_text_box', 7, 'Site'),
(16, 'site.phone', 'Phone', '', NULL, 'rich_text_box', 8, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `class_name` varchar(50) DEFAULT NULL,
  `class_icon` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `name`, `class_name`, `class_icon`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Telegram', 'telegram', 'bi bi-telegram', '#', '2023-02-05 08:30:14', '2023-02-05 08:30:14'),
(2, 'facebook', 'facebook', 'bi bi-facebook', '#', '2023-02-05 08:30:35', '2023-02-05 08:30:35'),
(3, 'instagram', 'instagram', 'bi bi-instagram', '#', '2023-02-05 08:30:51', '2023-02-05 08:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-02-05 03:39:41', '2023-02-05 03:39:41'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-02-05 03:39:41', '2023-02-05 03:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$S/oSHApci6CBiJDuPePghOpRyLuqtoStIaieDDGo6xz3wB8uYZ5Qe', 'BLKBuhfXoE7XrVyd3OXUMmD4l3IikQ2k6qUQYlalnx7ygoOMAw7K9qaDexeP', NULL, '2023-02-05 03:39:41', '2023-02-05 03:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `filials`
--
ALTER TABLE `filials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filials`
--
ALTER TABLE `filials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stats`
--
ALTER TABLE `stats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
