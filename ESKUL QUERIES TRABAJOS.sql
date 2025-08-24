--Tabla de relaciones entre clientes y pedidos
CREATE TABLE clientes (
  Cliente_ID serial primary key,
  Nombre varchar(30),
  Email varchar(30) unique
);
CREATE TABLE pedidos (
  Pedido_id serial primary key,
  Cliente_ID INT REFERENCES clientes(cliente_id),
  Fecha_pedido date, -- 00-00-2000
  Total int
);
INSERT INTO clientes (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María López', 'maria.lopez@example.com'),
('Carlos Ramírez', 'carlos.ramirez@example.com');

INSERT INTO pedidos (cliente_id, fecha_pedido, total) VALUES
(1, '2025-05-01', 150.00),
(2, '2025-05-02', 200.50),
(1, '2025-05-03', 75.25),
(3, '2025-05-04', 300.00),
(2, '2025-05-05', 50.75);

--Realiza una consulta
--que devuelva todos
--los pedidos junto con el nombre del cliente.
SELECT
pedidos.Cliente_ID AS cliente,
clientes.Nombre AS Nombre_Cliente, 
pedidos.Fecha_pedido,
pedidos.Total AS total_pedido
FROM pedidos
INNER JOIN Clientes ON clientes.Cliente_ID = pedidos.Cliente_ID;


--Ejercicio 2------------------------------------
--Ejercicio de Autores, Libros y editoriales

CREATE TABLE editoriales (
  Editorial_ID serial primary key,
  Nombre VARCHAR(30)
);
CREATE TABLE autores (
  Autores_ID serial primary key,
  Nombre VARCHAR(30)
);
CREATE TABLE libros (
  Libro_ID serial primary key,
  Titulo varchar(30),
  Autores_ID int references autores(Autores_ID),
  Editorial_ID int references editoriales(Editorial_ID),
  anio_publicacion INT
);

INSERT INTO editoriales(Nombre)
VALUES
	('Aguilar'),
	('Pereira');

INSERT INTO autores(Nombre)
VALUES
	('Lissandro'),
	('Pedro pascal');
	
INSERT INTO libros(Titulo, Autores_ID, Editorial_ID,anio_publicacion)
VALUES
	('La luna roja', 1,2,2019),
	('El sol rojo', 2,1,2013),
	('Dios esta vivo', 1,2,2014),
	('Maximum Carnaje', 2,1,2015);

SELECT * from libros;
--Consigna /Haz una consulta que devuelva los títulos de los libros junto con el nombre del autor y la editorial.

--Los AS van con snake case es decir hola_mundo
SELECT 
libros.Titulo AS Titulo,
autores.Nombre AS Autor,
editoriales.Nombre AS Editorial
FROM libros
join autores on libros.Autores_ID = autores.Autores_ID
join editoriales on libros.Editorial_ID = editoriales.Editorial_ID;

--Ejercicio numero 3----------------------------------------
CREATE TABLE proveedores (
  Proveedor_ID serial primary key,
  Nombre VARCHAR(30)
);
CREATE TABLE productos (
  Producto_ID serial primary key,
  Nombre VARCHAR(30)
);
CREATE TABLE suministro (
  suministro_ID serial primary key,
  Proveedor_ID int references proveedores(Proveedor_ID),
  Producto_ID int references productos(Producto_ID),
  fecha_suministro date,
  cantidad int
);
--Ejercicio numero 4--------------------------------------------

CREATE TABLE profesores (
  Profesor_ID serial primary key,
  Nombre VARCHAR(30)
);
CREATE TABLE cursos (
  Curso_ID serial primary key,
  Profesor_ID int REFERENCES profesores(Profesor_ID),
  Nombre VARCHAR(30)
);
CREATE TABLE estudiantes (
  Estudiante_ID serial primary key,
  Nombre VARCHAR(30)
);
CREATE TABLE inscripciones (
  Incripcion_ID serial primary key,
  Estudiante_ID int REFERENCES estudiantes(Estudiante_ID),
  Curso_ID int references cursos(Curso_ID),
  fecha_inscripcion DATE
);

INSERT INTO profesores(Nombre)
VALUES('Manuel'),('Javier');
select* from profesores;

INSERT INTO cursos(Profesor_ID, Nombre)
VALUES (8,'Matematicas'),(5,'Biologia'),(7,'Historia');
select * from cursos;

INSERT INTO estudiantes(Nombre)
values('Lissandro'),('Kevin'),('Elias'),('Chan'),('Diego'),('Noe');
select* from estudiantes;

INSERT INTO inscripciones(estudiante_id, curso_id,fecha_inscripcion)
values(1,16,'10-01-2021'),(2,16,'01-02-2021'),(3,17,'11-01-2021'),(4,17,'10-10-2020'),(5,18,'05-05-2004'),(6,18,'07-01-2001');
select* from inscripciones;

--Haz una consulta que devuelva la lista de estudiantes inscritos en cada curso junto con el nombre del profesor.

SELECT
estudiantes.Nombre as Estudiante,
cursos.Nombre as cursito,
profesores.Nombre
FROM inscripciones
join estudiantes on inscripciones.Estudiante_ID = estudiantes.Estudiante_ID
join cursos on inscripciones.Curso_ID = cursos.Curso_ID
join profesores on cursos.Profesor_ID = profesores.Profesor_ID;

--Ejercicio 5 y ultimo a la verga

CREATE TABLE categorias (
  categoria_ID serial primary key,
  Nombre VARCHAR(30)
);
CREATE TABLE productos (
  Producto_ID serial primary key,
  Nombre VARCHAR(30),
  precio numeric(6,2),
  categoria_ID int references categorias(categoria_ID)
);
CREATE TABLE usuarios (
  Usuario_ID serial primary key,
  Nombre VARCHAR(30)
);
CREATE TABLE pedios(
  Pedios_ID serial primary key,
  Usuario_ID int references usuarios(Usuario_ID),
  fecha_pedido date
);
CREATE TABLE detalle_pedido (
  Detalle_ID serial primary key,
  Pedios_ID int REFERENCES pedios(Pedios_ID),
  Producto_ID int references productos(Producto_ID),
  cantidad int check(cantidad > 0),
  precio_unitario numeric(6,2)
);

INSERT INTO categorias (Nombre) VALUES
('Bebidas'),
('Snacks');


INSERT INTO productos (Nombre, precio, categoria_ID) VALUES
('Coca Cola', 15.50, 1),
('Papitas', 10.00, 2),
('Jugo de Naranja', 18.75, 1);


INSERT INTO usuarios (Nombre) VALUES
('Juan Pérez'),
('Ana García');

INSERT INTO pedios (Usuario_ID, fecha_pedido) VALUES
(1, '2025-05-10'),
(2, '2025-05-11');

INSERT INTO detalle_pedido (Pedios_ID, Producto_ID, cantidad, precio_unitario) VALUES
(1, 1, 2, 15.50),  -- Juan compró 2 Coca Cola
(1, 2, 1, 10.00),  -- Juan compró 1 Papitas
(2, 3, 1, 18.75),  -- Ana compró 1 Jugo
(2, 2, 2, 10.00);  -- Ana compró 2 Papitas


--Haz una consulta que devuelva el detalle completo de cada pedido: cliente, productos, cantidad y total por línea.
SELECT 
  usuarios.Nombre AS Cliente,
  productos.Nombre AS Producto,
  detalle_pedido.cantidad AS Cantidad,
  detalle_pedido.cantidad * detalle_pedido.precio_unitario AS Total
FROM detalle_pedido
JOIN pedios ON detalle_pedido.Pedios_ID = pedios.Pedios_ID
JOIN productos ON detalle_pedido.Producto_ID = productos.Producto_ID
JOIN usuarios ON pedios.Usuario_ID = usuarios.Usuario_ID;

