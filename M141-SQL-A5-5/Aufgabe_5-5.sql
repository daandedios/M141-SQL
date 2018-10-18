/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-07
Aufgabe: 5-5 View erstellen
*****************************
######################################
!! Dies sind die Musterlösungen !!
!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/
-- Aufgabe 1
CREATE OR REPLACE VIEW Anzahl_v AS
  SELECT COUNT(Videonummer) FROM Film;

-- Aufgabe 2
CREATE OR REPLACE VIEW Durchscnitt_V AS
  SELECT AVG(Dauer) FROM Film;

-- Aufgabe 3
CREATE OR REPLACE VIEW Summe_V AS
  SELECT SUM(Dauer) FROM Film;

-- Aufgabe 4
CREATE OR REPLACE VIEW Maximum_V AS
  SELECT MAX(Dauer) FROM Film;

-- Aufgabe 5
CREATE OR REPLACE VIEW Kunden_Anzahl_v AS
  SELECT COUNT(Kundennummer) FROM Kunde;

-- Aufgbae 6
CREATE OR REPLACE VIEW Filme_Kunden_V AS
  SELECT COUNT(Videonummer) AS 'Anzahl Flme' FROM Film
    UNION
  SELECT COUNT(Kundennummer) AS 'Anzahl Kunden' FROM Kunde;

-- Aufgabe 6b
CREATE OR REPLACE VIEW Filme_Kunden_V2 AS
  SELECT COUNT(Videonummer) AS 'Anzahl Filme', COUNT(Kundennummer) AS 'Anzahl Kunden' FROM Kunde
    LEFT JOIN  Film
    ON Kunde.Kundennummer = Film.Videonummer;
