IF OBJECT_ID(N'AlterDropAttemptHistory') IS  NULL
BEGIN
	CREATE TABLE AlterDropAttemptHistory(
		EventType varchar(500),
		PostTime Datetime,
		LoginName varchar(500),
		UserName varchar(500),
		DatabaseName varchar(500),
		SchemaName varchar(500),
		ObjectName varchar(500),
		ObjectType varchar(500),
		CommandText varchar(500),
		HostName varchar(100)
	)
END
----DISABLE TRIGGER DTR_Prevent_Table_Alter_Drop ON DATABASE;
----ENABLE TRIGGER DTR_Prevent_Table_Alter_Drop ON DATABASE;

CREATE Trigger [DTR_Prevent_Table_Alter_Drop]
ON DATABASE 
--ON ALL SERVER
--WITH EXECUTE as 'sa'
FOR DROP_TABLE, ALTER_TABLE  
--FOR DDL_DATABASE_LEVEL_EVENTS  

AS
Declare 
@EventType varchar(500),
@PostTime Datetime,
@LoginName varchar(500),
@UserName varchar(500),
@DatabaseName varchar(500),
@SchemaName varchar(500),
@ObjectName varchar(500),
@ObjectType varchar(500),
@CommandText varchar(500),
@HostName varchar(100)

Select 
 @EventType = EVENTDATA().value('(EVENT_INSTANCE/EventType)[1]', 'sysname'),
 @PostTime = EVENTDATA().value('(EVENT_INSTANCE/PostTime)[1]', 'datetime'),
 @LoginName = EVENTDATA().value('(EVENT_INSTANCE/LoginName)[1]', 'sysname'),
 @UserName = EVENTDATA().value('(EVENT_INSTANCE/UserName)[1]', 'sysname'),
 @DatabaseName = EVENTDATA().value('(EVENT_INSTANCE/DatabaseName)[1]', 'sysname'),
 @SchemaName = EVENTDATA().value('(EVENT_INSTANCE/SchemaName)[1]', 'sysname'),
 @ObjectName = EVENTDATA().value('(EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
 @ObjectType = EVENTDATA().value('(EVENT_INSTANCE/ObjectType)[1]', 'sysname'),
 @CommandText = EVENTDATA().value('(EVENT_INSTANCE//TSQLCommand[1]/CommandText)[1]', 'nvarchar(max)'),
 @HostName= Host_name()
RAISERROR ('You don''t have permission to alter/drop table from this database', 10, 1);
ROLLBACK;
INSERT INTO AlterDropAttemptHistory
SELECT @EventType,@PostTime,@LoginName,@UserName,@DatabaseName,@SchemaName,@ObjectName,@ObjectType ,@CommandText,@HostName
Return
GO

ENABLE TRIGGER [DTR_Prevent_Table_Alter_Drop] ON DATABASE
GO


