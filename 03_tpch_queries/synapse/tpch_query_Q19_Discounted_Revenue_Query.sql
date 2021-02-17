DECLARE @paramQUANTITY1 DECIMAL(12,2) = 1
DECLARE @paramQUANTITY2 DECIMAL(12,2) = 10
DECLARE @paramQUANTITY3 DECIMAL(12,2) = 20
DECLARE @paramBRAND1 VARCHAR(20) = 'Brand#12'
DECLARE @paramBRAND2 VARCHAR(20) = 'Brand#23'
DECLARE @paramBRAND3 VARCHAR(20) = 'Brand#34'

select
sum(l_extendedprice * (1 - l_discount) ) as revenue
from
[TPCH_SF10000].lineitem,
[TPCH_SF10000].part
where
(
p_partkey = l_partkey
and p_brand = @paramBRAND1
and p_container in ( 'SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
and l_quantity >= @paramQUANTITY1 and l_quantity <= @paramQUANTITY1 + 10
and p_size between 1 and 5
and l_shipmode in ('AIR', 'AIR REG')
and l_shipinstruct = 'DELIVER IN PERSON'
)
or
(
p_partkey = l_partkey
and p_brand = @paramBRAND2
and p_container in ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
and l_quantity >= @paramQUANTITY2 and l_quantity <= @paramQUANTITY2 + 10
and p_size between 1 and 10
and l_shipmode in ('AIR', 'AIR REG')
and l_shipinstruct = 'DELIVER IN PERSON'
)
or
(
p_partkey = l_partkey
and p_brand = @paramBRAND3
and p_container in ( 'LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
and l_quantity >= @paramQUANTITY3 and l_quantity <= @paramQUANTITY3 + 10
and p_size between 1 and 15
and l_shipmode in ('AIR', 'AIR REG')
and l_shipinstruct = 'DELIVER IN PERSON'
);