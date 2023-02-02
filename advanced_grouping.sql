
;WITH data (id, date, value) AS (
	  SELECT 1, '2021-01-01', 10
	  UNION ALL
	  SELECT 1, '2021-01-02', 20
	  UNION ALL
	  SELECT 1, '2021-01-03', 30
	  UNION ALL
	  SELECT 2, '2021-01-01', 40
	  UNION ALL
	  SELECT 2, '2021-01-02', 50
	  UNION ALL
	  SELECT 2, '2021-01-03', 60
)
SELECT id, date, value, 
	SUM(value) OVER (PARTITION BY id ORDER BY date 
	                 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
					) AS running_total
FROM data;


WITH data (id, value) AS (
  SELECT 1, 10
  UNION ALL
  SELECT 2, 20
  UNION ALL
  SELECT 1, 30
  UNION ALL
  SELECT 2, 40
)
SELECT id, SUM(value)
FROM (
  SELECT id, value, ROW_NUMBER() OVER (PARTITION BY id ORDER BY value) AS row_num
  FROM data
) AS d
WHERE row_num = 1
GROUP BY id;

WITH data (id, value) AS (
  SELECT 1, 10
  UNION ALL
  SELECT 2, 20
  UNION ALL
  SELECT 3, 30
  UNION ALL
  SELECT 4, 40
  UNION ALL
  SELECT 5, 40
)
SELECT id, value, ROW_NUMBER() OVER (ORDER BY value) AS row_num, 
       COUNT(*) OVER () AS total_rows, 
       CUME_DIST() OVER (ORDER BY value) AS cumulative_distribution
FROM data;


WITH data (id, value, category) AS (
  SELECT 1, 10, 'A'
  UNION ALL
  SELECT 2, 20, 'A'
  UNION ALL
  SELECT 3, 30, 'B'
  UNION ALL
  SELECT 4, 40, 'B'
  UNION ALL
  SELECT 5, 50, 'C'
)
SELECT id, SUM(value) AS [value], category, 
       SUM(value) OVER (PARTITION BY category) AS category_sum,
       SUM(value) OVER (PARTITION BY id) AS id_sum,
       SUM(value) OVER () AS total_sum
FROM data
GROUP BY id, category;

GO
CREATE TABLE Sales (
  Region varchar(20),
  Product varchar(20),
  Amount decimal(10,2)
);

INSERT INTO Sales (Region, Product, Amount)
VALUES 
('North', 'Computer', 500),
('North', 'Laptop', 300),
('North', 'Monitor', 200),
('South', 'Computer', 400),
('South', 'Laptop', 350),
('South', 'Monitor', 250),
('East', 'Computer', 450),
('East', 'Laptop', 375),
('East', 'Monitor', 225);





GO
SELECT Region, Product, SUM(Amount) AS Total_Sales
FROM Sales
GROUP BY CUBE (Region, Product);
GO
SELECT Region, Product, SUM(Amount) AS Total_Sales
FROM Sales
GROUP BY ROLLUP (Region, Product);
GO
SELECT Region, Product, SUM(Amount) AS Total_Sales
FROM Sales
GROUP BY GROUPING SETS ((Region, Product), (Region), ());
GO
-- PIVOT: rotate rows into columns, aggregating values along the way, to gain insights into data
WITH pivot_data AS (
  SELECT 'John' AS name, 'apple' AS fruit, 5 AS quantity
  UNION ALL
  SELECT 'John' AS name, 'banana' AS fruit, 3 AS quantity
  UNION ALL
  SELECT 'Jane' AS name, 'apple' AS fruit, 2 AS quantity
  UNION ALL
  SELECT 'Jane' AS name, 'banana' AS fruit, 4 AS quantity
)
SELECT name, [apple], [banana]
FROM pivot_data
PIVOT (SUM(quantity) FOR fruit IN ([apple], [banana])) AS pvt
GO
--UNPIVOT: rotate columns  into rows
WITH pivot_data AS (
  SELECT 'John' AS name, 5 AS apple, 3 AS banana
  UNION ALL
  SELECT 'Jane' AS name, 2 AS apple, 4 AS banana
)
SELECT name, fruit, quantity
FROM pivot_data
UNPIVOT (quantity FOR fruit IN (apple, banana)) AS unpvt




