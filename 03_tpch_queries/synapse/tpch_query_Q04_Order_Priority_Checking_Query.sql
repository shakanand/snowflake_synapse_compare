DECLARE @paramDATE DATE = '1993-07-01'

select
o_orderpriority,
count(*) as order_count
from
[TPCH_SF10000].orders
where
o_orderdate >= @paramDATE
and o_orderdate < DATEADD(m,3,@paramDATE)
and exists (
select
*
from
[TPCH_SF10000].lineitem
where
l_orderkey = o_orderkey
and l_commitdate < l_receiptdate
)
group by
o_orderpriority
order by
o_orderpriority