-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 10, 2025 at 01:38 AM
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
-- Database: `sharksinc`
--

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `TDeptID` varchar(10) NOT NULL,
  `DeptName` varchar(30) DEFAULT NULL,
  `DeptHead` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`TDeptID`, `DeptName`, `DeptHead`) VALUES
('CAFAE', 'College of Fine Arts Education', 'E100'),
('CBAE', 'College of Administration', 'E101'),
('CBE', 'College of Business Education', 'E107'),
('CCE', 'College of Computing Education', 'E102'),
('CHE', 'College of Health Education', 'E104'),
('CTE', 'College of Teacher Ed.', 'E103');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `TEmpID` varchar(10) NOT NULL,
  `Tfn` varchar(30) DEFAULT NULL,
  `Tmn` varchar(30) DEFAULT NULL,
  `Tln` varchar(30) DEFAULT NULL,
  `TdeptID` varchar(10) DEFAULT NULL,
  `Trankcode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`TEmpID`, `Tfn`, `Tmn`, `Tln`, `TdeptID`, `Trankcode`) VALUES
('A1', 'Ariel', 'Mendez', 'Ortega', 'D1', 'S2'),
('A1023', 'Grace', 'Solis', 'Tan', 'D1', 'R1'),
('A1234', 'Kirk', ' P', ' Lopez', ' CCE', ' AP1'),
('A400', 'Allan', ' Daguplo', ' Bermudez', 'D1', ' R1'),
('A401', 'Allen', ' Lopez', ' Garcia', 'D1', ' R1'),
('B100', 'Ara', ' Lopez', ' De Guzman', ' CCE', ' AP3'),
('E0090', 'Leigh', 'Aranas', 'Gregnia', 'CCE', 'AP3'),
('E0091', 'Garry', 'Lopez', 'Estrada', 'CCE', 'AP3'),
('E100', 'GRACE', 'Awel', 'MALASA', 'CCE', 'AP1'),
('E1000', 'Lory', 'M', 'Quinto', 'CCE', 'AP1'),
('E10000', 'Grace', 'Andal', 'Marasigan', 'CCE', 'AP3'),
('E1001', 'Luz', 'Noval', 'Vera', ' CCE', 'AP1'),
('E1002', 'Lester', 'Marandan', ' Darunday', ' CCE', 'AP1'),
('E101', 'Jenny', 'Moran', 'ESPADERO', 'CCE', 'AP2'),
('E102', 'Jan Carlo', 'Tinio', 'Arroyo', 'CCE', 'AP3'),
('E104', 'Janice', 'Reyes', 'Aljas', 'CCE', 'AP3'),
('E105', 'Charisse', 'Pesalbon', 'Barbosa', 'CCE', 'AP4'),
('E106', 'Meljohn', 'Ramos', 'Aborde', 'CCE', 'AP4'),
('E107', 'Jovi', 'Gallentes', 'Darunday', 'Admin', 'S1'),
('E108', 'Ryann', 'Maranon', 'Pilapil', 'CCE', 'S2'),
('E109', 'Denie', 'Forton', 'Paniza', 'CCE', 'AP1'),
('E11', 'Reban Cliff', 'Gomez', 'Fajardo', 'CBAE', 'AP1'),
('E131', 'Girlie', 'Arsua', 'Amba', 'CCE', 'AP3'),
('E200', 'Marife', 'Llantos', 'Ganas', 'CBAE', 'AP3'),
('E201', 'Raffy', 'Gomez', 'Tulfo', 'CCE', 'AP3'),
('E202', 'Ferdinand ', 'Romualdez', 'Marcos', 'CCE', 'AP3'),
('E215', 'John Lloyd', 'Fuentes', 'Cruz', 'CTE', 'AP3'),
('E300', 'Anna', 'Rojas', 'Cru', 'D1', 'AP4'),
('E400', 'Janie', 'Fontilla', 'Genosas', 'CCE', 'AP1'),
('E401', 'Ryann', 'Garcia', 'Matuguina', 'D1', 'AP1'),
('E500', 'Greg', 'Hoper', 'Lopez', 'CCE', 'AP4'),
('E501', 'Sara', 'Zimmerman', 'Duterte', 'D1', 'AP1'),
('E55', 'Lea', 'Angus', 'Tandag', 'D1', 'AP1'),
('E701', ' Ana', ' Mendez', ' Castro', 'CBAE', 'AP1'),
('E9000', 'Julia', 'Moran', 'Gonzales', 'CCE', 'AP1'),
('E901', 'Marites', 'Lopez', 'Sabado', 'D1', 'AP1'),
('E902', 'Bea', 'Ruiz', 'Alonso', 'D1', 'AP1'),
('E992', 'Rhea', 'Awel', 'Paner', 'D1', 'AP1'),
('E999', 'Andrea', 'Lim', 'Garcia', 'D1', 'AP1');

-- --------------------------------------------------------

--
-- Table structure for table `Pay`
--

CREATE TABLE `Pay` (
  `PayID` varchar(10) NOT NULL,
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PayPeriod`
--

CREATE TABLE `PayPeriod` (
  `PayID` varchar(10) NOT NULL,
  `year` varchar(4) DEFAULT NULL,
  `month` varchar(15) DEFAULT NULL,
  `period` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PayPeriod`
--

INSERT INTO `PayPeriod` (`PayID`, `year`, `month`, `period`) VALUES
('2021Jan1st', '2021', 'January', '1st Half'),
('2021Jan2nd', '2021', 'January', '2nd Half');

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `ProductID` varchar(10) NOT NULL,
  `ProdBrand` varchar(50) DEFAULT NULL,
  `ProdDesc` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Rabking`
--

CREATE TABLE `Rabking` (
  `Rankcode` varchar(5) NOT NULL,
  `Rankname` varchar(50) NOT NULL,
  `RatePerHour` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Rabking`
--

INSERT INTO `Rabking` (`Rankcode`, `Rankname`, `RatePerHour`) VALUES
('AP1', 'Associate Professor 1', '265'),
('AP2', 'Associate Professor 2', '270'),
('AP3', 'Associate Professor 3', '350');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`TDeptID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`TEmpID`);

--
-- Indexes for table `Pay`
--
ALTER TABLE `Pay`
  ADD PRIMARY KEY (`PayID`);

--
-- Indexes for table `PayPeriod`
--
ALTER TABLE `PayPeriod`
  ADD PRIMARY KEY (`PayID`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
