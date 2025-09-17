-- ¿Qué géneros son más prevalentes en la base de datos NetflixDB? 
-- Genera una lista de los distintos géneros y la cantidad de series por cada uno.
SELECT genero,
count(genero) AS cantidad_de_series
FROM NetflixDB.Series s  
GROUP BY genero
ORDER BY cantidad_de_series desc;
-- Esta consulta SQL nos permite ver cuántas series hay en cada género dentro de la base de datos NetflixDB. 
-- Agrupando las series por su género y contándolas, podemos identificar cuáles géneros son más prevalentes.




-- ¿Cuáles son las tres series con mayor rating IMDB y cuántos episodios tienen? 
-- Considera usar un JOIN para combinar la información de las tablas de series y episodios.
SELECT  
S.titulo, 
E.serie_id,
MAX(E.rating_imdb) AS rating,
COUNT(E.episodio_id) AS cantidad_episodios
FROM NetflixDB.Episodios AS E
JOIN NetflixDB.Series AS S ON S.serie_id = E.serie_id 
GROUP BY E.serie_id,S.titulo  
ORDER BY rating desc,cantidad_episodios desc
LIMIT 3;
-- hay que tener cuidado con el group by, solo poner las esenciales
-- Con esta consulta, identificamos las tres series con el mayor rating IMDB 
-- en la base de datos y contamos cuántos episodios tiene cada una de ellas, combinando información de las tablas Series y Episodios.



-- ¿Cuál es la duración total de todos los episodios para la serie "Stranger Things"? 
-- Este análisis te permitirá entender el compromiso temporal necesario para ver una serie completa.
Select 
S.titulo, 
SUM(E.duracion) as 'Duracion Total'
FROM NetflixDB.Episodios as E
JOIN NetflixDB.Series AS S ON S.serie_id = E.serie_id 
WHERE E.serie_id = 2
GROUP BY E.serie_id,S.titulo;

-- 1227 horas hay que chutarse

