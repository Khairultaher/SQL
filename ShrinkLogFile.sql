        ALTER DATABASE AdventureWorks2012
        SET RECOVERY SIMPLE
        GO
	    /*
		    SELECT name FROM sys.master_files WHERE type_desc = 'LOG'
			SELECT name, physical_name AS current_file_location
			FROM sys.master_files
		*/
        DBCC SHRINKFILE (AdventureWorks2012_log, 1)
        GO
        ALTER DATABASE AdventureWorks2012
		SET RECOVERY FULL
	GO