IF(object_id(N'[dbo].[YourTable]', 'U') is not null)
--Where object_id takes the 2 char type of object as the second parameter. You can find the list of Object types listed below --in the sys.objects documentation:

--AF = Aggregate function (CLR)
--C = CHECK constraint
--D = DEFAULT (constraint or stand-alone)
--F = FOREIGN KEY constraint
--FN = SQL scalar function
--FS = Assembly (CLR) scalar-function
--FT = Assembly (CLR) table-valued function
--IF = SQL inline table-valued function
--IT = Internal table
--P = SQL Stored Procedure
--PC = Assembly (CLR) stored-procedure
--PG = Plan guide
--PK = PRIMARY KEY constraint
--R = Rule (old-style, stand-alone)
--RF = Replication-filter-procedure
--S = System base table
--SN = Synonym
--SO = Sequence object
--SQ = Service queue
--TA = Assembly (CLR) DML trigger
--TF = SQL table-valued-function
--TR = SQL DML trigger
--TT = Table type
--U = Table (user-defined)
--UQ = UNIQUE constraint
--V = View
--X = Extended stored procedure




-- BASIC EXAMPLE FOR SP/FUNCTION/TEMP DB
IF OBJECT_ID(N'dbo.GetEmployeeDetail','U') IS NOT NULL
	PRINT 'OK'
ELSE
	PRINT 'NOT OK' 

-- FOR SP
IF EXISTS ( SELECT  1 FROM    sys.objects WHERE   object_id = OBJECT_ID(N'myproc') AND type IN ( N'P', N'PC' ))
	PRINT('OK')
ELSE
	PRINT('NOT OK')

-- FOR FUNCTION
IF EXISTS (SELECT 1 FROM sys.objects  WHERE Name = 'ScreeningSearchParam' AND Type IN ( N'FN', N'IF', N'TF', N'FS', N'FT' ))
    PRINT('OK')
ELSE
	PRINT('NOT OK')
GO
-- For Temp DB
IF OBJECT_ID('tempdb..#tmpAllCustomer')  IS NOT NULL
	BEGIN
		DROP TABLE #tmpAllCustomer;		
	END

-- For VIEW
IF EXISTS(select * FROM sys.views where name = '')
    PRINT('OK')
ELSE
	PRINT('NOT OK')
	--OR -
IF OBJECT_ID('nView', 'V') IS NOT NULL
    DROP VIEW nView;
GO
---INDEX 1
IF EXISTS (SELECT 1 FROM sys.indexes I  WHERE I.Name = 'IX_Customer_Name' AND I.object_id = OBJECT_ID('dbo.Customer'))
BEGIN
    PRINT 'Index Exists!'
END
---INDEX 2

IF EXISTS (SELECT 1
            FROM sys.indexes I
                INNER JOIN sys.tables T
                    ON I.object_id = T.object_id
                INNER JOIN sys.schemas S
                    ON S.schema_id = T.schema_id
            WHERE I.Name = 'IX_Customer_Name' -- Index name
                AND T.Name = 'Customer' -- Table name
                AND S.Name = 'dbo') --Schema Name
BEGIN
    PRINT 'Index Exists!'
END
GO
IF EXISTS (SELECT 1 FROM sys.triggers WHERE Name = 'AfterTriggerExample')
BEGIN
    PRINT 'Trigger Exists'
END
GO
-- Check Column
IF EXISTS(SELECT 1 FROM sys.columns  WHERE Name = N'columnName' AND Object_ID = Object_ID(N'schemaName.tableName'))
BEGIN
    -- Column Exists
END
-- Check Constrint.
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'PK_MyPK'))
BEGIN
	ALTER TABLE Employee ADD CONSTRAINT DF_SomeName DEFAULT N'SANDNES' FOR CityBorn;
END