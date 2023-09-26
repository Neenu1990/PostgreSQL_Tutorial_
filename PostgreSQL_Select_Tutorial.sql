                      -- PostgreSQl
--PostgreSQL was invented at the Berkeley Computer Science Department, University of California.
--PostgreSQL is an advanced relational database system.

--PostrgeSQL supports both relational (SQL) and non-relational (JSON) queries.

--PostgreSQL is free and open-source.

--Querying Data 
-- Select – show you how to query data from a single table.
-- Column aliases – learn how to assign temporary names to columns or expressions in a query.
-- Order By – guide you on how to sort the result set returned from a query.
-- Select Distinct  – provide you with a clause that removes duplicate rows in the result set.

                             Select Statement
							 
 1. Query to select first_name from table 'actor'
 
select first_name from actor;

--The semicolon is not a part of the SQL statement. It is used to signal PostgreSQL the end of an SQL statement.
--The semicolon is also used to separate two SQL statements.

2.SELECT statement to query data from multiple columns

SELECT
   first_name,
   last_name,
   email
FROM
   customer;
3) Using PostgreSQL SELECT statement to query data from all columns of a table

SELECT * FROM customer;
--an asterisk (*) in the SELECT clause, which is a shorthand for all columns.
--Instead of listing all columns in the SELECT clause,
--we just used the asterisk (*) to save some typing.

4) Using PostgreSQL SELECT statement with expressions

SELECT 
   first_name || ' ' || last_name,
   email
FROM 
   customer;
   
--In this example, we used the concatenation operator || to concatenate the first name, space, and last name of every customer.
5) Using PostgreSQL SELECT statement with expressions

select 5*8;

--In this tutorial, you have learned how to use a basic form of the PostgreSQL SELECT statement to query data from a single table.