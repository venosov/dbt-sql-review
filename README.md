### Levantar postgres con docker compose:

- stack.yml

      # Use postgres/example user/password credentials
      version: '3.1'

      services:

      db:
         image: postgres
         restart: always
         environment:
            POSTGRES_PASSWORD: example
         ports:
            - 5432:5432

      adminer:
         image: adminer
         restart: always
         ports:
            - 8080:8080


- docker-compose -f stack.yml up
- http://localhost:8080/
- dbt profiles.yml:

      default:
         target: dev
         outputs:
            dev:
               type: postgres
               host: xxx.xxx.x.xxx
               user: postgres
               pass: example
               port: 5432
               dbname: template1
               schema: public
               threads: 1
               keepalives_idle: 0 # default 0, indicating the system default


Más info:

- https://hub.docker.com/_/postgres
- https://docs.getdbt.com/reference/warehouse-profiles/postgres-profile/

### Consultas a realizar.

1. Encontrar los códigos de los proveedores que suministran al proyecto J1.

2. Encontrar todos los suministros (piezas) cuya cantidad esté entre 200
   y 300 inclusive.

3. Encontrar todos los nombres, color y peso de piezas por orden ascendente
   de peso.

4. Encontrar todos los triples de códigos de proveedor, proyecto y piezas
   que estén en la misma ciudad.

5. Encontrar los nombres de piezas suministradas por los proveedores de 
   Londres por orden ascendente de nombres.

6. Encontrar la ciudad y los códigos de piezas suministradas a cualquier
   proyecto por un proveedor que esté en la misma ciudad que esté el
   proyecto por orden ascendente de ciudad.

7. Encontrar aquellos proyectos que usan una pieza de las que suministra S1.

8. Encontrar los códigos de los proveedores que tienen un status mayor que el
   de S7.

9. Encontrar los códigos de aquellos proyectos que no utilizan ninguna pieza
   roja que esté suministrada por un proveedor de Londres.

10. Encontrar los códigos de aquellos proyectos a los que solo abastece S1.

11. Encontrar los códigos de las piezas suministradas a todos los proyectos
    localizados en Londres.

12. Encontrar aquellos proveedores que envían piezas procedentes de todas 
    las ciudades donde hay un proyecto.

13. Encontrar el número de envíos hechos por cada proveedor.

14. Encontrar la cantidad total de cada pieza enviada a cada proyecto.

15. Encontrar para cada poryecto su nombre y la cantidad media de piezas
    que recibe por envío. Sin usar INNER JOIN.

16. 15 haciendo uso de INNER JOIN

17. Ejemplo de left join
