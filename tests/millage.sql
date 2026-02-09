{{ config ( severity = 'warn')}}

select
    vehicle_id
from 
    {{ source('staging','hex_dump_data')}}
where
    millage < 2000