-- 41
SELECT * FROM bookings
WHERE fare > 400;

-- 42
SELECT * FROM bookings
WHERE status <> 'Confirmed';

-- 43
SELECT * FROM trains
WHERE source = 'Chennai';

-- 44
SELECT * FROM bookings
WHERE fare BETWEEN 300 AND 500;

-- 45
SELECT * FROM bookings
WHERE passenger_name LIKE 'A%';

-- 46
SELECT t.train_name, b.passenger_name
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id;

-- 47
SELECT t.train_name, COUNT(b.booking_id) AS booking_count
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;

-- 48
SELECT t.train_name, SUM(b.fare) AS total_fare
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;

-- 49
SELECT *
FROM bookings
WHERE fare = (
    SELECT MAX(fare)
    FROM bookings
);

-- 50
SELECT t.train_name, COUNT(b.booking_id) AS booking_count
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name
HAVING COUNT(b.booking_id) > 1;