DECLARE  @paramDATE     DATE = '1993-01-01'
DECLARE  @paramDISCOUNT DECIMAL(12,2) = 0.06
DECLARE  @paramQUANTITY DECIMAL(12,2) = 24



select
sum(l_extendedprice*l_discount) as revenue
from
[TPCH_SF10000].lineitem
where
l_shipdate >= @paramDATE
and l_shipdate < DATEADD(year,1,@paramDATE)
and l_discount between @paramDISCOUNT - 0.01 and @paramDISCOUNT + 0.01
and l_quantity < @paramQUANTITY;

