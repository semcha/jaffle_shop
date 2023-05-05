{{
    config(
        materialized = 'view'
    )
}}

with source as (
    select *
    from {{ source("salesforce", "raw_customers") }}
),
renamed as (
    select
        id as customer_id,
        first_name,
        last_name
    from
        source
)
select *
from renamed
