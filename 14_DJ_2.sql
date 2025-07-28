use pr
go

if object_id('fnInsPlan') is not null
drop function fnInsPlan
go

create function fnInsPlan (@planName varchar(50))
RETURNS int

BEGIN
RETURN
(SELECT count(empid)
from Benefits b join empdata e on b.BenPlanID=e.BenPlanID
where planName = @planName)
END;

go
PRINT 'The total number of employees on a 90 day probion period is ' + Convert(varchar, dbo.fnInsPlan('90 Day Probation Period')) + '.'