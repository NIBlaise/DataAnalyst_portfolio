CREATE DATABASE projects;

-- DATA CLEANING

SELECT *
FROM hr;

## Renaming the ID COLUMN
ALTER TABLE hr
RENAME COLUMN  `ï»¿id` TO `id`;

DESCRIBE hr;

SELECT birthdate
FROM hr;

## Converting the date from string to date type
ALTER TABLE hr
MODIFY birthdate DATE;

UPDATE hr
SET birthdate = CASE 
	WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'),'%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL
END;


## Converting the hire_date from string to date type
ALTER TABLE hr
MODIFY hire_date DATE;

UPDATE hr
SET hire_date = CASE 
	WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'),'%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL
END;

## Converting the termdate from string to date-time type
UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', DATE(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate
FROM hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

#Adding a new column
ALTER TABLE hr
ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());

SELECT birthdate, age
FROM hr;

SELECT 
	MIN(age),
    MAX(age)
FROM hr;

SELECT COUNT(*)
FROM hr
WHERE age<18;




    


	



