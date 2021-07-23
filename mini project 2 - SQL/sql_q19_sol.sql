-- . Write a SQL query to find the number of captains who were also goalkeepers.

SELECT distinct player_name
FROM sql_mini_project.match_captain as c
left join sql_mini_project.player_mast as m
on c.player_captain = m.player_id
WHERE posi_to_play = 'GK';