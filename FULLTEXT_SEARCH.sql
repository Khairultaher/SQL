-- #Customer Part..
IF OBJECT_ID('CustomerSearchIndexView','V') IS NOT NULL
	DROP VIEW CustomerSearchIndexView
GO
CREATE VIEW CustomerSearchIndexView WITH SCHEMABINDING 
AS
SELECT  ci.Id as CustomerId,
        ci.CustomerNo,
		ci.CustUniqTrackNo,
        (IIF(ci.FirstName IS NULL,'',ci.FirstName + ' ') + IIF(ci.MiddleName IS NULL,'',ci.MiddleName + ' ') + IIF(ci.LastName IS NULL,'',ci.LastName)) as FullName,
        LTRIM(RTRIM(ISNULL(ci.ScrCustomerType, ''))) as CustomerType,
        LTRIM(RTRIM(ISNULL(ci.PresentCountry, ''))) as Country,
        LTRIM(RTRIM(ISNULL(ci.PresentCity, ''))) as City,
		ci.Mobile as Mobile,
		ci.FatherName as FatherName,
		ci.MotherName as MotherName
	FROM dbo.CustomerInformations ci 
	INNER JOIN dbo.CustomerDynamicInformations cd  ON ci.CustUniqTrackNo = cd.CustUniqTrackNo 
GO
IF NOT EXISTS(SELECT 1 FROM sys.indexes 
              WHERE name='CIX_CustomerSearchIndexView_CustomerId' AND object_id = OBJECT_ID('dbo.CustomerSearchIndexView'))
	CREATE UNIQUE CLUSTERED INDEX CIX_CustomerSearchIndexView_CustomerId ON dbo.CustomerSearchIndexView(CustomerId)
GO
-- #Related Party Part..
IF OBJECT_ID('RelatedPartySearchIndexView','V') IS NOT NULL
	DROP VIEW RelatedPartySearchIndexView
GO
CREATE VIEW RelatedPartySearchIndexView WITH SCHEMABINDING 
AS
SELECT  rs.Id as RelationshipId,
        rs.CustomerId,
        (IIF(rp.FirstName IS NULL,'',rp.FirstName + ' ') + IIF(rp.MiddleName IS NULL,'',rp.MiddleName + ' ') + IIF(rp.LastName IS NULL,'',rp.LastName)) as FullName,
        LTRIM(RTRIM(ISNULL(rp.ScrCustomerType, ''))) as CustomerType,
        LTRIM(RTRIM(ISNULL(rp.PresentCountry, ''))) as Country,
        LTRIM(RTRIM(ISNULL(rp.PresentCity, ''))) as City,
		rp.Mobile as Mobile,
		rp.FatherName as FatherName,
		rp.MotherName as MotherName
	FROM dbo.CustomerAccountsRelPartyRelationship rs 
	INNER JOIN dbo.RelatedPartyInformations rp ON rs.RelatedPartyId = rp.Id
GO
IF NOT EXISTS(SELECT 1 FROM sys.indexes 
              WHERE name='CIX_RelatedPartySearchIndexView_RelationshipId' AND object_id = OBJECT_ID('dbo.RelatedPartySearchIndexView'))
	CREATE UNIQUE CLUSTERED INDEX CIX_RelatedPartySearchIndexView_RelationshipId ON dbo.RelatedPartySearchIndexView(RelationshipId)
GO
-- #Accounts Part..
IF OBJECT_ID('AccountInfoSearchIndexView','V') IS NOT NULL
	DROP VIEW AccountInfoSearchIndexView
GO
CREATE VIEW AccountInfoSearchIndexView WITH SCHEMABINDING 
AS
  SELECT ca.Id as CustomerAccountId,
         ca.CustomerId,
         CAST(AccountNumber as NVARCHAR(50)) as AccountNumber,
		 AccountTitle
  FROM dbo.CustomerAccounts ca 
  INNER JOIN dbo.AccountInformations ai ON ca.AccountId = ai.Id
GO
IF NOT EXISTS(SELECT 1 FROM sys.indexes 
              WHERE name='CIX_AccountInfoSearchIndexView_CustomerAccountId' AND object_id = OBJECT_ID('dbo.AccountInfoSearchIndexView'))
	CREATE UNIQUE CLUSTERED INDEX CIX_AccountInfoSearchIndexView_CustomerAccountId ON dbo.AccountInfoSearchIndexView(CustomerAccountId)
GO  

---------------Test Part --------------------------------------------
       
-- SELECT * FROM CustomerSearchIndexView 
SELECT * FROM CustomerSearchIndexView WHERE FREETEXT(*,'Rihs kanij sultana')
-- SELECT * FROM RelatedPartySearchIndexView 
SELECT * FROM RelatedPartySearchIndexView WHERE FREETEXT(*,'ASIM OMAR')
-- SELECT * FROM AccountInfoSearchIndexView
SELECT * FROM AccountInfoSearchIndexView WHERE FREETEXT(*,'ASIM OMAR')

DECLARE @SearchParam NVARCHAR(250) = 'Rihs kanij sultana'

IF OBJECT_ID('tempdb..#FreeTestTable')  IS NOT NULL
	DROP TABLE #FreeTestTable;

CREATE TABLE #FreeTestTable
(
	CustomerId BIGINT,
	Rank FLOAT
)

INSERT INTO #FreeTestTable( CustomerId,Rank)
SELECT * FROM FREETEXTTABLE(CustomerSearchIndexView,*,@SearchParam) WHERE RANK > 0;

INSERT INTO #FreeTestTable( CustomerId,Rank)
SELECT * FROM FREETEXTTABLE(RelatedPartySearchIndexView,*,@SearchParam) WHERE RANK > 0;

INSERT INTO #FreeTestTable( CustomerId,Rank)
SELECT * FROM FREETEXTTABLE(AccountInfoSearchIndexView,*,@SearchParam) WHERE RANK > 0;

SELECT ft.Rank,ci.*
FROM CustomerInformations ci
INNER JOIN #FreeTestTable ft ON ci.Id = ft.CustomerId
ORDER BY ft.Rank DESC







SELECT *
FROM CustomerInformations
WHERE Id IN (SELECT CustomerId FROM CustomerSearchIndexView WHERE FREETEXT(*,@SearchParam))
   OR Id IN (SELECT CustomerId FROM RelatedPartySearchIndexView WHERE FREETEXT(*,@SearchParam))
   OR Id IN (SELECT CustomerId FROM AccountInfoSearchIndexView WHERE FREETEXT(*,@SearchParam))
GO

DECLARE @SearchParam NVARCHAR(250) = '310001'

SELECT *
FROM CustomerInformations
WHERE Id IN (SELECT CustomerId FROM CustomerSearchIndexView WHERE CONTAINS(*,@SearchParam))
   OR Id IN (SELECT CustomerId FROM RelatedPartySearchIndexView WHERE CONTAINS(*,@SearchParam))
   OR Id IN (SELECT CustomerId FROM AccountInfoSearchIndexView WHERE CONTAINS(*,@SearchParam))

GO
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
		+ ' ' +LTRIM(RTRIM(ISNULL(ci.FatherName , '')))
		+ ' ' +LTRIM(RTRIM(ISNULL(ci.MotherName, ''))) as CustomerInfo
	FROM dbo.CustomerInformations ci 
	INNER JOIN dbo.CustomerDynamicInformations cd  ON ci.CustUniqTrackNo = cd.CustUniqTrackNo AND ci.CustomerDynamicInfoId = cd.Id
GO
IF NOT EXISTS(SELECT 1 FROM sys.indexes 
              WHERE name='CIX_CustomerSearchIndexViewLog_CustomerId' AND object_id = OBJECT_ID('dbo.CustomerSearchIndexViewLog'))
	CREATE UNIQUE CLUSTERED INDEX CIX_CustomerSearchIndexViewLog_CustomerId ON dbo.CustomerSearchIndexViewLog(CustomerId)
GO
