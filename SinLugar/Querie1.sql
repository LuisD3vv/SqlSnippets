CREATE TABLE Alumnos (
	ID_Alumno serial not null primary key,
	nombre text,
	edad int,
	telefono bigint
);

SELECT * FROM Alumnos;

CREATE TABLE Empleado (
	ID_Empleado serial primary key,
	nombre VARCHAR(50) not null,
	apellidos VARCHAR(50) not null,
	correo VARCHAR(50) unique null,
	fecha_contratacion date
);

SELECT * FROM Trabajadores;

-- Con unique, declaramos dato unico que no se puede repetir
CREATE TABLE Departamentos (
	ID_Departamento serial PRIMARY key,
	nombre_departamento varchar(50) not null unique,
	presupuesto numeric(10,2) CHECK(presupuesto > 0)
);

CREATE TABLE Proyecto (
	ID_Proyecto serial primary key,
	nombre_proyecto varchar(100) not null,
	fecha_inicio DATE,
	ID_Empleado int REFERENCES Empleado(ID_Empleado),
	ID_Departamento int references Departamentos(ID_Departamento)
);

--- Renombrar tabla empleados

ALTER TABLE Empleado
Rename to Trabajadores;

-- Agregar columna salario

ALTER table Trabajadores
add column salario NUMERIC(10,2) CHECK(salario > 0);

--Renombrar Columna fecha
ALTER TABLE Trabajadores
RENAME COLUMN fecha_contratacion to fecha_inicio;

--Eliminar Columna
alter table Trabajadores
drop COLUMN salario;




