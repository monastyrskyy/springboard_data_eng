-- Write a SQL query to find the substitute players who came into the field in the first
-- half of play, within a normal play schedule.

SELECT player_name
FROM sql_mini_project.player_in_out
left join sql_mini_project.player_mast
using(player_id)
WHERE in_out = 'I'
and play_schedule = 'NT'
and play_half = 1;