1
CREATE TABLE Clients (
    IDClient INT PRIMARY KEY,
    Nom VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DateInscription DATE
);

2
ALTER TABLE Clients 
ADD Adresse VARCHAR(100);

3
CREATE TABLE Commandes (
    IDCommande INT PRIMARY KEY,
    IDClient INT,
    DateCommande DATE,
    Montant INT,
    FOREIGN KEY (IDClient) REFERENCES Clients(IDClient)
);



5
CREATE TABLE Produits (
    IDProduit INT PRIMARY KEY,
    NomProduit VARCHAR(100),
    Prix DECIMAL(10, 2)
);


6
INSERT INTO Clients (IDClient, Nom, Email, DateInscription, Adresse) 
VALUES 
(1, 'Alice', 'alice@example.com', '2023-01-15', '456 Avenue des Champs'),
(2, 'Bob', 'bob@example.com', '2023-02-20', '123 Rue Principale'),
(3, 'Charlie', 'charlie@example.com', '2023-03-10', '789 Boulevard Saint-Germain');



7
UPDATE Clients 
SET Adresse = '123 Rue Principale' 
WHERE IDClient = 2;

8
INSERT INTO Commandes (IDCommande, IDClient, DateCommande, Montant) 
VALUES (1, 1, CURRENT_DATE, 150);


9
DELETE FROM Clients 
WHERE Adresse = 'Adresse inconnue';


10
INSERT INTO Produits (IDProduit, NomProduit, Prix) 
VALUES (1, 'Produit A', 29.99);


11
SELECT Nom 
FROM Clients;


12
SELECT C.Nom, SUM(CM.Montant) AS TotalMontant
FROM Clients C
JOIN Commandes CM ON C.IDClient = CM.IDClient
GROUP BY C.Nom;


13
SELECT NomProduit, Prix 
FROM Produits 
WHERE Prix > 50;


14
SELECT C.Nom, CM.DateCommande, CM.Montant, P.NomProduit 
FROM Commandes CM
JOIN Clients C ON CM.IDClient = C.IDClient
JOIN Produits P ON CM.IDProduit = P.IDProduit;



15
SELECT NomProduit, Prix 
FROM Produits 
ORDER BY Prix DESC 
LIMIT 1;


16
INSERT INTO Produits (IDProduit, NomProduit, Prix) 
VALUES (2, 'Produit B', 45.99);
*

17
UPDATE Produits 
SET Prix = 19.99 
WHERE IDProduit = 1;


18
INSERT INTO Commandes (IDCommande, IDClient, DateCommande, Montant) 
VALUES (2, 3, CURRENT_DATE, 75);


19
DELETE FROM Produits 
WHERE Prix < 30;


20
DELETE FROM Clients 
WHERE IDClient NOT IN (SELECT IDClient FROM Commandes);
