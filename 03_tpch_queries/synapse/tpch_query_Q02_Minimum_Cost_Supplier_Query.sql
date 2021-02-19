DECLARE @paramSIZE   INT = 15
DECLARE @paramTYPE   VARCHAR(20) = '%BRASS'
DECLARE @paramREGION VARCHAR(20) = 'EUROPE'



select
s_acctbal,
s_name,
n_name,
p_partkey,
p_mfgr,
s_address,
s_phone,
s_comment
from
[TPCH_SF1000].part,
[TPCH_SF1000].supplier,
[TPCH_SF1000].partsupp,
[TPCH_SF1000].nation,
[TPCH_SF1000].region
where
p_partkey = ps_partkey
and s_suppkey = ps_suppkey
and p_size = @paramSIZE
and p_type like @paramTYPE
and s_nationkey = n_nationkey
and n_regionkey = r_regionkey
and r_name = @paramREGION
and ps_supplycost = (
select 
min(ps_supplycost)
from
[TPCH_SF1000].partsupp, [TPCH_SF1000].supplier,
[TPCH_SF1000].nation, [TPCH_SF1000].region
where
p_partkey = ps_partkey
and s_suppkey = ps_suppkey
and s_nationkey = n_nationkey
and n_regionkey = r_regionkey
and r_name = @paramREGION
)
order by
s_acctbal desc,
n_name,
s_name,
p_partkey;