                         --PostgreSQL PL/pgSQL
/*PL/pgSQL procedural language adds many procedural elements, e.g., control structures, loops, and complex computations, to extend standard SQL. 
It allows you to develop complex functions and stored procedures in PostgreSQL that may not be possible using plain SQL.*/


/*PL/pgSQL procedural language adds many procedural elements, e.g., control structures, loops, and complex computations, to extend standard SQL. 

It allows you to develop complex functions and stored procedures in PostgreSQL that may not be possible using plain SQL.*/


--PL/pgSQL Block Structure

--PL/pgSQL is a block-structured language, therefore, a PL/pgSQL function or stored procedure is organized into blocks.

--The following illustrates the syntax of a complete block in PL/pgSQL:

[ <<label>> ]
[ declare
    declarations ]
begin
    statements;
	...
end [ label ];


/* Let’s examine the block structure in more detail:

Each block has two sections: declaration and body. The declaration section is optional while the body section is required. 
A block is ended with a semicolon (;) after the END keyword.
A block may have an optional label located at the beginning and at the end. 
You use the block label when you want to specify it in the EXIT statement of the block body or when you want to qualify the names of variables declared in the block.
The declaration section is where you declare all variables used within the body section. Each statement in the declaration section is terminated with a semicolon (;).
The body section is where you place the code. Each statement in the body section is also terminated with a semicolon (;). */


--PL/pgSQL block structure example

--The following example illustrates a very simple block. It is called an anonymous block.

do $$ 
<<first_block>>
declare
  film_count integer := 0;
begin
   -- get the number of films
   select count(*) 
   into film_count
   from film;
   -- display a message
   raise notice 'The number of films is %', film_count;
end first_block $$;



--Notice that the DO statement does not belong to the block. It is used to execute an anonymous block. PostgreSQL introduced the DO statement since version 9.0.

--The anonymous block has to be surrounded in single quotes like this:


'<<first_block>>
declare
  film_count integer := 0;
begin
   -- get the number of films
   select count(*) 
   into film_count
   from film;
   -- display a message
   raise notice ''The number of films is %'', film_count;
end first_block';


--we can use the dollar-quoted string constant syntax to make it more readable.

--The following example illustrates how to declare and initialize variables:

do $$ 
declare
   counter    integer := 1;
   first_name varchar(50) := 'John';
   last_name  varchar(50) := 'Doe';
   payment    numeric(11,2) := 20.5;
begin 
   raise notice '% % % has been paid % USD', 
       counter, 
	   first_name, 
	   last_name, 
	   payment;
end $$;


/*   PL/pgSQL Subblocks
PL/pgSQL allows you to place a block inside the body of another block.

The block nested inside another block is called a subblock. The block that contains the subblock is referred to as an outer block.*/

