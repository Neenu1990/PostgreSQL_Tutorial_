     --PostgreSQL Subquery

/*Suppose we want to find the films whose rental rate is higher than the average rental rate. We can do it in two steps:

Find the average rental rate by using the SELECT statement and average function ( AVG).
Use the result of the first query in the second SELECT statement to find the films that we want.*/

--The following subquery  gets the rental rate whcih is higher than the average rental rate:

SELECT
	film_id,
	title,
	rental_rate
FROM
	film
WHERE
	rental_rate > (
		SELECT
			AVG (rental_rate)
		FROM
			film
	);
	
/*The query inside the brackets is called a subquery or an inner query. The query that contains the subquery is known as an outer query.

PostgreSQL executes the query that contains a subquery in the following sequence:

First, executes the subquery.
Second, gets the result and passes it to the outer query.
Third, executes the outer query. */

--PostgreSQL subquery with IN operator

SELECT
	film_id,
	title
FROM
	film
WHERE
	film_id IN (
		SELECT
			inventory.film_id
		FROM
			rental
		INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
		WHERE
			return_date BETWEEN '2005-05-29'
		AND '2005-05-30'
	);

--PostgreSQL subquery with EXISTS operator

/*A subquery can be an input of the EXISTS operator. If the subquery returns any row, the EXISTS operator returns true. If the subquery returns no row, the result of EXISTS operator is false.

The EXISTS operator only cares about the number of rows returned from the subquery, not the content of the rows,*/

--therefore, the common coding convention of EXISTS operator is as follows:

EXISTS (SELECT 1 FROM tbl WHERE condition);

--Example:

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS (
		SELECT
			1
		FROM
			payment
		WHERE
			payment.customer_id = customer.customer_id
	);