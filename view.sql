1.select employee_id,last_name from employees e order by (select department_name from departments d where e.department_id=d.department_id);
2.select last_name,salary,department_id from employees e where salary>(select avg(salary) from employees where department_id=e.department_id);
3. select e.employee_id,last_name,e.job_id from employees e where 2<=(select count(*) from employees where department_id=e.department_id);
4.select employee_id,last_name,job_id,department_id from employees e where exists (select 'x' from employees where department_id=e.department_id);
5.select employee_id,last_name,job_id,department_id from employees e where exists (select last_name  from employees where department_id=e.department_id);
6. select last_name,department_name,salary from employees  e join departments d where (e.salary,e.commission_pct) in(select e.salary,e.commission_pct from employees e join departments d where d.location_id=1700);
7.select e.last_name,d.department_name,e.salary from employees  e join departments d where (e.salary,e.commission_pct) in(select e.salary,e.commission_pct from employees e join departments d where d.location_id=1700);
8. select last_name,hire_date,salary from employees where salary in(select salary from employees where last_name!='kochhar');
9.select last_name,hire_date,salary from employees where salary=(select salary from employees where last_name='kochhar') and last_name not like "kochhar";
10.select last_name,job_id,salary from employees where salary> all(select salary from employees where job_id='sa_man') order by salary desc;
11.select employee_id,last_name,department_id from employees where last_name like 't%';
12.select last_name,job_id,salary from employees where salary> all(select salary from employees where job_id='sa_man' and commission_pct='null') order by salary desc;
13. select last_name,job_id,salary from employees where salary> all(select salary from employees where job_id='sa_man') order by salary desc;
14.select last_name,salary,department_id from employees where salary in (select avg(salary) from employees group by department_id);
15.mysql> select e1.last_name,e1.salary,e1.department_id, avg(e1.salary) from employees e1,employees e2 where e1.salary>(select avg(salary) from employees where e1.department_id=e2.department_id) group by e1.last_name,e1.salary,e1.department_id order by avg(e1.salary);
+------------+----------+---------------+----------------+
| last_name  | salary   | department_id | avg(e1.salary) |
+------------+----------+---------------+----------------+
| Mavris     |  6500.00 |            40 |    6500.000000 |
| Vollman    |  6500.00 |            50 |    6500.000000 |
| Lee        |  6800.00 |            80 |    6800.000000 |
| Popp       |  6900.00 |           100 |    6900.000000 |
| Sewall     |  7000.00 |            80 |    7000.000000 |
| Tuvault    |  7000.00 |            80 |    7000.000000 |
| Marvins    |  7200.00 |            80 |    7200.000000 |
| Bates      |  7300.00 |            80 |    7300.000000 |
| Smith      |  7400.00 |            80 |    7400.000000 |
| Doran      |  7500.00 |            80 |    7500.000000 |
| Cambrault  |  7500.00 |            80 |    7500.000000 |
| Sciarra    |  7700.00 |           100 |    7700.000000 |
| Urman      |  7800.00 |           100 |    7800.000000 |
| Kaufling   |  7900.00 |            50 |    7900.000000 |
| Olsen      |  8000.00 |            80 |    8000.000000 |
| Weiss      |  8000.00 |            50 |    8000.000000 |
| Smith      |  8000.00 |            80 |    8000.000000 |
| Fripp      |  8200.00 |            50 |    8200.000000 |
| Chen       |  8200.00 |           100 |    8200.000000 |
| Gietz      |  8300.00 |           110 |    8300.000000 |
| Livingston |  8400.00 |            80 |    8400.000000 |
| Taylor     |  8600.00 |            80 |    8600.000000 |
| Hutton     |  8800.00 |            80 |    8800.000000 |
| Hall       |  9000.00 |            80 |    9000.000000 |
| Faviet     |  9000.00 |           100 |    9000.000000 |
| McEwen     |  9000.00 |            80 |    9000.000000 |
| Hunold     |  9000.00 |            60 |    9000.000000 |
| Greene     |  9500.00 |            80 |    9500.000000 |
| Sully      |  9500.00 |            80 |    9500.000000 |
| Bernstein  |  9500.00 |            80 |    9500.000000 |
| Fox        |  9600.00 |            80 |    9600.000000 |
| Baer       | 10000.00 |            70 |   10000.000000 |
| King       | 10000.00 |            80 |   10000.000000 |
| Tucker     | 10000.00 |            80 |   10000.000000 |
| Bloom      | 10000.00 |            80 |   10000.000000 |
| Vishney    | 10500.00 |            80 |   10500.000000 |
| Zlotkey    | 10500.00 |            80 |   10500.000000 |
| Raphaely   | 11000.00 |            30 |   11000.000000 |
| Abel       | 11000.00 |            80 |   11000.000000 |
| Cambrault  | 11000.00 |            80 |   11000.000000 |
| Ozer       | 11500.00 |            80 |   11500.000000 |
| Higgins    | 12000.00 |           110 |   12000.000000 |
| Greenberg  | 12000.00 |           100 |   12000.000000 |
| Errazuriz  | 12000.00 |            80 |   12000.000000 |
| Hartstein  | 13000.00 |            20 |   13000.000000 |
| Partners   | 13500.00 |            80 |   13500.000000 |
| Russell    | 14000.00 |            80 |   14000.000000 |
| Kochhar    | 17000.00 |            90 |   17000.000000 |
| De Haan    | 17000.00 |            90 |   17000.000000 |
| King       | 24000.00 |            90 |   24000.000000 |
+------------+----------+---------------+----------------+
50 rows in set (0.40 sec)

mysql> select e1.last_name,e1.salary,e1.department_id, avg(e1.salary) from employees e1,employees e2 where e1.salary>(select avg(e1.salary) from employees where e1.department_id=e2.department_id) group by e1.last_name,e1.salary,e1.department_id order by avg(e1.salary);
Empty set (0.29 sec)

mysql> select e1.last_name,e1.salary,e1.department_id, avg(e1.salary) from employees e1,employees e2 where e1.salary>(select avg(e2.salary) from employees where e1.department_id=e2.department_id) group by e1.last_name,e1.salary,e1.department_id order by avg(e1.salary);
+-------------+----------+---------------+----------------+
| last_name   | salary   | department_id | avg(e1.salary) |
+-------------+----------+---------------+----------------+
| Markle      |  2200.00 |            50 |    2200.000000 |
| Philtanker  |  2200.00 |            50 |    2200.000000 |
| Gee         |  2400.00 |            50 |    2400.000000 |
| Landry      |  2400.00 |            50 |    2400.000000 |
| Patel       |  2500.00 |            50 |    2500.000000 |
| Vargas      |  2500.00 |            50 |    2500.000000 |
| Sullivan    |  2500.00 |            50 |    2500.000000 |
| Perkins     |  2500.00 |            50 |    2500.000000 |
| Marlow      |  2500.00 |            50 |    2500.000000 |
| Matos       |  2600.00 |            50 |    2600.000000 |
| OConnell    |  2600.00 |            50 |    2600.000000 |
| Himuro      |  2600.00 |            30 |    2600.000000 |
| Grant       |  2600.00 |            50 |    2600.000000 |
| Mikkilineni |  2700.00 |            50 |    2700.000000 |
| Seo         |  2700.00 |            50 |    2700.000000 |
| Atkinson    |  2800.00 |            50 |    2800.000000 |
| Jones       |  2800.00 |            50 |    2800.000000 |
| Tobias      |  2800.00 |            30 |    2800.000000 |
| Geoni       |  2800.00 |            50 |    2800.000000 |
| Gates       |  2900.00 |            50 |    2900.000000 |
| Rogers      |  2900.00 |            50 |    2900.000000 |
| Baida       |  2900.00 |            30 |    2900.000000 |
| Feeney      |  3000.00 |            50 |    3000.000000 |
| Cabrio      |  3000.00 |            50 |    3000.000000 |
| Khoo        |  3100.00 |            30 |    3100.000000 |
| Davies      |  3100.00 |            50 |    3100.000000 |
| Walsh       |  3100.00 |            50 |    3100.000000 |
| Fleaur      |  3100.00 |            50 |    3100.000000 |
| McCain      |  3200.00 |            50 |    3200.000000 |
| Stiles      |  3200.00 |            50 |    3200.000000 |
| Taylor      |  3200.00 |            50 |    3200.000000 |
| Nayer       |  3200.00 |            50 |    3200.000000 |
| Bissot      |  3300.00 |            50 |    3300.000000 |
| Mallin      |  3300.00 |            50 |    3300.000000 |
| Dellinger   |  3400.00 |            50 |    3400.000000 |
| Rajs        |  3500.00 |            50 |    3500.000000 |
| Dilly       |  3600.00 |            50 |    3600.000000 |
| Ladwig      |  3600.00 |            50 |    3600.000000 |
| Chung       |  3800.00 |            50 |    3800.000000 |
| Everett     |  3900.00 |            50 |    3900.000000 |
| Bell        |  4000.00 |            50 |    4000.000000 |
| Bull        |  4100.00 |            50 |    4100.000000 |
| Sarchand    |  4200.00 |            50 |    4200.000000 |
| Austin      |  4800.00 |            60 |    4800.000000 |
| Pataballa   |  4800.00 |            60 |    4800.000000 |
| Mourgos     |  5800.00 |            50 |    5800.000000 |
| Ernst       |  6000.00 |            60 |    6000.000000 |
| Banda       |  6200.00 |            80 |    6200.000000 |
| Johnson     |  6200.00 |            80 |    6200.000000 |
| Ande        |  6400.00 |            80 |    6400.000000 |
| Vollman     |  6500.00 |            50 |    6500.000000 |
| Lee         |  6800.00 |            80 |    6800.000000 |
| Tuvault     |  7000.00 |            80 |    7000.000000 |
| Sewall      |  7000.00 |            80 |    7000.000000 |
| Marvins     |  7200.00 |            80 |    7200.000000 |
| Bates       |  7300.00 |            80 |    7300.000000 |
| Smith       |  7400.00 |            80 |    7400.000000 |
| Cambrault   |  7500.00 |            80 |    7500.000000 |
| Doran       |  7500.00 |            80 |    7500.000000 |
| Sciarra     |  7700.00 |           100 |    7700.000000 |
| Urman       |  7800.00 |           100 |    7800.000000 |
| Kaufling    |  7900.00 |            50 |    7900.000000 |
| Weiss       |  8000.00 |            50 |    8000.000000 |
| Smith       |  8000.00 |            80 |    8000.000000 |
| Olsen       |  8000.00 |            80 |    8000.000000 |
| Chen        |  8200.00 |           100 |    8200.000000 |
| Fripp       |  8200.00 |            50 |    8200.000000 |
| Livingston  |  8400.00 |            80 |    8400.000000 |
| Taylor      |  8600.00 |            80 |    8600.000000 |
| Hutton      |  8800.00 |            80 |    8800.000000 |
| Hunold      |  9000.00 |            60 |    9000.000000 |
| Hall        |  9000.00 |            80 |    9000.000000 |
| McEwen      |  9000.00 |            80 |    9000.000000 |
| Faviet      |  9000.00 |           100 |    9000.000000 |
| Sully       |  9500.00 |            80 |    9500.000000 |
| Greene      |  9500.00 |            80 |    9500.000000 |
| Bernstein   |  9500.00 |            80 |    9500.000000 |
| Fox         |  9600.00 |            80 |    9600.000000 |
| Tucker      | 10000.00 |            80 |   10000.000000 |
| King        | 10000.00 |            80 |   10000.000000 |
| Bloom       | 10000.00 |            80 |   10000.000000 |
| Zlotkey     | 10500.00 |            80 |   10500.000000 |
| Vishney     | 10500.00 |            80 |   10500.000000 |
| Abel        | 11000.00 |            80 |   11000.000000 |
| Raphaely    | 11000.00 |            30 |   11000.000000 |
| Cambrault   | 11000.00 |            80 |   11000.000000 |
| Ozer        | 11500.00 |            80 |   11500.000000 |
| Greenberg   | 12000.00 |           100 |   12000.000000 |
| Errazuriz   | 12000.00 |            80 |   12000.000000 |
| Higgins     | 12000.00 |           110 |   12000.000000 |
| Hartstein   | 13000.00 |            20 |   13000.000000 |
| Partners    | 13500.00 |            80 |   13500.000000 |
| Russell     | 14000.00 |            80 |   14000.000000 |
| King        | 24000.00 |            90 |   24000.000000 |
+-------------+----------+---------------+----------------+
94 rows in set (0.28 sec)

mysql> select e1.last_name,e1.salary,e1.department_id, avg(e1.salary) from employees e1,employees e2 where e1.salary>(select avg(e2.salary) from employees where e1.department_id=e2.department_id) group by e1.last_name,e1.salary,e1.department_id order by avg(e1.salary);
+-------------+----------+---------------+----------------+
| last_name   | salary   | department_id | avg(e1.salary) |
+-------------+----------+---------------+----------------+
| Markle      |  2200.00 |            50 |    2200.000000 |
| Philtanker  |  2200.00 |            50 |    2200.000000 |
| Gee         |  2400.00 |            50 |    2400.000000 |
| Landry      |  2400.00 |            50 |    2400.000000 |
| Patel       |  2500.00 |            50 |    2500.000000 |
| Vargas      |  2500.00 |            50 |    2500.000000 |
| Sullivan    |  2500.00 |            50 |    2500.000000 |
| Perkins     |  2500.00 |            50 |    2500.000000 |
| Marlow      |  2500.00 |            50 |    2500.000000 |
| Matos       |  2600.00 |            50 |    2600.000000 |
| OConnell    |  2600.00 |            50 |    2600.000000 |
| Himuro      |  2600.00 |            30 |    2600.000000 |
| Grant       |  2600.00 |            50 |    2600.000000 |
| Mikkilineni |  2700.00 |            50 |    2700.000000 |
| Seo         |  2700.00 |            50 |    2700.000000 |
| Atkinson    |  2800.00 |            50 |    2800.000000 |
| Jones       |  2800.00 |            50 |    2800.000000 |
| Tobias      |  2800.00 |            30 |    2800.000000 |
| Geoni       |  2800.00 |            50 |    2800.000000 |
| Gates       |  2900.00 |            50 |    2900.000000 |
| Rogers      |  2900.00 |            50 |    2900.000000 |
| Baida       |  2900.00 |            30 |    2900.000000 |
| Feeney      |  3000.00 |            50 |    3000.000000 |
| Cabrio      |  3000.00 |            50 |    3000.000000 |
| Khoo        |  3100.00 |            30 |    3100.000000 |
| Davies      |  3100.00 |            50 |    3100.000000 |
| Walsh       |  3100.00 |            50 |    3100.000000 |
| Fleaur      |  3100.00 |            50 |    3100.000000 |
| McCain      |  3200.00 |            50 |    3200.000000 |
| Stiles      |  3200.00 |            50 |    3200.000000 |
| Taylor      |  3200.00 |            50 |    3200.000000 |
| Nayer       |  3200.00 |            50 |    3200.000000 |
| Bissot      |  3300.00 |            50 |    3300.000000 |
| Mallin      |  3300.00 |            50 |    3300.000000 |
| Dellinger   |  3400.00 |            50 |    3400.000000 |
| Rajs        |  3500.00 |            50 |    3500.000000 |
| Dilly       |  3600.00 |            50 |    3600.000000 |
| Ladwig      |  3600.00 |            50 |    3600.000000 |
| Chung       |  3800.00 |            50 |    3800.000000 |
| Everett     |  3900.00 |            50 |    3900.000000 |
| Bell        |  4000.00 |            50 |    4000.000000 |
| Bull        |  4100.00 |            50 |    4100.000000 |
| Sarchand    |  4200.00 |            50 |    4200.000000 |
| Austin      |  4800.00 |            60 |    4800.000000 |
| Pataballa   |  4800.00 |            60 |    4800.000000 |
| Mourgos     |  5800.00 |            50 |    5800.000000 |
| Ernst       |  6000.00 |            60 |    6000.000000 |
| Banda       |  6200.00 |            80 |    6200.000000 |
| Johnson     |  6200.00 |            80 |    6200.000000 |
| Ande        |  6400.00 |            80 |    6400.000000 |
| Vollman     |  6500.00 |            50 |    6500.000000 |
| Lee         |  6800.00 |            80 |    6800.000000 |
| Tuvault     |  7000.00 |            80 |    7000.000000 |
| Sewall      |  7000.00 |            80 |    7000.000000 |
| Marvins     |  7200.00 |            80 |    7200.000000 |
| Bates       |  7300.00 |            80 |    7300.000000 |
| Smith       |  7400.00 |            80 |    7400.000000 |
| Cambrault   |  7500.00 |            80 |    7500.000000 |
| Doran       |  7500.00 |            80 |    7500.000000 |
| Sciarra     |  7700.00 |           100 |    7700.000000 |
| Urman       |  7800.00 |           100 |    7800.000000 |
| Kaufling    |  7900.00 |            50 |    7900.000000 |
| Weiss       |  8000.00 |            50 |    8000.000000 |
| Smith       |  8000.00 |            80 |    8000.000000 |
| Olsen       |  8000.00 |            80 |    8000.000000 |
| Chen        |  8200.00 |           100 |    8200.000000 |
| Fripp       |  8200.00 |            50 |    8200.000000 |
| Livingston  |  8400.00 |            80 |    8400.000000 |
| Taylor      |  8600.00 |            80 |    8600.000000 |
| Hutton      |  8800.00 |            80 |    8800.000000 |
| Hunold      |  9000.00 |            60 |    9000.000000 |
| Hall        |  9000.00 |            80 |    9000.000000 |
| McEwen      |  9000.00 |            80 |    9000.000000 |
| Faviet      |  9000.00 |           100 |    9000.000000 |
| Sully       |  9500.00 |            80 |    9500.000000 |
| Greene      |  9500.00 |            80 |    9500.000000 |
| Bernstein   |  9500.00 |            80 |    9500.000000 |
| Fox         |  9600.00 |            80 |    9600.000000 |
| Tucker      | 10000.00 |            80 |   10000.000000 |
| King        | 10000.00 |            80 |   10000.000000 |
| Bloom       | 10000.00 |            80 |   10000.000000 |
| Zlotkey     | 10500.00 |            80 |   10500.000000 |
| Vishney     | 10500.00 |            80 |   10500.000000 |
| Abel        | 11000.00 |            80 |   11000.000000 |
| Raphaely    | 11000.00 |            30 |   11000.000000 |
| Cambrault   | 11000.00 |            80 |   11000.000000 |
| Ozer        | 11500.00 |            80 |   11500.000000 |
| Greenberg   | 12000.00 |           100 |   12000.000000 |
| Errazuriz   | 12000.00 |            80 |   12000.000000 |
| Higgins     | 12000.00 |           110 |   12000.000000 |
| Hartstein   | 13000.00 |            20 |   13000.000000 |
| Partners    | 13500.00 |            80 |   13500.000000 |
| Russell     | 14000.00 |            80 |   14000.000000 |
| King        | 24000.00 |            90 |   24000.000000 |
+-------------+----------+---------------+----------------+
94 rows in set (0.30 sec)

mysql> select last_name from employees e where e.salary<(select avg(e1.salary) from employees where e.department_id=e1.department_id);
ERROR 1054 (42S22): Unknown column 'e1.salary' in 'field list'
mysql> select last_name from employees e where e.salary<(select avg(e1.salary) from employees e1 where e.department_id=e1.department_id);
+-------------+
| last_name   |
+-------------+
| Kochhar     |
| De Haan     |
| Austin      |
| Pataballa   |
| Lorentz     |
| Chen        |
| Sciarra     |
| Urman       |
| Popp        |
| Khoo        |
| Baida       |
| Tobias      |
| Himuro      |
| Colmenares  |
| Nayer       |
| Mikkilineni |
| Landry      |
| Markle      |
| Bissot      |
| Atkinson    |
| Marlow      |
| Olson       |
| Mallin      |
| Rogers      |
| Gee         |
| Philtanker  |
| Stiles      |
| Seo         |
| Patel       |
| Davies      |
| Matos       |
| Vargas      |
| Olsen       |
| Cambrault   |
| Tuvault     |
| Smith       |
| Doran       |
| Sewall      |
| Marvins     |
| Lee         |
| Ande        |
| Banda       |
| Smith       |
| Bates       |
| Kumar       |
| Hutton      |
| Taylor      |
| Livingston  |
| Johnson     |
| Taylor      |
| Fleaur      |
| Sullivan    |
| Geoni       |
| Dellinger   |
| Cabrio      |
| Gates       |
| Perkins     |
| McCain      |
| Jones       |
| Walsh       |
| Feeney      |
| OConnell    |
| Grant       |
| Fay         |
| Gietz       |
+-------------+
65 rows in set (0.01 sec)

mysql> select last_name from employees e where e.salary<(select avg(e1.salary) from employees e1 where e.department_id=e1.department_id);
+-------------+
| last_name   |
+-------------+
| Kochhar     |
| De Haan     |
| Austin      |
| Pataballa   |
| Lorentz     |
| Chen        |
| Sciarra     |
| Urman       |
| Popp        |
| Khoo        |
| Baida       |
| Tobias      |
| Himuro      |
| Colmenares  |
| Nayer       |
| Mikkilineni |
| Landry      |
| Markle      |
| Bissot      |
| Atkinson    |
| Marlow      |
| Olson       |
| Mallin      |
| Rogers      |
| Gee         |
| Philtanker  |
| Stiles      |
| Seo         |
| Patel       |
| Davies      |
| Matos       |
| Vargas      |
| Olsen       |
| Cambrault   |
| Tuvault     |
| Smith       |
| Doran       |
| Sewall      |
| Marvins     |
| Lee         |
| Ande        |
| Banda       |
| Smith       |
| Bates       |
| Kumar       |
| Hutton      |
| Taylor      |
| Livingston  |
| Johnson     |
| Taylor      |
| Fleaur      |
| Sullivan    |
| Geoni       |
| Dellinger   |
| Cabrio      |
| Gates       |
| Perkins     |
| McCain      |
| Jones       |
| Walsh       |
| Feeney      |
| OConnell    |
| Grant       |
| Fay         |
| Gietz       |
+-------------+
65 rows in set (0.00 sec)

mysql> select e.last_name from employees e where exists (select a.last_name from employees a where e.departmemnt_id=a.department_id and e.hire_date>a.hire_date and e.salary>a.salary);
ERROR 1054 (42S22): Unknown column 'e.departmemnt_id' in 'where clause'
mysql> select e.last_name from employees e where exists (select a.last_name from employees a where e.departmennt_id=a.department_id and e.hire_date>a.hire_date and e.salary>a.salary);
ERROR 1054 (42S22): Unknown column 'e.departmennt_id' in 'where clause'
mysql> select e.last_name from employees e where exists (select a.last_name from employees a where e.department_id=a.department_id and e.hire_date>a.hire_date and e.salary>a.salary);
+-------------+
| last_name   |
+-------------+
| Greenberg   |
| Urman       |
| Baida       |
| Weiss       |
| Fripp       |
| Vollman     |
| Mourgos     |
| Nayer       |
| Mikkilineni |
| Markle      |
| Bissot      |
| Atkinson    |
| Rogers      |
| Gee         |
| Philtanker  |
| Stiles      |
| Seo         |
| Matos       |
| Russell     |
| Partners    |
| Errazuriz   |
| Cambrault   |
| Zlotkey     |
| Tucker      |
| Bernstein   |
| Hall        |
| Olsen       |
| Cambrault   |
| Vishney     |
| Greene      |
| Marvins     |
| Lee         |
| Ande        |
| Ozer        |
| Bloom       |
| Fox         |
| Smith       |
| Bates       |
| Abel        |
| Hutton      |
| Taylor      |
| Livingston  |
| Taylor      |
| Fleaur      |
| Sullivan    |
| Geoni       |
| Sarchand    |
| Bull        |
| Dellinger   |
| Cabrio      |
| Chung       |
| Dilly       |
| Gates       |
| Perkins     |
| Bell        |
| Everett     |
| McCain      |
| Jones       |
| Walsh       |
| Feeney      |
| OConnell    |
| Grant       |
+-------------+
62 rows in set (0.01 sec)

mysql> select employee_id,last_name,(select department_name d from departs d where e.department_id=d.department_id) from employees e order by departments;
ERROR 1146 (42S02): Table 'hr.departs' doesn't exist
mysql> select employee_id,last_name,(select department_name d from departments d where e.department_id=d.department_id) from employees e order by departments;
ERROR 1054 (42S22): Unknown column 'departments' in 'order clause'
mysql> select employee_id,last_name,(select department_name d from departments d where e.department_id=d.department_id) from employees e order by departments;
ERROR 1054 (42S22): Unknown column 'departments' in 'order clause'
mysql> select * from departments;
+---------------+----------------------+------------+-------------+
| department_id | department_name      | manager_id | location_id |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |       NULL |        1700 |
|           130 | Corporate Tax        |       NULL |        1700 |
|           140 | Control And Credit   |       NULL |        1700 |
|           150 | Shareholder Services |       NULL |        1700 |
|           160 | Benefits             |       NULL |        1700 |
|           170 | Manufacturing        |       NULL |        1700 |
|           180 | Construction         |       NULL |        1700 |
|           190 | Contracting          |       NULL |        1700 |
|           200 | Operations           |       NULL |        1700 |
|           210 | IT Support           |       NULL |        1700 |
|           220 | NOC                  |       NULL |        1700 |
|           230 | IT Helpdesk          |       NULL |        1700 |
|           240 | Government Sales     |       NULL |        1700 |
|           250 | Retail Sales         |       NULL |        1700 |
|           260 | Recruiting           |       NULL |        1700 |
|           270 | Payroll              |       NULL |        1700 |
+---------------+----------------------+------------+-------------+
27 rows in set (0.00 sec)

