/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-07
Aufgabe: 5-4
*****************************
######################################
!! Dies sind die Musterlösungen !!
!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/

-- Datenbank aufwählen
USE Videothek;

-- Zusätzliches Feld erstellen
ALTER TABLE Kunde
  ADD COLUMN alter_ int;

-- Neuer Benutzer erstellen
CREATE USER 'FilmMediaAdmin'@'localhost' IDENTIFIED BY 'FilmMediaAdminPass';

-- Trigger erstellen
DELIMITER //
CREATE TRIGGER AlterBerechnen
  BEFORE INSERT ON Kunde FOR EACH ROW
BEGIN
  SET NEW.alter_ = YEAR(CURRENT_DATE()) - YEAR(NEW.Geburtsdatum);
end //
DELIMITER ;

-- Instert Erstellen
INSERT INTO Kunde (Kundennummer, Anrede, Vorname, Nachname, Strasse, PLZ, Ort, Telefon_Festnetz, Telefon_Mobil, Geburtsdatum, Email, alter_) VALUES (DEFAULT, 'Herr', 'Daan', 'de Dios', 'Ruheberg', '9403', 'G-City', '1297878', '00012781782', '2000-12-30', 'test@mail.com', DEFAULT);

-- Triger Testen
SELECT * FROM Kunde
  WHERE Vorname = 'Daan';