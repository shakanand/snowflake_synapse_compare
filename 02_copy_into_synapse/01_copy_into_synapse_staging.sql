-- Run in UserDB DW3000

-- 1 minute to load


/*
Connection String    - BlobEndpoint=https://tpchdata.blob.core.windows.net/;QueueEndpoint=https://tpchdata.queue.core.windows.net/;FileEndpoint=https://tpchdata.file.core.windows.net/;TableEndpoint=https://tpchdata.table.core.windows.net/;SharedAccessSignature=sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D
SAS Token            - ?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D
Blob Service SAS URL - https://tpchdata.blob.core.windows.net/?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D
*/


EXECUTE AS USER = 'etlloaduser01';
COPY INTO [TPCH_SF10000].[_STAGING_CUSTOMER]
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
FROM 'https://tpchdata.dfs.core.windows.net/tpch-sf10000/CUSTOMER/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D')
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO
--20 Mins and 38 seconds to load on DW 3000 / XLRC
EXECUTE AS USER = 'etlloaduser01';
COPY INTO [TPCH_SF10000].[_STAGING_LINEITEM]
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
FROM 'https://tpchdata.dfs.core.windows.net/tpch-sf10000/LINEITEM/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D')
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO
EXECUTE AS USER = 'etlloaduser01';
COPY INTO [TPCH_SF10000]._STAGING_NATION
(
N_NATIONKEY,
N_NAME,
N_REGIONKEY,
N_COMMENT
)
FROM 'https://tpchdata.dfs.core.windows.net/tpch-sf10000/NATION/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'	
	,CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D')
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO
EXECUTE AS USER = 'etlloaduser01';
-- 3 mins and 32 seconds to load
COPY INTO [TPCH_SF10000]._STAGING_ORDERS
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
FROM 'https://tpchdata.dfs.core.windows.net/tpch-sf10000/ORDERS/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D')
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO
-- 34 seconds to load
EXECUTE AS USER = 'etlloaduser01';
COPY INTO [TPCH_SF10000]._STAGING_PART
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
FROM 'https://tpchdata.dfs.core.windows.net/tpch-sf10000/PART/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D')
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO
-- 2 mins and 1 sec to load
EXECUTE AS USER = 'etlloaduser01';
COPY INTO [TPCH_SF10000]._STAGING_PARTSUPP
(
PS_PARTKEY,
PS_SUPPKEY,
PS_AVAILQTY,
PS_SUPPLYCOST,
PS_COMMENT
)
FROM 'https://tpchdata.dfs.core.windows.net/tpch-sf10000/PARTSUPP/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D')
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO
-- 1 second to run
EXECUTE AS USER = 'etlloaduser01';
COPY INTO [TPCH_SF10000]._STAGING_REGION
(
R_REGIONKEY,
R_NAME,
R_COMMENT
)
FROM 'https://tpchdata.dfs.core.windows.net/tpch-sf10000/REGION/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D')
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO

-- 8 seconds to run
EXECUTE AS USER = 'etlloaduser01';
COPY INTO [TPCH_SF10000]._STAGING_SUPPLIER
(
S_SUPPKEY,
S_NAME,
S_ADDRESS,
S_NATIONKEY,
S_PHONE,
S_ACCTBAL,
S_COMMENT
)
FROM 'https://tpchdata.dfs.core.windows.net/tpch-sf10000/*.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D')
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
GO

SELECT TableName,RowCount1,CAST((RowCount1/1000000.0) AS NUMERIC(12,2)) as Million_Rows FROM 
(
SELECT '_STAGING_CUSTOMER' as TableName,COUNT_BIG(*) as RowCount1 FROM [TPCH_SF10000].[_STAGING_CUSTOMER]
UNION ALL
SELECT '_STAGING_LINEITEM' as TableName,COUNT_BIG(*) as RowCount1 FROM [TPCH_SF10000].[_STAGING_LINEITEM]
UNION ALL
SELECT '_STAGING_NATION' as TableName,COUNT_BIG(*) as RowCount1   FROM [TPCH_SF10000].[_STAGING_NATION]
UNION ALL
SELECT '_STAGING_ORDERS' as TableName,COUNT_BIG(*) as RowCount1   FROM [TPCH_SF10000].[_STAGING_ORDERS]
UNION ALL
SELECT '_STAGING_PART' as TableName,COUNT_BIG(*) as RowCount1     FROM [TPCH_SF10000].[_STAGING_PART]
UNION ALL
SELECT '_STAGING_PARTSUPP' as TableName,COUNT_BIG(*) as RowCount1 FROM [TPCH_SF10000].[_STAGING_PARTSUPP]
UNION ALL
SELECT '_STAGING_REGION' as TableName,COUNT_BIG(*) as RowCount1   FROM [TPCH_SF10000].[_STAGING_REGION]
UNION ALL
SELECT '_STAGING_SUPPLIER' as TableName,COUNT_BIG(*) as RowCount1 FROM [TPCH_SF10000].[_STAGING_SUPPLIER]
) x