mysql> select employee_id,last_name,(select department_name from departments d where e.departments=d.departments) from employees e order by departments;
ERROR 1054 (42S22): Unknown column 'e.departments' in 'where clause'
mysql> select employee_id,last_name,(select department_name from departments d where e.department_id=d.department_id)  departments from employees e order by departments;
+-------------+-------------+------------------+
| employee_id | last_name   | departments      |
+-------------+-------------+------------------+
|         178 | Grant       | NULL             |
|         205 | Higgins     | Accounting       |
|         206 | Gietz       | Accounting       |
|         200 | Whalen      | Administration   |
|         100 | King        | Executive        |
|         101 | Kochhar     | Executive        |
|         102 | De Haan     | Executive        |
|         113 | Popp        | Finance          |
|         108 | Greenberg   | Finance          |
|         109 | Faviet      | Finance          |
|         110 | Chen        | Finance          |
|         111 | Sciarra     | Finance          |
|         112 | Urman       | Finance          |
|         203 | Mavris      | Human Resources  |
|         105 | Austin      | IT               |
|         106 | Pataballa   | IT               |
|         107 | Lorentz     | IT               |
|         103 | Hunold      | IT               |
|         104 | Ernst       | IT               |
|         201 | Hartstein   | Marketing        |
|         202 | Fay         | Marketing        |
|         204 | Baer        | Public Relations |
|         114 | Raphaely    | Purchasing       |
|         115 | Khoo        | Purchasing       |
|         116 | Baida       | Purchasing       |
|         117 | Tobias      | Purchasing       |
|         118 | Himuro      | Purchasing       |
|         119 | Colmenares  | Purchasing       |
|         145 | Russell     | Sales            |
|         153 | Olsen       | Sales            |
|         161 | Sewall      | Sales            |
|         169 | Bloom       | Sales            |
|         177 | Livingston  | Sales            |
|         146 | Partners    | Sales            |
|         154 | Cambrault   | Sales            |
|         162 | Vishney     | Sales            |
|         170 | Fox         | Sales            |
|         147 | Errazuriz   | Sales            |
|         155 | Tuvault     | Sales            |
|         163 | Greene      | Sales            |
|         171 | Smith       | Sales            |
|         179 | Johnson     | Sales            |
|         148 | Cambrault   | Sales            |
|         156 | King        | Sales            |
|         164 | Marvins     | Sales            |
|         172 | Bates       | Sales            |
|         149 | Zlotkey     | Sales            |
|         157 | Sully       | Sales            |
|         165 | Lee         | Sales            |
|         173 | Kumar       | Sales            |
|         150 | Tucker      | Sales            |
|         158 | McEwen      | Sales            |
|         166 | Ande        | Sales            |
|         174 | Abel        | Sales            |
|         151 | Bernstein   | Sales            |
|         159 | Smith       | Sales            |
|         167 | Banda       | Sales            |
|         175 | Hutton      | Sales            |
|         152 | Hall        | Sales            |
|         160 | Doran       | Sales            |
|         168 | Ozer        | Sales            |
|         176 | Taylor      | Sales            |
|         121 | Fripp       | Shipping         |
|         129 | Bissot      | Shipping         |
|         137 | Ladwig      | Shipping         |
|         185 | Bull        | Shipping         |
|         193 | Everett     | Shipping         |
|         122 | Kaufling    | Shipping         |
|         130 | Atkinson    | Shipping         |
|         138 | Stiles      | Shipping         |
|         186 | Dellinger   | Shipping         |
|         194 | McCain      | Shipping         |
|         123 | Vollman     | Shipping         |
|         131 | Marlow      | Shipping         |
|         139 | Seo         | Shipping         |
|         187 | Cabrio      | Shipping         |
|         195 | Jones       | Shipping         |
|         124 | Mourgos     | Shipping         |
|         132 | Olson       | Shipping         |
|         140 | Patel       | Shipping         |
|         180 | Taylor      | Shipping         |
|         188 | Chung       | Shipping         |
|         196 | Walsh       | Shipping         |
|         125 | Nayer       | Shipping         |
|         133 | Mallin      | Shipping         |
|         141 | Rajs        | Shipping         |
|         181 | Fleaur      | Shipping         |
|         189 | Dilly       | Shipping         |
|         197 | Feeney      | Shipping         |
|         126 | Mikkilineni | Shipping         |
|         134 | Rogers      | Shipping         |
|         142 | Davies      | Shipping         |
|         182 | Sullivan    | Shipping         |
|         190 | Gates       | Shipping         |
|         198 | OConnell    | Shipping         |
|         127 | Landry      | Shipping         |
|         135 | Gee         | Shipping         |
|         143 | Matos       | Shipping         |
|         183 | Geoni       | Shipping         |
|         191 | Perkins     | Shipping         |
|         199 | Grant       | Shipping         |
|         120 | Weiss       | Shipping         |
|         128 | Markle      | Shipping         |
|         136 | Philtanker  | Shipping         |
|         144 | Vargas      | Shipping         |
|         184 | Sarchand    | Shipping         |
|         192 | Bell        | Shipping         |
+-------------+-------------+------------------+
107 rows in set (0.00 sec)

mysql> select employee_id,last_name,(select department_name from departments d where e.department_id=d.department_id)  departments from employees e ;
+-------------+-------------+------------------+
| employee_id | last_name   | departments      |
+-------------+-------------+------------------+
|         100 | King        | Executive        |
|         101 | Kochhar     | Executive        |
|         102 | De Haan     | Executive        |
|         103 | Hunold      | IT               |
|         104 | Ernst       | IT               |
|         105 | Austin      | IT               |
|         106 | Pataballa   | IT               |
|         107 | Lorentz     | IT               |
|         108 | Greenberg   | Finance          |
|         109 | Faviet      | Finance          |
|         110 | Chen        | Finance          |
|         111 | Sciarra     | Finance          |
|         112 | Urman       | Finance          |
|         113 | Popp        | Finance          |
|         114 | Raphaely    | Purchasing       |
|         115 | Khoo        | Purchasing       |
|         116 | Baida       | Purchasing       |
|         117 | Tobias      | Purchasing       |
|         118 | Himuro      | Purchasing       |
|         119 | Colmenares  | Purchasing       |
|         120 | Weiss       | Shipping         |
|         121 | Fripp       | Shipping         |
|         122 | Kaufling    | Shipping         |
|         123 | Vollman     | Shipping         |
|         124 | Mourgos     | Shipping         |
|         125 | Nayer       | Shipping         |
|         126 | Mikkilineni | Shipping         |
|         127 | Landry      | Shipping         |
|         128 | Markle      | Shipping         |
|         129 | Bissot      | Shipping         |
|         130 | Atkinson    | Shipping         |
|         131 | Marlow      | Shipping         |
|         132 | Olson       | Shipping         |
|         133 | Mallin      | Shipping         |
|         134 | Rogers      | Shipping         |
|         135 | Gee         | Shipping         |
|         136 | Philtanker  | Shipping         |
|         137 | Ladwig      | Shipping         |
|         138 | Stiles      | Shipping         |
|         139 | Seo         | Shipping         |
|         140 | Patel       | Shipping         |
|         141 | Rajs        | Shipping         |
|         142 | Davies      | Shipping         |
|         143 | Matos       | Shipping         |
|         144 | Vargas      | Shipping         |
|         145 | Russell     | Sales            |
|         146 | Partners    | Sales            |
|         147 | Errazuriz   | Sales            |
|         148 | Cambrault   | Sales            |
|         149 | Zlotkey     | Sales            |
|         150 | Tucker      | Sales            |
|         151 | Bernstein   | Sales            |
|         152 | Hall        | Sales            |
|         153 | Olsen       | Sales            |
|         154 | Cambrault   | Sales            |
|         155 | Tuvault     | Sales            |
|         156 | King        | Sales            |
|         157 | Sully       | Sales            |
|         158 | McEwen      | Sales            |
|         159 | Smith       | Sales            |
|         160 | Doran       | Sales            |
|         161 | Sewall      | Sales            |
|         162 | Vishney     | Sales            |
|         163 | Greene      | Sales            |
|         164 | Marvins     | Sales            |
|         165 | Lee         | Sales            |
|         166 | Ande        | Sales            |
|         167 | Banda       | Sales            |
|         168 | Ozer        | Sales            |
|         169 | Bloom       | Sales            |
|         170 | Fox         | Sales            |
|         171 | Smith       | Sales            |
|         172 | Bates       | Sales            |
|         173 | Kumar       | Sales            |
|         174 | Abel        | Sales            |
|         175 | Hutton      | Sales            |
|         176 | Taylor      | Sales            |
|         177 | Livingston  | Sales            |
|         178 | Grant       | NULL             |
|         179 | Johnson     | Sales            |
|         180 | Taylor      | Shipping         |
|         181 | Fleaur      | Shipping         |
|         182 | Sullivan    | Shipping         |
|         183 | Geoni       | Shipping         |
|         184 | Sarchand    | Shipping         |
|         185 | Bull        | Shipping         |
|         186 | Dellinger   | Shipping         |
|         187 | Cabrio      | Shipping         |
|         188 | Chung       | Shipping         |
|         189 | Dilly       | Shipping         |
|         190 | Gates       | Shipping         |
|         191 | Perkins     | Shipping         |
|         192 | Bell        | Shipping         |
|         193 | Everett     | Shipping         |
|         194 | McCain      | Shipping         |
|         195 | Jones       | Shipping         |
|         196 | Walsh       | Shipping         |
|         197 | Feeney      | Shipping         |
|         198 | OConnell    | Shipping         |
|         199 | Grant       | Shipping         |
|         200 | Whalen      | Administration   |
|         201 | Hartstein   | Marketing        |
|         202 | Fay         | Marketing        |
|         203 | Mavris      | Human Resources  |
|         204 | Baer        | Public Relations |
|         205 | Higgins     | Accounting       |
|         206 | Gietz       | Accounting       |
+-------------+-------------+------------------+
107 rows in set (0.00 sec)

mysql> create view view_offices as select first_name,last_namehire_date from employees;
ERROR 1054 (42S22): Unknown column 'last_namehire_date' in 'field list'
mysql> create view view_offices as select first_name,last_name,hire_date from employees;
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+------------------+
| Tables_in_hr     |
+------------------+
| countries        |
| departments      |
| e                |
| emp              |
| emp_details_view |
| employees        |
| job_history      |
| jobs             |
| locations        |
| regions          |
| view_offices     |
+------------------+
11 rows in set (0.00 sec)

mysql> select * from view_offices;
+-------------+-------------+------------+
| first_name  | last_name   | hire_date  |
+-------------+-------------+------------+
| Steven      | King        | 1987-06-17 |
| Neena       | Kochhar     | 1989-09-21 |
| Lex         | De Haan     | 1993-01-13 |
| Alexander   | Hunold      | 1990-01-03 |
| Bruce       | Ernst       | 1991-05-21 |
| David       | Austin      | 1997-06-25 |
| Valli       | Pataballa   | 1998-02-05 |
| Diana       | Lorentz     | 1999-02-07 |
| Nancy       | Greenberg   | 1994-08-17 |
| Daniel      | Faviet      | 1994-08-16 |
| John        | Chen        | 1997-09-28 |
| Ismael      | Sciarra     | 1997-09-30 |
| Jose Manuel | Urman       | 1998-03-07 |
| Luis        | Popp        | 1999-12-07 |
| Den         | Raphaely    | 1994-12-07 |
| Alexander   | Khoo        | 1995-05-18 |
| Shelli      | Baida       | 1997-12-24 |
| Sigal       | Tobias      | 1997-07-24 |
| Guy         | Himuro      | 1998-11-15 |
| Karen       | Colmenares  | 1999-08-10 |
| Matthew     | Weiss       | 1996-07-18 |
| Adam        | Fripp       | 1997-04-10 |
| Payam       | Kaufling    | 1995-05-01 |
| Shanta      | Vollman     | 1997-10-10 |
| Kevin       | Mourgos     | 1999-11-16 |
| Julia       | Nayer       | 1997-07-16 |
| Irene       | Mikkilineni | 1998-09-28 |
| James       | Landry      | 1999-01-14 |
| Steven      | Markle      | 2000-03-08 |
| Laura       | Bissot      | 1997-08-20 |
| Mozhe       | Atkinson    | 1997-10-30 |
| James       | Marlow      | 1997-02-16 |
| TJ          | Olson       | 1999-04-10 |
| Jason       | Mallin      | 1996-06-14 |
| Michael     | Rogers      | 1998-08-26 |
| Ki          | Gee         | 1999-12-12 |
| Hazel       | Philtanker  | 2000-02-06 |
| Renske      | Ladwig      | 1995-07-14 |
| Stephen     | Stiles      | 1997-10-26 |
| John        | Seo         | 1998-02-12 |
| Joshua      | Patel       | 1998-04-06 |
| Trenna      | Rajs        | 1995-10-17 |
| Curtis      | Davies      | 1997-01-29 |
| Randall     | Matos       | 1998-03-15 |
| Peter       | Vargas      | 1998-07-09 |
| John        | Russell     | 1996-10-01 |
| Karen       | Partners    | 1997-01-05 |
| Alberto     | Errazuriz   | 1997-03-10 |
| Gerald      | Cambrault   | 1999-10-15 |
| Eleni       | Zlotkey     | 2000-01-29 |
| Peter       | Tucker      | 1997-01-30 |
| David       | Bernstein   | 1997-03-24 |
| Peter       | Hall        | 1997-08-20 |
| Christopher | Olsen       | 1998-03-30 |
| Nanette     | Cambrault   | 1998-12-09 |
| Oliver      | Tuvault     | 1999-11-23 |
| Janette     | King        | 1996-01-30 |
| Patrick     | Sully       | 1996-03-04 |
| Allan       | McEwen      | 1996-08-01 |
| Lindsey     | Smith       | 1997-03-10 |
| Louise      | Doran       | 1997-12-15 |
| Sarath      | Sewall      | 1998-11-03 |
| Clara       | Vishney     | 1997-11-11 |
| Danielle    | Greene      | 1999-03-19 |
| Mattea      | Marvins     | 2000-01-24 |
| David       | Lee         | 2000-02-23 |
| Sundar      | Ande        | 2000-03-24 |
| Amit        | Banda       | 2000-04-21 |
| Lisa        | Ozer        | 1997-03-11 |
| Harrison    | Bloom       | 1998-03-23 |
| Tayler      | Fox         | 1998-01-24 |
| William     | Smith       | 1999-02-23 |
| Elizabeth   | Bates       | 1999-03-24 |
| Sundita     | Kumar       | 2000-04-21 |
| Ellen       | Abel        | 1996-05-11 |
| Alyssa      | Hutton      | 1997-03-19 |
| Jonathon    | Taylor      | 1998-03-24 |
| Jack        | Livingston  | 1998-04-23 |
| Kimberely   | Grant       | 1999-05-24 |
| Charles     | Johnson     | 2000-01-04 |
| Winston     | Taylor      | 1998-01-24 |
| Jean        | Fleaur      | 1998-02-23 |
| Martha      | Sullivan    | 1999-06-21 |
| Girard      | Geoni       | 2000-02-03 |
| Nandita     | Sarchand    | 1996-01-27 |
| Alexis      | Bull        | 1997-02-20 |
| Julia       | Dellinger   | 1998-06-24 |
| Anthony     | Cabrio      | 1999-02-07 |
| Kelly       | Chung       | 1997-06-14 |
| Jennifer    | Dilly       | 1997-08-13 |
| Timothy     | Gates       | 1998-07-11 |
| Randall     | Perkins     | 1999-12-19 |
| Sarah       | Bell        | 1996-02-04 |
| Britney     | Everett     | 1997-03-03 |
| Samuel      | McCain      | 1998-07-01 |
| Vance       | Jones       | 1999-03-17 |
| Alana       | Walsh       | 1998-04-24 |
| Kevin       | Feeney      | 1998-05-23 |
| Donald      | OConnell    | 1999-06-21 |
| Douglas     | Grant       | 2000-01-13 |
| Jennifer    | Whalen      | 1987-09-17 |
| Michael     | Hartstein   | 1996-02-17 |
| Pat         | Fay         | 1997-08-17 |
| Susan       | Mavris      | 1994-06-07 |
| Hermann     | Baer        | 1994-06-07 |
| Shelley     | Higgins     | 1994-06-07 |
| William     | Gietz       | 1994-06-07 |
+-------------+-------------+------------+
107 rows in set (0.00 sec)

mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee e equi join departments d where e.department_no=d.department-no;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'equi join departments d where e.department_no=d.department-no' at line 1
mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee e equi join departments d where e.department_no=d.department_no;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'equi join departments d where e.department_no=d.department_no' at line 1
mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee e equi join departments d where e.department_no=d.department_no;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'equi join departments d where e.department_no=d.department_no' at line 1
mysql> select * form departments;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form departments' at line 1
mysql> select * form departments;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form departments' at line 1
mysql> use hr;
Database changed
mysql> select * from departments;
+---------------+----------------------+------------+-------------+
| department_id | department_name      | manager_id | location_id |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |       NULL |        1700 |
|           130 | Corporate Tax        |       NULL |        1700 |
|           140 | Control And Credit   |       NULL |        1700 |
|           150 | Shareholder Services |       NULL |        1700 |
|           160 | Benefits             |       NULL |        1700 |
|           170 | Manufacturing        |       NULL |        1700 |
|           180 | Construction         |       NULL |        1700 |
|           190 | Contracting          |       NULL |        1700 |
|           200 | Operations           |       NULL |        1700 |
|           210 | IT Support           |       NULL |        1700 |
|           220 | NOC                  |       NULL |        1700 |
|           230 | IT Helpdesk          |       NULL |        1700 |
|           240 | Government Sales     |       NULL |        1700 |
|           250 | Retail Sales         |       NULL |        1700 |
|           260 | Recruiting           |       NULL |        1700 |
|           270 | Payroll              |       NULL |        1700 |
+---------------+----------------------+------------+-------------+
27 rows in set (0.00 sec)

mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee e equi join departments d where e.department_id=d.department_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'equi join departments d where e.department_id=d.department_id' at line 1
mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee , departments d where e.department_id=d.department_id;
ERROR 1146 (42S02): Table 'hr.employee' doesn't exist
mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employees e , departments d where e.department_id=d.department_id;
Query OK, 0 rows affected (0.02 sec)

mysql> select * from view_offices_employee;
+-------------+-------------+-------------+
| last_name   | first_name  | location_id |
+-------------+-------------+-------------+
| Hunold      | Alexander   |        1400 |
| Ernst       | Bruce       |        1400 |
| Austin      | David       |        1400 |
| Pataballa   | Valli       |        1400 |
| Lorentz     | Diana       |        1400 |
| Weiss       | Matthew     |        1500 |
| Fripp       | Adam        |        1500 |
| Kaufling    | Payam       |        1500 |
| Vollman     | Shanta      |        1500 |
| Mourgos     | Kevin       |        1500 |
| Nayer       | Julia       |        1500 |
| Mikkilineni | Irene       |        1500 |
| Landry      | James       |        1500 |
| Markle      | Steven      |        1500 |
| Bissot      | Laura       |        1500 |
| Atkinson    | Mozhe       |        1500 |
| Marlow      | James       |        1500 |
| Olson       | TJ          |        1500 |
| Mallin      | Jason       |        1500 |
| Rogers      | Michael     |        1500 |
| Gee         | Ki          |        1500 |
| Philtanker  | Hazel       |        1500 |
| Ladwig      | Renske      |        1500 |
| Stiles      | Stephen     |        1500 |
| Seo         | John        |        1500 |
| Patel       | Joshua      |        1500 |
| Rajs        | Trenna      |        1500 |
| Davies      | Curtis      |        1500 |
| Matos       | Randall     |        1500 |
| Vargas      | Peter       |        1500 |
| Taylor      | Winston     |        1500 |
| Fleaur      | Jean        |        1500 |
| Sullivan    | Martha      |        1500 |
| Geoni       | Girard      |        1500 |
| Sarchand    | Nandita     |        1500 |
| Bull        | Alexis      |        1500 |
| Dellinger   | Julia       |        1500 |
| Cabrio      | Anthony     |        1500 |
| Chung       | Kelly       |        1500 |
| Dilly       | Jennifer    |        1500 |
| Gates       | Timothy     |        1500 |
| Perkins     | Randall     |        1500 |
| Bell        | Sarah       |        1500 |
| Everett     | Britney     |        1500 |
| McCain      | Samuel      |        1500 |
| Jones       | Vance       |        1500 |
| Walsh       | Alana       |        1500 |
| Feeney      | Kevin       |        1500 |
| OConnell    | Donald      |        1500 |
| Grant       | Douglas     |        1500 |
| Whalen      | Jennifer    |        1700 |
| Raphaely    | Den         |        1700 |
| Khoo        | Alexander   |        1700 |
| Baida       | Shelli      |        1700 |
| Tobias      | Sigal       |        1700 |
| Himuro      | Guy         |        1700 |
| Colmenares  | Karen       |        1700 |
| King        | Steven      |        1700 |
| Kochhar     | Neena       |        1700 |
| De Haan     | Lex         |        1700 |
| Greenberg   | Nancy       |        1700 |
| Faviet      | Daniel      |        1700 |
| Chen        | John        |        1700 |
| Sciarra     | Ismael      |        1700 |
| Urman       | Jose Manuel |        1700 |
| Popp        | Luis        |        1700 |
| Higgins     | Shelley     |        1700 |
| Gietz       | William     |        1700 |
| Hartstein   | Michael     |        1800 |
| Fay         | Pat         |        1800 |
| Mavris      | Susan       |        2400 |
| Russell     | John        |        2500 |
| Partners    | Karen       |        2500 |
| Errazuriz   | Alberto     |        2500 |
| Cambrault   | Gerald      |        2500 |
| Zlotkey     | Eleni       |        2500 |
| Tucker      | Peter       |        2500 |
| Bernstein   | David       |        2500 |
| Hall        | Peter       |        2500 |
| Olsen       | Christopher |        2500 |
| Cambrault   | Nanette     |        2500 |
| Tuvault     | Oliver      |        2500 |
| King        | Janette     |        2500 |
| Sully       | Patrick     |        2500 |
| McEwen      | Allan       |        2500 |
| Smith       | Lindsey     |        2500 |
| Doran       | Louise      |        2500 |
| Sewall      | Sarath      |        2500 |
| Vishney     | Clara       |        2500 |
| Greene      | Danielle    |        2500 |
| Marvins     | Mattea      |        2500 |
| Lee         | David       |        2500 |
| Ande        | Sundar      |        2500 |
| Banda       | Amit        |        2500 |
| Ozer        | Lisa        |        2500 |
| Bloom       | Harrison    |        2500 |
| Fox         | Tayler      |        2500 |
| Smith       | William     |        2500 |
| Bates       | Elizabeth   |        2500 |
| Kumar       | Sundita     |        2500 |
| Abel        | Ellen       |        2500 |
| Hutton      | Alyssa      |        2500 |
| Taylor      | Jonathon    |        2500 |
| Livingston  | Jack        |        2500 |
| Johnson     | Charles     |        2500 |
| Baer        | Hermann     |        2700 |
+-------------+-------------+-------------+
106 rows in set (0.00 sec)

mysql> create view view_emp_details e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employees e1 where e.employee_id=e1.manager_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employ' at line 1
mysql> create view view_emp_details e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employees e1 where e.employee_id=e1.manager_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employ' at line 1
mysql> create view view_emp_details as select e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employees e1 where e.employee_id=e1.manager_id;
ERROR 1060 (42S21): Duplicate column name 'first_name'
mysql> create view view_emp_details as select e.first_name,e.last_name,e1.first_name as name,e1.last_name  as name1 from employees e join employees e1 where e.employee_id=e1.manager_id;
Query OK, 0 rows affected (0.01 sec)

