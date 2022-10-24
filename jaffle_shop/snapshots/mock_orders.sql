{% snapshot mock_orders %}
{% set new_schema = 'snapshots' %}

{{
    config(
        target_database='tradekit',
        target_schema=new_schema,
        unique_key='order_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from jaffle_shop.mock_orders

{% endsnapshot %}