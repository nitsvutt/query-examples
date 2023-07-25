SELECT ROUND(
    (
        (
            SELECT COUNT(DISTINCT a1.player_id)
            FROM activity a1
            INNER JOIN activity a2
            ON a1.player_id = a2.player_id
            AND a1.event_date = DATE_ADD(a2.event_date, INTERVAL 1 DAY)
        )
        /
        (
            SELECT COUNT(DISTINCT player_id) FROM activity
        )
    ), 2) AS fraction;