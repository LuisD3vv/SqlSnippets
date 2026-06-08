create database if not exists EmpresaDB;

-- seleccionar manualmente
use EmpresaDB;


-- tabla departamentos
create table if not exists Departamentos 
(
	depto_id INT AUTO_INCREMENT primary key,
	nombre varchar (255) not null,
	ubicacion varchar (255)
);

-- Creación de la tabla Empleados
CREATE TABLE IF NOT EXISTS Empleados (
    empleado_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    depto_id INT,
    FOREIGN KEY (depto_id) REFERENCES Departamentos(depto_id)
    ON DELETE SET NULL
);


-- Creación de la tabla Proyectos
CREATE TABLE IF NOT EXISTS Proyectos (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE
);
-- Creación de la tabla AsignacionesDeProyectos
CREATE TABLE IF NOT EXISTS AsignacionesDeProyectos (
    asignacion_id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT,
    empleado_id INT,
    horas_asignadas INT NOT NULL,
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
    on delete cascade
    on update cascade
);

CREATE TABLE IF NOT EXISTS LogEmpleados (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT,
    fecha_registro DATETIME,
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
  
);

-- ALTER TABLE

ALTER TABLE Departamentos add column email_jefe varchar(255);

select * from Departamentos;

-- DROP TABLE IF EXISTS (eliminar tabla completo, tanto su estructura y datos),

DROP TABLE IF EXISTS AsignacionesDeProyectos;


-- INGRESAR DATOS A LAS TABLAS

INSERT INTO	Departamentos (nombre,ubicacion)VALUES
	('Recursos Humanos','Edificio B'),
	('Marketing','Edificio Central');
	
-- actualizar algun campo

UPDATE Departamentos d set ubicacion = 'Edificio A' where nombre = 'Marketing';

select * from Departamentos d ;

	
-- Borrar

DELETE FROM Departamentos where nombre = 'Marketing';


-- crear indices
 
-- Crear un índice en MySQL permite acelerar drásticamente las consultas de búsqueda y ordenamiento. Puedes crearlo al momento de crear una nueva tabla, agregarlo a una tabla existente mediante ALTER TABLE, o usar CREATE INDEX. 

-- ver y eliminar
-- SHOW INDEX FROM empleados;
-- DROP INDEX FROM ON empleados;

-- ver las bases de datos
show databases;


