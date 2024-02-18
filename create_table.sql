CREATE TABLE IF NOT EXISTS STUDENTS (
    ST_ID SERIAL PRIMARY KEY,
    ST_NAME VARCHAR(20),
    ST_LAST VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS INTERESTS (
    STUDENT_ID INTEGER,
    INTEREST VARCHAR(20),
    PRIMARY KEY (STUDENT_ID, INTEREST) -- If Interest column is excluded from being a pkey, then we won't have duplications in the table. So, not to delete.
);

INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_LAST) VALUES
(1, 'Konul', 'Gurbanova'),
(2, 'Shahnur', 'Isgandarli'),
(3, 'Natavan', 'Mammadova')
ON CONFLICT (ST_ID) DO NOTHING;

INSERT INTO INTERESTS (STUDENT_ID, INTEREST) VALUES
(1, 'Tennis'),
(1, 'Literature'),
(2, 'Math'),
(2, 'Tennis'),
(3, 'Math'),
(3, 'Music'),
(2, 'Football'),
(1, 'Chemistry'),
(3, 'Chess')
ON CONFLICT DO NOTHING;

SELECT * FROM STUDENTS;
SELECT * FROM INTERESTS;