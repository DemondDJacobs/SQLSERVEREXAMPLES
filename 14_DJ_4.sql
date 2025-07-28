use pr
go

if object_id('fnPromotions') is not null
drop function fnPromotions;

go
create function fnPromotions (@LastName Varchar(50))
RETURNS Table

RETURN
(SELECT FirstName, LastName, Convert(varchar, HireDate, 1) as hiredate, Dept, Title, Grade, PayRate, CONVERT(varchar,startdate,1) as PayStart, convert(varchar, enddate, 1) as PayEnd, convert(varchar, termdate, 1) as TermDate
from empdata e join work w on e.empid=w.empid join department d on d.DeptID =w.WorkID
where e.LastName = @lastName
);

go
select * from dbo.fnPromotions('Reed')