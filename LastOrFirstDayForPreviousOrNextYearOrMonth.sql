DECLARE @mydate DATETIME
SELECT @mydate = GETDATE()
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@mydate)),@mydate),101),
'Last Day of Previous Month'
UNION
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@mydate)-1),@mydate),101) AS Date_Value,
'First Day of Current Month' AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),@mydate,101) AS Date_Value, 'Today' AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@mydate))),
DATEADD(mm,1,@mydate)),101),
'Last Day of Current Month'
UNION
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@mydate))-1),
DATEADD(mm,1,@mydate)),101),
'First Day of Next Month'
GO



---- Last Day Of Month
----Last Day of Previous Month
SELECT DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0))

----Last Day of Current Month
SELECT DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0))

----Last Day of Next Month
SELECT DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+2,0))


--- Last/Firtst Day Of Year
--To get the first day of the previous year in SQL Server, use the following code:

SELECT DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) - 1, 0)

--To get the last day of the previous year:

SELECT DATEADD(dd, -1, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0))

--To get the first day of the current year:

SELECT DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)

--To get the last day of the current year:

SELECT DATEADD (dd, -1, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) +1, 0))


--To get the first day of the next year:

SELECT DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, 0)

--To get the last day of the next year:

SELECT DATEADD (dd, -1, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) +2, 0))