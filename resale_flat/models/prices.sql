{{ config(materialized='table') }}

SELECT 
    * EXCEPT(floor_area_sqm, resale_price),
    CAST(floor_area_sqm AS NUMERIC) AS floor_area_sqm,
    CAST(resale_price AS NUMERIC) AS resale_price,
    CAST(resale_price AS NUMERIC) / CAST(floor_area_sqm AS NUMERIC) AS price_per_sqm
FROM {{ source('resale', 'public_resale_flat_prices_from_jan_2017') }}