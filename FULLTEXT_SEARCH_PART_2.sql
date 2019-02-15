
-- SELECT * FROM CustomerInformations

DECLARE @pSearchParam NVARCHAR(250) = 'COXS BAZAR PHARMACY'

-- SELECT * FROM CustomerSearchIndexView 
IF OBJECT_ID('tempdb..#FreeTestTable')  IS NOT NULL
	DROP TABLE #FreeTestTable;

CREATE TABLE #FreeTestTable
(
	CustomerId BIGINT,
	Rank FLOAT
)

-- SELECT * FROM   FREETEXTTABLE(CustomerSearchIndexViewLog,*,'ABC')
DECLARE @Str NVARCHAR(MAX) = LTRIM(RTRIM(@pSearchParam))
SET @Str = (SELECT REPLACE(@Str, ',', '|'))
SET @Str = '|'+(SELECT REPLACE(@Str, ' ', '|')) +'|'
DECLARE @Part NVARCHAR(MAX)
DECLARE @IND    INT
SET @IND = CHARINDEX('|',@Str)
DECLARE @EIND INT set @EIND = 0
DECLARE @Counter INT = 0
WHILE(@IND != LEN(@STR))
BEGIN
	DECLARE @SearchWord NVARCHAR(250) = ''
    SET  @EIND = ISNULL(((CHARINDEX('|', @Str, @IND + 1)) - @IND - 1), 0)
    SELECT @SearchWord = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
	IF(@SearchWord IS NOT NULL AND @SearchWord <> '')
		BEGIN
			INSERT INTO #FreeTestTable( CustomerId,Rank)
			SELECT * FROM   FREETEXTTABLE(CustomerFullTextSearchIndexView,*,@SearchWord)
		END
    SELECT @IND = ISNULL(CHARINDEX('|', @STR, @IND + 1), 0)
	SET @Counter = @Counter +1
END
--PRINT(@Counter)
;WITH ScoreByCustomerId
AS(
	SELECT ft.CustomerId, SUM(ft.Rank) as Rank
    FROM #FreeTestTable ft 
	GROUP BY ft.CustomerId
	HAVING SUM(ft.Rank) >= CASE WHEN @Counter > 1 THEN AVG(ft.Rank)  ELSE (AVG(ft.Rank)-1)  END
)
SELECT TOP(10) ROUND(ft.Rank/@Counter,0) as Rank,ci.*
FROM CustomerInformations ci
INNER JOIN ScoreByCustomerId ft ON ci.Id = ft.CustomerId
ORDER BY ft.Rank DESC
