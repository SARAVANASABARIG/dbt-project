{{ 
    config(
        materialized='incremental', 
        unique_key='vehicle_id'
    )
}}


select
    vehicle_id,
    event_id,
    production_are as Component,
    service_station,
    severity,
    notification_status,
    case
    when owner_notification = 'true' then 'Sent'
    else 'Pending'
    end as owner_notification,
    reported_time_stamp
from
    {{ref('bronze_production_data')}}
