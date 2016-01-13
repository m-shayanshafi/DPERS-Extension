-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2016 at 12:53 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

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

--
-- Dumping data for table `classnames`
--

INSERT INTO `classnames` (`patternInstanceID`, `roleName`, `className`) VALUES
(188, 'Adaptee/Receiver', 'com.javapapers.designpattern.observer.Subject'),
(188, 'Adapter/ConcreteCommand', 'com.javapapers.designpattern.observer.User'),
(189, 'Observer', 'com.javapapers.designpattern.observer.Observer'),
(189, 'Subject', 'com.javapapers.designpattern.observer.Blog'),
(190, 'Context', 'com.javapapers.designpattern.observer.User'),
(190, 'State/Strategy', 'com.javapapers.designpattern.observer.Subject'),
(191, 'Adaptee/Receiver', 'com.javapapers.designpattern.observer.Subject'),
(191, 'Adapter/ConcreteCommand', 'com.javapapers.designpattern.observer.User'),
(192, 'Observer', 'com.javapapers.designpattern.observer.Observer'),
(192, 'Subject', 'com.javapapers.designpattern.observer.Blog'),
(193, 'Context', 'com.javapapers.designpattern.observer.User'),
(193, 'State/Strategy', 'com.javapapers.designpattern.observer.Subject'),
(194, 'Adaptee/Receiver', 'com.javapapers.designpattern.observer.Subject'),
(194, 'Adapter/ConcreteCommand', 'com.javapapers.designpattern.observer.User'),
(195, 'Observer', 'com.javapapers.designpattern.observer.Observer'),
(195, 'Subject', 'com.javapapers.designpattern.observer.Blog'),
(196, 'Context', 'com.javapapers.designpattern.observer.User'),
(196, 'State/Strategy', 'com.javapapers.designpattern.observer.Subject'),
(197, 'Adaptee/Receiver', 'missionCuriosity.DataObserver.sensorData'),
(197, 'Adapter/ConcreteCommand', 'missionCuriosity.DataObserver.REMS'),
(197, 'Adapter/ConcreteCommand', 'missionCuriosity.DirectionCommands.BackwardRobotCommand'),
(197, 'Adaptee/Receiver', 'missionCuriosity.DirectionCommands.RobotOperations'),
(197, 'Adapter/ConcreteCommand', 'missionCuriosity.DirectionCommands.ForwardRobotCommand'),
(197, 'Adaptee/Receiver', 'missionCuriosity.DirectionCommands.RobotOperations'),
(197, 'Adapter/ConcreteCommand', 'missionCuriosity.DirectionCommands.LeftRotationRobotCommand'),
(197, 'Adaptee/Receiver', 'missionCuriosity.DirectionCommands.RobotOperations'),
(197, 'Adapter/ConcreteCommand', 'missionCuriosity.DirectionCommands.RightRotationRobotCommand'),
(197, 'Adaptee/Receiver', 'missionCuriosity.DirectionCommands.RobotOperations'),
(197, 'Adapter/ConcreteCommand', 'missionCuriosity.DirectionCommands.TakePictureRobotCommand'),
(197, 'Adaptee/Receiver', 'missionCuriosity.DirectionCommands.RobotOperations'),
(197, 'Adapter/ConcreteCommand', 'missionCuriosity.DirectionCommands.TakeSpecimenRobotCommand'),
(197, 'Adaptee/Receiver', 'missionCuriosity.DirectionCommands.RobotOperations'),
(197, 'Adaptee/Receiver', 'missionCuriosity.ObstecleObserver.Camera'),
(197, 'Adapter/ConcreteCommand', 'missionCuriosity.ObstecleObserver.Rover'),
(197, 'Adaptee/Receiver', 'missionCuriosity.DataObserver.REMS'),
(197, 'Adapter/ConcreteCommand', 'missionCuriosity.DataObserver.Earth'),
(198, 'Component', 'missionCuriosity.FunctionalDecorator.MarsRover'),
(198, 'Decorator', 'missionCuriosity.FunctionalDecorator.MarsRoverExploration'),
(198, 'component', 'protected missionCuriosity.FunctionalDecorator.MarsRover rover'),
(199, 'Observer', 'missionCuriosity.ObstecleObserver.Observer'),
(199, 'Subject', 'missionCuriosity.ObstecleObserver.Camera'),
(200, 'Context', 'missionCuriosity.DirectionCommands.RobotRemoteControl'),
(200, 'State/Strategy', 'missionCuriosity.DirectionCommands.IRobotCommands'),
(200, 'Context', 'missionCuriosity.DirectionCommands.BackwardRobotCommand'),
(200, 'State/Strategy', 'missionCuriosity.DirectionCommands.RobotOperations'),
(200, 'Context', 'missionCuriosity.DirectionCommands.ForwardRobotCommand'),
(200, 'State/Strategy', 'missionCuriosity.DirectionCommands.RobotOperations'),
(200, 'Context', 'missionCuriosity.DirectionCommands.LeftRotationRobotCommand'),
(200, 'State/Strategy', 'missionCuriosity.DirectionCommands.RobotOperations'),
(200, 'Context', 'missionCuriosity.DirectionCommands.RightRotationRobotCommand'),
(200, 'State/Strategy', 'missionCuriosity.DirectionCommands.RobotOperations'),
(200, 'Context', 'missionCuriosity.DirectionCommands.TakePictureRobotCommand'),
(200, 'State/Strategy', 'missionCuriosity.DirectionCommands.RobotOperations'),
(200, 'Context', 'missionCuriosity.DirectionCommands.TakeSpecimenRobotCommand'),
(200, 'State/Strategy', 'missionCuriosity.DirectionCommands.RobotOperations'),
(200, 'Context', 'missionCuriosity.SpaceTravelingStrategy.RoverSoftware'),
(200, 'State/Strategy', 'missionCuriosity.SpaceTravelingStrategy.RobotTravelingBehavior'),
(201, 'AbstractClass', 'missionCuriosity.ChainOfResponsibility.AbstractAnalyzer'),
(202, 'Context', 'com.javapapers.designpatterns.state.AlertStateContext'),
(202, 'State/Strategy', 'com.javapapers.designpatterns.state.MobileAlertState'),
(203, 'Context', 'com.javapapers.designpatterns.state.AlertStateContext'),
(203, 'State/Strategy', 'com.javapapers.designpatterns.state.MobileAlertState'),
(204, 'Context', 'com.javapapers.designpatterns.state.AlertStateContext'),
(204, 'State/Strategy', 'com.javapapers.designpatterns.state.MobileAlertState'),
(205, 'Context', 'com.javapapers.designpatterns.state.AlertStateContext'),
(205, 'State/Strategy', 'com.javapapers.designpatterns.state.MobileAlertState'),
(206, 'Context', 'com.javapapers.designpatterns.state.AlertStateContext'),
(206, 'State/Strategy', 'com.javapapers.designpatterns.state.MobileAlertState'),
(207, 'Context', 'com.javapapers.designpatterns.state.AlertStateContext'),
(207, 'State/Strategy', 'com.javapapers.designpatterns.state.MobileAlertState'),
(208, 'Context', 'com.javapapers.designpatterns.state.AlertStateContext'),
(208, 'State/Strategy', 'com.javapapers.designpatterns.state.MobileAlertState'),
(209, 'Adaptee/Receiver', 'com.javapapers.designpattern.observer.Subject'),
(209, 'Adapter/ConcreteCommand', 'com.javapapers.designpattern.observer.User'),
(210, 'Observer', 'com.javapapers.designpattern.observer.Observer'),
(210, 'Subject', 'com.javapapers.designpattern.observer.Blog'),
(211, 'Context', 'com.javapapers.designpattern.observer.User'),
(211, 'State/Strategy', 'com.javapapers.designpattern.observer.Subject'),
(212, 'Component', 'org.arpit.javapostsforlearning.designpatterns.Employee'),
(212, 'Composite', 'org.arpit.javapostsforlearning.designpatterns.Manager'),
(213, 'Singleton', 'AbstractFactoryWithSingleton.LanguageEdit'),
(213, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageEdit languageEdit'),
(213, 'Singleton', 'AbstractFactoryWithSingleton.LanguageFont'),
(213, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageFont languagefont'),
(213, 'Singleton', 'AbstractFactoryWithSingleton.LanguageSpellchecker'),
(213, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageSpellchecker languageSpellchecker'),
(213, 'Singleton', 'AbstractFactoryWithSingleton.LanguageThesaurus'),
(213, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageThesaurus languageThesaurus'),
(214, 'Context', 'AbstractFactoryWithSingleton.LanguageEdit'),
(214, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(214, 'Context', 'AbstractFactoryWithSingleton.LanguageFont'),
(214, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(214, 'Context', 'AbstractFactoryWithSingleton.LanguageSpellchecker'),
(214, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(214, 'Context', 'AbstractFactoryWithSingleton.LanguageThesaurus'),
(214, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(215, 'Singleton', 'AbstractFactoryWithSingleton.LanguageEdit'),
(215, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageEdit languageEdit'),
(215, 'Singleton', 'AbstractFactoryWithSingleton.LanguageFont'),
(215, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageFont languagefont'),
(215, 'Singleton', 'AbstractFactoryWithSingleton.LanguageSpellchecker'),
(215, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageSpellchecker languageSpellchecker'),
(215, 'Singleton', 'AbstractFactoryWithSingleton.LanguageThesaurus'),
(215, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageThesaurus languageThesaurus'),
(216, 'Context', 'AbstractFactoryWithSingleton.LanguageEdit'),
(216, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(216, 'Context', 'AbstractFactoryWithSingleton.LanguageFont'),
(216, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(216, 'Context', 'AbstractFactoryWithSingleton.LanguageSpellchecker'),
(216, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(216, 'Context', 'AbstractFactoryWithSingleton.LanguageThesaurus'),
(216, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(217, 'Singleton', 'AbstractFactoryWithSingleton.LanguageEdit'),
(217, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageEdit languageEdit'),
(217, 'Singleton', 'AbstractFactoryWithSingleton.LanguageFont'),
(217, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageFont languagefont'),
(217, 'Singleton', 'AbstractFactoryWithSingleton.LanguageSpellchecker'),
(217, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageSpellchecker languageSpellchecker'),
(217, 'Singleton', 'AbstractFactoryWithSingleton.LanguageThesaurus'),
(217, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageThesaurus languageThesaurus'),
(218, 'Context', 'AbstractFactoryWithSingleton.LanguageEdit'),
(218, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(218, 'Context', 'AbstractFactoryWithSingleton.LanguageFont'),
(218, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(218, 'Context', 'AbstractFactoryWithSingleton.LanguageSpellchecker'),
(218, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(218, 'Context', 'AbstractFactoryWithSingleton.LanguageThesaurus'),
(218, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(219, 'Singleton', 'AbstractFactoryWithSingleton.LanguageEdit'),
(219, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageEdit languageEdit'),
(219, 'Singleton', 'AbstractFactoryWithSingleton.LanguageFont'),
(219, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageFont languagefont'),
(219, 'Singleton', 'AbstractFactoryWithSingleton.LanguageSpellchecker'),
(219, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageSpellchecker languageSpellchecker'),
(219, 'Singleton', 'AbstractFactoryWithSingleton.LanguageThesaurus'),
(219, 'uniqueInstance', 'public static AbstractFactoryWithSingleton.LanguageThesaurus languageThesaurus'),
(220, 'Context', 'AbstractFactoryWithSingleton.LanguageEdit'),
(220, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(220, 'Context', 'AbstractFactoryWithSingleton.LanguageFont'),
(220, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(220, 'Context', 'AbstractFactoryWithSingleton.LanguageSpellchecker'),
(220, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(220, 'Context', 'AbstractFactoryWithSingleton.LanguageThesaurus'),
(220, 'State/Strategy', 'AbstractFactoryWithSingleton.EditConfigurations'),
(221, 'Singleton', 'com.javacodegeeks.patterns.singletonpattern.Singleton'),
(221, 'uniqueInstance', 'private static com.javacodegeeks.patterns.singletonpattern.Singleton sc'),
(221, 'Singleton', 'com.javacodegeeks.patterns.singletonpattern.SingletonEager'),
(221, 'uniqueInstance', 'private static com.javacodegeeks.patterns.singletonpattern.SingletonEager sc'),
(221, 'Singleton', 'com.javacodegeeks.patterns.singletonpattern.SingletoneEnum$SingleEnum'),
(221, 'uniqueInstance', 'public static com.javacodegeeks.patterns.singletonpattern.SingletoneEnum$SingleEnum SINGLETON_ENUM'),
(221, 'Singleton', 'com.javacodegeeks.patterns.singletonpattern.SingletonLazy'),
(221, 'uniqueInstance', 'private static com.javacodegeeks.patterns.singletonpattern.SingletonLazy sc'),
(221, 'Singleton', 'com.javacodegeeks.patterns.singletonpattern.SingletonLazyDoubleCheck'),
(221, 'uniqueInstance', 'private static com.javacodegeeks.patterns.singletonpattern.SingletonLazyDoubleCheck sc'),
(221, 'Singleton', 'com.javacodegeeks.patterns.singletonpattern.SingletonLazyMultithreaded'),
(221, 'uniqueInstance', 'private static com.javacodegeeks.patterns.singletonpattern.SingletonLazyMultithreaded sc'),
(222, 'Client', 'jlex.SparseBitSet'),
(222, 'Prototype', 'jlex.SparseBitSet$BinOp'),
(223, 'Context', 'jlex.SparseBitSet'),
(223, 'State/Strategy', 'jlex.SparseBitSet$BinOp');

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

--
-- Dumping data for table `domaintokeywords`
--

INSERT INTO `domaintokeywords` (`topicID`, `keywordID`, `keyword`, `weightage`) VALUES
(89, 1, 'hjgkjgh', 78),
(0, 2, 'code', 10),
(0, 3, 'skichange', 4),
(0, 4, 'gettemperatureinf', 3),
(1, 5, 'credit', 5),
(1, 6, 'hikechange', 4),
(1, 7, 'getresult', 3),
(1, 8, 'temperatureinf', 2),
(2, 9, 'temperatureinf', 10),
(2, 10, 'context', 8),
(2, 11, 'site', 5),
(2, 12, 'distributed', 5),
(2, 13, 'good', 2),
(3, 14, 'boolean', 4),
(3, 15, 'skiing', 1),
(3, 16, 'mainstring', 1),
(4, 17, 'change', 16),
(4, 18, 'project', 5),
(4, 19, 'args', 1),
(5, 20, 'electronic', 5),
(5, 21, 'println"is', 2),
(5, 22, 'setchange', 2),
(5, 23, 'contexttemperatureinf', 1),
(5, 24, 'demo', 1),
(6, 25, 'form', 5),
(7, 26, 'remove', 5),
(7, 27, 'temperature', 2),
(7, 28, 'system', 2),
(7, 29, 'hiking', 1),
(8, 30, 'web', 5),
(8, 31, 'paper', 5),
(8, 32, 'publish', 5),
(9, 33, 'freely', 5),
(9, 34, 'checktemperatureint', 3),
(9, 35, 'checktemperaturetemperatureinf', 1),
(9, 36, 'contextint', 1),
(0, 37, 'web', 5),
(0, 38, 'args', 1),
(0, 39, 'demo', 1),
(101, 40, 'electronic', 4),
(101, 41, 'good', 2),
(101, 42, 'hiking', 1),
(101, 43, 'args', 1),
(101, 44, 'demo', 1),
(102, 45, 'gettemperatureinf', 2),
(103, 46, 'credit', 5),
(103, 47, 'temperature', 2),
(103, 48, 'system', 2),
(103, 49, 'hikestrategy', 1),
(103, 50, 'checktemperaturetemperatureinf', 1),
(104, 51, 'site', 5),
(104, 52, 'project', 5),
(104, 53, 'checktemperatureint', 3),
(104, 54, 'contextint', 1),
(105, 55, 'strategy', 14),
(105, 56, 'getresult', 3),
(105, 57, 'println"is', 2),
(106, 58, 'temperatureinf', 12),
(106, 59, 'freely', 5),
(107, 60, 'paper', 4),
(107, 61, 'hikestrategy', 1),
(107, 62, 'mainstring', 1),
(108, 63, 'context', 8),
(108, 64, 'publish', 5),
(108, 65, 'distributed', 5),
(108, 66, 'hikestrategy', 1),
(108, 67, 'strategy', 1),
(109, 68, 'code', 10),
(109, 69, 'web', 5),
(109, 70, 'form', 5),
(109, 71, 'remove', 5),
(109, 72, 'boolean', 4),
(110, 73, 'skistrategy', 4),
(110, 74, 'skiing', 1),
(110, 75, 'contexttemperatureinf', 1),
(110, 76, 'electronic', 1),
(112, 77, 'getresult', 3),
(112, 78, 'skiing', 1),
(113, 79, 'demo', 1),
(114, 80, 'web', 5),
(114, 81, 'skichange', 4),
(114, 82, 'setchange', 2),
(114, 83, 'checktemperaturetemperatureinf', 1);

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

--
-- Dumping data for table `domaintopics`
--

INSERT INTO `domaintopics` (`topicID`, `projectID`, `filePath`, `topics`, `topicWeightage`) VALUES
(1, 0, 'D:\\Strategy', 'electronic', 5),
(2, 0, 'D:\\Strategy', 'project', 5),
(3, 0, 'D:\\Strategy', 'gettemperatureinf', 3),
(4, 0, 'D:\\Strategy', 'context', 8),
(5, 0, 'D:\\Strategy', 'form', 5),
(6, 0, 'D:\\Strategy', 'site', 5),
(7, 0, 'D:\\Strategy', 'paper', 2),
(8, 0, 'D:\\Strategy', 'code', 10),
(9, 0, 'D:\\Strategy', 'temperatureinf', 12),
(10, 0, 'D:\\Strategy', 'change', 16),
(11, 0, 'D:\\Strategy', 'electronic', 5),
(12, 0, 'D:\\Strategy', 'project', 5),
(13, 0, 'D:\\Strategy', 'gettemperatureinf', 3),
(14, 0, 'D:\\Strategy', 'context', 8),
(15, 0, 'D:\\Strategy', 'form', 5),
(16, 0, 'D:\\Strategy', 'site', 5),
(17, 0, 'D:\\Strategy', 'paper', 2),
(18, 0, 'D:\\Strategy', 'code', 10),
(19, 0, 'D:\\Strategy', 'temperatureinf', 12),
(20, 0, 'D:\\Strategy', 'change', 16),
(21, 0, 'D:\\Strategy', 'temperatureinf', 12),
(22, 0, 'D:\\Strategy', 'form', 5),
(23, 0, 'D:\\Strategy', 'change', 16),
(24, 0, 'D:\\Strategy', 'println"is', 2),
(25, 0, 'D:\\Strategy', 'getresult', 3),
(26, 0, 'D:\\Strategy', 'publish', 5),
(27, 0, 'D:\\Strategy', 'paper', 3),
(28, 0, 'D:\\Strategy', 'good', 2),
(29, 0, 'D:\\Strategy', 'code', 8),
(30, 0, 'D:\\Strategy', 'checktemperatureint', 2),
(31, 0, 'D:\\Strategy', 'electronic', 5),
(32, 0, 'D:\\Strategy', 'paper', 5),
(33, 0, 'D:\\Strategy', 'web', 5),
(34, 0, 'D:\\Strategy', 'hikechange', 4),
(35, 0, 'D:\\Strategy', 'code', 10),
(36, 0, 'D:\\Strategy', 'change', 16),
(37, 0, 'D:\\Strategy', 'context', 8),
(38, 0, 'D:\\Strategy', 'temperatureinf', 10),
(39, 0, 'D:\\Strategy', 'site', 5),
(40, 0, 'D:\\Strategy', 'checktemperatureint', 2),
(41, 0, 'D:\\Strategy', 'electronic', 5),
(42, 0, 'D:\\Strategy', 'paper', 5),
(43, 0, 'D:\\Strategy', 'web', 5),
(44, 0, 'D:\\Strategy', 'hikechange', 4),
(45, 0, 'D:\\Strategy', 'code', 10),
(46, 0, 'D:\\Strategy', 'change', 16),
(47, 0, 'D:\\Strategy', 'context', 8),
(48, 0, 'D:\\Strategy', 'temperatureinf', 10),
(49, 0, 'D:\\Strategy', 'site', 5),
(50, 0, 'D:\\Strategy', 'change', 15),
(51, 0, 'D:\\Strategy', 'paper', 5),
(52, 0, 'D:\\Strategy', 'site', 5),
(53, 0, 'D:\\Strategy', 'context', 8),
(54, 0, 'D:\\Strategy', 'code', 10),
(55, 0, 'D:\\Strategy', 'credit', 5),
(56, 0, 'D:\\Strategy', 'publish', 5),
(57, 0, 'D:\\Strategy', 'project', 5),
(58, 0, 'D:\\Strategy', 'change', 1),
(59, 0, 'D:\\Strategy', 'temperatureinf', 12),
(60, 0, 'D:\\Strategy', 'project', 5),
(61, 0, 'D:\\Strategy', 'code', 10),
(62, 0, 'D:\\Strategy', 'temperatureinf', 12),
(63, 0, 'D:\\Strategy', 'form', 5),
(64, 0, 'D:\\Strategy', 'electronic', 5),
(65, 0, 'D:\\Strategy', 'web', 5),
(66, 0, 'D:\\Strategy', 'site', 5),
(67, 0, 'D:\\Strategy', 'context', 7),
(68, 0, 'D:\\Strategy', 'change', 16),
(69, 0, 'D:\\Strategy', 'context', 8),
(70, 0, 'D:\\Strategy', 'form', 4),
(71, 0, 'D:\\Strategy', 'project', 5),
(72, 0, 'D:\\Strategy', 'change', 16),
(73, 0, 'D:\\Strategy', 'boolean', 4),
(74, 0, 'D:\\Strategy', 'checktemperatureint', 3),
(75, 0, 'D:\\Strategy', 'paper', 5),
(76, 0, 'D:\\Strategy', 'temperatureinf', 12),
(77, 0, 'D:\\Strategy', 'code', 10),
(78, 0, 'D:\\Strategy', 'freely', 5),
(79, 95, 'D:\\Strategy', 'temperatureinf', 12),
(80, 95, 'D:\\Strategy', 'form', 5),
(81, 95, 'D:\\Strategy', 'site', 5),
(82, 95, 'D:\\Strategy', 'change', 16),
(83, 95, 'D:\\Strategy', 'publish', 5),
(84, 95, 'D:\\Strategy', 'context', 8),
(85, 95, 'D:\\Strategy', 'freely', 5),
(86, 95, 'D:\\Strategy', 'credit', 3),
(87, 95, 'D:\\Strategy', 'code', 10),
(88, 95, 'D:\\Strategy', 'setchange', 2),
(89, 95, 'D:\\Strategy', 'code', 10),
(90, 95, 'D:\\Strategy', 'credit', 5),
(91, 95, 'D:\\Strategy', 'temperatureinf', 10),
(92, 95, 'D:\\Strategy', 'boolean', 4),
(93, 95, 'D:\\Strategy', 'change', 16),
(94, 95, 'D:\\Strategy', 'electronic', 5),
(95, 95, 'D:\\Strategy', 'form', 5),
(96, 95, 'D:\\Strategy', 'remove', 5),
(97, 95, 'D:\\Strategy', 'web', 5),
(98, 95, 'D:\\Strategy', 'freely', 5),
(99, 94, 'D:\\Strategy_old', 'web', 5),
(100, 94, 'D:\\Strategy_old', 'temperatureinf', 12),
(101, 94, 'D:\\Strategy_old', 'electronic', 4),
(102, 94, 'D:\\Strategy_old', 'gettemperatureinf', 2),
(103, 94, 'D:\\Strategy_old', 'credit', 5),
(104, 94, 'D:\\Strategy_old', 'site', 5),
(105, 94, 'D:\\Strategy_old', 'strategy', 14),
(106, 94, 'D:\\Strategy_old', 'temperatureinf', 12),
(107, 94, 'D:\\Strategy_old', 'paper', 4),
(108, 94, 'D:\\Strategy_old', 'context', 8),
(109, 94, 'D:\\Strategy_old', 'code', 10),
(110, 94, 'D:\\Strategy_old', 'skistrategy', 4),
(111, 95, 'D:\\Strategy', 'checktemperatureint', 3),
(112, 95, 'D:\\Strategy', 'getresult', 3),
(113, 95, 'D:\\Strategy', 'demo', 1),
(114, 95, 'D:\\Strategy', 'web', 5),
(115, 95, 'D:\\Strategy', 'temperatureinf', 12);

-- --------------------------------------------------------

--
-- Table structure for table `file_directory`
--

CREATE TABLE `file_directory` (
  `ID` int(100) NOT NULL,
  `Directory` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file_directory`
--

INSERT INTO `file_directory` (`ID`, `Directory`) VALUES
(1, 'gfdg'),
(2, 'D:\\DPSS\\Example Code\\huston\\Composite'),
(3, 'D:\\DPSS\\Example Code\\huston\\Command'),
(4, 'D:\\DPSS\\Example Code\\huston\\Command'),
(5, 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(6, 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(7, 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(8, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Composite'),
(9, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Composite'),
(10, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Composite'),
(11, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(12, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(13, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(14, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(15, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(16, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(17, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(18, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(19, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(20, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(21, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(22, 'C:\\Users\\Natasha Khan\\Documents'),
(23, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(24, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(25, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(26, 'C:\\Users\\Natasha Khan\\Downloads'),
(27, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(28, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(29, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(30, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(31, 'C:\\Users\\Natasha Khan\\Documents'),
(32, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Template_Method'),
(33, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Observer'),
(34, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Decorator'),
(35, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(36, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(37, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(38, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(39, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(40, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(41, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(42, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Strategy+Template_Method'),
(43, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(44, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(45, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(46, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(47, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(48, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(49, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(50, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(51, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(52, 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(53, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(54, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(55, 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(56, 'C:\\Users\\Natasha Khan\\Documents'),
(57, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(58, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(59, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(60, 'C:\\Users\\Natasha Khan\\Documents\\ProxyPattern'),
(61, 'C:\\Users\\Natasha Khan\\Documents\\FactoryPattern'),
(62, 'C:\\Users\\Natasha Khan\\Documents\\DecoratorPattern'),
(63, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(64, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(65, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(66, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(67, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(68, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(69, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(70, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(71, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(72, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(73, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(74, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(75, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(76, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(77, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(78, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(79, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(80, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(81, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(82, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(83, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(84, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(85, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(86, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(87, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(88, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(89, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(90, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(91, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(92, 'C:\\Users\\Natasha Khan\\Downloads\\Strategy'),
(93, 'C:\\Users\\Natasha Khan\\Downloads\\SingletonPattern-Project'),
(94, 'D:\\Strategy_old'),
(95, 'D:\\Strategy'),
(96, 'C:\\Users\\Natasha Khan\\Downloads\\Strategy'),
(97, 'C:\\Users\\Natasha Khan\\Dropbox\\Reaserch Project\\DPA2 201511190118\\DPA2\\DPA2'),
(98, 'C:\\Users\\Natasha Khan\\Dropbox\\Reaserch Project\\DPA2 201511190118\\DPA2\\DPA2'),
(99, 'C:\\Users\\Natasha Khan\\Dropbox\\Reaserch Project\\DPA2 201511190118\\DPA2\\DPA2'),
(100, 'C:\\Users\\Natasha Khan\\Dropbox\\Reaserch Project\\DPA2 201511190118\\DPA2\\DPA2'),
(101, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(102, 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(103, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(104, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(105, 'C:\\Users\\Natasha Khan\\Documents\\DecoratorPattern'),
(106, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(107, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(108, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(109, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(110, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(111, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(112, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(113, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(114, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(115, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(116, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(117, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(118, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(119, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(120, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(121, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(122, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(123, 'C:\\Users\\Natasha Khan\\Documents\\DecoratorPattern'),
(124, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(125, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(126, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(127, 'C:\\Users\\Natasha Khan\\workspace\\MarsRoverDecorator'),
(128, 'C:\\Users\\Natasha Khan\\workspace\\Mission Curiosity'),
(129, 'C:\\Users\\Natasha Khan\\workspace\\Mission Curiosity\\bin'),
(130, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(131, 'C:\\Users\\Natasha Khan\\workspace\\MarsRoverDecorator'),
(132, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(133, 'C:\\Users\\Natasha Khan\\workspace\\Design Pattern\\Mission Curiosity'),
(134, 'C:\\Users\\Natasha Khan\\workspace\\Design Pattern\\Mission Curiosity'),
(135, 'E:\\Percerons\\Perceron\\freeCol\\0.10.5\\bin'),
(136, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(137, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(138, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(139, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(140, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(141, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(142, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern\\src\\com\\javapapers\\designpatterns\\state'),
(143, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(144, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(145, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(146, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(147, 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(148, 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern\\bin\\com\\javapapers\\designpattern\\observer'),
(149, 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern\\src\\org\\arpit\\javapostsforlearning\\designpatterns'),
(150, 'C:\\Users\\Natasha Khan\\Desktop\\TestFolder'),
(151, 'C:\\Users\\Natasha Khan\\Desktop\\TestFolder'),
(152, 'C:\\Users\\Natasha Khan\\Desktop\\TestFolder'),
(153, 'G:\\DP Project last phase\\TestFolder'),
(154, 'C:\\Users\\Natasha Khan\\Downloads\\SingletonPattern-Project'),
(155, 'C:\\Users\\Natasha Khan\\Downloads\\jexcelapi_2_6_12');

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

--
-- Dumping data for table `methodnames`
--

INSERT INTO `methodnames` (`patternInstanceID`, `roleName`, `methodName`, `className`) VALUES
(1, 'FactoryMethod()', 'factoryMethod', 'Creator'),
(2, 'Operation()', 'findAndClone(java.lang.String)', 'PrototypesModule'),
(4, 'Request()/Execute()', 'execute', 'FanOffCommand'),
(4, 'Request()/Execute()', 'execute', 'FanOnCommand'),
(4, 'Request()/Execute()', 'execute', 'LightOffCommand'),
(4, 'Request()/Execute()', 'execute', 'LightOnCommand'),
(5, 'Operation()', 'traverse', 'Box'),
(5, 'Operation()', 'traverse', 'Composite'),
(5, 'Operation()', 'accept(Visitor)', 'Composite'),
(6, 'Operation()', 'draw', 'Decorator'),
(7, 'Notify()', 'findAndClone(java.lang.String)', 'PrototypesModule'),
(7, 'Notify()', 'soundTheAlarm', 'SensorSystem'),
(9, 'TemplateMethod()', 'anOperation', 'Creator'),
(9, 'TemplateMethod()', 'solve', 'TemplateMethod1'),
(9, 'TemplateMethod()', 'solve', 'TemplateMethod2'),
(9, 'TemplateMethod()', 'findSolution', 'Generalization'),
(9, 'TemplateMethod()', 'stepThr', 'Specialization'),
(10, 'Accept()', 'accept(Visitor)', 'Composite'),
(10, 'Accept()', 'accept(Visitor)', 'Leaf'),
(11, 'Request()', 'displayImage', 'ProxyImage'),
(1, 'FactoryMethod', 'factoryMethod', 'Creator'),
(2, 'Operation', 'findAndClone(java.lang.String)', 'PrototypesModule'),
(4, 'Request/Execute', 'execute', 'FanOffCommand'),
(4, 'Request/Execute', 'execute', 'FanOnCommand'),
(4, 'Request/Execute', 'execute', 'LightOffCommand'),
(4, 'Request/Execute', 'execute', 'LightOnCommand'),
(5, 'Operation', 'traverse', 'Box'),
(5, 'Operation', 'traverse', 'Composite'),
(5, 'Operation', 'accept(Visitor)', 'Composite'),
(6, 'Operation', 'draw', 'Decorator'),
(7, 'Notify', 'findAndClone(java.lang.String)', 'PrototypesModule'),
(7, 'Notify', 'soundTheAlarm', 'SensorSystem'),
(9, 'TemplateMethod', 'anOperation', 'Creator'),
(9, 'TemplateMethod', 'solve', 'TemplateMethod1'),
(9, 'TemplateMethod', 'solve', 'TemplateMethod2'),
(9, 'TemplateMethod', 'findSolution', 'Generalization'),
(9, 'TemplateMethod', 'stepThr', 'Specialization'),
(10, 'Accept', 'accept(Visitor)', 'Composite'),
(10, 'Accept', 'accept(Visitor)', 'Leaf'),
(11, 'Request', 'displayImage', 'ProxyImage'),
(4, 'Request/Execute', 'execute', 'com.javapapers.designpattern.command.OnCommand'),
(5, 'Operation', 'print', 'org.arpit.javapostsforlearning.designpatterns.Manager'),
(4, 'Request/Execute', 'execute', 'com.javapapers.designpattern.command.OnCommand'),
(4, 'Request/Execute', 'execute', 'com.javapapers.designpattern.command.OnCommand'),
(4, 'Request/Execute', 'execute', 'com.javapapers.designpattern.command.OnCommand'),
(4, 'Request/Execute', 'execute', 'com.javapapers.designpattern.command.OnCommand'),
(4, 'Request/Execute', 'execute', 'com.javapapers.designpattern.command.OnCommand'),
(5, 'Operation', 'print', 'org.arpit.javapostsforlearning.designpatterns.Manager'),
(160, 'Request/Execute', 'updateSensorData(marsrover.DataObserver.sensorData)', 'marsrover.DataObserver.REMS'),
(160, 'Request/Execute', 'execute', 'marsrover.Command.MoveBackwardCommand'),
(160, 'Request/Execute', 'execute', 'marsrover.Command.MoveForwardCommand'),
(160, 'Request/Execute', 'execute', 'marsrover.Command.RotateLeftCommand'),
(160, 'Request/Execute', 'execute', 'marsrover.Command.RotateRightCommand'),
(160, 'Request/Execute', 'execute', 'marsrover.Command.TakePictureCommand'),
(160, 'Request/Execute', 'execute', 'marsrover.Command.TakeSampleCommand'),
(160, 'Request/Execute', 'update', 'marsrover.DataObserver.Earth'),
(160, 'Request/Execute', 'update', 'marsrover.Observer.Rover'),
(162, 'Notify', 'notifyObservers', 'marsrover.DataObserver.REMS'),
(162, 'Notify', 'notifyObserver', 'marsrover.Observer.Camera'),
(164, 'TemplateMethod', 'AnalyzeSpecimen(boolean)', 'marsrover.ChainOfResponsibility.AbstractAnalysis'),
(165, 'Request/Execute', 'execute', 'com.javapapers.designpattern.command.OnCommand'),
(167, 'Request/Execute', 'execute', 'com.javapapers.designpattern.command.OnCommand'),
(169, 'Operation', 'print', 'org.arpit.javapostsforlearning.designpatterns.Manager'),
(170, 'Request/Execute', 'update', 'com.javapapers.designpattern.observer.User'),
(171, 'Notify', 'notifyObserver', 'com.javapapers.designpattern.observer.Blog'),
(173, 'Operation', 'showRoom', 'org.arpit.javapostsforlearning.designpattern.RoomDecorator'),
(175, 'Operation', 'print', 'org.arpit.javapostsforlearning.designpatterns.Manager'),
(177, 'Request/Execute', 'update', 'com.javapapers.designpattern.observer.User'),
(178, 'Notify', 'notifyObserver', 'com.javapapers.designpattern.observer.Blog'),
(181, 'Request/Execute', 'update', 'com.javapapers.designpattern.observer.User'),
(182, 'Notify', 'notifyObserver', 'com.javapapers.designpattern.observer.Blog'),
(184, 'Operation', 'showRoom', 'org.arpit.javapostsforlearning.designpattern.RoomDecorator'),
(185, 'Request/Execute', 'update', 'com.javapapers.designpattern.observer.User'),
(186, 'Notify', 'notifyObserver', 'com.javapapers.designpattern.observer.Blog'),
(188, 'Request/Execute', 'update', 'com.javapapers.designpattern.observer.User'),
(189, 'Notify', 'notifyObserver', 'com.javapapers.designpattern.observer.Blog'),
(191, 'Request/Execute', 'update', 'com.javapapers.designpattern.observer.User'),
(192, 'Notify', 'notifyObserver', 'com.javapapers.designpattern.observer.Blog'),
(194, 'Request/Execute', 'update', 'com.javapapers.designpattern.observer.User'),
(195, 'Notify', 'notifyObserver', 'com.javapapers.designpattern.observer.Blog'),
(197, 'Request/Execute', 'updateSensorData(missionCuriosity.DataObserver.sensorData)', 'missionCuriosity.DataObserver.REMS'),
(197, 'Request/Execute', 'execute', 'missionCuriosity.DirectionCommands.BackwardRobotCommand'),
(197, 'Request/Execute', 'execute', 'missionCuriosity.DirectionCommands.ForwardRobotCommand'),
(197, 'Request/Execute', 'execute', 'missionCuriosity.DirectionCommands.LeftRotationRobotCommand'),
(197, 'Request/Execute', 'execute', 'missionCuriosity.DirectionCommands.RightRotationRobotCommand'),
(197, 'Request/Execute', 'execute', 'missionCuriosity.DirectionCommands.TakePictureRobotCommand'),
(197, 'Request/Execute', 'execute', 'missionCuriosity.DirectionCommands.TakeSpecimenRobotCommand'),
(197, 'Request/Execute', 'update', 'missionCuriosity.ObstecleObserver.Rover'),
(197, 'Request/Execute', 'getUpdate', 'missionCuriosity.DataObserver.Earth'),
(199, 'Notify', 'notifyObserver', 'missionCuriosity.ObstecleObserver.Camera'),
(201, 'TemplateMethod', 'AnalyzeSpecimen', 'missionCuriosity.ChainOfResponsibility.AbstractAnalyzer'),
(209, 'Request/Execute', 'update', 'com.javapapers.designpattern.observer.User'),
(210, 'Notify', 'notifyObserver', 'com.javapapers.designpattern.observer.Blog'),
(212, 'Operation', 'print', 'org.arpit.javapostsforlearning.designpatterns.Manager');

-- --------------------------------------------------------

--
-- Table structure for table `patterninstance`
--

CREATE TABLE `patterninstance` (
  `patternID` int(11) NOT NULL,
  `patternInstanceID` int(100) NOT NULL,
  `instanceClass` text NOT NULL,
  `projectName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patterninstance`
--

INSERT INTO `patterninstance` (`patternID`, `patternInstanceID`, `instanceClass`, `projectName`) VALUES
(1, 1, '2', ''),
(5, 5, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(5, 6, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(5, 7, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(5, 8, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(5, 9, '[Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'hello'),
(10, 10, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'hello'),
(8, 11, '[Context: StrategyDemo | State/Strategy: Strategy | ]', 'hello'),
(9, 12, '[AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | ]', 'hello'),
(5, 13, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(1, 14, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'hello'),
(2, 15, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'hello'),
(3, 16, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'hello'),
(4, 17, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'hello'),
(5, 18, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'hello'),
(6, 19, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'hello'),
(7, 20, '[Observer: Prototype | Subject: PrototypesModule | Notify(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | , Observer: AlarmListener | Subject: SensorSystem | Notify(): SensorSystem::soundTheAlarm():void | ]', 'hello'),
(8, 21, '[Context: Switch | State/Strategy: Command | , Context: FSM | State/Strategy: State | , Context: PrototypesModule | State/Strategy: Prototype | , Context: StrategyDemo | State/Strategy: Strategy | ]', 'hello'),
(9, 22, '[AbstractClass: Creator | TemplateMethod(): Creator::anOperation():void | , AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | , AbstractClass: Generalization | TemplateMethod(): Generalization::findSolution():void | , AbstractClass: Specialization | TemplateMethod(): Specialization::stepThr():void | ]', 'hello'),
(10, 23, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'hello'),
(11, 24, '[Proxy: ProxyImage | RealSubject: RealImage | Request(): ProxyImage::displayImage():void | ]', 'hello'),
(1, 25, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'hello'),
(2, 26, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'hello'),
(3, 27, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'hello'),
(4, 28, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'hello'),
(5, 29, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'hello'),
(6, 30, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'hello'),
(1, 31, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'hello'),
(2, 32, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'hello'),
(3, 33, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'hello'),
(4, 34, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'hello'),
(5, 35, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'hello'),
(6, 36, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'hello'),
(7, 37, '[Observer: Prototype | Subject: PrototypesModule | Notify(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | , Observer: AlarmListener | Subject: SensorSystem | Notify(): SensorSystem::soundTheAlarm():void | ]', 'hello'),
(8, 38, '[Context: Switch | State/Strategy: Command | , Context: FSM | State/Strategy: State | , Context: PrototypesModule | State/Strategy: Prototype | , Context: StrategyDemo | State/Strategy: Strategy | ]', 'hello'),
(9, 39, '[AbstractClass: Creator | TemplateMethod(): Creator::anOperation():void | , AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | , AbstractClass: Generalization | TemplateMethod(): Generalization::findSolution():void | , AbstractClass: Specialization | TemplateMethod(): Specialization::stepThr():void | ]', 'hello'),
(10, 40, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'hello'),
(11, 41, '[Proxy: ProxyImage | RealSubject: RealImage | Request(): ProxyImage::displayImage():void | ]', 'hello'),
(5, 42, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(6, 43, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'hello'),
(1, 44, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'hello'),
(5, 45, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(5, 46, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(5, 47, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(5, 48, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'hello'),
(5, 49, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'huston'),
(5, 50, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'huston'),
(5, 51, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'huston'),
(5, 52, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | ]', 'huston'),
(5, 53, '[Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'huston'),
(10, 54, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'huston'),
(4, 55, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'Hello'),
(8, 56, '[Context: StrategyDemo | State/Strategy: Strategy | ]', 'Hello'),
(9, 57, '[AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | ]', 'Hello'),
(1, 58, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(2, 59, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(3, 60, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(4, 61, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(5, 62, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(6, 63, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(7, 64, '[Observer: Prototype | Subject: PrototypesModule | Notify(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | , Observer: AlarmListener | Subject: SensorSystem | Notify(): SensorSystem::soundTheAlarm():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(8, 65, '[Context: Switch | State/Strategy: Command | , Context: FSM | State/Strategy: State | , Context: PrototypesModule | State/Strategy: Prototype | , Context: StrategyDemo | State/Strategy: Strategy | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(9, 66, '[AbstractClass: Creator | TemplateMethod(): Creator::anOperation():void | , AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | , AbstractClass: Generalization | TemplateMethod(): Generalization::findSolution():void | , AbstractClass: Specialization | TemplateMethod(): Specialization::stepThr():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(10, 67, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(11, 68, '[Proxy: ProxyImage | RealSubject: RealImage | Request(): ProxyImage::displayImage():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(4, 69, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(8, 70, '[Context: Switch | State/Strategy: Command | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(4, 71, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(8, 72, '[Context: Switch | State/Strategy: Command | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(4, 73, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(8, 74, '[Context: Switch | State/Strategy: Command | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(4, 75, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(8, 76, '[Context: Switch | State/Strategy: Command | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(1, 77, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(2, 78, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(3, 79, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(4, 80, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(5, 81, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(6, 82, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(7, 83, '[Observer: Prototype | Subject: PrototypesModule | Notify(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | , Observer: AlarmListener | Subject: SensorSystem | Notify(): SensorSystem::soundTheAlarm():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(8, 84, '[Context: Switch | State/Strategy: Command | , Context: FSM | State/Strategy: State | , Context: PrototypesModule | State/Strategy: Prototype | , Context: StrategyDemo | State/Strategy: Strategy | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(9, 85, '[AbstractClass: Creator | TemplateMethod(): Creator::anOperation():void | , AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | , AbstractClass: Generalization | TemplateMethod(): Generalization::findSolution():void | , AbstractClass: Specialization | TemplateMethod(): Specialization::stepThr():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(10, 86, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(11, 87, '[Proxy: ProxyImage | RealSubject: RealImage | Request(): ProxyImage::displayImage():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(4, 88, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(4, 89, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(8, 90, '[Context: Switch | State/Strategy: Command | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston\\Command'),
(1, 91, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(2, 92, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(3, 93, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(4, 94, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(5, 95, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(6, 96, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(7, 97, '[Observer: Prototype | Subject: PrototypesModule | Notify(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | , Observer: AlarmListener | Subject: SensorSystem | Notify(): SensorSystem::soundTheAlarm():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(8, 98, '[Context: Switch | State/Strategy: Command | , Context: FSM | State/Strategy: State | , Context: PrototypesModule | State/Strategy: Prototype | , Context: StrategyDemo | State/Strategy: Strategy | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(9, 99, '[AbstractClass: Creator | TemplateMethod(): Creator::anOperation():void | , AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | , AbstractClass: Generalization | TemplateMethod(): Generalization::findSolution():void | , AbstractClass: Specialization | TemplateMethod(): Specialization::stepThr():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(10, 100, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(11, 101, '[Proxy: ProxyImage | RealSubject: RealImage | Request(): ProxyImage::displayImage():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston'),
(1, 102, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(2, 103, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(3, 104, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(4, 105, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(5, 106, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(6, 107, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(7, 108, '[Observer: Prototype | Subject: PrototypesModule | Notify(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | , Observer: AlarmListener | Subject: SensorSystem | Notify(): SensorSystem::soundTheAlarm():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(8, 109, '[Context: Switch | State/Strategy: Command | , Context: FSM | State/Strategy: State | , Context: PrototypesModule | State/Strategy: Prototype | , Context: StrategyDemo | State/Strategy: Strategy | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(9, 110, '[AbstractClass: Creator | TemplateMethod(): Creator::anOperation():void | , AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | , AbstractClass: Generalization | TemplateMethod(): Generalization::findSolution():void | , AbstractClass: Specialization | TemplateMethod(): Specialization::stepThr():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(10, 111, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(11, 112, '[Proxy: ProxyImage | RealSubject: RealImage | Request(): ProxyImage::displayImage():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(1, 113, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(2, 114, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(3, 115, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(4, 116, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(5, 117, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(6, 118, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(7, 119, '[Observer: Prototype | Subject: PrototypesModule | Notify(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | , Observer: AlarmListener | Subject: SensorSystem | Notify(): SensorSystem::soundTheAlarm():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(8, 120, '[Context: Switch | State/Strategy: Command | , Context: FSM | State/Strategy: State | , Context: PrototypesModule | State/Strategy: Prototype | , Context: StrategyDemo | State/Strategy: Strategy | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(9, 121, '[AbstractClass: Creator | TemplateMethod(): Creator::anOperation():void | , AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | , AbstractClass: Generalization | TemplateMethod(): Generalization::findSolution():void | , AbstractClass: Specialization | TemplateMethod(): Specialization::stepThr():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(10, 122, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(11, 123, '[Proxy: ProxyImage | RealSubject: RealImage | Request(): ProxyImage::displayImage():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(1, 124, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(2, 125, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(3, 126, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(4, 127, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(5, 128, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(6, 129, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(7, 130, '[Observer: Prototype | Subject: PrototypesModule | Notify(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | , Observer: AlarmListener | Subject: SensorSystem | Notify(): SensorSystem::soundTheAlarm():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(8, 131, '[Context: Switch | State/Strategy: Command | , Context: FSM | State/Strategy: State | , Context: PrototypesModule | State/Strategy: Prototype | , Context: StrategyDemo | State/Strategy: Strategy | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(9, 132, '[AbstractClass: Creator | TemplateMethod(): Creator::anOperation():void | , AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | , AbstractClass: Generalization | TemplateMethod(): Generalization::findSolution():void | , AbstractClass: Specialization | TemplateMethod(): Specialization::stepThr():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(10, 133, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(11, 134, '[Proxy: ProxyImage | RealSubject: RealImage | Request(): ProxyImage::displayImage():void | ]', 'C:\\Users\\Natasha Khan\\Downloads\\huston\\huston'),
(1, 135, '[Creator: Creator | FactoryMethod(): Creator::factoryMethod():Product | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(2, 136, '[Client: PrototypesModule | Prototype: Prototype | Operation(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(3, 137, '[Singleton: ClassicSingleton | uniqueInstance: private static ClassicSingleton instance | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(4, 138, '[Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOffCommand | Request()/Execute(): FanOffCommand::execute():void | , Adaptee/Receiver: Fan | Adapter/ConcreteCommand: FanOnCommand | Request()/Execute(): FanOnCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOffCommand | Request()/Execute(): LightOffCommand::execute():void | , Adaptee/Receiver: Light | Adapter/ConcreteCommand: LightOnCommand | Request()/Execute(): LightOnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(5, 139, '[Component: Entity | Composite: Box | Operation(): Box::traverse():void | , Component: Component | Composite: Composite | Operation(): Composite::traverse():void | Operation(): Composite::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(6, 140, '[Component: Widget | Decorator: Decorator | component: private Widget wid | Operation(): Decorator::draw():void | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(7, 141, '[Observer: Prototype | Subject: PrototypesModule | Notify(): PrototypesModule::findAndClone(java.lang.String):java.lang.Object | , Observer: AlarmListener | Subject: SensorSystem | Notify(): SensorSystem::soundTheAlarm():void | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(8, 142, '[Context: Switch | State/Strategy: Command | , Context: FSM | State/Strategy: State | , Context: PrototypesModule | State/Strategy: Prototype | , Context: StrategyDemo | State/Strategy: Strategy | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(9, 143, '[AbstractClass: Creator | TemplateMethod(): Creator::anOperation():void | , AbstractClass: TemplateMethod1 | TemplateMethod(): TemplateMethod1::solve():void | , AbstractClass: TemplateMethod2 | TemplateMethod(): TemplateMethod2::solve():void | , AbstractClass: Generalization | TemplateMethod(): Generalization::findSolution():void | , AbstractClass: Specialization | TemplateMethod(): Specialization::stepThr():void | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(10, 144, '[ConcreteElement: Composite | Visitor: Visitor | Accept(): Composite::accept(Visitor):void | , ConcreteElement: Leaf | Visitor: Visitor | Accept(): Leaf::accept(Visitor):void | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(11, 145, '[Proxy: ProxyImage | RealSubject: RealImage | Request(): ProxyImage::displayImage():void | ]', 'C:\\Users\\Natasha Khan\\Documents'),
(4, 146, '[Adaptee/Receiver: com.javapapers.designpattern.command.ConsumerElectronics | Adapter/ConcreteCommand: com.javapapers.designpattern.command.OnCommand | Request()/Execute(): com.javapapers.designpattern.command.OnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(8, 147, '[Context: com.javapapers.designpattern.command.Button | State/Strategy: com.javapapers.designpattern.command.Command | , Context: com.javapapers.designpattern.command.OnCommand | State/Strategy: com.javapapers.designpattern.command.ConsumerElectronics | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(5, 148, '[Component: org.arpit.javapostsforlearning.designpatterns.Employee | Composite: org.arpit.javapostsforlearning.designpatterns.Manager | Operation(): org.arpit.javapostsforlearning.designpatterns.Manager::print():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(4, 149, '[Adaptee/Receiver: com.javapapers.designpattern.command.ConsumerElectronics | Adapter/ConcreteCommand: com.javapapers.designpattern.command.OnCommand | Request()/Execute(): com.javapapers.designpattern.command.OnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(4, 150, '[Adaptee/Receiver: com.javapapers.designpattern.command.ConsumerElectronics | Adapter/ConcreteCommand: com.javapapers.designpattern.command.OnCommand | Request()/Execute(): com.javapapers.designpattern.command.OnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(8, 151, '[Context: com.javapapers.designpattern.command.Button | State/Strategy: com.javapapers.designpattern.command.Command | , Context: com.javapapers.designpattern.command.OnCommand | State/Strategy: com.javapapers.designpattern.command.ConsumerElectronics | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(4, 152, '[Adaptee/Receiver: com.javapapers.designpattern.command.ConsumerElectronics | Adapter/ConcreteCommand: com.javapapers.designpattern.command.OnCommand | Request()/Execute(): com.javapapers.designpattern.command.OnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(8, 153, '[Context: com.javapapers.designpattern.command.Button | State/Strategy: com.javapapers.designpattern.command.Command | , Context: com.javapapers.designpattern.command.OnCommand | State/Strategy: com.javapapers.designpattern.command.ConsumerElectronics | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(4, 154, '[Adaptee/Receiver: com.javapapers.designpattern.command.ConsumerElectronics | Adapter/ConcreteCommand: com.javapapers.designpattern.command.OnCommand | Request()/Execute(): com.javapapers.designpattern.command.OnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(8, 155, '[Context: com.javapapers.designpattern.command.Button | State/Strategy: com.javapapers.designpattern.command.Command | , Context: com.javapapers.designpattern.command.OnCommand | State/Strategy: com.javapapers.designpattern.command.ConsumerElectronics | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(4, 156, '[Adaptee/Receiver: com.javapapers.designpattern.command.ConsumerElectronics | Adapter/ConcreteCommand: com.javapapers.designpattern.command.OnCommand | Request()/Execute(): com.javapapers.designpattern.command.OnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(8, 157, '[Context: com.javapapers.designpattern.command.Button | State/Strategy: com.javapapers.designpattern.command.Command | , Context: com.javapapers.designpattern.command.OnCommand | State/Strategy: com.javapapers.designpattern.command.ConsumerElectronics | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(5, 158, '[Component: org.arpit.javapostsforlearning.designpatterns.Employee | Composite: org.arpit.javapostsforlearning.designpatterns.Manager | Operation(): org.arpit.javapostsforlearning.designpatterns.Manager::print():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(3, 159, '[Singleton: com.javacodegeeks.patterns.singletonpattern.Singleton | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.Singleton sc | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletonEager | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.SingletonEager sc | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletoneEnum$SingleEnum | uniqueInstance: public static com.javacodegeeks.patterns.singletonpattern.SingletoneEnum$SingleEnum SINGLETON_ENUM | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletonLazy | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.SingletonLazy sc | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletonLazyDoubleCheck | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.SingletonLazyDoubleCheck sc | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletonLazyMultithreaded | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.SingletonLazyMultithreaded sc | ]', 'C:\\Users\\Natasha Khan\\Downloads\\SingletonPattern-Project'),
(4, 160, '[Adaptee/Receiver: marsrover.DataObserver.sensorData | Adapter/ConcreteCommand: marsrover.DataObserver.REMS | Request()/Execute(): marsrover.DataObserver.REMS::updateSensorData(marsrover.DataObserver.sensorData):void | , Adapter/ConcreteCommand: marsrover.Command.MoveBackwardCommand | Adaptee/Receiver: marsrover.Command.Operations | Request()/Execute(): marsrover.Command.MoveBackwardCommand::execute():void | , Adapter/ConcreteCommand: marsrover.Command.MoveForwardCommand | Adaptee/Receiver: marsrover.Command.Operations | Request()/Execute(): marsrover.Command.MoveForwardCommand::execute():void | , Adapter/ConcreteCommand: marsrover.Command.RotateLeftCommand | Adaptee/Receiver: marsrover.Command.Operations | Request()/Execute(): marsrover.Command.RotateLeftCommand::execute():void | , Adapter/ConcreteCommand: marsrover.Command.RotateRightCommand | Adaptee/Receiver: marsrover.Command.Operations | Request()/Execute(): marsrover.Command.RotateRightCommand::execute():void | , Adapter/ConcreteCommand: marsrover.Command.TakePictureCommand | Adaptee/Receiver: marsrover.Command.Operations | Request()/Execute(): marsrover.Command.TakePictureCommand::execute():void | , Adapter/ConcreteCommand: marsrover.Command.TakeSampleCommand | Adaptee/Receiver: marsrover.Command.Operations | Request()/Execute(): marsrover.Command.TakeSampleCommand::execute():void | , Adaptee/Receiver: marsrover.DataObserver.Subject | Adapter/ConcreteCommand: marsrover.DataObserver.Earth | Request()/Execute(): marsrover.DataObserver.Earth::update():void | , Adaptee/Receiver: marsrover.Observer.Camera | Adapter/ConcreteCommand: marsrover.Observer.Rover | Request()/Execute(): marsrover.Observer.Rover::update():void | ]', 'C:\\Users\\Natasha Khan\\Dropbox\\Reaserch Project\\DPA2 201511190118\\DPA2\\DPA2'),
(6, 161, '[Component: marsrover.Decorator.Rover | Decorator: marsrover.Decorator.ExplorationActivity | component: protected marsrover.Decorator.Rover marsRover | ]', 'C:\\Users\\Natasha Khan\\Dropbox\\Reaserch Project\\DPA2 201511190118\\DPA2\\DPA2'),
(7, 162, '[Observer: marsrover.DataObserver.Observer | Subject: marsrover.DataObserver.REMS | Notify(): marsrover.DataObserver.REMS::notifyObservers():void | , Observer: marsrover.Observer.Observer | Subject: marsrover.Observer.Camera | Notify(): marsrover.Observer.Camera::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\Dropbox\\Reaserch Project\\DPA2 201511190118\\DPA2\\DPA2'),
(8, 163, '[Context: marsrover.Command.RemoteControl | State/Strategy: marsrover.Command.Command | , Context: marsrover.Command.MoveBackwardCommand | State/Strategy: marsrover.Command.Operations | , Context: marsrover.Command.MoveForwardCommand | State/Strategy: marsrover.Command.Operations | , Context: marsrover.Command.RotateLeftCommand | State/Strategy: marsrover.Command.Operations | , Context: marsrover.Command.RotateRightCommand | State/Strategy: marsrover.Command.Operations | , Context: marsrover.Command.TakePictureCommand | State/Strategy: marsrover.Command.Operations | , Context: marsrover.Command.TakeSampleCommand | State/Strategy: marsrover.Command.Operations | , Context: marsrover.DataObserver.Earth | State/Strategy: marsrover.DataObserver.Subject | , Context: marsrover.Strategy.RoverSoftware | State/Strategy: marsrover.Strategy.RoverBehavior | ]', 'C:\\Users\\Natasha Khan\\Dropbox\\Reaserch Project\\DPA2 201511190118\\DPA2\\DPA2'),
(9, 164, '[AbstractClass: marsrover.ChainOfResponsibility.AbstractAnalysis | TemplateMethod(): marsrover.ChainOfResponsibility.AbstractAnalysis::AnalyzeSpecimen(boolean):void | ]', 'C:\\Users\\Natasha Khan\\Dropbox\\Reaserch Project\\DPA2 201511190118\\DPA2\\DPA2'),
(4, 165, '[Adaptee/Receiver: com.javapapers.designpattern.command.ConsumerElectronics | Adapter/ConcreteCommand: com.javapapers.designpattern.command.OnCommand | Request()/Execute(): com.javapapers.designpattern.command.OnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(8, 166, '[Context: com.javapapers.designpattern.command.Button | State/Strategy: com.javapapers.designpattern.command.Command | , Context: com.javapapers.designpattern.command.OnCommand | State/Strategy: com.javapapers.designpattern.command.ConsumerElectronics | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(4, 167, '[Adaptee/Receiver: com.javapapers.designpattern.command.ConsumerElectronics | Adapter/ConcreteCommand: com.javapapers.designpattern.command.OnCommand | Request()/Execute(): com.javapapers.designpattern.command.OnCommand::execute():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(8, 168, '[Context: com.javapapers.designpattern.command.Button | State/Strategy: com.javapapers.designpattern.command.Command | , Context: com.javapapers.designpattern.command.OnCommand | State/Strategy: com.javapapers.designpattern.command.ConsumerElectronics | ]', 'C:\\Users\\Natasha Khan\\Documents\\CommandPattern'),
(5, 169, '[Component: org.arpit.javapostsforlearning.designpatterns.Employee | Composite: org.arpit.javapostsforlearning.designpatterns.Manager | Operation(): org.arpit.javapostsforlearning.designpatterns.Manager::print():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(4, 170, '[Adaptee/Receiver: com.javapapers.designpattern.observer.Subject | Adapter/ConcreteCommand: com.javapapers.designpattern.observer.User | Request()/Execute(): com.javapapers.designpattern.observer.User::update():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(7, 171, '[Observer: com.javapapers.designpattern.observer.Observer | Subject: com.javapapers.designpattern.observer.Blog | Notify(): com.javapapers.designpattern.observer.Blog::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(8, 172, '[Context: com.javapapers.designpattern.observer.User | State/Strategy: com.javapapers.designpattern.observer.Subject | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(6, 173, '[Component: org.arpit.javapostsforlearning.designpattern.Room | Decorator: org.arpit.javapostsforlearning.designpattern.RoomDecorator | component: protected org.arpit.javapostsforlearning.designpattern.Room specialRoom | Operation(): org.arpit.javapostsforlearning.designpattern.RoomDecorator::showRoom():java.lang.String | ]', 'C:\\Users\\Natasha Khan\\Documents\\DecoratorPattern'),
(8, 174, '[Context: com.javapapers.designpatterns.state.AlertStateContext | State/Strategy: com.javapapers.designpatterns.state.MobileAlertState | ]', 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(5, 175, '[Component: org.arpit.javapostsforlearning.designpatterns.Employee | Composite: org.arpit.javapostsforlearning.designpatterns.Manager | Operation(): org.arpit.javapostsforlearning.designpatterns.Manager::print():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern'),
(4, 176, '[Adaptee/Receiver: com.javapapers.designpattern.observer.Subject | Adapter/ConcreteCommand: com.javapapers.designpattern.observer.User | Request()/Execute(): com.javapapers.designpattern.observer.User::update():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(4, 177, '[Adaptee/Receiver: com.javapapers.designpattern.observer.Subject | Adapter/ConcreteCommand: com.javapapers.designpattern.observer.User | Request()/Execute(): com.javapapers.designpattern.observer.User::update():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(7, 178, '[Observer: com.javapapers.designpattern.observer.Observer | Subject: com.javapapers.designpattern.observer.Blog | Notify(): com.javapapers.designpattern.observer.Blog::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(8, 179, '[Context: com.javapapers.designpattern.observer.User | State/Strategy: com.javapapers.designpattern.observer.Subject | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(8, 180, '[Context: com.javapapers.designpatterns.state.AlertStateContext | State/Strategy: com.javapapers.designpatterns.state.MobileAlertState | ]', 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(4, 181, '[Adaptee/Receiver: com.javapapers.designpattern.observer.Subject | Adapter/ConcreteCommand: com.javapapers.designpattern.observer.User | Request()/Execute(): com.javapapers.designpattern.observer.User::update():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(7, 182, '[Observer: com.javapapers.designpattern.observer.Observer | Subject: com.javapapers.designpattern.observer.Blog | Notify(): com.javapapers.designpattern.observer.Blog::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(8, 183, '[Context: com.javapapers.designpattern.observer.User | State/Strategy: com.javapapers.designpattern.observer.Subject | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(6, 184, '[Component: org.arpit.javapostsforlearning.designpattern.Room | Decorator: org.arpit.javapostsforlearning.designpattern.RoomDecorator | component: protected org.arpit.javapostsforlearning.designpattern.Room specialRoom | Operation(): org.arpit.javapostsforlearning.designpattern.RoomDecorator::showRoom():java.lang.String | ]', 'C:\\Users\\Natasha Khan\\Documents\\DecoratorPattern'),
(4, 185, '[Adaptee/Receiver: com.javapapers.designpattern.observer.Subject | Adapter/ConcreteCommand: com.javapapers.designpattern.observer.User | Request()/Execute(): com.javapapers.designpattern.observer.User::update():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(7, 186, '[Observer: com.javapapers.designpattern.observer.Observer | Subject: com.javapapers.designpattern.observer.Blog | Notify(): com.javapapers.designpattern.observer.Blog::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(8, 187, '[Context: com.javapapers.designpattern.observer.User | State/Strategy: com.javapapers.designpattern.observer.Subject | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(4, 188, '[Adaptee/Receiver: com.javapapers.designpattern.observer.Subject | Adapter/ConcreteCommand: com.javapapers.designpattern.observer.User | Request()/Execute(): com.javapapers.designpattern.observer.User::update():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(7, 189, '[Observer: com.javapapers.designpattern.observer.Observer | Subject: com.javapapers.designpattern.observer.Blog | Notify(): com.javapapers.designpattern.observer.Blog::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(8, 190, '[Context: com.javapapers.designpattern.observer.User | State/Strategy: com.javapapers.designpattern.observer.Subject | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern');
INSERT INTO `patterninstance` (`patternID`, `patternInstanceID`, `instanceClass`, `projectName`) VALUES
(4, 191, '[Adaptee/Receiver: com.javapapers.designpattern.observer.Subject | Adapter/ConcreteCommand: com.javapapers.designpattern.observer.User | Request()/Execute(): com.javapapers.designpattern.observer.User::update():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(7, 192, '[Observer: com.javapapers.designpattern.observer.Observer | Subject: com.javapapers.designpattern.observer.Blog | Notify(): com.javapapers.designpattern.observer.Blog::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(8, 193, '[Context: com.javapapers.designpattern.observer.User | State/Strategy: com.javapapers.designpattern.observer.Subject | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(4, 194, '[Adaptee/Receiver: com.javapapers.designpattern.observer.Subject | Adapter/ConcreteCommand: com.javapapers.designpattern.observer.User | Request()/Execute(): com.javapapers.designpattern.observer.User::update():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(7, 195, '[Observer: com.javapapers.designpattern.observer.Observer | Subject: com.javapapers.designpattern.observer.Blog | Notify(): com.javapapers.designpattern.observer.Blog::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(8, 196, '[Context: com.javapapers.designpattern.observer.User | State/Strategy: com.javapapers.designpattern.observer.Subject | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern'),
(4, 197, '[Adaptee/Receiver: missionCuriosity.DataObserver.sensorData | Adapter/ConcreteCommand: missionCuriosity.DataObserver.REMS | Request()/Execute(): missionCuriosity.DataObserver.REMS::updateSensorData(missionCuriosity.DataObserver.sensorData):void | , Adapter/ConcreteCommand: missionCuriosity.DirectionCommands.BackwardRobotCommand | Adaptee/Receiver: missionCuriosity.DirectionCommands.RobotOperations | Request()/Execute(): missionCuriosity.DirectionCommands.BackwardRobotCommand::execute():void | , Adapter/ConcreteCommand: missionCuriosity.DirectionCommands.ForwardRobotCommand | Adaptee/Receiver: missionCuriosity.DirectionCommands.RobotOperations | Request()/Execute(): missionCuriosity.DirectionCommands.ForwardRobotCommand::execute():void | , Adapter/ConcreteCommand: missionCuriosity.DirectionCommands.LeftRotationRobotCommand | Adaptee/Receiver: missionCuriosity.DirectionCommands.RobotOperations | Request()/Execute(): missionCuriosity.DirectionCommands.LeftRotationRobotCommand::execute():void | , Adapter/ConcreteCommand: missionCuriosity.DirectionCommands.RightRotationRobotCommand | Adaptee/Receiver: missionCuriosity.DirectionCommands.RobotOperations | Request()/Execute(): missionCuriosity.DirectionCommands.RightRotationRobotCommand::execute():void | , Adapter/ConcreteCommand: missionCuriosity.DirectionCommands.TakePictureRobotCommand | Adaptee/Receiver: missionCuriosity.DirectionCommands.RobotOperations | Request()/Execute(): missionCuriosity.DirectionCommands.TakePictureRobotCommand::execute():void | , Adapter/ConcreteCommand: missionCuriosity.DirectionCommands.TakeSpecimenRobotCommand | Adaptee/Receiver: missionCuriosity.DirectionCommands.RobotOperations | Request()/Execute(): missionCuriosity.DirectionCommands.TakeSpecimenRobotCommand::execute():void | , Adaptee/Receiver: missionCuriosity.ObstecleObserver.Camera | Adapter/ConcreteCommand: missionCuriosity.ObstecleObserver.Rover | Request()/Execute(): missionCuriosity.ObstecleObserver.Rover::update():void | , Adaptee/Receiver: missionCuriosity.DataObserver.REMS | Adapter/ConcreteCommand: missionCuriosity.DataObserver.Earth | Request()/Execute(): missionCuriosity.DataObserver.Earth::getUpdate():void | ]', 'C:\\Users\\Natasha Khan\\workspace\\Design Pattern\\Mission Curiosity'),
(6, 198, '[Component: missionCuriosity.FunctionalDecorator.MarsRover | Decorator: missionCuriosity.FunctionalDecorator.MarsRoverExploration | component: protected missionCuriosity.FunctionalDecorator.MarsRover rover | ]', 'C:\\Users\\Natasha Khan\\workspace\\Design Pattern\\Mission Curiosity'),
(7, 199, '[Observer: missionCuriosity.ObstecleObserver.Observer | Subject: missionCuriosity.ObstecleObserver.Camera | Notify(): missionCuriosity.ObstecleObserver.Camera::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\workspace\\Design Pattern\\Mission Curiosity'),
(8, 200, '[Context: missionCuriosity.DirectionCommands.RobotRemoteControl | State/Strategy: missionCuriosity.DirectionCommands.IRobotCommands | , Context: missionCuriosity.DirectionCommands.BackwardRobotCommand | State/Strategy: missionCuriosity.DirectionCommands.RobotOperations | , Context: missionCuriosity.DirectionCommands.ForwardRobotCommand | State/Strategy: missionCuriosity.DirectionCommands.RobotOperations | , Context: missionCuriosity.DirectionCommands.LeftRotationRobotCommand | State/Strategy: missionCuriosity.DirectionCommands.RobotOperations | , Context: missionCuriosity.DirectionCommands.RightRotationRobotCommand | State/Strategy: missionCuriosity.DirectionCommands.RobotOperations | , Context: missionCuriosity.DirectionCommands.TakePictureRobotCommand | State/Strategy: missionCuriosity.DirectionCommands.RobotOperations | , Context: missionCuriosity.DirectionCommands.TakeSpecimenRobotCommand | State/Strategy: missionCuriosity.DirectionCommands.RobotOperations | , Context: missionCuriosity.SpaceTravelingStrategy.RoverSoftware | State/Strategy: missionCuriosity.SpaceTravelingStrategy.RobotTravelingBehavior | ]', 'C:\\Users\\Natasha Khan\\workspace\\Design Pattern\\Mission Curiosity'),
(9, 201, '[AbstractClass: missionCuriosity.ChainOfResponsibility.AbstractAnalyzer | TemplateMethod(): missionCuriosity.ChainOfResponsibility.AbstractAnalyzer::AnalyzeSpecimen():void | ]', 'C:\\Users\\Natasha Khan\\workspace\\Design Pattern\\Mission Curiosity'),
(8, 202, '[Context: com.javapapers.designpatterns.state.AlertStateContext | State/Strategy: com.javapapers.designpatterns.state.MobileAlertState | ]', 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(8, 203, '[Context: com.javapapers.designpatterns.state.AlertStateContext | State/Strategy: com.javapapers.designpatterns.state.MobileAlertState | ]', 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(8, 204, '[Context: com.javapapers.designpatterns.state.AlertStateContext | State/Strategy: com.javapapers.designpatterns.state.MobileAlertState | ]', 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(8, 205, '[Context: com.javapapers.designpatterns.state.AlertStateContext | State/Strategy: com.javapapers.designpatterns.state.MobileAlertState | ]', 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(8, 206, '[Context: com.javapapers.designpatterns.state.AlertStateContext | State/Strategy: com.javapapers.designpatterns.state.MobileAlertState | ]', 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(8, 207, '[Context: com.javapapers.designpatterns.state.AlertStateContext | State/Strategy: com.javapapers.designpatterns.state.MobileAlertState | ]', 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(8, 208, '[Context: com.javapapers.designpatterns.state.AlertStateContext | State/Strategy: com.javapapers.designpatterns.state.MobileAlertState | ]', 'C:\\Users\\Natasha Khan\\Documents\\StatePattern'),
(4, 209, '[Adaptee/Receiver: com.javapapers.designpattern.observer.Subject | Adapter/ConcreteCommand: com.javapapers.designpattern.observer.User | Request()/Execute(): com.javapapers.designpattern.observer.User::update():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern\\bin\\com\\javapapers\\designpattern\\observer'),
(7, 210, '[Observer: com.javapapers.designpattern.observer.Observer | Subject: com.javapapers.designpattern.observer.Blog | Notify(): com.javapapers.designpattern.observer.Blog::notifyObserver():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern\\bin\\com\\javapapers\\designpattern\\observer'),
(8, 211, '[Context: com.javapapers.designpattern.observer.User | State/Strategy: com.javapapers.designpattern.observer.Subject | ]', 'C:\\Users\\Natasha Khan\\Documents\\ObserverPattern\\bin\\com\\javapapers\\designpattern\\observer'),
(5, 212, '[Component: org.arpit.javapostsforlearning.designpatterns.Employee | Composite: org.arpit.javapostsforlearning.designpatterns.Manager | Operation(): org.arpit.javapostsforlearning.designpatterns.Manager::print():void | ]', 'C:\\Users\\Natasha Khan\\Documents\\CompositePattern\\src\\org\\arpit\\javapostsforlearning\\designpatterns'),
(3, 213, '[Singleton: AbstractFactoryWithSingleton.LanguageEdit | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageEdit languageEdit | , Singleton: AbstractFactoryWithSingleton.LanguageFont | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageFont languagefont | , Singleton: AbstractFactoryWithSingleton.LanguageSpellchecker | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageSpellchecker languageSpellchecker | , Singleton: AbstractFactoryWithSingleton.LanguageThesaurus | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageThesaurus languageThesaurus | ]', 'C:\\Users\\Natasha Khan\\Desktop\\TestFolder'),
(8, 214, '[Context: AbstractFactoryWithSingleton.LanguageEdit | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageFont | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageSpellchecker | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageThesaurus | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | ]', 'C:\\Users\\Natasha Khan\\Desktop\\TestFolder'),
(3, 215, '[Singleton: AbstractFactoryWithSingleton.LanguageEdit | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageEdit languageEdit | , Singleton: AbstractFactoryWithSingleton.LanguageFont | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageFont languagefont | , Singleton: AbstractFactoryWithSingleton.LanguageSpellchecker | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageSpellchecker languageSpellchecker | , Singleton: AbstractFactoryWithSingleton.LanguageThesaurus | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageThesaurus languageThesaurus | ]', 'C:\\Users\\Natasha Khan\\Desktop\\TestFolder'),
(8, 216, '[Context: AbstractFactoryWithSingleton.LanguageEdit | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageFont | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageSpellchecker | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageThesaurus | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | ]', 'C:\\Users\\Natasha Khan\\Desktop\\TestFolder'),
(3, 217, '[Singleton: AbstractFactoryWithSingleton.LanguageEdit | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageEdit languageEdit | , Singleton: AbstractFactoryWithSingleton.LanguageFont | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageFont languagefont | , Singleton: AbstractFactoryWithSingleton.LanguageSpellchecker | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageSpellchecker languageSpellchecker | , Singleton: AbstractFactoryWithSingleton.LanguageThesaurus | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageThesaurus languageThesaurus | ]', 'C:\\Users\\Natasha Khan\\Desktop\\TestFolder'),
(8, 218, '[Context: AbstractFactoryWithSingleton.LanguageEdit | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageFont | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageSpellchecker | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageThesaurus | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | ]', 'C:\\Users\\Natasha Khan\\Desktop\\TestFolder'),
(3, 219, '[Singleton: AbstractFactoryWithSingleton.LanguageEdit | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageEdit languageEdit | , Singleton: AbstractFactoryWithSingleton.LanguageFont | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageFont languagefont | , Singleton: AbstractFactoryWithSingleton.LanguageSpellchecker | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageSpellchecker languageSpellchecker | , Singleton: AbstractFactoryWithSingleton.LanguageThesaurus | uniqueInstance: public static AbstractFactoryWithSingleton.LanguageThesaurus languageThesaurus | ]', 'G:\\DP Project last phase\\TestFolder'),
(8, 220, '[Context: AbstractFactoryWithSingleton.LanguageEdit | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageFont | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageSpellchecker | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | , Context: AbstractFactoryWithSingleton.LanguageThesaurus | State/Strategy: AbstractFactoryWithSingleton.EditConfigurations | ]', 'G:\\DP Project last phase\\TestFolder'),
(3, 221, '[Singleton: com.javacodegeeks.patterns.singletonpattern.Singleton | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.Singleton sc | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletonEager | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.SingletonEager sc | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletoneEnum$SingleEnum | uniqueInstance: public static com.javacodegeeks.patterns.singletonpattern.SingletoneEnum$SingleEnum SINGLETON_ENUM | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletonLazy | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.SingletonLazy sc | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletonLazyDoubleCheck | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.SingletonLazyDoubleCheck sc | , Singleton: com.javacodegeeks.patterns.singletonpattern.SingletonLazyMultithreaded | uniqueInstance: private static com.javacodegeeks.patterns.singletonpattern.SingletonLazyMultithreaded sc | ]', 'C:\\Users\\Natasha Khan\\Downloads\\SingletonPattern-Project'),
(2, 222, '[Client: jlex.SparseBitSet | Prototype: jlex.SparseBitSet$BinOp | ]', 'C:\\Users\\Natasha Khan\\Downloads\\jexcelapi_2_6_12'),
(8, 223, '[Context: jlex.SparseBitSet | State/Strategy: jlex.SparseBitSet$BinOp | ]', 'C:\\Users\\Natasha Khan\\Downloads\\jexcelapi_2_6_12');

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
  MODIFY `keywordID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `domaintopics`
--
ALTER TABLE `domaintopics`
  MODIFY `topicID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `file_directory`
--
ALTER TABLE `file_directory`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
--
-- AUTO_INCREMENT for table `lookupwords`
--
ALTER TABLE `lookupwords`
  MODIFY `WordId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
--
-- AUTO_INCREMENT for table `patterninstance`
--
ALTER TABLE `patterninstance`
  MODIFY `patternInstanceID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;
--
-- AUTO_INCREMENT for table `patterns`
--
ALTER TABLE `patterns`
  MODIFY `patternID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
