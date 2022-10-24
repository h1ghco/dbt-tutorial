
  
    

  create  table "tradekit"."dev_schema"."stg_customers__dbt_tmp"
  as (
    select
    id as customer_id,
    first_name,
    last_name

from jaffle_shop.customers
  );
  