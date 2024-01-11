
CREATE TABLE Prodotti 
(
IDProdotto BIGINT
, NomeProdotto VARCHAR (100)
, Prezzo DECIMAL (10,2)
, CONSTRAINT Pk_IDProdotto PRIMARY KEY (IDProdotto)
);

CREATE TABLE Ordini 
(
IDOrdini INT
, IDProdotto INT
, Quantità INT 
, CONSTRAINT Pk_IDOrdini PRIMARY KEY (IDOrdini)
, CONSTRAINT Fk_IDProdotto FOREIGN KEY (IDProdotto)
REFERENCES Prodotti (IDProdotto)
) ;

ALTER TABLE Ordini
CONSTRAINT Fk_IDClienti FOREIGN KEY (IDCliente)
REFERENCES Clienti (IDCliente)

CREATE TABLE Clienti 
(
IDCliente INT
, Nome VARCHAR (50)
, Email VARCHAR (100)
, CONSTRAINT Pk_IDCliente PRIMARY KEY (IDCliente)
); 

CREATE TABLE DettaglioOrdini (
IDOrdini INT
, IDProdotto INT
, IDCliente INT
, PrezzoTotale DECIMAL (10,2)
, CONSTRAINT Pk_DettaglioOrdini PRIMARY KEY (IDOrdini, IDProdotto, IDCliente)
, CONSTRAINT Fk_IDOrdini FOREIGN KEY (IDOrdini)
REFERENCES Ordini (IDOrdini)
, CONSTRAINT Fk_IDProdotto FOREIGN KEY (IDProdotto)
REFERENCES Prodotti (IDProdotto)
, CONSTRAINT Fk_IDCliente FOREIGN KEY (IDCliente)
REFERENCES Clienti (IDCliente)
);

INSERT INTO DettaglioOrdini (IDOrdini, IDProdotto, IDCliente, PrezzoTotale)

SELECT IDOrdini, o.IDProdotto, o.IDCliente, p.Prezzo * o.Quantità as PrezzoTotale
FROM Ordini as o
LEFT JOIN Prodotti as p
ON o.IDProdotto = p.IDProdotto

INSERT INTO Prodotti (IDProdotto, NomeProdotto, Prezzo)
VALUES (1,'tablet',300.00), (2,'mouse',20.00), (3,'tastiera',25.00), (4,'monitor',180.00), (5,'hhd',90.00), 
(6,'SSD',200.00), (7,'RAM',100.00), (8,'router',80.00), (9,'Webcam',45.00), (10,'GPU',1250.00), 
(11,'trackpad',500.00), (12,'techmagazine',5.00), (13,'Martech',50.00);

INSERT INTO Ordini (IDOrdini, IDProdotto, Quantità)
VALUES (1, 2, 10), (2, 6, 2), (3, 5, 3), (4, 1, 1), (5, 9, 1), (6, 4, 2), (7, 11, 6),
(8, 10, 2), (9, 3, 3), (10, 3, 1), (11, 2, 1);

INSERT INTO Clienti (IDCliente, Nome, Email)
VALUES (1, 'Antonio', null), (2, 'Battista', 'battista@mailmail.it'), (3, 'Maria', 'maria@posta.it'),
(4, 'Franca', 'franca@lettere.it'), (5, 'Ettore', null), (6, 'Arianna', 'arianna@posta.it'), (7, 'Piero', 'piero@posta.it');

SELECT IdProdotto, NomeProdotto, Prezzo
FROM Prodotti
WHERE Prezzo > 50

SELECT Email
FROM Clienti
WHERE Email LIKE 'A%'

SELECT IDOrdini, IDProdotto, Quantità
FROM Ordini
WHERE Quantità > 10 
AND Prezzo < 100

SELECT Prezzo
FROM Prodotti
WHERE NomeProdotto LIKE '%tech%'

SELECT IDCliente, Nome
FROM Clienti
WHERE Email = null

SELECT IDProdotto, NomeProdotto, Prezzo
FROM Prodotti
WHERE NomeProdotto LIKE 'M%'
AND NomeProdotto LIKE '%e'








