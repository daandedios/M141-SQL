/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-07
*****************************
######################################
!! Dies sind die Musterlösungen !!
!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/


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
CONSTRAINT KundeHatAusleihen FOREIGN KEY(Kundennummer) REFERENCES Kunde(Kundennummer) ON DELETE RESTRICT,
CONSTRAINT MediumAusgeliehen FOREIGN KEY(Mediumnummer) REFERENCES MEDIUM(Mediumnummer) ON DELETE RESTRICT
)
ENGINE=INNODB;


USE Videothek;

DELETE FROM Kunde;

LOAD DATA LOCAL INFILE '/Kunden.csv' INTO TABLE Kunde
  FIELDS TERMINATED BY ';'
  LINES TERMINATED BY '\r\n'
(Vorname, Nachname, Strasse, PLZ, Ort, Telefon_Festnetz, Telefon_Mobil, Geburtsdatum, Email);


DELETE FROM Film;

LOAD DATA LOCAL INFILE '/FilmListe.csv' INTO TABLE Film
  FIELDS TERMINATED BY ';'
  LINES TERMINATED BY '\r\n'
(Videonummer, Titel, Dauer, Kategorie, Jahr, FreiAb, PreisProTag, EPreis, Land);


ALTER TABLE MEDIUM
  MODIFY Art enum ('DVD', 'BD', 'VHS');

INSERT INTO MEDIUM (Mediumnummer, Videonummer, Art, Regal, Tablar) VALUES
                                                                          (1,3,'DVD','A',2),
                                                                          (2,3,'VHS','B',1),
                                                                          (3,1,'DVD','E',1),
                                                                          (4,1,'DVD','E',1),
                                                                          (5,1,'VHS','E',1),
                                                                          (6,1,'DVD','B',1),
                                                                          (7,2,'DVD','B',1);

ALTER TABLE Kunde ADD COLUMN Temp VARCHAR(50);
UPDATE Kunde SET Temp = Vorname;
UPDATE Kunde SET Vorname = Nachname WHERE Kundennummer > 3;
UPDATE Kunde SET Nachname = Temp WHERE Kundennummer > 3;
ALTER TABLE Kunde DROP COLUMN Temp;

#Mueller und Miller in Müller korrigieren
UPDATE Kunde SET Nachname = 'Müller' WHERE Nachname = 'Mueller';
UPDATE Kunde SET Nachname = 'Müller' WHERE Nachname = 'Miller';
