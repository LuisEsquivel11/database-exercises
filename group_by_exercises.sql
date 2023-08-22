USE employees;


SELECT DISTINCT
SELECT title
FROM titles
GROUP BY  title;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name
ORDER BY last_name ASC;


SELECT COUNT(*) AS Total, last_name AS "Last Name ";
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name LIKE '%qu%'
GROUP BY last_name;


SELECT COUNT(*) AS Total, gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;