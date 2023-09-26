            --Introduction to the PostgreSQL column aliases
--A column alias allows you to assign a column or an expression in the select list of a SELECT statement a temporary name. 
--The column alias exists temporarily during the execution of the query.
--PostgreSQL column alias examples
1) Assigning a column alias to a column

SELECT 
   first_name, 
   last_name
FROM customer;
--Give alias name for last_name
SELECT 
   first_name, 
   last_name AS surname
FROM customer;

--Or you can make it shorter by removing the AS keyword as follows:

SELECT 
   first_name, 
   last_name surname
FROM customer;

2) Assigning a column alias to an expression

--The following query returns the full names of all customers.
--It constructs the full name by concatenating the first name, space, and the last name:

SELECT 
   first_name || ' ' || last_name 
FROM 
   customer;
   
-- the heading of the column is not meaningful ?column? .

--To fix this, you can assign the expression first_name || ' ' || last_name a column alias e.g., full_name:

SELECT 
   first_name || ' ' || last_name AS full_name 
FROM 
   customer;
   
3) Column aliases that contain spaces

--If a column alias contains one or more spaces, you need to surround it with double quotes like this:
column_name AS "column alias"

SELECT 
   first_name || ' ' || last_name  "full name" 
FROM 
   customer;
   
                             Summary
--Assign a column or an expression a column alias using the syntax column_name AS alias_name or expression AS alias_name.
--The AS keyword is optional.
--Use double quotes (“) to surround a column alias that contains spaces.
