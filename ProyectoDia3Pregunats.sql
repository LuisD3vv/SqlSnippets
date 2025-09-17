-- Pregunta 1
-- ¿Quien es el actor o actriz que ha participado en la mayor cantidad de series?

/*utilizaremos como intermediaria la tabla actuaciones que contiene ambos id, tanto el de actor, como el de sus apariciones*/

select actor_id ,sum(serie_id) as Participaciones from Actuaciones
group by actor_id;

select nombre from Actores;
select titulo from Series;
-- Pregunta 2
-- ¿Cual es la serie con mejor rating promedio segun imdb?


-- Pregunta 3
-- ¿Cual es el episodio con la duración más larga?
