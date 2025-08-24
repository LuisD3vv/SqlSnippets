CREATE TABLE Categorias (
	ID_Categoria Serial primary key,
	Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Productos (
	ID_Producto serial primary key,
	Nombre_Producto Varchar(100) NOT NULL,
	Precio DECIMAL(10,2),
	ID_Categoria int references Categorias(ID_Categoria)
);

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
	 

select * from Productos;

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


select * from Productos;
select * from Categorias;

--Agregar nuevas categorias


INSERT INTO Categorias(Nombre)
	VALUES ('Almacenamiento'),
	('Impresoras'),
	('Ofertas');


update Productos
set stock = 45
where nombre_producto = 'Laptop Dell';

INSERT INTO Productos(Nombre_Producto,Precio,ID_Categoria,stock)
VALUES('Laptop HP', 21200.50,5,10),
	 ('Teclado Mecanico', 375, 2, 15),
	 ('Monitor Samsumg 24 FHD "', 2999.00, 3,6),
	 ('Disco Duro SSD 1TB', 1150, 9, 9),
	 ('Memoria RAM 16GB', 1180,2,20),
	 ('Impresora Epson', 5180.90, 6,5),
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
SET precio = precio * 0.9
where precio > 5000;

--Incrementar el stock de productos de la categoria 2
UPDATE Productos
SET stock = stock + 10
where ID_Categoria = 2;


--Transladar los precios con menor precio a la categoria oferta

select * from Ofertas;

UPDATE Productos
SET ID_Categoria = 11
where precio < 1000;


--Poner stock a 50 todo
UPDATE Productos
set stock = 50;