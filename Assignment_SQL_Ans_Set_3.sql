
use assignment;



-- 1. Write a stored procedure that accepts the month and year as inputs and prints 
-- the ordernumber, orderdate and status of the orders placed in that month. 
-- Example:  call order_status(2005, 11);

-- Ans:

CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(in yr int, in mon int)
BEGIN

select orderNumber , orderDate , status from orders 
where year(orderDate) =  yr 
  and month(orderDate) = mon ;

END

call order_status(2003,11);







-- Q 2 .a.	Create a table called cancellations with the following fields

-- Ans:

create table cancellations6 (
id int  auto_increment primary key ,
customerNumber int(11)  ,
orderNumber int(11)  ,
comments text ,
foreign key (customerNumber) references customers(customerNumber),
foreign key (orderNumber) references orders(orderNumber)
);

select * from cancellations6;





-- b. Read through the orders table . 
-- If an order is cancelled, then put an entry in the cancellations table.

-- Ans:


CREATE DEFINER=`root`@`localhost` PROCEDURE `order_cancellations1`(in ord_number int (11) )
BEGIN


declare v_customerNumber int(11) ;
declare v_orderNumber int(11)  ;
declare v_comments text ;


select customerNumber, orderNumber ,comments 
into v_customerNumber ,v_orderNumber , v_comments 
from orders 

where  orders.orderNumber = ord_number
and status = 'Cancelled' ;

insert into cancellations6(customerNumber , orderNumber , comments)
    values (v_customerNumber, v_orderNumber, v_comments) ;


END


call order_cancellations1(10248);

select * from cancellations6;







/* 3. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]

if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
if amount > 50000 Platinum 
*/

-- Ans:

CREATE DEFINER=`root`@`localhost` PROCEDURE `purchase_status_payments`(in p_customerNumber int)
BEGIN
select  case 
  when payments.amount > 50000 then 'Platinum'
  when payments.amount > 25000 and payments.amount < 50000 then 'Gold'
  else 'Silver'
end as Status
from payments
where payments.customerNumber = p_customerNumber ;

END


call purchase_status_payments(298);







-- Q 3.b. Write a query that displays customerNumber, customername and purchase_status from customers table.

-- Ans: tried lot much but can't solve .








-- Q 4. 4. Replicate the functionality of 'on delete cascade' and 'on update cascade' 
-- using triggers on movies and rentals tables. Note: Both tables - movies and rentals - 
-- don't have primary or foreign keys. Use only triggers to implement the above.

-- Ans:

use assignment;
select * from movies;
desc movies;

alter table movies add constraint primary key (id);

ALTER TABLE rentals
ADD CONSTRAINT FK_movies_rentals
FOREIGN KEY (movieid) REFERENCES movies(id)
on update cascade
on delete cascade ;

select * from movies;
select * from rentals;

update movies 
set id =11 
where id=1;


create trigger sample_trigger
before insert
on movies 
for each row 
set new.id = new.id + 10;


select * from movies;
select * from rentals;

show triggers;









-- 5. Select the first name of the employee who gets the third highest salary. 
-- [table: employee]

-- Ans:

select fname ,salary from employee 
order by salary desc limit 2,1 ;








-- 6. Assign a rank to each employee  based on their salary. 
-- The person having the highest salary has rank 1. [table: employee]

-- Ans:

select e.* , 
rank() over (partition by deptno order by salary desc ) as rnk
from employee e ;


--  END OF Assignments SQL  Set 3 .



