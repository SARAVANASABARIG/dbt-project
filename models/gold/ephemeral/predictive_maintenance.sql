{{
    config(
        materialized = 'ephemeral',
    )
}}

WITH pred_maintenance AS
(
    select
        vehicle_id,
        owner_name,
        sensor,
        service_station,
        severity,
        owner_notification,
        reported_time_stamp,
        date_of_purchase
    from
        {{ ref('obt') }}
    
)
select * from pred_maintenance