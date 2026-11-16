--retrieve all customer data
select*
from customers

--retrieve all order data
select*
from orders

--retrieve each customers name,country ,score data
select
first_name,
country,
score
from customers

--retrieve customers with scores not equal to zero
select*
from customers
where score !=0

--retrieve customers from germeny
select
first_name,
country
from customers
where country='Germany'

--retrieve all customers and sort the result by thr highest score first
select*
from customers
order by score desc

select*
from customers
order by score 

--retrieve all customers and sort the result by country and then by the highest score

select*
from customers
order by country asc, score desc

--find the total score fore each counrty
select 
country,
sum(score ) as total_score
from customers
group by country

--find the total score and total numbers of customers for each contry
select
SUM(score),count(id) as total_customers
from customers
group by country


--find the averge score for each country considring only costomers with score not equal to 0 and retirn only 
--country with avr score > 430
select 
country,
AVG(score) as avr_score
from customers
where score !=0
group by country
having AVG(score) > 430

-- return all unique list of contry
select distinct country from customers
--return only 3 customers 

select top 3 * from customers 
order by score desc

-- grt the most recebt order 
select top 2 * from orders order by order_date desc 


--static value
 select 123 as numbdres

 --create new table called persons with colom : id ,person name ,birth date and phone
 create table persons (
 id int not null,
 person_name varchar(50) not null,
 phone varchar(15),
 constraint pk_persons primary key (id))

 --add new colom called email
 alter table persons 
 add email varchar(50)


 select *from persons

 

 

 --insert data 
 insert into customers (id,first_name,country ,score)
 values
 (6,'anna','USA', null),
 (7,'sam',null, 100)

 select * from customers

 insert into customers (id,first_name)
 values
 (8,'ruba')
 

 insert into persons ( id, person_name , phone, email)
 select
 id,
 first_name,
 'unkown',
 'sql@gmail'
 from customers

 update customers
 set score= 0
 where id=6 

 select* from customers
 where id=6

 update customers
 set score= 0,
 country='UK'
 where  id= 8
 select* from customers

 update customers
 set score= null
 where id=5 
 select* from customers

 update customers
 set score= null
 where id=6
 select* from customers

 update customers
 set score= 0
 where score is null
 select* from customers

 delete from customers
 where id > 5
  
 select* from customers

 --delet all data from table
 delete from persons
 truncate table persons


 -- retrive all custumers from germany
 select * 
 from customers
 where country = 'Germany'

 -- retrive all custumer not  from germany
select * 
 from customers
 where country != 'Germany'

 -- retrive all custumer with score >500
 select * 
 from customers
 where score >500
 --500or more
 select * 
 from customers
 where score >=500
 -- less than500
 select * 
 from customers
 where score <500
 --less or equal
 select * 
 from customers
 where score >= 500

--retrive all customers who from the us and score more then500
select * 
 from customers
 where country = 'USA' and score >500

 --retrive all customers who from the usa or score more then500
select * 
 from customers
 where country = 'USA' or score >500

 --retrive all customers score  not less  than 500 (>500 
select * 
 from customers
 where not score <500 --الشرط يكون العكس


 --retrive all customers who score fall between 100and500
select * 
 from customers
 where score between 100 and 500

 --retrive all customers who from either usa or germany

select * 
 from customers
 where country in( 'USA' , 'Germany')

 -- not in

 select * 
 from customers
 where country not in( 'USA' , 'Germany')

 -- find customer firt name start with M 
 select * 
 from customers
 where first_name like 'M%'

 -- find customer firt name end with n
 select * 
 from customers
 where first_name like '%N'

 -- find customer firt name contains R
 select * 
 from customers
 where first_name like '%r%'

 -- find customer firt name start with R in the third position
 
 select * 
 from customers
 where first_name like '__r%'


 -- get all custemors with there order BUT only customers who placed ana order
 select* 
 from customers
    

    select * 
 from orders


 --نفرق بين اسماء الاعمده 
 select 
 c.id, 
 c.first_name,
 o.order_id,
 o.sales
 from customers as c-- left table
 inner join orders as o -- right tabel
 on c.id=o.customer_id



 -- get all custemors with there order include  customers without orders
 select*
 from customers-- left table
 left join orders -- right tabel
 on id=customer_id

 --get all custemors with there order include  orderds without customers
 select*
 from customers-- left table
 right join orders -- right tabel
 on id=customer_id


 --get all custemors with there order include  orders without orders match customers usig left joun 
 -- نعكس اماكن التيبلز
 select*
 from orders-- left table
 left join customers -- right tabel
 on id=customer_id


 -- get all customers and orders even if there is no match
 select*
 from customers-- left table
 full join orders -- right tabel
 on id=customer_id

 -- anti left join
--get all cutomers who have not placed an order
select*
 from customers-- left table
 left join orders -- right tabel
 on id=customer_id
 where customer_id is null

 -- right anti join 
 --get all order withot match customers
select*
 from customers-- left table
 right join orders -- right tabel
 on id=customer_id
 where id is null

 --anti full joun
 --get all cutomers without orders and orders without customers
select*
 from customers-- left table
 full join orders -- right tabel
 on id=customer_id
 where customer_id is null or id is null 

 --get all cutomers with there orders BUT only for customets who placed an order with out (inner join)
select*
 from customers-- left table
 left join orders -- right tabel
 on id=customer_id
 where customer_id is not null

 -- CROSS JOIN
 --generate all possible combnations of custimers nad orders
 select* 
 from customers
 cross join orders

 /* Task: Using SalesDB, Retrieve a list of all orders, along with the related customer, product, 
   and employee details. For each order, display:
   - Order ID
   - Customer's name
   - Product name
   - Sales amount
   - Product price
   - Salesperson's name */

USE SalesDB

SELECT 
    o.OrderID,
    o.Sales,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    p.Product AS ProductName,
    p.Price,
    e.FirstName AS EmployeeFirstName,
    e.LastName AS EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID

