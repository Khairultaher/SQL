SELECT CASE FULLTEXTSERVICEPROPERTY('IsFullTextInstalled')
			WHEN 1 THEN 'Full-Text installed.' 
			ELSE 'Full-Text is NOT installed.' 
	   END
GO
--exec sp_fulltext_database 'enable'
--Create catalog
CREATE FULLTEXT CATALOG SearchCatalog AS DEFAULT;
GO
-- SELECT * FROM CustomerInfo
--DROP FULLTEXT INDEX ON CustomerInfo
CREATE FULLTEXT INDEX ON CustomerInfo (
  FirstName,
  LastName,
  [Address],
  City
) KEY INDEX PK_CustomerInfo
GO
DECLARE @SearchParam NVARCHAR(250)
SET @SearchParam = N'Gigi Matthew Brown';
--SELECT *
--FROM CustomerInfo
--WHERE FREETEXT(*, @SearchParam)
SELECT 
	ftt.RANK,p.*
FROM CustomerInfo p
INNER JOIN FREETEXTTABLE(CustomerInfo, *, @SearchParam) as ftt ON ftt.[KEY] = p.Id
ORDER BY ftt.RANK DESC

