--  Este es el proyecto del dia 6

/**
 	Utilizando CTES
 
 * Identificar las series mas exitosas en base a la cantidad de episodio y el rating promedio
 * 
 * el resultado es una tabla con 3 columnas, titulo, cantidad y rating promedio
 */


WITH cantep AS (
	SELECT
	e.serie_id,
	COUNT(*) AS cant_episodios
	FROM Episodios e
	GROUP BY e.serie_id
), -- no necesitamos colocar nuevamente with
rating AS (
	SELECT
	e.serie_id,
	AVG(rating_imdb) AS rating_promedio
	FROM Episodios e
	GROUP BY e.serie_id
)
SELECT
	s.titulo,
	c.cant_episodios, -- campos de las tablas temporales cts
	r.rating_promedio
FROM Series s
JOIN cantep c on s.serie_id  = c.serie_id -- uniones
JOIN rating r on s.serie_id  = r.serie_id 
ORDER BY r.rating_promedio DESC, c.cant_episodios DESC;
