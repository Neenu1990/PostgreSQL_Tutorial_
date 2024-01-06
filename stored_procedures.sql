--Introduction to PostgreSQL CREATE PROCEDURE statement

/*A drawback of user-defined functions is that they cannot execute transactions. In other words, inside a user-defined function, you cannot start a transaction, and commit or rollback it.

PostgreSQL 11 introduced stored procedures that support transactions.

To define a new stored procedure, you use the create procedure statement.

The following illustrates the basic syntax of the create procedure statement: */

create [or replace] procedure procedure_name(parameter_list)
language plpgsql
as $$
declare
-- variable declaration
begin
-- stored procedure body
end; $$

/*In this syntax:

First, specify the name of the stored procedure after the create procedure keywords.
Second, define parameters for the stored procedure. A stored procedure can accept zero or more parameters.
Third, specify plpgsql as the procedural language for the stored procedure. Note that you can use other procedural languages for the stored procedure such as SQL, C, etc.
Finally, use the dollar-quoted string constant syntax to define the body of the stored procedure.
Parameters in stored procedures can have the in and inout modes. They cannot have the out mode. */


