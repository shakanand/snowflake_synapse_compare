DECLARE @paramCOLOR    VARCHAR(20) = 'forest'
DECLARE @paramDATE	   DATE = '1994-01-01'
DECLARE @paramNATION   VARCHAR(20) = 'CANADA'

select
s_name,
s_address
from
[TPCH_SF1000].supplier, [TPCH_SF1000].nation
where
s_suppkey in (
select
ps_suppkey
from
[TPCH_SF1000].partsupp
where
ps_partkey in (
select
p_partkey
from
[TPCH_SF1000].part
where
p_name like @paramCOLOR + '%'
)
and ps_availqty > (
select
0.5 * sum(l_quantity)
from
[TPCH_SF1000].lineitem
where
l_partkey = ps_partkey
and l_suppkey = ps_suppkey
and l_shipdate >= @paramDATE
and l_shipdate < DATEADD(y,1,@paramDATE)
)
)
and s_nationkey = n_nationkey
and n_name = @paramNATION
order by
s_name;