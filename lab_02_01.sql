1.select last_name,department_id from employees where department_id=80;


+-----------+----------+
| last_name | salary   |
+-----------+----------+
| King      | 24000.00 |
| Kochhar   | 17000.00 |
| De Haan   | 17000.00 |
| Russell   | 14000.00 |
| Partners  | 13500.00 |
| Hartstein | 13000.00 |
+-----------+----------+
6 rows in set (0.06 sec)

2. select last_name,department_id from employees where employee_id=176;
+-----------+---------------+
| last_name | department_id |
+-----------+---------------+
| Taylor    |            80 |
+-----------+---------------+
1 row in set (0.00 sec)

3. select last_name,salary from employees where salary  not between 5000 and 12000;
+-------------+----------+
| last_name   | salary   |
+-------------+----------+
| King        | 24000.00 |
| Kochhar     | 17000.00 |
| De Haan     | 17000.00 |
| Austin      |  4800.00 |
| Pataballa   |  4800.00 |
| Lorentz     |  4200.00 |
| Khoo        |  3100.00 |
| Baida       |  2900.00 |
| Tobias      |  2800.00 |
| Himuro      |  2600.00 |
| Colmenares  |  2500.00 |
| Nayer       |  3200.00 |
| Mikkilineni |  2700.00 |
| Landry      |  2400.00 |
| Markle      |  2200.00 |
| Bissot      |  3300.00 |
| Atkinson    |  2800.00 |
| Marlow      |  2500.00 |
| Olson       |  2100.00 |
| Mallin      |  3300.00 |
| Rogers      |  2900.00 |
| Gee         |  2400.00 |
| Philtanker  |  2200.00 |
| Ladwig      |  3600.00 |
| Stiles      |  3200.00 |
| Seo         |  2700.00 |
| Patel       |  2500.00 |
| Rajs        |  3500.00 |
| Davies      |  3100.00 |
| Matos       |  2600.00 |
| Vargas      |  2500.00 |
| Russell     | 14000.00 |
| Partners    | 13500.00 |
| Taylor      |  3200.00 |
| Fleaur      |  3100.00 |
| Sullivan    |  2500.00 |
| Geoni       |  2800.00 |
| Sarchand    |  4200.00 |
| Bull        |  4100.00 |
| Dellinger   |  3400.00 |
| Cabrio      |  3000.00 |
| Chung       |  3800.00 |
| Dilly       |  3600.00 |
| Gates       |  2900.00 |
| Perkins     |  2500.00 |
| Bell        |  4000.00 |
| Everett     |  3900.00 |
| McCain      |  3200.00 |
| Jones       |  2800.00 |
| Walsh       |  3100.00 |
| Feeney      |  3000.00 |
| OConnell    |  2600.00 |
| Grant       |  2600.00 |
| Whalen      |  4400.00 |
| Hartstein   | 13000.00 |
+-------------+----------+


4. select last_name,department_id from employees where department_id=50 or department_id=20 order by last_name ASC;
+-------------+---------------+
| last_name   | department_id |
+-------------+---------------+
| Atkinson    |            50 |
| Bell        |            50 |
| Bissot      |            50 |
| Bull        |            50 |
| Cabrio      |            50 |
| Chung       |            50 |
| Davies      |            50 |
| Dellinger   |            50 |
| Dilly       |            50 |
| Everett     |            50 |
| Fay         |            20 |
| Feeney      |            50 |
| Fleaur      |            50 |
| Fripp       |            50 |
| Gates       |            50 |
| Gee         |            50 |
| Geoni       |            50 |
| Grant       |            50 |
| Hartstein   |            20 |
| Jones       |            50 |
| Kaufling    |            50 |
| Ladwig      |            50 |
| Landry      |            50 |
| Mallin      |            50 |
| Markle      |            50 |
| Marlow      |            50 |
| Matos       |            50 |
| McCain      |            50 |
| Mikkilineni |            50 |
| Mourgos     |            50 |
| Nayer       |            50 |
| OConnell    |            50 |
| Olson       |            50 |
| Patel       |            50 |
| Perkins     |            50 |
| Philtanker  |            50 |
| Rajs        |            50 |
| Rogers      |            50 |
| Sarchand    |            50 |
| Seo         |            50 |
| Stiles      |            50 |
| Sullivan    |            50 |
| Taylor      |            50 |
| Vargas      |            50 |
| Vollman     |            50 |
| Walsh       |            50 |
| Weiss       |            50 |
+-------------+---------------



