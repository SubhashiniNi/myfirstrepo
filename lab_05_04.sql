1.select l.location_id,l.street_address,l.city,l.state_province,c.country_name from locations as l JOIN countries  as c on (l.country_id=c.country_id);
2. select e.last_name,e.department_id ,d.department_name from employees e JOIN departments d on(e.department_id=d.department_id);
3.select e.last_name,e.job_id,e.department_id,d.department_id,d.department_name from employees e JOIN departments d on (e.department_id=d.department_id) JOIN locations l on(l.location_id=d.location_id) and l.city='Toronto';
4.