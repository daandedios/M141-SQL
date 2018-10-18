#Importiert die Filmliste in die Tabelle Film
USE Videothek;
DELETE FROM Film;
LOAD DATA LOCAL INFILE 'Filmliste.txt'
INTO TABLE Film
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
(Videonummer, Titel, Dauer, Kategorie, Jahr, FreiAb, PreisProTag, EPreis);

SELECT * FROM Film;
