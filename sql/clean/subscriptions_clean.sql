-- Purpose: Clean subscriptions data for analytics
-- Source: flowtrack_raw.subscriptions
-- Output: flowtrack_analytics.subscriptions_clean

SELECT
  subscription_id,
  user_id,
  plan,
  SAFE_CAST(CAST(start_date AS STRING) AS DATE) AS start_date,
  SAFE_CAST(CAST(end_date AS STRING) AS DATE) AS end_date,
  status
FROM `flowtrack-analytics.flowtrack_raw.subscriptions`;
