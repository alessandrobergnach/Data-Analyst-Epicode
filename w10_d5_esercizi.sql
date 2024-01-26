/* Elencate tutti i dipendenti (nome, cognome e identificativo unico) e la media delle loro vendite. */

SELECT e.EmployeeKey, e.FirstName, e.LastName, AVG (s.SalesAmount) AS AvgSales
FROM DimEmployee as e
LEFT JOIN FactResellerSales as s
ON e.EmployeeKey = s.EmployeeKey
Group by e.EmployeeKey, e.FirstName, e.Lastname
Order By AVG (s.SalesAmount) DESC


/* Per ogni territorio di vendita, contate il numero totale di vendite. Includete solo i territori con almeno una vendita */
SELECT t.SalesTerritoryKey, SUM (s.SalesAmount) as TotalSales
FROM DimEmployeeSalesTerritory as t
LEFT JOIN FactResellerSales as s
ON t.SalesTerritoryKey = s.SalesTerritoryKey
WHERE s.SalesAmount > 0
Group by t.SalesTerritoryKey
Order By SUM (s.SalesAmount) DESC


/* Per ogni prodotto, trovate la data di vendita più recente. */
SELECT p.ProductKey, MAX (s.OrderDate)
FROM DimProduct as p
INNER JOIN FactResellerSales as s
ON p.ProductKey = s.ProductKey
Group by p.ProductKey
Order by MAX (s.Orderdate) DESC

/* Per ogni mese dell'anno più recente, calcolate la media delle vendite giornaliere. */

SELECT MONTH (s.Orderdate) as M, AVG (s.SalesAmount) as AvgSales
FROM FactResellerSales as s
WHERE YEAR(s.OrderDate) = 2020
GROUP BY MONTH (s.Orderdate)
ORDER BY MONTH (s.Orderdate)


/* Per ogni mese dell'anno più recente, calcolate la somma delle vendite totali. Includete solo i mesi con vendite superiori a $100,000 */

SELECT MONTH (s.Orderdate) as M, SUM (s.SalesAmount) as TotalSales
FROM FactResellerSales as s
WHERE s.OrderDate like '2020%'
GROUP BY MONTH (s.OrderDate)
HAVING SUM (s.SalesAmount) > 100000
ORDER BY SUM (s.SalesAmount)


/* Per ogni anno, trovate l'ultimo prodotto venduto. */
-- ProduckKey in GroupBy e mi esplode tutti i valori non raggruppa // NON E' LA SOLUZIONE

SELECT TOP 1 YEAR (s.OrderDate) as Y, MAX (s.OrderDate) as LastProductSold, p.ProductKey
FROM FactResellerSales as s
INNER JOIN DimProduct as p
ON s.ProductKey = p.ProductKey
Group by p.ProductKey, YEAR (s.OrderDate)

-- risoluzione esercizio un anno alla volta

SELECT TOP 1 p.ProductKey, s.Orderdate
FROM FactResellerSales as s
INNER JOIN DimProduct as p
ON s.ProductKey = p.ProductKey
WHERE YEAR(OrderDate) = '2017'
ORDER BY OrderDate DESC

-- Per ogni mese dell'anno più recente, calcore la somma delle vendite totali, includete solo i mesi con vendite > 100.000 USD

SELECT MONTH (Orderdate) as month, SUM (Salesamount) as sales
FROM FactResellerSales
WHERE YEAR (Orderdate) = '2019'
GROUP BY MONTH (Orderdate)
HAVING SUM (Salesamount) > 100000
ORDER BY SUM (SAlesamount) DESC

-- HAVING è un filtro per GROUO BY, WHERE è un filtro su SELECT

-- CON QUERY INNESTATA

SELECT MONTH (Orderdate) as month, SUM (Salesamount) as sales
FROM FactResellerSales
WHERE YEAR (Orderdate) = ( SELECT MAX (YEAR(Orderdate))  FROM Factresellersales)
GROUP BY MONTH (Orderdate)
HAVING SUM (Salesamount) > 100000
ORDER BY SUM (SAlesamount) DESC

-- elencare tutti i dipendenti (nome, cognome, id),  e la media del prezzo del prodotto venduto e il conteggio delle vendite totali
SELECT e.EmployeeKey, e.FirstName, e.LastName, AVG (s.UnitPrice) as Avgprice, COUNT (s.salesamount) as Salescount
FROM DimEmployee as e
LEFT JOIN FactResellerSales as s
ON e.EmployeeKey = s.EmployeeKey
GROUP BY e.employeekey, e.FirstName, e.LastName
ORDER BY COUNT (s.Salesamount) DESC






 