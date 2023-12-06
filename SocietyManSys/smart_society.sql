-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2022 at 02:11 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_society`
--

-- --------------------------------------------------------

--
-- Table structure for table `allotment_details`
--

CREATE TABLE `allotment_details` (
  `id` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `flat_no` int(11) NOT NULL,
  `members` int(11) NOT NULL,
  `mob_no` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allotment_details`
--

INSERT INTO `allotment_details` (`id`, `date`, `email`, `flat_no`, `members`, `mob_no`, `name`, `password`, `role_id`) VALUES
(1, '', 'ajeetingale31@gmail.com', 11, 5, '7775958484', 'ajit', 'Ajeetingale', 1),
(2, '04/09/2022', 'ajit@gmail.com', 10, 5, '7775958488', 'ajit ingale', '7775958488', 2);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `flat_no` int(11) NOT NULL,
  `issuedate` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `resolvedate` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `flat_details`
--

CREATE TABLE `flat_details` (
  `flat_no` int(11) NOT NULL,
  `flat_type` varchar(255) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flat_details`
--

INSERT INTO `flat_details` (`flat_no`, `flat_type`, `floor`) VALUES
(10, '1BHK', 'first');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `flat_no` int(11) NOT NULL,
  `photoid` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `visitor_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allotment_details`
--
ALTER TABLE `allotment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flat_details`
--
ALTER TABLE `flat_details`
  ADD PRIMARY KEY (`flat_no`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allotment_details`
--
ALTER TABLE `allotment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
