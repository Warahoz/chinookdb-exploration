-- ============================================
-- Join demo queries — Chinook DB
-- Concepts: INNER, LEFT, RIGHT, FULL OUTER, CROSS, SELF joins
-- ============================================

-- 1. INNER JOIN: tracks with their album title
SELECT t.name AS track, al.title AS album
FROM tracks t
INNER JOIN albums al ON al.album_id = t.album_id;

-- 2. LEFT JOIN: every customer + invoice count (0 if none)
SELECT c.first_name, c.last_name, COUNT(i.invoice_id) AS invoice_count
FROM customers c
LEFT JOIN invoices i ON i.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY invoice_count ASC;

-- 3. RIGHT JOIN: all genres, with any matching tracks (requires SQLite 3.39+)
SELECT g.name AS genre, t.name AS track
FROM tracks t
RIGHT JOIN genres g ON g.genre_id = t.genre_id;

-- 4. FULL OUTER JOIN: all playlists and all tracks, matched where linked (requires SQLite 3.39+)
SELECT p.name AS playlist, t.name AS track
FROM playlists p
FULL OUTER JOIN playlist_track pt ON pt.playlist_id = p.playlist_id
FULL OUTER JOIN tracks t ON t.track_id = pt.track_id;

-- 5. CROSS JOIN: every media type paired with every genre
SELECT m.name AS media_type, g.name AS genre
FROM media_types m
CROSS JOIN genres g;

-- 6. SELF JOIN: employees and their manager's name
SELECT e.first_name || ' ' || e.last_name AS employee,
       m.first_name || ' ' || m.last_name AS manager
FROM employees e
LEFT JOIN employees m ON m.employee_id = e.reports_to;

-- 7. Multi-table join: full purchase detail
SELECT c.first_name || ' ' || c.last_name AS customer,
       t.name AS track,
       ar.name AS artist,
       ii.unit_price,
       ii.quantity
FROM invoice_items ii
JOIN invoices i ON i.invoice_id = ii.invoice_id
JOIN customers c ON c.customer_id = i.customer_id
JOIN tracks t ON t.track_id = ii.track_id
JOIN albums al ON al.album_id = t.album_id
JOIN artists ar ON ar.artist_id = al.artist_id
ORDER BY customer;
