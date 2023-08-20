--Start of 	Queries



--List the employee number, last name, first name, sex, and salary of each employee.
-- Question 1

select 
	e.emp_no, 
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
from employees as e
	left join salaries as s
		on (e.emp_no = s.emp_no)

--Question 2
-- List the first name, last name, and hire date for the employees who were hired in 1986.

select 
	first_name,
	last_name,
	hire_date
from
	employees
where
	hire_date between '1986-01-01' and '1986-12-31'		

--List the manager of each department along with their 
--department number, department name, employee number, last name, and first name.

--Question 3

SELECT 
	dept_manager.dept_no, 
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name, 
	employees.first_name
FROM 
	dept_manager 
LEFT JOIN 
	departments

ON 
	dept_manager.dept_no = departments.dept_no
LEFT JOIN 
	employees
ON 
	dept_manager.emp_no = employees.emp_no
ORDER BY
	 emp_no


--List the department number for each employee along with that
--employee’s employee number, last name, first name, and department name
--Question 4

SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	dept_emp.dept_no,
	departments.dept_name
FROM 
	employees 
INNER JOIN 
	dept_emp 
ON 
	employees.emp_no=dept_emp.emp_no
INNER JOIN 
	departments 
ON 
	departments.dept_no=dept_emp.dept_no
order by 
	emp_no;


--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B.
--Question 5

SELECT 
	employees.first_name,
	employees.last_name,
	employees.sex
FROM 
	employees
WHERE 
	first_name = 'Hercules' 
	AND last_name like 'B%'


--List each employee in the Sales department, including their employee number, last name, and first name.
-- QUestion 6

Select
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	dept_emp.dept_no
FROM 
	employees 
LEFT JOIN 
	dept_emp 
ON 
	employees.emp_no=dept_emp.emp_no
INNER JOIN 
	departments 
ON 
	departments.dept_no=dept_emp.dept_no
WHERE 
	departments.dept_name='Sales';
	
--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
-- Question 7

Select 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	dept_emp.dept_no
From
	employees
LEFT JOIN 
	dept_emp 
ON 
	employees.emp_no=dept_emp.emp_no
INNER JOIN 
	departments 
ON 
	departments.dept_no=dept_emp.dept_no
WHERE 
	departments.dept_name='Sales'
	OR departments.dept_name='Development'; 

--List the frequency counts, in descending order, of all the 
--employee last names (that is, how many employees share each last name).
-- Question 8

Select 
	employees.last_name, COUNT(*) AS frequency
from
	employees
GROUP BY 
	last_name
ORDER BY 
	frequency DESC;