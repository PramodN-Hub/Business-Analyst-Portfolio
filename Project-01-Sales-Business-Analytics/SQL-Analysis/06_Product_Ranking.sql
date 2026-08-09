-- 06: Top Products by Category
WITH product_performance AS (
    SELECT p.category, p.product_name,
           SUM(s.quantity) AS units_sold,
           ROUND(SUM(s.sales), 2) AS total_sales,
           ROUND(SUM(s.profit), 2) AS total_profit
    FROM sales_transactions s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category, p.product_name
),
ranked_products AS (
    SELECT *, RANK() OVER (PARTITION BY category ORDER BY total_sales DESC) AS sales_rank
    FROM product_performance
)
SELECT category, product_name, units_sold, total_sales, total_profit, sales_rank
FROM ranked_products
WHERE sales_rank <= 3
ORDER BY category, sales_rank;
