-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 22, 2020 at 04:57 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ZiyaraDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `Email` varchar(50) NOT NULL,
  `Pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Complaint`
--

CREATE TABLE `Complaint` (
  `ComplaintSub` varchar(30) NOT NULL,
  `ComplaintDetails` text NOT NULL,
  `I_Email` varchar(50) NOT NULL,
  `H_Email` varchar(50) NOT NULL,
  `A_Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `HK_Schedule`
--

CREATE TABLE `HK_Schedule` (
  `Day` varchar(20) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `H_Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `HK_TypeOfExp`
--

CREATE TABLE `HK_TypeOfExp` (
  `TypeOfExp` varchar(40) NOT NULL,
  `H_Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Housekeeper`
--

CREATE TABLE `Housekeeper` (
  `Email` varchar(50) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `Age` int(3) NOT NULL,
  `YearsOfExp` int(3) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Neighborhood` varchar(20) NOT NULL,
  `Street` varchar(20) NOT NULL,
  `HouseNo` varchar(10) NOT NULL,
  `HPrice` int(4) NOT NULL,
  `Approved` varchar(5) DEFAULT NULL,
  `I_Email` varchar(50) NOT NULL,
  `A_Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Individual`
--

CREATE TABLE `Individual` (
  `Email` varchar(50) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Age` int(3) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Neighborhood` varchar(20) NOT NULL,
  `Street` varchar(20) NOT NULL,
  `HouseNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Service`
--

CREATE TABLE `Service` (
  `SDate` date NOT NULL,
  `SDay` varchar(20) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `I_Email` varchar(50) NOT NULL,
  `H_Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `Complaint`
--
ALTER TABLE `Complaint`
  ADD PRIMARY KEY (`I_Email`,`H_Email`),
  ADD KEY `A_Email` (`A_Email`),
  ADD KEY `H_Email` (`H_Email`);

--
-- Indexes for table `HK_Schedule`
--
ALTER TABLE `HK_Schedule`
  ADD PRIMARY KEY (`Day`,`H_Email`),
  ADD KEY `HK_Email` (`H_Email`);

--
-- Indexes for table `HK_TypeOfExp`
--
ALTER TABLE `HK_TypeOfExp`
  ADD PRIMARY KEY (`TypeOfExp`,`H_Email`),
  ADD KEY `HEmail` (`H_Email`);

--
-- Indexes for table `Housekeeper`
--
ALTER TABLE `Housekeeper`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `IEmail` (`I_Email`),
  ADD KEY `AEmail` (`A_Email`);

--
-- Indexes for table `Individual`
--
ALTER TABLE `Individual`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`I_Email`,`H_Email`),
  ADD KEY `H_Email` (`H_Email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Complaint`
--
ALTER TABLE `Complaint`
  ADD CONSTRAINT `A_Email` FOREIGN KEY (`A_Email`) REFERENCES `Admin` (`Email`),
  ADD CONSTRAINT `Complaint_ibfk_1` FOREIGN KEY (`I_Email`) REFERENCES `Individual` (`Email`),
  ADD CONSTRAINT `H_Email` FOREIGN KEY (`H_Email`) REFERENCES `Housekeeper` (`Email`);

--
-- Constraints for table `HK_Schedule`
--
ALTER TABLE `HK_Schedule`
  ADD CONSTRAINT `HK_Email` FOREIGN KEY (`H_Email`) REFERENCES `Housekeeper` (`Email`);

--
-- Constraints for table `HK_TypeOfExp`
--
ALTER TABLE `HK_TypeOfExp`
  ADD CONSTRAINT `HEmail` FOREIGN KEY (`H_Email`) REFERENCES `Housekeeper` (`Email`);

--
-- Constraints for table `Housekeeper`
--
ALTER TABLE `Housekeeper`
  ADD CONSTRAINT `AEmail` FOREIGN KEY (`A_Email`) REFERENCES `Admin` (`Email`),
  ADD CONSTRAINT `IEmail` FOREIGN KEY (`I_Email`) REFERENCES `Individual` (`Email`);

--
-- Constraints for table `Service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `Service_ibfk_1` FOREIGN KEY (`H_Email`) REFERENCES `Housekeeper` (`Email`),
  ADD CONSTRAINT `Service_ibfk_2` FOREIGN KEY (`I_Email`) REFERENCES `Individual` (`Email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
