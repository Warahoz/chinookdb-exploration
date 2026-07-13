# Limiting Data with SQL (LIMIT / OFFSET)

`LIMIT` restricts the number of rows returned by a query. It's commonly
paired with `ORDER BY` to answer "top N" or "bottom N" style questions.
`OFFSET` skips a number of rows before starting to return results 

## Syntax

```sql
SELECT column1, column2
FROM table_name
ORDER BY column1
LIMIT n [OFFSET m];
```

## Example queries (Chinook)

```sql
-- Pagination: skip the first 10 customers, then return the next 10
SELECT FirstName, LastName
FROM customers
ORDER BY LastName ASC
LIMIT 10 OFFSET 10;


-- The single most recent invoice
SELECT InvoiceId, CustomerId, InvoiceDate, Total
FROM invoices
ORDER BY InvoiceDate DESC
LIMIT 5;
```

## Notes
- Without `ORDER BY`, `LIMIT` returns an arbitrary subset of rows — the
  database does not guarantee which ones, since there's no defined sort order.
 
- `LIMIT`/`OFFSET` is applied **last** in query execution, after filtering,
  grouping, and ordering.

## References
-  https://www.sqlitetutorial.net/sqlite-limit/
-  : https://www.sqlite.org/lang_select.html