USE AdventureWorksDW2020;

-- ESERCIZIO: esplora la tabella FactResellerSales
SELECT *
FROM FactResellerSales

-- 1) esponi l'elenco degli ordini (SalesOrderNumber) e delle transazioni (SalesOrderLineNumber)
SELECT SalesOrderNumber, SalesOrderLineNumber
FROM FactResellerSales

-- 2) conta il numero di transazioni per ciascun ordine --BISOGNA INSERIRE IL RAGGRUPPAMENTO

SELECT SalesOrderNumber
, COUNT (SalesOrderNumber) as NTransaction
FROM FactResellerSales
GROUP By SalesOrderNumber

-- 3) arricchisci il risultato precendete della quantità totale totale venduta (OrderQuantity) per ordine e della somma dell'importo (SalesAmount)
SELECT SalesOrderNumber
, COUNT (SalesOrderNumber) as NTransaction
, SUM (OrderQuantity)	   as TotalQuantity
, SUM (SalesAmount)		   as TotalSales
FROM FactResellerSales
GROUP By SalesOrderNumber

-- ESERCIZIO: esistono codici prodotti (ProductKey) che hanno il medesimo nome prodotto (EnglishProductName)?
SELECT *
FROM DimProduct

SELECT ProductKey, EnglishProductName
FROM DimProduct

-- ESERCIZIO: analisi prodotti. Calcola il fatturato totale, la quantità totale, il numero di transazioni e la media del prezzo di vendita per ciascun prodotto.
-- tip: Il result set deve contenere il nome prodotto e le aggregazioni richieste. Utilizza gli operatori COUNT, SUM, AVG

SELECT 
 p.EnglishProductName, 
 SUM (s.SalesAmount) as TotalSales, 
 SUM (s.OrderQuantity) as TotalQuantity, 
 COUNT (s.SalesOrderNumber) as NTransaction, 
 AVG (s.UnitPrice) as Avgprice
FROM DimProduct as p
LEFT JOIN FactResellerSales as s
ON p.ProductKey = s.ProductKey
GROUP BY p.EnglishProductName
ORDER By TotalSales DESC

-- ESERCIZIO: esistono prodotti che non sono mai stati venduti?
--- Si, nella query precedente si vedono quelli che hanno TotalSales o NTransaction NULL


