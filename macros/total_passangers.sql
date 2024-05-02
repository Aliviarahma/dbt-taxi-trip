{% macro macro_monthly_total_passengers() %}
{{ config(materialized='table') }}

SELECT
TIMESTAMP_TRUNC(lpep_pickup_datetime,
    MONTH) month, 
    count(*) passenger_count,
  FROM
    `my-test-project-401305.raw.nyc_taxi_trip` 
  GROUP BY 1
ORDER BY
  count(*) ASC

{% endmacro %}

