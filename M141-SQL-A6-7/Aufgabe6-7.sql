/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-07
Aufgabe: 6-7
*****************************
######################################
!! Dies sind die Musterlösungen !!
!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/

#Aufgabestellung
-- Sie erhalten den Auftrag, auf dem MySQL-Server bestehende Daten zu Sichern.

#Vorgehensweise:
  -- Informieren Sie sich, welhce Backup-methoden für MySQL in Frage kommen.
  -- Fassen Sie diese Backup-Methoden schriftlich zusammen (mindestens 2). (mit befehle backup/widerherstellung) (1/2 A4)
  -- Erstellen Sie ein Backup der Datenbank Videothek
  -- Testen Sie das Backup: DROP DATABASE --> Wiederherstellen



--  Informationen zu Backup-methoden in der Datei "Backup_Methoden.md"


-- Erstelen Sie ein Backup
mysqldump -u<Benutzername> -p<Passwort> <Datenbank> > <SQL-Datei>

  -- Für Mac und Linux:
    ./mysqldump -uroot -p Videothek > /Users/Daan/Desktop/Backup.sql


-- Datenbak löschen und wieder erstellen
DROP DATABASE Videothek;
CREATE DATABASE Videothek;

-- Wiederherstellen
mysql -u<Benutzername> –p<Passwort> <Datenbank> < <SQL-Datei>
  -- Für Mac und Linux:
    ./mysql -u root -p Videothek < /Users/Daan/Desktop/Backup.sql

-- Nun sind alle Daten wider am Selben Ort...

