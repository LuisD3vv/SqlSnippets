/*

COMMON TABLE EXPRESSION

Contenido del dia de hoy, consultas recursivas
se conocen como CTE, 
basicamente es una consulta que existe temporalmente
y para uso unicamente dentro del contexto de una consulta principal
debe de usarse inmediatamente despues de ser creada

en los cte se pueden realizar calculos que no se pueden usar con una consulta normal, en lugar de usar
having

asi como funciones de ventana.

*/

-- Iniciar CTE con WITH, van sin coma y juntas a exepcion de que sean multiples

WITH ListaEpisodios AS (
	SELECT
	serie_id,
	episodio_id,
	titulo
	FROM Episodios
),
ListaSeries AS (
	SELECT serie_id,descripcion FROM Series
)
SELECT * FROM ListaEpisodios
LEFT JOIN ListaSeries
ON ListaEpisodios.serie_id = ListaSeries.serie_id;

-- Debe de ejecutarse una consulta justo despues del cte, tener cuidado en udemy con las putas tildes

WITH Fecha AS (
	SELECT serie_id,
	MIN(fecha_estreno) as primeEP
	FROM Episodios
	GROUP BY serie_id
)
SELECT titulo AS 'Título de la Serie', primeEP as 'Fecha del Primer Episodio'  FROM Fecha
JOIN Series
ON Fecha.serie_id = Series.serie_id
ORDER BY primeEP ASC;


-- seleccionar series a partir de una fecha especifci usando cT's, el nombre se llama subquery alias

WITH SeriesLanzadas AS (
	SELECT
	año_lanzamiento,
	count(serie_id) AS total_series
	FROM Series
	WHERE genero = 'Ciencia ficción'
	GROUP BY año_lanzamiento 
)
SELECT 
	año_lanzamiento,
	total_series
FROM
	SeriesLanzadas
ORDER BY
	año_lanzamiento ASC;


-- FUNCIONES DE VENTANA

-- Row_number() su funcion principal es asignar un numero consecutivo a cada fila
-- Pero su verdadero uso esta en que se puede reiniciar el conteo para cada grupo de datos
-- tambien es utilizado para eliminar registros duplicados y "cuál es el mejor/mayor"

WITH OrdenSeries as (
	SELECT 
		titulo,
		año_lanzamiento,
	ROW_NUMBER()
		OVER (
		ORDER BY año_lanzamiento desc)
		AS orden_lanzamiento
FROM Series
)
SELECT * FROM OrdenSeries
WHERE orden_lanzamiento IN (1,2,3);

-- se le asigno un numero secuencial basado en su anno de lanzamiento

SELECT
	titulo,
	año_lanzamiento,
ROW_NUMBER()
		OVER
		(ORDER BY año_lanzamiento DESC)
		AS clasificacion_global
FROM Series;

-- Partition BY


SELECT 
	titulo,
	genero,
	año_lanzamiento,
	ROW_NUMBER()
	OVER (PARTITION BY genero ORDER BY año_lanzamiento ASC)
	AS ranking_for_genero
FROM Series;



