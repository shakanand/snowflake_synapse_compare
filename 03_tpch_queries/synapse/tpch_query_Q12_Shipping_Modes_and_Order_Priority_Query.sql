DECLARE @paramSHIPMODE1 VARCHAR(10) = 'MAIL'
DECLARE @paramSHIPMODE2 VARCHAR(10) = 'SHIP'
DECLARE @paramDATE DATE = '1994-01-01'

select
l_shipmode,
sum(case
when o_orderpriority ='1-URGENT'
or o_orderpriority ='2-HIGH'
then 1
else 0
end) as high_line_count,
sum(case
when o_orderpriority <> '1-URGENT'
and o_orderpriority <> '2-HIGH'
then 1
else 0
end) as low_line_count
from
[TPCH_SF10000].orders,
[TPCH_SF10000].lineitem
where
o_orderkey = l_orderkey
and l_shipmode in (@paramSHIPMODE1, @paramSHIPMODE2)
and l_commitdate < l_receiptdate
and l_shipdate < l_commitdate
and l_receiptdate >= @paramDATE
and l_receiptdate < DATEADD(y,1,@paramDATE)
group by
l_shipmode
order by
l_shipmode;
