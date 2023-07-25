WITH ranked_pupil AS(
	SELECT
		id, first_name, last_name, grade, gpa,
		DENSE_RANK() OVER(PARTITION BY grade ORDER BY gpa DESC) AS rank
	FROM pupil
)
SELECT id, first_name, last_name, grade, gpa
FROM ranked_pupil
WHERE rank = 1
ORDER by grade, id;