select first_name ||' '||employee_id  from employees;

-->Retrieve all employees in the HR department
select * 
From employees 
where department_id = (
    select department_id 
    frim departments 
    where department_name = 'HR'
);

-->Find the total salary of employees in the HR department
select sum(salary) AS total_salary
from employees
where department_id = (
    select department_id 
    from departments 
    where department_name = 'HR'
);

-->List employees with the job title containing 'HR'
select employee_id, first_name, last_name, job_id
from employees
where job_id IN (
    select job_id 
    from jobs 
    where job_title LIKE '%HR%'
);

-->Find the highest-paid HR employee
select employee_id, first_name, last_name, salary
from employees
where department_id = (
    select department_id 
    from departments 
    where department_name = 'HR'
)
order by salary desc
limit 1;