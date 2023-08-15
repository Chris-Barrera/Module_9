create table departments(
	dept_no varchar(4) Primary Key NOT NULL,
	dept_name varchar(40) NOT NULL	
);

create table titles(
	title_id varchar(5) Primary Key NOT NULL,
	title varchar(40) NOT NULL
);

create table employees(
	emp_no int Primary Key NOT NULL, 
	emp_title_id varchar(5) NOT NULL,
	birth_date date NOT NULL, 
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
); 

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no varchar(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager(
	dept_no varchar(4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

select *
from employees