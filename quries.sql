/* PROJECT: Northwind Data Analysis */

/* DATA EXPLORATION */

SELECT * FROM Customers LIMIT 10;
SELECT * FROM Orders LIMIT 10;
SELECT * FROM Products LIMIT 10;
SELECT * FROM OrderDetails LIMIT 10;

/* DATA UNDERSTANDING */

SELECT COUNT(*) AS TotalCustomers FROM Customers;
SELECT COUNT(*) AS TotalOrders FROM Orders;
SELECT COUNT(*) AS TotalProducts FROM Products;

/* CUSTOMER ANALYSIS */

SELECT Country, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY Country
ORDER BY CustomerCount DESC;

SELECT c.CompanyName,
       SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
ORDER BY TotalSales DESC
LIMIT 10;

/* PRODUCT ANALYSIS */

SELECT p.ProductName,
       SUM(od.Quantity) AS UnitsSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY UnitsSold DESC
LIMIT 10;

SELECT p.ProductName,
       SUM(od.UnitPrice * od.Quantity) AS ProductRevenue
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY ProductRevenue DESC;

/* SALES ANALYSIS */

SELECT o.OrderDate,
       SUM(od.UnitPrice * od.Quantity) AS DailySales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderDate
ORDER BY o.OrderDate;

SELECT strftime('%Y-%m', o.OrderDate) AS Month,
       SUM(od.UnitPrice * od.Quantity) AS MonthlySales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY Month
ORDER BY Month;

/*COUNTRY PERFORMANCE*/

SELECT c.Country,
       SUM(od.UnitPrice * od.Quantity) AS CountrySales
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.Country
ORDER BY CountrySales DESC;

/*EMPLOYEE PERFORMANCE */

SELECT e.FirstName || ' ' || e.LastName AS EmployeeName,
       SUM(od.UnitPrice * od.Quantity) AS EmployeeSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY EmployeeName
ORDER BY EmployeeSales DESC;
