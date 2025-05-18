-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2025 at 11:21 PM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mp3`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`) VALUES
('mohit@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `sn` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `descrip` varchar(100) NOT NULL,
  `dt` varchar(100) NOT NULL,
  `cat_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`sn`, `code`, `album_name`, `descrip`, `dt`, `cat_code`) VALUES
(1, '3d7Ue0sn_1', 'Starboy', 'Starboy Description', 'Wed Aug 02 15:14:55 IST 2023', 'fAMKJyRF_1'),
(3, 'EZSwDsie_3', 'Kabir Singh', 'Kabir Singh Description', 'Wed Aug 02 15:17:13 IST 2023', 'BSdRtIbe_3'),
(4, '4Fyj32R1_4', 'Summer High', 'Summer High Description', 'Wed Aug 02 15:17:45 IST 2023', 'i73op9PQ_2'),
(5, 'HcI7Eywb_5', 'Har Har Shambhu', 'Har Har Shambhu Description', 'Wed Aug 02 15:18:35 IST 2023', 'FQcO7WVS_4'),
(6, 'sOliAHqR_6', 'Shershah', 'Shershah Description', 'Wed Aug 02 15:19:53 IST 2023', 'BSdRtIbe_3'),
(7, 'GFK2zIXf_7', 'Laagi Lagan Shankara', 'Laagi Lagan Shankara Description', 'Wed Aug 02 15:20:41 IST 2023', 'FQcO7WVS_4'),
(8, 'PNTAOjJk_8', 'Ram Ram', 'Ram Ram Description', 'Wed Aug 02 15:21:32 IST 2023', 'nFq0zQdI_5'),
(9, '6RYgksz2_9', 'Desi Kalakaar', 'Desi Kalakaar Description', 'Wed Aug 02 15:22:18 IST 2023', 'nFq0zQdI_5'),
(10, 'yARZOzGQ_10', 'Four You', 'Four You Description', 'Wed Aug 02 15:23:20 IST 2023', 'i73op9PQ_2'),
(11, 'VnINAFeJ_11', 'Kedarnath', 'Kedarnath Description', 'Wed Aug 02 15:23:57 IST 2023', 'FQcO7WVS_4'),
(12, 'VdHYaLkU_12', 'Drive Thru', 'Drive Thru Description', 'Wed Aug 02 15:25:00 IST 2023', 'i73op9PQ_2'),
(13, 'L6kT0qGa_13', 'Pathaan', 'Pathaan Description', 'Wed Aug 02 15:25:38 IST 2023', 'BSdRtIbe_3'),
(14, 'CyzAdPv1_14', 'Shape Of You', 'Shape Of You Description', 'Wed Aug 02 15:26:17 IST 2023', 'fAMKJyRF_1'),
(15, 'xyTDUp9g_15', 'Blinding Lights', 'Blinding Lights Description', 'Wed Aug 02 15:27:05 IST 2023', 'fAMKJyRF_1'),
(16, 'eB5dp0vH_16', 'International Villager', 'International Villager Description', 'Wed Aug 02 15:28:05 IST 2023', 'nFq0zQdI_5'),
(17, 'YIryGL6D_17', 'Heat Waves', 'Heat Waves Description', 'Fri Mar 29 12:58:09 IST 2024', 'fAMKJyRF_1'),
(18, 'JIK2YTON_18', 'Alone 2.0', 'Alone 2.0 Description', 'Fri Mar 29 12:59:08 IST 2024', 'fAMKJyRF_1'),
(19, 'IZbKv74Q_19', 'On My Way', 'On My Way Description', 'Fri Mar 29 12:59:25 IST 2024', 'fAMKJyRF_1'),
(20, 'pAr8X2Ey_20', 'God Damn ', 'God Damn Description', 'Fri Mar 29 13:01:19 IST 2024', 'i73op9PQ_2'),
(21, 'fH8SBwyN_21', 'Her', 'Her Description', 'Fri Mar 29 13:01:34 IST 2024', 'i73op9PQ_2'),
(22, 'HQbkeMFg_22', 'Hass Hass', 'Hass Hass Description', 'Fri Mar 29 13:01:49 IST 2024', 'i73op9PQ_2'),
(23, 'gFhV1PcO_23', 'Animal', 'Animal Description', 'Fri Mar 29 13:03:29 IST 2024', 'BSdRtIbe_3'),
(24, 'UX0plFkm_24', 'Brahmastra', 'Brahmastra Description', 'Fri Mar 29 13:03:51 IST 2024', 'BSdRtIbe_3'),
(25, 'nHaGQ8iO_25', 'Akhiyaan Gulaab', 'Akhiyaan Gulaab Description', 'Fri Mar 29 13:04:18 IST 2024', 'BSdRtIbe_3'),
(26, 'pi5ZxYB6_26', 'Bajrang Baan', 'Bajrang Baan Description', 'Fri Mar 29 13:05:51 IST 2024', 'FQcO7WVS_4'),
(27, '69kceY1C_27', 'Mere Ghar Ram', 'Mere Ghar Ram Description', 'Fri Mar 29 13:06:11 IST 2024', 'FQcO7WVS_4'),
(28, 'VCLHqY6N_28', 'Shri Krishna Govind', 'Shri Krishna Govind Description', 'Fri Mar 29 13:06:33 IST 2024', 'FQcO7WVS_4'),
(29, '9TwmzNr5_29', 'Levels', 'Levels Description', 'Fri Mar 29 13:08:55 IST 2024', 'nFq0zQdI_5'),
(30, 'c5LjZOUo_30', 'Cheques', 'Cheques Description', 'Fri Mar 29 13:09:13 IST 2024', 'nFq0zQdI_5'),
(31, 'ZqTP7XQA_31', 'Goat', 'Goat Description', 'Fri Mar 29 13:09:44 IST 2024', 'nFq0zQdI_5'),
(32, 'OSFr9g1P_32', 'Ve Haniya', 'New Album', 'Sat Jul 27 01:55:16 IST 2024', 'i73op9PQ_2');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `sn` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`sn`, `code`, `category`) VALUES
(1, 'fAMKJyRF_1', 'English'),
(2, 'i73op9PQ_2', 'Punjabi'),
(3, 'BSdRtIbe_3', 'Hindi'),
(4, 'FQcO7WVS_4', 'Devotional'),
(5, 'nFq0zQdI_5', 'Rap Songs');

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE IF NOT EXISTS `song` (
  `sn` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `dt` varchar(100) NOT NULL,
  `album_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`sn`, `title`, `description`, `dt`, `album_code`) VALUES
