SELECT *
FROM pupil p
WHERE 1 = 1
	-- return FALSE if some requirements having year=2023 and term=1 are not done
	AND NOT EXISTS (
		SELECT 1
		FROM requirement r
		WHERE 1 = 1
			AND r.year = 2023
			AND r.term = 1
			-- return TRUE if the checklist of the respective pupil and requirement are not done
			AND NOT EXISTS(
				SELECT 1
				FROM checklist c
				WHERE 1 = 1
					AND c.pupil_id = p.id
					AND c.requirement_id = r.id
					AND c.done = 1
			)
	)
ORDER By p.id