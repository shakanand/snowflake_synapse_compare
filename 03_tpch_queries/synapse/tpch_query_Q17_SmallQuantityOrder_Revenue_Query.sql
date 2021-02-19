DECLARE @paramBRAND			VARCHAR(20) ='Brand#23'
DECLARE @paramCONTAINER		VARCHAR(20) = 'MED BOX'

select
sum(l_extendedprice) / 7.0 as avg_yearly
from
[TPCH_SF1000].lineitem,
[TPCH_SF1000].part
where
p_partkey = l_partkey
and p_brand = @paramBRAND
and p_container = @paramCONTAINER
and l_quantity < (
select
0.2 * avg(l_quantity)
from
[TPCH_SF1000].lineitem
where
l_partkey = p_partkey
);