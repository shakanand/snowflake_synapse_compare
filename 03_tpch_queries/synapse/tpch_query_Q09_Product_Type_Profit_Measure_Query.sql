DECLARE @paramCOLOR VARCHAR(10) = '%GREEN%'

select
nation,
o_year,
sum(amount) as sum_profit
from (
select
n_name as nation,
YEAR(o_orderdate) as o_year,
l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
from
[TPCH_SF1000].part,
[TPCH_SF1000].supplier,
[TPCH_SF1000].lineitem,
[TPCH_SF1000].partsupp,
[TPCH_SF1000].orders,
[TPCH_SF1000].nation
where
s_suppkey = l_suppkey
and ps_suppkey = l_suppkey
and ps_partkey = l_partkey
and p_partkey = l_partkey
and o_orderkey = l_orderkey
and s_nationkey = n_nationkey
and p_name like @paramCOLOR
) as profit
group by
nation,
o_year
order by
nation,
o_year desc;