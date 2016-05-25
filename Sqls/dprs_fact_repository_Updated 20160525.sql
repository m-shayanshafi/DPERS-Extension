-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2016 at 12:19 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dprs_fact_repository`
--

-- --------------------------------------------------------

--
-- Table structure for table `design_pattern`
--

CREATE TABLE IF NOT EXISTS `design_pattern` (
  `Name` text NOT NULL,
  `PatternID` int(11) NOT NULL,
  `PatternCategory` varchar(100) NOT NULL,
  `Definition` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `design_pattern`
--

INSERT INTO `design_pattern` (`Name`, `PatternID`, `PatternCategory`, `Definition`) VALUES
('Factory Method', 1, 'Creational', 'In class-based programming, the factory method pattern is a creational pattern that uses factory methods to deal with the problem of creating objects without having to specify the exact class of the object that will be created. This is done by creating objects by calling a factory method—either specified in an interface and implemented by child classes, or implemented in a base class and optionally overridden by derived classes—rather than by calling a constructor.'),
('Prototype', 2, 'Creational', 'The prototype pattern is a creational design pattern in software development. It is used when the type of objects to create is determined by a prototypical instance, which is cloned to produce new objects. This pattern is used to avoid subclasses of an object creator in the client application, like the abstract factory pattern does or avoid the inherent cost of creating a new object in the standard way (e.g., using the ''new'' keyword) when it is prohibitively expensive for a given application.'),
('Singleton', 3, 'Creational', 'The singleton pattern is a design pattern that restricts the instantiation of a class to one object. This is useful when exactly one object is needed to coordinate actions across the system. The concept is sometimes generalized to systems that operate more efficiently when only one object exists, or that restrict the instantiation to a certain number of objects. The term comes from the mathematical concept of a singleton.'),
('(Object)Adapter-Command', 4, 'Structural', 'The adapter pattern is a software design pattern that allows the interface of an existing class to be used from another interface.It is often used to make existing classes work with others without modifying their source code.'),
('Composite', 5, 'Structural', 'The composite pattern is a partitioning design pattern. The composite pattern describes that a group of objects is to be treated in the same way as a single instance of an object. The intent of a composite is to "compose" objects into tree structures to represent part-whole hierarchies. Implementing the composite pattern lets clients treat individual objects and compositions uniformly.'),
('Decorator', 6, 'Structural', 'The decorator pattern (also known as Wrapper, an alternative naming shared with the Adapter pattern) is a design pattern that allows behavior to be added to an individual object, either statically or dynamically, without affecting the behavior of other objects from the same class. The decorator pattern is often useful for adhering to the Single Responsibility Principle, as it allows functionality to be divided between classes with unique areas of concern.'),
('Observer', 7, 'Behavioral', 'The observer pattern is a software design pattern in which an object, called the subject, maintains a list of its dependents, called observers, and notifies them automatically of any state changes, usually by calling one of their methods. It is mainly used to implement distributed event handling systems. The Observer pattern is also a key part in the familiar model–view–controller (MVC) architectural pattern.'),
('State-Strategy', 8, 'Behavioral', 'The state pattern, which closely resembles Strategy Pattern, is a behavioral software design pattern, also known as the objects for states pattern. This pattern is used in computer programming to encapsulate varying behavior for the same object based on its internal state. This can be a cleaner way for an object to change its behavior at runtime without resorting to large monolithic conditional statements and thus improve maintainability. Strategy lets the algorithm vary independently from clients that use it. Strategy is one of the patterns included in the influential book Design Patterns by Gamma et al. that popularized the concept of using patterns to describe software design.'),
('Template Method', 9, 'Behavioral', 'In software engineering, the template method pattern is a behavioral design pattern that defines the program skeleton of an algorithm in a method, called template method, which defers some steps to subclasses. It lets one redefine certain steps of an algorithm without changing the algorithm''s structure.'),
('Visitor', 10, 'Behavioral', 'In object-oriented programming and software engineering, the visitor design pattern is a way of separating an algorithm from an object structure on which it operates. A practical result of this separation is the ability to add new operations to existing object structures without modifying those structures. It is one way to follow the open/closed principle.'),
('Proxy', 11, 'Structural', 'A proxy, in its most general form, is a class functioning as an interface to something else. The proxy could interface to anything: a network connection, a large object in memory, a file, or some other resource that is expensive or impossible to duplicate. In short, a proxy is a wrapper or agent object that is being called by the client to access the real serving object behind the scenes. In the proxy extra functionality can be provided, for example caching when operations on the real object are resource intensive, or checking preconditions before operations on the real object are invoked. For the client, usage of a proxy object is similar to using the real object, because both implement the same interface.'),
('Proxy2', 12, 'Structural', 'A proxy, in its most general form, is a class functioning as an interface to something else. The proxy could interface to anything: a network connection, a large object in memory, a file, or some other resource that is expensive or impossible to duplicate. In short, a proxy is a wrapper or agent object that is being called by the client to access the real serving object behind the scenes. In the proxy extra functionality can be provided, for example caching when operations on the real object are resource intensive, or checking preconditions before operations on the real object are invoked. For the client, usage of a proxy object is similar to using the real object, because both implement the same interface. Proxy2 is actually a variation of Proxy pattern.  However, this Proxy variation is structurally more similar to Decorator pattern than Proxy pattern, since Proxy role has an association to Subject role (named subject) and method Request() declared in Proxy invokes an abstract method having the same signature through subject association (as exactly happens between Decorator and Component roles in Decorator pattern). The differences between Decorator pattern and this Proxy variation are: a) Decorator role is abstract while Proxy role is concrete, b) Proxy role initializes its association to Subject role	with a reference to an object of RealSubject role which is instantiated inside the constructor of Proxy role. ');

-- --------------------------------------------------------

--
-- Table structure for table `pattern_instance`
--

CREATE TABLE IF NOT EXISTS `pattern_instance` (
  `PatternInstanceID` int(100) NOT NULL,
  `PatternID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `ProjectPath` text NOT NULL,
  `MetaData` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pattern_instance_class`
--

CREATE TABLE IF NOT EXISTS `pattern_instance_class` (
  `PatternInstanceClassID` int(11) NOT NULL,
  `PatternInstanceID` int(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL COMMENT 'Element Name'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pattern_instance_method`
