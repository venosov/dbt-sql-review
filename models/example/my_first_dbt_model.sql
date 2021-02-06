
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (


select distinct 
   ventas1.codp 
from 
   ventas ventas1 
where 
   not exists
   (
     (
       select 
         proyecto.codpj 
       from 
         proyecto 
       where 
         proyecto.ciudad = 'Londres'
     )
     except
     (
       select 
         ventas.codpj 
       from 
         ventas
       where 
         ventas.codp = ventas1.codp
     )
   )



)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
