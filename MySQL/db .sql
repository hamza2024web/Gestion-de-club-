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
    jeux_id int ,
    FOREIGN key (membre_id) references membre(id),
    FOREIGN key (jeux_id) references jeu(id)
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