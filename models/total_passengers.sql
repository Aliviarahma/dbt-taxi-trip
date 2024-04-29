{{
    config(
        materialized = "table"
    )
}}

SELECT
  TIMESTAMP_TRUNC(lpep_pickup_datetime,
    MONTH) month,
  COUNT(*) passenger_count
FROM
  {{ ref('nyc_taxi_trip') }}
GROUP BY
  1
ORDER BY
  1



