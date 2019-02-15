
DECLARE @FullName VarChar(25)
SET @FullName = '109511144-HASAN' 
SELECT CHARINDEX('-', @FullName) as [Index] ,
       SUBSTRING(@FullName,1,CHARINDEX('-', @FullName)) as Part,
	   SUBSTRING(@FullName,1,CHARINDEX('-', @FullName) - 1) as Part2,
	   SUBSTRING(@FullName,1,15)
GO