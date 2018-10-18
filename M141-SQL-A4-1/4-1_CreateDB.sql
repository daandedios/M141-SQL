#Erzeugt die Datenbank Videothek
DROP DATABASE IF EXISTS Videothek;
CREATE DATABASE Videothek;
USE Videothek;

#Erzeugt die Tabelle Kunde
CREATE TABLE Kunde
(
Kundennummer INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
Anrede ENUM('Herr', 'Frau') NOT NULL DEFAULT 'Herr',
Vorname VARCHAR(50) NOT NULL,
Nachname VARCHAR(50) NOT NULL,
Strasse VARCHAR(30) NOT NULL,
PLZ SMALLINT(4) NOT NULL,
Ort VARCHAR(20) NOT NULL,
Telefon_Festnetz VARCHAR(13),
Telefon_Mobil VARCHAR(13),
Geburtsdatum DATE,
Email VARCHAR(100),
PRIMARY KEY (Kundennummer),
INDEX (Nachname)
)
ENGINE=INNODB;

#Erzeugt die Tabelle Film
CREATE TABLE Film
(
Videonummer INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
Titel VARCHAR(255) NOT NULL,
Dauer SMALLINT,
Kategorie SET('Abenteuer', 'Action', 'Animationen', 'Cartoons', 'Dokumentarfilme', 'Drama', 'Eastern',
'Erotik', 'Familie', 'Fantasy', 'Heimatfilme', 'Horror', 'Kinderfilme', 'Klassiker', 'Komödie',
'Krieg', 'Krimis', 'Lovestorys', 'Musik', 'Mystery', 'Reise', 'Romanze', 'Sammlungen',
'Science-Fiction & Fantasy', 'Sonstige', 'Sport', 'Thriller', 'Trickfilm', 'TV-Serien', 'Western'),
Jahr YEAR,
FreiAb TINYINT UNSIGNED DEFAULT 0,
PreisProTag TINYINT UNSIGNED NOT NULL DEFAULT 8,
EPreis DECIMAL(9,2),
Land VARCHAR(20),
PRIMARY KEY (Videonummer),
INDEX (Titel)
)
ENGINE=INNODB;

#Erzeugt die Tabelle Medium
CREATE TABLE MEDIUM
(
Mediumnummer INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
Videonummer INTEGER UNSIGNED NOT NULL,
Art ENUM('DVD', 'BD'),
Regal ENUM('A','B','C','D','E','F','G','H','I','K','L','M','N','O'),
Tablar TINYINT UNSIGNED NOT NULL,
PRIMARY KEY (Mediumnummer),
INDEX (Videonummer),
FOREIGN KEY(Videonummer) REFERENCES Film(Videonummer) ON DELETE CASCADE
)
ENGINE=INNODB;

#Erzeugt die Tabelle Ausleihe
CREATE TABLE Ausleihe
(
Kundennummer INTEGER UNSIGNED NOT NULL,
Mediumnummer INTEGER UNSIGNED NOT NULL,
Ausleihe DATETIME NOT NULL,
PRIMARY KEY (Kundennummer, Mediumnummer),
INDEX (Kundennummer),
INDEX (Mediumnummer),
CONSTRAINT KundeHatAusleihen FOREIGN KEY(Kundennummer) REFERENCES Kunde(Kundennummer) ON DELETE
RESTRICT,
CONSTRAINT MediumAusgeliehen FOREIGN KEY(Mediumnummer) REFERENCES MEDIUM(Mediumnummer) ON DELETE
RESTRICT
)
ENGINE=INNODB;