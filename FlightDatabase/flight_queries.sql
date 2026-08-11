-- Query 1: select all columns from the aircrafts table
Select * from aircrafts;

-- Query 2: select the name and description columns from the aircrafts table
Select name, description from aircrafts;

-- Query 3:	Select the distinct "name" from the aircrafts table.
Select distinct name From aircrafts;

-- Query 4:	Select name and city from the airports table.  Alias the name to "Airport name".
Select name as "Airport_Name", city from airports;

-- Query 5: Select name, city and elevation for all airports that have a country id of 24.
Select name, city, elevation from airports where country_id = 24;

-- Query 6: Select the country from the country table that has an id of 24.
Select name from countries where id = 24;

-- Query 7: Select airports that have an elevation between 400 and 500.  You must make sure to include 400 and 500.
select name from airports where elevation >= 400, <= 500;

-- Query 8: Select all airlines who has a name that start with "Air".
Select name from airlines where name like 'Air%';

-- Query 9: Select all airlines that have a name that contains “International”.
Select name from airlines where name like '%International%';

-- Query 10: Select all airlines that have a name that ends in “Aviation”.
Select name from airlines where name like '%Aviation';

-- Query 11: Select all airports in Canada that have an elevation of 0.
select name from airports where elevation = 0;

-- Query 12: Select all airlines in France that have an active status of “Y”.
select name from airlines where active like 'Y';