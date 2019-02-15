

--EXEC sp_fkeys 'Company'

--- Alter Reference table with nocheck
SELECT name as Foreign_Key
,schema_name(schema_id) as Schema_Name
,'alter table ' + object_name(parent_object_id) + ' nocheck constraint all'  as Table_Name_with_nocheck
FROM sys.foreign_keys
WHERE Referenced_object_id = object_id('dbo.Company','U');

--- Alter Reference table with check
SELECT name as Foreign_Key
,schema_name(schema_id) as Schema_Name
,'alter table ' + object_name(parent_object_id) + ' check constraint all'  as Table_Name_with_check
FROM sys.foreign_keys
WHERE Referenced_object_id = object_id('dbo.Company','U');


--- Alter Reference table with nocheck
alter table CompanyLocation nocheck constraint all

--- Delete unnecessary data
delete from Company where Id = 3

--- Alter Reference table with check
alter table CompanyLocation check constraint all

