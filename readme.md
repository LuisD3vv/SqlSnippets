Otros comandos utiles
check
case when
agrupacion logica where () or () | () and ()
set default
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
