-- Q1: Does more rest time lead to better heart rate recovery?
SELECT 
    event_id,
    rest_time,
    heart_rate_stop,
    heart_rate_start,
    ROUND(heart_rate_stop - heart_rate_start, 1) AS hr_drop
FROM s1_start_to_stop_clean
WHERE heart_rate_stop IS NOT NULL
  AND heart_rate_start IS NOT NULL
  AND rest_time > 0
ORDER BY rest_time ASC;

-- Q2: Does higher temperature lead to higher heart rate?
SELECT
    event_id,
    avg_temp,
    avg_hr,
    avg_speed,
    ROUND(avg_hr / avg_speed, 2) AS effort_per_speed
FROM s1_start_to_stop_clean
WHERE avg_temp >= 10
  AND avg_hr IS NOT NULL
  AND avg_speed IS NOT NULL
  AND avg_speed > 0
ORDER BY avg_temp ASC;

-- Q3: How does running pace affect heart rate?
SELECT
    event_id,
    avg_speed,
    avg_hr,
    heart_rate_stop,
    cadence_stop
FROM s1_start_to_stop_clean
WHERE avg_speed BETWEEN 5 AND 25
  AND avg_hr IS NOT NULL
  AND avg_hr > 0
  AND heart_rate_stop IS NOT NULL
  AND heart_rate_stop > 0
ORDER BY avg_speed ASC;

-- Q4: Does climbing hills push heart rate higher?
SELECT
    event_id,
    altitude_change_past_300_seconds,
    altitude_change_past_600_seconds,
    heart_rate_stop,
    avg_hr,
    avg_speed
FROM s1_start_to_stop_clean
WHERE heart_rate_stop BETWEEN 60 AND 200
  AND altitude_change_past_300_seconds BETWEEN -50 AND 50
  AND altitude_change_past_600_seconds IS NOT NULL
  AND avg_speed BETWEEN 5 AND 25
ORDER BY altitude_change_past_300_seconds ASC;

-- Q5: Does heart rate drift upward during longer runs?
SELECT
    event_id,
    total_running_time,
    heart_rate_stop,
    avg_hr,
    avg_speed,
    avg_temp
FROM s1_start_to_stop_clean
WHERE heart_rate_stop BETWEEN 60 AND 200
  AND total_running_time IS NOT NULL
  AND total_running_time > 0
  AND avg_speed BETWEEN 5 AND 25
ORDER BY total_running_time ASC;