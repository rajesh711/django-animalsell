-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2020 at 11:45 AM
-- Server version: 5.7.29-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animalselling`
--

-- --------------------------------------------------------

--
-- Table structure for table `animal_comments`
--

CREATE TABLE `animal_comments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `comment_status` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dlt_status` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `animal_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `user_contact` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animal_comments`
--

INSERT INTO `animal_comments` (`id`, `name`, `comment`, `comment_status`, `time`, `dlt_status`, `animal_id`, `author_id`, `user_contact`) VALUES
(1, 'rajesh', '', 0, '2020-03-05 14:34:58', 0, 26, 1, ''),
(2, '', '', 0, '2020-03-05 14:35:54', 0, 26, 1, ''),
(3, 'rajesh', 'good', 0, '2020-03-06 05:14:14', 0, 26, 1, '9865985623'),
(4, 'rajesh', 'kjkhgkhj', 0, '2020-03-06 05:16:45', 0, 31, 1, '9865985623'),
(5, 'rajesh', 'fsdsdffsf', 0, '2020-03-06 05:17:53', 0, 31, 1, '9865985623');

-- --------------------------------------------------------

--
-- Table structure for table `animal_country`
--

CREATE TABLE `animal_country` (
  `id` int(11) NOT NULL,
  `sortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `animal_country`
--

