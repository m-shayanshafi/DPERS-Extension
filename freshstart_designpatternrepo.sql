-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2016 at 08:30 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

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

CREATE TABLE `classnames` (
  `patternInstanceID` int(100) NOT NULL,
  `roleName` varchar(100) NOT NULL COMMENT 'Element Name',
  `className` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commentstopattern`
--

CREATE TABLE `commentstopattern` (
  `patternInstanceID` int(100) NOT NULL,
  `WordID` int(100) NOT NULL,
  `Word` varchar(10000) NOT NULL,
  `className` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domaintokeywords`
--

CREATE TABLE `domaintokeywords` (
  `topicID` int(100) NOT NULL,
  `keywordID` int(100) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `weightage` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domaintopics`
--

CREATE TABLE `domaintopics` (
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

CREATE TABLE `file_directory` (
  `ID` int(100) NOT NULL,
  `Directory` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lookupwords`
--

CREATE TABLE `lookupwords` (
  `WordId` int(11) NOT NULL,
  `Word` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lookupwords`
--

INSERT INTO `lookupwords` (`WordId`, `Word`) VALUES
(1, 'FileWriter'),
(2, 'fileWritter'),
(3, 'FileWriter(outfileName,true)'),
(4, 'BufferedWriter'),
(5, 'writer'),
(6, 'BufferedWriter(fileWritter);'),
(7, 'OnCommand'),
(8, 'instantiated'),
(9, 'based'),
(10, 'active'),
(11, 'device'),
(12, 'supplied'),
(13, 'Remote'),
(14, 'Accesing'),
(15, 'driver'),
(16, 'from'),
(17, 'file'),
(18, 'Creating'),
(19, 'variable'),
(20, 'connection'),
(21, 'localhost:3306derp","root","");'),
(22, 'jdbc:mysql:localhost:3306derp->is'),
(23, 'database'),
(24, 'root'),
(25, 'username'),
(26, 'password'),
(27, 'query'),
(28, 'executing'),
(29, 'comment'),
(30, 'first'),
(31, 'CONSTRUCTOR'),
(32, 'long'),
(33, 'another'),
(34, 'single'),
(35, 'line'),
(36, 'Also'),
(37, 'more'),
(38, 'javadoc'),
(39, 'cmnt'),
(40, 'trick'),
(41, 'help'),
(42, 'debugging'),
(43, 'turn'),
(44, 'Default'),
(45, 'Invokes'),
(46, 'parameter'),
(47, 'Point2D'),
(48, 'Note'),
(49, 'this()'),
(50, 'invocation'),
(51, 'must'),
(52, 'BEGINNING'),
(53, 'statement'),
(54, 'body'),
(55, 'consructor'),
(56, 'better'),
(57, 'method'),
(58, 'would'),
(59, 'replace'),
(60, 'above'),
(61, 'code'),
(62, '(pt.getX(),'),
(63, 'pt.getY());'),
(64, 'especially'),
(65, 'since'),
(66, 'does'),
(67, 'initialize'),
(68, 'debug.'),
(69, 'reusing'),
(70, 'already'),
(71, 'working.'),
(72, 'print'),
(73, 'string'),
(74, 'only'),
(75, '"debug"'),
(76, 'data'),
(77, 'member'),
(78, 'true'),
(79, 'check'),
(80, 'dprint()'),
(81, 'coordinates'),
(82, 'point--instance'),
(83, 'variables'),
(84, 'have'),
(85, 'complex'),
(86, 'electronic'),
(87, 'circuit'),
(88, 'maintain'),
(89, 'current'),
(90, 'leaf'),
(91, 'node'),
(92, 'applicable'),
(93, 'class.'),
(94, 'class,there'),
(95, 'many'),
(96, 'methods'),
(97, 'which'),
(98, 'developer'),
(99, 'because'),
(100, 'node.'),
(101, '"lowest'),
(102, 'common'),
(103, 'denominator"'),
(104, '"Core"'),
(105, 'class'),
(106, '"isa"'),
(107, 'Second'),
(108, 'level'),
(109, 'base'),
(110, 'relationship'),
(111, '"hasa"'),
(112, 'Delegation'),
(113, 'Optional'),
(114, 'embellishment'),
(115, 'Delegate'),
(116, 'extra'),
(117, 'stuff'),
(118, 'Client'),
(119, 'responsibility'),
(120, 'compose'),
(121, 'desired'),
(122, 'configurations'),
(123, 'concrete'),
(124, 'Command'),
(125, 'registers'),
(126, 'itself'),
(127, 'invoker'),
(128, 'calls'),
(129, 'back'),
(130, 'Command,'),
(131, 'executes'),
(132, 'receiver'),
(133, 'TODO'),
(134, 'Auto-generated'),
(135, 'catch'),
(136, 'block'),
(137, 'State'),
(138, 'change'),
(139, 'alert'),
(140, 'implementing'),
(141, 'Arabic'),
(142, 'editor'),
(143, 'using'),
(144, 'singlteton'),
(145, 'pattern'),
(146, 'shamsa'),
(147, 'testing'),
(148, 'pizzas'),
(149, 'tasty'),
(150, 'design'),
(151, 'patterns'),
(152, ':;libfx;:');

-- --------------------------------------------------------

--
-- Table structure for table `methodnames`
--

CREATE TABLE `methodnames` (
  `patternInstanceID` int(100) NOT NULL,
  `roleName` varchar(200) NOT NULL,
  `methodName` varchar(200) NOT NULL,
  `className` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patterninstance`
--

CREATE TABLE `patterninstance` (
  `patternID` int(11) NOT NULL,
  `patternInstanceID` int(100) NOT NULL,
  `instanceClass` text NOT NULL,
  `projectName` text NOT NULL,
  `projectID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patterns`
--

CREATE TABLE `patterns` (
  `name` text NOT NULL,
  `patternID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD KEY `rollName_2` (`roleName`);
ALTER TABLE `methodnames` ADD FULLTEXT KEY `rollName` (`roleName`,`methodName`);

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
  MODIFY `WordId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
--
-- AUTO_INCREMENT for table `patterninstance`
--
ALTER TABLE `patterninstance`
  MODIFY `patternInstanceID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patterns`
--
ALTER TABLE `patterns`
  MODIFY `patternID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
