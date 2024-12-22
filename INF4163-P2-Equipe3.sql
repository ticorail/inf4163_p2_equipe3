/*Création de la BDD*/

CREATE DATABASE movies
    DEFAULT CHARACTER SET = 'utf8mb4';

/*Création des tables*/

-- Table Utilisateurs
CREATE TABLE Utilisateurs (
    utilisateur_id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL
);

-- Table Films
CREATE TABLE Films (
    film_id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    date_sortie DATETIME NOT NULL,
    realisateur VARCHAR(255),
    description TEXT
);

-- Table Genres
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL
);

-- Table Film_Genres
CREATE TABLE Film_Genres (
    film_id INT,
    genre_id INT,
    PRIMARY KEY (film_id, genre_id),
    FOREIGN KEY (film_id) REFERENCES Films(film_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) ON DELETE CASCADE
);

-- Table Appréciations
CREATE TABLE Appreciations (
    appreciation_id INT PRIMARY KEY AUTO_INCREMENT,
    utilisateur_id INT,
    film_id INT,
    note INT CHECK (note BETWEEN 1 AND 5),
    date_appreciation DATETIME NOT NULL,
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(utilisateur_id) ON DELETE CASCADE,
    FOREIGN KEY (film_id) REFERENCES Films(film_id) ON DELETE CASCADE
);

-- Table Appreciation_Tags
CREATE TABLE Appreciation_Tags (
    appreciation_id INT,
    tag VARCHAR(255),
    PRIMARY KEY (appreciation_id, tag),
    FOREIGN KEY (appreciation_id) REFERENCES Appreciations(appreciation_id) ON DELETE CASCADE
);

/*Insertion des données*/
-- Active: 1734818262758@@127.0.0.1@3306@movies
-- Insertion de données dans la table Utilisateurs
INSERT INTO Utilisateurs (nom) VALUES
('Alice'), ('Bob'), ('Charlie'), ('Diana'), ('Eve'),
('Frank'), ('Grace'), ('Hannah'), ('Ivy'), ('Jack'),
('Karen'), ('Leo'), ('Mona'), ('Nina'), ('Oscar'),
('Paul'), ('Quincy'), ('Rose'), ('Steve'), ('Tina');

-- Insertion de données dans la table Films
INSERT INTO Films (titre, date_sortie, realisateur, description) VALUES
('Inception', '2010-07-16', 'Christopher Nolan', 'A thief who steals corporate secrets through dream-sharing.'),
('The Matrix', '1999-03-31', 'Lana Wachowski', 'A computer hacker learns about the true nature of reality.'),
('Titanic', '1997-12-19', 'James Cameron', 'A love story on the ill-fated RMS Titanic.'),
('Avatar', '2009-12-18', 'James Cameron', 'A paraplegic Marine dispatched to Pandora.'),
('The Avengers', '2012-05-04', 'Joss Whedon', 'Earth’s mightiest heroes must come together.'),
('Interstellar', '2014-11-07', 'Christopher Nolan', 'A team of explorers travel through a wormhole.'),
('The Dark Knight', '2008-07-18', 'Christopher Nolan', 'Batman battles the Joker.'),
('Forrest Gump', '1994-07-06', 'Robert Zemeckis', 'The life journey of Forrest Gump.'),
('Gladiator', '2000-05-05', 'Ridley Scott', 'A betrayed Roman General fights for justice.'),
('Jurassic Park', '1993-06-11', 'Steven Spielberg', 'A theme park suffers a major power breakdown.'),
('The Godfather', '1972-03-24', 'Francis Ford Coppola', 'The story of a powerful crime family.'),
('Star Wars', '1977-05-25', 'George Lucas', 'A young farm boy joins a rebellion.'),
('The Lion King', '1994-06-15', 'Roger Allers', 'A lion prince flees his kingdom.'),
('Pulp Fiction', '1994-10-14', 'Quentin Tarantino', 'The lives of two mob hitmen intersect.'),
('The Shawshank Redemption', '1994-09-23', 'Frank Darabont', 'Two imprisoned men bond over years.'),
('Schindler’s List', '1993-12-15', 'Steven Spielberg', 'A businessman saves hundreds of Jews.'),
('Fight Club', '1999-10-15', 'David Fincher', 'An insomniac office worker forms a fight club.'),
('The Lord of the Rings', '2001-12-19', 'Peter Jackson', 'A meek hobbit and eight companions set out on a journey.'),
('The Social Network', '2010-10-01', 'David Fincher', 'The story of Facebook’s founding.'),
('The Grand Budapest Hotel', '2014-03-28', 'Wes Anderson', 'The adventures of a hotel concierge.');

