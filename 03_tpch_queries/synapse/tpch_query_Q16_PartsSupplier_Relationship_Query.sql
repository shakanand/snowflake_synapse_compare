DECLARE @paramBRAND VARCHAR(20) = 'Brand#45'
DECLARE @paramTYPE VARCHAR(20) = 'MEDIUM POLISHED'
DECLARE @paramSIZE1 BIGINT = 49
DECLARE @paramSIZE2 BIGINT = 14
DECLARE @paramSIZE3 BIGINT = 23
DECLARE @paramSIZE4 BIGINT = 45
DECLARE @paramSIZE5 BIGINT = 19
DECLARE @paramSIZE6 BIGINT = 3
DECLARE @paramSIZE7 BIGINT = 36
DECLARE @paramSIZE8 BIGINT = 9



select
p_brand,
p_type,
p_size,
count(distinct ps_suppkey) as supplier_cnt
from
[TPCH_SF1000].partsupp,
[TPCH_SF1000].part
where
p_partkey = ps_partkey
and p_brand <> @paramBRAND
and p_type not like @paramTYPE + '%'
and p_size in (@paramSIZE1,@paramSIZE2,@paramSIZE3,@paramSIZE4,@paramSIZE5,@paramSIZE6,@paramSIZE7,@paramSIZE8)
and ps_suppkey not in (
select
s_suppkey
from
[TPCH_SF1000].supplier
where
s_comment like '%Customer%Complaints%'
)
group by
p_brand,
p_type,
p_size
order by
supplier_cnt desc,
p_brand,
p_type,
p_size;