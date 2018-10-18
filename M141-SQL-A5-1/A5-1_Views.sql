/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-02
Aufgabe: A5-1 - Views erzeugen (Videothek)
*****************************
######################################
!! Um diese Aufgabe zu lösen Benötigt ihr die "Videothek" Datenbbakt.

!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/

-- View AlleMeier_v erstellen
CREATE OR REPLACE VIEW AlleMeirer_v AS
  SELECT Nachname FROM kunde
    WHERE Nachname = 'Meier';

-- View Filmablage.v erstellen
CREATE OR REPLACE VIEW Filmablage_v AS
  SELECT Titel, Dauer, Jahr, Art, Regal, Tablar FROM film
    INNER JOIN medium
      ON film.Videonummer = medium.Videonummer
        WHERE Dauer = 82
        AND Dauer = 134;


-- Befehle zur abfrage
SELECT * FROM videothek.allemeirer_v;

SELECT * FROM videothek.filmablage_v;