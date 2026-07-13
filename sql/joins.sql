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

-- 3. RIGHT JOIN: all genres, with any matching tracks 
SELECT g.name AS genre, t.name AS track
FROM tracks t
RIGHT JOIN genres g ON g.genre_id = t.genre_id;

-- 4. FULL OUTER JOIN: all playlists and all tracks, matched where linked 
SELECT p.name AS playlist, t.name AS track
FROM playlists p
FULL OUTER JOIN playlist_track pt ON pt.playlist_id = p.playlist_id
FULL OUTER JOIN tracks t ON t.track_id = pt.track_id;

-- 5. CROSS JOIN: every media type paired with every genre
SELECT m.name AS media_type, g.name AS genre
FROM media_types m
CROSS JOIN genres g;
