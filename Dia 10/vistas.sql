create or replace view VistaEmpleadosTecnologia AS
select nombre,apellido,email
from Empleados
where depto_id = 1;

select * from VistaEmpleadosTecnologia;

-- vistas materializadas (postgres si lo soporta)
-- basicamente la consulta y sus resultados se guardan en disco, a diferencia
-- de la vista simple que no guarda nada

-- trigger

