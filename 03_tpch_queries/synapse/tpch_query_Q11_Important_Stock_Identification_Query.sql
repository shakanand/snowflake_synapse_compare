DECLARE @paramNATION   VARCHAR(25) = 'GERMANY'
DECLARE @paramFRACTION DECIMAL(12,6) = 0.0001


select
ps_partkey,
sum(ps_supplycost * ps_availqty) as value
from
[TPCH_SF1000].partsupp,
[TPCH_SF1000].supplier,
[TPCH_SF1000].nation
where
ps_suppkey = s_suppkey
and s_nationkey = n_nationkey
and n_name = @paramNATION
group by
ps_partkey having
sum(ps_supplycost * ps_availqty) > (
select
sum(ps_supplycost * ps_availqty) * @paramFRACTION
from
[TPCH_SF10000].partsupp,
[TPCH_SF10000].supplier,
[TPCH_SF10000].nation
where
ps_suppkey = s_suppkey
and s_nationkey = n_nationkey
and n_name = @paramNATION
)
order by
value desc;