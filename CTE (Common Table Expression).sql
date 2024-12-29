SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;
 
WITH CTE AS (
    SELECT first_name, DEPARTMENT_ID, SALARY,
           DENSE_RANK() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS DRK
    FROM EMPLOYEES
)
SELECT * 
FROM CTE 
WHERE DRK = 1;