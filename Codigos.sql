SELECT * FROM Customers;

--Uso de Wildcards 
SELECT * FROM Customers 
WHERE ContactName LIKE 'An%'

SELECT * FROM Customers
WHERE CustomerId LIKE 'A%' 

SELECT * FROM Customers
WHERE CustomerId LIKE 'AN__'

SELECT * FROM Customers
WHERE CustomerId LIKE '_O_'

SELECT * FROM Customers
WHERE CustomerId LIKE '[ABC]%'

SELECT * FROM Customers
WHERE CustomerId LIKE '[A-B]&'

SELECT * FROM Customers
WHERE CustomerId LIKE '[^A-J]&'

--W-J-Y ?
--CustomersId = Que tenga la letra "O" en el medio
-- CustomerId = A Termine en N === ?
-- CustomerId = A ===?
--EJERCICIOS 
 
 SELECT * FROM Customers 
 WHERE Address LIKE '%Av%'

 SELECT * FROM Customers 
 WHERE Country LIKE 'Brazil'

 SELECT * FROM Customers 
 WHERE Region IS NOT NULL
 AND Fax IS NOT NULL

 --Uso del In 
 SELECT * FROM Employees 
 WHERE TitleOfCourtesy IN ('Ms.','Mr', 'Mrs.')

 SELECT * FROM Employees
 WHERE City IN ('Seattle', 'Tacoma', 'Redmond')

 --Mostrar a los "Employees" que sean de la ciudad "Seattle, Tacoma, Redmond"

 --Uso de Group By 
 SELECT City, COUNT (*) 'Cantidad' FROM  Customers
 GROUP BY City
 ORDER BY COUNT(*) DESC

 SELECT * FROM Orders 
 SELECT COUNT(*) FROM Customers; --Contar los registros.-
 SELECT SUM(UnitPrice) FROM Products; -- Sumar los precios unitarios de los productos. 
 SELECT AVG(UnitPrice) FROM Products; -- Promedio de los precios unitarios 
 /*4. Contar todas las "Orders" agrupando por el "ShipCountry"
 5. Contar todas las "Orders" agrupando por el "ShipCity"
 6. Sumar todos los "UnitPrice" de los "Products" agrupando por "CategoryId"
*/
SELECT ShipCountry, COUNT(*) AS 
'TotalOrders' 
FROM Orders 
GROUP BY ShipCountry;
 
 SELECT 
 
 --contar los registros 
 SELECT COUNT(*) FROM Customers;
 --Sumar los precios unitarios de los productos 
 SELECT SUM(UnitPrice) FROM Products;
 --promedio de los precios unitarios 
 SELECT AVG(UnitPrice) FROM Products;

 5. 
 SELECT ShipCity, COUNT(*) AS 
'TotalOrders' 
FROM Orders 
GROUP BY ShipCity;
 

6.
SELECT CategoryID, SUM(UnitPrice) AS TotalPrice
FROM Products
GROUP BY CategoryID;

