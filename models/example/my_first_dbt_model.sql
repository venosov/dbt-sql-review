
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (


   (
    select 
     codpj 
    from 
     proyecto
   )
   except
   (
    select distinct
     proyecto.codpj
    from
     proyecto, pieza, ventas, proveedor
    where
     ventas.codp = pieza.codp and
     ventas.codpj = proyecto.codpj and
     ventas.codpro = proveedor.codpro and
     proveedor.ciudad = 'Londres' and
     pieza.color = 'rojo'
   )


)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
