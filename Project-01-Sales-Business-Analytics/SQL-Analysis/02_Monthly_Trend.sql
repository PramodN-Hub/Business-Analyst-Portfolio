-- 02: Monthly Sales & Profit Trend
SELECT DATE_TRUNC('month', order_date)::DATE AS month,
       COUNT(*) AS total_orders,
       SUM(quantity) AS units_sold,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_percentage
FROM sales_transactions
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;
