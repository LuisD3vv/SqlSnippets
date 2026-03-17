check
case when
agrupacion logica where () or () | () and ()
set default
now()
extract
count(case when tipo = 'D' then 1 end), count ignora null
booleano true o false, sqlite(1 y 0)

Las funciones de agregacion son utilizadas para regresar un solo valor
>COUNT() suma las lineas
SUM() regresa la suma total de los valores en una columna
MIN() regresa el valor minimo
MAX() regresa el valor maximo
AVG() regresa el promedio de una columna
GROUP BY agrupa el resultado usando el valor comun en las columna 

Cuando usamos estas funciones, las columnas que no se seleccionaron
deben de colocarse en un group by

igual podemos usar el as, para renombrar las columnas
resultantes de la funcion.

es decir;

select name, materias, SUM(cal) / n as 'Promedio' from estuadiante
eso solo cambiaria la impresion, pero para utilizar este valor en
alguna otra clausula debe ser con el nombre tal cual de la tabla.


Al utilizar una funcion agregada, es buena idea usar group by
ya que agrupa el resultado de la funcion en una o mas columnas segun
el caso:

es decir;

SELECT nombre, AVG(calificaciones) as 'promedio'
from alumnos
GRUPO BY nombre;

todos los resultados atomicos, es decir, cada alumno
tendra su promedio porque se sumaran todas sus columnas
y se agruparanm por nombre sin repetirse

count(*) es igual a count(fila_id), porque cuenta la fila completa,
a diferencia de sum. que cuenta el mismo registro dependiendo de la condicion

## funciones de ventana
## rankigs
## subconsultas escalares, de tabla, correlacionales y with.


### podemos usar having y valores en un join claro que si


### Mas ejemplos utiles de sql
select nombre,
	cast(nombre as char) 
from municipios m 

select nombre, substr(nombre,1,1) from clientes -- extraer un cacho 

select 
	nombre, 
	left(nombre,1), -- primera y ultima letra de una cadena
	right(nombre,1)
from clientes

SELECT CONCAT(nombre, ' (', rfc_cliente, ') ') from clientes;

select length(nombre) from clientes;

select cast(extract(year from fecha) as int) from facturas -- cambiar tipo de dato el ejemploe sta mal pero asi funciona

select current_database();

select user;

select current_schemas

--  conocer el tipo de datos del atributo  muy util
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'facturas'
  AND column_name = 'folio';




