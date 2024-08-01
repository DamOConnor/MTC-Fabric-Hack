-- Load up tpc-h scale 1
-- COPY examples taken from: https://learn.microsoft.com/en-us/sql/t-sql/statements/copy-into-transact-sql?view=azure-sqldw-latest
-- NB: SAS token only had one day lifetime so needs to be refreshed if script is re-run
USE dw_tpch1


COPY INTO dbo.customer
FROM 'https://fabriclanding777.dfs.core.windows.net/datalake/raw/tpc-h/scale1/csv/customer.tbl'
WITH (
    FILE_TYPE = 'CSV',
    --CREDENTIAL = ( IDENTITY = 'Managed Identity' ),
    CREDENTIAL = ( IDENTITY= 'Shared Access Signature', SECRET = '?sv=...' ),
    FIELDTERMINATOR = '|'
);


COPY INTO dbo.lineitem
FROM 'https://fabriclanding777.dfs.core.windows.net/datalake/raw/tpc-h/scale1/csv/lineitem.tbl'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL = ( IDENTITY= 'Shared Access Signature', SECRET = '?sv=...' ),
    FIELDTERMINATOR = '|'
);


COPY INTO dbo.nation
FROM 'https://fabriclanding777.dfs.core.windows.net/datalake/raw/tpc-h/scale1/csv/nation.tbl'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL = ( IDENTITY= 'Shared Access Signature', SECRET = '?sv=...' ),
    FIELDTERMINATOR = '|'
);


COPY INTO dbo.orders
FROM 'https://fabriclanding777.dfs.core.windows.net/datalake/raw/tpc-h/scale1/csv/orders.tbl'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL = ( IDENTITY= 'Shared Access Signature', SECRET = '?sv=...' ),
    FIELDTERMINATOR = '|'
);


COPY INTO dbo.part
FROM 'https://fabriclanding777.dfs.core.windows.net/datalake/raw/tpc-h/scale1/csv/part.tbl'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL = ( IDENTITY= 'Shared Access Signature', SECRET = '?sv=...' ),
    FIELDTERMINATOR = '|'
);


COPY INTO dbo.partsupp
FROM 'https://fabriclanding777.dfs.core.windows.net/datalake/raw/tpc-h/scale1/csv/partsupp.tbl'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL = ( IDENTITY= 'Shared Access Signature', SECRET = '?sv=...' ),
    FIELDTERMINATOR = '|'
);


COPY INTO dbo.region
FROM 'https://fabriclanding777.dfs.core.windows.net/datalake/raw/tpc-h/scale1/csv/region.tbl'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL = ( IDENTITY= 'Shared Access Signature', SECRET = '?sv=...' ),
    FIELDTERMINATOR = '|'
);


COPY INTO dbo.supplier
FROM 'https://fabriclanding777.dfs.core.windows.net/datalake/raw/tpc-h/scale1/csv/supplier.tbl'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL = ( IDENTITY= 'Shared Access Signature', SECRET = '?sv=...' ),
    FIELDTERMINATOR = '|'
);


SELECT 'customer' AS source, COUNT(*) c FROM dbo.customer
UNION ALL
SELECT 'lineitem' AS source, COUNT(*) c FROM dbo.lineitem
UNION ALL
SELECT 'nation' AS source, COUNT(*) c FROM dbo.nation
UNION ALL
SELECT 'orders' AS source, COUNT(*) c FROM dbo.orders
UNION ALL
SELECT 'part' AS source, COUNT(*) c FROM dbo.part
UNION ALL
SELECT 'partsupp' AS source, COUNT(*) c FROM dbo.partsupp
UNION ALL
SELECT 'region' AS source, COUNT(*) c FROM dbo.region
UNION ALL
SELECT 'supplier' AS source, COUNT(*) c FROM dbo.supplier;

SELECT TOP 10 * FROM dbo.customer;
SELECT TOP 10 * FROM dbo.lineitem;
SELECT TOP 10 * FROM dbo.nation;
SELECT TOP 10 * FROM dbo.orders;
SELECT TOP 10 * FROM dbo.part;
SELECT TOP 10 * FROM dbo.partsupp;
SELECT TOP 10 * FROM dbo.region;
SELECT TOP 10 * FROM dbo.supplier;