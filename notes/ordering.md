# Ordering Data with SQL (ORDER BY)

`ORDER BY` sorts the result set of a query. By default sorting is ascending
(`ASC`); use `DESC` for descending. You can sort by one or multiple columns.
and multi-column sorts break ties using the second column, then the third, etc.

## Syntax

```sql
SELECT column1, column2
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC];
```

## Example queries (Chinook)

```sql
-- Tracks ordered alphabetically by name
SELECT Name, Milliseconds
FROM tracks
ORDER BY Name ASC;


```

## Notes
- `ORDER BY` can reference a column alias or a column position number
  (e.g. `ORDER BY 3`), though using the actual column name is clearer.
- `ORDER BY` is applied **after** `WHERE` and `GROUP BY`, so it can sort by
  aggregated values too:


## References
-  https://www.sqlitetutorial.net/sqlite-order-by/
-  https://www.sqlite.org/lang_select.html