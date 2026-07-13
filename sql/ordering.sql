

-- Tracks ordered alphabetically by name
SELECT Name, Milliseconds
FROM tracks
ORDER BY Name ASC;

-- Most expensive tracks first
SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice DESC;

-- Customers sorted by country, then by last name within each country
SELECT FirstName, LastName, Country
FROM customers
ORDER BY Country ASC, LastName ASC;

-- Longest tracks first
SELECT Name, Milliseconds
FROM tracks
ORDER BY Milliseconds DESC
LIMIT 10;
