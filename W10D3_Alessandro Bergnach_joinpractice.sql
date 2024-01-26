/* Recuperate i nomi dei prodotti e i loro prezzi di listino per i prodotti nella categoria "Bikes".
TIP: utilizzate le tabelle "DimProduct" e "DimProductCategory".*/

SELECT p.EnglishProductName, c.EnglishProductSubCategoryName, p.ListPrice
FROM DimProduct as p
LEFT JOIN DimProductSubcategory as c
ON p.ProductSubcategoryKey = c.ProductSubcategoryKey
WHERE c.EnglishProductSubcategoryName like '%bike%'
ORDER BY p.ListPrice DESC



/* Elencate tutti i dipendenti e le relative vendite per l'anno 2019.
TIP: utilizzate le tabelle "DimEmployee" e "FactResellerSales".*/

SELECT e.EmployeeKey, e.FirstName, e.Lastname, SUM (s.SalesAmount) as TotalSales
FROM DimEmployee as e
LEFT JOIN FactResellerSales as s
ON e.EmployeeKey = s.EmployeeKey
WHERE YEAR (s.OrderDate) = '2019'
Group by e.EmployeeKey, e.FirstName, e.Lastname


/* Visualizzate i nomi di tutti i territori di vendita e l'importo totale delle vendite. Includete solo i territori con importi di vendita superiori a $50,000.
TIP: utilizzate le tabelle "DimSalesTerritory" e "FactResellerSales".*/

SELECT t.SalesTerritoryKey, SUM (s.SalesAmount) as TotalSales
FROM DimSalesTerritory as t
INNER JOIN FactResellerSales as s
ON t.SalesTerritoryKey = s.SalesTerritoryKey
WHERE s.SalesAmount > 50000
GROUP BY t.SalesTerritoryKey
ORDER BY TotalSales DESC

 




/* Recuperate i nomi dei prodotti e i loro importi totali delle vendite.
TIP: utilizzate le tabelle "DimProduct" e "FactResellerSales".*/