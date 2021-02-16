CREATE TABLE TPCH_SF1000._STAGING_REGION
(
	[R_REGIONKEY] DECIMAL(38,0) NULL,
	[R_NAME] [varchar](25) NULL,
	[R_COMMENT] [varchar](152) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)



GO
CREATE TABLE TPCH_SF1000.REGION
(
	[R_REGIONKEY] BIGINT NULL,
	[R_NAME] [varchar](25) NULL,
	[R_COMMENT] [varchar](152) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)



