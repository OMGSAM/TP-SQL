1
SELECT Abonne.Nom, Abonne.Prenom, Abonne.Rue, Abonne.Ville, Abonne.CodeP
FROM Abonne
JOIN Pret ON Abonne.NumAbo = Pret.NumAbo
JOIN Disque ON Pret.CodeOuv = Disque.CodeOuv
WHERE Pret.DatePret = '2006-01-12';

2

SELECT Ouvrage.Titre, 
       CASE 
          WHEN Disque.CodeOuv IS NOT NULL THEN 'Disque' 
          ELSE 'Livre' 
       END AS Type
FROM Pret
JOIN Ouvrage ON Pret.CodeOuv = Ouvrage.CodeOuv
LEFT JOIN Disque ON Ouvrage.CodeOuv = Disque.CodeOuv
LEFT JOIN Livre ON Ouvrage.CodeOuv = Livre.CodeOuv
JOIN Abonne ON Pret.NumAbo = Abonne.NumAbo
WHERE Abonne.Nom = 'Gava' AND Abonne.Prenom = 'Frédéric';






3
SELECT Ouvrage.Titre
FROM Pret
JOIN Ouvrage ON Pret.CodeOuv = Ouvrage.CodeOuv
LEFT JOIN Disque ON Ouvrage.CodeOuv = Disque.CodeOuv
LEFT JOIN Livre ON Ouvrage.CodeOuv = Livre.CodeOuv
JOIN Abonne ON Pret.NumAbo = Abonne.NumAbo
WHERE (Livre.Genre = 'policier' OR Disque.Style = 'Jazz')
  AND Abonne.Nom = 'Gava' AND Abonne.Prenom = 'Frédéric';





4
SELECT Auteur.Nom, Auteur.Prenom
FROM Auteur
JOIN Ecrit ON Auteur.CodeAut = Ecrit.CodeAut
JOIN Livre ON Ecrit.CodeOuv = Livre.CodeOuv
WHERE Livre.Genre = 'policier'
GROUP BY Auteur.CodeAut
HAVING COUNT(DISTINCT Livre.Genre) = 1;




5
SELECT Livre.CodeOuv
FROM Livre
JOIN Pret ON Livre.CodeOuv = Pret.CodeOuv
WHERE Pret.DateRetour IS NOT NULL
GROUP BY Livre.CodeOuv
HAVING COUNT(DISTINCT Pret.NumEx) > 1;



6
SELECT Ouvrage.Titre
FROM Pret AS P1
JOIN Pret AS P2 ON P1.CodeOuv = P2.CodeOuv
JOIN Ouvrage ON P1.CodeOuv = Ouvrage.CodeOuv
WHERE P1.NumAbo = 1 AND P2.NumAbo = 2;



7
SELECT *
FROM Abonne
WHERE NumAbo NOT IN (SELECT NumAbo FROM Pret);




8
SELECT Ouvrage.Titre
FROM Pret AS P1
JOIN Livre ON P1.CodeOuv = Livre.CodeOuv
JOIN Ouvrage ON Livre.CodeOuv = Ouvrage.CodeOuv
WHERE P1.NumAbo = 1
  AND Livre.Prix > (SELECT MAX(Livre.Prix)
                    FROM Pret AS P2
                    JOIN Livre ON P2.CodeOuv = Livre.CodeOuv
                    WHERE P2.NumAbo = 2);



9
SELECT Ouvrage.Titre
FROM Pret AS P1
JOIN Livre ON P1.CodeOuv = Livre.CodeOuv
JOIN Ouvrage ON Livre.CodeOuv = Ouvrage.CodeOuv
WHERE P1.NumAbo = 1
  AND Livre.Prix < ALL (SELECT Livre.Prix
                        FROM Pret AS P2
                        JOIN Livre ON P2.CodeOuv = Livre.CodeOuv
                        WHERE P2.NumAbo = 2);




