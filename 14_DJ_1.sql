use pr
go

if object_id('fnTotalPaid') is not null
drop function fnTotalPaid
go

create function fnTotalPaid (@empName varchar(50))
RETURNS money

BEGIN
RETURN
(SELECT sum(grosspay)
from vwPayCalc
where empName = @empName)
END;

go
PRINT 'The total gross pay for Joseph walker is $' + Convert(varchar, dbo.fnTotalPaid('Joseph Walker')) + '.'