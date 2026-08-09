-- 07: Month-over-Month Sales Growth
WITH monthly_sales AS (
    SELECT DATE_TRUNC('month', order_date)::DATE AS month,
           SUM(sales) AS total_sales, SUM(profit) AS total_profit
    FROM sales_transactions
    GROUP BY DATE_TRUNC('month', order_date)
),
monthly_comparison AS (
    SELECT month, ROUND(total_sales, 2) AS total_sales,
           ROUND(total_profit, 2) AS total_profit,
           ROUND(LAG(total_sales) OVER (ORDER BY month), 2) AS previous_month_sales
    FROM monthly_sales
)
SELECT month, total_sales, total_profit, previous_month_sales,
       ROUND(((total_sales - previous_month_sales) / NULLIF(previous_month_sales, 0)) * 100, 2)
       AS sales_growth_percentage
FROM monthly_comparison
ORDER BY month;
