/*
La vista debe mostrar el nombre,apellido
y el proyecto

un problema son las restricciones, pero me da hueva cambiar las putas restricciones
*/
-- unir con asignaciones porque es el intermedio para poder trabajar con una relacion muchos-a-muchos
create view VistaEmpleadosProyectos as
select
	e.nombre as nombre_empleado,
    e.apellido,
    p.nombre nombre_proyecto
from AsignacionesDeProyectos ap
join Empleados e 
	on ap.empleado_id = e.empleado_id
join Proyectos p 
	on ap.proyecto_id = p.proyecto_id;

-- eliminar restriccion (en este caso solo es de practica, pero no lo recomiendo, es mejor siempre evitar los errores)

ALTER table AsignacionesDeProyectos
drop constraint AsignacionesDeProyectos_ibfk_1;
-- crear una nueva, podemos reutilizar el nombre.

ALTER TABLE AsignacionesDeProyectos 
ADD CONSTRAINT AsignacionesDeProyectos_ibfk_1 
FOREIGN KEY (proyecto_id ) REFERENCES Proyectos(proyecto_id )
ON DELETE CASCADE
ON UPDATE CASCADE;


ALTER table AsignacionesDeProyectos
drop constraint AsignacionesDeProyectos_ibfk_2;
-- crear una nueva, podemos reutilizar el nombre.

ALTER TABLE AsignacionesDeProyectos 
ADD CONSTRAINT AsignacionesDeProyectos_ibfk_2 
FOREIGN KEY (empleado_id ) REFERENCES Empleados(empleado_id )
ON DELETE CASCADE
ON UPDATE CASCADE;
