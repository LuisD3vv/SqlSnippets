-- ¿Qué géneros son más prevalentes en la base de datos NetflixDB? 
-- Genera una lista de los distintos géneros y la cantidad de series por cada uno.


 -- mostrar los generos y contantaree los id de las series
 
 select * from Series;
 
 select genero from Series;
 
SELECT genero, count(serie_id) as 'Serie * genero' FROM Series
group by genero; 




-- Esta consulta SQL nos permite ver cuántas series hay en cada género dentro de la base de datos NetflixDB. 
-- Agrupando las series por su género y contándolas, podemos identificar cuáles géneros son más prevalentes.



-- ¿Cuáles son las tres series con mayor rating IMDB y cuántos episodios tienen? 
-- Considera usar un JOIN para combinar la información de las tablas de series y episodios.

-- mostrar las 3 series con mayor rating y cuantos episodios tienen

select titulo
from Episodios
where serie_id = 2
order by titulo asc;

select Series.titulo, count(Episodios.episodio_id) as total
from Series
join Episodios
on Series.serie_id = Episodios.serie_id
group by titulo
order by total desc;

-- Con esta consulta, identificamos las tres series con el mayor rating IMDB 
-- en la base de datos y contamos cuántos episodios tiene cada una de ellas, combinando información de las tablas Series y Episodios.

-- ¿Cuál es la duración total de todos los episodios para la serie "Stranger Things"? 
-- Este análisis te permitirá entender el compromiso temporal necesario para ver una serie completa.





