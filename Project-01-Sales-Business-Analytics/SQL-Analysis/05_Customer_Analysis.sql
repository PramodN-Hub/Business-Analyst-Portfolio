-- 05: Customer Performance Analysis
SELECT c.customer_name, c.segment, c.region,
       COUNT(DISTINCT s.order_id) AS total_orders,
       SUM(s.quantity) AS units_sold,
       ROUND(SUM(s.sales), 2) AS total_sales,
       ROUND(SUM(s.profit), 2) AS total_profit,
       ROUND((SUM(s.profit) / NULLIF(SUM(s.sales), 0)) * 100, 2) AS profit_margin_percentage
FROM sales_transactions s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name, c.segment, c.region
ORDER BY total_sales DESC;
