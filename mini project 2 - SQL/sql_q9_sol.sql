-- Write a SQL query to find the goalkeeper’s name and jersey number, playing for
-- Germany, who played in Germany’s group stage matches.

SELECT distinct player_gk, p.player_name, p.jersey_no
FROM sql_mini_project.match_details as m
LEFT JOIN soccer_country as c
on m.team_id = c.country_id
LEFT JOIN player_mast as p
on m.player_gk = p.player_id
WHERE m.play_stage = 'G' AND c.country_name = 'Germany';