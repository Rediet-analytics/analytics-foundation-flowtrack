-- Purpose: Clean users data for analytics
-- Source: flowtrack_raw.users
-- Output: flowtrack_analytics.users_clean

SELECT
  user_id,
  email,
  DATE(signup_date) AS signup_date,
  plan,
  status
FROM `flowtrack-analytics.flowtrack_raw.users`;
