-- This problem was inspired by https://leetcode.com/
/* 
1. Metadata:
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
- This table shows the activity of players of some games.
- (player_id, event_date) is the primary key of the table.
- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday
using some device.

2. Requirement:
- Write an SQL query to report the fraction of players that logged in again on the day after the day they had logged in,
rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two
consecutive days, then divide that number by the total number of players.

3. Example:
a. Input:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+
b. Output:
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
c. Explanation:
- Only the player with id 1 logged back in after the day he had logged in so the answer is 1/3 = 0.33.
*/

SELECT ROUND(
    (
        (
            SELECT COUNT(DISTINCT a1.player_id)
            FROM Activity a1
            INNER JOIN Activity a2
            ON a1.player_id = a2.player_id
            AND a1.event_date = DATE_ADD(a2.event_date, INTERVAL 1 DAY)
        )
        /
        (
            SELECT COUNT(DISTINCT player_id) FROM Activity
        )
    ), 2) AS fraction;