--

CREATE TABLE IF NOT EXISTS `pattern_instance_method` (
  `PatternInstanceMethodID` int(100) NOT NULL,
  `PatternInstanceID` int(100) NOT NULL,
  `PatternInstanceClassID` int(100) DEFAULT NULL,
  `Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `ProjectID` int(100) NOT NULL,
  `Path` text NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Description` text,
  `Name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

CREATE TABLE IF NOT EXISTS `project_category` (
  `CategoryID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_category`
--

INSERT INTO `project_category` (`CategoryID`, `Name`) VALUES
(1, 'Action Sports'),
(2, 'Action Dungeon'),
(3, 'Action Shooter'),
(4, 'Action Strategy'),
(5, 'Simulation'),
(6, 'Action Tower Defence'),
(7, 'Action War'),
(8, 'Action Racing'),
(9, 'Action Fight'),
(10, 'Action RPG'),
(11, 'Action Arcade'),
(12, 'Action Adventure'),
(13, 'Card'),
(14, 'Puzzle'),
(15, 'Hidden Object'),
(16, 'Trivia'),
(17, 'Education'),
(18, 'Art'),
(19, 'Not a Game'),
(20, 'Board'),
(21, 'Action');

-- --------------------------------------------------------

--
-- Table structure for table `project_domain_keywords`
--

CREATE TABLE IF NOT EXISTS `project_domain_keywords` (
  `KeywordID` int(100) NOT NULL,
  `ProjectID` int(200) NOT NULL,
  `Path` varchar(100) NOT NULL,
  `StemmedName` text NOT NULL,
  `RootWord` text NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Proportion` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `project_domain_topics`
--

CREATE TABLE IF NOT EXISTS `project_domain_topics` (
  `TopicID` int(100) NOT NULL,
  `ProjectID` int(100) NOT NULL,
  `Contribution` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `topic_keywords`
--

CREATE TABLE IF NOT EXISTS `topic_keywords` (
  `TopicID` int(100) NOT NULL,
  `KeywordID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `design_pattern`
--
ALTER TABLE `design_pattern`
  ADD PRIMARY KEY (`PatternID`),
  ADD UNIQUE KEY `patternID` (`PatternID`);

--
-- Indexes for table `pattern_instance`
--
ALTER TABLE `pattern_instance`
  ADD PRIMARY KEY (`PatternInstanceID`);

--
-- Indexes for table `pattern_instance_class`
--
ALTER TABLE `pattern_instance_class`
  ADD PRIMARY KEY (`PatternInstanceClassID`),
  ADD KEY `className` (`Name`),
  ADD KEY `elementName` (`Role`),
  ADD KEY `className_2` (`Name`),
  ADD KEY `className_3` (`Name`),
  ADD KEY `ID_2` (`Role`,`Name`);

--
-- Indexes for table `pattern_instance_method`
--
ALTER TABLE `pattern_instance_method`
  ADD PRIMARY KEY (`PatternInstanceMethodID`),
  ADD KEY `methodName` (`Name`),
  ADD FULLTEXT KEY `rollName` (`Name`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ProjectID`);

--
-- Indexes for table `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `ID` (`CategoryID`);

--
-- Indexes for table `project_domain_keywords`
--
ALTER TABLE `project_domain_keywords`
  ADD PRIMARY KEY (`KeywordID`);

--
-- Indexes for table `project_domain_topics`
--
ALTER TABLE `project_domain_topics`
  ADD PRIMARY KEY (`TopicID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `design_pattern`
--
ALTER TABLE `design_pattern`
  MODIFY `PatternID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `pattern_instance`
--
ALTER TABLE `pattern_instance`
  MODIFY `PatternInstanceID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pattern_instance_class`
--
ALTER TABLE `pattern_instance_class`
  MODIFY `PatternInstanceClassID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pattern_instance_method`
--
ALTER TABLE `pattern_instance_method`
  MODIFY `PatternInstanceMethodID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `ProjectID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_category`
--
ALTER TABLE `project_category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `project_domain_keywords`
--
ALTER TABLE `project_domain_keywords`
  MODIFY `KeywordID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_domain_topics`
--
ALTER TABLE `project_domain_topics`
  MODIFY `TopicID` int(100) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
