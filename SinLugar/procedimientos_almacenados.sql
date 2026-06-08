select * from cuentas where nombre = 'Lissandro';

/*
 * Un procedimiento almacenado es un conjunto de instrucciones sql
 * precompiladas y almacedas en el servidor de base de datos
 * que pueden ser reutilizada, funcionando como un script, 
 * aceptando parametros de entrada, y devolviendo resultados
 * lo que es util para reducir el error humano y centralizar
 * la logica del negocio.
 * 
 * */

create procedure insertar_cuenta(
	parametrs
LANGUAGE plpgsql
AS $$ -- procedimiento
begin -- bloque del codigo
	-- instrucciones
	-- mostrar un mensaje en la consola
	RAISE NOTICE 'Cuenta % insertada',campo
	
end;
	$$;

-- Existen 3 diferentes tipos in out in/out
-- IN son las que reciben parametros normales y las envian al procedimiento
CREATE PROCEDURE insertar_producto(
p_nombre CHARACTER VARYING(40),
p_descripcion TEXT

)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO productos(nombre, descripcion)
VALUES (p_nombre, p_descripcion);
RAISE NOTICE 'Producto % insertado', p_nombre;
END;
$$;
-- OUT Permiten que el procedimiento regrese valores
CREATE PROCEDURE contar_clientes(

OUT total INT

)
LANGUAGE plpgsql
AS $$
BEGIN

SELECT COUNT(*) INTO total FROM clientes;

END;
$$;
-- IN/OUT actuan como entrada y despues pueden ser modificados para usarse como salida
CREATE PROCEDURE incrementar_valor(

INOUT numero INT
@_
)
LANGUAGE plpgsql
AS $$
BEGIN

numero := numero + 1;

END;
$$;

-- Eliminarlo con, es necesario declarale el tipo de dato de los parametros a eliminar
-- Tambien existe replace

drop procedure if exists


-- ejercicios con procedimientos

--1 IN
create procedure insertar_cuenta(
	c_nombre varchar(40),
	c_apellido_paterno varchar(40),
	c_apellido_materno varchar(40),
	c_capital numeric(12,2),
	c_email varchar(60)
	)
LANGUAGE plpgsql
AS $$ -- procedimiento
begin -- bloque del codigo
	-- instrucciones
	INSERT INTO cuentas(nombre,apellido_paterno,apellido_materno,capital,email)
	VALUES(c_nombre,c_apellido_paterno,c_apellido_materno,c_capital,c_email);

	-- mostrar un mensaje en la consola
	RAISE NOTICE 'Cuenta % insertada',c_nombre
	
end;
	$$;

call insertar_cuenta('Lissandro','Aguilar','Soberanes',21000,'Luismexico@gmail.com')
call insertar_cuenta('Eduardo','Aguilar','Soberanes',50000,'Eduaguimex@gmail.com')

-- 2 declarar un procedimiento para eliminar una cuenta por su id

drop procedure eliminar_cuenta(cuenta_id int)

create procedure eliminar_cuenta(
	cuenta_id int
)
language plpgsql
as $$
begin

	delete from cuentas where id_cuenta = cuenta_id;
	RAISE NOTICE 'CUENTA CON ID % ELIMINADA',cuenta_id;
end;
$$

call eliminar_cuenta(52)

select * from cuentas where id_cuenta = 51;


drop procedure insertar_cuentas(
	c_nombre varchar(40),
	c_apellido_paterno varchar(40),
	c_apellido_materno varchar(40),
	c_capital numeric(12,2),
	c_email varchar(60)
) 

drop procedure 

-- Ejemplo visual de procedimiento con salida, entrada y variables locales
CREATE PROCEDURE ProcedureName
    @Parameter1 DataType,        -- Optional Input Parameter
    @Parameter2 DataType OUTPUT  -- Optional Output Parameter
AS
BEGIN
    -- Optional: Declare local variables
    DECLARE @LocalVar datatypeif ,@impuesto := .16 float;
    
    -- Procedure logic (SELECT, INSERT, UPDATE, etc.)
    SELECT * FROM TableName WHERE Column = @Parameter1;
END;

-- Ejemplo con la db cuenta ahorros

create procedure bono_ahorro()
language plpgsql
as $$
	declare
		bono int:=2000;
begin
		update cuentas
		set capital = capital + bono;
	RAISE NOTICE 'Bono fidelidad aplicado cantidad %',bono;
end;
$$;

call bono_ahorro()

select nombre,capital from cuentas;

-- asignar la salida a una variable
CREATE PROCEDURE ejemplo_variables()
LANGUAGE plpgsql
AS $$
DECLARE
edad_promedio NUMERIC(5,2);
BEGIN
-- guarda el resultado del a consulta en la variable edad_promedio
SELECT AVG(edad) INTO edad_promedio FROM empleados;
RAISE NOTICE 'Edad promedio: %', edad_promedio;
END;
$$;

-- usando if
CREATE PROCEDURE eliminar_empleado(p_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
IF EXISTS (SELECT 1 FROM empleados WHERE id_empleado = p_id) THEN
DELETE FROM empleados WHERE id_empleado = p_id;
RAISE NOTICE 'Empleado con ID % eliminado', p_id;
ELSE
RAISE NOTICE 'No se encontró el empleado con ID %', p_id;
END IF;
END;
$$;

-- con else else elsif y else

CREATE PROCEDURE clasificar_promedio(p_promedio NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
IF p_promedio >= 90 THEN
RAISE NOTICE 'Excelente’;
ELSIF p_promedio >= 70 THEN
RAISE NOTICE 'Satisfactorio’;
ELSE
RAISE NOTICE 'Reprobado';
END IF;
END;
$$;

--con case when

CREATE PROCEDURE clasificar_nota_case(p_nota NUMERIC)
LANGUAGE plpgsql
AS $$
DECLARE

v_resultado TEXT;

BEGIN
v_resultado := CASE
WHEN p_nota >= 90 THEN 'Excelente'
WHEN p_nota >= 70 THEN 'Satisfactorio'
ELSE 'Reprobado'
END;
RAISE NOTICE 'Clasificación: %', v_resultado;
END;
$$;

