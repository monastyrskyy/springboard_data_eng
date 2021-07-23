-- Write a SQL query that returns the total number of goals scored by each position on
-- each country’s team. Do not include positions which scored no goals.

SELECT posi_to_play, pp.position_desc, count(distinct goal_id)
FROM sql_mini_project.player_mast as p
LEFT JOIN sql_mini_project.goal_details as h
USING(player_id)
LEFT JOIN playing_position as pp
on p.posi_to_play = pp.position_id
GROUP BY posi_to_play
HAVING count(distinct goal_id) > 0;