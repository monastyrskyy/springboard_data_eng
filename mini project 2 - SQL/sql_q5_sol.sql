-- Write a SQL query to find the number of bookings that happened in stoppage time.
SELECT count(*) 
FROM sql_mini_project.player_booked
WHERE booking_time > 90;