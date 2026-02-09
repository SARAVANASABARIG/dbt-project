{% set meta_data = [
    {
        "table" : "DTCDATA.SILVER.SILVER_DTC",
        "columns" : "silver_dtc.*",
        "alias" : "silver_dtc"
    },
    {
        "table" : "DTCDATA.SILVER.SILVER_HEX_DUMP",
        "columns" : "silver_hex_dump.fault_status,silver_hex_dump.current_status,silver_hex_dump.frequency_count,silver_hex_dump.occurence_order,silver_hex_dump.millage",
        "alias" : "silver_hex_dump",
        "join_condition" : "silver_dtc.vehicle_id = silver_hex_dump.vehicle_id"
    },
    {
        "table" : "DTCDATA.SILVER.SILVER_PRODUCTION",
        "columns" : "silver_production.event_id, silver_production.component, silver_production.service_station, silver_production.severity, silver_production.notification_status, silver_production.owner_notification, silver_production.reported_time_stamp as reported_time_stamp_production",
        "alias" : "silver_production",
        "join_condition" : "silver_production.vehicle_id = silver_hex_dump.vehicle_id"
    },
    {
        "table" : "DTCDATA.SILVER.SILVER_VEHICLE",
        "columns" : "silver_vehicle.owner_name,silver_vehicle.variants,silver_vehicle.branch_code,silver_vehicle.date_of_purchase",
        "alias" : "silver_vehicle",
        "join_condition" : "silver_vehicle.vehicle_id = silver_production.vehicle_id" 
    }
]%}



select
    {% for config in meta_data %}
        {{ config ['columns'] }}{%if not loop.last%},{% endif %}
    {% endfor %}
from
    {% for config in meta_data %}
    {% if loop.first %}
        {{ config['table'] }} AS {{ config ['alias']}}
    {% else %}
        left join  {{ config['table'] }} AS {{ config ['alias']}}
        on {{ config['join_condition']}}
    {% endif %}
    {% endfor %}

