-- Write a SQL query to find all the venues where matches with penalty shootouts were
-- played.

SELECT distinct v.venue_name
FROM sql_mini_project.match_details as m1
LEFT JOIN sql_mini_project.match_mast as m2
USING(match_no)
LEFT JOIN soccer_venue as v
on m2.venue_id = v.venue_id
where m1.penalty_score > 1;