DECLARE @paramDATE DATE = '1994-01-01'
DECLARE @paramREGION VARCHAR(20)  = 'ASIA'

select
n_name,
sum(l_extendedprice * (1 - l_discount)) as revenue
from
[TPCH_SF1000].customer,
[TPCH_SF1000].orders,
[TPCH_SF1000].lineitem,
[TPCH_SF1000].supplier,
[TPCH_SF1000].nation,
[TPCH_SF1000].region
where
c_custkey = o_custkey
and l_orderkey = o_orderkey
and l_suppkey = s_suppkey
and c_nationkey = s_nationkey
and s_nationkey = n_nationkey
and n_regionkey = r_regionkey
and r_name = @paramREGION
and o_orderdate >= @paramDATE
and o_orderdate <  DATEADD(year,1,@paramDATE)
group by
n_name
order by
revenue desc;