1.select last_name,hire_date from employees where department_id=(select department_id from employees where last_name='zlotkey') and last_name<>'zlotkey';
2. select employee_id,last_name,salary from employeeswhere salary>(select avg(salary) from employees) order by salary;
3.select employee_id,last_name from employees where department_id in (select department_id from employees where last_name like '%u%' );
4. select last_name,department_id,job_id from employees where department_id in (select department_id from departments where location_id=1700);
5. select last_name, salary from employees where manager_id = (select employee_id from employees whe
