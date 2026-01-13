-- Purpose: Executive KPI table (monthly)
-- Includes: MRR, churned customers, churn rate
-- Sources: mrr_monthly, monthly_customer_churn_rate

WITH mrr AS (
  SELECT month, mrr
  FROM `flowtrack-analytics.flowtrack_analytics.mrr_monthly`
),
churn AS (
  SELECT
    month,
    active_customers_start,
    churned_customers,
    churn_rate
  FROM `flowtrack-analytics.flowtrack_analytics.monthly_customer_churn_rate`
)
SELECT
  COALESCE(m.month, c.month) AS month,
  COALESCE(m.mrr, 0) AS mrr,
  COALESCE(c.active_customers_start, 0) AS active_customers_start,
  COALESCE(c.churned_customers, 0) AS churned_customers,
  c.churn_rate
FROM mrr m
FULL OUTER JOIN churn c
USING (month)
ORDER BY month;
