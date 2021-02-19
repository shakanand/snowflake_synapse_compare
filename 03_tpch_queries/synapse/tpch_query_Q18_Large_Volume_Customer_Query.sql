  
DECLARE @paramQUANTITY DECIMAL(12,2) = 300

select
c_name,
c_custkey,
o_orderkey,
o_orderdate,
o_totalprice,
sum(l_quantity) as sum_l_quantity
from
[TPCH_SF1000].customer,
[TPCH_SF1000].orders,
[TPCH_SF1000].lineitem
where
o_orderkey in (
select
l_orderkey
from
[TPCH_SF1000].lineitem
group by
l_orderkey having
sum(l_quantity) > @paramQUANTITY
)
and c_custkey = o_custkey
and o_orderkey = l_orderkey
group by
c_name,
c_custkey,
o_orderkey,
o_orderdate,
o_totalprice
order by
o_totalprice desc,
o_orderdate;