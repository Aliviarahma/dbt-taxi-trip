{% macro macro_monthly_trip_distance() %}
{{ config(materialized='table') }}

SELECT
  TIMESTAMP_TRUNC(lpep_pickup_datetime,
    MONTH) month, RatecodeID,  
    count(trip_distance) trip_distance,
  FROM
    `my-test-project-401305.raw.nyc_taxi_trip` 
  GROUP BY month, RatecodeID
ORDER BY
  count(*) ASC

{% endmacro %}