-- Insertion de données dans la table Genres
INSERT INTO Genres (nom) VALUES
('Action'), ('Comédie'), ('Drame'), ('Science-Fiction'), ('Romance'),
('Thriller'), ('Animation'), ('Fantasy'), ('Horreur'), ('Historique');

-- Insertion de données dans la table Film_Genres
INSERT INTO Film_Genres (film_id, genre_id) VALUES
(1, 4), (2, 4), (3, 5), (4, 4), (5, 1),
(6, 4), (7, 6), (8, 3), (9, 1), (10, 4),
(11, 6), (12, 8), (13, 7), (14, 6), (15, 3),
(16, 9), (17, 6), (18, 8), (19, 3), (20, 2);

-- Insertion de données dans la table Appreciations
INSERT INTO Appreciations (utilisateur_id, film_id, note, date_appreciation) VALUES
(1, 1, 5, '2024-01-01'), (2, 2, 4, '2024-01-05'),
(3, 3, 3, '2024-01-10'), (4, 4, 2, '2024-01-15'),
(5, 5, 4, '2024-01-20'), (6, 6, 5, '2024-01-25'),
(7, 7, 3, '2024-01-30'), (8, 8, 4, '2024-02-01'),
(9, 9, 5, '2024-02-05'), (10, 10, 2, '2024-02-10'),
(11, 11, 5, '2024-02-15'), (12, 12, 4, '2024-02-20'),
(13, 13, 5, '2024-02-25'), (14, 14, 3, '2024-03-01'),
(15, 15, 4, '2024-03-05'), (16, 16, 5, '2024-03-10'),
(17, 17, 4, '2024-03-15'), (18, 18, 3, '2024-03-20'),
(19, 19, 5, '2024-03-25'), (20, 20, 4, '2024-03-30');

-- Insertion de données dans la table Appreciation_Tags
INSERT INTO Appreciation_Tags (appreciation_id, tag) VALUES
(1, 'Amazing'), (2, 'Incredible'), (3, 'Good'), (4, 'Disappointing'),
(5, 'Fantastic'), (6, 'Masterpiece'), (7, 'Mediocre'), (8, 'Emotional'),
(9, 'Thrilling'), (10, 'Classic'), (11, 'Iconic'), (12, 'Epic'),
(13, 'Heartwarming'), (14, 'Confusing'), (15, 'Touching'),
(16, 'Legendary'), (17, 'Exciting'), (18, 'Boring'),
(19, 'Unique'), (20, 'Hilarious');

-- Insertion de 30 nouveaux utilisateurs
INSERT INTO Utilisateurs (nom) VALUES
('Ulysses'), ('Victor'), ('Wendy'), ('Xander'), ('Yara'),
('Zach'), ('Aaron'), ('Bella'), ('Carter'), ('Daphne'),
('Elena'), ('Felix'), ('Georgia'), ('Harvey'), ('Irene'),
('Jasper'), ('Kyle'), ('Laura'), ('Mason'), ('Natalie'),
('Oliver'), ('Penelope'), ('Quentin'), ('Rachel'), ('Samuel'),
('Tessa'), ('Uma'), ('Violet'), ('William'), ('Xenia');

