SELECT * FROM Customer;

SELECT CustomerName, City FROM Customers;

# only distinct values
SELECT DISTINCT Country FROM Customers;

# show count of distinct values
SELECT COUNT(DISTINCT Country) FROM Customers;

# show count of distinct values
SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers);

SELECT * FROM Customers
WHERE Country='Mexico';

SELECT * FROM Products
WHERE Price > 30;

SELECT * FROM Products
WHERE Price <> 18;

SELECT * FROM Products
WHERE Price BETWEEN 50 AND 60;

SELECT * FROM Customers
WHERE City LIKE 's%';

SELECT * FROM Customers
WHERE City IN ('Paris','London');

SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';

SELECT * FROM Customers
WHERE NOT Country='Germany';

SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='München');

SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';

SELECT * FROM Customers
ORDER BY Country;

SELECT * FROM Customers
ORDER BY Country DESC;