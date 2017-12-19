-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 18 dec 2017 kl 10:27
-- Serverversion: 10.1.19-MariaDB
-- PHP-version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `kalendersystem`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `acceptedcalendars`
--

CREATE TABLE `acceptedcalendars` (
  `acceptedCalendarsID` int(11) NOT NULL,
  `calendarID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `acceptedevents`
--

CREATE TABLE `acceptedevents` (
  `acceptedEventsID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `calendarinvites`
--

CREATE TABLE `calendarinvites` (
  `calendarInviteID` int(11) NOT NULL,
  `calendarID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `declined` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `calendars`
--

CREATE TABLE `calendars` (
  `calendarID` int(11) NOT NULL,
  `name` varchar(52) NOT NULL,
  `creatorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `calendars`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `eventinvites`
--

CREATE TABLE `eventinvites` (
  `eventInviteID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `declined` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `events`
--

CREATE TABLE `events` (
  `eventID` int(11) NOT NULL,
  `creatorID` int(11) NOT NULL,
  `calendarID` int(11) NOT NULL,
  `name` varchar(52) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `events`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `hash`
--

CREATE TABLE `hash` (
  `hashID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `hash` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `hash`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `email` varchar(52) NOT NULL,
  `username` varchar(52) NOT NULL,
  `password` varchar(52) NOT NULL,
  `firstName` varchar(52) NOT NULL,
  `lastName` varchar(52) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `users`
--

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `acceptedcalendars`
--
ALTER TABLE `acceptedcalendars`
  ADD PRIMARY KEY (`acceptedCalendarsID`),
  ADD KEY `calendarID` (`calendarID`),
  ADD KEY `userID` (`userID`);

--
-- Index för tabell `acceptedevents`
--
ALTER TABLE `acceptedevents`
  ADD PRIMARY KEY (`acceptedEventsID`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `userID` (`userID`);

--
-- Index för tabell `calendarinvites`
--
ALTER TABLE `calendarinvites`
  ADD PRIMARY KEY (`calendarInviteID`),
  ADD KEY `calendarID` (`calendarID`),
  ADD KEY `userID` (`userID`);

--
-- Index för tabell `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`calendarID`),
  ADD KEY `creatorID` (`creatorID`);

--
-- Index för tabell `eventinvites`
--
ALTER TABLE `eventinvites`
  ADD PRIMARY KEY (`eventInviteID`),
  ADD KEY `eventID` (`eventID`,`userID`),
  ADD KEY `eventinvites_ibfk_2` (`userID`);

--
-- Index för tabell `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `creatorID` (`creatorID`,`calendarID`),
  ADD KEY `events_ibfk_2` (`calendarID`);

--
-- Index för tabell `hash`
--
ALTER TABLE `hash`
  ADD PRIMARY KEY (`hashID`),
  ADD KEY `userID` (`userID`);

--
-- Index för tabell `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `acceptedcalendars`
--
ALTER TABLE `acceptedcalendars`
  MODIFY `acceptedCalendarsID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `acceptedevents`
--
ALTER TABLE `acceptedevents`
  MODIFY `acceptedEventsID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `calendarinvites`
--
ALTER TABLE `calendarinvites`
  MODIFY `calendarInviteID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `eventinvites`
--
ALTER TABLE `eventinvites`
  MODIFY `eventInviteID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `events`
--
ALTER TABLE `events`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `hash`
--
ALTER TABLE `hash`
  MODIFY `hashID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `acceptedcalendars`
--
ALTER TABLE `acceptedcalendars`
  ADD CONSTRAINT `acceptedcalendars_ibfk_1` FOREIGN KEY (`calendarID`) REFERENCES `calendars` (`calendarID`),
  ADD CONSTRAINT `acceptedcalendars_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Restriktioner för tabell `acceptedevents`
--
ALTER TABLE `acceptedevents`
  ADD CONSTRAINT `acceptedevets_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`),
  ADD CONSTRAINT `acceptedevets_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Restriktioner för tabell `calendarinvites`
--
ALTER TABLE `calendarinvites`
  ADD CONSTRAINT `calendarinvites_ibfk_1` FOREIGN KEY (`calendarInviteID`) REFERENCES `calendars` (`calendarID`),
  ADD CONSTRAINT `calendarinvites_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Restriktioner för tabell `calendars`
--
ALTER TABLE `calendars`
  ADD CONSTRAINT `calendars_ibfk_1` FOREIGN KEY (`creatorID`) REFERENCES `users` (`userID`);

--
-- Restriktioner för tabell `eventinvites`
--
ALTER TABLE `eventinvites`
  ADD CONSTRAINT `eventinvites_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`),
  ADD CONSTRAINT `eventinvites_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Restriktioner för tabell `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`creatorID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`calendarID`) REFERENCES `calendars` (`calendarID`);

--
-- Restriktioner för tabell `hash`
--
ALTER TABLE `hash`
  ADD CONSTRAINT `hash_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
