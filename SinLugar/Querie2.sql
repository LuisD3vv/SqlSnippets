

-- INSERTAR DATOS EN LA TABLA CATEGORIA

INSERT INTO Categorias(Nombre)
	VALUES
	('Camaras'),
	('Perifericos'),
	('Monitores'),
	('Adaptadores'),
	('Laptops'),
	('Dispositivos inteligentes'),
	('VideoJuegos'),
	('Software');

select * from Categorias;

-- INSERTAR DATOS EN LA TABLA PRODUCTO
--NUMERACION MAL, COLOCAR EN LAS CATEGORIAS CORRESPONDIENTES

INSERT INTO Productos(Nombre_Producto,Precio,ID_Categoria)
VALUES('Camara Reflex Cannon', 5490.99, 1),
	 ('Mouse Inalambrico Logitech', 290.99, 2),
	 ('Monitor Dell 24" Full HD', 2999.0, 3),
	 ('Monitor HP 24" Full HD', 2000, 3),
	 ('Adaptador HP Envy', 9990,4),
	 ('Altavoz Alexa Echo Dot', 839.90, 6),
	 ('PlayStation 5', 9999.99, 7),
	 ('Laptop Dell', 15290, 5);
	 

select Nombre_Producto, precio from Productos;

INSERT INTO Productos(Nombre_Producto,Precio,ID_Categoria)
VALUES ('Laptop HP',12999,5);


DELETE FROM Productos
where ID_Productos=7;


DELETE FROM Productos
where Nombre_Producto='Laptop HP';

--Eliminar productos de categoria Monitores mediante su id, con su nombre.

DELETE FROM Productos
WHERE ID_Categoria = (
	SELECT ID_Categoria
	FROM Categorias
	WHERE nombre='Monitores'
);

--Actualizar Registro

ALTER TABLE Productos
ADD COLUMN Stock INT;

SELECT *FROM Productos;

UPDATE Productos
SET stock = 18
where ID_Producto= 90;


select * from Productos WHERE id_producto = 1;
select * from Categorias;

--Agregar nuevas categorias


INSERT INTO Categorias(Nombre)
	VALUES ('Almacenamiento'),
	('Impresoras'),
	('Ofertas');


update Productos
set stock = 45
where nombre_producto = 'Laptop Dell';

INSERT INTO Productos(Nombre_Producto,Precio,id_categoria,stock)
	 VALUES
	 ('Laptop HP', 21200.50,5,13),
	 ('Teclado Mecanico', 375, 2,12),
	 ('Monitor Samsumg 24 FHD "', 2999.00, 3,6),
	 ('Disco Duro SSD 1TB', 1150, 8, 9),
	 ('Memoria RAM 16GB', 1180,2,20),
	 ('Impresora Epson', 5180.90, 18,5),
	 ('Router WIFI', 1130,4,5);


--Actualizar precios %10 de la categoria Laptops
UPDATE Productos
SET precio = precio* 1.1
where ID_Categoria = 5;


--Hacer un descuento del 20% a los productos cuyo stock es 
--Menor a 10 unidades

UPDATE Productos
SET precio = precio * 0.8
where stock > 10;


-- descuentos del 10 a productos con precios mayores 5k

UPDATE Productos
SET precio = 5000
where precio > 0;

--verificar
select * from productos;

--Incrementar el stock de productos de la categoria 2
UPDATE Productos
SET stock = stock + 10
where ID_Categoria = 2;


--Transladar los precios con menor precio a la categoria oferta

select * from categorias;

UPDATE Productos
SET ID_Categoria = 19
where precio < 1000;

--Modificar algo que la cague


--Poner stock a 50 todo
UPDATE Productos
set stock = 50;

UPDATE productos
SET descripcion = 'PENDIENTE'
WHERE descripcion = 'NULL';

select * from productos;

INSERT into productos(descripcion)
	 VALUES
	  ('Poderosa camara'),
	  ('Sony PS5 512GB'),
	  ( 'Router Tplink'),
	  ('Monitor Full hd delicioso');

ALTER TABLE productos
drop column descripcion;

-- crearla de nuevo

ALTER TaBLE Productos
add column descripcion varchar(50) null;

ALTER TaBLE Productos
add column estado VARCHAR(10);


UPDATE productos
SET estado = 'usado'
WHERE precio < 1000;


INSERT INTO Productos(Nombre_Producto,Precio,id_categoria,stock)
	 VALUES
	 ('MacBook Pro 24"', 57000, 5,35),
	 ('MSI Gamer 512ROM 12GB', 45000,5, 90),
	 ('HUAWEI Laptop 1TB 1TBRAM ',10000,5,1);


-- Modificar el tipo de dato ya existente
alter table productos
alter COLUMN precio TYPE int;


select nombre_producto, precio from productos
where precio < 6000;
	 