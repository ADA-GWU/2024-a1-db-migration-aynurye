-- First step: new tables:

CREATE TABLE IF NOT EXISTS STUDENTS_green (
    STUDENT_ID SERIAL PRIMARY KEY,
    ST_NAME VARCHAR(30),
    ST_LAST VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS INTERESTS_green (
    STUDENT_ID INTEGER,
    INTERESTS TEXT[]
);

-- Constraints:
ALTER TABLE INTERESTS_green ADD CONSTRAINT fk_student_id FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS_green(STUDENT_ID);

-- Data copiying;
INSERT INTO STUDENTS_green (STUDENT_ID, ST_NAME, ST_LAST)
SELECT ST_ID, ST_NAME, ST_LAST FROM STUDENTS ORDER BY ST_ID;

INSERT INTO INTERESTS_green (STUDENT_ID, INTERESTS)
SELECT STUDENT_ID, ARRAY_AGG(INTEREST ORDER BY INTEREST) AS INTERESTS
FROM INTERESTS
GROUP BY STUDENT_ID;

-- Final Migration Steps:
ALTER TABLE STUDENTS RENAME TO STUDENTS_blue;
ALTER TABLE INTERESTS RENAME TO INTERESTS_blue;

ALTER TABLE STUDENTS_green RENAME TO STUDENTS;
ALTER TABLE INTERESTS_green RENAME TO INTERESTS;

-- Display
SELECT * FROM STUDENTS;
SELECT * FROM INTERESTS;