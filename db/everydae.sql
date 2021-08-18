-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2021 at 12:37 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `everydae`
--

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE `challenges` (
  `id` int(11) NOT NULL,
  `challenge_name` varchar(255) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `challenges`
--

INSERT INTO `challenges` (`id`, `challenge_name`, `question_text`, `createdAt`, `updatedAt`) VALUES
(1, 'Write essay', 'Write what is in your mind.', '2021-08-18', '2021-08-18'),
(2, 'Second challenge', 'Question of second challenge', '2021-08-18', '2021-08-18');

-- --------------------------------------------------------

--
-- Table structure for table `challenge_users`
--

CREATE TABLE `challenge_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `stopped_time` datetime DEFAULT NULL,
  `completed_at_time` datetime DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `challenge_users`
--

INSERT INTO `challenge_users` (`id`, `user_id`, `start_time`, `stopped_time`, `completed_at_time`, `challenge_id`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2021-08-18 15:00:00', NULL, '2021-08-18 17:40:00', 1, '2021-08-18 00:00:00', '2021-08-18 00:00:00'),
(2, 1, '2021-08-17 17:00:00', '2021-08-17 20:40:00', NULL, 2, '2021-08-17 19:00:00', '2021-08-18 00:00:00'),
(3, 3, '2021-08-17 20:00:00', NULL, '2021-08-17 22:00:00', 1, '2021-08-18 00:00:00', '2021-08-18 00:00:00'),
(4, 3, '2021-08-17 21:00:00', NULL, '2021-08-17 23:00:00', 2, '2021-08-18 00:00:00', '2021-08-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` int(11) NOT NULL,
  `fName` varchar(255) NOT NULL,
  `lName` varchar(255) NOT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `fName`, `lName`, `createdAt`, `updatedAt`) VALUES
(1, 'Filan', 'Fisteku', '2021-08-18', '2021-08-18'),
(2, 'John', 'Smith', '2021-08-18', '2021-08-18'),
(3, 'Jane', 'Doe', '2021-08-18', '2021-08-18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `target_sat_score` int(11) NOT NULL,
  `days_until_exam` double NOT NULL,
  `parent_id` int(11) NOT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `target_sat_score`, `days_until_exam`, `parent_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Besar', 'Zhubi', 1300, 7, 1, '2021-08-18', '2021-08-18'),
(2, 'Brian', 'Smith', 1600, 5, 2, '2021-08-18', '2021-08-18'),
(3, 'Dorothy', 'Smith', 1450, 3, 2, '2021-08-18', '2021-08-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challenge_users`
--
ALTER TABLE `challenge_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `challenge_id` (`challenge_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challenges`
--
ALTER TABLE `challenges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `challenge_users`
--
ALTER TABLE `challenge_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `challenge_users`
--
ALTER TABLE `challenge_users`
  ADD CONSTRAINT `challenge_id` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`),
  ADD CONSTRAINT `challenge_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `parent_id` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
