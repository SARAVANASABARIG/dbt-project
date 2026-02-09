{{
    config(
        materialized = 'ephemeral',
    )
}}

WITH hex_dump AS
(
    select
        vehicle_id,
        event_id,
        dtc_code,
        sensor,
        component,
        voltage_reading,
        fault_status,
        frequency_count,
        occurence_order,
        severity,
        millage,
        reported_time_stamp,
        service_station


    from
        {{ ref('obt') }}
    
)
select * from hex_dump