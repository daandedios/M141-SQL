/*
*****************************
developer: Daan de Dios
date: 2018-10-26
function: 7-1
*****************************
######################################
!! Dies sind die meine Lösungen !!
!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/

/*Aufgabe 1
Wie Vile Datensätze weist die Tabelle kunde auf ?*/
SELECT COUNT(*) FROM Kunde;
/*8719*/


/*Aufgabe 2
Wie vile Kunden kommen aus Wil ?*/
SELECT COUNT(*) FROM Kunde
  WHERE Ort = "Wil";
/*2*/


/*Aufgabe 3
Wie vile Kunden heissen Müller, die nicht aus Aarau kommen ?*/
SELECT COUNT(*) FROM Kunde
  WHERE Nachname LIKE "M%ller"
  AND Ort != "Aarau";
/*8*/


/*Aufgabe 4
Wie vile Kunden heissen Müller und kommen aus Aarau ?*/
SELECT COUNT(*) FROM Kunde
  WHERE Nachname LIKE "M%ller"
  AND Ort = "Aarau";
/*8*/


/*Aufgabe 5
Wie vile Kunden gibt es, die zum Vornamen Urs heissen ?*/
SELECT COUNT(*) FROM Kunde
  WHERE Vorname = "Urs";
/*57*/


/*Aufgabe 6
Wie vile Kunden kommen aus Wil SG*/
SELECT COUNT(*) FROM Kunde
  WHERE Ort = "Wil SG";
/*Mit Logischen Operatoren
WHERE Ort LIKE "Wil SG";*/
/*1736*/


/*Aufgabe 7
Wie viele Kunden gibt es, die Gerber heissen und deren Vorname mit A beginnt ?*/
SELECT COUNT(*) FROM Kunde
  WHERE Nachname = "Gerber"
  AND Vorname LIKE "A%";
/*3*/


/*Aufgabe 8
Wie viele Kunden gibt es, welche im Nachnamen "von" als Wortbestandteil haben ?*/
SELECT * FROM Kunde
  WHERE Nachname LIKE "%von%";
/*27*/


/*Aufgabe 9
Welcher Ort hat die meisten Kunden, deren Nachnamen mit "von" beginnt ?*/
SELECT Ort, COUNT(Ort) AS "Anzahl" FROM Kunde
  WHERE Nachname LIKE "%von%"
  GROUP BY Ort
  ORDER BY Anzahl DESC;
/*Kloten*/


/*Aufgabe 10
Aus wie vielen verschiedenen Ortschaften kommen die Kunden ?*/
SELECT COUNT(Ort) AS "AnzahlVerschideneOrtschaften" FROM Kunde
  GROUP BY Ort;
/*35*/