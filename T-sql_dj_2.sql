USE PR
DECLARE @EmpTitleAndPlan table
(EmpName varchar(50), EmpTitle varchar(50), InsPlan varchar(50))
INSERT @EmpTitleAndPlan
SELECT FIRSTNAME + ' ' + LASTNAME, TITLE, planname
FROM empdata
WHERE benplanid in (select benplanid from benefits)

BEGIN
END