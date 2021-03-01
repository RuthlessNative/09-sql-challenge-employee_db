-- Data Analysis 1
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.sex, sal.salary
FROM public."Employees" as emp
INNER JOIN public."Salaries" as sal ON
emp.emp_no = sal.emp_no;

-- Data Analysis 2
-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM public."Employees" as emp
WHERE 
	hire_date >= '1986-01-01'
	AND hire_date < '1987-01-01' ;
	
-- Data Analysis 3
-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT depts.dept_no, depts.dept_name, dept_man.emp_no, emp.last_name, emp.first_name
FROM public."Departments" AS depts
INNER JOIN public."Depart_Manager" AS dept_man ON
dept_man.dept_no = depts.dept_no
INNER JOIN public."Employees" AS emp ON
emp.emp_no = dept_man.emp_no;

-- Data Analysis 4
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, depts.dept_name
FROM public."Employees" AS emp
INNER JOIN public."Dept_Emp" AS dept_emp ON
dept_emp.emp_no = emp.emp_no
INNER JOIN public."Departments" AS depts ON
dept_emp.dept_no = depts.dept_no;

-- Data Analysis 5
-- List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."
SELECT emp.first_name, emp.last_name, emp.sex
FROM public."Employees" AS emp
WHERE
	emp.first_name = 'Hercules'
	AND emp.last_name LIKE 'B%';
	
-- Data Analysis 6
-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, depts.dept_name
FROM public."Employees" AS emp
INNER JOIN public."Dept_Emp" AS dept_emp ON
dept_emp.emp_no = emp.emp_no
INNER JOIN public."Departments" AS depts ON
dept_emp.dept_no = depts.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp.last_name ASC;

-- Data Analysis 7
-- List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, depts.dept_name
FROM public."Employees" AS emp
INNER JOIN public."Dept_Emp" AS dept_emp ON
dept_emp.emp_no = emp.emp_no
INNER JOIN public."Departments" AS depts ON
dept_emp.dept_no = depts.dept_no
WHERE dept_name = 'Sales' 
OR dept_name = 'Development'
ORDER BY emp.last_name ASC;

-- Data Analysis 8
-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT emp.last_name, COUNT(emp.last_name)
FROM public."Employees" AS emp
GROUP BY emp.last_name
ORDER BY emp.last_name DESC;