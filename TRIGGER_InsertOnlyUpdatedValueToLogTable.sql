create table Employees (id int identity, Name varchar(50), Password varchar(50))
create table EmployeesLog (id int identity, LogDate datetime, EmployeeId int, Name varchar(50), Password varchar(50))
go
ALTER trigger Employees_Trigger_Update on Employees
after update
as
	insert into EmployeesLog (EmployeeId, LogDate,Name,Password) 
	select i.id
	      ,getdate()
		  ,IIF(i.Name <> d.Name, d.Name, '' )
		  ,IIF(i.Password <> d.Password, d.Password, '' )
	FROM inserted i
	INNER JOIN  deleted d ON i.ID = d.ID
go
insert into Employees (Name, Password) values ('Zaphoid', '6')
insert into Employees (Name, Password) values ('Beeblebox', '7')

-- DELETE Log

SELECT * FROM Employees
update Employees set Name = 'khairul' where id = 1
SELECT * FROM Employees
SELECT * FROM Log