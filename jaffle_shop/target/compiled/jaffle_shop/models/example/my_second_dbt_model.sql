-- Use the `ref` function to select from other models

select *
from "tradekit"."dev_schema"."my_first_dbt_model"
where id = 1