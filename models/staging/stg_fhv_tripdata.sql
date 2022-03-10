{{ config(materialized='view') }}

select
    -- identifiers
    cast(dispatching_base_num as string) as dispatching_base_num, 
    cast(pickup_datetime as timestamp) as pickup_datetime, 
    cast(dropoff_datetime as timestamp) as dropoff_datetime, 
    cast(PULocationID as integer) as pickup_locationid, 
    cast(DOLocationID as integer) as dropoff_locationid, 
    cast(SR_Flag as integer) as SR_Flag
from {{ source('staging','fhv_tripdata') }}


-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}