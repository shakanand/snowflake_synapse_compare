DECLARE @paramDATE DATE = '1994-01-01'

select
c_custkey,
c_name,
sum(l_extendedprice * (1 - l_discount)) as revenue,
c_acctbal,
n_name,
c_address,
c_phone,
c_comment
from
[TPCH_SF1000].customer,
[TPCH_SF1000].orders,
[TPCH_SF1000].lineitem,
[TPCH_SF1000].nation
where
c_custkey = o_custkey
and l_orderkey = o_orderkey
and o_orderdate >= @paramDATE
and o_orderdate < DATEADD(month,3,@paramDATE)
and l_returnflag = 'R'
and c_nationkey = n_nationkey
group by
c_custkey,
c_name,
c_acctbal,
c_phone,
n_name,
c_address,
c_comment
order by
revenue desc;