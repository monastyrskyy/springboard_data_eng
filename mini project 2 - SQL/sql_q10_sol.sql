-- Write a SQL query to find all available information about the players under contract to
-- Liverpool F.C. playing for England in EURO Cup 2016

-- Nulls imply the player does not have this information stored about him.
-- This query reports all the potentially available information.

SELECT * 
FROM sql_mini_project.player_mast as m
left join soccer_country as c
on m.team_id = c.country_id
left join playing_position as p
on m.posi_to_play = p.position_id
left join player_booked as b
using(player_id)
left join penalty_shootout as s
using(player_id)
left join goal_details as g
using(player_id)
WHERE playing_club = 'Liverpool' 
AND country_name = 'England';