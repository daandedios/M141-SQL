#Importiert die Kundendaten in die Tabelle Kunde
USE Videothek;
DELETE FROM Kunde;
ALTER TABLE Kunde AUTO_INCREMENT = 1;
LOAD DATA LOCAL INFILE 'Kunden_UTF8.txt'
INTO TABLE Kunde
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
(Vorname, Nachname, Strasse, PLZ, Ort, Telefon_Festnetz, Telefon_Mobil, @Datum, Email)
SET Geburtsdatum = STR_TO_DATE(@Datum, '%d.%m.%Y');

SELECT * FROM Kunde;
