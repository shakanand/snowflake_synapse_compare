DECLARE @paramSEGMENT VARCHAR(20) = 'BUILDING'
DECLARE @paramDATE DATE = '1995-03-15'
select
l_orderkey,
sum(l_extendedprice*(1-l_discount)) as revenue,
o_orderdate,
o_shippriority
from
[TPCH_SF1000].customer,
[TPCH_SF1000].orders,
[TPCH_SF1000].lineitem
where
c_mktsegment = @paramSEGMENT
and c_custkey = o_custkey
and l_orderkey = o_orderkey
and o_orderdate < @paramDATE
and l_shipdate  > @paramDATE
group by
l_orderkey,
o_orderdate,
o_shippriority
order by
revenue desc,
o_orderdate;