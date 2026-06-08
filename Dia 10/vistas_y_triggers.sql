create or replace view VistaEmpleadosTecnologia AS
select nombre,apellido,email
from Empleados
where depto_id = 1;

select * from VistaEmpleadosTecnologia;

-- vistas materializadas (postgres si lo soporta)
-- basicamente la consulta y sus resultados se guardan en disco, a diferencia
-- de la vista simple que no guarda nada

-- trigger

DELIMITER $$

create trigger RegistrarNuevoEmpleado
after insert on empleados
for each row
begin
	insert into LogEmpleados(empleado_id,fecha_registro)
    -- new es el nuevo dato que se esta insertando funciona como una pseudotabla
    values (new.empleado_id,now());
end $$

DELIMITER ;


