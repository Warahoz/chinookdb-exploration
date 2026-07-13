# Filtering Data in SQL

Filtering restricts the rows a query returns to those matching some condition. In SQL this is done with the `WHERE` clause, applied after the table is read but before rows are grouped, ordered, or limited.

## Core syntax

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

## Comparison operators

`=`, `!=` / `<>`, `<`, `>`, `<=`, `>=`

```sql
-- Tracks longer than 5 minutes (300,000 ms)
SELECT name, milliseconds
FROM tracks
WHERE milliseconds > 300000;
```

## Combining conditions: AND / OR / NOT

```sql
-- Rock tracks that are also long
SELECT t.name, g.name AS genre, t.milliseconds
FROM tracks t
JOIN genres g ON g.genre_id = t.genre_id
WHERE g.name = 'Rock' AND t.milliseconds > 300000;

-- Customers from Canada or Germany
SELECT first_name, last_name, country
FROM customers
WHERE country = 'Canada' OR country = 'Germany';
```

## BETWEEN — inclusive range

```sql
-- Invoices between $5 and $10
SELECT invoice_id, total
FROM invoices
WHERE total BETWEEN 5 AND 10;
```

## IN — match against a list

```sql
-- Customers from a set of countries
SELECT first_name, last_name, country
FROM customers
WHERE country IN ('USA', 'Canada', 'Brazil');
```

## LIKE — pattern matching

`%` matches any sequence of characters, `_` matches a single character.

```sql
-- Artists whose name starts with "Iron"
SELECT name
FROM artists
WHERE name LIKE 'Iron%';

-- Tracks with "love" anywhere in the title (case-insensitive by default in SQLite for ASCII)
SELECT name
FROM tracks
WHERE name LIKE '%love%';
```

## IS NULL / IS NOT NULL

Used instead of `= NULL`, because NULL is "unknown" and never equal to anything, including itself.

```sql
-- Employees who don't report to anyone (top of the hierarchy)
SELECT employee_id, first_name, last_name
FROM employees
WHERE reports_to IS NULL;
```

## Key takeaways

- `WHERE` filters rows *before* aggregation; use `HAVING` to filter *after* grouping (see `grouping.md`).
- Always use `IS NULL` / `IS NOT NULL` for null checks, never `=`.
- Combine `AND`/`OR` carefully — use parentheses to make operator precedence explicit.

## References

- [SQLite WHERE clause — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-where/)
- [SQLite BETWEEN — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-between/)
- [SQLite IN — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-in/)
- [SQLite LIKE — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-like/)
- [SQLite IS NULL — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-is-null/)
