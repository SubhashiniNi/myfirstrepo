1. select member_id,member_name,city,membership_status from lms_members where membership_status='permanent';

3. select m.member_id,m.member_name,d.book_code from lms_members m join lms_book_details d  where book_code <> 'BL000002';
4. select book_code,book_title,author from lms_book_details where author like 'p%';
5.select count(category) NO_OF_BOOKS from lms_book_details where category='java';
6.
7. select count(publication)  no_of_books from lms_book_details where publication='prentice hall';
8.
9. select member_id,member_name,date_register from lms_members where date_expire<'2013-04-01';
10. select member_id,member_name,date_register,membership_status from lms_members where date_register<'2012-03-01' and membership_status='temporary';
11.select member_id,member_name as 'Name' from lms_members where city='chennai' or city='delhi';
12.select distinct(concat(book_title,"_is_written_by",author)) as 'Book is written by' from lms_book_details;
13. select avg(price)  as 'AVERAGEPRICE' from lms_book_details where category='java';
14.select supplier_id,supplier_name,email from LMS_SUPPLIERS_DETAILS where  email like '%gmail%';
15. select Supplier_id,supplier_name,coalesce(contact,email,address) as contactdetails from Lms_suppliers_details
    -> ;
16. select SUPPLIER_ID,SUPPLIER_NAME,case when CONTACT is NULL then 'NO' when CONTACT is not null then 'YES' end as PHONE_NUM_AVAILABLE from LMS_SUPPLIERS_DETAILS
    ->
    -> ;
17.SELECT m.MEMBER_ID, m.MEMBER_NAME, m.CITY, SUM(f.FINE_AMOUNT) AS FINE FROM LMS_MEMBERS m INNER JOIN LMS_BOOK_ISSUE i ON m.MEMBER_ID = i.MEMBER_ID INNER JOIN LMS_FINE_DETAILS f ON i.FINE_RANGE = f.FINE_RANGE GROUP BY m.MEMBER_ID, m.MEMBER_NAME, m.CITY;
18.select MEMBER_ID,(select MEMBER_NAME from LMS_MEMBERS where MEMBER_ID=t1.MEMBER_ID )as MEMBER_NAME,BOOK_CODE,(select BOOK_TITLE from LMS_BOOK_DETAILS where BOOK_CODE=t1.BOOK_CODE)as BOOK_TITLE from LMS_BOOK_ISSUE t1 

;
19.SELECT COUNT(t1.BOOK_CODE)AS NO_OF_BOOKS_AVAILABLE FROM LMS_BOOK_DETAILS t1 LEFT JOIN LMS_BOOK_ISSUE t2 ON t1.BOOK_CODE = t2.BOOK_CODE WHERE t2.BOOK_CODE IS NULL;
20.SELECT T1.MEMBER_ID,(SELECT MEMBER_NAME FROM LMS_MEMBERS WHERE MEMBER_ID=T1.MEMBER_ID)AS MEMBER_NAME,(SELECT T2.FINE_RANGE FROM LMS_MEMBERS WHERE MEMBER_ID=T1.MEMBER_ID)AS FINE_RANGE,(SELECT FINE_AMOUNT FROM LMS_FINE_DETAILS T2 WHERE FINE_RANGE= T1.FINE_RANGE)AS FINE_AMOUNT FROM LMS_BOOK_ISSUE T1 LEFT JOIN LMS_FINE_DETAILS T2 ON T1.FINE_RANGE = T2.FINE_RANGE WHERE T2.FINE_AMOUNT < 100 ;
21. SELECT BOOK_CODE,BOOK_TITLE,PUBLICATION,BOOK_EDITION,PRICE,YEAR(PUBLISH_DATE) AS YEAR_OF_PUBLICATION FROM LMS_BOOK_DETAILS ORDER BY YEAR_OF_PUBLICATION 
;
22.SELECT BOOK_CODE,BOOK_TITLE,RACK_NUM FROM LMS_BOOK_DETAILS where RACK_NUM='A1' ORDER BY BOOK_TITLE ASC;
23.SELECT MEMBER_ID,(SELECT MEMBER_NAME FROM LMS_MEMBERS WHERE MEMBER_ID=T1.MEMBER_ID)AS MEMBER_NAME,DATE_RETURN AS DUE_DATE,DATE_RETURNED FROM LMS_BOOK_ISSUE T1 WHERE DATE_RETURN < DATE_RETURNED ;
24.SELECT T1.MEMBER_ID,MEMBER_NAME,DATE_REGISTER FROM LMS_MEMBERS T1 LEFT JOIN LMS_BOOK_ISSUE T2 ON T1.MEMBER_ID = T2.MEMBER_ID WHERE T2.MEMBER_ID IS NULL;
25.select t1.MEMBER_ID,(select t2.MEMBER_NAME from LMS_MEMBERS t2 where t1.MEMBER_ID=t2.MEMBER_ID)as MEMBER_NAME from LMS_BOOK_ISSUE t1 where t1.DATE_RETURN >=t1.DATE_RETURNED and year(t1.DATE_RETURNED)=2012 
;
26.select BOOK_TITLE,SUPPLIER_ID from LMS_BOOK_DETAILS where AUTHOR='Herbert Schildt' and BOOK_EDITION='5' and SUPPLIER_ID='S01' ;;
27. select rack_num,count(book_code) as 'NOOFBOOKS' from lms_book_details group by rack_num;
28.