-- Insertion de 30 nouveaux films
INSERT INTO Films (titre, date_sortie, realisateur, description) VALUES
('Blade Runner', '1982-06-25', 'Ridley Scott', 'A dystopian future with bioengineered beings.'),
('The Truman Show', '1998-06-05', 'Peter Weir', 'A man discovers his life is a reality TV show.'),
('Goodfellas', '1990-09-19', 'Martin Scorsese', 'The rise and fall of a mob associate.'),
('Casablanca', '1942-11-26', 'Michael Curtiz', 'A love story set during World War II.'),
('The Shining', '1980-05-23', 'Stanley Kubrick', 'A family isolated in a haunted hotel.'),
('Se7en', '1995-09-22', 'David Fincher', 'Two detectives hunt a serial killer.'),
('Toy Story', '1995-11-22', 'John Lasseter', 'Toys come to life when humans aren’t around.'),
('The Incredibles', '2004-11-05', 'Brad Bird', 'A family of superheroes fights to save the world.'),
('Coco', '2017-11-22', 'Lee Unkrich', 'A boy discovers his family’s history during Día de Muertos.'),
('Finding Nemo', '2003-05-30', 'Andrew Stanton', 'A clownfish searches for his son.'),
('Shrek', '2001-05-18', 'Andrew Adamson', 'An ogre and a donkey rescue a princess.'),
('Up', '2009-05-29', 'Pete Docter', 'A widower travels to South America in a floating house.'),
('Jaws', '1975-06-20', 'Steven Spielberg', 'A giant shark terrorizes a small town.'),
('Rocky', '1976-12-03', 'John G. Avildsen', 'A small-time boxer gets a chance at the big leagues.'),
('A Beautiful Mind', '2001-12-21', 'Ron Howard', 'A mathematician struggles with schizophrenia.'),
('Slumdog Millionaire', '2008-11-12', 'Danny Boyle', 'A young man recalls his life on a quiz show.'),
('La La Land', '2016-12-09', 'Damien Chazelle', 'A jazz musician and an actress pursue their dreams.'),
('Django Unchained', '2012-12-25', 'Quentin Tarantino', 'A freed slave seeks to rescue his wife.'),
('The Great Gatsby', '2013-05-10', 'Baz Luhrmann', 'A mysterious millionaire throws extravagant parties.'),
('Amélie', '2001-04-25', 'Jean-Pierre Jeunet', 'A shy waitress helps those around her.'),
('Black Panther', '2018-02-16', 'Ryan Coogler', 'A superhero defends his African nation.'),
('Inside Out', '2015-06-19', 'Pete Docter', 'A young girl’s emotions navigate her life.'),
('Frozen', '2013-11-27', 'Chris Buck', 'A princess with ice powers brings winter to her kingdom.'),
('Wall-E', '2008-06-27', 'Andrew Stanton', 'A lonely robot cleans up Earth’s trash.'),
('The Revenant', '2015-12-25', 'Alejandro G. Iñárritu', 'A frontiersman survives a bear attack.'),
('Parasite', '2019-05-30', 'Bong Joon Ho', 'A poor family infiltrates a wealthy household.'),
('The Irishman', '2019-11-01', 'Martin Scorsese', 'A mob hitman recalls his past.'),
('Joker', '2019-10-04', 'Todd Phillips', 'A failed comedian becomes a criminal mastermind.'),
('The Pianist', '2002-09-25', 'Roman Polanski', 'A pianist survives the Holocaust.'),
('Whiplash', '2014-10-10', 'Damien Chazelle', 'A drummer endures a harsh instructor.');

-- Insertion de 30 nouveaux genres (uniques ou partagés)
INSERT INTO Film_Genres (film_id, genre_id) VALUES
(21, 4), (22, 3), (23, 6), (24, 3), (25, 9),
(26, 6), (27, 7), (28, 7), (29, 7), (30, 7),
(31, 7), (32, 8), (33, 6), (34, 6), (35, 3),
(36, 9), (37, 6), (38, 1), (39, 8), (40, 8),
(21, 2), (22, 5), (23, 9), (24, 5), (25, 1),
(26, 4), (27, 2), (28, 3), (29, 8), (30, 9);

-- Insertion de 30 nouvelles appréciations
INSERT INTO Appreciations (utilisateur_id, film_id, note, date_appreciation) VALUES
(21, 21, 4, '2024-04-01'), (22, 22, 5, '2024-04-02'),
(23, 23, 4, '2024-04-03'), (24, 24, 3, '2024-04-04'),
(25, 25, 2, '2024-04-05'), (26, 26, 4, '2024-04-06'),
(27, 27, 5, '2024-04-07'), (28, 28, 3, '2024-04-08'),
(29, 29, 4, '2024-04-09'), (30, 30, 5, '2024-04-10'),
(21, 31, 5, '2024-04-11'), (22, 32, 4, '2024-04-12'),
(23, 33, 5, '2024-04-13'), (24, 34, 3, '2024-04-14'),
(25, 35, 4, '2024-04-15'), (26, 36, 5, '2024-04-16'),
(27, 37, 4, '2024-04-17'), (28, 38, 3, '2024-04-18'),
(29, 39, 5, '2024-04-19'), (30, 40, 4, '2024-04-20');

-- Insertion de 30 nouveaux tags pour les appréciations
INSERT INTO Appreciation_Tags (appreciation_id, tag) VALUES
(21, 'Classic'), (22, 'Timeless'), (23, 'Intense'), (24, 'Magical'),
(25, 'Dark'), (26, 'Thoughtful'), (27, 'Action-packed'), (28, 'Heartfelt'),
(29, 'Innovative'), (30, 'Amazing'), (31, 'Legendary'), (32, 'Groundbreaking'),
(33, 'Tense'), (34, 'Bold'), (35, 'Masterful'), (36, 'Chilling'),
(37, 'Inspiring'), (38, 'Engaging'), (39, 'Riveting'), (40, 'Poignant');


