-- la creation des tableux et linké entre eux
create table membre (
    id primary key ,
    pseudo varchar(50),
    email varchar(50),
    date_inscription date
);
create table jeux (
    id primary key ,
    titre varchar(50),
    studio_developpement varchar(50),
    date_sortie date ,
    genre varchar(50),
    mutijoueur boolean
);
create table tournoi (
    id primary key ,
    nom_tournoi varchar(50),
    date_tournoi date,
    recompenses varchar(50) 
);
create table abonnement (
    id primary key ,
    type_abonnement varchar(50),
    date_debut varchar(50),
    date_fin date 
);
create table emprunter (
    date_emprunte date,
    date_retour_prevue date,
    date_retour_reelle date,
    membre_id int ,
    jeux_id int ,
    FOREIGN key (membre_id) references membre(id) ,
    FOREIGN key (jeux_id) references jeu(id)
);
create table particpe (
    score int ,
    rang_final int ,
    membre_id int ,
    tournoi_id int ,
    FOREIGN key (membre_id) references membre(id),
    FOREIGN key (tournoi_id) references tournoi(id)
);

-- Insertion de 20 membres
INSERT INTO membre (id, pseudo, email, date_inscription) VALUES
(1, 'Hamza', 'hamza.akroubi@example.com', '2024-01-10'),
(2, 'Aya', 'aya.smith@example.com', '2024-01-15'),
(3, 'Youssef', 'youssef.benjelloun@example.com', '2024-02-01'),
(4, 'Sara', 'sara.bennani@example.com', '2024-02-05'),
(5, 'Omar', 'omar.elhassan@example.com', '2024-02-10'),
(6, 'Rania', 'rania.larbi@example.com', '2024-02-20'),
(7, 'Mehdi', 'mehdi.filali@example.com', '2024-03-01'),
(8, 'Nada', 'nada.ouazzani@example.com', '2024-03-05'),
(9, 'Anas', 'anas.tazi@example.com', '2024-03-10'),
(10, 'Fatima', 'fatima.elalamy@example.com', '2024-03-15'),
(11, 'Hicham', 'hicham.kamal@example.com', '2024-03-20'),
(12, 'Leila', 'leila.maarouf@example.com', '2024-04-01'),
(13, 'Khalid', 'khalid.mekouar@example.com', '2024-04-10'),
(14, 'Meryem', 'meryem.fassi@example.com', '2024-04-15'),
(15, 'Samir', 'samir.bekkali@example.com', '2024-04-20'),
(16, 'Imane', 'imane.sekkat@example.com', '2024-05-01'),
(17, 'Said', 'said.darif@example.com', '2024-05-05'),
(18, 'Zineb', 'zineb.elidrissi@example.com', '2024-05-10'),
(19, 'Mohamed', 'mohamed.aitbaha@example.com', '2024-05-20'),
(20, 'Hanae', 'hanae.abbassi@example.com', '2024-05-25');


-- Insertion de 10 jeux
INSERT INTO jeux (id, titre, studio_developpement, date_sortie, genre, multijoueur) VALUES
(1, 'The Witcher 3', 'CD Projekt Red', '2015-05-19', 'Action RPG', FALSE),
(2, 'FIFA 24', 'EA Sports', '2023-09-29', 'Sports', TRUE),
(3, 'Minecraft', 'Mojang', '2011-11-18', 'Sandbox', TRUE),
(4, 'Elden Ring', 'FromSoftware', '2022-02-25', 'Action RPG', FALSE),
(5, 'League of Legends', 'Riot Games', '2009-10-27', 'MOBA', TRUE),
(6, 'Fortnite', 'Epic Games', '2017-07-21', 'Battle Royale', TRUE),
(7, 'God of War', 'Santa Monica Studio', '2018-04-20', 'Action-Adventure', FALSE),
(8, 'Cyberpunk 2077', 'CD Projekt Red', '2020-12-10', 'Action RPG', FALSE),
(9, 'Among Us', 'Innersloth', '2018-06-15', 'Party Game', TRUE),
(10, 'Apex Legends', 'Respawn Entertainment', '2019-02-04', 'Battle Royale', TRUE);

-- Insertion de 10 tournois
INSERT INTO tournoi (id, nom_tournoi, date_tournoi, recompenses) VALUES
(1, 'Tournoi FIFA 2024', '2024-01-15', '1000€'),
(2, 'Championnat Fortnite', '2024-02-10', '5000€ et un PC gaming'),
(3, 'League of Legends Cup', '2024-03-05', '3000€'),
(4, 'Minecraft Build Battle', '2024-04-01', '1000€ et une console Xbox'),
(5, 'Elden Ring Speedrun', '2024-04-20', '2000€'),
(6, 'Tournoi Call of Duty', '2024-05-15', '5000€ et des accessoires gaming'),
(7, 'Valorant Open', '2024-06-10', '3000€'),
(8, 'Apex Legends Tournament', '2024-07-01', '2500€ et une PS5'),
(9, 'PUBG World Cup', '2024-08-05', '10000€'),
(10, 'Overwatch 2 Championship', '2024-09-15', '7000€ et une souris gaming');

-- Insertion de 5 abonnements
INSERT INTO abonnement (id, type_abonnement, date_debut, date_fin) VALUES
(1, 'Mensuel', '2024-01-01', '2024-01-31'),
(2, 'Trimestriel', '2024-02-01', '2024-04-30'),
(3, 'Annuel', '2024-03-01', '2025-02-28'),
(4, 'Hebdomadaire', '2024-04-01', '2024-04-07'),
(5, 'Premium', '2024-05-01', '2024-10-31');

-- Insertion de 10 emprunts
INSERT INTO emprunter (date_emprunte, date_retour_prevue, date_retour_reelle, membre_id, jeux_id) VALUES
('2024-01-01', '2024-01-10', '2024-01-09', 1, 3),
('2024-01-05', '2024-01-15', '2024-01-14', 2, 5),
('2024-01-10', '2024-01-20', NULL, 3, 7),
('2024-01-12', '2024-01-22', '2024-01-21', 4, 2),
('2024-01-15', '2024-01-25', NULL, 5, 1),
('2024-01-18', '2024-01-28', '2024-01-27', 6, 4),
('2024-01-20', '2024-01-30', NULL, 7, 6),
('2024-01-22', '2024-02-01', '2024-01-31', 8, 8),
('2024-01-25', '2024-02-05', NULL, 9, 9),
('2024-01-28', '2024-02-07', '2024-02-06', 10, 10);


-- Insertion de 5 participations
INSERT INTO participe (score, rang_final, membre_id, jeux_id) VALUES
(1500, 1, 1, 3),
(1200, 2, 2, 5),
(1800, 1, 3, 7),
(900, 3, 4, 2),
(1400, 2, 5, 1);