#Fügt ein paar Ausleihdaten in die Tabelle Ausleihe ein
USE Videothek;
DELETE FROM Ausleihe;
INSERT INTO Ausleihe (Kundennummer, Mediumnummer, Ausleihe) VALUES
(1, 1, '2010-11-30'),
(1, 2, '2010-11-30'),
(2, 1, '2010-10-20');

SELECT * FROM Ausleihe;