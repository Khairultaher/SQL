USE master
GO

CREATE DATABASE DataCapture
GO

USE DataCapture
GO

CREATE TABLE Customer (
CustomerId INT  PRIMARY KEY
,FirstName VARCHAR(30)
,LastName VARCHAR(30)
,Amount_purchased DECIMAL
)
GO
 
INSERT INTO dbo.Customer( CustomerId, FirstName,    LastName,    Amount_Purchased)
VALUES
(1, 'Frank', 'Sinatra',20000.00),( 2,'Shawn', 'McGuire',30000.00),( 3,'Amy', 'Carlson',40000.00)
GO
 
SELECT * FROM dbo.Customer
 
-- Now enable CDC at the Database Level
EXEC sys.sp_cdc_enable_db  
GO

-- Second Level
EXEC sp_changedbowner 'sa'
GO

EXEC sys.sp_cdc_enable_db  
GO

-- Enable on the table level
EXEC sys.sp_cdc_enable_table   
   @source_schema = N'dbo',
   @source_name   = N'Customer',
   @role_name     = NULL,
   @filegroup_name = N'Primary',
   @supports_net_changes = 0
GO

-- CHECK

-- insert a row
INSERT INTO Customer (Customerid, FirstName, LastName, Amount_purchased)
VALUES (4, 'Ameena', 'Lalani', 50000)
GO

-- delete a row
DELETE FROM dbo.Customer 
WHERE CustomerId = 2
GO
 
-- update a row
UPDATE Customer
SET Lastname = 'Clarkson' WHERE CustomerId = 3
GO
 
-- Let us query to see what it reports
SELECT * FROM dbo.Customer
 
Declare @begin_lsn binary (10), @end_lsn binary (10)

-- get the first LSN for customer changes
select @begin_lsn = sys.fn_cdc_get_min_lsn('dbo_customer')

-- get the last LSN for customer changes
select @end_lsn = sys.fn_cdc_get_max_lsn()

-- get individual changes in the range
select * from cdc.fn_cdc_get_all_changes_dbo_customer(@begin_lsn, @end_lsn, 'all');