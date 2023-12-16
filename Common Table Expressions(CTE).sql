--PostgreSQL CTE (common table expressions)

/*A common table expression is a temporary result set which you can reference within another SQL statement including SELECT, INSERT, UPDATE or DELETE.

Common Table Expressions are temporary in the sense that they only exist during the execution of the query.*/

--The following shows the syntax of creating a CTE:

WITH cte_name (column_list) AS (
    CTE_query_definition 
)
statement;

/*In this syntax:

First, specify the name of the CTE following by an optional column list.
Second, inside the body of the WITH clause, specify a query that returns a result set. 
If you do not explicitly specify the column list after the CTE name, the select list of the CTE_query_definition will become the column list of the CTE.
Third, use the CTE like a table or view in the statement which can be a SELECT, INSERT, UPDATE, or DELETE.
Common Table Expressions or CTEs are typically used to simplify complex joins and subqueries in PostgreSQL.*/

PostgreSQL CTE examples

WITH cte_film AS (
    SELECT 
        film_id, 
        title,
        (CASE 
            WHEN length < 30 THEN 'Short'
            WHEN length < 90 THEN 'Medium'
            ELSE 'Long'
        END) "Length"   
    FROM
        film
)
SELECT
    film_id,
    title,
    "Length"
FROM 
    cte_film
WHERE
    "Length" = 'Long'
ORDER BY 
    title; 
	
	
--Joining a CTE with a table example

--The following statement illustrates how to join a CTE with a table:

WITH cte_rental AS (
    SELECT staff_id,
        COUNT(rental_id) rental_count
    FROM   rental
    GROUP  BY staff_id
)
SELECT s.staff_id,
    first_name,
    last_name,
    rental_count
FROM staff s
    INNER JOIN cte_rental USING (staff_id); 
	
	
--Using CTE with a window function example

--The following statement illustrates how to use the CTE with the RANK() window function:

WITH cte_film AS  (
    SELECT film_id,
        title,
        rating,
        length,
        RANK() OVER (
            PARTITION BY rating
            ORDER BY length DESC) 
        length_rank
    FROM 
        film
)
SELECT *
FROM cte_film
WHERE length_rank = 1;

--Explanation

/*The CTE is named cte_film and selects columns film_id, title, rating, length, and a calculated column length_rank.
The RANK() window function is used to assign a rank to each film's length within its rating partition. 
The ranking is based on the length in descending order (ORDER BY length DESC).
The PARTITION BY clause ensures that the ranking is done separately for each distinct rating category.*/
	
--PostgreSQL CTE advantages

--The following are some advantages of using common table expressions or CTEs:

/*Improve the readability of complex queries. You use CTEs to organize complex queries in a more organized and readable manner.
Ability to create recursive queries. Recursive queries are queries that reference themselves. 
The recursive queries come in handy when you want to query hierarchical data such as organization chart or bill of materials.
Use in conjunction with window functions. You can use CTEs in conjunction with window functions to create an initial result set and
use another select statement to further process this result set.*/


	
	
