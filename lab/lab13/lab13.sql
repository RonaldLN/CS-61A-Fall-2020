.read data.sql


CREATE TABLE average_prices AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select category, avg(MSRP) as average_price from products group by category;


CREATE TABLE lowest_prices AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select store, item, min(price) from inventory group by item;


create table helper as
  select a.name as name, min(a.MSRP/a.rating), b.store as store 
  from products as a, lowest_prices as b where a.name = b.item group by category;

CREATE TABLE shopping_list AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select name, store from helper;


CREATE TABLE total_bandwidth AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select sum(a.Mbs) from stores as a, shopping_list as b 
  where a.store = b.store;