mysql> select  * from employees;
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
| employee_id | first_name  | last_name   | email    | phone_number       | hire_date  | job_id     | salary   | commission_pct | manager_id | department_id |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
|         100 | Steven      | King        | SKING    | 515.123.4567       | 1987-06-17 | AD_PRES    | 24000.00 |           NULL |       NULL |            90 |
|         101 | Neena       | Kochhar     | NKOCHHAR | 515.123.4568       | 1989-09-21 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         102 | Lex         | De Haan     | LDEHAAN  | 515.123.4569       | 1993-01-13 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         103 | Alexander   | Hunold      | AHUNOLD  | 590.423.4567       | 1990-01-03 | IT_PROG    |  9000.00 |           NULL |        102 |            60 |
|         104 | Bruce       | Ernst       | BERNST   | 590.423.4568       | 1991-05-21 | IT_PROG    |  6000.00 |           NULL |        103 |            60 |
|         105 | David       | Austin      | DAUSTIN  | 590.423.4569       | 1997-06-25 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         106 | Valli       | Pataballa   | VPATABAL | 590.423.4560       | 1998-02-05 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         107 | Diana       | Lorentz     | DLORENTZ | 590.423.5567       | 1999-02-07 | IT_PROG    |  4200.00 |           NULL |        103 |            60 |
|         108 | Nancy       | Greenberg   | NGREENBE | 515.124.4569       | 1994-08-17 | FI_MGR     | 12000.00 |           NULL |        101 |           100 |
|         109 | Daniel      | Faviet      | DFAVIET  | 515.124.4169       | 1994-08-16 | FI_ACCOUNT |  9000.00 |           NULL |        108 |           100 |
|         110 | John        | Chen        | JCHEN    | 515.124.4269       | 1997-09-28 | FI_ACCOUNT |  8200.00 |           NULL |        108 |           100 |
|         111 | Ismael      | Sciarra     | ISCIARRA | 515.124.4369       | 1997-09-30 | FI_ACCOUNT |  7700.00 |           NULL |        108 |           100 |
|         112 | Jose Manuel | Urman       | JMURMAN  | 515.124.4469       | 1998-03-07 | FI_ACCOUNT |  7800.00 |           NULL |        108 |           100 |
|         113 | Luis        | Popp        | LPOPP    | 515.124.4567       | 1999-12-07 | FI_ACCOUNT |  6900.00 |           NULL |        108 |           100 |
|         114 | Den         | Raphaely    | DRAPHEAL | 515.127.4561       | 1994-12-07 | PU_MAN     | 11000.00 |           NULL |        100 |            30 |
|         115 | Alexander   | Khoo        | AKHOO    | 515.127.4562       | 1995-05-18 | PU_CLERK   |  3100.00 |           NULL |        114 |            30 |
|         116 | Shelli      | Baida       | SBAIDA   | 515.127.4563       | 1997-12-24 | PU_CLERK   |  2900.00 |           NULL |        114 |            30 |
|         117 | Sigal       | Tobias      | STOBIAS  | 515.127.4564       | 1997-07-24 | PU_CLERK   |  2800.00 |           NULL |        114 |            30 |
|         118 | Guy         | Himuro      | GHIMURO  | 515.127.4565       | 1998-11-15 | PU_CLERK   |  2600.00 |           NULL |        114 |            30 |
|         119 | Karen       | Colmenares  | KCOLMENA | 515.127.4566       | 1999-08-10 | PU_CLERK   |  2500.00 |           NULL |        114 |            30 |
|         120 | Matthew     | Weiss       | MWEISS   | 650.123.1234       | 1996-07-18 | ST_MAN     |  8000.00 |           NULL |        100 |            50 |
|         121 | Adam        | Fripp       | AFRIPP   | 650.123.2234       | 1997-04-10 | ST_MAN     |  8200.00 |           NULL |        100 |            50 |
|         122 | Payam       | Kaufling    | PKAUFLIN | 650.123.3234       | 1995-05-01 | ST_MAN     |  7900.00 |           NULL |        100 |            50 |
|         123 | Shanta      | Vollman     | SVOLLMAN | 650.123.4234       | 1997-10-10 | ST_MAN     |  6500.00 |           NULL |        100 |            50 |
|         124 | Kevin       | Mourgos     | KMOURGOS | 650.123.5234       | 1999-11-16 | ST_MAN     |  5800.00 |           NULL |        100 |            50 |
|         125 | Julia       | Nayer       | JNAYER   | 650.124.1214       | 1997-07-16 | ST_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         126 | Irene       | Mikkilineni | IMIKKILI | 650.124.1224       | 1998-09-28 | ST_CLERK   |  2700.00 |           NULL |        120 |            50 |
|         127 | James       | Landry      | JLANDRY  | 650.124.1334       | 1999-01-14 | ST_CLERK   |  2400.00 |           NULL |        120 |            50 |
|         128 | Steven      | Markle      | SMARKLE  | 650.124.1434       | 2000-03-08 | ST_CLERK   |  2200.00 |           NULL |        120 |            50 |
|         129 | Laura       | Bissot      | LBISSOT  | 650.124.5234       | 1997-08-20 | ST_CLERK   |  3300.00 |           NULL |        121 |            50 |
|         130 | Mozhe       | Atkinson    | MATKINSO | 650.124.6234       | 1997-10-30 | ST_CLERK   |  2800.00 |           NULL |        121 |            50 |
|         131 | James       | Marlow      | JAMRLOW  | 650.124.7234       | 1997-02-16 | ST_CLERK   |  2500.00 |           NULL |        121 |            50 |
|         132 | TJ          | Olson       | TJOLSON  | 650.124.8234       | 1999-04-10 | ST_CLERK   |  2100.00 |           NULL |        121 |            50 |
|         133 | Jason       | Mallin      | JMALLIN  | 650.127.1934       | 1996-06-14 | ST_CLERK   |  3300.00 |           NULL |        122 |            50 |
|         134 | Michael     | Rogers      | MROGERS  | 650.127.1834       | 1998-08-26 | ST_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         135 | Ki          | Gee         | KGEE     | 650.127.1734       | 1999-12-12 | ST_CLERK   |  2400.00 |           NULL |        122 |            50 |
|         136 | Hazel       | Philtanker  | HPHILTAN | 650.127.1634       | 2000-02-06 | ST_CLERK   |  2200.00 |           NULL |        122 |            50 |
|         137 | Renske      | Ladwig      | RLADWIG  | 650.121.1234       | 1995-07-14 | ST_CLERK   |  3600.00 |           NULL |        123 |            50 |
|         138 | Stephen     | Stiles      | SSTILES  | 650.121.2034       | 1997-10-26 | ST_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         139 | John        | Seo         | JSEO     | 650.121.2019       | 1998-02-12 | ST_CLERK   |  2700.00 |           NULL |        123 |            50 |
|         140 | Joshua      | Patel       | JPATEL   | 650.121.1834       | 1998-04-06 | ST_CLERK   |  2500.00 |           NULL |        123 |            50 |
|         141 | Trenna      | Rajs        | TRAJS    | 650.121.8009       | 1995-10-17 | ST_CLERK   |  3500.00 |           NULL |        124 |            50 |
|         142 | Curtis      | Davies      | CDAVIES  | 650.121.2994       | 1997-01-29 | ST_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         143 | Randall     | Matos       | RMATOS   | 650.121.2874       | 1998-03-15 | ST_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         144 | Peter       | Vargas      | PVARGAS  | 650.121.2004       | 1998-07-09 | ST_CLERK   |  2500.00 |           NULL |        124 |            50 |
|         145 | John        | Russell     | JRUSSEL  | 011.44.1344.429268 | 1996-10-01 | SA_MAN     | 14000.00 |           0.40 |        100 |            80 |
|         146 | Karen       | Partners    | KPARTNER | 011.44.1344.467268 | 1997-01-05 | SA_MAN     | 13500.00 |           0.30 |        100 |            80 |
|         147 | Alberto     | Errazuriz   | AERRAZUR | 011.44.1344.429278 | 1997-03-10 | SA_MAN     | 12000.00 |           0.30 |        100 |            80 |
|         148 | Gerald      | Cambrault   | GCAMBRAU | 011.44.1344.619268 | 1999-10-15 | SA_MAN     | 11000.00 |           0.30 |        100 |            80 |
|         149 | Eleni       | Zlotkey     | EZLOTKEY | 011.44.1344.429018 | 2000-01-29 | SA_MAN     | 10500.00 |           0.20 |        100 |            80 |
|         150 | Peter       | Tucker      | PTUCKER  | 011.44.1344.129268 | 1997-01-30 | SA_REP     | 10000.00 |           0.30 |        145 |            80 |
|         151 | David       | Bernstein   | DBERNSTE | 011.44.1344.345268 | 1997-03-24 | SA_REP     |  9500.00 |           0.25 |        145 |            80 |
|         152 | Peter       | Hall        | PHALL    | 011.44.1344.478968 | 1997-08-20 | SA_REP     |  9000.00 |           0.25 |        145 |            80 |
|         153 | Christopher | Olsen       | COLSEN   | 011.44.1344.498718 | 1998-03-30 | SA_REP     |  8000.00 |           0.20 |        145 |            80 |
|         154 | Nanette     | Cambrault   | NCAMBRAU | 011.44.1344.987668 | 1998-12-09 | SA_REP     |  7500.00 |           0.20 |        145 |            80 |
|         155 | Oliver      | Tuvault     | OTUVAULT | 011.44.1344.486508 | 1999-11-23 | SA_REP     |  7000.00 |           0.15 |        145 |            80 |
|         156 | Janette     | King        | JKING    | 011.44.1345.429268 | 1996-01-30 | SA_REP     | 10000.00 |           0.35 |        146 |            80 |
|         157 | Patrick     | Sully       | PSULLY   | 011.44.1345.929268 | 1996-03-04 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         158 | Allan       | McEwen      | AMCEWEN  | 011.44.1345.829268 | 1996-08-01 | SA_REP     |  9000.00 |           0.35 |        146 |            80 |
|         159 | Lindsey     | Smith       | LSMITH   | 011.44.1345.729268 | 1997-03-10 | SA_REP     |  8000.00 |           0.30 |        146 |            80 |
|         160 | Louise      | Doran       | LDORAN   | 011.44.1345.629268 | 1997-12-15 | SA_REP     |  7500.00 |           0.30 |        146 |            80 |
|         161 | Sarath      | Sewall      | SSEWALL  | 011.44.1345.529268 | 1998-11-03 | SA_REP     |  7000.00 |           0.25 |        146 |            80 |
|         162 | Clara       | Vishney     | CVISHNEY | 011.44.1346.129268 | 1997-11-11 | SA_REP     | 10500.00 |           0.25 |        147 |            80 |
|         163 | Danielle    | Greene      | DGREENE  | 011.44.1346.229268 | 1999-03-19 | SA_REP     |  9500.00 |           0.15 |        147 |            80 |
|         164 | Mattea      | Marvins     | MMARVINS | 011.44.1346.329268 | 2000-01-24 | SA_REP     |  7200.00 |           0.10 |        147 |            80 |
|         165 | David       | Lee         | DLEE     | 011.44.1346.529268 | 2000-02-23 | SA_REP     |  6800.00 |           0.10 |        147 |            80 |
|         166 | Sundar      | Ande        | SANDE    | 011.44.1346.629268 | 2000-03-24 | SA_REP     |  6400.00 |           0.10 |        147 |            80 |
|         167 | Amit        | Banda       | ABANDA   | 011.44.1346.729268 | 2000-04-21 | SA_REP     |  6200.00 |           0.10 |        147 |            80 |
|         168 | Lisa        | Ozer        | LOZER    | 011.44.1343.929268 | 1997-03-11 | SA_REP     | 11500.00 |           0.25 |        148 |            80 |
|         169 | Harrison    | Bloom       | HBLOOM   | 011.44.1343.829268 | 1998-03-23 | SA_REP     | 10000.00 |           0.20 |        148 |            80 |
|         170 | Tayler      | Fox         | TFOX     | 011.44.1343.729268 | 1998-01-24 | SA_REP     |  9600.00 |           0.20 |        148 |            80 |
|         171 | William     | Smith       | WSMITH   | 011.44.1343.629268 | 1999-02-23 | SA_REP     |  7400.00 |           0.15 |        148 |            80 |
|         172 | Elizabeth   | Bates       | EBATES   | 011.44.1343.529268 | 1999-03-24 | SA_REP     |  7300.00 |           0.15 |        148 |            80 |
|         173 | Sundita     | Kumar       | SKUMAR   | 011.44.1343.329268 | 2000-04-21 | SA_REP     |  6100.00 |           0.10 |        148 |            80 |
|         174 | Ellen       | Abel        | EABEL    | 011.44.1644.429267 | 1996-05-11 | SA_REP     | 11000.00 |           0.30 |        149 |            80 |
|         175 | Alyssa      | Hutton      | AHUTTON  | 011.44.1644.429266 | 1997-03-19 | SA_REP     |  8800.00 |           0.25 |        149 |            80 |
|         176 | Jonathon    | Taylor      | JTAYLOR  | 011.44.1644.429265 | 1998-03-24 | SA_REP     |  8600.00 |           0.20 |        149 |            80 |
|         177 | Jack        | Livingston  | JLIVINGS | 011.44.1644.429264 | 1998-04-23 | SA_REP     |  8400.00 |           0.20 |        149 |            80 |
|         178 | Kimberely   | Grant       | KGRANT   | 011.44.1644.429263 | 1999-05-24 | SA_REP     |  7000.00 |           0.15 |        149 |          NULL |
|         179 | Charles     | Johnson     | CJOHNSON | 011.44.1644.429262 | 2000-01-04 | SA_REP     |  6200.00 |           0.10 |        149 |            80 |
|         180 | Winston     | Taylor      | WTAYLOR  | 650.507.9876       | 1998-01-24 | SH_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         181 | Jean        | Fleaur      | JFLEAUR  | 650.507.9877       | 1998-02-23 | SH_CLERK   |  3100.00 |           NULL |        120 |            50 |
|         182 | Martha      | Sullivan    | MSULLIVA | 650.507.9878       | 1999-06-21 | SH_CLERK   |  2500.00 |           NULL |        120 |            50 |
|         183 | Girard      | Geoni       | GGEONI   | 650.507.9879       | 2000-02-03 | SH_CLERK   |  2800.00 |           NULL |        120 |            50 |
|         184 | Nandita     | Sarchand    | NSARCHAN | 650.509.1876       | 1996-01-27 | SH_CLERK   |  4200.00 |           NULL |        121 |            50 |
|         185 | Alexis      | Bull        | ABULL    | 650.509.2876       | 1997-02-20 | SH_CLERK   |  4100.00 |           NULL |        121 |            50 |
|         186 | Julia       | Dellinger   | JDELLING | 650.509.3876       | 1998-06-24 | SH_CLERK   |  3400.00 |           NULL |        121 |            50 |
|         187 | Anthony     | Cabrio      | ACABRIO  | 650.509.4876       | 1999-02-07 | SH_CLERK   |  3000.00 |           NULL |        121 |            50 |
|         188 | Kelly       | Chung       | KCHUNG   | 650.505.1876       | 1997-06-14 | SH_CLERK   |  3800.00 |           NULL |        122 |            50 |
|         189 | Jennifer    | Dilly       | JDILLY   | 650.505.2876       | 1997-08-13 | SH_CLERK   |  3600.00 |           NULL |        122 |            50 |
|         190 | Timothy     | Gates       | TGATES   | 650.505.3876       | 1998-07-11 | SH_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         191 | Randall     | Perkins     | RPERKINS | 650.505.4876       | 1999-12-19 | SH_CLERK   |  2500.00 |           NULL |        122 |            50 |
|         192 | Sarah       | Bell        | SBELL    | 650.501.1876       | 1996-02-04 | SH_CLERK   |  4000.00 |           NULL |        123 |            50 |
|         193 | Britney     | Everett     | BEVERETT | 650.501.2876       | 1997-03-03 | SH_CLERK   |  3900.00 |           NULL |        123 |            50 |
|         194 | Samuel      | McCain      | SMCCAIN  | 650.501.3876       | 1998-07-01 | SH_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         195 | Vance       | Jones       | VJONES   | 650.501.4876       | 1999-03-17 | SH_CLERK   |  2800.00 |           NULL |        123 |            50 |
|         196 | Alana       | Walsh       | AWALSH   | 650.507.9811       | 1998-04-24 | SH_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         197 | Kevin       | Feeney      | KFEENEY  | 650.507.9822       | 1998-05-23 | SH_CLERK   |  3000.00 |           NULL |        124 |            50 |
|         198 | Donald      | OConnell    | DOCONNEL | 650.507.9833       | 1999-06-21 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         199 | Douglas     | Grant       | DGRANT   | 650.507.9844       | 2000-01-13 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         200 | Jennifer    | Whalen      | JWHALEN  | 515.123.4444       | 1987-09-17 | AD_ASST    |  4400.00 |           NULL |        101 |            10 |
|         201 | Michael     | Hartstein   | MHARTSTE | 515.123.5555       | 1996-02-17 | MK_MAN     | 13000.00 |           NULL |        100 |            20 |
|         202 | Pat         | Fay         | PFAY     | 603.123.6666       | 1997-08-17 | MK_REP     |  6000.00 |           NULL |        201 |            20 |
|         203 | Susan       | Mavris      | SMAVRIS  | 515.123.7777       | 1994-06-07 | HR_REP     |  6500.00 |           NULL |        101 |            40 |
|         204 | Hermann     | Baer        | HBAER    | 515.123.8888       | 1994-06-07 | PR_REP     | 10000.00 |           NULL |        101 |            70 |
|         205 | Shelley     | Higgins     | SHIGGINS | 515.123.8080       | 1994-06-07 | AC_MGR     | 12000.00 |           NULL |        101 |           110 |
|         206 | William     | Gietz       | WGIETZ   | 51hr5.123.8181     | 1994-06-07 | AC_ACCOUNT |  8300.00 |           NULL |        205 |           110 |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
107 rows in set (0.00 sec)

mysql> select * from view_emp_offices;
ERROR 1146 (42S02): Table 'hr.view_emp_offices' doesn't exist
mysql> select * from view_emp_details;
+------------+-----------+-------------+-------------+
| first_name | last_name | name        | name1       |
+------------+-----------+-------------+-------------+
| Steven     | King      | Neena       | Kochhar     |
| Steven     | King      | Lex         | De Haan     |
| Lex        | De Haan   | Alexander   | Hunold      |
| Alexander  | Hunold    | Bruce       | Ernst       |
| Alexander  | Hunold    | David       | Austin      |
| Alexander  | Hunold    | Valli       | Pataballa   |
| Alexander  | Hunold    | Diana       | Lorentz     |
| Neena      | Kochhar   | Nancy       | Greenberg   |
| Nancy      | Greenberg | Daniel      | Faviet      |
| Nancy      | Greenberg | John        | Chen        |
| Nancy      | Greenberg | Ismael      | Sciarra     |
| Nancy      | Greenberg | Jose Manuel | Urman       |
| Nancy      | Greenberg | Luis        | Popp        |
| Steven     | King      | Den         | Raphaely    |
| Den        | Raphaely  | Alexander   | Khoo        |
| Den        | Raphaely  | Shelli      | Baida       |
| Den        | Raphaely  | Sigal       | Tobias      |
| Den        | Raphaely  | Guy         | Himuro      |
| Den        | Raphaely  | Karen       | Colmenares  |
| Steven     | King      | Matthew     | Weiss       |
| Steven     | King      | Adam        | Fripp       |
| Steven     | King      | Payam       | Kaufling    |
| Steven     | King      | Shanta      | Vollman     |
| Steven     | King      | Kevin       | Mourgos     |
| Matthew    | Weiss     | Julia       | Nayer       |
| Matthew    | Weiss     | Irene       | Mikkilineni |
| Matthew    | Weiss     | James       | Landry      |
| Matthew    | Weiss     | Steven      | Markle      |
| Adam       | Fripp     | Laura       | Bissot      |
| Adam       | Fripp     | Mozhe       | Atkinson    |
| Adam       | Fripp     | James       | Marlow      |
| Adam       | Fripp     | TJ          | Olson       |
| Payam      | Kaufling  | Jason       | Mallin      |
| Payam      | Kaufling  | Michael     | Rogers      |
| Payam      | Kaufling  | Ki          | Gee         |
| Payam      | Kaufling  | Hazel       | Philtanker  |
| Shanta     | Vollman   | Renske      | Ladwig      |
| Shanta     | Vollman   | Stephen     | Stiles      |
| Shanta     | Vollman   | John        | Seo         |
| Shanta     | Vollman   | Joshua      | Patel       |
| Kevin      | Mourgos   | Trenna      | Rajs        |
| Kevin      | Mourgos   | Curtis      | Davies      |
| Kevin      | Mourgos   | Randall     | Matos       |
| Kevin      | Mourgos   | Peter       | Vargas      |
| Steven     | King      | John        | Russell     |
| Steven     | King      | Karen       | Partners    |
| Steven     | King      | Alberto     | Errazuriz   |
| Steven     | King      | Gerald      | Cambrault   |
| Steven     | King      | Eleni       | Zlotkey     |
| John       | Russell   | Peter       | Tucker      |
| John       | Russell   | David       | Bernstein   |
| John       | Russell   | Peter       | Hall        |
| John       | Russell   | Christopher | Olsen       |
| John       | Russell   | Nanette     | Cambrault   |
| John       | Russell   | Oliver      | Tuvault     |
| Karen      | Partners  | Janette     | King        |
| Karen      | Partners  | Patrick     | Sully       |
| Karen      | Partners  | Allan       | McEwen      |
| Karen      | Partners  | Lindsey     | Smith       |
| Karen      | Partners  | Louise      | Doran       |
| Karen      | Partners  | Sarath      | Sewall      |
| Alberto    | Errazuriz | Clara       | Vishney     |
| Alberto    | Errazuriz | Danielle    | Greene      |
| Alberto    | Errazuriz | Mattea      | Marvins     |
| Alberto    | Errazuriz | David       | Lee         |
| Alberto    | Errazuriz | Sundar      | Ande        |
| Alberto    | Errazuriz | Amit        | Banda       |
| Gerald     | Cambrault | Lisa        | Ozer        |
| Gerald     | Cambrault | Harrison    | Bloom       |
| Gerald     | Cambrault | Tayler      | Fox         |
| Gerald     | Cambrault | William     | Smith       |
| Gerald     | Cambrault | Elizabeth   | Bates       |
| Gerald     | Cambrault | Sundita     | Kumar       |
| Eleni      | Zlotkey   | Ellen       | Abel        |
| Eleni      | Zlotkey   | Alyssa      | Hutton      |
| Eleni      | Zlotkey   | Jonathon    | Taylor      |
| Eleni      | Zlotkey   | Jack        | Livingston  |
| Eleni      | Zlotkey   | Kimberely   | Grant       |
| Eleni      | Zlotkey   | Charles     | Johnson     |
| Matthew    | Weiss     | Winston     | Taylor      |
| Matthew    | Weiss     | Jean        | Fleaur      |
| Matthew    | Weiss     | Martha      | Sullivan    |
| Matthew    | Weiss     | Girard      | Geoni       |
| Adam       | Fripp     | Nandita     | Sarchand    |
| Adam       | Fripp     | Alexis      | Bull        |
| Adam       | Fripp     | Julia       | Dellinger   |
| Adam       | Fripp     | Anthony     | Cabrio      |
| Payam      | Kaufling  | Kelly       | Chung       |
| Payam      | Kaufling  | Jennifer    | Dilly       |
| Payam      | Kaufling  | Timothy     | Gates       |
| Payam      | Kaufling  | Randall     | Perkins     |
| Shanta     | Vollman   | Sarah       | Bell        |
| Shanta     | Vollman   | Britney     | Everett     |
| Shanta     | Vollman   | Samuel      | McCain      |
| Shanta     | Vollman   | Vance       | Jones       |
| Kevin      | Mourgos   | Alana       | Walsh       |
| Kevin      | Mourgos   | Kevin       | Feeney      |
| Kevin      | Mourgos   | Donald      | OConnell    |
| Kevin      | Mourgos   | Douglas     | Grant       |
| Neena      | Kochhar   | Jennifer    | Whalen      |
| Steven     | King      | Michael     | Hartstein   |
| Michael    | Hartstein | Pat         | Fay         |
| Neena      | Kochhar   | Susan       | Mavris      |
| Neena      | Kochhar   | Hermann     | Baer        |
| Neena      | Kochhar   | Shelley     | Higgins     |
| Shelley    | Higgins   | William     | Gietz       |
+------------+-----------+-------------+-------------+
106 rows in set (0.00 sec)

mysql> select * from emp;
+------+------+
| name | age  |
+------+------+
| def  |   10 |
| abc  |    2 |
+------+------+
2 rows in set (0.00 sec)

mysql> create table emp1(emp_id int primary ,name varchar(27));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',name varchar(27))' at line 1
mysql> create table emp1(emp_id int primary  key,name varchar(27));
Query OK, 0 rows affected (0.06 sec)

mysql> create index index1 on emp1(name);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+------+------+
| name | age  |
+------+------+
| def  |   10 |
| abc  |    2 |
+------+------+
2 rows in set (0.00 sec)

mysql> select * from emp1;
Empty set (0.00 sec)

mysql> show tables;
+-----------------------+
| Tables_in_hr          |
+-----------------------+
| countries             |
| departments           |
| e                     |
| emp                   |
| emp1                  |
| emp_details_view      |
| employees             |
| job_history           |
| jobs                  |
| locations             |
| regions               |
| view_emp_details      |
| view_offices          |
| view_offices_employee |
+-----------------------+
14 rows in set (0.00 sec)

mysql> desc index1;
ERROR 1146 (42S02): Table 'hr.index1' doesn't exist
mysql> use hr;
Database changed
mysql> create table emp1(emp_id int primary ,name varchar(27));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',name varchar(27))' at line 1
mysql> create table emp1(emp_id int primary key,name varchar(27));
ERROR 1050 (42S01): Table 'emp1' already exists
mysql> create table emp2(emp_id int primary key,name varchar(27));
Query OK, 0 rows affected (0.05 sec)

mysql> create index index_details on emp2(name);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc emp2;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| emp_id | int(11)     | NO   | PRI | NULL    |       |
| name   | varchar(27) | YES  | MUL | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table emp2 drop index index_details;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc emp2;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| emp_id | int(11)     | NO   | PRI | NULL    |       |
| name   | varchar(27) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create unique index index_details on emp2(name);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select 8 from course_onfo;
ERROR 1146 (42S02): Table 'hr.course_onfo' doesn't exist
mysql> select * from course_info;
ERROR 1146 (42S02): Table 'hr.course_info' doesn't exist
mysql> use subhashini;
Database changed
mysql> select * from couse_info;
ERROR 1146 (42S02): Table 'subhashini.couse_info' doesn't exist
mysql> use subha;
Database changed
mysql> select * from course_info;
ERROR 1146 (42S02): Table 'subha.course_info' doesn't exist
mysql> use subhashini;
Database changed
mysql> select * from course_info;
+-------------+-------------+--------------------+-------------------+-----------------+--------------------+-------------+----------+
| course_code | course_name | course_description | course_start_date | course_duration | no_of_participants | course_type | discount |
+-------------+-------------+--------------------+-------------------+-----------------+--------------------+-------------+----------+
| 167         | SAP         | deleloper          | 2019-06-20        |               8 |                 40 | fd          | NULL     |
| FS0816      | FUllstack   | Developer          | 2019-06-10        |               6 |                 18 | orl         | NULL     |
+-------------+-------------+--------------------+-------------------+-----------------+--------------------+-------------+----------+
2 rows in set (0.00 sec)

mysql> create view course_info_view as select course_code,course_name,course_duration where course_code=167;
ERROR 1054 (42S22): Unknown column 'course_code' in 'field list'
mysql> create view course_info_view as select course_code,course_name,course_duration from course_info  where course_code=167;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from course_info_view;
+-------------+-------------+-----------------+
| course_code | course_name | course_duration |
+-------------+-------------+-----------------+
| 167         | SAP         |               8 |
+-------------+-------------+-----------------+
1 row in set, 1 warning (0.00 sec)

mysql> create table course_fees(base_fees int,special_fees int);
Query OK, 0 rows affected (0.07 sec)

mysql> create view courseinfo_coursefee_view as select c.course_code,c.course_name,f.base_fees,f.specials from course_info c inner join course_fees f;
ERROR 1054 (42S22): Unknown column 'f.specials' in 'field list'
mysql> create view courseinfo_coursefee_view as select c.course_code,c.course_name,f.base_fees,f.specia_fees from course_info c inner join course_fees f;
ERROR 1054 (42S22): Unknown column 'f.specia_fees' in 'field list'
mysql> create view courseinfo_coursefee_view as select c.course_code,c.course_name,f.base_fees,f.special_fees from course_info c inner join course_fees f;
Query OK, 0 rows affected (0.01 sec)

mysql> insert into course_fees(23,45);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '23,45)' at line 1
mysql> insert into course_fees values(23,45);
Query OK, 1 row affected (0.01 sec)

mysql> drop view courseinfo_coursefee_view;
Query OK, 0 rows affected (0.01 sec)

mysql> drop view course_info_view;
Query OK, 0 rows affected (0.01 sec)

mysql> create index course_des_index on course_info(course_description);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> drop index course_des_index;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> drop index course_des_index;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> alter table course_info drop index course_des_index;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create unique index index_unique on course_info(course_description);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from index_unique;
ERROR 1146 (42S02): Table 'subhashini.index_unique' doesn't exist
mysql> select * from index_unique;
ERROR 1146 (42S02): Table 'subhashini.index_unique' doesn't exist
mysql> create view employee_vu as select employee_id,last_name,department_id from employees;
ERROR 1054 (42S22): Unknown column 'employee_id' in 'field list'
mysql> select * from employees;
Empty set (0.00 sec)

mysql> use hr;
Database changed
mysql> create view employee_vu as select employee_id,last_name,department_id from employees;
Query OK, 0 rows affected (0.01 sec)

