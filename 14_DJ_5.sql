use pr
go

if object_id('TempEmpData') is not null
drop table TempEmpData;
if object_id('TempWork') is not null
drop table TempWork;

go
Select * into TempEmpData from EmpData;
go
select * into tempWork from work;

go
if object_id('trTempEmpData_Insert_Update_Delete') is not null
drop trigger trTempEmpData_Insert_Update_Delete;

go
create trigger trTempEmpData_Insert_Update_Delete
ON tempEmpData
After insert, update, delete
AS
IF exists (select d.empid from DELETED d join tempWork t on d.EmpID = t.EmpID)
begin
RAISERROR('Invalid',1,1)
ROllback tran
end
else
update tempempdata
set benPlanID = 9
where empID in (select empid from tempWork);

go
delete tempempdata
where empID = 41