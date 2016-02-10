-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2016 at 03:56 PM
-- Server version: 5.5.45-cll-lve
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `survey_database_of_stuff`
--

-- --------------------------------------------------------

--
-- Table structure for table `Question`
--

CREATE TABLE IF NOT EXISTS `Question` (
  `Q_text` varchar(30) NOT NULL,
  `Q_ocount` int(11) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Q_surveyID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Q_surveyID` (`Q_surveyID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Question`
--

INSERT INTO `Question` (`Q_text`, `Q_ocount`, `ID`, `Q_surveyID`) VALUES
('Will it?', 2, 1, 1),
('Some Question Will Go here?', 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Selection`
--

CREATE TABLE IF NOT EXISTS `Selection` (
  `S_text` varchar(30) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQ_ID` int(11) NOT NULL,
  `S_score` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SQ_ID` (`SQ_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Selection`
--

INSERT INTO `Selection` (`S_text`, `ID`, `SQ_ID`, `S_score`) VALUES
('NO', 1, 1, 0),
('YES', 2, 1, 0),
('YES', 5, 3, 0),
('NO', 6, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Survey`
--

CREATE TABLE IF NOT EXISTS `Survey` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `Qcount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Survey`
--

INSERT INTO `Survey` (`ID`, `name`, `Qcount`) VALUES
(1, 'test', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Question`
--
ALTER TABLE `Question`
  ADD CONSTRAINT `Question_ibfk_1` FOREIGN KEY (`Q_surveyID`) REFERENCES `Survey` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Selection`
--
ALTER TABLE `Selection`
  ADD CONSTRAINT `Selection_ibfk_1` FOREIGN KEY (`SQ_ID`) REFERENCES `Question` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
