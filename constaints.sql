1. create database subhashini;
2. use subhashini;
3.create table products(productcode varchar(45), productname varchar(45),productvender varchar(45), constraint product_key primary key(productcode))
    -> ;
Query OK, 0 rows affected (0.20 sec)
4. create table offices(officecode varchar(40) primary key, city varchar(40), phone varchar(40),addressline varchar(40), state varchar(40), country varchar(40),postalcode varchar(40));
Query OK, 0 rows affected (0.06 sec)
5.create table employees(employeenumber int primary key,lastname varchar(40),firstname varchar(40),officecode varchar(40), constraint officeforeign_key foreign key(officecode)  references offices(officecode));
Query OK, 0 rows affected (0.09 sec)
6. drop table products;
7. create table products(productcode varchar(45), productname varchar(45),productvender varchar(45),product_desc varchar(40) UNIQUE, constraint product_key primary key(productcode));
Query OK, 0 rows affected (0.08 sec)
8. create table employees(employeenumber int primary key,lastname varchar(40),firstname varchar(40),officecode varchar(40), constraint officeforeign_key foreign key(officecode)  references offices(officecode),constraint extension_chk CHECK(extension LIKE 'x%'));
9.create table student_courses(student_id  varchar(10),course_code varchar(20), constraint student_id foreign key(student_id) references student_onfo(student_id), constraint course_code foreign key(course_code) references course_info(course_code));
Query OK, 0 rows affected (0.08 sec)
10.create table suppliers(supplier_id int(10) not null primary key,supplier_name varchar(40) not null ,address varchar(40), city varchar(40),state varchar(40),zip_code varchar(40));
Query OK, 0 rows affected (0.08 sec)
11. create table customers(customer_id int(10) not null,customer_name varchar(40) not null,address varchar(40),city varchar(40),state varchar(20),zip_code varchar(40),constraint customer_pk primary key(customer_id));
Query OK, 0 rows affected (0.06 sec)
12. insert into course_info values("FS0816","FUllstack","Developer",'2019-6-10',6,18,'orl');
Query OK, 1 row affected (0.01 sec)
13. insert into student_onfo values("00DFH","subhashini","nidamanuri","banglore");
Query OK, 1 row affected (0.01 sec)
14. insert into course_info values("167","SAP","deleloper",'2019-6-20',8,40,'fd');
Query OK, 1 row affected (0.02 sec)
15.