mysql> select employee_id,department_id from employee_vu;
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
|         178 |          NULL |
|         200 |            10 |
|         201 |            20 |
|         202 |            20 |
|         114 |            30 |
|         115 |            30 |
|         116 |            30 |
|         117 |            30 |
|         118 |            30 |
|         119 |            30 |
|         203 |            40 |
|         120 |            50 |
|         121 |            50 |
|         122 |            50 |
|         123 |            50 |
|         124 |            50 |
|         125 |            50 |
|         126 |            50 |
|         127 |            50 |
|         128 |            50 |
|         129 |            50 |
|         130 |            50 |
|         131 |            50 |
|         132 |            50 |
|         133 |            50 |
|         134 |            50 |
|         135 |            50 |
|         136 |            50 |
|         137 |            50 |
|         138 |            50 |
|         139 |            50 |
|         140 |            50 |
|         141 |            50 |
|         142 |            50 |
|         143 |            50 |
|         144 |            50 |
|         180 |            50 |
|         181 |            50 |
|         182 |            50 |
|         183 |            50 |
|         184 |            50 |
|         185 |            50 |
|         186 |            50 |
|         187 |            50 |
|         188 |            50 |
|         189 |            50 |
|         190 |            50 |
|         191 |            50 |
|         192 |            50 |
|         193 |            50 |
|         194 |            50 |
|         195 |            50 |
|         196 |            50 |
|         197 |            50 |
|         198 |            50 |
|         199 |            50 |
|         103 |            60 |
|         104 |            60 |
|         105 |            60 |
|         106 |            60 |
|         107 |            60 |
|         204 |            70 |
|         145 |            80 |
|         146 |            80 |
|         147 |            80 |
|         148 |            80 |
|         149 |            80 |
|         150 |            80 |
|         151 |            80 |
|         152 |            80 |
|         153 |            80 |
|         154 |            80 |
|         155 |            80 |
|         156 |            80 |
|         157 |            80 |
|         158 |            80 |
|         159 |            80 |
|         160 |            80 |
|         161 |            80 |
|         162 |            80 |
|         163 |            80 |
|         164 |            80 |
|         165 |            80 |
|         166 |            80 |
|         167 |            80 |
|         168 |            80 |
|         169 |            80 |
|         170 |            80 |
|         171 |            80 |
|         172 |            80 |
|         173 |            80 |
|         174 |            80 |
|         175 |            80 |
|         176 |            80 |
|         177 |            80 |
|         179 |            80 |
|         100 |            90 |
|         101 |            90 |
|         102 |            90 |
|         108 |           100 |
|         109 |           100 |
|         110 |           100 |
|         111 |           100 |
|         112 |           100 |
|         113 |           100 |
|         205 |           110 |
|         206 |           110 |
+-------------+---------------+
107 rows in set (0.00 sec)

mysql> select last_name,department_id from employee_vu;
+-------------+---------------+
| last_name   | department_id |
+-------------+---------------+
| King        |            90 |
| Kochhar     |            90 |
| De Haan     |            90 |
| Hunold      |            60 |
| Ernst       |            60 |
| Austin      |            60 |
| Pataballa   |            60 |
| Lorentz     |            60 |
| Greenberg   |           100 |
| Faviet      |           100 |
| Chen        |           100 |
| Sciarra     |           100 |
| Urman       |           100 |
| Popp        |           100 |
| Raphaely    |            30 |
| Khoo        |            30 |
| Baida       |            30 |
| Tobias      |            30 |
| Himuro      |            30 |
| Colmenares  |            30 |
| Weiss       |            50 |
| Fripp       |            50 |
| Kaufling    |            50 |
| Vollman     |            50 |
| Mourgos     |            50 |
| Nayer       |            50 |
| Mikkilineni |            50 |
| Landry      |            50 |
| Markle      |            50 |
| Bissot      |            50 |
| Atkinson    |            50 |
| Marlow      |            50 |
| Olson       |            50 |
| Mallin      |            50 |
| Rogers      |            50 |
| Gee         |            50 |
| Philtanker  |            50 |
| Ladwig      |            50 |
| Stiles      |            50 |
| Seo         |            50 |
| Patel       |            50 |
| Rajs        |            50 |
| Davies      |            50 |
| Matos       |            50 |
| Vargas      |            50 |
| Russell     |            80 |
| Partners    |            80 |
| Errazuriz   |            80 |
| Cambrault   |            80 |
| Zlotkey     |            80 |
| Tucker      |            80 |
| Bernstein   |            80 |
| Hall        |            80 |
| Olsen       |            80 |
| Cambrault   |            80 |
| Tuvault     |            80 |
| King        |            80 |
| Sully       |            80 |
| McEwen      |            80 |
| Smith       |            80 |
| Doran       |            80 |
| Sewall      |            80 |
| Vishney     |            80 |
| Greene      |            80 |
| Marvins     |            80 |
| Lee         |            80 |
| Ande        |            80 |
| Banda       |            80 |
| Ozer        |            80 |
| Bloom       |            80 |
| Fox         |            80 |
| Smith       |            80 |
| Bates       |            80 |
| Kumar       |            80 |
| Abel        |            80 |
| Hutton      |            80 |
| Taylor      |            80 |
| Livingston  |            80 |
| Grant       |          NULL |
| Johnson     |            80 |
| Taylor      |            50 |
| Fleaur      |            50 |
| Sullivan    |            50 |
| Geoni       |            50 |
| Sarchand    |            50 |
| Bull        |            50 |
| Dellinger   |            50 |
| Cabrio      |            50 |
| Chung       |            50 |
| Dilly       |            50 |
| Gates       |            50 |
| Perkins     |            50 |
| Bell        |            50 |
| Everett     |            50 |
| McCain      |            50 |
| Jones       |            50 |
| Walsh       |            50 |
| Feeney      |            50 |
| OConnell    |            50 |
| Grant       |            50 |
| Whalen      |            10 |
| Hartstein   |            20 |
| Fay         |            20 |
| Mavris      |            40 |
| Baer        |            70 |
| Higgins     |           110 |
| Gietz       |           110 |
+-------------+---------------+
107 rows in set (0.00 sec)

mysql> create view dept50 select employee_no,last_name,department_no from employees where department_no=50;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select employee_no,last_name,department_no from employees where department_no=50' at line 1
mysql> create view dept50 as select employee_no,last_name,department_no from employees where department_no=50;
ERROR 1054 (42S22): Unknown column 'employee_no' in 'field list'
mysql> select * from employees;
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
| employee_id | first_name  | last_name   | email    | phone_number       | hire_date  | job_id     | salary   | commission_pct | manager_id | department_id |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
|         100 | Steven      | King        | SKING    | 515.123.4567       | 1987-06-17 | AD_PRES    | 24000.00 |           NULL |       NULL |            90 |
|         101 | Neena       | Kochhar     | NKOCHHAR | 515.123.4568       | 1989-09-21 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         102 | Lex         | De Haan     | LDEHAAN  | 515.123.4569       | 1993-01-13 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         103 | Alexander   | Hunold      | AHUNOLD  | 590.423.4567       | 1990-01-03 | IT_PROG    |  9000.00 |           NULL |        102 |            60 |
|         104 | Bruce       | Ernst       | BERNST   | 590.423.4568       | 1991-05-21 | IT_PROG    |  6000.00 |           NULL |        103 |            60 |
|         105 | David       | Austin      | DAUSTIN  | 590.423.4569       | 1997-06-25 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         106 | Valli       | Pataballa   | VPATABAL | 590.423.4560       | 1998-02-05 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         107 | Diana       | Lorentz     | DLORENTZ | 590.423.5567       | 1999-02-07 | IT_PROG    |  4200.00 |           NULL |        103 |            60 |
|         108 | Nancy       | Greenberg   | NGREENBE | 515.124.4569       | 1994-08-17 | FI_MGR     | 12000.00 |           NULL |        101 |           100 |
|         109 | Daniel      | Faviet      | DFAVIET  | 515.124.4169       | 1994-08-16 | FI_ACCOUNT |  9000.00 |           NULL |        108 |           100 |
|         110 | John        | Chen        | JCHEN    | 515.124.4269       | 1997-09-28 | FI_ACCOUNT |  8200.00 |           NULL |        108 |           100 |
|         111 | Ismael      | Sciarra     | ISCIARRA | 515.124.4369       | 1997-09-30 | FI_ACCOUNT |  7700.00 |           NULL |        108 |           100 |
|         112 | Jose Manuel | Urman       | JMURMAN  | 515.124.4469       | 1998-03-07 | FI_ACCOUNT |  7800.00 |           NULL |        108 |           100 |
|         113 | Luis        | Popp        | LPOPP    | 515.124.4567       | 1999-12-07 | FI_ACCOUNT |  6900.00 |           NULL |        108 |           100 |
|         114 | Den         | Raphaely    | DRAPHEAL | 515.127.4561       | 1994-12-07 | PU_MAN     | 11000.00 |           NULL |        100 |            30 |
|         115 | Alexander   | Khoo        | AKHOO    | 515.127.4562       | 1995-05-18 | PU_CLERK   |  3100.00 |           NULL |        114 |            30 |
|         116 | Shelli      | Baida       | SBAIDA   | 515.127.4563       | 1997-12-24 | PU_CLERK   |  2900.00 |           NULL |        114 |            30 |
|         117 | Sigal       | Tobias      | STOBIAS  | 515.127.4564       | 1997-07-24 | PU_CLERK   |  2800.00 |           NULL |        114 |            30 |
|         118 | Guy         | Himuro      | GHIMURO  | 515.127.4565       | 1998-11-15 | PU_CLERK   |  2600.00 |           NULL |        114 |            30 |
|         119 | Karen       | Colmenares  | KCOLMENA | 515.127.4566       | 1999-08-10 | PU_CLERK   |  2500.00 |           NULL |        114 |            30 |
|         120 | Matthew     | Weiss       | MWEISS   | 650.123.1234       | 1996-07-18 | ST_MAN     |  8000.00 |           NULL |        100 |            50 |
|         121 | Adam        | Fripp       | AFRIPP   | 650.123.2234       | 1997-04-10 | ST_MAN     |  8200.00 |           NULL |        100 |            50 |
|         122 | Payam       | Kaufling    | PKAUFLIN | 650.123.3234       | 1995-05-01 | ST_MAN     |  7900.00 |           NULL |        100 |            50 |
|         123 | Shanta      | Vollman     | SVOLLMAN | 650.123.4234       | 1997-10-10 | ST_MAN     |  6500.00 |           NULL |        100 |            50 |
|         124 | Kevin       | Mourgos     | KMOURGOS | 650.123.5234       | 1999-11-16 | ST_MAN     |  5800.00 |           NULL |        100 |            50 |
|         125 | Julia       | Nayer       | JNAYER   | 650.124.1214       | 1997-07-16 | ST_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         126 | Irene       | Mikkilineni | IMIKKILI | 650.124.1224       | 1998-09-28 | ST_CLERK   |  2700.00 |           NULL |        120 |            50 |
|         127 | James       | Landry      | JLANDRY  | 650.124.1334       | 1999-01-14 | ST_CLERK   |  2400.00 |           NULL |        120 |            50 |
|         128 | Steven      | Markle      | SMARKLE  | 650.124.1434       | 2000-03-08 | ST_CLERK   |  2200.00 |           NULL |        120 |            50 |
|         129 | Laura       | Bissot      | LBISSOT  | 650.124.5234       | 1997-08-20 | ST_CLERK   |  3300.00 |           NULL |        121 |            50 |
|         130 | Mozhe       | Atkinson    | MATKINSO | 650.124.6234       | 1997-10-30 | ST_CLERK   |  2800.00 |           NULL |        121 |            50 |
|         131 | James       | Marlow      | JAMRLOW  | 650.124.7234       | 1997-02-16 | ST_CLERK   |  2500.00 |           NULL |        121 |            50 |
|         132 | TJ          | Olson       | TJOLSON  | 650.124.8234       | 1999-04-10 | ST_CLERK   |  2100.00 |           NULL |        121 |            50 |
|         133 | Jason       | Mallin      | JMALLIN  | 650.127.1934       | 1996-06-14 | ST_CLERK   |  3300.00 |           NULL |        122 |            50 |
|         134 | Michael     | Rogers      | MROGERS  | 650.127.1834       | 1998-08-26 | ST_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         135 | Ki          | Gee         | KGEE     | 650.127.1734       | 1999-12-12 | ST_CLERK   |  2400.00 |           NULL |        122 |            50 |
|         136 | Hazel       | Philtanker  | HPHILTAN | 650.127.1634       | 2000-02-06 | ST_CLERK   |  2200.00 |           NULL |        122 |            50 |
|         137 | Renske      | Ladwig      | RLADWIG  | 650.121.1234       | 1995-07-14 | ST_CLERK   |  3600.00 |           NULL |        123 |            50 |
|         138 | Stephen     | Stiles      | SSTILES  | 650.121.2034       | 1997-10-26 | ST_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         139 | John        | Seo         | JSEO     | 650.121.2019       | 1998-02-12 | ST_CLERK   |  2700.00 |           NULL |        123 |            50 |
|         140 | Joshua      | Patel       | JPATEL   | 650.121.1834       | 1998-04-06 | ST_CLERK   |  2500.00 |           NULL |        123 |            50 |
|         141 | Trenna      | Rajs        | TRAJS    | 650.121.8009       | 1995-10-17 | ST_CLERK   |  3500.00 |           NULL |        124 |            50 |
|         142 | Curtis      | Davies      | CDAVIES  | 650.121.2994       | 1997-01-29 | ST_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         143 | Randall     | Matos       | RMATOS   | 650.121.2874       | 1998-03-15 | ST_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         144 | Peter       | Vargas      | PVARGAS  | 650.121.2004       | 1998-07-09 | ST_CLERK   |  2500.00 |           NULL |        124 |            50 |
|         145 | John        | Russell     | JRUSSEL  | 011.44.1344.429268 | 1996-10-01 | SA_MAN     | 14000.00 |           0.40 |        100 |            80 |
|         146 | Karen       | Partners    | KPARTNER | 011.44.1344.467268 | 1997-01-05 | SA_MAN     | 13500.00 |           0.30 |        100 |            80 |
|         147 | Alberto     | Errazuriz   | AERRAZUR | 011.44.1344.429278 | 1997-03-10 | SA_MAN     | 12000.00 |           0.30 |        100 |            80 |
|         148 | Gerald      | Cambrault   | GCAMBRAU | 011.44.1344.619268 | 1999-10-15 | SA_MAN     | 11000.00 |           0.30 |        100 |            80 |
|         149 | Eleni       | Zlotkey     | EZLOTKEY | 011.44.1344.429018 | 2000-01-29 | SA_MAN     | 10500.00 |           0.20 |        100 |            80 |
|         150 | Peter       | Tucker      | PTUCKER  | 011.44.1344.129268 | 1997-01-30 | SA_REP     | 10000.00 |           0.30 |        145 |            80 |
|         151 | David       | Bernstein   | DBERNSTE | 011.44.1344.345268 | 1997-03-24 | SA_REP     |  9500.00 |           0.25 |        145 |            80 |
|         152 | Peter       | Hall        | PHALL    | 011.44.1344.478968 | 1997-08-20 | SA_REP     |  9000.00 |           0.25 |        145 |            80 |
|         153 | Christopher | Olsen       | COLSEN   | 011.44.1344.498718 | 1998-03-30 | SA_REP     |  8000.00 |           0.20 |        145 |            80 |
|         154 | Nanette     | Cambrault   | NCAMBRAU | 011.44.1344.987668 | 1998-12-09 | SA_REP     |  7500.00 |           0.20 |        145 |            80 |
|         155 | Oliver      | Tuvault     | OTUVAULT | 011.44.1344.486508 | 1999-11-23 | SA_REP     |  7000.00 |           0.15 |        145 |            80 |
|         156 | Janette     | King        | JKING    | 011.44.1345.429268 | 1996-01-30 | SA_REP     | 10000.00 |           0.35 |        146 |            80 |
|         157 | Patrick     | Sully       | PSULLY   | 011.44.1345.929268 | 1996-03-04 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         158 | Allan       | McEwen      | AMCEWEN  | 011.44.1345.829268 | 1996-08-01 | SA_REP     |  9000.00 |           0.35 |        146 |            80 |
|         159 | Lindsey     | Smith       | LSMITH   | 011.44.1345.729268 | 1997-03-10 | SA_REP     |  8000.00 |           0.30 |        146 |            80 |
|         160 | Louise      | Doran       | LDORAN   | 011.44.1345.629268 | 1997-12-15 | SA_REP     |  7500.00 |           0.30 |        146 |            80 |
|         161 | Sarath      | Sewall      | SSEWALL  | 011.44.1345.529268 | 1998-11-03 | SA_REP     |  7000.00 |           0.25 |        146 |            80 |
|         162 | Clara       | Vishney     | CVISHNEY | 011.44.1346.129268 | 1997-11-11 | SA_REP     | 10500.00 |           0.25 |        147 |            80 |
|         163 | Danielle    | Greene      | DGREENE  | 011.44.1346.229268 | 1999-03-19 | SA_REP     |  9500.00 |           0.15 |        147 |            80 |
|         164 | Mattea      | Marvins     | MMARVINS | 011.44.1346.329268 | 2000-01-24 | SA_REP     |  7200.00 |           0.10 |        147 |            80 |
|         165 | David       | Lee         | DLEE     | 011.44.1346.529268 | 2000-02-23 | SA_REP     |  6800.00 |           0.10 |        147 |            80 |
|         166 | Sundar      | Ande        | SANDE    | 011.44.1346.629268 | 2000-03-24 | SA_REP     |  6400.00 |           0.10 |        147 |            80 |
|         167 | Amit        | Banda       | ABANDA   | 011.44.1346.729268 | 2000-04-21 | SA_REP     |  6200.00 |           0.10 |        147 |            80 |
|         168 | Lisa        | Ozer        | LOZER    | 011.44.1343.929268 | 1997-03-11 | SA_REP     | 11500.00 |           0.25 |        148 |            80 |
|         169 | Harrison    | Bloom       | HBLOOM   | 011.44.1343.829268 | 1998-03-23 | SA_REP     | 10000.00 |           0.20 |        148 |            80 |
|         170 | Tayler      | Fox         | TFOX     | 011.44.1343.729268 | 1998-01-24 | SA_REP     |  9600.00 |           0.20 |        148 |            80 |
|         171 | William     | Smith       | WSMITH   | 011.44.1343.629268 | 1999-02-23 | SA_REP     |  7400.00 |           0.15 |        148 |            80 |
|         172 | Elizabeth   | Bates       | EBATES   | 011.44.1343.529268 | 1999-03-24 | SA_REP     |  7300.00 |           0.15 |        148 |            80 |
|         173 | Sundita     | Kumar       | SKUMAR   | 011.44.1343.329268 | 2000-04-21 | SA_REP     |  6100.00 |           0.10 |        148 |            80 |
|         174 | Ellen       | Abel        | EABEL    | 011.44.1644.429267 | 1996-05-11 | SA_REP     | 11000.00 |           0.30 |        149 |            80 |
|         175 | Alyssa      | Hutton      | AHUTTON  | 011.44.1644.429266 | 1997-03-19 | SA_REP     |  8800.00 |           0.25 |        149 |            80 |
|         176 | Jonathon    | Taylor      | JTAYLOR  | 011.44.1644.429265 | 1998-03-24 | SA_REP     |  8600.00 |           0.20 |        149 |            80 |
|         177 | Jack        | Livingston  | JLIVINGS | 011.44.1644.429264 | 1998-04-23 | SA_REP     |  8400.00 |           0.20 |        149 |            80 |
|         178 | Kimberely   | Grant       | KGRANT   | 011.44.1644.429263 | 1999-05-24 | SA_REP     |  7000.00 |           0.15 |        149 |          NULL |
|         179 | Charles     | Johnson     | CJOHNSON | 011.44.1644.429262 | 2000-01-04 | SA_REP     |  6200.00 |           0.10 |        149 |            80 |
|         180 | Winston     | Taylor      | WTAYLOR  | 650.507.9876       | 1998-01-24 | SH_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         181 | Jean        | Fleaur      | JFLEAUR  | 650.507.9877       | 1998-02-23 | SH_CLERK   |  3100.00 |           NULL |        120 |            50 |
|         182 | Martha      | Sullivan    | MSULLIVA | 650.507.9878       | 1999-06-21 | SH_CLERK   |  2500.00 |           NULL |        120 |            50 |
|         183 | Girard      | Geoni       | GGEONI   | 650.507.9879       | 2000-02-03 | SH_CLERK   |  2800.00 |           NULL |        120 |            50 |
|         184 | Nandita     | Sarchand    | NSARCHAN | 650.509.1876       | 1996-01-27 | SH_CLERK   |  4200.00 |           NULL |        121 |            50 |
|         185 | Alexis      | Bull        | ABULL    | 650.509.2876       | 1997-02-20 | SH_CLERK   |  4100.00 |           NULL |        121 |            50 |
|         186 | Julia       | Dellinger   | JDELLING | 650.509.3876       | 1998-06-24 | SH_CLERK   |  3400.00 |           NULL |        121 |            50 |
|         187 | Anthony     | Cabrio      | ACABRIO  | 650.509.4876       | 1999-02-07 | SH_CLERK   |  3000.00 |           NULL |        121 |            50 |
|         188 | Kelly       | Chung       | KCHUNG   | 650.505.1876       | 1997-06-14 | SH_CLERK   |  3800.00 |           NULL |        122 |            50 |
|         189 | Jennifer    | Dilly       | JDILLY   | 650.505.2876       | 1997-08-13 | SH_CLERK   |  3600.00 |           NULL |        122 |            50 |
|         190 | Timothy     | Gates       | TGATES   | 650.505.3876       | 1998-07-11 | SH_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         191 | Randall     | Perkins     | RPERKINS | 650.505.4876       | 1999-12-19 | SH_CLERK   |  2500.00 |           NULL |        122 |            50 |
|         192 | Sarah       | Bell        | SBELL    | 650.501.1876       | 1996-02-04 | SH_CLERK   |  4000.00 |           NULL |        123 |            50 |
|         193 | Britney     | Everett     | BEVERETT | 650.501.2876       | 1997-03-03 | SH_CLERK   |  3900.00 |           NULL |        123 |            50 |
|         194 | Samuel      | McCain      | SMCCAIN  | 650.501.3876       | 1998-07-01 | SH_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         195 | Vance       | Jones       | VJONES   | 650.501.4876       | 1999-03-17 | SH_CLERK   |  2800.00 |           NULL |        123 |            50 |
|         196 | Alana       | Walsh       | AWALSH   | 650.507.9811       | 1998-04-24 | SH_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         197 | Kevin       | Feeney      | KFEENEY  | 650.507.9822       | 1998-05-23 | SH_CLERK   |  3000.00 |           NULL |        124 |            50 |
|         198 | Donald      | OConnell    | DOCONNEL | 650.507.9833       | 1999-06-21 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         199 | Douglas     | Grant       | DGRANT   | 650.507.9844       | 2000-01-13 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         200 | Jennifer    | Whalen      | JWHALEN  | 515.123.4444       | 1987-09-17 | AD_ASST    |  4400.00 |           NULL |        101 |            10 |
|         201 | Michael     | Hartstein   | MHARTSTE | 515.123.5555       | 1996-02-17 | MK_MAN     | 13000.00 |           NULL |        100 |            20 |
|         202 | Pat         | Fay         | PFAY     | 603.123.6666       | 1997-08-17 | MK_REP     |  6000.00 |           NULL |        201 |            20 |
|         203 | Susan       | Mavris      | SMAVRIS  | 515.123.7777       | 1994-06-07 | HR_REP     |  6500.00 |           NULL |        101 |            40 |
|         204 | Hermann     | Baer        | HBAER    | 515.123.8888       | 1994-06-07 | PR_REP     | 10000.00 |           NULL |        101 |            70 |
|         205 | Shelley     | Higgins     | SHIGGINS | 515.123.8080       | 1994-06-07 | AC_MGR     | 12000.00 |           NULL |        101 |           110 |
|         206 | William     | Gietz       | WGIETZ   | 51hr5.123.8181     | 1994-06-07 | AC_ACCOUNT |  8300.00 |           NULL |        205 |           110 |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
107 rows in set (0.00 sec)

mysql> create view dept50 as select employee_id,last_name,department_no from employees where department_no=50;
ERROR 1054 (42S22): Unknown column 'department_no' in 'field list'
mysql> create view dept50 as select employee_id,last_name,department_id from employees where department_no=50;
ERROR 1054 (42S22): Unknown column 'department_no' in 'where clause'
mysql> create view dept50 as select employee_id,last_name,department_id from employees where department_id=50;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from dept50;
+-------------+-------------+---------------+
| employee_id | last_name   | department_id |
+-------------+-------------+---------------+
|         120 | Weiss       |            50 |
|         121 | Fripp       |            50 |
|         122 | Kaufling    |            50 |
|         123 | Vollman     |            50 |
|         124 | Mourgos     |            50 |
|         125 | Nayer       |            50 |
|         126 | Mikkilineni |            50 |
|         127 | Landry      |            50 |
|         128 | Markle      |            50 |
|         129 | Bissot      |            50 |
|         130 | Atkinson    |            50 |
|         131 | Marlow      |            50 |
|         132 | Olson       |            50 |
|         133 | Mallin      |            50 |
|         134 | Rogers      |            50 |
|         135 | Gee         |            50 |
|         136 | Philtanker  |            50 |
|         137 | Ladwig      |            50 |
|         138 | Stiles      |            50 |
|         139 | Seo         |            50 |
|         140 | Patel       |            50 |
|         141 | Rajs        |            50 |
|         142 | Davies      |            50 |
|         143 | Matos       |            50 |
|         144 | Vargas      |            50 |
|         180 | Taylor      |            50 |
|         181 | Fleaur      |            50 |
|         182 | Sullivan    |            50 |
|         183 | Geoni       |            50 |
|         184 | Sarchand    |            50 |
|         185 | Bull        |            50 |
|         186 | Dellinger   |            50 |
|         187 | Cabrio      |            50 |
|         188 | Chung       |            50 |
|         189 | Dilly       |            50 |
|         190 | Gates       |            50 |
|         191 | Perkins     |            50 |
|         192 | Bell        |            50 |
|         193 | Everett     |            50 |
|         194 | McCain      |            50 |
|         195 | Jones       |            50 |
|         196 | Walsh       |            50 |
|         197 | Feeney      |            50 |
|         198 | OConnell    |            50 |
|         199 | Grant       |            50 |
+-------------+-------------+---------------+
45 rows in set (0.00 sec)

