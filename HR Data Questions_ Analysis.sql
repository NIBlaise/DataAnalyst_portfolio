
-- DATA ANALYSIS

-- GENDER BREAKDOWN OF EMPLOYEES IN THE COMPANY
SELECT
	gender,
	COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY gender;

-- RACE/ETHNICITY BREAKDOWN OF EMPLOYEES IN THE COMPANY
SELECT 
	race, 
    COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY race
ORDER BY count DESC ;

-- AGE DISTRIBUTION OF EMPLOYEES IN THE COMPANY
SELECT 
	MIN(age) AS youngest,
    MAX(age) AS oldest
FROM hr
WHERE age >=18 AND termdate = '0000-00-00';

SELECT 
	CASE
		WHEN age >=18 AND age <=25 THEN '18-25'
        WHEN age >=26 AND age <=35 THEN '26-35'
        WHEN age >=36 AND age <=45 THEN '36-45'
        WHEN age >=46 AND age <=55 THEN '46-55'
	ELSE '55+'
    END AS age_group,
COUNT(*)
FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;

SELECT 
	CASE
		WHEN age >=18 AND age <=25 THEN '18-25'
        WHEN age >=26 AND age <=35 THEN '26-35'
        WHEN age >=36 AND age <=45 THEN '36-45'
        WHEN age >=46 AND age <=55 THEN '46-55'
	ELSE '55+'
    END AS age_group,
    gender,
	COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY age_group, gender
ORDER BY age_group, gender;

-- EMPLOYEES WORKING AT HEADQUARTERS VS EMPLOYEES WHO WORK REMOTELY
SELECT 
location,
COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY location;


-- AVERAGE LENGHT OF EMPLOYMENT OF EMPLOYEES WHO HAVE BEEN TERMINATED
SELECT 
	ROUND(AVG(DATEDIFF(termdate,hire_date)/365),2) AS avg_length_employment
FROM hr
WHERE termdate <=CURDATE() AND termdate != '0000-00-00' AND age>=18;

-- GENDER DISTRIBUTION VARY ACROSS DEPARTMENTS
SELECT 
	department,
   gender,
   COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY department, gender
ORDER BY department;

-- DISTRIBUTION OF JOB TITLES ACROSS THE COMPANY
SELECT 
	jobtitle,
	COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle DESC;


-- DEPARTMENT WITH THE HIGHEST TURNOVER RATE

SELECT 
	department,
    total_count,
    terminated_count,
    ROUND((terminated_count/total_count)*100,2) AS termination_rate
FROM (
	SELECT 
    department,
    COUNT(*) AS total_count,
    SUM(CASE WHEN termdate != '0000-00-00' AND termdate < CURDATE() THEN 1 ELSE 0 END) AS terminated_count
    FROM hr
    WHERE age >=18 
    GROUP BY  department
    ) AS sub_query
ORDER BY termination_rate DESC;

-- DISTRIBUTION OF EMPLOYEES ACROSS LOCATIONS BY CITY AND STATE
SELECT 
	location_state,
	COUNT(*) AS count
FROM hr
WHERE age>=18 AND termdate = '0000-00-00'
GROUP BY  location_state
ORDER BY count DESC;

-- Employee Count Trend Over Time (Based on Hire and Termination Dates)

SELECT
	year,
    hires,
    terminations,
    hires - terminations AS net_change,
    ROUND((hires-terminations)/hires *100, 2) AS net_change_percent
FROM  (
	SELECT 
		YEAR(hire_date) AS year,
        COUNT(*) AS hires,
        SUM(CASE WHEN termdate != '0000-00-00' AND termdate < CURDATE() THEN 1 ELSE 0 END) AS terminations
        FROM hr
        WHERE age >=18
        GROUP BY YEAR(hire_date)
		) AS sub_querry
ORDER BY year ASC;


-- TENURE DESTRIBUTION BY EACH DEPARTMENT
SELECT 
	department,
    ROUND(AVG(DATEDIFF(termdate,hire_date)/365),0) AS avg_tenure
FROM hr
WHERE termdate != '0000-00-00' AND termdate < CURDATE() AND age >=18
GROUP BY department;