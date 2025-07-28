USE PR
if object_id('vwPayCalc') IS NOT NULL
DROP view vwPayCalc
GO

CREATE VIEW vwPayCalc AS
SELECT perFrom, perThru, vr.PayID, vr.PPID,
vr.empName, regpay + otpay + holPay + sickPay + persPay + vacpay as grosspay,
(Regpay + otpay + holpay + sickpay + perspay + vacpay) * taxrate as taxwitholding,
inscost
from vwpay vp join vwpayroll vr on vp.ppid = vr.ppid;

select * from vwPayCalc;