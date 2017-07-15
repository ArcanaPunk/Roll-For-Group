-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 10, 2017 at 09:03 PM
-- Server version: 5.7.18-log
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rollforgroup`
--
CREATE DATABASE IF NOT EXISTS `rollforgroup` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `rollforgroup`;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `GameID` int(11) NOT NULL,
  `Game` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`GameID`, `Game`) VALUES
(1, 'Dungeons & Dragons'),
(2, 'Pathfinder');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `GroupID` int(11) NOT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `GameID` int(11) DEFAULT NULL,
  `Location` varchar(250) DEFAULT NULL,
  `Day1` varchar(50) DEFAULT NULL,
  `Day1Time` varchar(50) DEFAULT NULL,
  `Day2` varchar(50) DEFAULT NULL,
  `Day2Time` varchar(50) DEFAULT NULL,
  `Day3` varchar(50) DEFAULT NULL,
  `Day3Time` varchar(50) DEFAULT NULL,
  `Description` varchar(2500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`GroupID`, `Name`, `UserID`, `GameID`, `Location`, `Day1`, `Day1Time`, `Day2`, `Day2Time`, `Day3`, `Day3Time`, `Description`) VALUES
(3, 'Test', 12, 2, 'Default', 'Default', 'Default', 'Default', 'Default', 'Default', 'Default', NULL),
(4, 'Test2', 12, 1, 'Default', 'Default', 'Default', 'Default', 'Default', 'Default', 'Default', NULL),
(5, 'Test2', 12, 1, 'Default', 'Default', 'Default', 'Default', 'Default', 'Default', 'Default', NULL),
(6, 'Testing Still', 12, 1, 'Default', 'Default', 'Default', 'Default', 'Default', 'Default', 'Default', NULL),
(7, 'Arcanas Group', 8, 2, 'online', 'Wednesday', 'Evening', 'Sunday', 'Night', 'Tuesday', 'Evening', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Zip` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `AddedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Email`, `FirstName`, `LastName`, `Password`, `Address`, `City`, `State`, `Zip`, `Country`, `AddedOn`) VALUES
(8, 'ArcanaPunk', 'halea2@wit.edu', 'Alex', 'Hale', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '550 Huntington Ave', 'Boston', 'Massachusetts', '02115', 'United States', '2017-06-25 22:51:20'),
(9, 'Aderos', 'albeej@gmail.com', 'Ablee', 'Jaeni', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '42 Oak Street', 'Bridgewater', 'MA', '02324', 'United States', '2017-06-25 22:53:47'),
(10, 'Schrenk212', 'schrenkn@gmail.com', 'Nick', 'Schrenk', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '23 Main Street', 'Foxboro', 'Massachusetts', '02035', 'United States', '2017-06-25 22:55:15'),
(11, 'Solanth', 'murrayd@gmail.com', 'David', 'Murray', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '58 Mechanic Street', 'Foxboro', 'Massachusetts', '02035', 'United States', '2017-06-25 22:57:12'),
(12, 'Masonism', 'm.foscaldi@gmail.com', 'Mason', 'Foscaldi', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '525 Huntington Ave', 'Boston', 'Massachusetts', '02115', 'United States', '2017-06-26 12:41:12'),
(13, 'HallJ', 'Something@some.com', 'Jake', 'Hall', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', '', 'Full State Name', '', 'Full Country Name', '2017-07-10 13:59:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`GameID`) USING BTREE;

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`GroupID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `GameID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
