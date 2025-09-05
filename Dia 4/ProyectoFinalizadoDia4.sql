-- ¿Qué géneros son más prevalentes en la base de datos NetflixDB? 
-- Genera una lista de los distintos géneros y la cantidad de series por cada uno.

select genero,count(genero) as 'cantidad de series' from NetflixDB.Series s  
group by genero;


-- Esta consulta SQL nos permite ver cuántas series hay en cada género dentro de la base de datos NetflixDB. 
-- Agrupando las series por su género y contándolas, podemos identificar cuáles géneros son más prevalentes.




-- ¿Cuáles son las tres series con mayor rating IMDB y cuántos episodios tienen? 
-- Considera usar un JOIN para combinar la información de las tablas de series y episodios.


SELECT 
S.titulo as 'Titulo',
E.rating_imdb  as 'Rating',
E.serie_id,
COUNT(E.serie_id) as 'Cantidad episodios'
FROM NetflixDB.Series as S
LEFT JOIN NetflixDB.Episodios as E
ON S.serie_id = E.serie_id 
group by E.serie_id,E.rating_imdb ,S.titulo 
ORDER BY E.rating_imdb DESC
LIMIT 3;

Select 
S.titulo, 
E.serie_id,
MAX(E.rating_imdb) as rating,
COUNT(E.serie_id) 
from NetflixDB.Episodios as E
JOIN NetflixDB.Series as S ON S.serie_id = E.serie_id 
group by E.serie_id,S.titulo  
order by rating desc
limit 3;

-- hay que tener cuidado con el group by, solo poner las esenciales

-- Con esta consulta, identificamos las tres series con el mayor rating IMDB 
-- en la base de datos y contamos cuántos episodios tiene cada una de ellas, combinando información de las tablas Series y Episodios.


-- ¿Cuál es la duración total de todos los episodios para la serie "Stranger Things"? 
-- Este análisis te permitirá entender el compromiso temporal necesario para ver una serie completa.


Select 
S.titulo, 
SUM(E.duracion) as 'Todos los episodios'
FROM NetflixDB.Episodios as E
JOIN NetflixDB.Series AS S ON S.serie_id = E.serie_id 
WHERE E.serie_id = 2
GROUP BY E.serie_id,S.titulo;

-- 1227 horas hay que chutarse
