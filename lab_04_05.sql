4. select max(salary) maximum,min(salary) minimum,sum(salary) Sum,avg(salary) average from employees;
5.select job_id, max(salary) maximum,min(salary) minimum,sum(salary) Sum,avg(salary) average from employees group by department_id;
6. select job_id,count(*) from employees group by job_id;
7.select count(manager_id) NumberOfManagers from employees;
8.select max(salary)-min(salary) Difference from employees;
9. select manager_id,min(salary) from employees group by manager_id having min(salary)>6000 order by salary desc;
10. select count(*) "Total" ,(select count(*) from employees where year(hire_date)=1997) "1997",(select count(*) from employees where year(hire_date)=1995) "1995" ,(select count(*) from employees where year(hire_date)=1996) "1996" ,(select count(*) from employees where year(hire_date)=1998) "1998" from employees;
11.