/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-07
Aufgabe: 5-3
*****************************
######################################
!! Dies sind die Musterlösungen !!
!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/

USE Videothek;
DROP PROCEDURE IF EXISTS DauerAuswertung2;

DELIMITER //
CREATE PROCEDURE DauerAuswertung2 (IN z CHAR)
BEGIN
DECLARE Hinweis CHAR(30) DEFAULT 'Geben Sie A, S oder M ein';
CASE
WHEN z = 'A' THEN SELECT AVG(dauer) AS durchschnitt FROM film;
WHEN z = 'S' THEN SELECT SUM(dauer) AS summe FROM film;
WHEN z = 'M' THEN SELECT MAX(dauer) AS maximum FROM film;
ELSE SELECT Hinweis;
END CASE;
END//
DELIMITER ;

CALL Dauerauswertung2('A');

USE Videothek;
GRANT EXECUTE
ON PROCEDURE DauerAuswertung2
TO root@localhost
IDENTIFIED BY 'Daan301200';
FLUSH PRIVILEGES;
