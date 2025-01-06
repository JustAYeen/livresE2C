/* se connecter à mysql */
sudo mysql

/*quitter mysql */

exit

/*commandes de base */

SHOW DATABASES; /*la liste de bdd sur le serveur*/
CREATE DATABASE livres_e2c; /*Créer une bdd*/
USE livres_e2c /*Utiliser une bdd*/

/*gestion de compte*/
CREATE USER 'livres_e2c_admin'@'localhost' IDENTIDIED BY "t98yHS6tDAts44";
GRANT ALL PRIVILEGES ON livres_e2c.* TO 'livres_e2c_admin'@'localhost';

/* se connecter à mysql avec un compte utilisateur spécifique */

mysql -h localhost -u livres_e2c_admin -p

/*Créer une table*/
CREATE TABLE IF NOT EXISTS User (
    id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    telephone CHAR(10),
    site VARCHAR(30) NOT NULL
)ENGINE=InnoDB;

/*Voir table et détail des tables*/
SHOW TABLES;
DESCRIBE User;

/*Ajouter une colonne*/

ALTER TABLE User
ADD password VARCHAR(30) NOT NULL;

/*ajouter des données*/

INSERT INTO User(prenom, nom, pseudo, password, email, telephone, site)
VALUES ('Sophie', 'Carpentier', 'JustAYeen', 'EleveE2C2024', 'sophiesakuracarpentier@gmail.com', '0766298792', 'Lille');

INSERT INTO User(prenom, nom, pseudo, password, email, site)
VALUES  ('Atlas', 'Ito', 'AI', 'Jenesaispas', 'atlasito@gmail.com', 'Lille'),
        ('Jean', 'Dupont', 'JD', 'JJbfeic34d', 'jeandupont@gmail.com', 'Lille'),
        ('Amelie', 'Leroux', 'Jenesaispas', 'Jenedzsaisdzepas', 'amelieleroux@gmail.com', 'Lille');



/*Lire toutes les données d'une table*/

SELECT * FROM User;
SELECT prenom, nom, email FROM User;
SELECT prenom, nom, email FROM User ORDER BY prenom ASC;
SELECT prenom, nom, email FROM User ORDER BY email DESC;
SELECT pseudo, password FROM User WHERE pseudo = 'JustAYeen';
SELECT pseudo, password FROM User WHERE pseudo = 'Bisounours';
SELECT prenom, nom, pseudo FROM User WHERE site = 'Lille';

/*Gestion des sites*/

CREATE TABLE IF NOT EXISTS Sites(
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
)ENGINE=InnoDB;

INSERT INTO Sites (name)
VALUES ('Lille'), ('Roubaix'), ('Armentières'), ('Saint Omer');

SELECT * FROM Sites;

/*Première relation*/

ALTER TABLE User
ADD site_id TINYINT UNSIGNED NOT NULL;

UPDATE User SET site_id=1;
SELECT * FROM User;


ALTER TABLE User
ADD CONSTRAINT fk_sites
    FOREIGN KEY (site_id)
    REFERENCES Sites(id);

UPDATE User SET site_id = 1 WHERE site="Lille";
UPDATE User SET site_id = 2 WHERE site="Roubaix";
UPDATE User SET site_id = 3 WHERE site="Armentières";
UPDATE User SET site_id = 4 WHERE site="Saint Omer";

UPDATE User SET site_id = 5;

ALTER TABLE User
DROP site;

/*Jointure*/

SELECT User.pseudo, User.email, Sites.name FROM User INNER JOIN Sites ON User.site_id = Sites.id;


/*Les livres*/

CREATE TABLE IF NOT EXISTS Genre (
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Livres (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    auteur VARCHAR(255) NOT NULL DEFAULT "Inconnu",
    genre_id TINYINT UNSIGNED NOT NULL DEFAULT 1,
    synopsis TEXT,
    date_of_edition CHAR(4) NOT NULL DEFAULT '-NC-',
    pages SMALLINT,
    site_id TINYINT UNSIGNED NOT NULL,
    CONSTRAINT fk_genre
        FOREIGN KEY (genre_id)
        REFERENCES Genres(id),
    CONSTRAINT fk_sites_book
        FOREIGN KEY (site_id)
        REFERENCES Sites(id)
)ENGINE=InnoDB;

ALTER TABLE Livres
    ADD COLUMN user_id SMALLINT UNSIGNED;

ALTER TABLE Livres
    ADD CONSTRAINT fk_livres_user
    FOREIGN KEY (user_id)
    REFERENCES User(id);

/*Les jointures*/

SELECT titre, user_id FROM Livres;

SELECT Livres.titre, User.pseudo FROM Livres
    INNER JOIN User ON Livres.user_id = User.id;

SELECT Livres.titre, User.pseudo FROM Livres
    LEFT JOIN User ON Livres.user_id = User.id;

SELECT Livres.titre, User.pseudo FROM Livres
    RIGHT JOIN User ON Livres.user_id = User.id;

SELECT Livres.titre, User.pseudo, Genre.name FROM Livres
    INNER JOIN User ON Livres.user_id = User.id
    INNER JOIN Genre ON Livres.genre_id = Genre.id;

CREATE VIEW livres_vw AS (SELECT Livres.titre, Livres.auteur, Livres.date_of_edition AS date, Livres.pages, User.pseudo, Genre.name AS  genre, Sites.name AS site, Livres.id, Livres.genre_id, Livres.site_id, user_id FROM Livres
    LEFT JOIN User ON Livres.user_id = User.id
    LEFT JOIN Genre ON Livres.genre_id = Genre.id
    LEFT JOIN Sites ON Livres.site_id = Sites.id);

/*Recherche*/

SELECT * FROM livres_vw WHERE pages <= 100 ORDER BY pages ASC;

/*Relation plusieurs à plusieurs - Commentaires*/

CREATE TABLE IF NOT EXISTS Comments (
    comment TEXT NOT NULL,
    user_id SMALLINT UNSIGNED NOT NULL,
    livres_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, livres_id),
    CONSTRAINT fk_comment_user
        FOREIGN KEY (user_id)
        REFERENCES User(id),
    CONSTRAINT fk_comment_livre
        FOREIGN KEY (livres_id)
        REFERENCES Livres(id)
)ENGINE=InnoDB;

SELECT Livres.titre, User.pseudo, Comments.comment FROM Livres
    INNER JOIN Comments ON Livres.id = Comments.livre_id,
    INNER JOIN User ON Comments.user_id = User.id;