-- Note: CASE will immediately break after it has a value.

SELECT x, y, z,
	(
		CASE
            WHEN x = y AND y = z THEN 3
			WHEN (x + y) > z AND (x + z) > y AND (y + z) > x
				AND (x = y OR y = z OR x = z) THEN 2
			WHEN (x + y) > z AND (x + z) > y AND (y + z) > x THEN 1
			ELSE 0
		END
	) type
FROM triangle;