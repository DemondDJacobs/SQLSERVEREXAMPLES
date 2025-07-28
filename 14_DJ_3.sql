use pr
go

if object_id('fnInsCost') is not null
drop function fnInsCost
go

create function fnInsCost (@NoDependents INT)
RETURNS Table

RETURN
(SELECT empName, sum(basecost) as TotBaseCost, Sum(SpouseIns) as TotSpouseCost,
sum(depIns) as TotDepCost, Sum(dentalcost) as TotDentalCost, sum(basecost) + Sum(SpouseIns) + sum(depIns) + Sum(dentalcost) AS TotInsCost
from vwPayroll
where dependants = @NoDependents
group by empname);

go
select * from dbo.fnInsCost(2)