/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-07
Aufgabe: 6-7
*****************************
######################################*/
#Aufgabestellung
-- Informieren Sie sich, welhce Backup-methoden für MySQL in Frage kommen.



My SQL DUMP
---------------------

Zur Sicherung einer MySQL Datenbank wird das Kommandozeilen-Tool mysqldump benötigt. Es wird standardmäßig zusammen mit dem MySQL Server installiert und wie folgt aufgerufen:
    -- mysqldump -u<Benutzername> -p<Passwort>  <opt>  <Datenbank> > <SQL-Datei>
        #Beispiel:
        -- mysqldump –uroot –ps3cr3t db1 > /backup/db1.sql

#MySQL Datenbank wiederherstelle
Die Syntax zum Wiederherstellein einer Datenbank lautet wie folgt:
    -- mysql -u<Benutzername> –p<Passwort> <Datenbank> < <SQL-Datei>
        #Beispiel:
        -- mysql –uroot –ps3cret db1 < /backup/db1.sql
        
        
        
File-Copy
-------------
- Backup erstellen: Das ganze Daten-verzeichnis /data wird gesichert
- Backup wiederherstellen: Den vorhandenen ordner löschen und den Backup ordner einfügen.


MySQL-Hotcopy
---------------------
- ./mysqlhotcopy <dbName> <ordner/>


MySQL-Backup
-------------------
Tool von MySQL Enterprise



#Bashscript
--------------
Ziur Sicherung aller Datenbankeni eines MySQL Servers kann folgendes Bashscript verwendet werden.
Es sichert jede Datenbank eines Servers in eine eigene SQL-Datei. Zu beachten ist, dass das Script die alten Sicherungen mit jedem Aufruf löscht. Die Sicherungen sollten danach also noch weiter verarbeitet werden.

#! /bin/bash
BACKUPDIR=<Sicherungsordner>
USERNAME=<Benutzername>
PASSWORD=<Passwort>

if [ -d $BACKUPDIR ]; then
    rm -r $BACKUPDIR
fi

mkdir $BACKUPDIR
cd $BACKUPDIR

DATABASES=`mysql -u$USERNAME -p$PASSWORD -Bse 'Zshow databases'`
for DATABASE in $DATABASES; do
    if [ "$DATABASE" != "information_schema" ]; then
        mysqldump -u$USERNAME -p$PASSWORD $DATABASE > ${DATABASE}.sql
done