mysql> select * from dept;
ERROR 1146 (42S02): Table 'hr.dept' doesn't exist
mysql> it remote add origin https://github.com/SubhashiniNi/myfirstrepo.git
    -> git remote add origin https://github.com/SubhashiniNi/myfirstrepo.git
    -> select employee_id,last_name from employees e order by (select department_name from departments d where e.department_id=d.department_id);











































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































mysql> select e1.last_name,e1.salary,e1.department_id, avg(e1.salary) from employees e1,employees e2 where e1.salary>(select avg(salary) from employees where e1.department_id=e2.department_id) group by e1.last_name,e1.salary,e1.department_id order by avg(e1.salary);
+------------+----------+---------------+----------------+
| last_name  | salary   | department_id | avg(e1.salary) |
+------------+----------+---------------+----------------+
| Mavris     |  6500.00 |            40 |    6500.000000 |
| Vollman    |  6500.00 |            50 |    6500.000000 |
| Lee        |  6800.00 |            80 |    6800.000000 |
| Popp       |  6900.00 |           100 |    6900.000000 |
| Sewall     |  7000.00 |            80 |    7000.000000 |
| Tuvault    |  7000.00 |            80 |    7000.000000 |
| Marvins    |  7200.00 |            80 |    7200.000000 |
| Bates      |  7300.00 |            80 |    7300.000000 |
| Smith      |  7400.00 |            80 |    7400.000000 |
| Doran      |  7500.00 |            80 |    7500.000000 |
| Cambrault  |  7500.00 |            80 |    7500.000000 |
| Sciarra    |  7700.00 |           100 |    7700.000000 |
| Urman      |  7800.00 |           100 |    7800.000000 |
| Kaufling   |  7900.00 |            50 |    7900.000000 |
| Olsen      |  8000.00 |            80 |    8000.000000 |
| Weiss      |  8000.00 |            50 |    8000.000000 |
| Smith      |  8000.00 |            80 |    8000.000000 |
| Fripp      |  8200.00 |            50 |    8200.000000 |
| Chen       |  8200.00 |           100 |    8200.000000 |
| Gietz      |  8300.00 |           110 |    8300.000000 |
| Livingston |  8400.00 |            80 |    8400.000000 |
| Taylor     |  8600.00 |            80 |    8600.000000 |
| Hutton     |  8800.00 |            80 |    8800.000000 |
| Hall       |  9000.00 |            80 |    9000.000000 |
| Faviet     |  9000.00 |           100 |    9000.000000 |
| McEwen     |  9000.00 |            80 |    9000.000000 |
| Hunold     |  9000.00 |            60 |    9000.000000 |
| Greene     |  9500.00 |            80 |    9500.000000 |
| Sully      |  9500.00 |            80 |    9500.000000 |
| Bernstein  |  9500.00 |            80 |    9500.000000 |
| Fox        |  9600.00 |            80 |    9600.000000 |
| Baer       | 10000.00 |            70 |   10000.000000 |
| King       | 10000.00 |            80 |   10000.000000 |
| Tucker     | 10000.00 |            80 |   10000.000000 |
| Bloom      | 10000.00 |            80 |   10000.000000 |
| Vishney    | 10500.00 |            80 |   10500.000000 |
| Zlotkey    | 10500.00 |            80 |   10500.000000 |
| Raphaely   | 11000.00 |            30 |   11000.000000 |
| Abel       | 11000.00 |            80 |   11000.000000 |
| Cambrault  | 11000.00 |            80 |   11000.000000 |
| Ozer       | 11500.00 |            80 |   11500.000000 |
| Higgins    | 12000.00 |           110 |   12000.000000 |
| Greenberg  | 12000.00 |           100 |   12000.000000 |
| Errazuriz  | 12000.00 |            80 |   12000.000000 |
| Hartstein  | 13000.00 |            20 |   13000.000000 |
| Partners   | 13500.00 |            80 |   13500.000000 |
| Russell    | 14000.00 |            80 |   14000.000000 |
| Kochhar    | 17000.00 |            90 |   17000.000000 |
| De Haan    | 17000.00 |            90 |   17000.000000 |
| King       | 24000.00 |            90 |   24000.000000 |
+------------+----------+---------------+----------------+
50 rows in set (0.40 sec)

mysql> select e1.last_name,e1.salary,e1.department_id, avg(e1.salary) from employees e1,employees e2 where e1.salary>(select avg(e1.salary) from employees where e1.department_id=e2.department_id) group by e1.last_name,e1.salary,e1.department_id order by avg(e1.salary);
Empty set (0.29 sec)

mysql> select e1.last_name,e1.salary,e1.department_id, avg(e1.salary) from employees e1,employees e2 where e1.salary>(select avg(e2.salary) from employees where e1.department_id=e2.department_id) group by e1.last_name,e1.salary,e1.department_id order by avg(e1.salary);
+-------------+----------+---------------+----------------+
| last_name   | salary   | department_id | avg(e1.salary) |
+-------------+----------+---------------+----------------+
| Markle      |  2200.00 |            50 |    2200.000000 |
| Philtanker  |  2200.00 |            50 |    2200.000000 |
| Gee         |  2400.00 |            50 |    2400.000000 |
| Landry      |  2400.00 |            50 |    2400.000000 |
| Patel       |  2500.00 |            50 |    2500.000000 |
| Vargas      |  2500.00 |            50 |    2500.000000 |
| Sullivan    |  2500.00 |            50 |    2500.000000 |
| Perkins     |  2500.00 |            50 |    2500.000000 |
| Marlow      |  2500.00 |            50 |    2500.000000 |
| Matos       |  2600.00 |            50 |    2600.000000 |
| OConnell    |  2600.00 |            50 |    2600.000000 |
| Himuro      |  2600.00 |            30 |    2600.000000 |
| Grant       |  2600.00 |            50 |    2600.000000 |
| Mikkilineni |  2700.00 |            50 |    2700.000000 |
| Seo         |  2700.00 |            50 |    2700.000000 |
| Atkinson    |  2800.00 |            50 |    2800.000000 |
| Jones       |  2800.00 |            50 |    2800.000000 |
| Tobias      |  2800.00 |            30 |    2800.000000 |
| Geoni       |  2800.00 |            50 |    2800.000000 |
| Gates       |  2900.00 |            50 |    2900.000000 |
| Rogers      |  2900.00 |            50 |    2900.000000 |
| Baida       |  2900.00 |            30 |    2900.000000 |
| Feeney      |  3000.00 |            50 |    3000.000000 |
| Cabrio      |  3000.00 |            50 |    3000.000000 |
| Khoo        |  3100.00 |            30 |    3100.000000 |
| Davies      |  3100.00 |            50 |    3100.000000 |
| Walsh       |  3100.00 |            50 |    3100.000000 |
| Fleaur      |  3100.00 |            50 |    3100.000000 |
| McCain      |  3200.00 |            50 |    3200.000000 |
| Stiles      |  3200.00 |            50 |    3200.000000 |
| Taylor      |  3200.00 |            50 |    3200.000000 |
| Nayer       |  3200.00 |            50 |    3200.000000 |
| Bissot      |  3300.00 |            50 |    3300.000000 |
| Mallin      |  3300.00 |            50 |    3300.000000 |
| Dellinger   |  3400.00 |            50 |    3400.000000 |
| Rajs        |  3500.00 |            50 |    3500.000000 |
| Dilly       |  3600.00 |            50 |    3600.000000 |
| Ladwig      |  3600.00 |            50 |    3600.000000 |
| Chung       |  3800.00 |            50 |    3800.000000 |
| Everett     |  3900.00 |            50 |    3900.000000 |
| Bell        |  4000.00 |            50 |    4000.000000 |
| Bull        |  4100.00 |            50 |    4100.000000 |
| Sarchand    |  4200.00 |            50 |    4200.000000 |
| Austin      |  4800.00 |            60 |    4800.000000 |
| Pataballa   |  4800.00 |            60 |    4800.000000 |
| Mourgos     |  5800.00 |            50 |    5800.000000 |
| Ernst       |  6000.00 |            60 |    6000.000000 |
| Banda       |  6200.00 |            80 |    6200.000000 |
| Johnson     |  6200.00 |            80 |    6200.000000 |
| Ande        |  6400.00 |            80 |    6400.000000 |
| Vollman     |  6500.00 |            50 |    6500.000000 |
| Lee         |  6800.00 |            80 |    6800.000000 |
| Tuvault     |  7000.00 |            80 |    7000.000000 |
| Sewall      |  7000.00 |            80 |    7000.000000 |
| Marvins     |  7200.00 |            80 |    7200.000000 |
| Bates       |  7300.00 |            80 |    7300.000000 |
| Smith       |  7400.00 |            80 |    7400.000000 |
| Cambrault   |  7500.00 |            80 |    7500.000000 |
| Doran       |  7500.00 |            80 |    7500.000000 |
| Sciarra     |  7700.00 |           100 |    7700.000000 |
| Urman       |  7800.00 |           100 |    7800.000000 |
| Kaufling    |  7900.00 |            50 |    7900.000000 |
| Weiss       |  8000.00 |            50 |    8000.000000 |
| Smith       |  8000.00 |            80 |    8000.000000 |
| Olsen       |  8000.00 |            80 |    8000.000000 |
| Chen        |  8200.00 |           100 |    8200.000000 |
| Fripp       |  8200.00 |            50 |    8200.000000 |
| Livingston  |  8400.00 |            80 |    8400.000000 |
| Taylor      |  8600.00 |            80 |    8600.000000 |
| Hutton      |  8800.00 |            80 |    8800.000000 |
| Hunold      |  9000.00 |            60 |    9000.000000 |
| Hall        |  9000.00 |            80 |    9000.000000 |
| McEwen      |  9000.00 |            80 |    9000.000000 |
| Faviet      |  9000.00 |           100 |    9000.000000 |
| Sully       |  9500.00 |            80 |    9500.000000 |
| Greene      |  9500.00 |            80 |    9500.000000 |
| Bernstein   |  9500.00 |            80 |    9500.000000 |
| Fox         |  9600.00 |            80 |    9600.000000 |
| Tucker      | 10000.00 |            80 |   10000.000000 |
| King        | 10000.00 |            80 |   10000.000000 |
| Bloom       | 10000.00 |            80 |   10000.000000 |
| Zlotkey     | 10500.00 |            80 |   10500.000000 |
| Vishney     | 10500.00 |            80 |   10500.000000 |
| Abel        | 11000.00 |            80 |   11000.000000 |
| Raphaely    | 11000.00 |            30 |   11000.000000 |
| Cambrault   | 11000.00 |            80 |   11000.000000 |
| Ozer        | 11500.00 |            80 |   11500.000000 |
| Greenberg   | 12000.00 |           100 |   12000.000000 |
| Errazuriz   | 12000.00 |            80 |   12000.000000 |
| Higgins     | 12000.00 |           110 |   12000.000000 |
| Hartstein   | 13000.00 |            20 |   13000.000000 |
| Partners    | 13500.00 |            80 |   13500.000000 |
| Russell     | 14000.00 |            80 |   14000.000000 |
| King        | 24000.00 |            90 |   24000.000000 |
+-------------+----------+---------------+----------------+
94 rows in set (0.28 sec)

mysql> select e1.last_name,e1.salary,e1.department_id, avg(e1.salary) from employees e1,employees e2 where e1.salary>(select avg(e2.salary) from employees where e1.department_id=e2.department_id) group by e1.last_name,e1.salary,e1.department_id order by avg(e1.salary);
+-------------+----------+---------------+----------------+
| last_name   | salary   | department_id | avg(e1.salary) |
+-------------+----------+---------------+----------------+
| Markle      |  2200.00 |            50 |    2200.000000 |
| Philtanker  |  2200.00 |            50 |    2200.000000 |
| Gee         |  2400.00 |            50 |    2400.000000 |
| Landry      |  2400.00 |            50 |    2400.000000 |
| Patel       |  2500.00 |            50 |    2500.000000 |
| Vargas      |  2500.00 |            50 |    2500.000000 |
| Sullivan    |  2500.00 |            50 |    2500.000000 |
| Perkins     |  2500.00 |            50 |    2500.000000 |
| Marlow      |  2500.00 |            50 |    2500.000000 |
| Matos       |  2600.00 |            50 |    2600.000000 |
| OConnell    |  2600.00 |            50 |    2600.000000 |
| Himuro      |  2600.00 |            30 |    2600.000000 |
| Grant       |  2600.00 |            50 |    2600.000000 |
| Mikkilineni |  2700.00 |            50 |    2700.000000 |
| Seo         |  2700.00 |            50 |    2700.000000 |
| Atkinson    |  2800.00 |            50 |    2800.000000 |
| Jones       |  2800.00 |            50 |    2800.000000 |
| Tobias      |  2800.00 |            30 |    2800.000000 |
| Geoni       |  2800.00 |            50 |    2800.000000 |
| Gates       |  2900.00 |            50 |    2900.000000 |
| Rogers      |  2900.00 |            50 |    2900.000000 |
| Baida       |  2900.00 |            30 |    2900.000000 |
| Feeney      |  3000.00 |            50 |    3000.000000 |
| Cabrio      |  3000.00 |            50 |    3000.000000 |
| Khoo        |  3100.00 |            30 |    3100.000000 |
| Davies      |  3100.00 |            50 |    3100.000000 |
| Walsh       |  3100.00 |            50 |    3100.000000 |
| Fleaur      |  3100.00 |            50 |    3100.000000 |
| McCain      |  3200.00 |            50 |    3200.000000 |
| Stiles      |  3200.00 |            50 |    3200.000000 |
| Taylor      |  3200.00 |            50 |    3200.000000 |
| Nayer       |  3200.00 |            50 |    3200.000000 |
| Bissot      |  3300.00 |            50 |    3300.000000 |
| Mallin      |  3300.00 |            50 |    3300.000000 |
| Dellinger   |  3400.00 |            50 |    3400.000000 |
| Rajs        |  3500.00 |            50 |    3500.000000 |
| Dilly       |  3600.00 |            50 |    3600.000000 |
| Ladwig      |  3600.00 |            50 |    3600.000000 |
| Chung       |  3800.00 |            50 |    3800.000000 |
| Everett     |  3900.00 |            50 |    3900.000000 |
| Bell        |  4000.00 |            50 |    4000.000000 |
| Bull        |  4100.00 |            50 |    4100.000000 |
| Sarchand    |  4200.00 |            50 |    4200.000000 |
| Austin      |  4800.00 |            60 |    4800.000000 |
| Pataballa   |  4800.00 |            60 |    4800.000000 |
| Mourgos     |  5800.00 |            50 |    5800.000000 |
| Ernst       |  6000.00 |            60 |    6000.000000 |
| Banda       |  6200.00 |            80 |    6200.000000 |
| Johnson     |  6200.00 |            80 |    6200.000000 |
| Ande        |  6400.00 |            80 |    6400.000000 |
| Vollman     |  6500.00 |            50 |    6500.000000 |
| Lee         |  6800.00 |            80 |    6800.000000 |
| Tuvault     |  7000.00 |            80 |    7000.000000 |
| Sewall      |  7000.00 |            80 |    7000.000000 |
| Marvins     |  7200.00 |            80 |    7200.000000 |
| Bates       |  7300.00 |            80 |    7300.000000 |
| Smith       |  7400.00 |            80 |    7400.000000 |
| Cambrault   |  7500.00 |            80 |    7500.000000 |
| Doran       |  7500.00 |            80 |    7500.000000 |
| Sciarra     |  7700.00 |           100 |    7700.000000 |
| Urman       |  7800.00 |           100 |    7800.000000 |
| Kaufling    |  7900.00 |            50 |    7900.000000 |
| Weiss       |  8000.00 |            50 |    8000.000000 |
| Smith       |  8000.00 |            80 |    8000.000000 |
| Olsen       |  8000.00 |            80 |    8000.000000 |
| Chen        |  8200.00 |           100 |    8200.000000 |
| Fripp       |  8200.00 |            50 |    8200.000000 |
| Livingston  |  8400.00 |            80 |    8400.000000 |
| Taylor      |  8600.00 |            80 |    8600.000000 |
| Hutton      |  8800.00 |            80 |    8800.000000 |
| Hunold      |  9000.00 |            60 |    9000.000000 |
| Hall        |  9000.00 |            80 |    9000.000000 |
| McEwen      |  9000.00 |            80 |    9000.000000 |
| Faviet      |  9000.00 |           100 |    9000.000000 |
| Sully       |  9500.00 |            80 |    9500.000000 |
| Greene      |  9500.00 |            80 |    9500.000000 |
| Bernstein   |  9500.00 |            80 |    9500.000000 |
| Fox         |  9600.00 |            80 |    9600.000000 |
| Tucker      | 10000.00 |            80 |   10000.000000 |
| King        | 10000.00 |            80 |   10000.000000 |
| Bloom       | 10000.00 |            80 |   10000.000000 |
| Zlotkey     | 10500.00 |            80 |   10500.000000 |
| Vishney     | 10500.00 |            80 |   10500.000000 |
| Abel        | 11000.00 |            80 |   11000.000000 |
| Raphaely    | 11000.00 |            30 |   11000.000000 |
| Cambrault   | 11000.00 |            80 |   11000.000000 |
| Ozer        | 11500.00 |            80 |   11500.000000 |
| Greenberg   | 12000.00 |           100 |   12000.000000 |
| Errazuriz   | 12000.00 |            80 |   12000.000000 |
| Higgins     | 12000.00 |           110 |   12000.000000 |
| Hartstein   | 13000.00 |            20 |   13000.000000 |
| Partners    | 13500.00 |            80 |   13500.000000 |
| Russell     | 14000.00 |            80 |   14000.000000 |
| King        | 24000.00 |            90 |   24000.000000 |
+-------------+----------+---------------+----------------+
94 rows in set (0.30 sec)

mysql> select last_name from employees e where e.salary<(select avg(e1.salary) from employees where e.department_id=e1.department_id);
ERROR 1054 (42S22): Unknown column 'e1.salary' in 'field list'
mysql> select last_name from employees e where e.salary<(select avg(e1.salary) from employees e1 where e.department_id=e1.department_id);
+-------------+
| last_name   |
+-------------+
| Kochhar     |
| De Haan     |
| Austin      |
| Pataballa   |
| Lorentz     |
| Chen        |
| Sciarra     |
| Urman       |
| Popp        |
| Khoo        |
| Baida       |
| Tobias      |
| Himuro      |
| Colmenares  |
| Nayer       |
| Mikkilineni |
| Landry      |
| Markle      |
| Bissot      |
| Atkinson    |
| Marlow      |
| Olson       |
| Mallin      |
| Rogers      |
| Gee         |
| Philtanker  |
| Stiles      |
| Seo         |
| Patel       |
| Davies      |
| Matos       |
| Vargas      |
| Olsen       |
| Cambrault   |
| Tuvault     |
| Smith       |
| Doran       |
| Sewall      |
| Marvins     |
| Lee         |
| Ande        |
| Banda       |
| Smith       |
| Bates       |
| Kumar       |
| Hutton      |
| Taylor      |
| Livingston  |
| Johnson     |
| Taylor      |
| Fleaur      |
| Sullivan    |
| Geoni       |
| Dellinger   |
| Cabrio      |
| Gates       |
| Perkins     |
| McCain      |
| Jones       |
| Walsh       |
| Feeney      |
| OConnell    |
| Grant       |
| Fay         |
| Gietz       |
+-------------+
65 rows in set (0.01 sec)

mysql> select last_name from employees e where e.salary<(select avg(e1.salary) from employees e1 where e.department_id=e1.department_id);
+-------------+
| last_name   |
+-------------+
| Kochhar     |
| De Haan     |
| Austin      |
| Pataballa   |
| Lorentz     |
| Chen        |
| Sciarra     |
| Urman       |
| Popp        |
| Khoo        |
| Baida       |
| Tobias      |
| Himuro      |
| Colmenares  |
| Nayer       |
| Mikkilineni |
| Landry      |
| Markle      |
| Bissot      |
| Atkinson    |
| Marlow      |
| Olson       |
| Mallin      |
| Rogers      |
| Gee         |
| Philtanker  |
| Stiles      |
| Seo         |
| Patel       |
| Davies      |
| Matos       |
| Vargas      |
| Olsen       |
| Cambrault   |
| Tuvault     |
| Smith       |
| Doran       |
| Sewall      |
| Marvins     |
| Lee         |
| Ande        |
| Banda       |
| Smith       |
| Bates       |
| Kumar       |
| Hutton      |
| Taylor      |
| Livingston  |
| Johnson     |
| Taylor      |
| Fleaur      |
| Sullivan    |
| Geoni       |
| Dellinger   |
| Cabrio      |
| Gates       |
| Perkins     |
| McCain      |
| Jones       |
| Walsh       |
| Feeney      |
| OConnell    |
| Grant       |
| Fay         |
| Gietz       |
+-------------+
65 rows in set (0.00 sec)

mysql> select e.last_name from employees e where exists (select a.last_name from employees a where e.departmemnt_id=a.department_id and e.hire_date>a.hire_date and e.salary>a.salary);
ERROR 1054 (42S22): Unknown column 'e.departmemnt_id' in 'where clause'
mysql> select e.last_name from employees e where exists (select a.last_name from employees a where e.departmennt_id=a.department_id and e.hire_date>a.hire_date and e.salary>a.salary);
ERROR 1054 (42S22): Unknown column 'e.departmennt_id' in 'where clause'
mysql> select e.last_name from employees e where exists (select a.last_name from employees a where e.department_id=a.department_id and e.hire_date>a.hire_date and e.salary>a.salary);
+-------------+
| last_name   |
+-------------+
| Greenberg   |
| Urman       |
| Baida       |
| Weiss       |
| Fripp       |
| Vollman     |
| Mourgos     |
| Nayer       |
| Mikkilineni |
| Markle      |
| Bissot      |
| Atkinson    |
| Rogers      |
| Gee         |
| Philtanker  |
| Stiles      |
| Seo         |
| Matos       |
| Russell     |
| Partners    |
| Errazuriz   |
| Cambrault   |
| Zlotkey     |
| Tucker      |
| Bernstein   |
| Hall        |
| Olsen       |
| Cambrault   |
| Vishney     |
| Greene      |
| Marvins     |
| Lee         |
| Ande        |
| Ozer        |
| Bloom       |
| Fox         |
| Smith       |
| Bates       |
| Abel        |
| Hutton      |
| Taylor      |
| Livingston  |
| Taylor      |
| Fleaur      |
| Sullivan    |
| Geoni       |
| Sarchand    |
| Bull        |
| Dellinger   |
| Cabrio      |
| Chung       |
| Dilly       |
| Gates       |
| Perkins     |
| Bell        |
| Everett     |
| McCain      |
| Jones       |
| Walsh       |
| Feeney      |
| OConnell    |
| Grant       |
+-------------+
62 rows in set (0.01 sec)

mysql> select employee_id,last_name,(select department_name d from departs d where e.department_id=d.department_id) from employees e order by departments;
ERROR 1146 (42S02): Table 'hr.departs' doesn't exist
mysql> select employee_id,last_name,(select department_name d from departments d where e.department_id=d.department_id) from employees e order by departments;
ERROR 1054 (42S22): Unknown column 'departments' in 'order clause'
mysql> select employee_id,last_name,(select department_name d from departments d where e.department_id=d.department_id) from employees e order by departments;
ERROR 1054 (42S22): Unknown column 'departments' in 'order clause'
mysql> select * from departments;
+---------------+----------------------+------------+-------------+
| department_id | department_name      | manager_id | location_id |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |       NULL |        1700 |
|           130 | Corporate Tax        |       NULL |        1700 |
|           140 | Control And Credit   |       NULL |        1700 |
|           150 | Shareholder Services |       NULL |        1700 |
|           160 | Benefits             |       NULL |        1700 |
|           170 | Manufacturing        |       NULL |        1700 |
|           180 | Construction         |       NULL |        1700 |
|           190 | Contracting          |       NULL |        1700 |
|           200 | Operations           |       NULL |        1700 |
|           210 | IT Support           |       NULL |        1700 |
|           220 | NOC                  |       NULL |        1700 |
|           230 | IT Helpdesk          |       NULL |        1700 |
|           240 | Government Sales     |       NULL |        1700 |
|           250 | Retail Sales         |       NULL |        1700 |
|           260 | Recruiting           |       NULL |        1700 |
|           270 | Payroll              |       NULL |        1700 |
+---------------+----------------------+------------+-------------+
27 rows in set (0.00 sec)

