SELECT * FROM datasheet.dairy_products;

--  1.total revenue genearated by each product

use datasheet;
select  ProductName,round(sum(total_rev ))as total_revenue
from dairy_products group by ProductName order by total_revenue desc;

-- 2.give brand with hightest total revenue 

select Brand, round(max(total_rev)) as high_rev from
dairy_products group by Brand order by high_rev desc limit 1;

-- 3.give monthly revenue trend across all products

select sum(total_rev)as sum ,monthname(Date) as  months from dairy_products
group by  months order by sum desc;


-- 4.products below the minimum stock threshold

select ProductName,min_stock_th,qty_stock from dairy_products 
where min_stock_th >= qty_stock ; 

-- 5.total reorder quantity required per product 

  select ProductName,sum(min_stock_th) as total_reorder_qty from dairy_products
  group by ProductName order by total_reorder_qty desc; 
  
-- 6.which sales channel genrates the most revenue 

select sale_ch, round(sum(total_rev))as revenue from dairy_products
group by  sale_ch order by revenue desc limit 1 ;

-- 7.top 5 customer location by purchase volume

select Location ,round(sum(TotalValue)) as purchase_volume from dairy_products 
group by Location order by purchase_volume desc limit 5;

-- 8.Average selling price per product 

select ProductName, round(avg(price_per_unit)) as price from dairy_products
group by ProductName order by price desc;

-- 9.Compare selling price with listed price

select  productName, PriceperUnit,price_per_unit as price_per_unit_sold from dairy_products;

  

-- 10.products with less than 10 days shelf life remaining

 select ProductName ,round(avg(ShelfLife))  as min_shelf_life from dairy_products
 where ShelfLife <10 group by ProductName 
 order by min_shelf_life ;
 
-- 11. average shelf  life by product category

select ProductName,round(avg(ShelfLife)) as avg_shelf_life from dairy_products group by ProductName order by avg_shelf_life ;

-- 12. Average number of cows per farm size category

select FarmSize,round(avg(NumberofCows)) as avg_no_cows
 from dairy_products group by FarmSize;

-- 13.location with the largest total land area

select Location,max(Total_Landarea) as largest_area from dairy_products group by Location order by largest_area  desc limit 1; 

-- 14.top 3 location by average production quantity

select Location, round(avg(Quantity)) as avg_qty from dairy_products group by Location order by  avg_qty desc limit 3;

-- 15. calculate profit for each product

select ProductName, round( avg(total_rev)) as avg_profit from dairy_products group by ProductName order by  avg_profit ;

-- 16.Most profitable brand overall

select Brand, round( avg(total_rev)) as avg_profit from dairy_products
 group by Brand order by  avg_profit desc limit 1 ;


-- 17.Yearly revenue growth

select year(Date) as year,round(sum(total_rev)) as total_revenue from dairy_products 
group by year order by total_revenue ;


-- 18.best-selling product each year

select productname,Brand, year(date) as year , sum(qty_sold) as best_selling from 
dairy_products group by productname,year,Brand order by best_selling desc  ;
 
 
 
-- 19.Product that need the immediate restock

select Productname , min_stock_th , qty_stock from dairy_products where min_stock_th >qty_stock  ;

--

-- 20.Identify expired product still in stock

select ProductName, date, ex_date from dairy_products where ex_date < date ; 
 
-- 21.Average shelf life per brand
 
 select Brand, round(avg(ShelfLife)) as avg_shelf_life from dairy_products group by Brand order by  avg_shelf_life ;


-- 22.Most popular product in each customer location 

select cus_loc,productname , sum(qty_sold) from dairy_products group by cus_loc,productname ;

