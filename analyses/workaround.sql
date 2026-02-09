{% set meta_data = [
    {
        "table" : "DTCDATA.GOLD.OBT",
        "columns" : "Gold_obt.vehicle_id, Gold_obt.event_id, Gold_obt.voltage_reading, Gold_obt.frequency_count,Gold_obt.occurence_order, Gold_obt.millage, Gold_obt.date_of_purchase",
        "alias" : "Gold_obt"
    }


]%}

select

        {{ meta_data[0]['columns'] }}

from

        {{ meta_data[0] ['table'] }} AS {{ meta_data[0] ['alias']}}
