{% macro macro_monthly_transactions() %}
{{ config(materialized='table') }}

SELECT
  TIMESTAMP_TRUNC(lpep_pickup_datetime,
    MONTH) month, payment_type,  
    sum(total_amount) transactions,
  FROM
    `my-test-project-401305.raw.nyc_taxi_trip` 
  GROUP BY month, payment_type
ORDER BY
  count(*) DESC

{% endmacro %}

