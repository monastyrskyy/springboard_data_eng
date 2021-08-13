USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 4. List the names of students who have taken a course taught by professor v5 (name).
SELECT name FROM Student,
	(SELECT studId FROM Transcript,
		(SELECT crsCode, semester FROM Professor
			JOIN Teaching
			WHERE Professor.name = @v5 AND Professor.id = Teaching.profId) as alias1
	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2 -- confusing line, see if you can fix it
WHERE Student.id = alias2.studId;

-- optimization is now good, see if you can make it easily readable.

-- ANALYSIS
-- No index provided, resulting in very slow runtimes for large queries. Subquery also takes a long time.
CREATE INDEX name
ON Professor (name);

CREATE INDEX profId
ON Teaching (profId);

select s.name from professor p
join teaching t on p.id = t.profId
join transcript t2 on t.crsCode = t2.crsCode
join student s on t2.studId = s.id
where p.name = @v5

-- The query from the problem was super unreadable and did not produce any results. Adding the indexes to the proper tables, and rewriting the query produced the proper results.
-- Without the indexes, the query cost was over 540.0, and with the indexes, the query cost ended up being 1.42 .
