-- Write a SQL query to find the referees who booked the most number of players.

SELECT referee_name, count(distinct player_id)
FROM sql_mini_project.match_mast
LEFT JOIN sql_mini_project.referee_mast
USING(referee_id)
LEFT JOIN sql_mini_project.player_booked
USING(match_no)
group by referee_name
order by count(distinct player_id) desc
;