mysql> select employee_id,last_name,(select department_name from departments d where e.departments=d.departments) from employees e order by departments;
ERROR 1054 (42S22): Unknown column 'e.departments' in 'where clause'
mysql> select employee_id,last_name,(select department_name from departments d where e.department_id=d.department_id)  departments from employees e order by departments;
+-------------+-------------+------------------+
| employee_id | last_name   | departments      |
+-------------+-------------+------------------+
|         178 | Grant       | NULL             |
|         205 | Higgins     | Accounting       |
|         206 | Gietz       | Accounting       |
|         200 | Whalen      | Administration   |
|         100 | King        | Executive        |
|         101 | Kochhar     | Executive        |
|         102 | De Haan     | Executive        |
|         113 | Popp        | Finance          |
|         108 | Greenberg   | Finance          |
|         109 | Faviet      | Finance          |
|         110 | Chen        | Finance          |
|         111 | Sciarra     | Finance          |
|         112 | Urman       | Finance          |
|         203 | Mavris      | Human Resources  |
|         105 | Austin      | IT               |
|         106 | Pataballa   | IT               |
|         107 | Lorentz     | IT               |
|         103 | Hunold      | IT               |
|         104 | Ernst       | IT               |
|         201 | Hartstein   | Marketing        |
|         202 | Fay         | Marketing        |
|         204 | Baer        | Public Relations |
|         114 | Raphaely    | Purchasing       |
|         115 | Khoo        | Purchasing       |
|         116 | Baida       | Purchasing       |
|         117 | Tobias      | Purchasing       |
|         118 | Himuro      | Purchasing       |
|         119 | Colmenares  | Purchasing       |
|         145 | Russell     | Sales            |
|         153 | Olsen       | Sales            |
|         161 | Sewall      | Sales            |
|         169 | Bloom       | Sales            |
|         177 | Livingston  | Sales            |
|         146 | Partners    | Sales            |
|         154 | Cambrault   | Sales            |
|         162 | Vishney     | Sales            |
|         170 | Fox         | Sales            |
|         147 | Errazuriz   | Sales            |
|         155 | Tuvault     | Sales            |
|         163 | Greene      | Sales            |
|         171 | Smith       | Sales            |
|         179 | Johnson     | Sales            |
|         148 | Cambrault   | Sales            |
|         156 | King        | Sales            |
|         164 | Marvins     | Sales            |
|         172 | Bates       | Sales            |
|         149 | Zlotkey     | Sales            |
|         157 | Sully       | Sales            |
|         165 | Lee         | Sales            |
|         173 | Kumar       | Sales            |
|         150 | Tucker      | Sales            |
|         158 | McEwen      | Sales            |
|         166 | Ande        | Sales            |
|         174 | Abel        | Sales            |
|         151 | Bernstein   | Sales            |
|         159 | Smith       | Sales            |
|         167 | Banda       | Sales            |
|         175 | Hutton      | Sales            |
|         152 | Hall        | Sales            |
|         160 | Doran       | Sales            |
|         168 | Ozer        | Sales            |
|         176 | Taylor      | Sales            |
|         121 | Fripp       | Shipping         |
|         129 | Bissot      | Shipping         |
|         137 | Ladwig      | Shipping         |
|         185 | Bull        | Shipping         |
|         193 | Everett     | Shipping         |
|         122 | Kaufling    | Shipping         |
|         130 | Atkinson    | Shipping         |
|         138 | Stiles      | Shipping         |
|         186 | Dellinger   | Shipping         |
|         194 | McCain      | Shipping         |
|         123 | Vollman     | Shipping         |
|         131 | Marlow      | Shipping         |
|         139 | Seo         | Shipping         |
|         187 | Cabrio      | Shipping         |
|         195 | Jones       | Shipping         |
|         124 | Mourgos     | Shipping         |
|         132 | Olson       | Shipping         |
|         140 | Patel       | Shipping         |
|         180 | Taylor      | Shipping         |
|         188 | Chung       | Shipping         |
|         196 | Walsh       | Shipping         |
|         125 | Nayer       | Shipping         |
|         133 | Mallin      | Shipping         |
|         141 | Rajs        | Shipping         |
|         181 | Fleaur      | Shipping         |
|         189 | Dilly       | Shipping         |
|         197 | Feeney      | Shipping         |
|         126 | Mikkilineni | Shipping         |
|         134 | Rogers      | Shipping         |
|         142 | Davies      | Shipping         |
|         182 | Sullivan    | Shipping         |
|         190 | Gates       | Shipping         |
|         198 | OConnell    | Shipping         |
|         127 | Landry      | Shipping         |
|         135 | Gee         | Shipping         |
|         143 | Matos       | Shipping         |
|         183 | Geoni       | Shipping         |
|         191 | Perkins     | Shipping         |
|         199 | Grant       | Shipping         |
|         120 | Weiss       | Shipping         |
|         128 | Markle      | Shipping         |
|         136 | Philtanker  | Shipping         |
|         144 | Vargas      | Shipping         |
|         184 | Sarchand    | Shipping         |
|         192 | Bell        | Shipping         |
+-------------+-------------+------------------+
107 rows in set (0.00 sec)

mysql> select employee_id,last_name,(select department_name from departments d where e.department_id=d.department_id)  departments from employees e ;
+-------------+-------------+------------------+
| employee_id | last_name   | departments      |
+-------------+-------------+------------------+
|         100 | King        | Executive        |
|         101 | Kochhar     | Executive        |
|         102 | De Haan     | Executive        |
|         103 | Hunold      | IT               |
|         104 | Ernst       | IT               |
|         105 | Austin      | IT               |
|         106 | Pataballa   | IT               |
|         107 | Lorentz     | IT               |
|         108 | Greenberg   | Finance          |
|         109 | Faviet      | Finance          |
|         110 | Chen        | Finance          |
|         111 | Sciarra     | Finance          |
|         112 | Urman       | Finance          |
|         113 | Popp        | Finance          |
|         114 | Raphaely    | Purchasing       |
|         115 | Khoo        | Purchasing       |
|         116 | Baida       | Purchasing       |
|         117 | Tobias      | Purchasing       |
|         118 | Himuro      | Purchasing       |
|         119 | Colmenares  | Purchasing       |
|         120 | Weiss       | Shipping         |
|         121 | Fripp       | Shipping         |
|         122 | Kaufling    | Shipping         |
|         123 | Vollman     | Shipping         |
|         124 | Mourgos     | Shipping         |
|         125 | Nayer       | Shipping         |
|         126 | Mikkilineni | Shipping         |
|         127 | Landry      | Shipping         |
|         128 | Markle      | Shipping         |
|         129 | Bissot      | Shipping         |
|         130 | Atkinson    | Shipping         |
|         131 | Marlow      | Shipping         |
|         132 | Olson       | Shipping         |
|         133 | Mallin      | Shipping         |
|         134 | Rogers      | Shipping         |
|         135 | Gee         | Shipping         |
|         136 | Philtanker  | Shipping         |
|         137 | Ladwig      | Shipping         |
|         138 | Stiles      | Shipping         |
|         139 | Seo         | Shipping         |
|         140 | Patel       | Shipping         |
|         141 | Rajs        | Shipping         |
|         142 | Davies      | Shipping         |
|         143 | Matos       | Shipping         |
|         144 | Vargas      | Shipping         |
|         145 | Russell     | Sales            |
|         146 | Partners    | Sales            |
|         147 | Errazuriz   | Sales            |
|         148 | Cambrault   | Sales            |
|         149 | Zlotkey     | Sales            |
|         150 | Tucker      | Sales            |
|         151 | Bernstein   | Sales            |
|         152 | Hall        | Sales            |
|         153 | Olsen       | Sales            |
|         154 | Cambrault   | Sales            |
|         155 | Tuvault     | Sales            |
|         156 | King        | Sales            |
|         157 | Sully       | Sales            |
|         158 | McEwen      | Sales            |
|         159 | Smith       | Sales            |
|         160 | Doran       | Sales            |
|         161 | Sewall      | Sales            |
|         162 | Vishney     | Sales            |
|         163 | Greene      | Sales            |
|         164 | Marvins     | Sales            |
|         165 | Lee         | Sales            |
|         166 | Ande        | Sales            |
|         167 | Banda       | Sales            |
|         168 | Ozer        | Sales            |
|         169 | Bloom       | Sales            |
|         170 | Fox         | Sales            |
|         171 | Smith       | Sales            |
|         172 | Bates       | Sales            |
|         173 | Kumar       | Sales            |
|         174 | Abel        | Sales            |
|         175 | Hutton      | Sales            |
|         176 | Taylor      | Sales            |
|         177 | Livingston  | Sales            |
|         178 | Grant       | NULL             |
|         179 | Johnson     | Sales            |
|         180 | Taylor      | Shipping         |
|         181 | Fleaur      | Shipping         |
|         182 | Sullivan    | Shipping         |
|         183 | Geoni       | Shipping         |
|         184 | Sarchand    | Shipping         |
|         185 | Bull        | Shipping         |
|         186 | Dellinger   | Shipping         |
|         187 | Cabrio      | Shipping         |
|         188 | Chung       | Shipping         |
|         189 | Dilly       | Shipping         |
|         190 | Gates       | Shipping         |
|         191 | Perkins     | Shipping         |
|         192 | Bell        | Shipping         |
|         193 | Everett     | Shipping         |
|         194 | McCain      | Shipping         |
|         195 | Jones       | Shipping         |
|         196 | Walsh       | Shipping         |
|         197 | Feeney      | Shipping         |
|         198 | OConnell    | Shipping         |
|         199 | Grant       | Shipping         |
|         200 | Whalen      | Administration   |
|         201 | Hartstein   | Marketing        |
|         202 | Fay         | Marketing        |
|         203 | Mavris      | Human Resources  |
|         204 | Baer        | Public Relations |
|         205 | Higgins     | Accounting       |
|         206 | Gietz       | Accounting       |
+-------------+-------------+------------------+
107 rows in set (0.00 sec)

mysql> create view view_offices as select first_name,last_namehire_date from employees;
ERROR 1054 (42S22): Unknown column 'last_namehire_date' in 'field list'
mysql> create view view_offices as select first_name,last_name,hire_date from employees;
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+------------------+
| Tables_in_hr     |
+------------------+
| countries        |
| departments      |
| e                |
| emp              |
| emp_details_view |
| employees        |
| job_history      |
| jobs             |
| locations        |
| regions          |
| view_offices     |
+------------------+
11 rows in set (0.00 sec)

mysql> select * from view_offices;
+-------------+-------------+------------+
| first_name  | last_name   | hire_date  |
+-------------+-------------+------------+
| Steven      | King        | 1987-06-17 |
| Neena       | Kochhar     | 1989-09-21 |
| Lex         | De Haan     | 1993-01-13 |
| Alexander   | Hunold      | 1990-01-03 |
| Bruce       | Ernst       | 1991-05-21 |
| David       | Austin      | 1997-06-25 |
| Valli       | Pataballa   | 1998-02-05 |
| Diana       | Lorentz     | 1999-02-07 |
| Nancy       | Greenberg   | 1994-08-17 |
| Daniel      | Faviet      | 1994-08-16 |
| John        | Chen        | 1997-09-28 |
| Ismael      | Sciarra     | 1997-09-30 |
| Jose Manuel | Urman       | 1998-03-07 |
| Luis        | Popp        | 1999-12-07 |
| Den         | Raphaely    | 1994-12-07 |
| Alexander   | Khoo        | 1995-05-18 |
| Shelli      | Baida       | 1997-12-24 |
| Sigal       | Tobias      | 1997-07-24 |
| Guy         | Himuro      | 1998-11-15 |
| Karen       | Colmenares  | 1999-08-10 |
| Matthew     | Weiss       | 1996-07-18 |
| Adam        | Fripp       | 1997-04-10 |
| Payam       | Kaufling    | 1995-05-01 |
| Shanta      | Vollman     | 1997-10-10 |
| Kevin       | Mourgos     | 1999-11-16 |
| Julia       | Nayer       | 1997-07-16 |
| Irene       | Mikkilineni | 1998-09-28 |
| James       | Landry      | 1999-01-14 |
| Steven      | Markle      | 2000-03-08 |
| Laura       | Bissot      | 1997-08-20 |
| Mozhe       | Atkinson    | 1997-10-30 |
| James       | Marlow      | 1997-02-16 |
| TJ          | Olson       | 1999-04-10 |
| Jason       | Mallin      | 1996-06-14 |
| Michael     | Rogers      | 1998-08-26 |
| Ki          | Gee         | 1999-12-12 |
| Hazel       | Philtanker  | 2000-02-06 |
| Renske      | Ladwig      | 1995-07-14 |
| Stephen     | Stiles      | 1997-10-26 |
| John        | Seo         | 1998-02-12 |
| Joshua      | Patel       | 1998-04-06 |
| Trenna      | Rajs        | 1995-10-17 |
| Curtis      | Davies      | 1997-01-29 |
| Randall     | Matos       | 1998-03-15 |
| Peter       | Vargas      | 1998-07-09 |
| John        | Russell     | 1996-10-01 |
| Karen       | Partners    | 1997-01-05 |
| Alberto     | Errazuriz   | 1997-03-10 |
| Gerald      | Cambrault   | 1999-10-15 |
| Eleni       | Zlotkey     | 2000-01-29 |
| Peter       | Tucker      | 1997-01-30 |
| David       | Bernstein   | 1997-03-24 |
| Peter       | Hall        | 1997-08-20 |
| Christopher | Olsen       | 1998-03-30 |
| Nanette     | Cambrault   | 1998-12-09 |
| Oliver      | Tuvault     | 1999-11-23 |
| Janette     | King        | 1996-01-30 |
| Patrick     | Sully       | 1996-03-04 |
| Allan       | McEwen      | 1996-08-01 |
| Lindsey     | Smith       | 1997-03-10 |
| Louise      | Doran       | 1997-12-15 |
| Sarath      | Sewall      | 1998-11-03 |
| Clara       | Vishney     | 1997-11-11 |
| Danielle    | Greene      | 1999-03-19 |
| Mattea      | Marvins     | 2000-01-24 |
| David       | Lee         | 2000-02-23 |
| Sundar      | Ande        | 2000-03-24 |
| Amit        | Banda       | 2000-04-21 |
| Lisa        | Ozer        | 1997-03-11 |
| Harrison    | Bloom       | 1998-03-23 |
| Tayler      | Fox         | 1998-01-24 |
| William     | Smith       | 1999-02-23 |
| Elizabeth   | Bates       | 1999-03-24 |
| Sundita     | Kumar       | 2000-04-21 |
| Ellen       | Abel        | 1996-05-11 |
| Alyssa      | Hutton      | 1997-03-19 |
| Jonathon    | Taylor      | 1998-03-24 |
| Jack        | Livingston  | 1998-04-23 |
| Kimberely   | Grant       | 1999-05-24 |
| Charles     | Johnson     | 2000-01-04 |
| Winston     | Taylor      | 1998-01-24 |
| Jean        | Fleaur      | 1998-02-23 |
| Martha      | Sullivan    | 1999-06-21 |
| Girard      | Geoni       | 2000-02-03 |
| Nandita     | Sarchand    | 1996-01-27 |
| Alexis      | Bull        | 1997-02-20 |
| Julia       | Dellinger   | 1998-06-24 |
| Anthony     | Cabrio      | 1999-02-07 |
| Kelly       | Chung       | 1997-06-14 |
| Jennifer    | Dilly       | 1997-08-13 |
| Timothy     | Gates       | 1998-07-11 |
| Randall     | Perkins     | 1999-12-19 |
| Sarah       | Bell        | 1996-02-04 |
| Britney     | Everett     | 1997-03-03 |
| Samuel      | McCain      | 1998-07-01 |
| Vance       | Jones       | 1999-03-17 |
| Alana       | Walsh       | 1998-04-24 |
| Kevin       | Feeney      | 1998-05-23 |
| Donald      | OConnell    | 1999-06-21 |
| Douglas     | Grant       | 2000-01-13 |
| Jennifer    | Whalen      | 1987-09-17 |
| Michael     | Hartstein   | 1996-02-17 |
| Pat         | Fay         | 1997-08-17 |
| Susan       | Mavris      | 1994-06-07 |
| Hermann     | Baer        | 1994-06-07 |
| Shelley     | Higgins     | 1994-06-07 |
| William     | Gietz       | 1994-06-07 |
+-------------+-------------+------------+
107 rows in set (0.00 sec)

mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee e equi join departments d where e.department_no=d.department-no;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'equi join departments d where e.department_no=d.department-no' at line 1
mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee e equi join departments d where e.department_no=d.department_no;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'equi join departments d where e.department_no=d.department_no' at line 1
mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee e equi join departments d where e.department_no=d.department_no;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'equi join departments d where e.department_no=d.department_no' at line 1
mysql> select * form departments;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form departments' at line 1
mysql> select * form departments;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form departments' at line 1
mysql> use hr;
Database changed
mysql> select * from departments;
+---------------+----------------------+------------+-------------+
| department_id | department_name      | manager_id | location_id |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |       NULL |        1700 |
|           130 | Corporate Tax        |       NULL |        1700 |
|           140 | Control And Credit   |       NULL |        1700 |
|           150 | Shareholder Services |       NULL |        1700 |
|           160 | Benefits             |       NULL |        1700 |
|           170 | Manufacturing        |       NULL |        1700 |
|           180 | Construction         |       NULL |        1700 |
|           190 | Contracting          |       NULL |        1700 |
|           200 | Operations           |       NULL |        1700 |
|           210 | IT Support           |       NULL |        1700 |
|           220 | NOC                  |       NULL |        1700 |
|           230 | IT Helpdesk          |       NULL |        1700 |
|           240 | Government Sales     |       NULL |        1700 |
|           250 | Retail Sales         |       NULL |        1700 |
|           260 | Recruiting           |       NULL |        1700 |
|           270 | Payroll              |       NULL |        1700 |
+---------------+----------------------+------------+-------------+
27 rows in set (0.00 sec)

mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee e equi join departments d where e.department_id=d.department_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'equi join departments d where e.department_id=d.department_id' at line 1
mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employee , departments d where e.department_id=d.department_id;
ERROR 1146 (42S02): Table 'hr.employee' doesn't exist
mysql> create view view_offices_employee as select e.last_name,e.first_name,d.location_id from employees e , departments d where e.department_id=d.department_id;
Query OK, 0 rows affected (0.02 sec)

mysql> select * from view_offices_employee;
+-------------+-------------+-------------+
| last_name   | first_name  | location_id |
+-------------+-------------+-------------+
| Hunold      | Alexander   |        1400 |
| Ernst       | Bruce       |        1400 |
| Austin      | David       |        1400 |
| Pataballa   | Valli       |        1400 |
| Lorentz     | Diana       |        1400 |
| Weiss       | Matthew     |        1500 |
| Fripp       | Adam        |        1500 |
| Kaufling    | Payam       |        1500 |
| Vollman     | Shanta      |        1500 |
| Mourgos     | Kevin       |        1500 |
| Nayer       | Julia       |        1500 |
| Mikkilineni | Irene       |        1500 |
| Landry      | James       |        1500 |
| Markle      | Steven      |        1500 |
| Bissot      | Laura       |        1500 |
| Atkinson    | Mozhe       |        1500 |
| Marlow      | James       |        1500 |
| Olson       | TJ          |        1500 |
| Mallin      | Jason       |        1500 |
| Rogers      | Michael     |        1500 |
| Gee         | Ki          |        1500 |
| Philtanker  | Hazel       |        1500 |
| Ladwig      | Renske      |        1500 |
| Stiles      | Stephen     |        1500 |
| Seo         | John        |        1500 |
| Patel       | Joshua      |        1500 |
| Rajs        | Trenna      |        1500 |
| Davies      | Curtis      |        1500 |
| Matos       | Randall     |        1500 |
| Vargas      | Peter       |        1500 |
| Taylor      | Winston     |        1500 |
| Fleaur      | Jean        |        1500 |
| Sullivan    | Martha      |        1500 |
| Geoni       | Girard      |        1500 |
| Sarchand    | Nandita     |        1500 |
| Bull        | Alexis      |        1500 |
| Dellinger   | Julia       |        1500 |
| Cabrio      | Anthony     |        1500 |
| Chung       | Kelly       |        1500 |
| Dilly       | Jennifer    |        1500 |
| Gates       | Timothy     |        1500 |
| Perkins     | Randall     |        1500 |
| Bell        | Sarah       |        1500 |
| Everett     | Britney     |        1500 |
| McCain      | Samuel      |        1500 |
| Jones       | Vance       |        1500 |
| Walsh       | Alana       |        1500 |
| Feeney      | Kevin       |        1500 |
| OConnell    | Donald      |        1500 |
| Grant       | Douglas     |        1500 |
| Whalen      | Jennifer    |        1700 |
| Raphaely    | Den         |        1700 |
| Khoo        | Alexander   |        1700 |
| Baida       | Shelli      |        1700 |
| Tobias      | Sigal       |        1700 |
| Himuro      | Guy         |        1700 |
| Colmenares  | Karen       |        1700 |
| King        | Steven      |        1700 |
| Kochhar     | Neena       |        1700 |
| De Haan     | Lex         |        1700 |
| Greenberg   | Nancy       |        1700 |
| Faviet      | Daniel      |        1700 |
| Chen        | John        |        1700 |
| Sciarra     | Ismael      |        1700 |
| Urman       | Jose Manuel |        1700 |
| Popp        | Luis        |        1700 |
| Higgins     | Shelley     |        1700 |
| Gietz       | William     |        1700 |
| Hartstein   | Michael     |        1800 |
| Fay         | Pat         |        1800 |
| Mavris      | Susan       |        2400 |
| Russell     | John        |        2500 |
| Partners    | Karen       |        2500 |
| Errazuriz   | Alberto     |        2500 |
| Cambrault   | Gerald      |        2500 |
| Zlotkey     | Eleni       |        2500 |
| Tucker      | Peter       |        2500 |
| Bernstein   | David       |        2500 |
| Hall        | Peter       |        2500 |
| Olsen       | Christopher |        2500 |
| Cambrault   | Nanette     |        2500 |
| Tuvault     | Oliver      |        2500 |
| King        | Janette     |        2500 |
| Sully       | Patrick     |        2500 |
| McEwen      | Allan       |        2500 |
| Smith       | Lindsey     |        2500 |
| Doran       | Louise      |        2500 |
| Sewall      | Sarath      |        2500 |
| Vishney     | Clara       |        2500 |
| Greene      | Danielle    |        2500 |
| Marvins     | Mattea      |        2500 |
| Lee         | David       |        2500 |
| Ande        | Sundar      |        2500 |
| Banda       | Amit        |        2500 |
| Ozer        | Lisa        |        2500 |
| Bloom       | Harrison    |        2500 |
| Fox         | Tayler      |        2500 |
| Smith       | William     |        2500 |
| Bates       | Elizabeth   |        2500 |
| Kumar       | Sundita     |        2500 |
| Abel        | Ellen       |        2500 |
| Hutton      | Alyssa      |        2500 |
| Taylor      | Jonathon    |        2500 |
| Livingston  | Jack        |        2500 |
| Johnson     | Charles     |        2500 |
| Baer        | Hermann     |        2700 |
+-------------+-------------+-------------+
106 rows in set (0.00 sec)

mysql> create view view_emp_details e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employees e1 where e.employee_id=e1.manager_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employ' at line 1
mysql> create view view_emp_details e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employees e1 where e.employee_id=e1.manager_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employ' at line 1
mysql> create view view_emp_details as select e.first_name,e.last_name,e1.first_name,e1.last_name from employees e join employees e1 where e.employee_id=e1.manager_id;
ERROR 1060 (42S21): Duplicate column name 'first_name'
mysql> create view view_emp_details as select e.first_name,e.last_name,e1.first_name as name,e1.last_name  as name1 from employees e join employees e1 where e.employee_id=e1.manager_id;
Query OK, 0 rows affected (0.01 sec)

