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
part,
supplier,
partsupp,
nation,
region
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
partsupp, supplier,
nation, region
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