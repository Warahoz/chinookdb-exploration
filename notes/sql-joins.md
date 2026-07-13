# SQL Joins

A **join** combines rows from two or more tables based on a related column
between them
## 1. INNER JOIN
Returns only the rows that have matching values in **both** tables. Rows
without a match on either side are excluded. This is the default/most
common join.
## 2. LEFT JOIN (LEFT OUTER JOIN)
Returns **all rows from the left table**, plus matching rows from the right
table. 
## 3. RIGHT JOIN (RIGHT OUTER JOIN)
The mirror of `LEFT JOIN` — returns all rows from the right table, plus
matches from the left. 
## 4. FULL OUTER JOIN
Returns all rows from **both** tables, matching where possible and filling
`NULL` where there's no match on either side.

## References
- https://www.sqlitetutorial.net/sqlite-group-by/
- https://www.sqlitetutorial.net/sqlite-having/
https://www.sqlite.org/lang_aggfunc.html