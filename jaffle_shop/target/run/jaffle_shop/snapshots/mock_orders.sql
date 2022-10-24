
      update "tradekit"."snapshots"."mock_orders"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "mock_orders__dbt_tmp143703945075" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "tradekit"."snapshots"."mock_orders".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      and "tradekit"."snapshots"."mock_orders".dbt_valid_to is null;

    insert into "tradekit"."snapshots"."mock_orders" ("order_id", "status", "created_at", "updated_at", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."order_id",DBT_INTERNAL_SOURCE."status",DBT_INTERNAL_SOURCE."created_at",DBT_INTERNAL_SOURCE."updated_at",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "mock_orders__dbt_tmp143703945075" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  