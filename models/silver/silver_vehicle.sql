{{ 
    config(
        materialized='incremental', 
        unique_key='vehicle_id'
    )
}}


select
    vehicle_id,
    replace (owner_name,' ','_') as owner_name,
    upper (variants) as variants,
    case
    when branch_code = 'BR05' then 'BR04'
    else branch_code
    end as branch_code,
    date_of_purchase
from
    {{ref('bronze_vehicle_data')}}

    