-- Pregunta 1
-- ¿Quien es el actor o actriz que ha participado en la mayor cantidad de series?

select actor_id, count(serie_id) as participaciones from Actuaciones group by actor_id order by participaciones desc;

-- Pregunta 2
-- ¿Cual es la serie con mejor rating promedio segun imdb?
select serie_id, avg(rating_imdb) as rating_promedio
from Episodios
group by serie_id 
order by rating_promedio desc;

-- Pregunta 3
-- ¿Cual es el episodio con la duración más larga?

Select * from Episodios
order by duracion desc;
