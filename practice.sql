
use assignment;

select * from payments;





select  case 
  when payments.amount > 50000 then 'Platinum'
  when payments.amount > 25000 and payments.amount < 50000 then 'Gold'
  else 'Silver'
end as Status
from payments
where payments.customerNumber = 286 ;

select * 
from payments
where payments.customerNumber = 102 ;
  
  
call purchase_status_payments(298);


select * from customers;


select customerNumber , customerName , call purchase_status_payments(customerNumber)
from customer;



