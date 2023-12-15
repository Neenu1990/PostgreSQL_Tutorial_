-- This is a single-line comment

/*
   This is a
   multi-line comment
*/
SELECT * FROM table_name;



--To retrieve a column from a table in PostgreSQL :
--Here's a basic example:

SELECT column_name FROM table_name;

                   --PostgreSQL ORDER BY
					 
--The ORDER BY clause allows you to sort rows returned by 
--a SELECT clause in ascending or descending order based on a sort expression.

--The following illustrates the syntax of the ORDER BY clause:

SELECT
	select_list
FROM
	table_name
ORDER BY
	sort_expression1 [ASC | DESC],
        ...
	sort_expressionN [ASC | DESC];
	
	--In this syntax:

/*First, specify a sort expression, which can be a column or an expression, that you want to sort after the ORDER BY keywords. 
If you want to sort the result set based on multiple columns or expressions, you need to place a comma (,) between two columns or expressions to separate them.
Second, you use the ASC option to sort rows in ascending order and the DESC option to sort rows in descending order. 
If you omit the ASC or DESC option, the ORDER BY uses ASC by default.*/

-- Using PostgreSQL ORDER BY clause to sort rows by multiple columns

SELECT first_name,last_name FROM actor
ORDER BY first_name asc ,  last_name desc;

--4) Using PostgreSQL ORDER BY clause to sort rows by expressions

The LENGTH() function accepts a string and returns the length of that string.

--The following statement selects the first names and their lengths. It sorts the rows by the lengths of the first names:

select first_name,length(first_name) "Length" from actor
order by "Length" desc;


--PostgreSQL ORDER BY clause and NULL

/*When you sort rows that contains NULL, you can specify the order of NULL with other non-null values by using the NULLS FIRST or NULLS LAST option of the ORDER BY clause:*/

ORDER BY sort_expresssion [ASC | DESC] [NULLS FIRST | NULLS LAST]

-- create a new table
CREATE TABLE sort_demo(
	num INT
);

-- insert some data
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);

--The following query returns data from the sort_demo table:

SELECT num
FROM sort_demo
ORDER BY num;

SELECT num
FROM sort_demo
ORDER BY num NULLS LAST;

SELECT num
FROM sort_demo
ORDER BY num NULLS FIRST;




