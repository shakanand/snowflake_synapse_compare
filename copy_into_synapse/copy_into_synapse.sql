COPY INTO [TPCH_SF1000].[_STAGING_CUSTOMER]
(
C_CUSTKEY,
C_NAME,
C_ADDRESS,
C_NATIONKEY,
C_PHONE,
C_ACCTBAL,
C_MKTSEGMENT,
C_COMMENT
)
FROM 'https://tpchsf100.dfs.core.windows.net/tpchsf1000/CUSTOMER/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO
COPY INTO [TPCH_SF1000].[_STAGING_LINEITEM]
(
L_ORDERKEY,
L_PARTKEY,
L_SUPPKEY,
L_LINENUMBER,
L_QUANTITY,
L_EXTENDEDPRICE,
L_DISCOUNT,
L_TAX,
L_RETURNFLAG,
L_LINESTATUS,
L_SHIPDATE,
L_COMMITDATE,
L_RECEIPTDATE,
L_SHIPINSTRUCT,
L_SHIPMODE,
L_COMMENT
)
FROM 'https://tpchsf100.dfs.core.windows.net/tpchsf1000/LINEITEM/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO

COPY INTO [TPCH_SF1000]._STAGING_NATION
(
N_NATIONKEY,
N_NAME,
N_REGIONKEY,
N_COMMENT
)
FROM 'https://tpchsf100.dfs.core.windows.net/tpchsf1000/NATION/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO

COPY INTO [TPCH_SF1000]._STAGING_ORDERS
(
O_ORDERKEY,
O_CUSTKEY,
O_ORDERSTATUS,
O_TOTALPRICE,
O_ORDERDATE,
O_ORDERPRIORITY,
O_CLERK,
O_SHIPPRIORITY,
O_COMMENT
)
FROM 'https://tpchsf100.dfs.core.windows.net/tpchsf1000/ORDERS/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO

COPY INTO [TPCH_SF1000]._STAGING_PART
(
P_PARTKEY,
P_NAME,
P_MFGR,
P_BRAND,
P_TYPE,
P_SIZE,
P_CONTAINER,
P_RETAILPRICE,
P_COMMENT
)
FROM 'https://tpchsf100.dfs.core.windows.net/tpchsf1000/PART/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO

COPY INTO [TPCH_SF1000]._STAGING_PARTSUPP
(
PS_PARTKEY,
PS_SUPPKEY,
PS_AVAILQTY,
PS_SUPPLYCOST,
PS_COMMENT
)
FROM 'https://tpchsf100.dfs.core.windows.net/tpchsf1000/PARTSUPP/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO

COPY INTO [TPCH_SF1000]._STAGING_REGION
(
R_REGIONKEY,
R_NAME,
R_COMMENT
)
FROM 'https://tpchsf100.dfs.core.windows.net/tpchsf1000/REGION/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO

COPY INTO [TPCH_SF1000]._STAGING_SUPPLIER
(
S_SUPPKEY,
S_NAME,
S_ADDRESS,
S_NATIONKEY,
S_PHONE,
S_ACCTBAL,
S_COMMENT
)
FROM 'https://tpchsf100.dfs.core.windows.net/tpchsf1000/SUPPLIER/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
