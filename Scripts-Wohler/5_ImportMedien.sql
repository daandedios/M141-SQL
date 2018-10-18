#Importiert die Mediendaten in die Tabelle Medium
USE Videothek;
DELETE FROM MEDIUM;
LOAD DATA LOCAL INFILE 'Medien.txt'
INTO TABLE MEDIUM
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
(Mediumnummer, Videonummer, Art, Regal, Tablar);

SELECT * FROM MEDIUM;
