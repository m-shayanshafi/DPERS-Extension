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
(1, 'Singleton', 'kw.sudoku.model.UpdateAction'),
(1, 'uniqueInstance', 'public static kw.sudoku.model.UpdateAction NEW_GAME'),
(1, 'uniqueInstance', 'public static kw.sudoku.model.UpdateAction CHECK'),
(1, 'uniqueInstance', 'public static kw.sudoku.model.UpdateAction SELECTED_NUMBER'),
(1, 'uniqueInstance', 'public static kw.sudoku.model.UpdateAction CANDIDATES'),
(1, 'uniqueInstance', 'public static kw.sudoku.model.UpdateAction HELP'),
(1, 'uniqueInstance', 'public static kw.sudoku.model.UpdateAction SHOW_SOLUTIONS'),
(2, 'Singleton', 'common.model.GameBoard$Cell'),
(2, 'uniqueInstance', 'public static common.model.GameBoard$Cell EMPTY'),
(2, 'uniqueInstance', 'public static common.model.GameBoard$Cell PLAYER1'),
(2, 'uniqueInstance', 'public static common.model.GameBoard$Cell PLAYER2'),
(3, 'Context', 'Chess.ChessComponent$MyDragAndDrop'),
(3, 'State/Strategy', 'Chess.ChessPiece'),
(5, 'Singleton', 'ChessGameKenai.ChessBoardView'),
(5, 'uniqueInstance', 'private static ChessGameKenai.ChessBoardView _instance'),
(5, 'Singleton', 'ChessGameKenai.Chess_Data'),
(5, 'uniqueInstance', 'private static ChessGameKenai.Chess_Data _instance'),
(6, 'Context', 'ChessGameKenai.ChessBoardView'),
(6, 'State/Strategy', 'ChessGameKenai.Board'),
(7, 'Singleton', 'ChessGameKenai.GameLoader'),
(7, 'uniqueInstance', 'private static ChessGameKenai.GameLoader _instance'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.LoadGameCommand'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.ChessBoardView'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.ClosePromptCommand'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.ChessBoardView'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.LoadFromFileCommand'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.ChessBoardView'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.NewGameCommand'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.ChessBoardView'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.NewGameWithComputer'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.ChessBoardView'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.RestartCommand'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.ChessBoardView'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.SaveAsCommand'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.ChessBoardView'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.SetPlayerNameCommand'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.ChessBoardView'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.Board'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.FlipBoardStrategy'),
(17, 'Adaptee/Receiver', 'ChessGameKenai.Board'),
(17, 'Adapter/ConcreteCommand', 'ChessGameKenai.NormalBoardStrategy'),
(20, 'Context', 'ChessGameKenai.Adapter'),
(20, 'State/Strategy', 'ChessGameKenai.Command'),
(20, 'Context', 'ChessGameKenai.ChessData'),
(20, 'State/Strategy', 'ChessGameKenai.NonVisualPiece'),
(20, 'Context', 'ChessGameKenai.Board'),
(20, 'State/Strategy', 'ChessGameKenai.IFlipStrategy'),
(21, 'AbstractClass', 'ChessGameKenai.NonVisualPiece'),
(22, 'State/Strategy', 'Character'),
(22, 'Context', 'DungeonMaster'),
(26, 'Singleton', 'kw.texasholdem.config.Action'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action SMALL_BLIND'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action BIG_BLIND'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action CHECK'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action CALL'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action BET'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action RAISE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action ALL_IN'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action FOLD'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action CONTINUE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action ALLOW_SAVE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action DISALLOW_SAVE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action SAVE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action CLOSE_IF_NEEDED'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action HIDE_PROFILE_LEFT_PANEL'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action RESET_ALL_PROFILE_LEFT_PANEL'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action UPDATE_LEFT_PLAYER_PANEL'),
(26, 'Singleton', 'kw.texasholdem.tool.HandValueType'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType ROYAL_FLUSH'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType STRAIGHT_FLUSH'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType FOUR_OF_A_KIND'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType FULL_HOUSE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType FLUSH'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType STRAIGHT'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType THREE_OF_A_KIND'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType TWO_PAIRS'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType ONE_PAIR'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType HIGH_CARD'),
(26, 'Singleton', 'kw.texasholdem.config.Action'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action SMALL_BLIND'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action BIG_BLIND'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action CHECK'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action CALL'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action BET'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action RAISE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action ALL_IN'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action FOLD'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action CONTINUE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action ALLOW_SAVE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action DISALLOW_SAVE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action SAVE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action CLOSE_IF_NEEDED'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action HIDE_PROFILE_LEFT_PANEL'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action RESET_ALL_PROFILE_LEFT_PANEL'),
(26, 'uniqueInstance', 'public static kw.texasholdem.config.Action UPDATE_LEFT_PLAYER_PANEL'),
(26, 'Singleton', 'kw.texasholdem.tool.HandValueType'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType ROYAL_FLUSH'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType STRAIGHT_FLUSH'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType FOUR_OF_A_KIND'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType FULL_HOUSE'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType FLUSH'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType STRAIGHT'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType THREE_OF_A_KIND'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType TWO_PAIRS'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType ONE_PAIR'),
(26, 'uniqueInstance', 'public static kw.texasholdem.tool.HandValueType HIGH_CARD'),
(29, 'Adaptee/Receiver', 'kw.texasholdem.view.ControlPanel'),
(29, 'Adapter/ConcreteCommand', 'kw.texasholdem.ai.impl.HumanClient'),
(29, 'Adaptee/Receiver', 'kw.texasholdem.view.BoardPanel'),
(29, 'Adapter/ConcreteCommand', 'kw.texasholdem.ai.impl.HumanClient'),
(29, 'Adaptee/Receiver', 'kw.texasholdem.view.TexasHoldemMainPanel'),
(29, 'Adapter/ConcreteCommand', 'kw.texasholdem.ai.impl.HumanClient'),
(30, 'State/Strategy', 'kw.texasholdem.ai.Client'),
(30, 'Context', 'kw.texasholdem.ai.impl.Player'),
(31, 'Client', 'com.intellij.uiDesigner.core.AbstractLayout'),
(31, 'Prototype', 'com.intellij.uiDesigner.core.GridConstraints'),
(34, 'Singleton', 'GameCore.GameEngine'),
(34, 'uniqueInstance', 'private static GameCore.GameEngine game'),
(34, 'Singleton', 'GameElements.MainCharacter'),
(34, 'uniqueInstance', 'private static GameElements.MainCharacter player'),
(34, 'Singleton', 'GameElements.PowerUpType'),
(34, 'uniqueInstance', 'public static GameElements.PowerUpType hallwayrage'),
(34, 'uniqueInstance', 'public static GameElements.PowerUpType health'),
(34, 'uniqueInstance', 'public static GameElements.PowerUpType pushback'),
(34, 'uniqueInstance', 'public static GameElements.PowerUpType acidPuddle'),
(36, 'Adaptee/Receiver', 'com.intellij.uiDesigner.core.DimensionInfo'),
(36, 'Adapter/ConcreteCommand', 'com.intellij.uiDesigner.core.GridLayoutManager'),
(36, 'Adaptee/Receiver', 'com.intellij.uiDesigner.core.LayoutState'),
(36, 'Adapter/ConcreteCommand', 'com.intellij.uiDesigner.core.GridLayoutManager'),
(37, 'Context', 'com.intellij.uiDesigner.core.GridLayoutManager'),
(37, 'State/Strategy', 'com.intellij.uiDesigner.core.DimensionInfo'),
(38, 'AbstractClass', 'com.intellij.uiDesigner.core.DimensionInfo'),
(39, 'Singleton', 'com.otabi.firestar.rpg.GameState'),
(39, 'uniqueInstance', 'public static com.otabi.firestar.rpg.GameState MENU'),
(39, 'uniqueInstance', 'public static com.otabi.firestar.rpg.GameState PLAY'),
(53, 'Singleton', 'thaigo.network.client.Client'),
(53, 'uniqueInstance', 'private static thaigo.network.client.Client instance'),
(53, 'Singleton', 'thaigo.network.server.ClientHandler'),
(53, 'uniqueInstance', 'private static thaigo.network.server.ClientHandler clientHandler'),
(53, 'Singleton', 'thaigo.network.server.Server'),
(53, 'uniqueInstance', 'private static thaigo.network.server.Server instance'),
(53, 'Singleton', 'thaigo.object.BoardModel'),
(53, 'uniqueInstance', 'public static thaigo.object.BoardModel Classic'),
(53, 'uniqueInstance', 'public static thaigo.object.BoardModel Wood'),
(53, 'uniqueInstance', 'public static thaigo.object.BoardModel Stone'),
(53, 'uniqueInstance', 'public static thaigo.object.BoardModel Frosty'),
(53, 'uniqueInstance', 'public static thaigo.object.BoardModel Flame'),
(53, 'uniqueInstance', 'public static thaigo.object.BoardModel Forest'),
(53, 'Singleton', 'thaigo.object.PawnModel'),
(53, 'uniqueInstance', 'public static thaigo.object.PawnModel Classic'),
(53, 'uniqueInstance', 'public static thaigo.object.PawnModel Jurassic'),
(53, 'uniqueInstance', 'public static thaigo.object.PawnModel Doodle'),
(53, 'Singleton', 'thaigo.property.AbstractRuler'),
(53, 'uniqueInstance', 'protected static thaigo.property.AbstractRuler ruler'),
(53, 'Singleton', 'thaigo.state.UpdateTask'),
(53, 'uniqueInstance', 'private static thaigo.state.UpdateTask task'),
(53, 'Singleton', 'thaigo.view.About'),
(53, 'uniqueInstance', 'private static thaigo.view.About instance'),
(53, 'Singleton', 'thaigo.view.DrawGame'),
(53, 'uniqueInstance', 'private static thaigo.view.DrawGame instance'),
(53, 'Singleton', 'thaigo.view.GameUI'),
(53, 'uniqueInstance', 'private static thaigo.view.GameUI instance'),
(53, 'Singleton', 'thaigo.view.HowToPlay'),
(53, 'uniqueInstance', 'private static thaigo.view.HowToPlay instance'),
(53, 'Singleton', 'thaigo.view.LoseGame'),
(53, 'uniqueInstance', 'private static thaigo.view.LoseGame instance'),
(53, 'Singleton', 'thaigo.view.SetupUI'),
(53, 'uniqueInstance', 'private static thaigo.view.SetupUI instance'),
(53, 'Singleton', 'thaigo.view.WinGame'),
(53, 'uniqueInstance', 'private static thaigo.view.WinGame instance'),
(54, 'Adaptee/Receiver', 'thaigo.state.UpdateTask'),
(54, 'Adapter/ConcreteCommand', 'thaigo.property.ThaiGORuler'),
(56, 'State/Strategy', 'thaigo.property.AbstractRuler'),
(56, 'Context', 'thaigo.object.Board'),
(56, 'Context', 'thaigo.state.UpdateTask'),
(56, 'State/Strategy', 'thaigo.state.GamePhaseAbstract'),
(57, 'AbstractClass', 'thaigo.property.AbstractRuler'),
(71, 'Singleton', 'thaigo.network.client.Client'),
(71, 'uniqueInstance', 'private static thaigo.network.client.Client instance'),
(71, 'Singleton', 'thaigo.network.server.ClientHandler'),
(71, 'uniqueInstance', 'private static thaigo.network.server.ClientHandler clientHandler'),
(71, 'Singleton', 'thaigo.network.server.Server'),
(71, 'uniqueInstance', 'private static thaigo.network.server.Server instance'),
(71, 'Singleton', 'thaigo.object.BoardModel'),
(71, 'uniqueInstance', 'public static thaigo.object.BoardModel Classic'),
(71, 'uniqueInstance', 'public static thaigo.object.BoardModel Wood'),
(71, 'uniqueInstance', 'public static thaigo.object.BoardModel Stone'),
(71, 'uniqueInstance', 'public static thaigo.object.BoardModel Frosty'),
(71, 'uniqueInstance', 'public static thaigo.object.BoardModel Flame'),
(71, 'uniqueInstance', 'public static thaigo.object.BoardModel Forest'),
(71, 'Singleton', 'thaigo.object.PawnModel'),
(71, 'uniqueInstance', 'public static thaigo.object.PawnModel Classic'),
(71, 'uniqueInstance', 'public static thaigo.object.PawnModel Jurassic'),
(71, 'uniqueInstance', 'public static thaigo.object.PawnModel Doodle'),
(71, 'Singleton', 'thaigo.property.AbstractRuler'),
(71, 'uniqueInstance', 'protected static thaigo.property.AbstractRuler ruler'),
(71, 'Singleton', 'thaigo.state.UpdateTask'),
(71, 'uniqueInstance', 'private static thaigo.state.UpdateTask task'),
(71, 'Singleton', 'thaigo.view.About'),
(71, 'uniqueInstance', 'private static thaigo.view.About instance'),
(71, 'Singleton', 'thaigo.view.DrawGame'),
(71, 'uniqueInstance', 'private static thaigo.view.DrawGame instance'),
(71, 'Singleton', 'thaigo.view.GameUI'),
(71, 'uniqueInstance', 'private static thaigo.view.GameUI instance'),
(71, 'Singleton', 'thaigo.view.HowToPlay'),
(71, 'uniqueInstance', 'private static thaigo.view.HowToPlay instance'),
(71, 'Singleton', 'thaigo.view.LoseGame'),
(71, 'uniqueInstance', 'private static thaigo.view.LoseGame instance'),
(71, 'Singleton', 'thaigo.view.SetupUI'),
(71, 'uniqueInstance', 'private static thaigo.view.SetupUI instance'),
(71, 'Singleton', 'thaigo.view.WinGame'),
(71, 'uniqueInstance', 'private static thaigo.view.WinGame instance'),
(72, 'Adaptee/Receiver', 'thaigo.state.UpdateTask'),
(72, 'Adapter/ConcreteCommand', 'thaigo.property.ThaiGORuler'),
(74, 'State/Strategy', 'thaigo.property.AbstractRuler'),
(74, 'Context', 'thaigo.object.Board'),
(74, 'Context', 'thaigo.state.UpdateTask'),
(74, 'State/Strategy', 'thaigo.state.GamePhaseAbstract'),
(75, 'AbstractClass', 'thaigo.property.AbstractRuler');

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
(1, 1, 'creat', 4),
(1, 2, 'm_field', 2),
(1, 3, 'separ', 2),
(1, 4, 'layoutnew', 2),
(1, 5, 'updat', 2),
(2, 6, 'm_fields[y][x', 8),
(2, 7, 'flow', 5),
(2, 8, 'sizenew', 2),
(2, 9, 'pnl', 2),
(2, 10, 'oper', 2),
(3, 11, 'dimens', 3),
(3, 12, 'serial', 3),
(3, 13, 'background', 2),
(3, 14, 'controllersudoku', 2),
(3, 15, 'm_pnl', 2),
(4, 16, 'game', 130),
(4, 17, 'panel', 93),
(4, 18, 'set', 92),
(4, 19, 'item', 71),
(4, 20, 'level', 58),
(5, 21, 'check', 4),
(5, 22, 'background', 3),
(5, 23, 'add', 3),
(5, 24, 'parent', 3),
(5, 25, 'event', 3),
(6, 26, 'suggest', 6),
(6, 27, 'show', 4),
(6, 28, 'pane', 3),
(6, 29, 'select', 3),
(6, 30, 'event', 3),
(7, 31, 'layout', 2),
(7, 32, 'black', 2),
(7, 33, 'action', 2),
(7, 34, 'system', 2),
(7, 35, 'red', 1),
(8, 36, 'toggl', 3),
(8, 37, 'candid', 3),
(8, 38, 'num', 2),
(8, 39, 'call', 2),
(8, 40, 'prefer', 2),
(9, 41, 'sol', 9),
(9, 42, 'panelnew', 4),
(9, 43, 'control', 4),
(9, 44, 'select', 4),
(9, 45, 'panel', 3),
(10, 46, 'mous', 3),
(10, 47, 'm_panels[y][x', 2),
(10, 48, 'addm_fil', 2),
(10, 49, 'construct', 2),
(10, 50, 'green', 1),
(11, 51, 'creat', 9),
(11, 52, 'jeu', 6),
(11, 53, 'moveboard', 6),
(11, 54, 'pawn', 5),
(11, 55, 'ifx', 5),
(12, 56, 'space', 6),
(12, 57, 'rectangl', 5),
(12, 58, 'pieces[row][column', 4),
(12, 59, 'resourcemodel', 4),
(12, 60, 'block', 4),
(13, 61, 'author', 10),
(13, 62, 'control', 8),
(13, 63, 'easi', 6),
(13, 64, 'paramet', 6),
(13, 65, 'compteur', 6),
(14, 66, 'listen', 5),
(14, 67, 'fill', 5),
(14, 68, 'fitrow', 4),
(14, 69, 'combo', 4),
(14, 70, 'pour', 4),
(15, 71, 'cell', 339),
(15, 72, 'puzzl', 196),
(15, 73, 'spot', 169),
(15, 74, 'pane', 125),
(15, 75, 'score', 113),
(16, 76, 'pick', 6),
(16, 77, 'solver', 6),
(16, 78, 'positionrow', 6),
(16, 79, 'board[row][col', 6),
(16, 80, 'ifrow', 6),
(17, 81, 'cpu''', 11),
(17, 82, 'drawp', 8),
(17, 83, 'iconvu', 8),
(17, 84, 'ifent', 7),
(17, 85, 'verif', 7),
(18, 86, 'ifmodel', 7),
(18, 87, 'opposit', 5),
(18, 88, 'inward', 5),
(18, 89, 'tic', 5),
(18, 90, 'victoir', 5),
(19, 91, 'containsx', 6),
(19, 92, 'call', 4),
(19, 93, 'fillp', 4),
(19, 94, 'un', 3),
(19, 95, 'ifcol', 3),
(20, 96, 'piec', 506),
(20, 97, 'board', 477),
(20, 98, 'col', 435),
(20, 99, 'row', 394),
(20, 100, 'side', 335),
(21, 101, 'map', 21),
(21, 102, 'popul', 5),
(21, 103, 'chooser', 5),
(21, 104, 'win', 4),
(21, 105, 'attribut', 4),
(22, 106, 'observ', 9),
(22, 107, 'length', 8),
(22, 108, 'random', 7),
(22, 109, 'box', 7),
(22, 110, 'pankov', 7),
(23, 111, 'set', 425),
(23, 112, 'visual', 421),
(23, 113, 'chess', 369),
(23, 114, 'piec', 336),
(23, 115, 'de', 253),
(24, 116, 'piec', 778),
(24, 117, 'color', 247),
(24, 118, 'point', 208),
(24, 119, 'view', 108),
(24, 120, 'player', 101),
(25, 121, 'posit', 183),
(25, 122, 'boolean', 120),
(25, 123, 'panel', 97),
(25, 124, 'imag', 94),
(25, 125, 'param', 90),
(26, 126, 'getit', 7),
(26, 127, 'pieces/w', 7),
(26, 128, 'emoticon', 6),
(26, 129, 'add', 5),
(26, 130, 'progress', 2),
(27, 131, 'dialognul', 9),
(27, 132, 'return', 6),
(27, 133, 'putposit', 6),
(27, 134, 'vpiec', 6),
(27, 135, 'model', 5),
(28, 136, 'oo', 6),
(28, 137, 'toolkit', 5),
(28, 138, 'pawn', 5),
(28, 139, 'diff', 4),
(28, 140, 'underlin', 4),
(29, 141, 'send', 21),
(29, 142, 'show', 19),
(29, 143, 'positionpo', 14),
(29, 144, 'getpo', 13),
(29, 145, 'getnv', 10),
(30, 146, 'gener', 5),
(30, 147, 'connect', 4),
(30, 148, 'screen', 4),
(30, 149, 'layoutnul', 3),
(30, 150, 'addpl', 3),
(31, 151, 'ifi', 4),
(31, 152, 'imag', 2),
(31, 153, 'shotlong', 1),
(31, 154, 'act', 1),
(31, 155, 'frame', 1),
(32, 156, 'stand', 6),
(32, 157, 'charact', 5),
(32, 158, 'rectangl', 4),
(32, 159, 'bool', 3),
(32, 160, 'removei', 2),
(33, 161, 'imagec', 4),
(33, 162, 'potionint', 4),
(33, 163, 'master', 4),
(33, 164, 'ifdirect', 3),
(33, 165, 'stamina', 3),
(34, 166, 'draw', 5),
(34, 167, 'shape', 3),
(34, 168, 'pick', 2),
(34, 169, 'ifdirect', 2),
(34, 170, 'damageint', 2),
(35, 171, 'shoot', 3),
(35, 172, 'bound', 3),
(35, 173, 'ifthi', 3),
(35, 174, 'heightnul', 3),
(35, 175, 'staminareturn', 2),
(36, 176, 'removei', 2),
(36, 177, 'cthi', 2),
(36, 178, 'geti', 1),
(36, 179, 'upitem', 1),
(36, 180, 'rang', 1),
(37, 181, 'shoot', 3),
(37, 182, 'defin', 3),
(37, 183, 'translatethi', 3),
(37, 184, 'item', 2),
(37, 185, 'lower', 2),
(38, 186, 'ifknight', 1),
(38, 187, 'trace', 1),
(38, 188, 'accessor', 1),
(38, 189, 'red', 1),
(38, 190, 'time', 1),
(39, 191, 'frame', 9),
(39, 192, 'doingthi', 5),
(39, 193, 'affin', 4),
(39, 194, 'ifdirect', 3),
(39, 195, 'forint', 2),
(40, 196, 'set', 126),
(40, 197, 'imag', 52),
(40, 198, 'health', 45),
(40, 199, 'dist', 42),
(40, 200, 'direct', 39),
(41, 201, 'messag', 14),
(41, 202, 'map', 9),
(41, 203, 'current', 9),
(41, 204, 'smart', 7),
(41, 205, 'event', 6),
(42, 206, 'wait', 4),
(42, 207, 'east', 3),
(42, 208, 'event', 3),
(42, 209, 'form', 3),
(42, 210, 'robot', 2),
(43, 211, 'png', 5),
(43, 212, 'ifp', 3),
(43, 213, 'turn', 3),
(43, 214, 'player''', 3),
(43, 215, 'url', 3),
(44, 216, 'block', 5),
(44, 217, 'addbet', 3),
(44, 218, 'layoutnew', 3),
(44, 219, 'imag', 3),
(44, 220, 'size', 3),
(45, 221, 'robot', 5),
(45, 222, 'card', 5),
(45, 223, 'row', 4),
(45, 224, 'constraint', 4),
(45, 225, 'graphic', 3),
(46, 226, 'placehold', 3),
(46, 227, 'append', 3),
(46, 228, 'componenti', 2),
(46, 229, 'constantx', 2),
(46, 230, 'compact', 2),
(47, 231, 'panel', 189),
(47, 232, 'set', 175),
(47, 233, 'player', 173),
(47, 234, 'label', 138),
(47, 235, 'action', 97),
(48, 236, 'sequenc', 4),
(48, 237, 'command', 4),
(48, 238, 'constraintspar', 3),
(48, 239, 'card', 3),
(48, 240, 'output', 3),
(49, 241, 'window', 4),
(49, 242, 'trace', 3),
(49, 243, 'panelcontrol', 2),
(49, 244, 'constantiniti', 2),
(49, 245, 'minimum', 2),
(50, 246, 'empti', 3),
(50, 247, 'scrollbar', 2),
(50, 248, 'notic', 2),
(50, 249, 'uid', 2),
(50, 250, 'view', 2),
(51, 251, 'png', 9),
(51, 252, 'posit', 7),
(51, 253, 'xff', 7),
(51, 254, 'player_up', 5),
(51, 255, 'element', 4),
(52, 256, 'doc', 5),
(52, 257, 'length', 5),
(52, 258, 'entiti', 4),
(52, 259, 'graphic', 4),
(52, 260, 'coordin', 4),
(53, 261, 'mode', 5),
(53, 262, 'control', 4),
(53, 263, 'magic', 3),
(53, 264, 'hedg', 3),
(53, 265, 'thread', 3),
(54, 266, 'daw_so_far', 5),
(54, 267, 'shoot', 5),
(54, 268, 'templat', 4),
(54, 269, 'buffer', 4),
(54, 270, 'releas', 3),
(55, 271, 'getattribut', 2),
(55, 272, 'thread', 2),
(55, 273, 'atan', 2),
(55, 274, 'figur', 1),
(55, 275, 'resources/play', 1),
(56, 276, 'firestar', 6),
(56, 277, 'clear', 5),
(56, 278, 'focu', 5),
(56, 279, 'node', 4),
(56, 280, 'ddw_so_far', 4),
(57, 281, 'return', 2),
(57, 282, 'reload', 2),
(57, 283, 'rectangleint', 2),
(57, 284, 'magic', 2),
(57, 285, 'key[kei', 2),
(58, 286, 'charact', 54),
(58, 287, 'entiti', 22),
(58, 288, 'updat', 19),
(58, 289, 'node', 16),
(58, 290, 'draw', 15),
(59, 291, 'sprite', 130),
(59, 292, 'player', 94),
(59, 293, 'kei', 86),
(59, 294, 'game', 80),
(59, 295, 'map', 79),
(60, 296, 'load', 5),
(60, 297, 'tripl', 3),
(60, 298, 'close', 2),
(60, 299, 'anim', 2),
(60, 300, 'name', 1);

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
(1, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'creat', 4),
(2, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'm_fields[y][x', 8),
(3, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'dimens', 3),
(4, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'game', 130),
(5, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'check', 4),
(6, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'suggest', 6),
(7, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'layout', 2),
(8, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'toggl', 3),
(9, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'sol', 9),
(10, 1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 'mous', 3),
(11, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'creat', 9),
(12, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'space', 6),
(13, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'author', 10),
(14, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'listen', 5),
(15, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'cell', 339),
(16, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'pick', 6),
(17, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'cpu''', 11),
(18, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'ifmodel', 7),
(19, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'containsx', 6),
(20, 3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 'piec', 506),
(21, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'map', 21),
(22, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'observ', 9),
(23, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'set', 425),
(24, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'piec', 778),
(25, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'posit', 183),
(26, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'getit', 7),
(27, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'dialognul', 9),
(28, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'oo', 6),
(29, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'send', 21),
(30, 4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 'gener', 5),
(31, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'ifi', 4),
(32, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'stand', 6),
(33, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'imagec', 4),
(34, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'draw', 5),
(35, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'shoot', 3),
(36, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'removei', 2),
(37, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'shoot', 3),
(38, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'ifknight', 1),
(39, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'frame', 9),
(40, 6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 'set', 126),
(41, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'messag', 14),
(42, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'wait', 4),
(43, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'png', 5),
(44, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'block', 5),
(45, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'robot', 5),
(46, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'placehold', 3),
(47, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'panel', 189),
(48, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'sequenc', 4),
(49, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'window', 4),
(50, 7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 'empti', 3),
(51, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'png', 9),
(52, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'doc', 5),
(53, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'mode', 5),
(54, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'daw_so_far', 5),
(55, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'getattribut', 2),
(56, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'firestar', 6),
(57, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'return', 2),
(58, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'charact', 54),
(59, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'sprite', 130),
(60, 10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 'load', 5);

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
(1, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI'),
(3, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master'),
(4, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6'),
(6, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster'),
(7, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro'),
(8, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\hallway-rush'),
(10, 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master');

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
(17, 'Request/Execute', 'execute', 'ChessGameKenai.LoadGameCommand'),
(17, 'Request/Execute', 'execute', 'ChessGameKenai.ClosePromptCommand'),
(17, 'Request/Execute', 'execute', 'ChessGameKenai.LoadFromFileCommand'),
(17, 'Request/Execute', 'execute', 'ChessGameKenai.NewGameCommand'),
(17, 'Request/Execute', 'execute', 'ChessGameKenai.NewGameWithComputer'),
(17, 'Request/Execute', 'execute', 'ChessGameKenai.RestartCommand'),
(17, 'Request/Execute', 'execute', 'ChessGameKenai.SaveAsCommand'),
(17, 'Request/Execute', 'execute', 'ChessGameKenai.SetPlayerNameCommand'),
(17, 'Request/Execute', 'redraw', 'ChessGameKenai.FlipBoardStrategy'),
(17, 'Request/Execute', 'redraw', 'ChessGameKenai.NormalBoardStrategy'),
(21, 'TemplateMethod', 'move(int, int, java.util.List, java.util.List)', 'ChessGameKenai.NonVisualPiece'),
(29, 'Request/Execute', 'act(java.util.Set)', 'kw.texasholdem.ai.impl.HumanClient'),
(29, 'Request/Execute', 'playerActed(kw.texasholdem.ai.impl.Player)', 'kw.texasholdem.ai.impl.HumanClient'),
(29, 'Request/Execute', 'boardUpdated(java.util.List, int, int)', 'kw.texasholdem.ai.impl.HumanClient'),
(29, 'Request/Execute', 'messageReceived(java.lang.String)', 'kw.texasholdem.ai.impl.HumanClient'),
(29, 'Request/Execute', 'act(java.util.Set)', 'kw.texasholdem.ai.impl.HumanClient'),
(29, 'Request/Execute', 'handStarted(kw.texasholdem.ai.impl.Player)', 'kw.texasholdem.ai.impl.HumanClient'),
(29, 'Request/Execute', 'handResumed(kw.texasholdem.ai.impl.Player)', 'kw.texasholdem.ai.impl.HumanClient'),
(29, 'Request/Execute', 'actorRotated(kw.texasholdem.ai.impl.Player)', 'kw.texasholdem.ai.impl.HumanClient'),
(31, 'Operation', 'addLayoutComponent(java.awt.Component, java.lang.Object)', 'com.intellij.uiDesigner.core.AbstractLayout'),
(36, 'Request/Execute', 'layoutContainer(java.awt.Container)', 'com.intellij.uiDesigner.core.GridLayoutManager'),
(36, 'Request/Execute', 'layoutContainer(java.awt.Container)', 'com.intellij.uiDesigner.core.GridLayoutManager'),
(38, 'TemplateMethod', 'calcCellSizePolicy(int)', 'com.intellij.uiDesigner.core.DimensionInfo'),
(38, 'TemplateMethod', 'getCellSizePolicyFromInheriting(int)', 'com.intellij.uiDesigner.core.DimensionInfo'),
(54, 'Request/Execute', 'checkWinDrawLose', 'thaigo.property.ThaiGORuler'),
(54, 'Request/Execute', 'newGame', 'thaigo.property.ThaiGORuler'),
(57, 'TemplateMethod', 'removedAtPosition(thaigo.property.Position)', 'thaigo.property.AbstractRuler'),
(72, 'Request/Execute', 'checkWinDrawLose', 'thaigo.property.ThaiGORuler'),
(72, 'Request/Execute', 'newGame', 'thaigo.property.ThaiGORuler'),
(75, 'TemplateMethod', 'removedAtPosition(thaigo.property.Position)', 'thaigo.property.AbstractRuler');

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

--
-- Dumping data for table `patterninstance`
--

INSERT INTO `patterninstance` (`patternID`, `patternInstanceID`, `instanceClass`, `projectName`, `projectID`) VALUES
(3, 1, 'Singleton: kw.sudoku.model.UpdateAction | uniqueInstance: public static kw.sudoku.model.UpdateAction NEW_GAME | uniqueInstance: public static kw.sudoku.model.UpdateAction CHECK | uniqueInstance: public static kw.sudoku.model.UpdateAction SELECTED_NUMBER | uniqueInstance: public static kw.sudoku.model.UpdateAction CANDIDATES | uniqueInstance: public static kw.sudoku.model.UpdateAction HELP | uniqueInstance: public static kw.sudoku.model.UpdateAction SHOW_SOLUTIONS | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\Sudoku-JavaGUI', 1),
(3, 2, 'Singleton: common.model.GameBoard$Cell | uniqueInstance: public static common.model.GameBoard$Cell EMPTY | uniqueInstance: public static common.model.GameBoard$Cell PLAYER1 | uniqueInstance: public static common.model.GameBoard$Cell PLAYER2 | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 3),
(8, 3, 'Context: Chess.ChessComponent$MyDragAndDrop | State/Strategy: Chess.ChessPiece | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Board-Games-master', 3),
(3, 4, 'Singleton: ChessGameKenai.ChessBoardView | uniqueInstance: private static ChessGameKenai.ChessBoardView _instance | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 4),
(3, 5, 'Singleton: ChessGameKenai.Chess_Data | uniqueInstance: private static ChessGameKenai.Chess_Data _instance | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 4),
(8, 6, 'Context: ChessGameKenai.ChessBoardView | State/Strategy: ChessGameKenai.Board | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Chess Games\\ChessGame0.6', 4),
(8, 22, 'State/Strategy: Character | Context: DungeonMaster | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\dungeonmaster', 6),
(3, 23, 'Singleton: kw.texasholdem.config.Action | uniqueInstance: public static kw.texasholdem.config.Action SMALL_BLIND | uniqueInstance: public static kw.texasholdem.config.Action BIG_BLIND | uniqueInstance: public static kw.texasholdem.config.Action CHECK | uniqueInstance: public static kw.texasholdem.config.Action CALL | uniqueInstance: public static kw.texasholdem.config.Action BET | uniqueInstance: public static kw.texasholdem.config.Action RAISE | uniqueInstance: public static kw.texasholdem.config.Action ALL_IN | uniqueInstance: public static kw.texasholdem.config.Action FOLD | uniqueInstance: public static kw.texasholdem.config.Action CONTINUE | uniqueInstance: public static kw.texasholdem.config.Action ALLOW_SAVE | uniqueInstance: public static kw.texasholdem.config.Action DISALLOW_SAVE | uniqueInstance: public static kw.texasholdem.config.Action SAVE | uniqueInstance: public static kw.texasholdem.config.Action CLOSE_IF_NEEDED | uniqueInstance: public static kw.texasholdem.config.Action HIDE_PROFILE_LEFT_PANEL | uniqueInstance: public static kw.texasholdem.config.Action RESET_ALL_PROFILE_LEFT_PANEL | uniqueInstance: public static kw.texasholdem.config.Action UPDATE_LEFT_PLAYER_PANEL | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 7),
(3, 24, 'Singleton: kw.texasholdem.tool.HandValueType | uniqueInstance: public static kw.texasholdem.tool.HandValueType ROYAL_FLUSH | uniqueInstance: public static kw.texasholdem.tool.HandValueType STRAIGHT_FLUSH | uniqueInstance: public static kw.texasholdem.tool.HandValueType FOUR_OF_A_KIND | uniqueInstance: public static kw.texasholdem.tool.HandValueType FULL_HOUSE | uniqueInstance: public static kw.texasholdem.tool.HandValueType FLUSH | uniqueInstance: public static kw.texasholdem.tool.HandValueType STRAIGHT | uniqueInstance: public static kw.texasholdem.tool.HandValueType THREE_OF_A_KIND | uniqueInstance: public static kw.texasholdem.tool.HandValueType TWO_PAIRS | uniqueInstance: public static kw.texasholdem.tool.HandValueType ONE_PAIR | uniqueInstance: public static kw.texasholdem.tool.HandValueType HIGH_CARD | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 7),
(3, 25, 'Singleton: kw.texasholdem.config.Action | uniqueInstance: public static kw.texasholdem.config.Action SMALL_BLIND | uniqueInstance: public static kw.texasholdem.config.Action BIG_BLIND | uniqueInstance: public static kw.texasholdem.config.Action CHECK | uniqueInstance: public static kw.texasholdem.config.Action CALL | uniqueInstance: public static kw.texasholdem.config.Action BET | uniqueInstance: public static kw.texasholdem.config.Action RAISE | uniqueInstance: public static kw.texasholdem.config.Action ALL_IN | uniqueInstance: public static kw.texasholdem.config.Action FOLD | uniqueInstance: public static kw.texasholdem.config.Action CONTINUE | uniqueInstance: public static kw.texasholdem.config.Action ALLOW_SAVE | uniqueInstance: public static kw.texasholdem.config.Action DISALLOW_SAVE | uniqueInstance: public static kw.texasholdem.config.Action SAVE | uniqueInstance: public static kw.texasholdem.config.Action CLOSE_IF_NEEDED | uniqueInstance: public static kw.texasholdem.config.Action HIDE_PROFILE_LEFT_PANEL | uniqueInstance: public static kw.texasholdem.config.Action RESET_ALL_PROFILE_LEFT_PANEL | uniqueInstance: public static kw.texasholdem.config.Action UPDATE_LEFT_PLAYER_PANEL | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 7),
(3, 26, 'Singleton: kw.texasholdem.tool.HandValueType | uniqueInstance: public static kw.texasholdem.tool.HandValueType ROYAL_FLUSH | uniqueInstance: public static kw.texasholdem.tool.HandValueType STRAIGHT_FLUSH | uniqueInstance: public static kw.texasholdem.tool.HandValueType FOUR_OF_A_KIND | uniqueInstance: public static kw.texasholdem.tool.HandValueType FULL_HOUSE | uniqueInstance: public static kw.texasholdem.tool.HandValueType FLUSH | uniqueInstance: public static kw.texasholdem.tool.HandValueType STRAIGHT | uniqueInstance: public static kw.texasholdem.tool.HandValueType THREE_OF_A_KIND | uniqueInstance: public static kw.texasholdem.tool.HandValueType TWO_PAIRS | uniqueInstance: public static kw.texasholdem.tool.HandValueType ONE_PAIR | uniqueInstance: public static kw.texasholdem.tool.HandValueType HIGH_CARD | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 7),
(4, 27, 'Adaptee/Receiver: kw.texasholdem.view.ControlPanel | Adapter/ConcreteCommand: kw.texasholdem.ai.impl.HumanClient | Request()/Execute(): kw.texasholdem.ai.impl.HumanClient::act(java.util.Set):kw.texasholdem.config.Action | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 7),
(4, 28, 'Adaptee/Receiver: kw.texasholdem.view.BoardPanel | Adapter/ConcreteCommand: kw.texasholdem.ai.impl.HumanClient | Request()/Execute(): kw.texasholdem.ai.impl.HumanClient::playerActed(kw.texasholdem.ai.impl.Player):void | Request()/Execute(): kw.texasholdem.ai.impl.HumanClient::boardUpdated(java.util.List, int, int):void | Request()/Execute(): kw.texasholdem.ai.impl.HumanClient::messageReceived(java.lang.String):void | Request()/Execute(): kw.texasholdem.ai.impl.HumanClient::act(java.util.Set):kw.texasholdem.config.Action | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 7),
(4, 29, 'Adaptee/Receiver: kw.texasholdem.view.TexasHoldemMainPanel | Adapter/ConcreteCommand: kw.texasholdem.ai.impl.HumanClient | Request()/Execute(): kw.texasholdem.ai.impl.HumanClient::handStarted(kw.texasholdem.ai.impl.Player):void | Request()/Execute(): kw.texasholdem.ai.impl.HumanClient::handResumed(kw.texasholdem.ai.impl.Player):void | Request()/Execute(): kw.texasholdem.ai.impl.HumanClient::actorRotated(kw.texasholdem.ai.impl.Player):void | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 7),
(8, 30, 'State/Strategy: kw.texasholdem.ai.Client | Context: kw.texasholdem.ai.impl.Player | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\Games-master\\TexasHoldemPro', 7),
(2, 31, 'Client: com.intellij.uiDesigner.core.AbstractLayout | Prototype: com.intellij.uiDesigner.core.GridConstraints | Operation(): com.intellij.uiDesigner.core.AbstractLayout::addLayoutComponent(java.awt.Component, java.lang.Object):void | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\hallway-rush', 8),
(3, 32, 'Singleton: GameCore.GameEngine | uniqueInstance: private static GameCore.GameEngine game | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\hallway-rush', 8),
(3, 33, 'Singleton: GameElements.MainCharacter | uniqueInstance: private static GameElements.MainCharacter player | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\hallway-rush', 8),
(3, 34, 'Singleton: GameElements.PowerUpType | uniqueInstance: public static GameElements.PowerUpType hallwayrage | uniqueInstance: public static GameElements.PowerUpType health | uniqueInstance: public static GameElements.PowerUpType pushback | uniqueInstance: public static GameElements.PowerUpType acidPuddle | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\hallway-rush', 8),
(4, 35, 'Adaptee/Receiver: com.intellij.uiDesigner.core.DimensionInfo | Adapter/ConcreteCommand: com.intellij.uiDesigner.core.GridLayoutManager | Request()/Execute(): com.intellij.uiDesigner.core.GridLayoutManager::layoutContainer(java.awt.Container):void | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\hallway-rush', 8),
(4, 36, 'Adaptee/Receiver: com.intellij.uiDesigner.core.LayoutState | Adapter/ConcreteCommand: com.intellij.uiDesigner.core.GridLayoutManager | Request()/Execute(): com.intellij.uiDesigner.core.GridLayoutManager::layoutContainer(java.awt.Container):void | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\hallway-rush', 8),
(8, 37, 'Context: com.intellij.uiDesigner.core.GridLayoutManager | State/Strategy: com.intellij.uiDesigner.core.DimensionInfo | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\hallway-rush', 8),
(9, 38, 'AbstractClass: com.intellij.uiDesigner.core.DimensionInfo | TemplateMethod(): com.intellij.uiDesigner.core.DimensionInfo::calcCellSizePolicy(int):int | TemplateMethod(): com.intellij.uiDesigner.core.DimensionInfo::getCellSizePolicyFromInheriting(int):int | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\hallway-rush', 8),
(3, 39, 'Singleton: com.otabi.firestar.rpg.GameState | uniqueInstance: public static com.otabi.firestar.rpg.GameState MENU | uniqueInstance: public static com.otabi.firestar.rpg.GameState PLAY | ', 'D:\\Downloads\\Games\\GamesWithSrcFolder\\RPG-master', 10);

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
  MODIFY `keywordID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;
--
-- AUTO_INCREMENT for table `domaintopics`
--
ALTER TABLE `domaintopics`
  MODIFY `topicID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `file_directory`
--
ALTER TABLE `file_directory`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `lookupwords`
--
ALTER TABLE `lookupwords`
  MODIFY `WordId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
--
-- AUTO_INCREMENT for table `patterninstance`
--
ALTER TABLE `patterninstance`
  MODIFY `patternInstanceID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `patterns`
--
ALTER TABLE `patterns`
  MODIFY `patternID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
