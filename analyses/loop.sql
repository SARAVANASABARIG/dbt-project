{% set cols=['Vehicle_id','dtc_code']%}

select
{% for col in cols%}
    {{col}}
        {%if not loop.last %}, {% endif%}
{% endfor %}
FROM {{ ref('bronze_dtc_data')}}
limit 5