-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 02, 2021 at 03:09 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project362s`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `accID` int(11) NOT NULL,
  `accUsername` varchar(20) NOT NULL,
  `accPassword` varchar(20) NOT NULL,
  PRIMARY KEY (`accID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carddetails`
--

DROP TABLE IF EXISTS `carddetails`;
CREATE TABLE IF NOT EXISTS `carddetails` (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cardNumber` int(16) NOT NULL,
  `expiryDate` date NOT NULL,
  `CVV` int(3) NOT NULL,
  `accID` int(11) NOT NULL,
  PRIMARY KEY (`CVV`),
  KEY `FOREIGN` (`accID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `cusID` int(11) NOT NULL,
  `cusName` varchar(20) NOT NULL,
  `cusSurname` varchar(20) NOT NULL,
  `cusAddress` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postalCode` int(4) NOT NULL,
  `cusCellphone` varchar(11) NOT NULL,
  `cusEmail` varchar(50) NOT NULL,
  `accID` int(11) NOT NULL,
  PRIMARY KEY (`cusID`),
  KEY `FOREIGN` (`accID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` int(11) NOT NULL,
  `cusID` int(11) NOT NULL,
  `prdID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FOREIGN` (`cusID`),
  KEY `FOREIGN KEY` (`prdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prdID` int(11) NOT NULL,
  `prdName` varchar(20) NOT NULL,
  `prdPrice` decimal(10,0) NOT NULL,
  PRIMARY KEY (`prdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carddetails`
--
ALTER TABLE `carddetails`
  ADD CONSTRAINT `FO` FOREIGN KEY (`accID`) REFERENCES `account` (`accID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `account` FOREIGN KEY (`accID`) REFERENCES `account` (`accID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FOREIGN` FOREIGN KEY (`cusID`) REFERENCES `customer` (`cusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FOREIGN KEY` FOREIGN KEY (`prdID`) REFERENCES `product` (`prdID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
