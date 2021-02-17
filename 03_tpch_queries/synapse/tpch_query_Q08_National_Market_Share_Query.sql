DECLARE @paramNATION VARCHAR(25) = 'BRAZIL'
DECLARE @paramREGION VARCHAR(25) = 'CANADA'
DECLARE @paramTYPE   VARCHAR(25) = 'STANDARD ANODIZED TIN'

select
o_year,
sum(case
when nation = @paramNATION
then volume
else 0
end) / sum(volume) as mkt_share
from (
select
YEAR(o_orderdate) as o_year,
l_extendedprice * (1-l_discount) as volume,
n2.n_name as nation
from
[TPCH_SF10000].part,
[TPCH_SF10000].supplier,
[TPCH_SF10000].lineitem,
[TPCH_SF10000].orders,
[TPCH_SF10000].customer,
[TPCH_SF10000].nation n1,
[TPCH_SF10000].nation n2,
[TPCH_SF10000].region
where
p_partkey = l_partkey
and s_suppkey = l_suppkey
and l_orderkey = o_orderkey
and o_custkey = c_custkey
and c_nationkey = n1.n_nationkey
and n1.n_regionkey = r_regionkey
and r_name = @paramREGION
and s_nationkey = n2.n_nationkey
and o_orderdate between  '1995-01-01' and '1996-12-31'
and p_type = @paramTYPE
) as all_nations
group by
o_year
order by
o_year;
