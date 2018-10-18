#Fügt ein paar Filme in die Tabelle Film ein
USE Videothek;
DELETE FROM Film;
INSERT INTO `Film` VALUES (1, 'Einer flog über das Kuckucksnest', 134, 'Drama', 1975, 16, 8, 8);
INSERT INTO `Film` VALUES (2, 'Arsen und Spitzenhäubchen', 115, 'Klassiker', 1941, 12, 6, 6);
INSERT INTO `Film` VALUES (3, 'HIGH NOON', 82, 'Klassiker', 1952, 12, 8, NULL);
INSERT INTO `Film` VALUES (4, 'Die 39 Stufen', 86, 'Krimis', 1935, 16, 8, NULL);
INSERT INTO `Film` VALUES (5, 'Achteinhalb', 138, 'Drama', 1962, 16, 8, 8);
INSERT INTO `Film` VALUES (6, 'Amarcord', 127, 'Klassiker', 1973, 16, 8, NULL);
INSERT INTO `Film` VALUES (7, 'Papillon', 150, 'Action', 1973, 16, 8, NULL);
INSERT INTO `Film` VALUES (8, 'Full Metal Jacket', 116, 'Krieg', 1987, 16, 8, NULL);
INSERT INTO `Film` VALUES (9, 'Spiel mir das Lied vom Tod', 164, 'Western', 1968, 16, 8, NULL);
INSERT INTO `Film` VALUES (10, 'M', 117, 'Thriller', 1931, 16, 8, NULL);
INSERT INTO `Film` VALUES (11, 'Wittgenstein', 72, 'Komödie', 1992, 12, 8, 8);
INSERT INTO `Film` VALUES (12, 'Shrek - Der tollkühne Held', 90, 'Trickfilm', 2001, 10, 8, NULL);
INSERT INTO `Film` VALUES (13, 'Apocalypse Now', 153, 'Krieg', 1976, 16, 8, NULL);
INSERT INTO `Film` VALUES (14, 'Der Mann, der zuviel wusste', 75, 'Krimis', 1934, 12, 8, NULL);

SELECT * FROM Film;