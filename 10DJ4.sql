use pr
select perfrom, perthru, empname, cast(grosspay as decimal(9,2)) as grosspay,
cast(taxwitholding as decimal(9,2)) as taxes, inscost, cast((grosspay - inscost - taxwitholding) as decimal(9,2)) as netpay
from vwpaycalc
where perthru = (select max(perthru) from vwpaycalc)