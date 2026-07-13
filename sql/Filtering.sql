-- 1. tracks longer than 5 minutes
SELECT Name, Milliseconds
FROM tracks
WHERE Milliseconds > 300000;

-- 2. AND: rock tracks that are also long
SELECT t.name, g.name AS genre, t.milliseconds
FROM tracks t
JOIN genres g ON g.genre_id = t.genre_id
WHERE g.name = 'Rock' AND t.milliseconds > 300000;

-- 3. OR: customers from Canada or Germany
SELECT first_name, last_name, country
FROM customers
WHERE country = 'Canada' OR country = 'Germany';

-- 4. BETWEEN: invoices between $5 and $10
SELECT invoice_id, total
FROM invoices
WHERE total BETWEEN 5 AND 10;

-- 5. IN: customers from a specific list of countries
SELECT first_name, last_name, country
FROM customers
WHERE country IN ('USA', 'Canada', 'Brazil');

-- 6. LIKE: artists whose name starts with "Iron"
SELECT name
FROM artists
WHERE name LIKE 'Iron%';

-- 7. IS NULL: employees with no manager 
SELECT employee_id, first_name, last_name
FROM employees
WHERE reports_to IS NULL;
