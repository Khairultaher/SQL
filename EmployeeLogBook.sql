
IF OBJECT_ID(N'dbo.GetEmployeeLogInfo') IS NOT NULL
DROP PROCEDURE  GetEmployeeLogInfo
GO
-- EXEC GetEmployeeLogInfo '2017-05-01','2017-05-31'
CREATE PROCEDURE GetEmployeeLogInfo(
                                     @pFromDate DATE,
									 @pToDate DATE
							       )
AS
BEGIN

	DECLARE @FromDate DATE = @pFromDate
	DECLARE  @ToDate DATE = @pToDate 

	IF OBJECT_ID('tempdb..#LogBook')  IS NOT NULL
		BEGIN
			DROP TABLE #LogBook;		
		END
	IF OBJECT_ID('tempdb..#LogBook2')  IS NOT NULL
		BEGIN
			DROP TABLE #LogBook2;		
		END


	;WITH LogBook
	as(
		SELECT  empMaLog.EmployeeId,
				 CONCAT(ISNULL(emp.FirstName,''),' ',ISNULL(emp.MiddleName,''),' ',ISNULL(emp.LastName,'')) as FullName,
				 d.DesignationName as Designation,
				CAST(CONVERT(VARCHAR(8),empMaLog.LoginTime,108) as VARCHAR) as LoginTime,
				CAST(CONVERT(VARCHAR(8),empMaLog.LogoutTime,108) as VARCHAR) as LogoutTime,
				CAST(empMaLog.OTHours as VARCHAR) as Ot ,		
				CAST(empMaLog.Date as DATE) as [Date]
		FROM EmployeeManualLogins AS empMaLog 	
		LEFT JOIN Employees AS emp ON empMaLog.EmployeeId=emp.Id 
		LEFT JOIN Designations d ON emp.DesignationId=d.Id 
		WHERE CAST(empMaLog.Date as DATE) >= @FromDate AND CAST(empMaLog.Date as DATE) <= @ToDate
	) 
	SELECT  * INTO #LogBook
	FROM LogBook ORDER BY [Date],EmployeeId

	SELECT * INTO #LogBook2
	FROM #LogBook
	UNPIVOT
	(
	  [Time] FOR Event IN (LoginTime,LogoutTime,Ot)
	
	) as pvt


	DECLARE @SqlQuery NVARCHAR(MAX) = ''
	DECLARE @colList VARCHAR(MAX) 

	SELECT @colList = COALESCE(@colList + ', ','') + '['+CAST(Date as VARCHAR(MAX))+']' FROM (SELECT DISTINCT [Date] FROM #LogBook2)    as DistinctDateColumn ORDER BY Date

	SET @SqlQuery = '
				SELECT DENSE_RANK() OVER (ORDER BY EmployeeId) as SL#,* 
				FROM #LogBook2 
				PIVOT
				 (
				   MAX([Time]) FOR [Date] IN ('+@colList+')
				 )  as FinalLogBook  ORDER BY EmployeeId '


	PRINT(@SqlQuery)
	EXEC sp_executesql @SqlQuery;
END