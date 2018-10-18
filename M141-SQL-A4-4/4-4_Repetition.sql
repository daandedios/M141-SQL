-- a) Erstellen einer Datenbank namens "DVD*
DROP DATABASE IF EXISTS dvd;
CREATE DATABASE dvd;
USE dvd;


-- b) Erstellen einer Tabelle namens "film" in der Datenbank "dvd", die meindestens 5 Felder enthalt.
CREATE TABLE filme (
  ID_dvd INT auto_increment primary key not null,
  Titel VARCHAR(30) NOT NULL,
  Regisseur VARCHAR(30) NOT NULL,
  Dauer INT NOT NULL,
  Genre VARCHAR(15) NOT NULL,
  Erstausstrahlung DATE NOT NULL,
  Preis INT NOT NULL,
  INDEX (Regisseur)
)
  ENGINE InnoDB;



-- c) Einfügen Eines Beisbieles
INSERT INTO filme (ID_dvd, Titel, Regisseur, Dauer, Genre, Erstausstrahlung, Preis) VALUES (DEFAULT, 'TestFilm', 'TestRegisseur', 2, 'Krimi', '2018-08-31', 60);
INSERT INTO filme (ID_dvd, Titel, Regisseur, Dauer, Genre, Erstausstrahlung, Preis) VALUES (DEFAULT, 'TestFilm2', 'TestRegisseur 2', 2, 'Krimi', '2018-08-31', 60);


-- d) Abfrage aller Filme
SELECT * FROM filme;


-- e) Ändern eines Feldes in einem bestimmten Film
UPDATE filme
  SET Titel = 'NeuerTestFilm'
  WHERE ID_dvd = 1;


-- f) Löschen eines Filmes
DELETE FROM filme
  WHERE ID_dvd = 2;
