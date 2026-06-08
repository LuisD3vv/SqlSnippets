delimiter //

create or replace procedure AgregarEmpleado(
IN _nombre varchar(255),
IN _apellido varchar(255),,
IN _email varchar(255),
IN _depto_id INT)
BEGIN
INSERT INTO Empleados(nombre,apellido,email,depto_id)
values (_nombre,_apellido,_email,_depto_id);
END
end //
delimiter ;