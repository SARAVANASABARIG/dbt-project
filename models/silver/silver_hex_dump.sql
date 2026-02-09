{{ 
    config(
        materialized='incremental', 
        unique_key='vehicle_id'
    )
}}


select
    vehicle_id,
    fault_status,
    current_status,
    frequency_count,
    occurence_order,
    xset_mapping,
    case
    when millage > 0 then millage
    else  999999
    end as millage
from
    {{ref('bronze_hex_dump_data')}}
