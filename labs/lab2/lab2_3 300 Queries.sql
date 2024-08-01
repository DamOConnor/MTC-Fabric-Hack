-- tpc-h Query 1
SELECT
    returnflag,
    linestatus,
    sum(quantity) as sum_qty,
    sum(extendedprice) as sum_base_price,
    sum(extendedprice * (1 - discount)) as sum_disc_price,
    sum(extendedprice * (1 - discount) * (1 + tax)) as sum_charge,
    avg(quantity) as avg_qty,
    avg(extendedprice) as avg_price,
    avg(discount) as avg_disc,
    count(*) as count_order
FROM
    lineitem
WHERE
    --shipdate <= date '1998-12-01' - interval '90' day
    shipdate <= DATEADD( day, -90, '1998-12-01' )
GROUP BY
    returnflag,
    linestatus
ORDER BY
    returnflag,
    linestatus;



-- Query 3
SELECT TOP 20
    l.orderkey,
    sum(l.extendedprice * (1 - l.discount)) as revenue,
    o.orderdate,
    o.shippriority
FROM
    customer c,
    orders o,
    lineitem l
WHERE
    c.mktsegment = 'BUILDING'
    AND c.custkey = o.custkey
    AND l.orderkey = o.orderkey
    AND o.orderdate < '1995-03-15'
    AND l.shipdate > '1995-03-15'
GROUP BY
    l.orderkey,
    o.orderdate,
    o.shippriority
ORDER BY
    revenue desc,
    o.orderdate;



-- Query 5
SELECT
    n.name,
    sum(l.extendedprice * (1 - l.discount)) as revenue
FROM
    customer c,
    orders o,
    lineitem l,
    supplier s,
    nation n,
    region r
WHERE
    c.custkey = o.custkey
    AND l.orderkey = o.orderkey
    AND l.suppkey = s.suppkey
    AND c.nationkey = s.nationkey
    AND s.nationkey = n.nationkey
    AND n.regionkey = r.regionkey
    AND r.name = 'ASIA'
    AND o.orderdate >= '1994-01-01'
    AND o.orderdate < DATEADD( year, 1, '1994-01-01' )
GROUP BY
    n.name
ORDER BY
    revenue desc;


-- Query 6
SELECT
    sum(extendedprice * discount) as revenue
FROM
    lineitem
WHERE
    shipdate >= '1994-01-01'
    AND shipdate < DATEADD( year, 1, '1994-01-01' )
    AND discount between 0.06 - 0.01 AND 0.06 + 0.01
    AND quantity < 24;



-- Query 10
SELECT TOP 20
    c.custkey,
    c.name,
    sum(l.extendedprice * (1 - l.discount)) as revenue,
    c.acctbal,
    n.name,
    c.address,
    c.phone,
    c.comment
FROM
    customer c,
    orders o,
    lineitem l,
    nation n
WHERE
    c.custkey = o.custkey
    AND l.orderkey = o.orderkey
    AND o.orderdate >= '1993-10-01'
    AND o.orderdate < DATEADD( month, 3, '1993-10-01' )
    AND l.returnflag = 'R'
    AND c.nationkey = n.nationkey
GROUP BY
    c.custkey,
    c.name,
    c.acctbal,
    c.phone,
    n.name,
    c.address,
    c.comment
ORDER BY
    revenue desc;


-- Query 12
SELECT
    l.shipmode,
    sum(case
        when o.orderpriority = '1-URGENT'
            OR o.orderpriority = '2-HIGH'
            then 1
        else 0
    end) as high_line_count,
    sum(case
        when o.orderpriority <> '1-URGENT'
            AND o.orderpriority <> '2-HIGH'
            then 1
        else 0
    end) AS low_line_count
FROM
    orders o,
    lineitem l
WHERE
    o.orderkey = l.orderkey
    AND l.shipmode in ('MAIL', 'SHIP')
    AND l.commitdate < l.receiptdate
    AND l.shipdate < l.commitdate
    AND l.receiptdate >= '1994-01-01'
    AND l.receiptdate < DATEADD( year, 1, '1994-01-01' )
GROUP BY
    l.shipmode
ORDER BY
    l.shipmode;


-- Query 14
SELECT
    100.00 * sum(case
        when p.type like 'PROMO%'
            then l.extendedprice * (1 - l.discount)
        else 0
    end) / sum(l.extendedprice * (1 - l.discount)) as promo_revenue
FROM
    lineitem l,
    part p
WHERE
    l.partkey = p.partkey
    AND l.shipdate >= '1995-09-01'
    AND l.shipdate < DATEADD( month, 1, '1995-09-01' );


-- Query 19
SELECT
    sum(l.extendedprice* (1 - l.discount)) as revenue
FROM
    lineitem l,
    part p
WHERE
    (
        p.partkey = l.partkey
        AND p.brand = 'Brand#12'
        AND p.container in ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
        AND l.quantity >= 1 AND l.quantity <= 1 + 10
        AND p.size between 1 AND 5
        AND l.shipmode in ('AIR', 'AIR REG')
        AND l.shipinstruct = 'DELIVER IN PERSON'
    )
    OR
    (
        p.partkey = l.partkey
        AND p.brand = 'Brand#23'
        AND p.container in ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
        AND l.quantity >= 10 AND l.quantity <= 10 + 10
        AND p.size between 1 AND 10
        AND l.shipmode in ('AIR', 'AIR REG')
        AND l.shipinstruct = 'DELIVER IN PERSON'
    )
    OR
    (
        p.partkey = l.partkey
        AND p.brand = 'Brand#34'
        AND p.container in ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
        AND l.quantity >= 20 AND l.quantity <= 20 + 10
        AND p.size between 1 AND 15
        AND l.shipmode in ('AIR', 'AIR REG')
        AND l.shipinstruct = 'DELIVER IN PERSON'
    );


/*
SELECT returnflag, COUNT(*) FROM lineitem GROUP BY returnflag;

SELECT MAX(suppkey) FROM lineitem;
SELECT MAX(suppkey) FROM supplier;

SELECT nationkey FROM nation;
SELECT nationkey FROM customer;
SELECT nationkey FROM supplier;

customer c,
orders o,
lineitem l,
supplier s,
region r
    c.custkey = o.custkey
    AND l.orderkey = o.orderkey
    AND l.suppkey = s.suppkey
    AND c.nationkey = s.nationkey
    AND s.nationkey = n.nationkey
    AND n.regionkey = r.regionkey
*/