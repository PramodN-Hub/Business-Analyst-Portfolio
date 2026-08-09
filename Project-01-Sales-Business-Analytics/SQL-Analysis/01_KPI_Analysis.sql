-- 01: Overall KPI Analysis
SELECT COUNT(*) AS total_orders,
       SUM(quantity) AS total_units_sold,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(cost), 2) AS total_cost,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_percentage
FROM sales_transactions;
