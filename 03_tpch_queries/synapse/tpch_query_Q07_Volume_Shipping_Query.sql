DECLARE @paramNATION1 VARCHAR(25) = 'CANADA'
DECLARE @paramNATION2 VARCHAR(25) = 'BRAZIL'

select
supp_nation,
cust_nation,
l_year, sum(volume) as revenue
from (
select
n1.n_name as supp_nation,
n2.n_name as cust_nation,
YEAR(l_shipdate) as l_year,
l_extendedprice * (1 - l_discount) as volume
from
[TPCH_SF1000].supplier,
[TPCH_SF1000].lineitem,
[TPCH_SF1000].orders,
[TPCH_SF1000].customer,
[TPCH_SF1000].nation n1,
[TPCH_SF1000].nation n2
where
s_suppkey = l_suppkey
and o_orderkey = l_orderkey
and c_custkey = o_custkey
and s_nationkey = n1.n_nationkey
and c_nationkey = n2.n_nationkey
and (
(n1.n_name    = @paramNATION1 and n2.n_name = @paramNATION2)
or (n1.n_name = @paramNATION2 and n2.n_name = @paramNATION1)
)
and l_shipdate between '1995-01-01' and '1996-12-31'
) as shipping
group by
supp_nation,
cust_nation,
l_year
order by
supp_nation,
cust_nation,
l_year;