mysql> select  * from employees;
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
| employee_id | first_name  | last_name   | email    | phone_number       | hire_date  | job_id     | salary   | commission_pct | manager_id | department_id |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
|         100 | Steven      | King        | SKING    | 515.123.4567       | 1987-06-17 | AD_PRES    | 24000.00 |           NULL |       NULL |            90 |
|         101 | Neena       | Kochhar     | NKOCHHAR | 515.123.4568       | 1989-09-21 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         102 | Lex         | De Haan     | LDEHAAN  | 515.123.4569       | 1993-01-13 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         103 | Alexander   | Hunold      | AHUNOLD  | 590.423.4567       | 1990-01-03 | IT_PROG    |  9000.00 |           NULL |        102 |            60 |
|         104 | Bruce       | Ernst       | BERNST   | 590.423.4568       | 1991-05-21 | IT_PROG    |  6000.00 |           NULL |        103 |            60 |
|         105 | David       | Austin      | DAUSTIN  | 590.423.4569       | 1997-06-25 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         106 | Valli       | Pataballa   | VPATABAL | 590.423.4560       | 1998-02-05 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         107 | Diana       | Lorentz     | DLORENTZ | 590.423.5567       | 1999-02-07 | IT_PROG    |  4200.00 |           NULL |        103 |            60 |
|         108 | Nancy       | Greenberg   | NGREENBE | 515.124.4569       | 1994-08-17 | FI_MGR     | 12000.00 |           NULL |        101 |           100 |
|         109 | Daniel      | Faviet      | DFAVIET  | 515.124.4169       | 1994-08-16 | FI_ACCOUNT |  9000.00 |           NULL |        108 |           100 |
|         110 | John        | Chen        | JCHEN    | 515.124.4269       | 1997-09-28 | FI_ACCOUNT |  8200.00 |           NULL |        108 |           100 |
|         111 | Ismael      | Sciarra     | ISCIARRA | 515.124.4369       | 1997-09-30 | FI_ACCOUNT |  7700.00 |           NULL |        108 |           100 |
|         112 | Jose Manuel | Urman       | JMURMAN  | 515.124.4469       | 1998-03-07 | FI_ACCOUNT |  7800.00 |           NULL |        108 |           100 |
|         113 | Luis        | Popp        | LPOPP    | 515.124.4567       | 1999-12-07 | FI_ACCOUNT |  6900.00 |           NULL |        108 |           100 |
|         114 | Den         | Raphaely    | DRAPHEAL | 515.127.4561       | 1994-12-07 | PU_MAN     | 11000.00 |           NULL |        100 |            30 |
|         115 | Alexander   | Khoo        | AKHOO    | 515.127.4562       | 1995-05-18 | PU_CLERK   |  3100.00 |           NULL |        114 |            30 |
|         116 | Shelli      | Baida       | SBAIDA   | 515.127.4563       | 1997-12-24 | PU_CLERK   |  2900.00 |           NULL |        114 |            30 |
|         117 | Sigal       | Tobias      | STOBIAS  | 515.127.4564       | 1997-07-24 | PU_CLERK   |  2800.00 |           NULL |        114 |            30 |
|         118 | Guy         | Himuro      | GHIMURO  | 515.127.4565       | 1998-11-15 | PU_CLERK   |  2600.00 |           NULL |        114 |            30 |
|         119 | Karen       | Colmenares  | KCOLMENA | 515.127.4566       | 1999-08-10 | PU_CLERK   |  2500.00 |           NULL |        114 |            30 |
|         120 | Matthew     | Weiss       | MWEISS   | 650.123.1234       | 1996-07-18 | ST_MAN     |  8000.00 |           NULL |        100 |            50 |
|         121 | Adam        | Fripp       | AFRIPP   | 650.123.2234       | 1997-04-10 | ST_MAN     |  8200.00 |           NULL |        100 |            50 |
|         122 | Payam       | Kaufling    | PKAUFLIN | 650.123.3234       | 1995-05-01 | ST_MAN     |  7900.00 |           NULL |        100 |            50 |
|         123 | Shanta      | Vollman     | SVOLLMAN | 650.123.4234       | 1997-10-10 | ST_MAN     |  6500.00 |           NULL |        100 |            50 |
|         124 | Kevin       | Mourgos     | KMOURGOS | 650.123.5234       | 1999-11-16 | ST_MAN     |  5800.00 |           NULL |        100 |            50 |
|         125 | Julia       | Nayer       | JNAYER   | 650.124.1214       | 1997-07-16 | ST_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         126 | Irene       | Mikkilineni | IMIKKILI | 650.124.1224       | 1998-09-28 | ST_CLERK   |  2700.00 |           NULL |        120 |            50 |
|         127 | James       | Landry      | JLANDRY  | 650.124.1334       | 1999-01-14 | ST_CLERK   |  2400.00 |           NULL |        120 |            50 |
|         128 | Steven      | Markle      | SMARKLE  | 650.124.1434       | 2000-03-08 | ST_CLERK   |  2200.00 |           NULL |        120 |            50 |
|         129 | Laura       | Bissot      | LBISSOT  | 650.124.5234       | 1997-08-20 | ST_CLERK   |  3300.00 |           NULL |        121 |            50 |
|         130 | Mozhe       | Atkinson    | MATKINSO | 650.124.6234       | 1997-10-30 | ST_CLERK   |  2800.00 |           NULL |        121 |            50 |
|         131 | James       | Marlow      | JAMRLOW  | 650.124.7234       | 1997-02-16 | ST_CLERK   |  2500.00 |           NULL |        121 |            50 |
|         132 | TJ          | Olson       | TJOLSON  | 650.124.8234       | 1999-04-10 | ST_CLERK   |  2100.00 |           NULL |        121 |            50 |
|         133 | Jason       | Mallin      | JMALLIN  | 650.127.1934       | 1996-06-14 | ST_CLERK   |  3300.00 |           NULL |        122 |            50 |
|         134 | Michael     | Rogers      | MROGERS  | 650.127.1834       | 1998-08-26 | ST_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         135 | Ki          | Gee         | KGEE     | 650.127.1734       | 1999-12-12 | ST_CLERK   |  2400.00 |           NULL |        122 |            50 |
|         136 | Hazel       | Philtanker  | HPHILTAN | 650.127.1634       | 2000-02-06 | ST_CLERK   |  2200.00 |           NULL |        122 |            50 |
|         137 | Renske      | Ladwig      | RLADWIG  | 650.121.1234       | 1995-07-14 | ST_CLERK   |  3600.00 |           NULL |        123 |            50 |
|         138 | Stephen     | Stiles      | SSTILES  | 650.121.2034       | 1997-10-26 | ST_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         139 | John        | Seo         | JSEO     | 650.121.2019       | 1998-02-12 | ST_CLERK   |  2700.00 |           NULL |        123 |            50 |
|         140 | Joshua      | Patel       | JPATEL   | 650.121.1834       | 1998-04-06 | ST_CLERK   |  2500.00 |           NULL |        123 |            50 |
|         141 | Trenna      | Rajs        | TRAJS    | 650.121.8009       | 1995-10-17 | ST_CLERK   |  3500.00 |           NULL |        124 |            50 |
|         142 | Curtis      | Davies      | CDAVIES  | 650.121.2994       | 1997-01-29 | ST_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         143 | Randall     | Matos       | RMATOS   | 650.121.2874       | 1998-03-15 | ST_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         144 | Peter       | Vargas      | PVARGAS  | 650.121.2004       | 1998-07-09 | ST_CLERK   |  2500.00 |           NULL |        124 |            50 |
|         145 | John        | Russell     | JRUSSEL  | 011.44.1344.429268 | 1996-10-01 | SA_MAN     | 14000.00 |           0.40 |        100 |            80 |
|         146 | Karen       | Partners    | KPARTNER | 011.44.1344.467268 | 1997-01-05 | SA_MAN     | 13500.00 |           0.30 |        100 |            80 |
|         147 | Alberto     | Errazuriz   | AERRAZUR | 011.44.1344.429278 | 1997-03-10 | SA_MAN     | 12000.00 |           0.30 |        100 |            80 |
|         148 | Gerald      | Cambrault   | GCAMBRAU | 011.44.1344.619268 | 1999-10-15 | SA_MAN     | 11000.00 |           0.30 |        100 |            80 |
|         149 | Eleni       | Zlotkey     | EZLOTKEY | 011.44.1344.429018 | 2000-01-29 | SA_MAN     | 10500.00 |           0.20 |        100 |            80 |
|         150 | Peter       | Tucker      | PTUCKER  | 011.44.1344.129268 | 1997-01-30 | SA_REP     | 10000.00 |           0.30 |        145 |            80 |
|         151 | David       | Bernstein   | DBERNSTE | 011.44.1344.345268 | 1997-03-24 | SA_REP     |  9500.00 |           0.25 |        145 |            80 |
|         152 | Peter       | Hall        | PHALL    | 011.44.1344.478968 | 1997-08-20 | SA_REP     |  9000.00 |           0.25 |        145 |            80 |
|         153 | Christopher | Olsen       | COLSEN   | 011.44.1344.498718 | 1998-03-30 | SA_REP     |  8000.00 |           0.20 |        145 |            80 |
|         154 | Nanette     | Cambrault   | NCAMBRAU | 011.44.1344.987668 | 1998-12-09 | SA_REP     |  7500.00 |           0.20 |        145 |            80 |
|         155 | Oliver      | Tuvault     | OTUVAULT | 011.44.1344.486508 | 1999-11-23 | SA_REP     |  7000.00 |           0.15 |        145 |            80 |
|         156 | Janette     | King        | JKING    | 011.44.1345.429268 | 1996-01-30 | SA_REP     | 10000.00 |           0.35 |        146 |            80 |
|         157 | Patrick     | Sully       | PSULLY   | 011.44.1345.929268 | 1996-03-04 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         158 | Allan       | McEwen      | AMCEWEN  | 011.44.1345.829268 | 1996-08-01 | SA_REP     |  9000.00 |           0.35 |        146 |            80 |
|         159 | Lindsey     | Smith       | LSMITH   | 011.44.1345.729268 | 1997-03-10 | SA_REP     |  8000.00 |           0.30 |        146 |            80 |
|         160 | Louise      | Doran       | LDORAN   | 011.44.1345.629268 | 1997-12-15 | SA_REP     |  7500.00 |           0.30 |        146 |            80 |
|         161 | Sarath      | Sewall      | SSEWALL  | 011.44.1345.529268 | 1998-11-03 | SA_REP     |  7000.00 |           0.25 |        146 |            80 |
|         162 | Clara       | Vishney     | CVISHNEY | 011.44.1346.129268 | 1997-11-11 | SA_REP     | 10500.00 |           0.25 |        147 |            80 |
|         163 | Danielle    | Greene      | DGREENE  | 011.44.1346.229268 | 1999-03-19 | SA_REP     |  9500.00 |           0.15 |        147 |            80 |
|         164 | Mattea      | Marvins     | MMARVINS | 011.44.1346.329268 | 2000-01-24 | SA_REP     |  7200.00 |           0.10 |        147 |            80 |
|         165 | David       | Lee         | DLEE     | 011.44.1346.529268 | 2000-02-23 | SA_REP     |  6800.00 |           0.10 |        147 |            80 |
|         166 | Sundar      | Ande        | SANDE    | 011.44.1346.629268 | 2000-03-24 | SA_REP     |  6400.00 |           0.10 |        147 |            80 |
|         167 | Amit        | Banda       | ABANDA   | 011.44.1346.729268 | 2000-04-21 | SA_REP     |  6200.00 |           0.10 |        147 |            80 |
|         168 | Lisa        | Ozer        | LOZER    | 011.44.1343.929268 | 1997-03-11 | SA_REP     | 11500.00 |           0.25 |        148 |            80 |
|         169 | Harrison    | Bloom       | HBLOOM   | 011.44.1343.829268 | 1998-03-23 | SA_REP     | 10000.00 |           0.20 |        148 |            80 |
|         170 | Tayler      | Fox         | TFOX     | 011.44.1343.729268 | 1998-01-24 | SA_REP     |  9600.00 |           0.20 |        148 |            80 |
|         171 | William     | Smith       | WSMITH   | 011.44.1343.629268 | 1999-02-23 | SA_REP     |  7400.00 |           0.15 |        148 |            80 |
|         172 | Elizabeth   | Bates       | EBATES   | 011.44.1343.529268 | 1999-03-24 | SA_REP     |  7300.00 |           0.15 |        148 |            80 |
|         173 | Sundita     | Kumar       | SKUMAR   | 011.44.1343.329268 | 2000-04-21 | SA_REP     |  6100.00 |           0.10 |        148 |            80 |
|         174 | Ellen       | Abel        | EABEL    | 011.44.1644.429267 | 1996-05-11 | SA_REP     | 11000.00 |           0.30 |        149 |            80 |
|         175 | Alyssa      | Hutton      | AHUTTON  | 011.44.1644.429266 | 1997-03-19 | SA_REP     |  8800.00 |           0.25 |        149 |            80 |
|         176 | Jonathon    | Taylor      | JTAYLOR  | 011.44.1644.429265 | 1998-03-24 | SA_REP     |  8600.00 |           0.20 |        149 |            80 |
|         177 | Jack        | Livingston  | JLIVINGS | 011.44.1644.429264 | 1998-04-23 | SA_REP     |  8400.00 |           0.20 |        149 |            80 |
|         178 | Kimberely   | Grant       | KGRANT   | 011.44.1644.429263 | 1999-05-24 | SA_REP     |  7000.00 |           0.15 |        149 |          NULL |
|         179 | Charles     | Johnson     | CJOHNSON | 011.44.1644.429262 | 2000-01-04 | SA_REP     |  6200.00 |           0.10 |        149 |            80 |
|         180 | Winston     | Taylor      | WTAYLOR  | 650.507.9876       | 1998-01-24 | SH_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         181 | Jean        | Fleaur      | JFLEAUR  | 650.507.9877       | 1998-02-23 | SH_CLERK   |  3100.00 |           NULL |        120 |            50 |
|         182 | Martha      | Sullivan    | MSULLIVA | 650.507.9878       | 1999-06-21 | SH_CLERK   |  2500.00 |           NULL |        120 |            50 |
|         183 | Girard      | Geoni       | GGEONI   | 650.507.9879       | 2000-02-03 | SH_CLERK   |  2800.00 |           NULL |        120 |            50 |
|         184 | Nandita     | Sarchand    | NSARCHAN | 650.509.1876       | 1996-01-27 | SH_CLERK   |  4200.00 |           NULL |        121 |            50 |
|         185 | Alexis      | Bull        | ABULL    | 650.509.2876       | 1997-02-20 | SH_CLERK   |  4100.00 |           NULL |        121 |            50 |
|         186 | Julia       | Dellinger   | JDELLING | 650.509.3876       | 1998-06-24 | SH_CLERK   |  3400.00 |           NULL |        121 |            50 |
|         187 | Anthony     | Cabrio      | ACABRIO  | 650.509.4876       | 1999-02-07 | SH_CLERK   |  3000.00 |           NULL |        121 |            50 |
|         188 | Kelly       | Chung       | KCHUNG   | 650.505.1876       | 1997-06-14 | SH_CLERK   |  3800.00 |           NULL |        122 |            50 |
|         189 | Jennifer    | Dilly       | JDILLY   | 650.505.2876       | 1997-08-13 | SH_CLERK   |  3600.00 |           NULL |        122 |            50 |
|         190 | Timothy     | Gates       | TGATES   | 650.505.3876       | 1998-07-11 | SH_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         191 | Randall     | Perkins     | RPERKINS | 650.505.4876       | 1999-12-19 | SH_CLERK   |  2500.00 |           NULL |        122 |            50 |
|         192 | Sarah       | Bell        | SBELL    | 650.501.1876       | 1996-02-04 | SH_CLERK   |  4000.00 |           NULL |        123 |            50 |
|         193 | Britney     | Everett     | BEVERETT | 650.501.2876       | 1997-03-03 | SH_CLERK   |  3900.00 |           NULL |        123 |            50 |
|         194 | Samuel      | McCain      | SMCCAIN  | 650.501.3876       | 1998-07-01 | SH_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         195 | Vance       | Jones       | VJONES   | 650.501.4876       | 1999-03-17 | SH_CLERK   |  2800.00 |           NULL |        123 |            50 |
|         196 | Alana       | Walsh       | AWALSH   | 650.507.9811       | 1998-04-24 | SH_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         197 | Kevin       | Feeney      | KFEENEY  | 650.507.9822       | 1998-05-23 | SH_CLERK   |  3000.00 |           NULL |        124 |            50 |
|         198 | Donald      | OConnell    | DOCONNEL | 650.507.9833       | 1999-06-21 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         199 | Douglas     | Grant       | DGRANT   | 650.507.9844       | 2000-01-13 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         200 | Jennifer    | Whalen      | JWHALEN  | 515.123.4444       | 1987-09-17 | AD_ASST    |  4400.00 |           NULL |        101 |            10 |
|         201 | Michael     | Hartstein   | MHARTSTE | 515.123.5555       | 1996-02-17 | MK_MAN     | 13000.00 |           NULL |        100 |            20 |
|         202 | Pat         | Fay         | PFAY     | 603.123.6666       | 1997-08-17 | MK_REP     |  6000.00 |           NULL |        201 |            20 |
|         203 | Susan       | Mavris      | SMAVRIS  | 515.123.7777       | 1994-06-07 | HR_REP     |  6500.00 |           NULL |        101 |            40 |
|         204 | Hermann     | Baer        | HBAER    | 515.123.8888       | 1994-06-07 | PR_REP     | 10000.00 |           NULL |        101 |            70 |
|         205 | Shelley     | Higgins     | SHIGGINS | 515.123.8080       | 1994-06-07 | AC_MGR     | 12000.00 |           NULL |        101 |           110 |
|         206 | William     | Gietz       | WGIETZ   | 51hr5.123.8181     | 1994-06-07 | AC_ACCOUNT |  8300.00 |           NULL |        205 |           110 |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
107 rows in set (0.00 sec)

mysql> select * from view_emp_offices;
ERROR 1146 (42S02): Table 'hr.view_emp_offices' doesn't exist
mysql> select * from view_emp_details;
+------------+-----------+-------------+-------------+
| first_name | last_name | name        | name1       |
+------------+-----------+-------------+-------------+
| Steven     | King      | Neena       | Kochhar     |
| Steven     | King      | Lex         | De Haan     |
| Lex        | De Haan   | Alexander   | Hunold      |
| Alexander  | Hunold    | Bruce       | Ernst       |
| Alexander  | Hunold    | David       | Austin      |
| Alexander  | Hunold    | Valli       | Pataballa   |
| Alexander  | Hunold    | Diana       | Lorentz     |
| Neena      | Kochhar   | Nancy       | Greenberg   |
| Nancy      | Greenberg | Daniel      | Faviet      |
| Nancy      | Greenberg | John        | Chen        |
| Nancy      | Greenberg | Ismael      | Sciarra     |
| Nancy      | Greenberg | Jose Manuel | Urman       |
| Nancy      | Greenberg | Luis        | Popp        |
| Steven     | King      | Den         | Raphaely    |
| Den        | Raphaely  | Alexander   | Khoo        |
| Den        | Raphaely  | Shelli      | Baida       |
| Den        | Raphaely  | Sigal       | Tobias      |
| Den        | Raphaely  | Guy         | Himuro      |
| Den        | Raphaely  | Karen       | Colmenares  |
| Steven     | King      | Matthew     | Weiss       |
| Steven     | King      | Adam        | Fripp       |
| Steven     | King      | Payam       | Kaufling    |
| Steven     | King      | Shanta      | Vollman     |
| Steven     | King      | Kevin       | Mourgos     |
| Matthew    | Weiss     | Julia       | Nayer       |
| Matthew    | Weiss     | Irene       | Mikkilineni |
| Matthew    | Weiss     | James       | Landry      |
| Matthew    | Weiss     | Steven      | Markle      |
| Adam       | Fripp     | Laura       | Bissot      |
| Adam       | Fripp     | Mozhe       | Atkinson    |
| Adam       | Fripp     | James       | Marlow      |
| Adam       | Fripp     | TJ          | Olson       |
| Payam      | Kaufling  | Jason       | Mallin      |
| Payam      | Kaufling  | Michael     | Rogers      |
| Payam      | Kaufling  | Ki          | Gee         |
| Payam      | Kaufling  | Hazel       | Philtanker  |
| Shanta     | Vollman   | Renske      | Ladwig      |
| Shanta     | Vollman   | Stephen     | Stiles      |
| Shanta     | Vollman   | John        | Seo         |
| Shanta     | Vollman   | Joshua      | Patel       |
| Kevin      | Mourgos   | Trenna      | Rajs        |
| Kevin      | Mourgos   | Curtis      | Davies      |
| Kevin      | Mourgos   | Randall     | Matos       |
| Kevin      | Mourgos   | Peter       | Vargas      |
| Steven     | King      | John        | Russell     |
| Steven     | King      | Karen       | Partners    |
| Steven     | King      | Alberto     | Errazuriz   |
| Steven     | King      | Gerald      | Cambrault   |
| Steven     | King      | Eleni       | Zlotkey     |
| John       | Russell   | Peter       | Tucker      |
| John       | Russell   | David       | Bernstein   |
| John       | Russell   | Peter       | Hall        |
| John       | Russell   | Christopher | Olsen       |
| John       | Russell   | Nanette     | Cambrault   |
| John       | Russell   | Oliver      | Tuvault     |
| Karen      | Partners  | Janette     | King        |
| Karen      | Partners  | Patrick     | Sully       |
| Karen      | Partners  | Allan       | McEwen      |
| Karen      | Partners  | Lindsey     | Smith       |
| Karen      | Partners  | Louise      | Doran       |
| Karen      | Partners  | Sarath      | Sewall      |
| Alberto    | Errazuriz | Clara       | Vishney     |
| Alberto    | Errazuriz | Danielle    | Greene      |
| Alberto    | Errazuriz | Mattea      | Marvins     |
| Alberto    | Errazuriz | David       | Lee         |
| Alberto    | Errazuriz | Sundar      | Ande        |
| Alberto    | Errazuriz | Amit        | Banda       |
| Gerald     | Cambrault | Lisa        | Ozer        |
| Gerald     | Cambrault | Harrison    | Bloom       |
| Gerald     | Cambrault | Tayler      | Fox         |
| Gerald     | Cambrault | William     | Smith       |
| Gerald     | Cambrault | Elizabeth   | Bates       |
| Gerald     | Cambrault | Sundita     | Kumar       |
| Eleni      | Zlotkey   | Ellen       | Abel        |
| Eleni      | Zlotkey   | Alyssa      | Hutton      |
| Eleni      | Zlotkey   | Jonathon    | Taylor      |
| Eleni      | Zlotkey   | Jack        | Livingston  |
| Eleni      | Zlotkey   | Kimberely   | Grant       |
| Eleni      | Zlotkey   | Charles     | Johnson     |
| Matthew    | Weiss     | Winston     | Taylor      |
| Matthew    | Weiss     | Jean        | Fleaur      |
| Matthew    | Weiss     | Martha      | Sullivan    |
| Matthew    | Weiss     | Girard      | Geoni       |
| Adam       | Fripp     | Nandita     | Sarchand    |
| Adam       | Fripp     | Alexis      | Bull        |
| Adam       | Fripp     | Julia       | Dellinger   |
| Adam       | Fripp     | Anthony     | Cabrio      |
| Payam      | Kaufling  | Kelly       | Chung       |
| Payam      | Kaufling  | Jennifer    | Dilly       |
| Payam      | Kaufling  | Timothy     | Gates       |
| Payam      | Kaufling  | Randall     | Perkins     |
| Shanta     | Vollman   | Sarah       | Bell        |
| Shanta     | Vollman   | Britney     | Everett     |
| Shanta     | Vollman   | Samuel      | McCain      |
| Shanta     | Vollman   | Vance       | Jones       |
| Kevin      | Mourgos   | Alana       | Walsh       |
| Kevin      | Mourgos   | Kevin       | Feeney      |
| Kevin      | Mourgos   | Donald      | OConnell    |
| Kevin      | Mourgos   | Douglas     | Grant       |
| Neena      | Kochhar   | Jennifer    | Whalen      |
| Steven     | King      | Michael     | Hartstein   |
| Michael    | Hartstein | Pat         | Fay         |
| Neena      | Kochhar   | Susan       | Mavris      |
| Neena      | Kochhar   | Hermann     | Baer        |
| Neena      | Kochhar   | Shelley     | Higgins     |
| Shelley    | Higgins   | William     | Gietz       |
+------------+-----------+-------------+-------------+
106 rows in set (0.00 sec)

mysql> select * from emp;
+------+------+
| name | age  |
+------+------+
| def  |   10 |
| abc  |    2 |
+------+------+
2 rows in set (0.00 sec)

mysql> create table emp1(emp_id int primary ,name varchar(27));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',name varchar(27))' at line 1
mysql> create table emp1(emp_id int primary  key,name varchar(27));
Query OK, 0 rows affected (0.06 sec)

mysql> create index index1 on emp1(name);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+------+------+
| name | age  |
+------+------+
| def  |   10 |
| abc  |    2 |
+------+------+
2 rows in set (0.00 sec)

mysql> select * from emp1;
Empty set (0.00 sec)

mysql> show tables;
+-----------------------+
| Tables_in_hr          |
+-----------------------+
| countries             |
| departments           |
| e                     |
| emp                   |
| emp1                  |
| emp_details_view      |
| employees             |
| job_history           |
| jobs                  |
| locations             |
| regions               |
| view_emp_details      |
| view_offices          |
| view_offices_employee |
+-----------------------+
14 rows in set (0.00 sec)

mysql> desc index1;
ERROR 1146 (42S02): Table 'hr.index1' doesn't exist
mysql> use hr;
Database changed
mysql> create table emp1(emp_id int primary ,name varchar(27));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',name varchar(27))' at line 1
mysql> create table emp1(emp_id int primary key,name varchar(27));
ERROR 1050 (42S01): Table 'emp1' already exists
mysql> create table emp2(emp_id int primary key,name varchar(27));
Query OK, 0 rows affected (0.05 sec)

mysql> create index index_details on emp2(name);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc emp2;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| emp_id | int(11)     | NO   | PRI | NULL    |       |
| name   | varchar(27) | YES  | MUL | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table emp2 drop index index_details;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc emp2;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| emp_id | int(11)     | NO   | PRI | NULL    |       |
| name   | varchar(27) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create unique index index_details on emp2(name);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select 8 from course_onfo;
ERROR 1146 (42S02): Table 'hr.course_onfo' doesn't exist
mysql> select * from course_info;
ERROR 1146 (42S02): Table 'hr.course_info' doesn't exist
mysql> use subhashini;
Database changed
mysql> select * from couse_info;
ERROR 1146 (42S02): Table 'subhashini.couse_info' doesn't exist
mysql> use subha;
Database changed
mysql> select * from course_info;
ERROR 1146 (42S02): Table 'subha.course_info' doesn't exist
mysql> use subhashini;
Database changed
mysql> select * from course_info;
+-------------+-------------+--------------------+-------------------+-----------------+--------------------+-------------+----------+
| course_code | course_name | course_description | course_start_date | course_duration | no_of_participants | course_type | discount |
+-------------+-------------+--------------------+-------------------+-----------------+--------------------+-------------+----------+
| 167         | SAP         | deleloper          | 2019-06-20        |               8 |                 40 | fd          | NULL     |
| FS0816      | FUllstack   | Developer          | 2019-06-10        |               6 |                 18 | orl         | NULL     |
+-------------+-------------+--------------------+-------------------+-----------------+--------------------+-------------+----------+
2 rows in set (0.00 sec)

mysql> create view course_info_view as select course_code,course_name,course_duration where course_code=167;
ERROR 1054 (42S22): Unknown column 'course_code' in 'field list'
mysql> create view course_info_view as select course_code,course_name,course_duration from course_info  where course_code=167;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from course_info_view;
+-------------+-------------+-----------------+
| course_code | course_name | course_duration |
+-------------+-------------+-----------------+
| 167         | SAP         |               8 |
+-------------+-------------+-----------------+
1 row in set, 1 warning (0.00 sec)

mysql> create table course_fees(base_fees int,special_fees int);
Query OK, 0 rows affected (0.07 sec)

mysql> create view courseinfo_coursefee_view as select c.course_code,c.course_name,f.base_fees,f.specials from course_info c inner join course_fees f;
ERROR 1054 (42S22): Unknown column 'f.specials' in 'field list'
mysql> create view courseinfo_coursefee_view as select c.course_code,c.course_name,f.base_fees,f.specia_fees from course_info c inner join course_fees f;
ERROR 1054 (42S22): Unknown column 'f.specia_fees' in 'field list'
mysql> create view courseinfo_coursefee_view as select c.course_code,c.course_name,f.base_fees,f.special_fees from course_info c inner join course_fees f;
Query OK, 0 rows affected (0.01 sec)

mysql> insert into course_fees(23,45);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '23,45)' at line 1
mysql> insert into course_fees values(23,45);
Query OK, 1 row affected (0.01 sec)

mysql> drop view courseinfo_coursefee_view;
Query OK, 0 rows affected (0.01 sec)

mysql> drop view course_info_view;
Query OK, 0 rows affected (0.01 sec)

mysql> create index course_des_index on course_info(course_description);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> drop index course_des_index;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> drop index course_des_index;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> alter table course_info drop index course_des_index;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create unique index index_unique on course_info(course_description);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from index_unique;
ERROR 1146 (42S02): Table 'subhashini.index_unique' doesn't exist
mysql> select * from index_unique;
ERROR 1146 (42S02): Table 'subhashini.index_unique' doesn't exist
mysql> create view employee_vu as select employee_id,last_name,department_id from employees;
ERROR 1054 (42S22): Unknown column 'employee_id' in 'field list'
mysql> select * from employees;
Empty set (0.00 sec)

mysql> use hr;
Database changed
mysql> create view employee_vu as select employee_id,last_name,department_id from employees;
Query OK, 0 rows affected (0.01 sec)

