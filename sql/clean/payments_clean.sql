-- Purpose: Clean payments data for analytics
-- Source: flowtrack_raw.payments
-- Output: flowtrack_analytics.payments_clean

SELECT
  payment_id,
  user_id,
  amount,
  SAFE_CAST(CAST(payment_date AS STRING) AS DATE) AS payment_date
FROM `flowtrack-analytics.flowtrack_raw.payments`;
