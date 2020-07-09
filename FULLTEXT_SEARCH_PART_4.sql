
IF OBJECT_ID('CustomerInfoIndexView','V') IS NOT NULL
	DROP VIEW CustomerInfoIndexView
GO
CREATE VIEW CustomerInfoIndexView WITH SCHEMABINDING 
AS
SELECT 
       be.AddressID as Id
      ,pp.FirstName
	  ,pp.MiddleName
	  ,pp.LastName
      ,[AddressLine1] as [Address]
      ,[City]
FROM [Person].[Address] pa
INNER JOIN [Person].[BusinessEntityAddress] be ON  pa.AddressID = be.AddressID
INNER JOIN Person.Person pp ON be.BusinessEntityID = pp.BusinessEntityID
GO
IF NOT EXISTS(SELECT 1 FROM sys.indexes 
              WHERE name='CIX_CustomerInfoIndexView_Id' 
			  AND object_id = OBJECT_ID('dbo.CustomerInfoIndexView')
			  )
	CREATE UNIQUE CLUSTERED INDEX CIX_CustomerInfoIndexView_Id 
	ON dbo.CustomerInfoIndexView(Id)
GO 



SELECT * FROM CustomerInfoIndexView WHERE FREETEXT(*,'Gigi')
GO


CREATE FULLTEXT INDEX ON CustomerInfoIndexView (
  FirstName,
  LastName,
  [Address],
  City
) KEY INDEX CIX_CustomerInfoIndexView_Id
GO

SELECT * FROM CustomerInfoIndexView WHERE FREETEXT(*,'Gig')
GO
SELECT * FROM CustomerInfoIndexView WHERE CONTAINS(*,'"Gig*"')
GO



SELECT * FROM CustomerInfoIndexView WHERE FREETEXT(*,'Gigi Butl')
UNION
SELECT * FROM CustomerInfoIndexView WHERE CONTAINS(*,'"Gig*" OR "Butl*"' )
GO

SELECT * FROM CustomerInfoIndexView WHERE CONTAINS(*,'"Gig*"' )
