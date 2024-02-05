WITH
group_and_define_couple AS (
	SELECT session_id, user_id, message_from, timestamp, string_agg(content, E'\n') AS content
		, CASE WHEN message_from='user' THEN 1 ELSE 0 END couple
	FROM chatbot_responses
	GROUP BY session_id, user_id, message_from, timestamp
),
caculate_couple AS (
	SELECT session_id, user_id, message_from, timestamp, content
		, SUM(couple) OVER (PARTITION BY session_id, user_id ORDER BY timestamp ASC
							   , message_from LIKE 'CONS%', message_from='bot', message_from='user' ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS couple
	FROM group_and_define_couple
),
group_message AS (
	SELECT session_id, user_id, message_from, MIN(timestamp) AS timestamp, string_agg(content, E'\n') AS content, couple
	FROM caculate_couple
	GROUP BY session_id, user_id, message_from, couple
)
SELECT q.session_id, q.user_id, q.timestamp, q.content AS questions, r.content AS responses
FROM group_message q INNER JOIN group_message r
ON q.session_id=r.session_id AND q.user_id=r.user_id AND q.couple=r.couple AND r.message_from<>'user'
WHERE q.message_from='user'
ORDER BY session_id ASC, user_id ASC, timestamp ASC;