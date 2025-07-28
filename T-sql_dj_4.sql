USE PR
if object_id('WorkCopy') is not null
Drop table WorkCopy
go

DECLARE @WorkCopy table
(workid int, payRate money, salaried bit, startdate smalldatetime,
enddate smalldatetime, cola bit, empid int, deptid int)
declare @avgpay int

SET @avgpay = (select avg(payrate) from @workcopy)

insert @workcopy
select workid, payRate, salaried, startdate,
enddate, cola, empid, deptid
from work
where enddate is null

while @avgpay < 32
BEGIN
update @workcopy
SET payRate = payrate + .10
IF (select(payRate) from @WorkCopy) > 65
begin
break
end
else
continue
end
set @avgpay = (select avg(payrate) from @WorkCopy)

begin
select * from @WorkCopy order by payRate desc
end