-- Ajout de nouvelles appréciations pour les films existants
INSERT INTO Appreciations (utilisateur_id, film_id, note, date_appreciation) VALUES
(1, 1, 5, '2024-05-01'), (2, 2, 4, '2024-05-02'), (3, 3, 3, '2024-05-03'),
(4, 4, 5, '2024-05-04'), (5, 5, 4, '2024-05-05'), (6, 6, 5, '2024-05-06'),
(7, 7, 4, '2024-05-07'), (8, 8, 3, '2024-05-08'), (9, 9, 5, '2024-05-09'),
(10, 10, 4, '2024-05-10'), (11, 11, 5, '2024-05-11'), (12, 12, 3, '2024-05-12'),
(13, 13, 4, '2024-05-13'), (14, 14, 5, '2024-05-14'), (15, 15, 3, '2024-05-15'),
(16, 16, 4, '2024-05-16'), (17, 17, 5, '2024-05-17'), (18, 18, 3, '2024-05-18'),
(19, 19, 4, '2024-05-19'), (20, 20, 5, '2024-05-20'), (21, 21, 5, '2024-05-21'),
(22, 22, 4, '2024-05-22'), (23, 23, 3, '2024-05-23'), (24, 24, 5, '2024-05-24'),
(25, 25, 4, '2024-05-25'), (26, 26, 5, '2024-05-26'), (27, 27, 4, '2024-05-27'),
(28, 28, 3, '2024-05-28'), (29, 29, 5, '2024-05-29'), (30, 30, 4, '2024-05-30');

-- Ajout de nouvelles associations de tags pour les films avec appréciations multiples
INSERT INTO Appreciation_Tags (appreciation_id, tag) VALUES
(41, 'Imaginative'), (42, 'Exciting'), (43, 'Heartfelt'), (44, 'Joyful'),
(45, 'Mysterious'), (46, 'Dynamic'), (47, 'Rich Storytelling'), (48, 'Bold Aesthetic'),
(49, 'Cultural'), (50, 'Entertaining'), (51, 'Well-acted'), (52, 'Cinematic'),
(53, 'Rich Characters'), (54, 'Thoughtful'), (55, 'Impactful'), (56, 'Visually Stunning'),
(57, 'Emotionally Gripping'), (58, 'Lyrical'), (59, 'Funny'), (60, 'Relatable');

INSERT INTO Appreciation_Tags (appreciation_id, tag) VALUES
(41, 'Amazing')

INSERT INTO Appreciation_Tags (appreciation_id, tag) VALUES
(41, 'Thrilling'), (42, 'Beautiful'), (43, 'Hilarious'), (44, 'Heartwarming'),
(45, 'Epic'), (46, 'Masterpiece'), (47, 'Creative'), (48, 'Groundbreaking'),
(49, 'Timeless'), (50, 'Uplifting'), (51, 'Innovative'), (52, 'Charming'),
(53, 'Suspenseful'), (54, 'Inspiring'), (55, 'Bold'), (56, 'Intriguing'),
(57, 'Engaging'), (58, 'Touching'), (59, 'Captivating'), (60, 'Unforgettable'),
(61, 'Magical'), (62, 'Riveting'), (63, 'Powerful'), (64, 'Dramatic'),
(65, 'Memorable'), (66, 'Classic'), (67, 'Adventurous'), (68, 'Compelling'),
(69, 'Funny'), (70, 'Thought-provoking')

/*Création des fonctions*/

-- FilmVues
DELIMITER //

DROP PROCEDURE FilmVues;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FilmVues`(IN user_id INT)
BEGIN
    SELECT DISTINCT f.*
    FROM Appreciations a
    JOIN Films f ON a.film_id = f.film_id
    WHERE a.utilisateur_id = user_id;
END

DELIMITER ;

-- Collaborateurs
DELIMITER //
DROP PROCEDURE Collaborateurs;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Collaborateurs`(IN user_id INT)
BEGIN
    SELECT DISTINCT 
        u.nom AS collaborateur_nom,
        f.titre,
        a.note AS collaborateur_note
    FROM Appreciations a
    JOIN Films f ON a.film_id = f.film_id
    JOIN Appreciations a2 ON a2.film_id = a.film_id
    JOIN Utilisateurs u ON a.utilisateur_id = u.utilisateur_id
    WHERE a2.utilisateur_id = user_id 
      AND a.utilisateur_id != user_id;
DELIMITER ;

