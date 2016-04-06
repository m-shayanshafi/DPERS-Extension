-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2016 at 01:10 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pattern_instance`
--

INSERT INTO `pattern_instance` (`PatternInstanceID`, `PatternID`, `ProjectID`, `ProjectPath`, `MetaData`) VALUES
(1, 1, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Creator: net.sf.bloodball.gameflow.test.ActionStateTest | FactoryMethod(): net.sf.bloodball.gameflow.test.ActionStateTest::getActionState(net.sf.bloodball.gameflow.GameFlowController):net.sf.bloodball.gameflow.State | '),
(2, 1, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Creator: net.sf.bloodball.model.player.MoveMode | FactoryMethod(): net.sf.bloodball.model.player.MoveMode::getSuccessor():net.sf.bloodball.model.player.MoveMode | '),
(3, 1, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Creator: net.sf.bloodball.ModelFacade | FactoryMethod(): net.sf.bloodball.ModelFacade::getHomeTeam():net.sf.bloodball.model.player.Team | FactoryMethod(): net.sf.bloodball.ModelFacade::getGuestTeam():net.sf.bloodball.model.player.Team | '),
(4, 3, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Singleton: net.sf.bloodball.gameflow.EndTurnOperation | uniqueInstance: public static net.sf.bloodball.gameflow.EndTurnOperation END_TURN | uniqueInstance: public static net.sf.bloodball.gameflow.EndTurnOperation FINISH_BALL_SETUP | uniqueInstance: public static net.sf.bloodball.gameflow.EndTurnOperation FINISH_TEAM_SETUP | uniqueInstance: public static net.sf.bloodball.gameflow.EndTurnOperation PICK_UP_BALL | '),
(5, 3, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Singleton: net.sf.bloodball.gameflow.InTurnOperation | uniqueInstance: public static net.sf.bloodball.gameflow.InTurnOperation BLOCK_AFTER_MOVE | uniqueInstance: public static net.sf.bloodball.gameflow.InTurnOperation MOVE | uniqueInstance: public static net.sf.bloodball.gameflow.InTurnOperation HAND_OFF | uniqueInstance: public static net.sf.bloodball.gameflow.InTurnOperation SPRINT | uniqueInstance: public static net.sf.bloodball.gameflow.InTurnOperation EXTRA_MOVE | uniqueInstance: public static net.sf.bloodball.gameflow.InTurnOperation SELECT_ACTIVE_PLAYER | uniqueInstance: public static net.sf.bloodball.gameflow.InTurnOperation SET_UP_BALL | uniqueInstance: public static net.sf.bloodball.gameflow.InTurnOperation SET_UP_TEAM | uniqueInstance: public static net.sf.bloodball.gameflow.InTurnOperation SUBSTITUTE | '),
(6, 3, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Singleton: net.sf.bloodball.model.player.Health | uniqueInstance: public static net.sf.bloodball.model.player.Health OKAY | uniqueInstance: public static net.sf.bloodball.model.player.Health STUNNED | uniqueInstance: public static net.sf.bloodball.model.player.Health KO | uniqueInstance: public static net.sf.bloodball.model.player.Health INJURED | uniqueInstance: public static net.sf.bloodball.model.player.Health DEAD | '),
(7, 3, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Singleton: net.sf.bloodball.model.player.Player | uniqueInstance: public static net.sf.bloodball.model.player.Player NO_PLAYER | '),
(8, 3, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Singleton: net.sf.bloodball.model.player.PlayerType | uniqueInstance: public static net.sf.bloodball.model.player.PlayerType NO_TYPE | uniqueInstance: public static net.sf.bloodball.model.player.PlayerType LINEMAN | uniqueInstance: public static net.sf.bloodball.model.player.PlayerType BLITZER | uniqueInstance: public static net.sf.bloodball.model.player.PlayerType BLOCKER | uniqueInstance: public static net.sf.bloodball.model.player.PlayerType CATCHER | uniqueInstance: public static net.sf.bloodball.model.player.PlayerType THROWER | '),
(9, 3, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Singleton: net.sf.bloodball.model.player.Team | uniqueInstance: public static net.sf.bloodball.model.player.Team NO_TEAM | '),
(10, 3, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Singleton: net.sf.bloodball.view.AboutDialog | uniqueInstance: private static net.sf.bloodball.view.AboutDialog instance | '),
(11, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adapter/ConcreteCommand: net.sf.bloodball.GameController | Adaptee/Receiver: net.sf.bloodball.gameflow.GameFlowController | Request()/Execute(): net.sf.bloodball.GameController::endTurnOperationChanged():void | Request()/Execute(): net.sf.bloodball.GameController::inTurnOperationChanged():void | '),
(12, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adapter/ConcreteCommand: net.sf.bloodball.GameController | Adaptee/Receiver: net.sf.bloodball.view.GameBoard | Request()/Execute(): net.sf.bloodball.GameController::touchdownScored():void | Request()/Execute(): net.sf.bloodball.GameController::dugOutPositionActivated(net.sf.bloodball.model.player.Team, int):void | Request()/Execute(): net.sf.bloodball.GameController::dugOutPositionDeactivated(net.sf.bloodball.model.player.Team, int):void | Request()/Execute(): net.sf.bloodball.GameController::squareContentChanged(java.awt.Point):void | Request()/Execute(): net.sf.bloodball.GameController::dugOutContentChanged(net.sf.bloodball.model.player.Team, int):void | '),
(13, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adapter/ConcreteCommand: net.sf.bloodball.GameController | Adaptee/Receiver: net.sf.bloodball.view.MainFrame | Request()/Execute(): net.sf.bloodball.GameController::touchdownScored():void | Request()/Execute(): net.sf.bloodball.GameController::endTurnOperationChanged():void | Request()/Execute(): net.sf.bloodball.GameController::inTurnOperationChanged():void | '),
(14, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adapter/ConcreteCommand: net.sf.bloodball.GameController | Adaptee/Receiver: net.sf.bloodball.OperationMessages | Request()/Execute(): net.sf.bloodball.GameController::endTurnOperationChanged():void | Request()/Execute(): net.sf.bloodball.GameController::inTurnOperationChanged():void | '),
(15, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adaptee/Receiver: net.sf.bloodball.model.actions.Setup | Adapter/ConcreteCommand: net.sf.bloodball.gameflow.SetupBallState | Request()/Execute(): net.sf.bloodball.gameflow.SetupBallState::squareChoosen(java.awt.Point):void | '),
(16, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adaptee/Receiver: net.sf.bloodball.model.actions.Substitution | Adapter/ConcreteCommand: net.sf.bloodball.gameflow.SubstitutionState | Request()/Execute(): net.sf.bloodball.gameflow.SubstitutionState::squareChoosen(java.awt.Point):void | '),
(17, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adaptee/Receiver: net.sf.bloodball.OperationMessages | Adapter/ConcreteCommand: net.sf.bloodball.OperationMessages$1 | Request()/Execute(): net.sf.bloodball.OperationMessages$1::buildMessage(net.sf.bloodball.model.Game):java.lang.String | '),
(18, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adaptee/Receiver: net.sf.bloodball.OperationMessages | Adapter/ConcreteCommand: net.sf.bloodball.OperationMessages$3 | Request()/Execute(): net.sf.bloodball.OperationMessages$3::buildMessage(net.sf.bloodball.model.Game):java.lang.String | '),
(19, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adaptee/Receiver: net.sf.bloodball.OperationMessages | Adapter/ConcreteCommand: net.sf.bloodball.OperationMessages$4 | Request()/Execute(): net.sf.bloodball.OperationMessages$4::buildMessage(net.sf.bloodball.model.Game):java.lang.String | '),
(20, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adaptee/Receiver: net.sf.bloodball.gameflow.GameFlowController | Adapter/ConcreteCommand: net.sf.bloodball.ModelFacadeImplementation | Request()/Execute(): net.sf.bloodball.ModelFacadeImplementation::isPlayerActiveAt(java.awt.Point):boolean | Request()/Execute(): net.sf.bloodball.ModelFacadeImplementation::isPlayerActive(net.sf.bloodball.model.player.Player):boolean | '),
(21, 4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Adaptee/Receiver: net.sf.bloodball.gameflow.GameFlowController | Adapter/ConcreteCommand: net.sf.bloodball.GameBoardController | Request()/Execute(): net.sf.bloodball.GameBoardController::rightClick():void | Request()/Execute(): net.sf.bloodball.GameBoardController::leftClick(java.awt.Point):void | Request()/Execute(): net.sf.bloodball.GameBoardController::dugOutClicked(net.sf.bloodball.model.player.Team, int):void | '),
(22, 8, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Context: net.sf.bloodball.gameflow.GameFlowController | State/Strategy: net.sf.bloodball.gameflow.State | '),
(23, 8, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Context: net.sf.bloodball.model.Notifier | State/Strategy: net.sf.bloodball.model.ModelListener | '),
(24, 8, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Context: net.sf.bloodball.OperationMessages | State/Strategy: net.sf.bloodball.MessageBuilder | '),
(25, 8, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Context: net.sf.bloodball.view.GameBoard | State/Strategy: net.sf.bloodball.ModelFacade | '),
(26, 8, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Context: net.sf.bloodball.gameflow.MoveActionState | State/Strategy: net.sf.bloodball.gameflow.State | '),
(27, 8, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'Context: net.sf.bloodball.gameflow.MoveActionState | State/Strategy: net.sf.bloodball.model.actions.MoveAction | '),
(28, 9, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'AbstractClass: net.sf.bloodball.gameflow.test.ActionStateTest | TemplateMethod(): net.sf.bloodball.gameflow.test.ActionStateTest::setUp():void | '),
(29, 9, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'AbstractClass: net.sf.bloodball.model.actions.MoveAction | TemplateMethod(): net.sf.bloodball.model.actions.MoveAction::ensureLegalPosition(java.awt.Point, java.awt.Point, java.lang.String):void | '),
(30, 9, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'AbstractClass: net.sf.bloodball.model.player.CountPlayerMethod | TemplateMethod(): net.sf.bloodball.model.player.CountPlayerMethod::doWithPlayer(net.sf.bloodball.model.player.Player):void | '),
(31, 9, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'AbstractClass: net.sf.bloodball.model.player.MoveMode | TemplateMethod(): net.sf.bloodball.model.player.MoveMode::getSquaresToGo():int | TemplateMethod(): net.sf.bloodball.model.player.MoveMode::move():void | '),
(32, 2, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'Client: backend.DCLocalGameEnv | Prototype: backend.DCGameBoard | Operation(): backend.DCLocalGameEnv::putsKingInCheck(main.DCMove):boolean | Operation(): backend.DCLocalGameEnv::isMate(int):boolean | '),
(33, 4, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'Adaptee/Receiver: connectivity.DCMessageableList | Adapter/ConcreteCommand: connectivity.DCGame | Request()/Execute(): connectivity.DCGame::sendMessage(connectivity.DCMessage):void | '),
(34, 4, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'Adapter/ConcreteCommand: connectivity.DCLocalConnection | Adaptee/Receiver: main.DCFrontEnd | Request()/Execute(): connectivity.DCLocalConnection::sendMessage(connectivity.DCMessage):void | '),
(35, 8, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'Context: connectivity.DCLocalConnection | State/Strategy: main.DCFrontEnd | '),
(36, 11, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'Proxy: connectivity.DCLocalConnection | RealSubject: connectivity.DCGame | Request(): connectivity.DCLocalConnection::sendMessage(connectivity.DCMessage):void | '),
(37, 11, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'Proxy: connectivity.DCNetworkConnection | RealSubject: connectivity.DCGame | Request(): connectivity.DCNetworkConnection::sendMessage(connectivity.DCMessage):void | '),
(38, 11, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'Proxy: connectivity.DCGame | RealSubject: backend.DCGameEnv | Request(): connectivity.DCGame::sendMessage(connectivity.DCMessage):void | '),
(39, 11, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'Proxy: backend.DCLocalGameEnv | RealSubject: backend.DCBackEndDecoder | Request(): backend.DCLocalGameEnv::sendMessage(connectivity.DCMessage):void | '),
(40, 3, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'Singleton: fruitwar.util.FileUtil | uniqueInstance: private static fruitwar.util.FileUtil instance | '),
(41, 3, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'Singleton: fruitwar.web.server.ServerInfo | uniqueInstance: private static fruitwar.web.server.ServerInfo instance | '),
(42, 3, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'Singleton: fruitwar.web.server.tempauthutil.AuthUtil | uniqueInstance: private static fruitwar.web.server.tempauthutil.AuthUtil instance | '),
(43, 4, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'Adaptee/Receiver: fruitwar.sample.test.Test_InnerClass$InnerHelper2 | Adapter/ConcreteCommand: fruitwar.sample.test.Test_InnerClass | Request()/Execute(): fruitwar.sample.test.Test_InnerClass::strategy(fruitwar.IFruitThrower[]):void | '),
(44, 6, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'Component: fruitwar.IFruitThrower | Decorator: fruitwar.core.FruitThrowerProxy | component: private fruitwar.IFruitThrower peer | Operation(): fruitwar.core.FruitThrowerProxy::getCowardCount():int | Operation(): fruitwar.core.FruitThrowerProxy::getPosition():int | Operation(): fruitwar.core.FruitThrowerProxy::hide():void | Operation(): fruitwar.core.FruitThrowerProxy::throwAt(int):void | Operation(): fruitwar.core.FruitThrowerProxy::getHP():int | '),
(45, 8, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'State/Strategy: fruitwar.IFruitWarRobot | Context: fruitwar.core.RobotRunner$WorkerThread | '),
(46, 9, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'AbstractClass: fruitwar.util.FileUtil | TemplateMethod(): fruitwar.util.FileUtil::move(java.lang.String, java.lang.String):boolean | TemplateMethod(): fruitwar.util.FileUtil::copy(java.lang.String, java.lang.String):boolean | TemplateMethod(): fruitwar.util.FileUtil::cleanDirFiles(java.lang.String):boolean | '),
(47, 9, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'AbstractClass: fruitwar.web.MyServletBase | TemplateMethod(): fruitwar.web.MyServletBase::doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse):void | '),
(48, 9, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'AbstractClass: fruitwar.web.server.tempauthutil.AuthUtil | TemplateMethod(): fruitwar.web.server.tempauthutil.AuthUtil::swapToRestrictedUser():void | TemplateMethod(): fruitwar.web.server.tempauthutil.AuthUtil::swapToServerUser():void | TemplateMethod(): fruitwar.web.server.tempauthutil.AuthUtil::isExpired():boolean | ');

-- --------------------------------------------------------

--
-- Table structure for table `pattern_instance_class`
--

CREATE TABLE IF NOT EXISTS `pattern_instance_class` (
  `PatternInstanceClassID` int(11) NOT NULL,
  `PatternInstanceID` int(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL COMMENT 'Element Name'
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pattern_instance_class`
--