(2, 'Shape Of You', 'Shape Of You Description', 'Wed Aug 02 15:41:12 IST 2023', 'CyzAdPv1_14'),
(3, 'Blinding Lights', 'Blinding Lights Description', 'Wed Aug 02 15:42:13 IST 2023', 'xyTDUp9g_15'),
(4, 'Summer High ', 'Summer High Description', 'Wed Aug 02 15:42:40 IST 2023', '4Fyj32R1_4'),
(5, '52 Bars', '52 Bars Description', 'Wed Aug 02 15:44:49 IST 2023', 'yARZOzGQ_10'),
(6, 'Yeah Naah', 'Yeah Naah Description', 'Wed Aug 02 15:45:53 IST 2023', 'yARZOzGQ_10'),
(7, 'Lemonade', 'Lemonade Description', 'Wed Aug 02 15:46:22 IST 2023', 'VdHYaLkU_12'),
(8, 'Bekhayali', 'Bekhayali Description', 'Wed Aug 02 15:48:21 IST 2023', 'EZSwDsie_3'),
(9, 'Ranjha', 'Ranjha Description', 'Wed Aug 02 15:49:31 IST 2023', 'sOliAHqR_6'),
(10, 'Jhoome Jo Pathaan', 'Jhoome Jo Pathaan Description', 'Wed Aug 02 15:50:46 IST 2023', 'L6kT0qGa_13'),
(11, 'Har Har Shambhu', 'Har Har Shambhu Description', 'Wed Aug 02 15:52:13 IST 2023', 'HcI7Eywb_5'),
(12, 'Laagi Lagan Shankara', 'Laagi Lagan Shankara Description', 'Wed Aug 02 15:53:20 IST 2023', 'GFK2zIXf_7'),
(13, 'Namo Namo', 'Namo Namo Description', 'Wed Aug 02 15:53:56 IST 2023', 'VnINAFeJ_11'),
(14, 'Ram Ram', 'Ram Ram Description', 'Wed Aug 02 15:54:45 IST 2023', 'PNTAOjJk_8'),
(15, 'Love Dose ', 'Love Dose Description', 'Wed Aug 02 15:55:25 IST 2023', '6RYgksz2_9'),
(16, 'Brown Rang', 'Brown Rang Description', 'Wed Aug 02 15:55:46 IST 2023', 'eB5dp0vH_16'),
(1, 'Starboy 2', 'Starboy Description', 'Wed Aug 02 15:39:28 IST 2023', '3d7Ue0sn_1'),
(17, 'Heat Waves', 'Heat Waves Description', 'Fri Mar 29 12:59:51 IST 2024', 'YIryGL6D_17'),
(18, 'Alone 2.0', 'Alone 2.0 Description', 'Fri Mar 29 13:00:22 IST 2024', 'JIK2YTON_18'),
(19, 'On My Way', 'On My Way Description', 'Fri Mar 29 13:00:47 IST 2024', 'IZbKv74Q_19'),
(20, 'God Damn', 'God Damn Description', 'Fri Mar 29 13:02:11 IST 2024', 'pAr8X2Ey_20'),
(21, 'Her', 'Her Description', 'Fri Mar 29 13:02:31 IST 2024', 'fH8SBwyN_21'),
(22, 'Hass Hass', 'Hass Hass Description', 'Fri Mar 29 13:02:52 IST 2024', 'HQbkeMFg_22'),
(23, 'Arjan Vailly', 'Arjan Vailly Description', 'Fri Mar 29 13:04:38 IST 2024', 'gFhV1PcO_23'),
(24, 'Kesariya ', 'Kesariya Description', 'Fri Mar 29 13:04:58 IST 2024', 'UX0plFkm_24'),
(25, 'Akhiyaan Gulaab', 'Akhiyaan Gulaab Description', 'Fri Mar 29 13:05:18 IST 2024', 'nHaGQ8iO_25'),
(26, 'Bajrang Baan', 'Bajrang Baan Description', 'Fri Mar 29 13:07:43 IST 2024', 'pi5ZxYB6_26'),
(27, 'Mere Ghar Ram Aaye Hain', 'Mere Ghar Ram Aaye Hain Description', 'Fri Mar 29 13:08:07 IST 2024', '69kceY1C_27'),
(28, 'Shri Krishna Govind Hare Murari', 'Shri Krishna Govind Hare Murari Description', 'Fri Mar 29 13:08:31 IST 2024', 'VCLHqY6N_28'),
(29, 'Levels', 'Levels Description', 'Fri Mar 29 13:10:24 IST 2024', '9TwmzNr5_29'),
(30, 'Cheque', 'Cheques Description', 'Fri Mar 29 13:10:46 IST 2024', 'c5LjZOUo_30'),
(31, 'Goat ', 'Goat Description', 'Fri Mar 29 13:11:01 IST 2024', 'ZqTP7XQA_31'),
(32, 'Ve Haaniyan', 'Great Song', 'Sat Jul 27 01:55:48 IST 2024', 'OSFr9g1P_32');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
