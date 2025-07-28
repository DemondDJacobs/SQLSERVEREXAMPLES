USE PR
if object_id('vwPay') IS NOT NULL
DROP view vwPay
GO

CREATE VIEW vwPay AS
SELECT PayId, PPID, EmpName,
(workHours - OTHOURS) * payrate as RegPay,
OTrate * Othours AS OTPay, payrate * holhours as HolPay,
payrate * sickhours as SickPay, payrate *vachours as VacPay, payrate * pershours as PersPay,
basecost + spouseIns + depIns + dentalCost as inscost

FROM vwpayroll;

SELECT * from vwpayroll;