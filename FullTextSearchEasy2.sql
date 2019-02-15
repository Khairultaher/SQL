-- SELECT * FROM CustomerSearchIndexView 
SELECT * FROM CustomerSearchIndexView WHERE FREETEXT(*,'ABC BANK')
SELECT * FROM FREETEXTTABLE(CustomerSearchIndexView,*,'ABC BANK') 
SELECT * FROM CustomerSearchIndexView WHERE CONTAINS(*,'ABC')


-- #Customer Part..
IF OBJECT_ID('CustomerSearchIndexViewLog','V') IS NOT NULL
	DROP VIEW CustomerSearchIndexViewLog
GO
CREATE VIEW CustomerSearchIndexViewLog WITH SCHEMABINDING 
AS
SELECT  ci.Id as CustomerId,
        LTRIM(RTRIM(ISNULL(ci.CustomerNo,'')))
		+' '+LTRIM(RTRIM(ISNULL(ci.CustUniqTrackNo ,'')))
		+ ' ' +(IIF(ci.FirstName IS NULL,'',ci.FirstName + ' ') + IIF(ci.MiddleName IS NULL,'',ci.MiddleName + ' ') + IIF(ci.LastName IS NULL,'',ci.LastName))
        + ' ' +LTRIM(RTRIM(ISNULL(ci.ScrCustomerType, ''))) 
        + ' ' +LTRIM(RTRIM(ISNULL(ci.PresentCountry, ''))) 
        + ' ' +LTRIM(RTRIM(ISNULL(ci.PresentCity, ''))) 
		+ ' ' +LTRIM(RTRIM(ISNULL(ci.Mobile , '')))
             as CustomerInfo
	FROM dbo.CustomerInformations ci 
	
GO
IF NOT EXISTS(SELECT 1 FROM sys.indexes 
              WHERE name='CIX_CustomerSearchIndexViewLog_CustomerId' AND object_id = OBJECT_ID('dbo.CustomerSearchIndexViewLog'))
	CREATE UNIQUE CLUSTERED INDEX CIX_CustomerSearchIndexViewLog_CustomerId ON dbo.CustomerSearchIndexViewLog(CustomerId)
GO
CREATE FULLTEXT CATALOG VelocityModified AS DEFAULT;
GO
CREATE FULLTEXT INDEX ON CustomerSearchIndexViewLog (
  CustomerInfo
) KEY INDEX CIX_CustomerSearchIndexViewLog_CustomerId;
GO
-- SELECT * FROM CustomerSearchIndexView 
SELECT * FROM CustomerSearchIndexViewLog WHERE FREETEXT(*,'UNITED STATES')
SELECT * FROM FREETEXTTABLE(CustomerSearchIndexViewLog,*,'UNITED STATES') 
SELECT * FROM CustomerSearchIndexViewLog WHERE CONTAINS(*,'STATES')