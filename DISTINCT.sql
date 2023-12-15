--PostgreSQL SELECT DISTINCT

The DISTINCT clause is used in the SELECT statement to remove duplicate rows from a result set. The DISTINCT clause keeps one row for each group of duplicates. The DISTINCTclause can be applied to one or more columns in the select list of the SELECT statement.

The following illustrates the syntax of the DISTINCT clause:

SELECT
   DISTINCT column1
FROM
   table_name;
   
  --If you specify multiple columns, the DISTINCT clause will evaluate the duplicate based on the combination of values of these columns.
  SELECT
   DISTINCT column1, column2
FROM
   table_name;
  
--In this case, the combination of values in both column1 and column2 columns will be used for evaluating the duplicate.

--PostgreSQL also provides the DISTINCT ON (expression) to keep the “first” row of each group of duplicates using the following syntax:
SELECT
   DISTINCT ON (column1) column_alias,
   column2
FROM
   table_name
ORDER BY
   column1,
   column2;
   
   /*The order of rows returned from the SELECT statement is unspecified therefore the “first” row of each group of the duplicate is also unspecified.

It is a good practice to always use the ORDER BY clause with the DISTINCT ON(expression) to make the result set predictable.

Notice that the DISTINCT ON expression must match the leftmost expression in the ORDER BY clause. */

PostgreSQL SELECT DISTINCT examples

--Let’s create a new table called distinct_demo and insert data into it for practicing the DISTINCT clause.

CREATE TABLE distinct_demo (
	id serial NOT NULL PRIMARY KEY,
	bcolor VARCHAR,
	fcolor VARCHAR
);

INSERT INTO distinct_demo (bcolor, fcolor)
VALUES
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');
   
select * from distinct_demo;

select distinct id "ID" from distinct_demo
ORDER BY id;

select distinct bcolor from distinct_demo;
select distinct bcolor,fcolor from distinct_demo;

--The following statement demonstrates how to use the DISTINCT clause on multiple columns:

SELECT
	DISTINCT bcolor,
	fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;

 --The query returns the unique combination of bcolor and fcolor from the distinct_demo table. 
 
 PostgreSQL DISTINCT ON example
 
 --The following statement sorts the result set by the  bcolor and  fcolor, and then for each group of duplicates, it keeps the first row in the returned result set.
 
 SELECT
	DISTINCT ON (bcolor) bcolor,
	fcolor
FROM
	distinct_demo 
ORDER BY
		bcolor,
		fcolor;
 
 
  