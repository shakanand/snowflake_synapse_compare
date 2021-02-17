DECLARE @paramDATE DATE = '1995-09-01'
select
100.00 * sum(case
when p_type like 'PROMO%'
then l_extendedprice*(1-l_discount)
else 0
end) / sum(l_extendedprice * (1 - l_discount)) as promo_revenue
from
[TPCH_SF10000].lineitem,
[TPCH_SF10000].part
where
l_partkey = p_partkey
and l_shipdate >= @paramDATE
and l_shipdate < DATEADD(month,1,@paramDATE)