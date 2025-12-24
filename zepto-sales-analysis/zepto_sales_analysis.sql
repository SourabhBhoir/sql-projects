create database zepto_sales_db;

drop table if exists zepto;
use zepto_sales_db;

-- add id column at first position;
alter table zepto_v2 
add column id int auto_increment primary key not null first;

select * from zepto_v2 limit 10;
-- count all rows
select count(*) from zepto_v2;

-- check null 
select * from zepto_v2
where Category is null
or
name is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null;

-- different product category
select distinct Category,count(Category) as distinct_count from zepto_v2
group by  Category;

-- product in stock vs outof stock
select outOfStock,count(id)
from zepto_v2
group by outOfStock;

-- product names present multiple times
select name, count(id) as "number of ids"
from zepto_v2
group by name
having count(id) >1
order by count(id);

-- data cleaning
-- product with price is 0
select * from zepto_v2
where discountedSellingPrice =0 or mrp =0;

delete from zepto_v2
where id in (select id from (
select id from zepto_v2 where mrp = 0) as nullPrice
);

-- convert paisa to rupees
SET SQL_SAFE_UPDATES = 0;

update zepto_v2
set mrp = mrp/100.0 ,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto_v2;

-- data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
select name,mrp,discountedSellingPrice
from zepto_v2
order by discountedSellingPrice
limit 10;


-- Q2.What are the Products with High MRP but Out of Stock
select distinct name,mrp
from zepto_v2
where outofStock = True and mrp>300
order by mrp desc;

-- Q3.Calculate Estimated Revenue for each category
select Category,
sum(discountedSellingPrice * quantity)as total_revenue
from zepto_v2
group by Category
order by total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name,mrp,discountPercent
from zepto_v2
where mrp >500 and discountPercent <10;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select Category,
avg(discountPercent) as avg_discount
from zepto_v2
group by Category
order by avg_discount
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name ,
weightInGms,discountedSellingPrice,
round(discountedSellingPrice/weightInGms, 2) as price_per_gms
from zepto_v2
where weightInGms > 100
order by price_per_gms;

-- Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name,weightInGms,
case
	 when weightInGms < 1000 then 'Low'
	 when weightInGms<5000 then 'Medium'
     Else 'Bulk' 
     end as weight_category
from zepto_v2;

-- Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_v2
GROUP BY category
ORDER BY total_weight;