6.
 select last_name 'Employee',salary 'MonthlySalary' from employees where salary between 5000 and 12000 and department_id in(50,20);
+----------+---------------+
| Employee | MonthlySalary |
+----------+---------------+
| Weiss    |       8000.00 |
| Fripp    |       8200.00 |
| Kaufling |       7900.00 |
| Vollman  |       6500.00 |
| Mourgos  |       5800.00 |
| Fay      |       6000.00 |
+----------+---------------+
6 rows in set (0.00 sec)


7. select last_name,date_format(hire_date,'%d-%m-%y')hire_date from employees where year(hire_date)=1994;
+-----------+-----------+
| last_name | hire_date |
+-----------+-----------+
| Greenberg | 17-08-94  |
| Faviet    | 16-08-94  |
| Raphaely  | 07-12-94  |
| Mavris    | 07-06-94  |
| Baer      | 07-06-94  |
| Higgins   | 07-06-94  |
| Gietz     | 07-06-94  |
+-----------+-----------+
7 rows in set (0.00 sec)



8. select last_name,job_id from employees where manager_id is null;
+-----------+---------+
| last_name | job_id  |
+-----------+---------+
| King      | AD_PRES |
+-----------+---------+
1 row in set (0.00 sec)
select


9.
select last_name,salary,commission_pct  from employees where commission_pct is not null order by salary, commission_pct DESC;
+------------+----------+----------------+
| last_name  | salary   | commission_pct |
+------------+----------+----------------+
| Kumar      |  6100.00 |           0.10 |
| Johnson    |  6200.00 |           0.10 |
| Banda      |  6200.00 |           0.10 |
| Ande       |  6400.00 |           0.10 |
| Lee        |  6800.00 |           0.10 |
| Sewall     |  7000.00 |           0.25 |
| Tuvault    |  7000.00 |           0.15 |
| Grant      |  7000.00 |           0.15 |
| Marvins    |  7200.00 |           0.10 |
| Bates      |  7300.00 |           0.15 |
| Smith      |  7400.00 |           0.15 |
| Doran      |  7500.00 |           0.30 |
| Cambrault  |  7500.00 |           0.20 |
| Smith      |  8000.00 |           0.30 |
| Olsen      |  8000.00 |           0.20 |
| Livingston |  8400.00 |           0.20 |
| Taylor     |  8600.00 |           0.20 |
| Hutton     |  8800.00 |           0.25 |
| McEwen     |  9000.00 |           0.35 |
| Hall       |  9000.00 |           0.25 |
| Sully      |  9500.00 |           0.35 |
| Bernstein  |  9500.00 |           0.25 |
| Greene     |  9500.00 |           0.15 |
| Fox        |  9600.00 |           0.20 |
| King       | 10000.00 |           0.35 |
| Tucker     | 10000.00 |           0.30 |
| Bloom      | 10000.00 |           0.20 |
| Vishney    | 10500.00 |           0.25 |
| Zlotkey    | 10500.00 |           0.20 |
| Abel       | 11000.00 |           0.30 |
| Cambrault  | 11000.00 |           0.30 |
| Ozer       | 11500.00 |           0.25 |
| Errazuriz  | 12000.00 |           0.30 |
| Partners   | 13500.00 |           0.30 |
| Russell    | 14000.00 |           0.40 |
+------------+----------+------------select 


10.
 select last_name,salary from employees where salary>12000;
+-----------+----------+
| last_name | salary   |
+-----------+----------+
| King      | 24000.00 |
| Kochhar   | 17000.00 |
| De Haan   | 17000.00 |
| Russell   | 14000.00 |
| Partners  | 13500.00 |
| Hartstein | 13000.00 |
+-----------+----------+
6 rows in set (0.00 sec)

11.
 select employee_id,last_name,salary,department_id from employees where manager_id=103;
+-------------+-----------+---------+---------------+
| employee_id | last_name | salary  | department_id |
+-------------+-----------+---------+---------------+
|         104 | Ernst     | 6000.00 |            60 |
|         105 | Austin    | 4800.00 |            60 |
|         106 | Pataballa | 4800.00 |            60 |
|         107 | Lorentz   | 4200.00 |            60 |
+-------------+-----------+---------+---------------+
4 rows in set (0.00 sec)