INSERT INTO `pattern_instance_class` (`PatternInstanceClassID`, `PatternInstanceID`, `Name`, `Role`) VALUES
(1, 3, 'net.sf.bloodball.gameflow.test.ActionStateTest', 'Creator'),
(2, 10, 'net.sf.bloodball.gameflow.EndTurnOperation', 'Singleton'),
(3, 10, 'public static net.sf.bloodball.gameflow.EndTurnOperation END_TURN', 'uniqueInstance'),
(4, 10, 'public static net.sf.bloodball.gameflow.EndTurnOperation FINISH_BALL_SETUP', 'uniqueInstance'),
(5, 10, 'public static net.sf.bloodball.gameflow.EndTurnOperation FINISH_TEAM_SETUP', 'uniqueInstance'),
(6, 10, 'public static net.sf.bloodball.gameflow.EndTurnOperation PICK_UP_BALL', 'uniqueInstance'),
(7, 10, 'net.sf.bloodball.gameflow.InTurnOperation', 'Singleton'),
(8, 10, 'public static net.sf.bloodball.gameflow.InTurnOperation BLOCK_AFTER_MOVE', 'uniqueInstance'),
(9, 10, 'public static net.sf.bloodball.gameflow.InTurnOperation MOVE', 'uniqueInstance'),
(10, 10, 'public static net.sf.bloodball.gameflow.InTurnOperation HAND_OFF', 'uniqueInstance'),
(11, 10, 'public static net.sf.bloodball.gameflow.InTurnOperation SPRINT', 'uniqueInstance'),
(12, 10, 'public static net.sf.bloodball.gameflow.InTurnOperation EXTRA_MOVE', 'uniqueInstance'),
(13, 10, 'public static net.sf.bloodball.gameflow.InTurnOperation SELECT_ACTIVE_PLAYER', 'uniqueInstance'),
(14, 10, 'public static net.sf.bloodball.gameflow.InTurnOperation SET_UP_BALL', 'uniqueInstance'),
(15, 10, 'public static net.sf.bloodball.gameflow.InTurnOperation SET_UP_TEAM', 'uniqueInstance'),
(16, 10, 'public static net.sf.bloodball.gameflow.InTurnOperation SUBSTITUTE', 'uniqueInstance'),
(17, 10, 'net.sf.bloodball.model.player.Health', 'Singleton'),
(18, 10, 'public static net.sf.bloodball.model.player.Health OKAY', 'uniqueInstance'),
(19, 10, 'public static net.sf.bloodball.model.player.Health STUNNED', 'uniqueInstance'),
(20, 10, 'public static net.sf.bloodball.model.player.Health KO', 'uniqueInstance'),
(21, 10, 'public static net.sf.bloodball.model.player.Health INJURED', 'uniqueInstance'),
(22, 10, 'public static net.sf.bloodball.model.player.Health DEAD', 'uniqueInstance'),
(23, 10, 'net.sf.bloodball.model.player.Player', 'Singleton'),
(24, 10, 'public static net.sf.bloodball.model.player.Player NO_PLAYER', 'uniqueInstance'),
(25, 10, 'net.sf.bloodball.model.player.PlayerType', 'Singleton'),
(26, 10, 'public static net.sf.bloodball.model.player.PlayerType NO_TYPE', 'uniqueInstance'),
(27, 10, 'public static net.sf.bloodball.model.player.PlayerType LINEMAN', 'uniqueInstance'),
(28, 10, 'public static net.sf.bloodball.model.player.PlayerType BLITZER', 'uniqueInstance'),
(29, 10, 'public static net.sf.bloodball.model.player.PlayerType BLOCKER', 'uniqueInstance'),
(30, 10, 'public static net.sf.bloodball.model.player.PlayerType CATCHER', 'uniqueInstance'),
(31, 10, 'public static net.sf.bloodball.model.player.PlayerType THROWER', 'uniqueInstance'),
(32, 10, 'net.sf.bloodball.model.player.Team', 'Singleton'),
(33, 10, 'public static net.sf.bloodball.model.player.Team NO_TEAM', 'uniqueInstance'),
(34, 10, 'net.sf.bloodball.view.AboutDialog', 'Singleton'),
(35, 10, 'private static net.sf.bloodball.view.AboutDialog instance', 'uniqueInstance'),
(36, 21, 'net.sf.bloodball.GameController', 'Adapter/ConcreteCommand'),
(37, 21, 'net.sf.bloodball.gameflow.GameFlowController', 'Adaptee/Receiver'),
(38, 27, 'net.sf.bloodball.gameflow.GameFlowController', 'Context'),
(39, 27, 'net.sf.bloodball.gameflow.State', 'State/Strategy'),
(40, 27, 'net.sf.bloodball.model.Notifier', 'Context'),
(41, 27, 'net.sf.bloodball.model.ModelListener', 'State/Strategy'),
(42, 27, 'net.sf.bloodball.OperationMessages', 'Context'),
(43, 27, 'net.sf.bloodball.MessageBuilder', 'State/Strategy'),
(44, 27, 'net.sf.bloodball.view.GameBoard', 'Context'),
(45, 27, 'net.sf.bloodball.ModelFacade', 'State/Strategy'),
(46, 27, 'net.sf.bloodball.gameflow.MoveActionState', 'Context'),
(47, 27, 'net.sf.bloodball.gameflow.State', 'State/Strategy'),
(48, 27, 'net.sf.bloodball.gameflow.MoveActionState', 'Context'),
(49, 27, 'net.sf.bloodball.model.actions.MoveAction', 'State/Strategy'),
(50, 31, 'net.sf.bloodball.gameflow.test.ActionStateTest', 'AbstractClass'),
(51, 32, 'backend.DCLocalGameEnv', 'Client'),
(52, 32, 'backend.DCGameBoard', 'Prototype'),
(53, 34, 'connectivity.DCMessageableList', 'Adaptee/Receiver'),
(54, 34, 'connectivity.DCGame', 'Adapter/ConcreteCommand'),
(55, 35, 'connectivity.DCLocalConnection', 'Context'),
(56, 35, 'main.DCFrontEnd', 'State/Strategy'),
(57, 39, 'connectivity.DCLocalConnection', 'Proxy'),
(58, 39, 'connectivity.DCGame', 'RealSubject'),
(59, 42, 'fruitwar.util.FileUtil', 'Singleton'),
(60, 42, 'private static fruitwar.util.FileUtil instance', 'uniqueInstance'),
(61, 42, 'fruitwar.web.server.ServerInfo', 'Singleton'),
(62, 42, 'private static fruitwar.web.server.ServerInfo instance', 'uniqueInstance'),
(63, 42, 'fruitwar.web.server.tempauthutil.AuthUtil', 'Singleton'),
(64, 42, 'private static fruitwar.web.server.tempauthutil.AuthUtil instance', 'uniqueInstance'),
(65, 43, 'fruitwar.sample.test.Test_InnerClass$InnerHelper2', 'Adaptee/Receiver'),
(66, 43, 'fruitwar.sample.test.Test_InnerClass', 'Adapter/ConcreteCommand'),
(67, 44, 'fruitwar.IFruitThrower', 'Component'),
(68, 44, 'fruitwar.core.FruitThrowerProxy', 'Decorator'),
(69, 44, 'private fruitwar.IFruitThrower peer', 'component'),
(70, 45, 'fruitwar.IFruitWarRobot', 'State/Strategy'),
(71, 45, 'fruitwar.core.RobotRunner$WorkerThread', 'Context'),
(72, 48, 'fruitwar.util.FileUtil', 'AbstractClass');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ProjectID`, `Path`, `CategoryID`, `Description`, `Name`) VALUES
(1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', NULL, NULL, 'BloodBall'),
(2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', NULL, NULL, 'DragonChess'),
(3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', NULL, NULL, 'FruitWar');

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
  `Name` varchar(100) NOT NULL,
  `Proportion` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `project_domain_keywords`
--

INSERT INTO `project_domain_keywords` (`KeywordID`, `ProjectID`, `Path`, `StemmedName`, `Name`, `Proportion`) VALUES
(1, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'init', 'init', 12),
(2, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'stun', 'stunned', 11),
(3, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'guest', 'guest', 11),
(4, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'pane', 'pane', 9),
(5, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'check', 'check', 6),
(6, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'reach', 'reach', 6),
(7, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'spieler', 'spieler', 5),
(8, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'load', 'load', 5),
(9, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'ten', 'ten', 5),
(10, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'neighbor', 'neighbors', 5),
(11, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'teamteam', 'teamteams', 6),
(12, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'throwsquar', 'throwsquare', 5),
(13, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'reactor', 'reactor', 3),
(14, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'win', 'win', 2),
(15, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'ridg', 'ridge', 2),
(16, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'teamgam', 'teamgame', 2),
(17, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'blue', 'blue', 2),
(18, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'center', 'center', 2),
(19, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'execut', 'execute', 2),
(20, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'click', 'click', 2),
(21, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'dice', 'dices', 14),
(22, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'reserv', 'reserve', 10),
(23, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'icon', 'icon', 9),
(24, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'dead', 'dead', 6),
(25, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'regular', 'regular', 6),
(26, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'incit', 'incite', 5),
(27, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'statu', 'status', 5),
(28, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'content', 'content', 5),
(29, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'splash', 'splash', 5),
(30, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'recoveri', 'recovery', 4),
(31, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'chooser', 'chooser', 14),
(32, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'offens', 'offensive', 9),
(33, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'titl', 'title', 6),
(34, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'prone', 'prone', 6),
(35, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'successor', 'successor', 5),
(36, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'true!control', 'true!controller', 5),
(37, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'zoneposit', 'zoneposition', 4),
(38, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'inact', 'inactive', 4),
(39, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'fourteen', 'fourteen', 4),
(40, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'full', 'full', 4),
(41, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'turn', 'turn', 276),
(42, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'oper', 'operation', 187),
(43, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'setup', 'setup', 176),
(44, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'action', 'action', 113),
(45, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'model', 'model', 101),
(46, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'zone', 'zone', 100),
(47, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'number', 'number', 80),
(48, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'board', 'board', 75),
(49, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'messag', 'message', 60),
(50, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'health', 'health', 56),
(51, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'player', 'player', 1183),
(52, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'team', 'team', 691),
(53, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'game', 'game', 521),
(54, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'squar', 'square', 461),
(55, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'posit', 'position', 403),
(56, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'test', 'test', 392),
(57, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'ball', 'ball', 324),
(58, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'home', 'home', 265),
(59, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'state', 'state', 233),
(60, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'move', 'move', 233),
(61, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'reserv', 'reserve', 8),
(62, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'descript', 'description', 7),
(63, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'blood', 'blood', 7),
(64, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'content', 'contents', 6),
(65, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'fail', 'failed', 6),
(66, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'substitut', 'substitute', 6),
(67, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'ensur', 'ensuring', 6),
(68, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'facad', 'facade', 6),
(69, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'zum', 'zum', 5),
(70, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'block', 'blocked', 5),
(71, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'actor', 'actor', 27),
(72, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'extra', 'extra', 26),
(73, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'button', 'button', 23),
(74, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'height', 'height', 22),
(75, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'begin', 'begin', 19),
(76, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'illeg', 'illegal', 15),
(77, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'injur', 'injured', 15),
(78, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'expect', 'expected', 15),
(79, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'legalsquar', 'legalsquare', 14),
(80, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'act', 'acted', 14),
(81, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'succeed', 'succeeded', 8),
(82, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'kei', 'keys', 7),
(83, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'init', 'init', 6),
(84, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'choosensquar', 'choosensquare', 6),
(85, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'score', 'scored', 5),
(86, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'posit', 'position', 5),
(87, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'licens', 'license', 4),
(88, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'roll', 'roll', 4),
(89, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'positionposit', 'positionposition', 4),
(90, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'player', 'players', 4),
(91, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'method', 'methods', 10),
(92, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'graphic', 'graphics', 9),
(93, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'changesquar', 'changesquare', 9),
(94, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'spiel', 'spiel', 8),
(95, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'action', 'actions', 8),
(96, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'legal', 'legal', 7),
(97, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'counter', 'counter', 6),
(98, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'success', 'successful', 6),
(99, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'true!mov', 'true!move', 6),
(100, 1, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\BloodBall', 'bar', 'bar', 6),
(101, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'player', 'player', 798),
(102, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'messag', 'message', 575),
(103, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'move', 'move', 564),
(104, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'param', 'param', 432),
(105, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'unblock', 'unblockable', 352),
(106, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'connect', 'connection', 247),
(107, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'coord', 'coord', 237),
(108, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'softwar', 'software', 195),
(109, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'send', 'send', 184),
(110, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'button', 'button', 183),
(111, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'restor', 'restored', 13),
(112, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'addgold', 'addgold', 8),
(113, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'histori', 'history', 8),
(114, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'outencod', 'outencoder', 5),
(115, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'ructor', 'ructor', 5),
(116, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'note', 'note', 4),
(117, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'command', 'command', 4),
(118, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'rout', 'route', 4),
(119, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'make', 'make', 4),
(120, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'constant', 'constants', 4),
(121, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'intf', 'intf', 10),
(122, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'reason', 'reason', 9),
(123, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'object', 'object', 9),
(124, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'action', 'action', 7),
(125, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'piecetar', 'piecetar', 7),
(126, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'comm', 'comm', 6),
(127, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'properti', 'properties', 6),
(128, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'send', 'send', 6),
(129, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'choos', 'choose', 5),
(130, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'orig', 'orig', 5),
(131, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'close', 'close', 9),
(132, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'thief', 'thief', 9),
(133, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'scroll', 'scroll', 8),
(134, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'put', 'put', 8),
(135, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'basilisk', 'basilisk', 7),
(136, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'locat', 'location', 6),
(137, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'standard', 'standard', 5),
(138, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'mean', 'means', 5),
(139, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'argv', 'argv', 4),
(140, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'cancel', 'cancel', 4),
(141, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'width', 'width', 14),
(142, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'pieceloc', 'piecelocation', 9),
(143, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'hierarchi', 'hierarchy', 7),
(144, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'edit', 'edit', 6),
(145, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'fin', 'fin', 6),
(146, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'addscarlet', 'addscarlet', 5),
(147, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'item', 'item', 5),
(148, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'descr', 'descr', 4),
(149, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'gener', 'generated', 4),
(150, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'ccc', 'ccc', 4),
(151, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'piec', 'piece', 900),
(152, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'game', 'game', 455),
(153, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'type', 'type', 231),
(154, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'msg', 'msg', 222),
(155, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'licens', 'license', 203),
(156, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'button', 'button', 110),
(157, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'gui', 'gui', 110),
(158, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'action', 'action', 105),
(159, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'free', 'free', 104),
(160, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'layout', 'layout', 89),
(161, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'ing', 'ing', 11),
(162, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'power', 'power', 7),
(163, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'node', 'node', 5),
(164, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'decemb', 'december', 5),
(165, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'receiv', 'receive', 5),
(166, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'connect', 'connectivity', 5),
(167, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'oct', 'oct', 5),
(168, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'addnam', 'addname', 4),
(169, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'layoutp', 'layoutp', 4),
(170, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'pars', 'parsing', 4),
(171, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'garbag', 'garbage', 43),
(172, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'outencod', 'outencoder', 32),
(173, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'capt', 'capt', 30),
(174, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'gridx', 'gridx', 26),
(175, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'model', 'model', 24),
(176, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'mate', 'mate', 16),
(177, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'opt', 'opt', 13),
(178, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'i', 'ied', 12),
(179, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'cmd', 'cmd', 11),
(180, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'axi', 'axis', 10),
(181, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'constant', 'constants', 828),
(182, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'board', 'board', 629),
(183, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'tar', 'tar', 523),
(184, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'locat', 'location', 501),
(185, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'process', 'process', 389),
(186, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'player', 'player', 256),
(187, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'gener', 'general', 237),
(188, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'gold', 'gold', 217),
(189, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'gnu', 'gnu', 194),
(190, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'color', 'color', 187),
(191, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'occupi', 'occupying', 10),
(192, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'area', 'area', 10),
(193, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'gridwidth', 'gridwidth', 9),
(194, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'promot', 'promotion', 9),
(195, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'integerplay', 'integerplayer', 8),
(196, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'knight-lik', 'knight-like', 7),
(197, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'demot', 'demote', 7),
(198, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'spec', 'spec', 7),
(199, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'socket', 'socket', 6),
(200, 2, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\DragonChess', 'decod', 'decoder', 6),
(201, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'sync', 'sync', 6),
(202, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'properti', 'properties', 5),
(203, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'scope', 'scope', 4),
(204, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'exist', 'exist', 4),
(205, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'stream', 'stream', 4),
(206, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'runtim', 'runtime', 4),
(207, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'raint', 'raints', 3),
(208, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'prepar', 'prepare', 3),
(209, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'calc', 'calc', 3),
(210, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'style', 'style', 3),
(211, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'max', 'max', 24),
(212, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'quit', 'quit', 15),
(213, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'queri', 'query', 15),
(214, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'stack', 'stack', 15),
(215, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'exec', 'exec', 13),
(216, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'nbsp', 'nbsp', 12),
(217, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'head', 'head', 11),
(218, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'mod', 'mod', 8),
(219, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'tabl', 'table', 8),
(220, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'item', 'item', 8),
(221, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'secur', 'security', 5),
(222, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'stream', 'stream', 5),
(223, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'arrang', 'arrange', 4),
(224, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'updat', 'update', 4),
(225, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'add', 'add', 4),
(226, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'name', 'names', 4),
(227, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'max', 'max', 4),
(228, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'covertava', 'covertava', 3),
(229, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'upload', 'uploaded', 3),
(230, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'auto', 'auto', 3),
(231, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'hashtabl', 'hashtable', 6),
(232, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'convert', 'convert', 6),
(233, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'request', 'request', 5),
(234, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'append', 'append', 5),
(235, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'context', 'context', 4),
(236, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'center', 'center', 4),
(237, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'compil', 'compile', 4),
(238, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'ldap', 'ldap', 3),
(239, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'minut', 'minute', 3),
(240, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'regist', 'registering', 3),
(241, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'stream', 'stream', 11),
(242, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'color', 'color', 6),
(243, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'stub', 'stub', 5),
(244, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'pattern', 'pattern', 5),
(245, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'info', 'info', 5),
(246, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'dest', 'dest', 4),
(247, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'make', 'make', 4),
(248, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'chang', 'change', 4),
(249, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'ldap:bluepag', 'ldap:bluepages', 3),
(250, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'pkg', 'pkgs', 3),
(251, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'content', 'content', 10),
(252, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'oper', 'operation', 8),
(253, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'enabl', 'enable', 8),
(254, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'ext', 'ext', 7),
(255, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'cname', 'cname', 6),
(256, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'robotrobot', 'robotrobot', 5),
(257, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'val', 'val', 5),
(258, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'date', 'date', 5),
(259, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'view', 'view', 5),
(260, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'titl', 'title', 5),
(261, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'score', 'score', 5),
(262, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'enabl', 'enable', 4),
(263, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'stop', 'stopped', 3),
(264, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'point', 'points', 3),
(265, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'type', 'type', 3),
(266, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'fi', 'fis', 2),
(267, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'quot', 'quot', 2),
(268, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'ton', 'ton', 2),
(269, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'match', 'matches', 2),
(270, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'declar', 'declaration', 2),
(271, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'thread', 'thread', 6),
(272, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'rdr', 'rdr', 5),
(273, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'client', 'client', 5),
(274, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'disabl', 'disable', 5),
(275, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'idl', 'idle', 5),
(276, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'canon', 'canonical', 5),
(277, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'lower', 'lower', 4),
(278, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'len', 'len', 4),
(279, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'fo', 'fos', 4),
(280, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'retriev', 'retrieve', 4),
(281, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'battl', 'battle', 389),
(282, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'server', 'server', 254),
(283, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'prop', 'prop', 125),
(284, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'base', 'base', 67),
(285, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'author', 'author', 63),
(286, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'daemon', 'daemon', 58),
(287, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'util', 'util', 54),
(288, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'delet', 'delete', 52),
(289, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'histori', 'history', 50),
(290, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'http', 'http', 47),
(291, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'robot', 'robot', 675),
(292, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'buf', 'buf', 295),
(293, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'result', 'result', 226),
(294, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'append', 'append', 209),
(295, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'fruit', 'fruit', 145),
(296, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'count', 'count', 137),
(297, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'team', 'team', 129),
(298, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'time', 'time', 126),
(299, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'action', 'action', 106),
(300, 3, 'C:\\Users\\Zohaa Qamar\\Desktop\\Projects for Repo Building\\FruitWar', 'log', 'log', 103);

-- --------------------------------------------------------

--
-- Table structure for table `project_domain_topics`
--

CREATE TABLE IF NOT EXISTS `project_domain_topics` (
  `TopicID` int(100) NOT NULL,
  `ProjectID` int(100) NOT NULL,
  `Contribution` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `project_domain_topics`
--

INSERT INTO `project_domain_topics` (`TopicID`, `ProjectID`, `Contribution`) VALUES
(1, 1, '0.018'),
(2, 1, '0.006'),
(3, 1, '0.017'),
(4, 1, '0.014'),
(5, 1, '0.208'),
(6, 1, '0.636'),
(7, 1, '0.016'),
(8, 1, '0.053'),
(9, 1, '0.012'),
(10, 1, '0.018'),
(11, 2, '0.315'),
(12, 2, '0.009'),
(13, 2, '0.013'),
(14, 2, '0.011'),
(15, 2, '0.01'),
(16, 2, '0.222'),
(17, 2, '0.01'),
(18, 2, '0.025'),
(19, 2, '0.37'),
(20, 2, '0.014'),
(21, 3, '0.014'),
(22, 3, '0.045'),
(23, 3, '0.014'),
(24, 3, '0.015'),
(25, 3, '0.019'),
(26, 3, '0.024'),
(27, 3, '0.012'),
(28, 3, '0.021'),
(29, 3, '0.26'),
(30, 3, '0.576');

-- --------------------------------------------------------

--
-- Table structure for table `topic_keywords`
--

CREATE TABLE IF NOT EXISTS `topic_keywords` (
  `TopicID` int(100) NOT NULL,
  `KeywordID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic_keywords`
--

INSERT INTO `topic_keywords` (`TopicID`, `KeywordID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(4, 31),
(4, 32),
(4, 33),
(4, 34),
(4, 35),
(4, 36),
(4, 37),
(4, 38),
(4, 39),
(4, 40),
(5, 41),
(5, 42),
(5, 43),
(5, 44),
(5, 45),
(5, 46),
(5, 47),
(5, 48),
(5, 49),
(5, 50),
(6, 51),
(6, 52),
(6, 53),
(6, 54),
(6, 55),
(6, 56),
(6, 57),
(6, 58),
(6, 59),
(6, 60),
(7, 61),
(7, 62),
(7, 63),
(7, 64),
(7, 65),
(7, 66),
(7, 67),
(7, 68),
(7, 69),
(7, 70),
(8, 71),
(8, 72),
(8, 73),
(8, 74),
(8, 75),
(8, 76),
(8, 77),
(8, 78),
(8, 79),
(8, 80),
(9, 81),
(9, 82),
(9, 83),
(9, 84),
(9, 85),
(9, 86),
(9, 87),
(9, 88),
(9, 89),
(9, 90),
(10, 91),
(10, 92),
(10, 93),
(10, 94),
(10, 95),
(10, 96),
(10, 97),
(10, 98),
(10, 99),
(10, 100),
(11, 101),
(11, 102),
(11, 103),
(11, 104),
(11, 105),
(11, 106),
(11, 107),
(11, 108),
(11, 109),
(11, 110),
(12, 111),
(12, 112),
(12, 113),
(12, 114),
(12, 115),
(12, 116),
(12, 117),
(12, 118),
(12, 119),
(12, 120),
(13, 121),
(13, 122),
(13, 123),
(13, 124),
(13, 125),
(13, 126),
(13, 127),
(13, 128),
(13, 129),
(13, 130),
(14, 131),
(14, 132),
(14, 133),
(14, 134),
(14, 135),
(14, 136),
(14, 137),
(14, 138),
(14, 139),
(14, 140),
(15, 141),
(15, 142),
(15, 143),
(15, 144),
(15, 145),
(15, 146),
(15, 147),
(15, 148),
(15, 149),
(15, 150),
(16, 151),
(16, 152),
(16, 153),
(16, 154),
(16, 155),
(16, 156),
(16, 157),
(16, 158),
(16, 159),
(16, 160),
(17, 161),
(17, 162),
(17, 163),
(17, 164),
(17, 165),
(17, 166),
(17, 167),
(17, 168),
(17, 169),
(17, 170),
(18, 171),
(18, 172),
(18, 173),
(18, 174),
(18, 175),
(18, 176),
(18, 177),
(18, 178),
(18, 179),
(18, 180),
(19, 181),
(19, 182),
(19, 183),
(19, 184),
(19, 185),
(19, 186),
(19, 187),
(19, 188),
(19, 189),
(19, 190),
(20, 191),
(20, 192),
(20, 193),
(20, 194),
(20, 195),
(20, 196),
(20, 197),
(20, 198),
(20, 199),
(20, 200),
(21, 201),
(21, 202),
(21, 203),
(21, 204),
(21, 205),
(21, 206),
(21, 207),
(21, 208),
(21, 209),
(21, 210),
(22, 211),
(22, 212),
(22, 213),
(22, 214),
(22, 215),
(22, 216),
(22, 217),
(22, 218),
(22, 219),
(22, 220),
(23, 221),
(23, 222),
(23, 223),
(23, 224),
(23, 225),
(23, 226),
(23, 227),
(23, 228),
(23, 229),
(23, 230),
(24, 231),
(24, 232),
(24, 233),
(24, 234),
(24, 235),
(24, 236),
(24, 237),
(24, 238),
(24, 239),
(24, 240),
(25, 241),
(25, 242),
(25, 243),
(25, 244),
(25, 245),
(25, 246),
(25, 247),
(25, 248),
(25, 249),
(25, 250),
(26, 251),
(26, 252),
(26, 253),
(26, 254),
(26, 255),
(26, 256),
(26, 257),
(26, 258),
(26, 259),
(26, 260),
(27, 261),
(27, 262),
(27, 263),
(27, 264),
(27, 265),
(27, 266),
(27, 267),
(27, 268),
(27, 269),
(27, 270),
(28, 271),
(28, 272),
(28, 273),
(28, 274),
(28, 275),
(28, 276),
(28, 277),
(28, 278),
(28, 279),
(28, 280),
(29, 281),
(29, 282),
(29, 283),
(29, 284),
(29, 285),
(29, 286),
(29, 287),
(29, 288),
(29, 289),
(29, 290),
(30, 291),
(30, 292),
(30, 293),
(30, 294),
(30, 295),
(30, 296),
(30, 297),
(30, 298),
(30, 299),
(30, 300);

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
  MODIFY `PatternInstanceID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `pattern_instance_class`
--
ALTER TABLE `pattern_instance_class`
  MODIFY `PatternInstanceClassID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `pattern_instance_method`
--
ALTER TABLE `pattern_instance_method`
  MODIFY `PatternInstanceMethodID` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `ProjectID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `project_category`
--
ALTER TABLE `project_category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `project_domain_keywords`
--
ALTER TABLE `project_domain_keywords`
  MODIFY `KeywordID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=301;
--
-- AUTO_INCREMENT for table `project_domain_topics`
--
ALTER TABLE `project_domain_topics`
  MODIFY `TopicID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
