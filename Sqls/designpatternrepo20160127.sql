-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2016 at 03:37 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `designpatternrepo`
--

-- --------------------------------------------------------

--
-- Table structure for table `classnames`
--

CREATE TABLE IF NOT EXISTS `classnames` (
  `patternInstanceID` int(100) NOT NULL,
  `roleName` varchar(100) NOT NULL COMMENT 'Element Name',
  `className` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commentstopattern`
--

CREATE TABLE IF NOT EXISTS `commentstopattern` (
  `patternInstanceID` int(100) NOT NULL,
  `WordID` int(100) NOT NULL,
  `Word` varchar(10000) NOT NULL,
  `className` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domaintokeywords`
--

CREATE TABLE IF NOT EXISTS `domaintokeywords` (
  `topicID` int(100) NOT NULL,
  `keywordID` int(100) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `weightage` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domaintopics`
--

CREATE TABLE IF NOT EXISTS `domaintopics` (
  `topicID` int(100) NOT NULL,
  `projectID` int(200) NOT NULL,
  `filePath` varchar(100) NOT NULL,
  `topics` text NOT NULL,
  `topicWeightage` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file_directory`
--

CREATE TABLE IF NOT EXISTS `file_directory` (
  `ID` int(100) NOT NULL,
  `Directory` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lookupwords`
--

CREATE TABLE IF NOT EXISTS `lookupwords` (
  `WordId` int(11) NOT NULL,
  `Word` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `methodnames`
--

CREATE TABLE IF NOT EXISTS `methodnames` (
  `patternInstanceID` int(100) NOT NULL,
  `roleName` varchar(200) NOT NULL,
  `methodName` varchar(200) NOT NULL,
  `className` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patterninstance`
--

CREATE TABLE IF NOT EXISTS `patterninstance` (
  `patternID` int(11) NOT NULL,
  `patternInstanceID` int(100) NOT NULL,
  `instanceClass` text NOT NULL,
  `projectName` text NOT NULL,
  `projectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patterns`
--

CREATE TABLE IF NOT EXISTS `patterns` (
  `name` text NOT NULL,
  `patternID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patterns`
--

INSERT INTO `patterns` (`name`, `patternID`) VALUES
('Factory Method', 1),
('Prototype', 2),
('Singleton', 3),
('(Object)Adapter-Command', 4),
('Composite', 5),
('Decorator', 6),
('Observer', 7),
('State-Strategy', 8),
('Template Method', 9),
('Visitor', 10),
('Proxy', 11),
('Proxy2', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classnames`
--
ALTER TABLE `classnames`
  ADD KEY `className` (`className`),
  ADD KEY `elementName` (`roleName`),
  ADD KEY `className_2` (`className`),
  ADD KEY `className_3` (`className`),
  ADD KEY `ID_2` (`roleName`,`className`);

--
-- Indexes for table `domaintokeywords`
--
ALTER TABLE `domaintokeywords`
  ADD PRIMARY KEY (`keywordID`);

--
-- Indexes for table `domaintopics`
--
ALTER TABLE `domaintopics`
  ADD PRIMARY KEY (`topicID`);

--
-- Indexes for table `file_directory`
--
ALTER TABLE `file_directory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lookupwords`
--
ALTER TABLE `lookupwords`
  ADD PRIMARY KEY (`WordId`);

--
-- Indexes for table `methodnames`
--
ALTER TABLE `methodnames`
  ADD KEY `methodName` (`methodName`),
  ADD KEY `rollName_2` (`roleName`),
  ADD FULLTEXT KEY `rollName` (`roleName`,`methodName`);

--
-- Indexes for table `patterninstance`
--
ALTER TABLE `patterninstance`
  ADD PRIMARY KEY (`patternInstanceID`);

--
-- Indexes for table `patterns`
--
ALTER TABLE `patterns`
  ADD PRIMARY KEY (`patternID`),
  ADD UNIQUE KEY `patternID` (`patternID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `domaintokeywords`
--
ALTER TABLE `domaintokeywords`
  MODIFY `keywordID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `domaintopics`
--
ALTER TABLE `domaintopics`
  MODIFY `topicID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file_directory`
--
ALTER TABLE `file_directory`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lookupwords`
--
ALTER TABLE `lookupwords`
  MODIFY `WordId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patterninstance`
--
ALTER TABLE `patterninstance`
  MODIFY `patternInstanceID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patterns`
--
ALTER TABLE `patterns`
  MODIFY `patternID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
