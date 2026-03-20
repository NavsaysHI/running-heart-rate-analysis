# Running Performance & Heart Rate Analysis

## Overview
Analysis of GPS, heart rate, and temperature data collected from over a year of running sessions. 
Each row represents a watch stop/start event, capturing heart rate, speed, altitude, 
and rest time data. The goal is to understand what factors influence heart rate during 
and after running.

## Tools Used
- **SQL** (DB Browser for SQLite) — data cleaning and analysis
- **Tableau Public** — interactive dashboard
- **Excel** — initial data exploration and cleaning
- **GitHub** — version control and portfolio hosting

## Key Questions Analysed
1. Does more rest time lead to better heart rate recovery?
2. Does higher temperature lead to higher heart rate?
3. How does running pace affect heart rate?
4. Does climbing hills push heart rate higher?
5. Does heart rate drift upward during longer runs?

## Key Findings
- Longer rest periods clearly correlate with greater heart rate recovery
- Temperature has a mild positive effect on heart rate
- Running pace is the strongest predictor of heart rate
- This runner shows minimal cardiac drift — suggesting good aerobic conditioning
- Bad sensor data (temperatures of 1-4°C in Brisbane) was identified and excluded

## Dashboard
[View Interactive Tableau Dashboard](https://public.tableau.com/app/profile/navdeep.rao/viz/RunningPerformanceHeartRateAnalysis/Dashboard1?publish=yes)

## Data Notes
- Dataset contains 4,550 stop/start events from real GPS running sessions
- Temperature values below 10°C were excluded as sensor errors (Brisbane climate)
- Heart rate values outside 60-200 BPM were excluded as outliers
- Altitude changes beyond ±50m in 5 minutes were excluded as GPS errors

## Files
| File | Description |
|------|-------------|
| `analysis_queries.sql` | All 5 SQL queries with comments |
| `s1_start_to_stop_clean.csv` | Cleaned dataset |
| `q1_hr_recovery.csv` | Heart rate recovery vs rest time |
| `q2_temperature_hr.csv` | Temperature vs heart rate |
| `q3_speed_hr.csv` | Running pace vs heart rate |
| `q4_altitude_hr.csv` | Altitude change vs heart rate |
| `q5_cardiac_drift.csv` | Cardiac drift over time |
