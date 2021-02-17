DECLARE @paramWORD1 VARCHAR(20) = 'special'
DECLARE @paramWORD2 VARCHAR(20) = 'requests'

select
c_count, count(*) as custdist
from (
select
c_custkey,
count(o_orderkey)
from
[TPCH_SF10000].customer left outer join [TPCH_SF10000].orders on
c_custkey = o_custkey
and o_comment not like '%'+ @paramWORD1 + '%'+ @paramWORD2 +'%'
group by
c_custkey
)as c_orders (c_custkey, c_count)
group by
c_count
order by
custdist desc,
c_count desc;
