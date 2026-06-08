-- crear un procedimiento llamado AgregarDepartamento
-- sin transacciones,

-- utilizar las barras en lugar de las comillas como fin de codigo.

delimiter //

create procedure AgregarDepartamento(in _nombre_departamento varchar(255), in _ubicacion_departamento varchar(255))
BEGIN
	INSERT INTO Departamentos (nombre,ubicacion)
    values (_nombre_departamento,_ubicacion_departamento);
END //

delimiter ;



call AgregarDepartamento('Desarrollo Web','Campus Tecnologico');


select * from Departamentos;