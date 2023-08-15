--Start of 	Queries



--query 1 List the employee number, last name, first name, sex, and salary of each employee.

select 
	e.emp_no, 
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
from employees as e
	left join salaries as s
		on (e.emp_no = s.emp_no)