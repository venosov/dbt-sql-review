
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

select distinct
  proyecto.codpj, proyecto.nompj
from
  ventas, proyecto
where
  ventas.codp in 
  (
     select distinct
        ventas.codp
     from
        ventas
     where
        ventas.codpro = 'S1'
  )
  and ventas.codpj = proyecto.codpj

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
