/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-02
Aufgabe: A6 - SELECT-DML 2
*****************************
######################################
!! Um diese Aufgabe zu lösen Benötigt ihr die "Videothek" Datenbbakt.

!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/
USE videothek;

-- Fred mit Vollzugriff wird erstellt
Grant all on videothek.* TO 'fred'@'localhost' identified by 'fredpass';
Flush Privileges;

-- Fred's Rechte werden gelöscht
revoke all privileges on videothek.* from 'fred'@'localhost';
Flush Privileges;

-- Eva mit Lesezugriff wird erstellt
Grant select on videothek.* TO 'eva'@'localhost' identified by 'evapass';
Flush Privileges;

-- Maria mit Lesezugriff und Update auf einzelne Spalten wird erstellt
Grant select on videothek.* TO 'maria'@'localhost' identified by 'mariapass';
Grant update (Titel, Dauer, Jahr, FreiAb, PreisProTag, Land) on videothek.film to 'maria'@'localhost';
Flush Privileges;
