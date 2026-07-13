-- Limiting examples on the Chinook database

-- The 5 most expensive tracks
SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice DESC
LIMIT 5;

-- The first 10 customers alphabetically by last name
SELECT FirstName, LastName
FROM customers
ORDER BY LastName ASC
LIMIT 10;

-- Pagination: skip the first 10 customers, then return the next 10
SELECT FirstName, LastName
FROM customers
ORDER BY LastName ASC
LIMIT 10 OFFSET 10;

