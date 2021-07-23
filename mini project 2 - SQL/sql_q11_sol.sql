-- Write a SQL query to find the players, their jersey number, and playing club who were
-- the goalkeepers for England in EURO Cup 2016.
SELECT player_name, jersey_no, playing_club
FROM sql_mini_project.player_mast as p
LEFT JOIN sql_mini_project.soccer_country as c
on p.team_id = c.country_id
WHERE c.country_name = 'England' AND posi_to_play = 'GK'
;