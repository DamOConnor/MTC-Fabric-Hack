USE dw_tpch1

-- Drops
DROP TABLE IF EXISTS dbo.customer;
DROP TABLE IF EXISTS dbo.lineitem;
DROP TABLE IF EXISTS dbo.nation;
DROP TABLE IF EXISTS dbo.orders;
DROP TABLE IF EXISTS dbo.part;
DROP TABLE IF EXISTS dbo.partsupp;
DROP TABLE IF EXISTS dbo.region;
DROP TABLE IF EXISTS dbo.supplier;


-- Creates
CREATE TABLE dbo.customer (
	custkey		INT,
	[name]		VARCHAR(25),
	[address]	VARCHAR(40),
	nationkey	INT,
	phone		VARCHAR(15),
	acctbal		DECIMAL(10,2),
	mktsegment	VARCHAR(10),
	comment		VARCHAR(117)
);


CREATE TABLE dbo.lineitem (
	orderkey		INT,
	partkey			INT,
	suppkey			INT,
	linenumber		INT,
	quantity		DECIMAL(10,2),
	extendedprice	DECIMAL(10,2),
	discount		DECIMAL(10,2),
	tax				DECIMAL(10,2),
	returnflag		CHAR(1),
	linestatus		CHAR(1),
	shipdate		DATE,
	commitdate		DATE,
	receiptdate		DATE,
	shipinstruct	VARCHAR(25),
	shipmode		VARCHAR(10),
	comment			VARCHAR(44)
);


CREATE TABLE dbo.nation (
    nationkey	INT NOT NULL,
    [name]		VARCHAR(25) NOT NULL,
    regionkey	INT NOT NULL,
    comment		VARCHAR(152) NOT NULL
);


CREATE TABLE dbo.orders (
	orderkey		INT,
	custkey			INT,
	orderstatus		CHAR(1),
	totalprice		DECIMAL(10,2),
	orderdate		DATE,
	orderpriority	VARCHAR(15),
	clerk			VARCHAR(15),
	shippriority	INT,
	comment			VARCHAR(79)
);


CREATE TABLE dbo.part (
	partkey		INT,
	[name]		VARCHAR(55),
	mfgr		VARCHAR(25),
	brand		VARCHAR(10),
	[type]		VARCHAR(25),
	size		INT,
	container	VARCHAR(10),
	retailprice	DECIMAL(10,2),
	comment		VARCHAR(23)
);


CREATE TABLE dbo.partsupp (
	partkey		INT,
	suppkey		INT,
	availqty	INT,
	supplycost	DECIMAL(10,2),
	comment		VARCHAR(199)
);


CREATE TABLE dbo.region (
	regionkey	INT,
	[name]		VARCHAR(25),
	comment		VARCHAR(152)
);


CREATE TABLE dbo.supplier (
	suppkey		INT,
	[name]		VARCHAR(25),
	[address]	VARCHAR(40),
	nationkey	INT,
	phone		VARCHAR(15),
	acctbal		DECIMAL(10,2),
	comment		VARCHAR(101)    
);

