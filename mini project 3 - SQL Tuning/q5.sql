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

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
SELECT * FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
WHERE Student.id = alias.studId;
-- Query cost 17.47


-- ANALYSIS
-- No index provided, resulting in very slow runtimes for large queries. Subquery also takes a long time.
CREATE INDEX crsCode
ON Course (crsCode);

SELECT * FROM Student
JOIN (SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND deptId <> @v7 AND Course.crsCode = Transcript.crsCode) as alias
ON Student.id = alias.studId;

-- Query cost was the same, but the query is more readable now.
