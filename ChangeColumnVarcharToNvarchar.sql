
IF OBJECT_ID('tempdb..#VarcharToNvarchar') IS NOT NULL
	DROP TABLE #VarcharToNvarchar

SELECT  'ALTER TABLE ' + isnull(schema_name(syo.id), 'dbo') + '.[' +  syo.name +'] ' 
		+ ' ALTER COLUMN [' + syc.name + '] NVARCHAR(' + case syc.length when -1 then 'MAX' 
			ELSE convert(nvarchar(10),syc.length) end + ') '+ 
			case  syc.isnullable when 1 then ' NULL' ELSE ' NOT NULL' END +';' as AlteColumn
	INTO #VarcharToNvarchar
	   FROM sysobjects syo 
	   JOIN syscolumns syc ON 
		 syc.id = syo.id 
	   JOIN systypes syt ON 
		 syt.xtype = syc.xtype 
	   WHERE 
		 syt.name = 'varchar' 
		and syo.xtype='U'


DECLARE @ColumnName NVARCHAR(MAX)
DECLARE @MatchedList AS CURSOR;
SET @MatchedList = CURSOR LOCAL FAST_FORWARD
FOR SELECT * FROM #VarcharToNvarchar 
OPEN @MatchedList;
FETCH NEXT FROM @MatchedList INTO @ColumnName
WHILE @@FETCH_STATUS = 0
    BEGIN	
	      PRINT(@ColumnName)	
        --EXEC (@ColumnName)
        FETCH NEXT FROM @MatchedList INTO @ColumnName
    END;
CLOSE @MatchedList;
DEALLOCATE @MatchedList;