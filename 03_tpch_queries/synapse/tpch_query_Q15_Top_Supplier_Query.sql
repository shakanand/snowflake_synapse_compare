WITH revenue_STREAM_ID (supplier_no, total_revenue) as
(
select
l_suppkey,
sum(l_extendedprice * (1 - l_discount))
from
[TPCH_SF1000].lineitem
where
l_shipdate >= '1996-01-01'
and l_shipdate < DATEADD(m,3,'1996-01-01')
group by
l_suppkey
)

select
s_suppkey,
s_name,
s_address,
s_phone,
total_revenue
from
[TPCH_SF1000].supplier,
revenue_STREAM_ID
where
s_suppkey = supplier_no
and total_revenue = (
select
max(total_revenue)
from
revenue_STREAM_ID
)
order by
s_suppkey;