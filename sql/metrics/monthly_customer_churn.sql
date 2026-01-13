-- Purpose: Monthly Customer Churn (count of customers who cancel)
-- Definition: Number of subscriptions ending (canceled) per month
-- Source: subscriptions_clean

SELECT
  DATE_TRUNC(end_date, MONTH) AS month,
  COUNT(DISTINCT user_id) AS churned_customers
FROM `flowtrack-analytics.flowtrack_analytics.subscriptions_clean`
WHERE end_date IS NOT NULL
GROUP BY month
ORDER BY month;
