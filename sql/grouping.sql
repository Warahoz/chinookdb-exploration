-- ============================================
-- Grouping demo queries — Chinook DB
-- Concepts: GROUP BY, aggregate functions, HAVING
-- ============================================

-- 1. Number of tracks per genre
SELECT g.name AS genre, COUNT(t.track_id) AS track_count
FROM tracks t
JOIN genres g ON g.genre_id = t.genre_id
GROUP BY g.name
ORDER BY track_count DESC;

-- 2. Average and count of track length per album
SELECT al.title, COUNT(t.track_id) AS num_tracks, AVG(t.milliseconds) AS avg_length
FROM tracks t
JOIN albums al ON al.album_id = t.album_id
GROUP BY al.title;

-- 3. HAVING: genres with more than 100 tracks
SELECT g.name AS genre, COUNT(t.track_id) AS track_count
FROM tracks t
JOIN genres g ON g.genre_id = t.genre_id
GROUP BY g.name
HAVING COUNT(t.track_id) > 100
ORDER BY track_count DESC;

-- 4. Revenue per customer
SELECT c.customer_id, c.first_name, c.last_name, SUM(i.total) AS revenue
FROM customers c
JOIN invoices i ON i.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY revenue DESC;

-- 5. WHERE + GROUP BY + HAVING together
SELECT g.name AS genre, AVG(t.unit_price) AS avg_price
FROM tracks t
JOIN genres g ON g.genre_id = t.genre_id
WHERE t.milliseconds > 60000
GROUP BY g.name
HAVING AVG(t.unit_price) > 0.99;
