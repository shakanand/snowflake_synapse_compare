DECLARE @paramI1 VARCHAR(10) = 13
DECLARE @paramI2 VARCHAR(10) = 31
DECLARE @paramI3 VARCHAR(10) = 23
DECLARE @paramI4 VARCHAR(10) = 29
DECLARE @paramI5 VARCHAR(10) = 30
DECLARE @paramI6 VARCHAR(10) = 18
DECLARE @paramI7 VARCHAR(10) = 17


select
	cntrycode,
	count(*) as numcust,
	sum(c_acctbal) as totacctbal
	from 
		(
			select 
				substring(c_phone,1,2) as cntrycode,
				c_acctbal
			from
				[TPCH_SF1000].customer
			where
				substring(c_phone,1,2) in	(@paramI1,@paramI2,@paramI3,@paramI4,@paramI5,@paramI6,@paramI7) and 
				c_acctbal > (select avg(c_acctbal) from [TPCH_SF1000].customer where c_acctbal > 0.00 and substring (c_phone,1,2) 
				in (@paramI1,@paramI2,@paramI3,@paramI4,@paramI5,@paramI6,@paramI7)
		)
and not exists (select * from [TPCH_SF10000].orders where o_custkey = c_custkey)
) as custsale
group by
cntrycode
order by
cntrycode;