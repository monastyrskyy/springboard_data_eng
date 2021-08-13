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

-- 3. List the names of students who have taken course v4 (crsCode).
SELECT name FROM Student WHERE id IN (SELECT studId FROM Transcript WHERE crsCode = @v4);


-- ANALYSIS
-- No index provided, resulting in very slow runtimes for large queries. Subquery also takes a long time.
-- Query cost: 414.29

CREATE INDEX crsCode
ON Transcript (crsCode);
-- This helped a ton - new query cost: 83.11
CREATE INDEX id
ON Student (id);
-- This helped a even more - new query cost: 2.8

SELECT name FROM Student 
JOIN (SELECT studID FROM Transcript WHERE crsCode = @v4) sub ON  Student.id = sub.studID;
-- Finally removing the IN operator and rewriting the query as a join brought the query cost to an all time low of 1.40, over 295 times faster than the original query.