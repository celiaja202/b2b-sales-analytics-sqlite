
-- Quote-to-win rate
SELECT lead_source,
       COUNT(*) AS total_quotes,
       SUM(CASE WHEN status='Won' THEN 1 ELSE 0 END) AS won_quotes,
       ROUND(1.0*SUM(CASE WHEN status='Won' THEN 1 ELSE 0 END)/COUNT(*),2) AS win_rate
FROM quotes
GROUP BY lead_source;

-- Revenue by country
SELECT a.country,
       SUM(oi.qty*oi.unit_price) AS revenue
FROM orders o
JOIN accounts a ON o.account_id=a.account_id
JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY a.country;

-- Rolling revenue (window function)
WITH monthly AS (
  SELECT substr(order_date,1,7) AS month,
         SUM(oi.qty*oi.unit_price) AS revenue
  FROM orders o
  JOIN order_items oi ON o.order_id=oi.order_id
  GROUP BY month
)
SELECT month,
       revenue,
       SUM(revenue) OVER (ORDER BY month ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS rolling_2m
FROM monthly;
