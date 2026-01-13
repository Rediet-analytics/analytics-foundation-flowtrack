-- Purpose: Monthly Customer Churn Rate (%)
-- Definition:
--   churn_rate = churned_customers_in_month / active_customers_at_start_of_month
-- Source: subscriptions_clean

WITH months AS (
  -- All months present in subscription lifecycle (start or end)
  SELECT DISTINCT DATE_TRUNC(d, MONTH) AS month
  FROM (
    SELECT start_date AS d FROM `flowtrack-analytics.flowtrack_analytics.subscriptions_clean`
    UNION ALL
    SELECT end_date AS d FROM `flowtrack-analytics.flowtrack_analytics.subscriptions_clean`
  )
  WHERE d IS NOT NULL
),
active_at_start AS (
  -- Active customers at the start of each month:
  -- started before month AND (no end_date OR end_date >= month)
  SELECT
    m.month,
    COUNT(DISTINCT s.user_id) AS active_customers_start
  FROM months m
  JOIN `flowtrack-analytics.flowtrack_analytics.subscriptions_clean` s
    ON s.start_date < m.month
   AND (s.end_date IS NULL OR s.end_date >= m.month)
  GROUP BY m.month
),
churned_in_month AS (
  SELECT
    DATE_TRUNC(end_date, MONTH) AS month,
    COUNT(DISTINCT user_id) AS churned_customers
  FROM `flowtrack-analytics.flowtrack_analytics.subscriptions_clean`
  WHERE end_date IS NOT NULL
  GROUP BY month
)
SELECT
  m.month,
  COALESCE(a.active_customers_start, 0) AS active_customers_start,
  COALESCE(c.churned_customers, 0) AS churned_customers,
  SAFE_DIVIDE(COALESCE(c.churned_customers, 0), NULLIF(COALESCE(a.active_customers_start, 0), 0)) AS churn_rate
FROM months m
LEFT JOIN active_at_start a USING(month)
LEFT JOIN churned_in_month c USING(month)
ORDER BY m.month;
