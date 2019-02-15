
-- SELECT * FROM Product where Id = 45
-- SELECT * FROM AccountInformations

DECLARE @TableName VARCHAR(100) = 'AccountType'
DECLARE @UsedIn VARCHAR(100) = ''

--SELECT DISTINCT Field_Name
--FROM(
SELECT DISTINCT O.name SP_Name,T.name Table_Name,c.name Field_Name
FROM sys.sysdepends D 
JOIN sys.sysobjects O ON O.id = D.id
JOIN sys.sysobjects T ON T.id = D.depid
JOIN sys.columns C ON C.column_id = d.depnumber and C.object_id = D.depID
WHERE T.name = @TableName AND  O.xtype IN ('P','FN','V') --CASE WHEN @UsedIn IS NOT NULL AND @UsedIn <> '' THEN @UsedIn ELSE O.xtype END 
--) a
GO
Declare @sql varchar(max) ;
SELECT @sql=Object_definition(object_id)
FROM   sys.procedures
WHERE  name = 'SCR_ReScreenExistingCustomer';
print @sql
