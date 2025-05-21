-- Create a sample 'orders' table
CREATE TABLE  orders2 (
    order_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    region VARCHAR(50),
    order_value INT
      );
      
-- Insert minimal sample data into 'orders' table
INSERT INTO orders2 (order_id, item_name, region, order_value) VALUES
    (1, 'GadgetX', 'North', 120),
    (2, 'GadgetY', 'South', 170),
    (3, 'GadgetX', 'North', 250),
    (4, 'GadgetZ', 'South', 140),
    (5, 'GadgetY', 'North', 190);

select * FROM orders2 ;  

-- Create a sample 'orde
-- Window Function #1: Total order value by region
SELECT
    order_id,
    item_name,
    region,
    order_value,
    SUM(order_value) OVER (PARTITION BY region) AS total_order_value_by_region
FROM
    orders2;
-- Expected: each row will show the same total for its region (North or South).


-- Window Function #2: Rank items by order value (within each item group)
SELECT
    order_id,
    item_name,
    region,
    order_value,
    ROW_NUMBER() OVER (PARTITION BY item_name ORDER BY order_value DESC) AS rank_within_item
FROM
    orders2;
    
    
    -- CTE Example: Find regions whose average order value is above a certain threshold, then filter
WITH avg_region_value AS (
    SELECT
        region,
        AVG(order_value) AS avg_order_value
    FROM
        orders2
    GROUP BY
        region
)
SELECT
    o.order_id,
    o.item_name,
    o.region,
    o.order_value,
    a.avg_order_value
FROM
    orders2 o
    JOIN avg_region_value a ON o.region = a.region
WHERE
    o.order_value > a.avg_order_value;
    
    
    
    
    -- Subquery Example: Items whose total order value exceeds 300
SELECT
    item_name,
    total_order_value
FROM (
    SELECT
        item_name,
        SUM(order_value) AS total_order_value
    FROM
        orders2
    GROUP BY
        item_name
) AS item_totals
WHERE
    total_order_value > 300;