INSERT INTO `animal_country` (`id`, `sortname`, `name`, `phonecode`) VALUES
(1, 'IN', 'India', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `animal_group`
--

CREATE TABLE `animal_group` (
  `id` int(11) NOT NULL,
  `en_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `in_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mrt_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 NOT NULL,
  `status` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animal_group`
--

INSERT INTO `animal_group` (`id`, `en_name`, `in_name`, `mrt_name`, `image`, `status`) VALUES
(1, 'Cow', 'गाय', 'गाय', 'dairy_cow.png', 0),
(2, 'Baffalo', 'भैस', 'म्हशी', 'buffalo.png', 0),
(3, 'Goat', 'बकरी', 'बकरी', 'goat.png', 0),
(7, 'Horse', 'घोड़ा', 'घोड़ा', 'horse.png', 0),
(8, 'Camel', 'ऊंट', 'ऊंट', 'camel.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `animal_likeunlike`
--

CREATE TABLE `animal_likeunlike` (
  `Id` int(11) NOT NULL,
  `like_unlike` smallint(5) UNSIGNED NOT NULL,
  `time` datetime(6) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animal_likeunlike`
--

INSERT INTO `animal_likeunlike` (`Id`, `like_unlike`, `time`, `animal_id`, `author_id`) VALUES
(62, 1, '2020-03-05 07:00:38.473772', 22, 1),
(63, 1, '2020-03-05 07:10:26.032321', 26, 1),
(64, 1, '2020-03-05 07:10:28.604124', 25, 1),
(65, 0, '2020-03-05 07:10:30.876826', 24, 1),
(66, 1, '2020-03-05 07:10:33.208658', 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `animal_post`
--

CREATE TABLE `animal_post` (
  `id` int(11) NOT NULL,
  `animal_group` varchar(250) DEFAULT NULL,
  `animal_breed` varchar(250) DEFAULT NULL,
  `animal_milk` varchar(255) DEFAULT NULL,
  `animal_color` varchar(100) DEFAULT NULL,
  `animal_age` varchar(100) DEFAULT NULL,
  `animal_weight` varchar(100) DEFAULT NULL,
  `animal_child` varchar(100) DEFAULT NULL,
  `animal_info` varchar(100) DEFAULT NULL,
  `animal_price` varchar(100) DEFAULT NULL,
  `front_image` varchar(255) DEFAULT NULL,
  `back_image` varchar(255) DEFAULT NULL,
  `left_image` varchar(255) DEFAULT NULL,
  `right_image` varchar(255) DEFAULT NULL,
  `approved_status` smallint(5) UNSIGNED NOT NULL,
  `delete_status` smallint(5) UNSIGNED NOT NULL,
  `sold_status` smallint(5) UNSIGNED NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_contact` varchar(100) DEFAULT NULL,
  `user_late` varchar(100) DEFAULT NULL,
  `user_long` varchar(100) DEFAULT NULL,
  `user_village` varchar(100) DEFAULT NULL,
  `user_address` longtext,
  `user_teh` varchar(100) DEFAULT NULL,
  `user_dist` varchar(100) DEFAULT NULL,
  `user_state` varchar(100) DEFAULT NULL,
  `user_country` varchar(100) DEFAULT NULL,
  `user_state_id` int(11) DEFAULT NULL,
  `user_country_id` int(11) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `animal_post`
--

INSERT INTO `animal_post` (`id`, `animal_group`, `animal_breed`, `animal_milk`, `animal_color`, `animal_age`, `animal_weight`, `animal_child`, `animal_info`, `animal_price`, `front_image`, `back_image`, `left_image`, `right_image`, `approved_status`, `delete_status`, `sold_status`, `user_name`, `user_contact`, `user_late`, `user_long`, `user_village`, `user_address`, `user_teh`, `user_dist`, `user_state`, `user_country`, `user_state_id`, `user_country_id`, `add_time`, `author_id`) VALUES
(22, '1', '1', '18', '1', '8', '250', '1', 'good cow', '25000', 'animal_pics/1200px-Fries-Hollandse_koe.jpeg', 'animal_pics/images_3_3dMurlo.jpeg', 'animal_pics/download_4.jpeg', 'animal_pics/download_BJSIbkx.jpeg', 1, 0, 0, 'rajesh', '5555555555', '22.72473954', '75.88166449', 'indore', 'indore', 'indore', 'indore', NULL, NULL, 4, 1, '2020-03-05 06:31:17.228697', 1),
(23, '2', '8', '19', '1', '8', '250', '1', 'good baffalow', '25000', 'animal_pics/images.jpeg', 'animal_pics/images_1.jpeg', 'animal_pics/download_3.jpeg', 'animal_pics/images_1_2somTMu.jpeg', 1, 0, 0, 'mahesh', '9865985623', '22.72473954', '75.88166449', 'indore', 'indore', 'indore', 'indore', NULL, NULL, 4, 1, '2020-03-05 06:39:51.555408', 3),
(24, '8', '18', '1', '1', '8', '250', '1', 'good camel', '25000', 'animal_pics/images_2.jpeg', 'animal_pics/images_2_vpKbGm8.jpeg', 'animal_pics/extreme-milks-img1.jpg', 'animal_pics/extreme-milks-img1_W7WjYhT.jpg', 1, 0, 0, 'mahesh', '1234567890', '22.72473954', '75.88166449', 'indore', 'indore', 'indore', 'indore', NULL, NULL, 4, 1, '2020-03-05 06:40:41.599870', 3),
(25, '1', '4', '10', '5', '8', '250', '1', '', '25000', 'animal_pics/right_LXHS038.jpeg', 'animal_pics/maxresdefault.jpg', 'animal_pics/images_3_I0VLmSo.jpeg', 'animal_pics/1200px-Fries-Hollandse_koe_JITgMH4.jpeg', 1, 0, 0, 'dinesh', '123456789456', '22.72473954', '75.88166449', 'indore', 'indore', 'indore', 'indore', NULL, NULL, 4, 1, '2020-03-05 06:41:40.324095', 3),
(26, '3', '9', '9', '1', '8', '250', '1', 'bikau hai goat', '25000', 'animal_pics/goat-hyde-park-t.jpg', 'animal_pics/boer-female-goat-500x500.jpg', 'animal_pics/images_7.jpeg', 'animal_pics/boer-female-goat-500x500_sogdzPR.jpg', 1, 0, 0, 'ram', '5545455454544', '22.72473954', '75.88166449', 'kalsta', 'khandwa', 'bakuneruis', 'khandwa', NULL, NULL, 4, 1, '2020-03-05 06:46:09.535392', 3),
(31, '1', '1', '1', '3', '8', '250', '1', 'dfvdafa', '25000', 'animal_pics/images_1_wYBBaOs.jpeg', 'default.jpg', 'default.jpg', 'default.jpg', 1, 0, 0, 'dfvsasa', '51445364145364', '22.72473954', '75.88166449', '', 'dvdasvdav', '', '', NULL, NULL, 4, 1, '2020-03-05 13:29:33.657507', 1),
(32, '1', '1', '1', '3', '8', '250', '1', 'eghegegege', '25000', 'default.jpg', 'default.jpg', 'default.jpg', 'default.jpg', 1, 0, 0, 'rajesh', '9865985623', '22.72473954', '75.88166449', 'indore', 'indore', 'indore', 'indore', NULL, NULL, 4, 1, '2020-03-05 13:47:57.437108', 1);

-- --------------------------------------------------------

--
-- Table structure for table `animal_state`
--

CREATE TABLE `animal_state` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '1',
  `code` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `animal_state`
--

INSERT INTO `animal_state` (`id`, `name`, `country_id`, `code`) VALUES
(1, 'West Bengal', 1, '28'),
(2, 'Uttar Pradesh', 1, '36'),
(3, 'Punjab', 1, '23'),
(4, 'Madhya Pradesh', 1, '35'),
(5, 'Karnataka', 1, '19'),
(6, 'Maharashtra', 1, '16'),
(7, 'Haryana', 1, '10'),
(8, 'Uttarakhand', 1, '39'),
(9, 'Andhra Pradesh', 1, '02'),
(10, 'Tripura', 1, '26'),
(11, 'Tamil Nadu', 1, '25'),
(12, 'Jammu and Kashmir', 1, '12'),
(13, 'Andaman and Nicobar Islands', 1, '01'),
(14, 'Assam', 1, '03'),
(15, 'Chhattisgarh', 1, '37'),
(16, 'Rajasthan', 1, '24'),
(17, 'Goa', 1, '33'),
(18, 'Puducherry', 1, '22'),
(19, 'Gujarat', 1, '09'),
(20, 'Kerala', 1, '13'),
(21, 'Arunachal Pradesh', 1, '30'),
(22, 'Odisha', 1, '21'),
(23, 'Himachal Pradesh', 1, '11'),
(24, 'Bihar', 1, '34'),
(25, 'Meghalaya', 1, '18'),
(26, 'Nagaland', 1, '20'),
(27, 'Telangana', 1, '1'),
(28, 'Manipur', 1, '17'),
(29, 'Mizoram', 1, '31'),
(30, 'Jharkhand', 1, '38'),
(31, 'Delhi', 1, '07'),
(32, 'Dadra and Nagar Haveli', 1, '06'),
(33, 'Daman and Diu', 1, '32'),
(34, 'Sikkim', 1, '29'),
(35, 'Chandigarh', 1, '05'),
(36, 'Lakshadweep', 1, '14');

-- --------------------------------------------------------

--
-- Table structure for table `animal_type`
--

CREATE TABLE `animal_type` (
  `id` int(11) NOT NULL,
  `en_type` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `in_type` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mrt_type` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` smallint(5) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animal_type`
--

INSERT INTO `animal_type` (`id`, `en_type`, `in_type`, `mrt_type`, `image`, `status`, `group_id`) VALUES
(1, 'Indigenous cow ', 'देसी गाय', 'देसी गाय', 'desi.png', 0, 1),
(2, 'Jersey cow', 'जर्सी गाय', 'जर्सी गाय', 'jarsi.png', 0, 1),
(3, 'Rajasthani Cow', 'राजस्थानी गाय', 'राजस्थानी गाय', 'rajsthani.png', 0, 1),
(4, 'Dairy Cow', 'डेयरी गाय', 'डेयरी गाय', 'dairy_cow.png', 0, 1),
(5, 'Sahiwal', 'सहिवाल', 'साहिवाल', 'Sahiwal.png', 0, 1),
(6, 'Gir', 'गीर', 'गीर', 'gir.png', 0, 1),
(7, 'Home Buffalo', 'देसी भैंस', 'देसी म्हैस ', 'murrah.png', 0, 2),
(8, 'Murrah Buffalo', 'मुर्राह भैंस', 'मुर्रा म्हैस', 'murrah.png', 0, 2),
(9, 'Goat', 'बकरी', 'बकरी', 'goat.png', 0, 3),
(10, 'Jamunapari', 'जमुनापारी', 'जमुनापारी', 'jamnapari.png', 0, 3),
(11, 'Ox', 'बैल', 'बैल', 'ox.png', 0, 1),
(12, 'Male Buffalo', 'भैसा', 'म्हशी', NULL, 0, 2),
(13, 'Male goat', 'बकरा', 'बकरा', 'm_goat.jpeg', 0, 3),
(14, 'Male Camel', 'नर ऊंट', 'नर ऊंट', 'camel.png', 0, 8),
(15, 'Horse', 'घोड़ा', 'घोड़ा', 'horse.png', 0, 7),
(16, 'Jaffrabadi', 'जाफराबादी', 'जाफराबादी', 'gabrabadi.png', 0, 2),
(17, 'Nagpuri', 'नागपुरी', 'नागपुरी', 'nagpuri_bufflo.png', 0, 2),
(18, 'Camel', 'ऊंट', 'ऊंट', 'camel.png', 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add group', 1, 'add_group'),
(2, 'Can change group', 1, 'change_group'),
(3, 'Can delete group', 1, 'delete_group'),
(4, 'Can view group', 1, 'view_group'),
(5, 'Can add type', 2, 'add_type'),
(6, 'Can change type', 2, 'change_type'),
(7, 'Can delete type', 2, 'delete_type'),
(8, 'Can view type', 2, 'view_type'),
(9, 'Can add post', 3, 'add_post'),
(10, 'Can change post', 3, 'change_post'),
(11, 'Can delete post', 3, 'delete_post'),
(12, 'Can view post', 3, 'view_post'),
(13, 'Can add profile', 4, 'add_profile'),
(14, 'Can change profile', 4, 'change_profile'),
(15, 'Can delete profile', 4, 'delete_profile'),
(16, 'Can view profile', 4, 'view_profile'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add permission', 6, 'add_permission'),
(22, 'Can change permission', 6, 'change_permission'),
(23, 'Can delete permission', 6, 'delete_permission'),
(24, 'Can view permission', 6, 'view_permission'),
(25, 'Can add group', 7, 'add_group'),
(26, 'Can change group', 7, 'change_group'),
(27, 'Can delete group', 7, 'delete_group'),
(28, 'Can view group', 7, 'view_group'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add content type', 9, 'add_contenttype'),
(34, 'Can change content type', 9, 'change_contenttype'),
(35, 'Can delete content type', 9, 'delete_contenttype'),
(36, 'Can view content type', 9, 'view_contenttype'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session'),
(41, 'Can add country', 11, 'add_country'),
(42, 'Can change country', 11, 'change_country'),
(43, 'Can delete country', 11, 'delete_country'),
(44, 'Can view country', 11, 'view_country'),
(45, 'Can add state', 12, 'add_state'),
(46, 'Can change state', 12, 'change_state'),
(47, 'Can delete state', 12, 'delete_state'),
(48, 'Can view state', 12, 'view_state'),
(49, 'Can add like unlike', 13, 'add_likeunlike'),
(50, 'Can change like unlike', 13, 'change_likeunlike'),
(51, 'Can delete like unlike', 13, 'delete_likeunlike'),
(52, 'Can view like unlike', 13, 'view_likeunlike'),
(53, 'Can add comments', 14, 'add_comments'),
(54, 'Can change comments', 14, 'change_comments'),
(55, 'Can delete comments', 14, 'delete_comments'),
(56, 'Can view comments', 14, 'view_comments');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$9egZLk4qU6fm$nGKpJ8eQBhkyEWHb6DacwWk9kwfaOurT3SIsWlht4v0=', '2020-03-05 06:51:12.814010', 1, 'admin123', 'rajesh', 'patidar', 'admin@gmail.com', 1, 1, '2020-02-26 08:53:56.257011'),
(2, 'pbkdf2_sha256$180000$we62CO4N62Fw$33Jos+ZGVnAMeFWEGY9+BmeL/9c1UP4M3siBIOTdv/E=', '2020-02-27 05:31:09.484527', 0, '9179464709', '', '', '', 0, 1, '2020-02-27 05:30:54.722552'),
(3, 'pbkdf2_sha256$180000$S4b2XZJNkyqz$1kATThX9VM8kYc7tqKmHjVrXvEk2gTTRX/Qb6ErD4lc=', '2020-03-05 06:38:43.781634', 0, '3333333333', '', '', '', 0, 1, '2020-03-02 14:22:23.380159');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-03-03 05:41:58.442155', '11', '', 3, '', 3, 1),
(2, '2020-03-03 07:14:31.124683', '12', 'mahesh', 3, '', 3, 1),
(3, '2020-03-03 07:34:10.633871', '23', '3333333333', 3, '', 13, 1),
(4, '2020-03-03 07:34:10.677746', '22', '3333333333', 3, '', 13, 1),
(5, '2020-03-03 07:34:10.717765', '21', '3333333333', 3, '', 13, 1),
(6, '2020-03-03 07:34:10.838290', '20', '3333333333', 3, '', 13, 1),
(7, '2020-03-03 07:34:10.878956', '19', '3333333333', 3, '', 13, 1),
(8, '2020-03-03 07:34:10.919127', '18', '3333333333', 3, '', 13, 1),
(9, '2020-03-03 07:34:10.959228', '17', 'admin123', 3, '', 13, 1),
(10, '2020-03-03 07:34:10.999351', '13', '3333333333', 3, '', 13, 1),
(11, '2020-03-03 07:34:11.039704', '12', '3333333333', 3, '', 13, 1),
(12, '2020-03-03 07:34:11.079699', '10', 'admin123', 3, '', 13, 1),
(13, '2020-03-03 07:34:11.119560', '9', 'admin123', 3, '', 13, 1),
(14, '2020-03-03 07:34:11.159717', '8', 'admin123', 3, '', 13, 1),
(15, '2020-03-03 07:34:11.199985', '7', 'admin123', 3, '', 13, 1),
(16, '2020-03-03 07:34:11.240351', '6', 'admin123', 3, '', 13, 1),
(17, '2020-03-03 07:34:11.280391', '5', 'admin123', 3, '', 13, 1),
(18, '2020-03-03 07:34:11.321432', '4', 'admin123', 3, '', 13, 1),
(19, '2020-03-03 07:34:11.362008', '3', 'admin123', 3, '', 13, 1),
(20, '2020-03-03 07:34:11.401744', '2', 'admin123', 3, '', 13, 1),
(21, '2020-03-03 07:34:11.441794', '1', 'admin123', 3, '', 13, 1),
(22, '2020-03-03 09:22:37.330280', '38', 'admin123', 3, '', 13, 1),
(23, '2020-03-03 09:22:37.378844', '37', 'admin123', 3, '', 13, 1),
(24, '2020-03-03 09:22:37.419624', '36', 'admin123', 3, '', 13, 1),
(25, '2020-03-03 09:22:37.459230', '35', '3333333333', 3, '', 13, 1),
(26, '2020-03-03 09:22:37.499307', '34', '3333333333', 3, '', 13, 1),
(27, '2020-03-03 09:22:37.620209', '33', '3333333333', 3, '', 13, 1),
(28, '2020-03-03 09:22:37.660549', '32', '3333333333', 3, '', 13, 1),
(29, '2020-03-03 09:22:37.700808', '31', '3333333333', 3, '', 13, 1),
(30, '2020-03-03 09:22:37.741114', '30', '3333333333', 3, '', 13, 1),
(31, '2020-03-03 09:22:37.780896', '29', '3333333333', 3, '', 13, 1),
(32, '2020-03-03 09:22:37.821050', '28', '3333333333', 3, '', 13, 1),
(33, '2020-03-03 09:22:37.861260', '27', '3333333333', 3, '', 13, 1),
(34, '2020-03-03 09:22:37.901838', '26', 'admin123', 3, '', 13, 1),
(35, '2020-03-03 09:22:37.941667', '25', 'admin123', 3, '', 13, 1),
(36, '2020-03-03 09:22:37.981813', '24', 'admin123', 3, '', 13, 1),
(37, '2020-03-03 09:27:22.716703', '43', '3333333333', 3, '', 13, 1),
(38, '2020-03-03 09:27:22.758836', '42', '3333333333', 3, '', 13, 1),
(39, '2020-03-03 09:27:22.798946', '41', 'admin123', 3, '', 13, 1),
(40, '2020-03-03 09:27:22.839096', '40', 'admin123', 3, '', 13, 1),
(41, '2020-03-03 09:27:22.879331', '39', 'admin123', 3, '', 13, 1),
(42, '2020-03-04 08:54:02.443349', '1', 'rajesh', 3, '', 3, 1),
(43, '2020-03-05 06:29:43.453118', '21', 'rajesh', 3, '', 3, 1),
(44, '2020-03-05 06:29:43.486661', '20', 'rajesh', 3, '', 3, 1),
(45, '2020-03-05 06:29:43.526919', '17', 'rajesh', 3, '', 3, 1),
(46, '2020-03-05 06:29:43.567066', '16', 'rajesh', 3, '', 3, 1),
(47, '2020-03-05 06:29:43.607177', '15', 'rajesh', 3, '', 3, 1),
(48, '2020-03-05 06:29:43.647408', '13', 'rajesh', 3, '', 3, 1),
(49, '2020-03-05 06:29:43.687542', '10', 'rajesh', 3, '', 3, 1),
(50, '2020-03-05 06:29:43.808257', '9', 'rgeg', 3, '', 3, 1),
(51, '2020-03-05 06:29:43.848235', '8', 'rajesh', 3, '', 3, 1),
(52, '2020-03-05 06:29:43.888418', '7', 'rajesh', 3, '', 3, 1),
(53, '2020-03-05 06:29:59.031787', '6', 'rajesh', 3, '', 3, 1),
(54, '2020-03-05 06:29:59.074205', '5', 'mahesh', 3, '', 3, 1),
(55, '2020-03-05 06:29:59.114494', '4', 'rajesh', 3, '', 3, 1),
(56, '2020-03-05 06:29:59.164443', '3', 'rajesh', 3, '', 3, 1),
(57, '2020-03-05 06:29:59.315267', '2', 'rajesh', 3, '', 3, 1),
(58, '2020-03-05 14:25:03.556499', '30', 'rajesh', 3, '', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(5, 'admin', 'logentry'),
(14, 'animal', 'comments'),
(11, 'animal', 'country'),
(1, 'animal', 'group'),
(13, 'animal', 'likeunlike'),
(3, 'animal', 'post'),
(12, 'animal', 'state'),
(2, 'animal', 'type'),
(7, 'auth', 'group'),
(6, 'auth', 'permission'),
(8, 'auth', 'user'),
(9, 'contenttypes', 'contenttype'),
(10, 'sessions', 'session'),
(4, 'users', 'profile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-02-26 07:15:18.322285'),
(2, 'auth', '0001_initial', '2020-02-26 07:15:20.153254'),
(3, 'admin', '0001_initial', '2020-02-26 07:15:27.814467'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-02-26 07:15:29.493114'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-02-26 07:15:29.588551'),
(6, 'animal', '0001_initial', '2020-02-26 07:15:30.967980'),
(7, 'contenttypes', '0002_remove_content_type_name', '2020-02-26 07:15:33.627907'),
(8, 'auth', '0002_alter_permission_name_max_length', '2020-02-26 07:15:33.780408'),
(9, 'auth', '0003_alter_user_email_max_length', '2020-02-26 07:15:33.911260'),
(10, 'auth', '0004_alter_user_username_opts', '2020-02-26 07:15:33.963386'),
(11, 'auth', '0005_alter_user_last_login_null', '2020-02-26 07:15:34.483790'),
(12, 'auth', '0006_require_contenttypes_0002', '2020-02-26 07:15:34.557321'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2020-02-26 07:15:34.632296'),
(14, 'auth', '0008_alter_user_username_max_length', '2020-02-26 07:15:34.756648'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2020-02-26 07:15:34.888193'),
(16, 'auth', '0010_alter_group_name_max_length', '2020-02-26 07:15:35.029539'),
(17, 'auth', '0011_update_proxy_permissions', '2020-02-26 07:15:35.095043'),
(18, 'sessions', '0001_initial', '2020-02-26 07:15:35.392905'),
(19, 'users', '0001_initial', '2020-02-26 07:15:36.039204'),
(20, 'animal', '0002_country_state', '2020-02-26 07:30:05.391710'),
(21, 'animal', '0003_auto_20200227_1335', '2020-02-27 13:35:40.043613'),
(22, 'animal', '0004_auto_20200227_1344', '2020-02-27 13:44:40.006018'),
(23, 'animal', '0005_auto_20200227_1347', '2020-02-27 13:47:41.348482'),
(24, 'animal', '0006_auto_20200227_1422', '2020-02-27 14:22:36.783449'),
(25, 'animal', '0007_auto_20200228_0546', '2020-02-28 05:46:52.209616'),
(26, 'animal', '0008_likeunlike', '2020-02-29 10:07:28.575911'),
(27, 'animal', '0009_auto_20200229_1058', '2020-02-29 10:58:52.280015'),
(28, 'animal', '0010_auto_20200229_1100', '2020-02-29 11:00:49.834846'),
(29, 'animal', '0011_comments', '2020-03-02 07:43:24.374354'),
(30, 'animal', '0012_comments_user_contact', '2020-03-02 09:41:01.712561'),
(31, 'animal', '0013_auto_20200303_0852', '2020-03-03 08:52:58.169395'),
(32, 'animal', '0014_auto_20200303_0907', '2020-03-03 09:07:34.586804'),
(33, 'animal', '0015_auto_20200303_0911', '2020-03-03 09:11:27.456897');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('qtjc20l55t4j745dmewlso81qn418w03', 'MmZlOGZlMTk1ZjUxODY2MTI3MTUyODhmN2E3MWFkMWM2OWE5ZDg1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMjVkODAwMTczZjExYTI1YmUzZjA5NGQ2NjBlYWNkNGU5N2Y2NzA2In0=', '2020-03-19 06:51:12.976324');

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL,
  `user_contact` varchar(100) NOT NULL,
  `user_late` varchar(100) NOT NULL,
  `user_long` varchar(100) NOT NULL,
  `user_village` varchar(100) NOT NULL,
  `user_address` longtext NOT NULL,
  `user_teh` varchar(100) NOT NULL,
  `user_dist` varchar(100) NOT NULL,
  `user_state` varchar(100) NOT NULL,
  `user_country` varchar(100) NOT NULL,
  `user_state_id` varchar(100) NOT NULL,
  `user_country_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `user_contact`, `user_late`, `user_long`, `user_village`, `user_address`, `user_teh`, `user_dist`, `user_state`, `user_country`, `user_state_id`, `user_country_id`, `user_id`) VALUES
(1, '9865985623', '', '', 'indore', 'indore', 'indore', 'indore', '', '', '4', '1', 1),
(2, '', '', '', '', '', '', '', '', '', '', '', 2),
(3, '', '', '', '', '', '', '', '', '', '', '', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal_comments`
--
ALTER TABLE `animal_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_comments_animal_id_accd01c3_fk_animal_post_id` (`animal_id`),
  ADD KEY `animal_comments_author_id_092bd098_fk_auth_user_id` (`author_id`);

--
-- Indexes for table `animal_country`
--
ALTER TABLE `animal_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_group`
--
ALTER TABLE `animal_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_likeunlike`
--
ALTER TABLE `animal_likeunlike`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `animal_likeunlike_animal_id_92cc4af8_fk_animal_post_id` (`animal_id`),
  ADD KEY `animal_likeunlike_author_id_5a62b9c5_fk_auth_user_id` (`author_id`);

--
-- Indexes for table `animal_post`
--
ALTER TABLE `animal_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_post_author_id_ce0e37bc_fk_auth_user_id` (`author_id`);

--
-- Indexes for table `animal_state`
--
ALTER TABLE `animal_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_type`
--
ALTER TABLE `animal_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_type_group_id_250a5cbc_fk_animal_group_id` (`group_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animal_comments`
--
ALTER TABLE `animal_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `animal_country`
--
ALTER TABLE `animal_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `animal_group`
--
ALTER TABLE `animal_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `animal_likeunlike`
--
ALTER TABLE `animal_likeunlike`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `animal_post`
--
ALTER TABLE `animal_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `animal_state`
--
ALTER TABLE `animal_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `animal_type`
--
ALTER TABLE `animal_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `animal_comments`
--
ALTER TABLE `animal_comments`
  ADD CONSTRAINT `animal_comments_animal_id_accd01c3_fk_animal_post_id` FOREIGN KEY (`animal_id`) REFERENCES `animal_post` (`id`),
  ADD CONSTRAINT `animal_comments_author_id_092bd098_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `animal_likeunlike`
--
ALTER TABLE `animal_likeunlike`
  ADD CONSTRAINT `animal_likeunlike_animal_id_92cc4af8_fk_animal_post_id` FOREIGN KEY (`animal_id`) REFERENCES `animal_post` (`id`),
  ADD CONSTRAINT `animal_likeunlike_author_id_5a62b9c5_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `animal_post`
--
ALTER TABLE `animal_post`
  ADD CONSTRAINT `animal_post_author_id_ce0e37bc_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `animal_type`
--
ALTER TABLE `animal_type`
  ADD CONSTRAINT `animal_type_group_id_250a5cbc_fk_animal_group_id` FOREIGN KEY (`group_id`) REFERENCES `animal_group` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
