{{
    config(
        materialized = "table"
    )
}}

SELECT
    *
FROM
  {{ ref('nyc_taxi_trip') }}
  
