-- Lister les informations de tous les membres (pseudo, e-mail, date d'inscription).
select * from membre ;
-- Afficher la liste des jeux disponibles, avec leur titre, genre, et studio de développement.
select * from jeu ;
-- Afficher les détails d'un tournoi spécifique à partir de son nom.
select * from tournoi where nom_tournoi = '';
-- Lister les emprunts en cours, incluant le pseudo du membre et le titre du jeu.
SELECT 
    membre.pseudo AS Pseudo_Membre,
    jeu.titre AS Titre_Jeu ,
    emprunter.date_emprunte,
    emprunter.date_retour_prevue,
    emprunter.date_retour_reelle 
FROM 
    emprunter
INNER JOIN 
    membre ON emprunter.membre_id = membre.id
INNER JOIN 
    jeu ON emprunter.jeux_id = jeu.id
WHERE 
    emprunter.date_retour_reelle IS NULL;
-- Lister les membres ayant participé à un tournoi, avec leur pseudo, le nom du tournoi, et leur rang final.
SELECT membre.id , membre.pseudo , tournoi.nom_tournoi , particpe.rang_final
FROM membre 
INNER JOIN tournoi ON tournoi.id = membre.id 
INNER JOIN particpe ON particpe.membre_id = particpe.rang_final ;
-- Trouver les membres qui ont souscrit à un abonnement annuel.
SELECT membre.pseudo , abonnement.type_abonnement
FROM membre
INNER JOIN abonnement ON abonnement.membre_id = membre.id
WHERE abonnement.type_abonnement = 'Annuel';
-- Trouver les jeux empruntés par un membre spécifique (via son pseudo).
SELECT membre.pseudo , abonnement.type_abonnement
FROM membre
INNER JOIN abonnement ON abonnement.membre_id = membre.id
WHERE abonnement.type_abonnement = 'Annuel';
-- Lister tous les emprunts, en incluant le pseudo du membre et les informations sur le jeu (titre et studio de développement).
select emprunter.* , membre.pseudo , jeu.titre , jeu.studio_developpement
FROM emprunter
LEFT JOIN membre ON emprunter.membre_id = membre.id
LEFT JOIN jeu ON emprunter.jeux_id = jeu.titre AND emprunter.jeux_id = jeu.studio_developpement ;
-- Afficher la liste des membres et le type d'abonnement auquel ils sont associés.
SELECT membre.pseudo , abonnement.type_abonnement
FROM membre 
INNER JOIN abonnement ON abonnement.membre_id = membre.id ;
-- Calculer le nombre total de jeux disponibles par genre.
SELECT genre , COUNT(*) AS nombre_de_jaux
FROM jeu
GROUP BY genre ;
-- Trouver le tournoi avec le plus grand nombre de participants.
SELECT tournoi_id, max(particpe.tournoi_id) AS nombre_participants
FROM particpe
GROUP BY tournoi_id
ORDER BY nombre_participants DESC;
-- Afficher le nombre d'emprunts réalisés par chaque membre.
SELECT membre_id, COUNT(*) AS nombre_emprunts
FROM emprunter
GROUP BY membre_id;
-- Afficher les jeux sortis après une certaine année, triés par ordre alphabétique.
SELECT jeu.titre , jeu.date_sortie
FROM jeu
WHERE date_sortie > '2020-01-01'
ORDER BY jeu.titre ASC ;
-- Trouver les membres qui ont emprunté un jeu, mais ne l'ont pas encore rendu.
SELECT membre.id, membre.pseudo, membre.email, emprunter.date_emprunte, emprunter.jeux_id
FROM emprunter
LEFT JOIN membre ON emprunter.membre_id = membre.id
WHERE emprunter.date_retour_reelle IS NULL;
-- Lister les tournois ayant eu lieu entre deux dates spécifiques.
SELECT *
FROM tournoi
WHERE tournoi.date_tournoi BETWEEN '2024-02-01' AND '2024-04-10' ;
-- Afficher les membres avec plusieurs emprunts actifs.
SELECT emprunter.membre_id 
FROM emprunter 
WHERE emprunter.date_retour_reelle IS NULL
GROUP BY membre_id ;

