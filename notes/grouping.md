# Grouping Data in SQL

`GROUP BY` collapses multiple rows that share the same value(s) in specified column(s) into a single summary row, typically paired with aggregate functions.

## Core syntax

```sql
SELECT column, AGG_FUNC(other_column)
FROM table_name
GROUP BY column
HAVING condition_on_aggregate;
```

## Common aggregate functions

`COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`

## Basic example

```sql
-- Number of tracks per genre
SELECT g.name AS genre, COUNT(t.track_id) AS track_count
FROM tracks t
JOIN genres g ON g.genre_id = t.genre_id
GROUP BY g.name
ORDER BY track_count DESC;
```

## Grouping with multiple aggregates

```sql
-- Average and total track length per album
SELECT al.title, COUNT(t.track_id) AS num_tracks, AVG(t.milliseconds) AS avg_length
FROM tracks t
JOIN albums al ON al.album_id = t.album_id
GROUP BY al.title;
```

## HAVING — filtering groups

`WHERE` filters individual rows *before* grouping; `HAVING` filters the resulting groups *after* aggregation. You can't use an aggregate function inside `WHERE`.

```sql
-- Genres with more than 100 tracks
SELECT g.name AS genre, COUNT(t.track_id) AS track_count
FROM tracks t
JOIN genres g ON g.genre_id = t.genre_id
GROUP BY g.name
HAVING COUNT(t.track_id) > 100
ORDER BY track_count DESC;
```

## Grouping by multiple columns

```sql
-- Revenue per customer per country (illustrative — country is already 1:1 with customer here)
SELECT c.country, c.customer_id, SUM(i.total) AS revenue
FROM customers c
JOIN invoices i ON i.customer_id = c.customer_id
GROUP BY c.country, c.customer_id
ORDER BY c.country;
```

## WHERE + GROUP BY + HAVING together

```sql
-- Among rock tracks only, genres... (illustrative combined pattern)
SELECT g.name AS genre, AVG(t.unit_price) AS avg_price
FROM tracks t
JOIN genres g ON g.genre_id = t.genre_id
WHERE t.milliseconds > 60000        -- row-level filter first
GROUP BY g.name
HAVING AVG(t.unit_price) > 0.99;    -- group-level filter after aggregation
```

## Key takeaways

- Every non-aggregated column in `SELECT` must appear in `GROUP BY`.
- `WHERE` → filters rows before grouping. `HAVING` → filters groups after aggregation.
- Query evaluation order: `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `ORDER BY` → `LIMIT`.

## References

- [SQLite GROUP BY — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-group-by/)
- [SQLite HAVING — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-having/)
- [SQLite aggregate functions — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-aggregate-functions/)
