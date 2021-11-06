SELECT e.emp_no, e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no, t.title DESC;

SELECT * FROM ret_info

-- Use Dictinct w/Orderby to remove duplicates
SELECT DISTINCT ON (re.emp_no) re.emp_no,
re.first_name,
re.last_name,
re.title
INTO unique_titles
FROM ret_info AS re
ORDER BY re.emp_no ASC, re.to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT(un.title), un.title
INTO retiring_titles
FROM unique_titles AS un
GROUP BY un.title
ORDER BY un.count DESC;

SELECT * FROM retiring_titles

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')	
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty

-- Created table of retirees to count how many retiring
SELECT DISTINCT ON (re.emp_no) re.emp_no, re.first_name, re.last_name, re.title, re.from_date, 
					re.to_date, em.birth_date
INTO silver_tsunami					
FROM ret_info AS re
INNER JOIN employees AS em
	ON (re.emp_no = em.emp_no)
WHERE (to_date = '9999-01-01')
AND (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (re.from_date <= '2001-01-01')
ORDER BY re.emp_no;

SELECT * FROM silver_tsunami

SELECT COUNT(un.title), un.title
INTO silver_tsunami_count
FROM silver_tsunami AS un
GROUP BY un.title
ORDER BY un.count DESC;


SELECT e.emp_no
FROM employees AS e
WHERE (e.birth_date >='01-01-1956')

SELECT * FROM mentorship_eligibilty