-- Genre populaire
DELIMITER //
DROP PROCEDURE GenrePopulaire;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenrePopulaire`(IN genre_name VARCHAR(255))
    READS SQL DATA
BEGIN
    SELECT 
        f.titre,
        g.nom AS genre,
        COUNT(DISTINCT a.utilisateur_id) as nb_utilisateurs,
        SUM(CASE WHEN a.note = 1 THEN 1 ELSE 0 END) as votes_1,
        SUM(CASE WHEN a.note = 2 THEN 1 ELSE 0 END) as votes_2,
        SUM(CASE WHEN a.note = 3 THEN 1 ELSE 0 END) as votes_3,
        SUM(CASE WHEN a.note = 4 THEN 1 ELSE 0 END) as votes_4,
        SUM(CASE WHEN a.note = 5 THEN 1 ELSE 0 END) as votes_5
    FROM Films f
    INNER JOIN Film_Genres fg ON f.film_id = fg.film_id
    INNER JOIN Genres g ON fg.genre_id = g.genre_id
    LEFT JOIN Appreciations a ON f.film_id = a.film_id
    WHERE g.nom = genre_name
    GROUP BY f.titre, g.nom
    ORDER BY nb_utilisateurs DESC
    LIMIT 5;
END
DELIMITER ;

-- RecommanderFilm
DROP PROCEDURE RecommanderFilm;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RecommanderFilm`(IN user_id INT, IN film_id INT)
BEGIN
    SELECT CASE
        WHEN EXISTS (
            SELECT 1
            FROM Appreciations a1
            JOIN Appreciations a2 ON a1.film_id = a2.film_id
            WHERE a2.utilisateur_id = user_id
              AND a1.film_id = film_id
              AND a1.note > 3
        ) AND NOT EXISTS (
            SELECT 1
            FROM Appreciations a
            WHERE a.utilisateur_id = user_id
              AND a.film_id = film_id
        )
        THEN 'Recommandé'
        ELSE 'Non recommandé'
    END AS recommandation;
END

-- Vue finale qui combine les films populaires par genre avec les recommandations possibles
CREATE OR REPLACE VIEW FilmsPopulairesRecommandations AS
WITH 
    FilmsPopulairesParGenre AS (
        SELECT 
            f.film_id,
            f.titre,
            g.nom AS genre,
            COUNT(DISTINCT a.utilisateur_id) as nb_vues,
            SUM(CASE WHEN a.note = 1 THEN 1 ELSE 0 END) as votes_1,
            SUM(CASE WHEN a.note = 2 THEN 1 ELSE 0 END) as votes_2,
            SUM(CASE WHEN a.note = 3 THEN 1 ELSE 0 END) as votes_3,
            SUM(CASE WHEN a.note = 4 THEN 1 ELSE 0 END) as votes_4,
            SUM(CASE WHEN a.note = 5 THEN 1 ELSE 0 END) as votes_5
        FROM Films f
        INNER JOIN Film_Genres fg ON f.film_id = fg.film_id
        INNER JOIN Genres g ON fg.genre_id = g.genre_id
        LEFT JOIN Appreciations a ON f.film_id = a.film_id
        GROUP BY f.film_id, f.titre, g.nom
    )
SELECT 
    fp.titre,
    fp.genre,
    fp.nb_vues,
    fp.votes_1,
    fp.votes_2,
    fp.votes_3,
    fp.votes_4,
    fp.votes_5,
    u.utilisateur_id,
    u.nom AS nom_utilisateur,
    CASE 
        WHEN EXISTS (
            -- Vérifie si les collaborateurs ont bien noté ce film
            SELECT 1
            FROM Appreciations a1
            JOIN Appreciations a2 ON a1.film_id = a2.film_id
            WHERE a2.utilisateur_id = u.utilisateur_id
              AND a1.film_id = fp.film_id
              AND a1.note > 3
        ) 
        AND NOT EXISTS (
            -- Vérifie que l'utilisateur n'a pas déjà vu ce film
            SELECT 1
            FROM Appreciations a
            WHERE a.utilisateur_id = u.utilisateur_id
              AND a.film_id = fp.film_id
        )
        THEN 'Recommandé'
        ELSE 'Non recommandé'
    END as recommandation
FROM FilmsPopulairesParGenre fp
CROSS JOIN Utilisateurs u 
ORDER BY 
    fp.genre,
    fp.nb_vues DESC

-- Tests
CALL FilmVues(30);

CALL Collaborateurs(1);

CALL RecommanderFilm(1,30);

CALL GenrePopulaire('Action');

SELECT * FROM FilmsPopulairesRecommandations;

