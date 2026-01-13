-- Purpose: Daily Active Users (DAU)
-- Definition: Users with login or workflow_run events per day
-- Source: events_clean

SELECT
  DATE(event_time) AS day,
  COUNT(DISTINCT user_id) AS active_users
FROM `flowtrack-analytics.flowtrack_analytics.events_clean`
WHERE event_name IN ('login', 'workflow_run')
GROUP BY day
ORDER BY day;
