
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (


select distinct 
   ventas.codpro
from 
   ventas 
where 
   not exists
   (
     (
       select 
         proyecto.ciudad 
       from 
         proyecto 
     )
     except
     (
       select 
         pieza.ciudad
       from 
         pieza, ventas ventas1
       where 
         ventas1.codp = pieza.codp and
         ventas1.codpro = ventas.codpro
     )
   )




)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
