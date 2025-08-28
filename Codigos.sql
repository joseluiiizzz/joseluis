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

 -- Clase de 28 de agosto

--1=
SELECT 'PIAD-302' FROM Categories
UNION
SELECT 'PIAD-302' FROM Categories

--2=
SELECT 'PIAD-302','PIAD-305' FROM Categories
UNION ALL
SELECT 'PIAD-303','PIAD-304' FROM Categories

--unir todas las filas, id y nombre de las tablas productos y categorias.

SELECT CategoryID, CategoryName FROM Categories
UNION all
SELECT ProductID, ProductName FROM Products
 
 --Consulta - Uso de INNER JOIN
 SELECT * FROM Products p
 INNER JOIN Categories c ON p. CategoryID = c.CategoryID

 -- Mostrar el ProductID, ProductName, UnitPrice, CategoryName
   SELECT p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName FROM Products p
 INNER JOIN Categories c ON p. CategoryID = c.CategoryID

 --ORDERS Y CUSTOMERS --> INNER(3 COLUMNAS DE CADA TABLA)

 SELECT o.OrderID, o.OrderDate, o.ShipCountry, c.CustomerID, c.CompanyName, c.ContactName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

 --ORDERS Y ORDERS DETAILS --> INNER(5 COLUMNAS DE CADA TABLA)

 SELECT o.OrderID, o.OrderDate, o.RequiredDate, o.ShippedDate, o.ShipCountry, od.OrderID, od.ProductID, od.UnitPrice, od.Quantity, od.Discount
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID;

/*
1. Mostrar el total de los "Orders" y agruparlos por orderId
Nota: Para calcular el total, lo obtienes de la tabla Order details (UnitPrice) * (Quantity)
Ejemplo:
Alfreds Fytteskiste                  -600
Ana Trujillo Emparedados y helados   -956
*/
SELECT 
    c.CompanyName,
    od.OrderID,
    SUM(od.UnitPrice * od.Quantity) AS TotalOrder
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName, od.OrderID
ORDER BY TotalOrder DESC;

/*
2. Mostrar la cantidad de "orders" agrupalos por el nombre del empleado 
 ejemplo:
 Nancy 20
 Janet 88
 */

 SELECT 
    e.FirstName,
    COUNT(o.OrderID) AS TotalOrders
FROM Orders o
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY e.FirstName
ORDER BY TotalOrders DESC;
