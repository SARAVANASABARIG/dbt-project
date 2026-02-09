
{{ 
    config(
        materialized='incremental', 
        unique_key='vehicle_id'
    )
}}


select
    vehicle_id,
    dtc_code,
    initcap (status) as Dtc_status,
    sensor,
    voltage_reading,
    reported_time_stamp
from
    {{ref('bronze_dtc_data')}}
