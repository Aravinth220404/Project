select department, first_name, last_name, performance_rating
from employees
join performance_reviews ON employees.employee_id = performance_reviews.employee_id
where performance_rating = (
    select max(performance_rating)
    from performance_reviews pr
    join employees e ON pr.employee_id = e.employee_id
    where e.department = employees.department
);