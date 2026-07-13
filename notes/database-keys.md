# Database Keys

A **key** is one or more columns (attributes) used to uniquely identify rows in a table and/or to link tables together. Keys are the backbone of relational integrity — without them, a database can't guarantee that a row is unique or that a relationship between two tables is valid.

## Types of keys

### Super key
Any combination of columns whose values are unique across all rows in a table. A super key can contain extra, unnecessary columns — it just has to guarantee uniqueness, not be minimal.

### Candidate key
A *minimal* super key — remove any single column from it and it stops being unique. A table can have several candidate keys; one of them is eventually chosen as the primary key.

### Primary key (PK)
The candidate key chosen to be the main unique identifier for a table. A table has exactly one primary key, it can never be `NULL`, and its values can never repeat. It can be a single column or a composite of several columns.

### Alternate key
Any candidate key that exists but was *not* chosen as the primary key.

### Composite key
A key made of two or more columns, where no single column in the set is unique on its own, but the combination is. Common in junction/many-to-many tables.

### Foreign key (FK)
A column (or set of columns) in one table that refers to the primary key of another table. It creates and enforces the relationship between the two tables (referential integrity), can contain duplicates, and can usually be `NULL` if the relationship is optional.

### Unique key
Like a primary key, it enforces uniqueness on a column — but a table can have several unique keys, and (depending on the database engine) a unique key may allow one `NULL` value.

### Surrogate key
An artificial, system-generated identifier (often an auto-incrementing integer) with no business meaning of its own — created purely to serve as a stable primary key. Most Chinook IDs (`track_id`, `album_id`, etc.) are surrogate keys.

Highlights worth noting from exploring the schema:

- **`playlist_track` is the clearest composite key example** — neither `playlist_id` nor `track_id` alone is unique in that table (a playlist has many tracks, and a track can be on many playlists), but the *pair* is unique. This resolves the many-to-many relationship between `playlists` and `tracks`.

- **`employees.reports_to` is a self-referencing foreign key** — it points back to `employee_id` in the same table, modeling the manager/employee hierarchy.
- Every ID column in Chinook (`*_id`) is a **surrogate key** — an auto-generated integer with no real-world meaning, rather than a "natural key" like an email address or an SSN.

## Example: querying via a foreign key relationship

```sql
SELECT al.title AS album, ar.name AS artist
FROM albums al
JOIN artists ar ON ar.artist_id = al.artist_id
ORDER BY ar.name;
```

## References

- [Keys in Relational Model — GeeksforGeeks](https://www.geeksforgeeks.org/dbms/types-of-keys-in-relational-model-candidate-super-primary-alternate-and-foreign/)
- [DBMS Keys: 8 types of keys defined — TechTarget](https://www.techtarget.com/searchdatamanagement/answer/Definition-of-primary-super-foreign-and-candidate-key-in-the-DBMS)
- [SQLite Primary Key — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-primary-key/)
- [SQLite Foreign Key — sqlitetutorial.net](https://www.sqlitetutorial.net/sqlite-foreign-key/)
