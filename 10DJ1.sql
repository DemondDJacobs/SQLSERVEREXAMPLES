USE PR
if object_id('vwPayroll') IS NOT NULL
DROP view vwPayroll
GO

CREATE VIEW vwPayroll AS
SELECT perFrom, P.PERTHRU, PAYID, P.PPID,
FIRSTNAME + ' ' + LASTNAME AS EMPNAME, PAYRATE, IIF([SALARIED] > 0, PAYRATE * 1.5, 0) AS OTRATE,
WORKHOURS, HOLHOURS, SICKHOURS, VACHOURS, PERSHOURS, IIF([HOLHOURS]>0, IIF([WORKHOURS]>32,[WORKHOURS] - 32,0),IIF([WORKHOURS]>40, [WORKHOURS] - 40,0)) AS OTHOURS,
basecost, spousecost, depcost, dentalcost, spouse, dependants, WHAllowance,
IIF([Spouse]=1, [spousecost],0) AS spouseINs, IIF([dependants]>0,[Dependants]*[depcost], 0) AS depins,
IIF([Whallowance]=1, .33, IIF([whallowance]=2, .25, IIF([whallowance]=3, .17, IIF([whallowance]=4, .11, .08)))) as taxrate
FROM PAYPERIOD P JOIN HOURS H ON P.PPID = H.PPID
JOIN WORK W ON W.WORKID = H.WORKID
    JOIN EMPDATA E ON E.EMPID = W.EMPID
        JOIN benefits b on b.BenPlanID = e.BenPlanID