mysql> select employee_id,department_id from employee_vu;
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
|         178 |          NULL |
|         200 |            10 |
|         201 |            20 |
|         202 |            20 |
|         114 |            30 |
|         115 |            30 |
|         116 |            30 |
|         117 |            30 |
|         118 |            30 |
|         119 |            30 |
|         203 |            40 |
|         120 |            50 |
|         121 |            50 |
|         122 |            50 |
|         123 |            50 |
|         124 |            50 |
|         125 |            50 |
|         126 |            50 |
|         127 |            50 |
|         128 |            50 |
|         129 |            50 |
|         130 |            50 |
|         131 |            50 |
|         132 |            50 |
|         133 |            50 |
|         134 |            50 |
|         135 |            50 |
|         136 |            50 |
|         137 |            50 |
|         138 |            50 |
|         139 |            50 |
|         140 |            50 |
|         141 |            50 |
|         142 |            50 |
|         143 |            50 |
|         144 |            50 |
|         180 |            50 |
|         181 |            50 |
|         182 |            50 |
|         183 |            50 |
|         184 |            50 |
|         185 |            50 |
|         186 |            50 |
|         187 |            50 |
|         188 |            50 |
|         189 |            50 |
|         190 |            50 |
|         191 |            50 |
|         192 |            50 |
|         193 |            50 |
|         194 |            50 |
|         195 |            50 |
|         196 |            50 |
|         197 |            50 |
|         198 |            50 |
|         199 |            50 |
|         103 |            60 |
|         104 |            60 |
|         105 |            60 |
|         106 |            60 |
|         107 |            60 |
|         204 |            70 |
|         145 |            80 |
|         146 |            80 |
|         147 |            80 |
|         148 |            80 |
|         149 |            80 |
|         150 |            80 |
|         151 |            80 |
|         152 |            80 |
|         153 |            80 |
|         154 |            80 |
|         155 |            80 |
|         156 |            80 |
|         157 |            80 |
|         158 |            80 |
|         159 |            80 |
|         160 |            80 |
|         161 |            80 |
|         162 |            80 |
|         163 |            80 |
|         164 |            80 |
|         165 |            80 |
|         166 |            80 |
|         167 |            80 |
|         168 |            80 |
|         169 |            80 |
|         170 |            80 |
|         171 |            80 |
|         172 |            80 |
|         173 |            80 |
|         174 |            80 |
|         175 |            80 |
|         176 |            80 |
|         177 |            80 |
|         179 |            80 |
|         100 |            90 |
|         101 |            90 |
|         102 |            90 |
|         108 |           100 |
|         109 |           100 |
|         110 |           100 |
|         111 |           100 |
|         112 |           100 |
|         113 |           100 |
|         205 |           110 |
|         206 |           110 |
+-------------+---------------+
107 rows in set (0.00 sec)

mysql> select last_name,department_id from employee_vu;
+-------------+---------------+
| last_name   | department_id |
+-------------+---------------+
| King        |            90 |
| Kochhar     |            90 |
| De Haan     |            90 |
| Hunold      |            60 |
| Ernst       |            60 |
| Austin      |            60 |
| Pataballa   |            60 |
| Lorentz     |            60 |
| Greenberg   |           100 |
| Faviet      |           100 |
| Chen        |           100 |
| Sciarra     |           100 |
| Urman       |           100 |
| Popp        |           100 |
| Raphaely    |            30 |
| Khoo        |            30 |
| Baida       |            30 |
| Tobias      |            30 |
| Himuro      |            30 |
| Colmenares  |            30 |
| Weiss       |            50 |
| Fripp       |            50 |
| Kaufling    |            50 |
| Vollman     |            50 |
| Mourgos     |            50 |
| Nayer       |            50 |
| Mikkilineni |            50 |
| Landry      |            50 |
| Markle      |            50 |
| Bissot      |            50 |
| Atkinson    |            50 |
| Marlow      |            50 |
| Olson       |            50 |
| Mallin      |            50 |
| Rogers      |            50 |
| Gee         |            50 |
| Philtanker  |            50 |
| Ladwig      |            50 |
| Stiles      |            50 |
| Seo         |            50 |
| Patel       |            50 |
| Rajs        |            50 |
| Davies      |            50 |
| Matos       |            50 |
| Vargas      |            50 |
| Russell     |            80 |
| Partners    |            80 |
| Errazuriz   |            80 |
| Cambrault   |            80 |
| Zlotkey     |            80 |
| Tucker      |            80 |
| Bernstein   |            80 |
| Hall        |            80 |
| Olsen       |            80 |
| Cambrault   |            80 |
| Tuvault     |            80 |
| King        |            80 |
| Sully       |            80 |
| McEwen      |            80 |
| Smith       |            80 |
| Doran       |            80 |
| Sewall      |            80 |
| Vishney     |            80 |
| Greene      |            80 |
| Marvins     |            80 |
| Lee         |            80 |
| Ande        |            80 |
| Banda       |            80 |
| Ozer        |            80 |
| Bloom       |            80 |
| Fox         |            80 |
| Smith       |            80 |
| Bates       |            80 |
| Kumar       |            80 |
| Abel        |            80 |
| Hutton      |            80 |
| Taylor      |            80 |
| Livingston  |            80 |
| Grant       |          NULL |
| Johnson     |            80 |
| Taylor      |            50 |
| Fleaur      |            50 |
| Sullivan    |            50 |
| Geoni       |            50 |
| Sarchand    |            50 |
| Bull        |            50 |
| Dellinger   |            50 |
| Cabrio      |            50 |
| Chung       |            50 |
| Dilly       |            50 |
| Gates       |            50 |
| Perkins     |            50 |
| Bell        |            50 |
| Everett     |            50 |
| McCain      |            50 |
| Jones       |            50 |
| Walsh       |            50 |
| Feeney      |            50 |
| OConnell    |            50 |
| Grant       |            50 |
| Whalen      |            10 |
| Hartstein   |            20 |
| Fay         |            20 |
| Mavris      |            40 |
| Baer        |            70 |
| Higgins     |           110 |
| Gietz       |           110 |
+-------------+---------------+
107 rows in set (0.00 sec)

mysql> create view dept50 select employee_no,last_name,department_no from employees where department_no=50;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select employee_no,last_name,department_no from employees where department_no=50' at line 1
mysql> create view dept50 as select employee_no,last_name,department_no from employees where department_no=50;
ERROR 1054 (42S22): Unknown column 'employee_no' in 'field list'
mysql> select * from employees;
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
| employee_id | first_name  | last_name   | email    | phone_number       | hire_date  | job_id     | salary   | commission_pct | manager_id | department_id |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
|         100 | Steven      | King        | SKING    | 515.123.4567       | 1987-06-17 | AD_PRES    | 24000.00 |           NULL |       NULL |            90 |
|         101 | Neena       | Kochhar     | NKOCHHAR | 515.123.4568       | 1989-09-21 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         102 | Lex         | De Haan     | LDEHAAN  | 515.123.4569       | 1993-01-13 | AD_VP      | 17000.00 |           NULL |        100 |            90 |
|         103 | Alexander   | Hunold      | AHUNOLD  | 590.423.4567       | 1990-01-03 | IT_PROG    |  9000.00 |           NULL |        102 |            60 |
|         104 | Bruce       | Ernst       | BERNST   | 590.423.4568       | 1991-05-21 | IT_PROG    |  6000.00 |           NULL |        103 |            60 |
|         105 | David       | Austin      | DAUSTIN  | 590.423.4569       | 1997-06-25 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         106 | Valli       | Pataballa   | VPATABAL | 590.423.4560       | 1998-02-05 | IT_PROG    |  4800.00 |           NULL |        103 |            60 |
|         107 | Diana       | Lorentz     | DLORENTZ | 590.423.5567       | 1999-02-07 | IT_PROG    |  4200.00 |           NULL |        103 |            60 |
|         108 | Nancy       | Greenberg   | NGREENBE | 515.124.4569       | 1994-08-17 | FI_MGR     | 12000.00 |           NULL |        101 |           100 |
|         109 | Daniel      | Faviet      | DFAVIET  | 515.124.4169       | 1994-08-16 | FI_ACCOUNT |  9000.00 |           NULL |        108 |           100 |
|         110 | John        | Chen        | JCHEN    | 515.124.4269       | 1997-09-28 | FI_ACCOUNT |  8200.00 |           NULL |        108 |           100 |
|         111 | Ismael      | Sciarra     | ISCIARRA | 515.124.4369       | 1997-09-30 | FI_ACCOUNT |  7700.00 |           NULL |        108 |           100 |
|         112 | Jose Manuel | Urman       | JMURMAN  | 515.124.4469       | 1998-03-07 | FI_ACCOUNT |  7800.00 |           NULL |        108 |           100 |
|         113 | Luis        | Popp        | LPOPP    | 515.124.4567       | 1999-12-07 | FI_ACCOUNT |  6900.00 |           NULL |        108 |           100 |
|         114 | Den         | Raphaely    | DRAPHEAL | 515.127.4561       | 1994-12-07 | PU_MAN     | 11000.00 |           NULL |        100 |            30 |
|         115 | Alexander   | Khoo        | AKHOO    | 515.127.4562       | 1995-05-18 | PU_CLERK   |  3100.00 |           NULL |        114 |            30 |
|         116 | Shelli      | Baida       | SBAIDA   | 515.127.4563       | 1997-12-24 | PU_CLERK   |  2900.00 |           NULL |        114 |            30 |
|         117 | Sigal       | Tobias      | STOBIAS  | 515.127.4564       | 1997-07-24 | PU_CLERK   |  2800.00 |           NULL |        114 |            30 |
|         118 | Guy         | Himuro      | GHIMURO  | 515.127.4565       | 1998-11-15 | PU_CLERK   |  2600.00 |           NULL |        114 |            30 |
|         119 | Karen       | Colmenares  | KCOLMENA | 515.127.4566       | 1999-08-10 | PU_CLERK   |  2500.00 |           NULL |        114 |            30 |
|         120 | Matthew     | Weiss       | MWEISS   | 650.123.1234       | 1996-07-18 | ST_MAN     |  8000.00 |           NULL |        100 |            50 |
|         121 | Adam        | Fripp       | AFRIPP   | 650.123.2234       | 1997-04-10 | ST_MAN     |  8200.00 |           NULL |        100 |            50 |
|         122 | Payam       | Kaufling    | PKAUFLIN | 650.123.3234       | 1995-05-01 | ST_MAN     |  7900.00 |           NULL |        100 |            50 |
|         123 | Shanta      | Vollman     | SVOLLMAN | 650.123.4234       | 1997-10-10 | ST_MAN     |  6500.00 |           NULL |        100 |            50 |
|         124 | Kevin       | Mourgos     | KMOURGOS | 650.123.5234       | 1999-11-16 | ST_MAN     |  5800.00 |           NULL |        100 |            50 |
|         125 | Julia       | Nayer       | JNAYER   | 650.124.1214       | 1997-07-16 | ST_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         126 | Irene       | Mikkilineni | IMIKKILI | 650.124.1224       | 1998-09-28 | ST_CLERK   |  2700.00 |           NULL |        120 |            50 |
|         127 | James       | Landry      | JLANDRY  | 650.124.1334       | 1999-01-14 | ST_CLERK   |  2400.00 |           NULL |        120 |            50 |
|         128 | Steven      | Markle      | SMARKLE  | 650.124.1434       | 2000-03-08 | ST_CLERK   |  2200.00 |           NULL |        120 |            50 |
|         129 | Laura       | Bissot      | LBISSOT  | 650.124.5234       | 1997-08-20 | ST_CLERK   |  3300.00 |           NULL |        121 |            50 |
|         130 | Mozhe       | Atkinson    | MATKINSO | 650.124.6234       | 1997-10-30 | ST_CLERK   |  2800.00 |           NULL |        121 |            50 |
|         131 | James       | Marlow      | JAMRLOW  | 650.124.7234       | 1997-02-16 | ST_CLERK   |  2500.00 |           NULL |        121 |            50 |
|         132 | TJ          | Olson       | TJOLSON  | 650.124.8234       | 1999-04-10 | ST_CLERK   |  2100.00 |           NULL |        121 |            50 |
|         133 | Jason       | Mallin      | JMALLIN  | 650.127.1934       | 1996-06-14 | ST_CLERK   |  3300.00 |           NULL |        122 |            50 |
|         134 | Michael     | Rogers      | MROGERS  | 650.127.1834       | 1998-08-26 | ST_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         135 | Ki          | Gee         | KGEE     | 650.127.1734       | 1999-12-12 | ST_CLERK   |  2400.00 |           NULL |        122 |            50 |
|         136 | Hazel       | Philtanker  | HPHILTAN | 650.127.1634       | 2000-02-06 | ST_CLERK   |  2200.00 |           NULL |        122 |            50 |
|         137 | Renske      | Ladwig      | RLADWIG  | 650.121.1234       | 1995-07-14 | ST_CLERK   |  3600.00 |           NULL |        123 |            50 |
|         138 | Stephen     | Stiles      | SSTILES  | 650.121.2034       | 1997-10-26 | ST_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         139 | John        | Seo         | JSEO     | 650.121.2019       | 1998-02-12 | ST_CLERK   |  2700.00 |           NULL |        123 |            50 |
|         140 | Joshua      | Patel       | JPATEL   | 650.121.1834       | 1998-04-06 | ST_CLERK   |  2500.00 |           NULL |        123 |            50 |
|         141 | Trenna      | Rajs        | TRAJS    | 650.121.8009       | 1995-10-17 | ST_CLERK   |  3500.00 |           NULL |        124 |            50 |
|         142 | Curtis      | Davies      | CDAVIES  | 650.121.2994       | 1997-01-29 | ST_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         143 | Randall     | Matos       | RMATOS   | 650.121.2874       | 1998-03-15 | ST_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         144 | Peter       | Vargas      | PVARGAS  | 650.121.2004       | 1998-07-09 | ST_CLERK   |  2500.00 |           NULL |        124 |            50 |
|         145 | John        | Russell     | JRUSSEL  | 011.44.1344.429268 | 1996-10-01 | SA_MAN     | 14000.00 |           0.40 |        100 |            80 |
|         146 | Karen       | Partners    | KPARTNER | 011.44.1344.467268 | 1997-01-05 | SA_MAN     | 13500.00 |           0.30 |        100 |            80 |
|         147 | Alberto     | Errazuriz   | AERRAZUR | 011.44.1344.429278 | 1997-03-10 | SA_MAN     | 12000.00 |           0.30 |        100 |            80 |
|         148 | Gerald      | Cambrault   | GCAMBRAU | 011.44.1344.619268 | 1999-10-15 | SA_MAN     | 11000.00 |           0.30 |        100 |            80 |
|         149 | Eleni       | Zlotkey     | EZLOTKEY | 011.44.1344.429018 | 2000-01-29 | SA_MAN     | 10500.00 |           0.20 |        100 |            80 |
|         150 | Peter       | Tucker      | PTUCKER  | 011.44.1344.129268 | 1997-01-30 | SA_REP     | 10000.00 |           0.30 |        145 |            80 |
|         151 | David       | Bernstein   | DBERNSTE | 011.44.1344.345268 | 1997-03-24 | SA_REP     |  9500.00 |           0.25 |        145 |            80 |
|         152 | Peter       | Hall        | PHALL    | 011.44.1344.478968 | 1997-08-20 | SA_REP     |  9000.00 |           0.25 |        145 |            80 |
|         153 | Christopher | Olsen       | COLSEN   | 011.44.1344.498718 | 1998-03-30 | SA_REP     |  8000.00 |           0.20 |        145 |            80 |
|         154 | Nanette     | Cambrault   | NCAMBRAU | 011.44.1344.987668 | 1998-12-09 | SA_REP     |  7500.00 |           0.20 |        145 |            80 |
|         155 | Oliver      | Tuvault     | OTUVAULT | 011.44.1344.486508 | 1999-11-23 | SA_REP     |  7000.00 |           0.15 |        145 |            80 |
|         156 | Janette     | King        | JKING    | 011.44.1345.429268 | 1996-01-30 | SA_REP     | 10000.00 |           0.35 |        146 |            80 |
|         157 | Patrick     | Sully       | PSULLY   | 011.44.1345.929268 | 1996-03-04 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         158 | Allan       | McEwen      | AMCEWEN  | 011.44.1345.829268 | 1996-08-01 | SA_REP     |  9000.00 |           0.35 |        146 |            80 |
|         159 | Lindsey     | Smith       | LSMITH   | 011.44.1345.729268 | 1997-03-10 | SA_REP     |  8000.00 |           0.30 |        146 |            80 |
|         160 | Louise      | Doran       | LDORAN   | 011.44.1345.629268 | 1997-12-15 | SA_REP     |  7500.00 |           0.30 |        146 |            80 |
|         161 | Sarath      | Sewall      | SSEWALL  | 011.44.1345.529268 | 1998-11-03 | SA_REP     |  7000.00 |           0.25 |        146 |            80 |
|         162 | Clara       | Vishney     | CVISHNEY | 011.44.1346.129268 | 1997-11-11 | SA_REP     | 10500.00 |           0.25 |        147 |            80 |
|         163 | Danielle    | Greene      | DGREENE  | 011.44.1346.229268 | 1999-03-19 | SA_REP     |  9500.00 |           0.15 |        147 |            80 |
|         164 | Mattea      | Marvins     | MMARVINS | 011.44.1346.329268 | 2000-01-24 | SA_REP     |  7200.00 |           0.10 |        147 |            80 |
|         165 | David       | Lee         | DLEE     | 011.44.1346.529268 | 2000-02-23 | SA_REP     |  6800.00 |           0.10 |        147 |            80 |
|         166 | Sundar      | Ande        | SANDE    | 011.44.1346.629268 | 2000-03-24 | SA_REP     |  6400.00 |           0.10 |        147 |            80 |
|         167 | Amit        | Banda       | ABANDA   | 011.44.1346.729268 | 2000-04-21 | SA_REP     |  6200.00 |           0.10 |        147 |            80 |
|         168 | Lisa        | Ozer        | LOZER    | 011.44.1343.929268 | 1997-03-11 | SA_REP     | 11500.00 |           0.25 |        148 |            80 |
|         169 | Harrison    | Bloom       | HBLOOM   | 011.44.1343.829268 | 1998-03-23 | SA_REP     | 10000.00 |           0.20 |        148 |            80 |
|         170 | Tayler      | Fox         | TFOX     | 011.44.1343.729268 | 1998-01-24 | SA_REP     |  9600.00 |           0.20 |        148 |            80 |
|         171 | William     | Smith       | WSMITH   | 011.44.1343.629268 | 1999-02-23 | SA_REP     |  7400.00 |           0.15 |        148 |            80 |
|         172 | Elizabeth   | Bates       | EBATES   | 011.44.1343.529268 | 1999-03-24 | SA_REP     |  7300.00 |           0.15 |        148 |            80 |
|         173 | Sundita     | Kumar       | SKUMAR   | 011.44.1343.329268 | 2000-04-21 | SA_REP     |  6100.00 |           0.10 |        148 |            80 |
|         174 | Ellen       | Abel        | EABEL    | 011.44.1644.429267 | 1996-05-11 | SA_REP     | 11000.00 |           0.30 |        149 |            80 |
|         175 | Alyssa      | Hutton      | AHUTTON  | 011.44.1644.429266 | 1997-03-19 | SA_REP     |  8800.00 |           0.25 |        149 |            80 |
|         176 | Jonathon    | Taylor      | JTAYLOR  | 011.44.1644.429265 | 1998-03-24 | SA_REP     |  8600.00 |           0.20 |        149 |            80 |
|         177 | Jack        | Livingston  | JLIVINGS | 011.44.1644.429264 | 1998-04-23 | SA_REP     |  8400.00 |           0.20 |        149 |            80 |
|         178 | Kimberely   | Grant       | KGRANT   | 011.44.1644.429263 | 1999-05-24 | SA_REP     |  7000.00 |           0.15 |        149 |          NULL |
|         179 | Charles     | Johnson     | CJOHNSON | 011.44.1644.429262 | 2000-01-04 | SA_REP     |  6200.00 |           0.10 |        149 |            80 |
|         180 | Winston     | Taylor      | WTAYLOR  | 650.507.9876       | 1998-01-24 | SH_CLERK   |  3200.00 |           NULL |        120 |            50 |
|         181 | Jean        | Fleaur      | JFLEAUR  | 650.507.9877       | 1998-02-23 | SH_CLERK   |  3100.00 |           NULL |        120 |            50 |
|         182 | Martha      | Sullivan    | MSULLIVA | 650.507.9878       | 1999-06-21 | SH_CLERK   |  2500.00 |           NULL |        120 |            50 |
|         183 | Girard      | Geoni       | GGEONI   | 650.507.9879       | 2000-02-03 | SH_CLERK   |  2800.00 |           NULL |        120 |            50 |
|         184 | Nandita     | Sarchand    | NSARCHAN | 650.509.1876       | 1996-01-27 | SH_CLERK   |  4200.00 |           NULL |        121 |            50 |
|         185 | Alexis      | Bull        | ABULL    | 650.509.2876       | 1997-02-20 | SH_CLERK   |  4100.00 |           NULL |        121 |            50 |
|         186 | Julia       | Dellinger   | JDELLING | 650.509.3876       | 1998-06-24 | SH_CLERK   |  3400.00 |           NULL |        121 |            50 |
|         187 | Anthony     | Cabrio      | ACABRIO  | 650.509.4876       | 1999-02-07 | SH_CLERK   |  3000.00 |           NULL |        121 |            50 |
|         188 | Kelly       | Chung       | KCHUNG   | 650.505.1876       | 1997-06-14 | SH_CLERK   |  3800.00 |           NULL |        122 |            50 |
|         189 | Jennifer    | Dilly       | JDILLY   | 650.505.2876       | 1997-08-13 | SH_CLERK   |  3600.00 |           NULL |        122 |            50 |
|         190 | Timothy     | Gates       | TGATES   | 650.505.3876       | 1998-07-11 | SH_CLERK   |  2900.00 |           NULL |        122 |            50 |
|         191 | Randall     | Perkins     | RPERKINS | 650.505.4876       | 1999-12-19 | SH_CLERK   |  2500.00 |           NULL |        122 |            50 |
|         192 | Sarah       | Bell        | SBELL    | 650.501.1876       | 1996-02-04 | SH_CLERK   |  4000.00 |           NULL |        123 |            50 |
|         193 | Britney     | Everett     | BEVERETT | 650.501.2876       | 1997-03-03 | SH_CLERK   |  3900.00 |           NULL |        123 |            50 |
|         194 | Samuel      | McCain      | SMCCAIN  | 650.501.3876       | 1998-07-01 | SH_CLERK   |  3200.00 |           NULL |        123 |            50 |
|         195 | Vance       | Jones       | VJONES   | 650.501.4876       | 1999-03-17 | SH_CLERK   |  2800.00 |           NULL |        123 |            50 |
|         196 | Alana       | Walsh       | AWALSH   | 650.507.9811       | 1998-04-24 | SH_CLERK   |  3100.00 |           NULL |        124 |            50 |
|         197 | Kevin       | Feeney      | KFEENEY  | 650.507.9822       | 1998-05-23 | SH_CLERK   |  3000.00 |           NULL |        124 |            50 |
|         198 | Donald      | OConnell    | DOCONNEL | 650.507.9833       | 1999-06-21 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         199 | Douglas     | Grant       | DGRANT   | 650.507.9844       | 2000-01-13 | SH_CLERK   |  2600.00 |           NULL |        124 |            50 |
|         200 | Jennifer    | Whalen      | JWHALEN  | 515.123.4444       | 1987-09-17 | AD_ASST    |  4400.00 |           NULL |        101 |            10 |
|         201 | Michael     | Hartstein   | MHARTSTE | 515.123.5555       | 1996-02-17 | MK_MAN     | 13000.00 |           NULL |        100 |            20 |
|         202 | Pat         | Fay         | PFAY     | 603.123.6666       | 1997-08-17 | MK_REP     |  6000.00 |           NULL |        201 |            20 |
|         203 | Susan       | Mavris      | SMAVRIS  | 515.123.7777       | 1994-06-07 | HR_REP     |  6500.00 |           NULL |        101 |            40 |
|         204 | Hermann     | Baer        | HBAER    | 515.123.8888       | 1994-06-07 | PR_REP     | 10000.00 |           NULL |        101 |            70 |
|         205 | Shelley     | Higgins     | SHIGGINS | 515.123.8080       | 1994-06-07 | AC_MGR     | 12000.00 |           NULL |        101 |           110 |
|         206 | William     | Gietz       | WGIETZ   | 51hr5.123.8181     | 1994-06-07 | AC_ACCOUNT |  8300.00 |           NULL |        205 |           110 |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
107 rows in set (0.00 sec)

mysql> create view dept50 as select employee_id,last_name,department_no from employees where department_no=50;
ERROR 1054 (42S22): Unknown column 'department_no' in 'field list'
mysql> create view dept50 as select employee_id,last_name,department_id from employees where department_no=50;
ERROR 1054 (42S22): Unknown column 'department_no' in 'where clause'
mysql> create view dept50 as select employee_id,last_name,department_id from employees where department_id=50;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from dept50;
+-------------+-------------+---------------+
| employee_id | last_name   | department_id |
+-------------+-------------+---------------+
|         120 | Weiss       |            50 |
|         121 | Fripp       |            50 |
|         122 | Kaufling    |            50 |
|         123 | Vollman     |            50 |
|         124 | Mourgos     |            50 |
|         125 | Nayer       |            50 |
|         126 | Mikkilineni |            50 |
|         127 | Landry      |            50 |
|         128 | Markle      |            50 |
|         129 | Bissot      |            50 |
|         130 | Atkinson    |            50 |
|         131 | Marlow      |            50 |
|         132 | Olson       |            50 |
|         133 | Mallin      |            50 |
|         134 | Rogers      |            50 |
|         135 | Gee         |            50 |
|         136 | Philtanker  |            50 |
|         137 | Ladwig      |            50 |
|         138 | Stiles      |            50 |
|         139 | Seo         |            50 |
|         140 | Patel       |            50 |
|         141 | Rajs        |            50 |
|         142 | Davies      |            50 |
|         143 | Matos       |            50 |
|         144 | Vargas      |            50 |
|         180 | Taylor      |            50 |
|         181 | Fleaur      |            50 |
|         182 | Sullivan    |            50 |
|         183 | Geoni       |            50 |
|         184 | Sarchand    |            50 |
|         185 | Bull        |            50 |
|         186 | Dellinger   |            50 |
|         187 | Cabrio      |            50 |
|         188 | Chung       |            50 |
|         189 | Dilly       |            50 |
|         190 | Gates       |            50 |
|         191 | Perkins     |            50 |
|         192 | Bell        |            50 |
|         193 | Everett     |            50 |
|         194 | McCain      |            50 |
|         195 | Jones       |            50 |
|         196 | Walsh       |            50 |
|         197 | Feeney      |            50 |
|         198 | OConnell    |            50 |
|         199 | Grant       |            50 |
+-------------+-------------+---------------+
45 rows in set (0.00 sec)

mysql> select * from dept;
ERROR 1146 (42S02): Table 'hr.dept' doesn't exist
mysql> it remote add origin https://github.com/SubhashiniNi/myfirstrepo.git
    -> git remote add origin https://github.com/SubhashiniNi/myfirstrepo.git
    -> select employee_id,last_name from employees e order by (select department_name from departments d where e.department_id=d.department_id);











































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































