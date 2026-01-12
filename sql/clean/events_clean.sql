-- Purpose: Clean events data for analytics
-- Source: flowtrack_raw.events
-- Output: flowtrack_analytics.events_clean

SELECT
  event_id,
  user_id,
  event_name,
  SAFE_CAST(CAST(event_time AS STRING) AS TIMESTAMP) AS event_time
FROM `flowtrack-analytics.flowtrack_raw.events`;
