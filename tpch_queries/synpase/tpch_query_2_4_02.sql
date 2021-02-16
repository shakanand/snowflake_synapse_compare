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
and p_size = [SIZE]
and p_type like '%[TYPE]'
and s_nationkey = n_nationkey
and n_regionkey = r_regionkey
and r_name = '[REGION]'
and ps_supplycost = (
select 
TPC BenchmarkTM H Standard Specification Revision 2.18.0 Page 31
min(ps_supplycost)
from
partsupp, supplier,
nation, region
where
p_partkey = ps_partkey
and s_suppkey = ps_suppkey
and s_nationkey = n_nationkey
and n_regionkey = r_regionkey
and r_name = '[REGION]'
)
order by
s_acctbal desc,
n_name,
s_name,
p_partkey;