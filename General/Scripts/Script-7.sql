/*
 * La 1NF nos dice que no deben de existeir datos multivariados, es decir datos repetidos o listas
 * es decir no puede existir lo del ejemplo de abajo
 */

-- Supongamos esta tabla
create table prueba(
--El id autoincremental se considera una lave aritifical porque no es  una propiedad de una persona
--En la vida real a como lo es un dni o email.
	Estudiante_ID serial primary key,
	Nombre_estudiante varchar(30) not null,
	Telefonos text not null-- Se podria malinterpretar [lista de numeeros]
);

/*
 * Como podemos ver, en este campo, como se pide "telefonos" se puede malinterpretar como que se
 * solicitan varios, pero esto generaria un campo multivariado es decir
 */
insert into prueba('luis','6638983312','6678654532','6673273581');

-- Como vemos, estos campos estarian en el mismo lugar todos junto.
-- Esto nos haria perder consistencia y nos podria dar problemas con la integridad de los datos
 
--Esto se puede arreglar asi

create table prueba(
	Estudiante_ID serial primary key,
	Nombre_estudiante varchar(30) not null,
);

create table telefonos (
	--Creamos un foreing key
	Estudiante_ID int references prueba(Estudiante_ID),
	Telefono text not null
);
-- De esta manera no interferimos con las transacciones y evitamos conflicos y redundancias
 
/* 
 * Ya teniendo la primera forma, podemos pasar directamente a la segunda, la cual nos dice
 * 
 * Todos los atributos no clave, deben depender completamente de la clave
 *  primaria,no solo parte de ella, para logra esto tomaremos de ejemplo la siguiente tabla
 *  */
 create table prueba (
	Estudiante_ID int, --un estudiante puede estar en muchos cursos
	Curso_ID int, -- un curso puede tener muchos estudiantes
	Nombre_estudiante varchar(30) not null,
	Nombre_curso varchar(30) not null,
	Fecha_incripcion date,
	primary key (Estudiante_ID,Curso_ID)
);

-- Podemos ver que que 
/*
 * Nombre_estudiante depende de el id estudiante
 * nombre curso depende del id de curso
 * pero fecha depende de ambos, ya que si lo dejamos asi estariamos ante una dependencia parcial
 * 
 * */

--De la forma de abajo, descomponiendo la tabla en datos que solo dependan de su clave
-- Obtendriamos el siguiente resultado
create table estudiante(
	Estudiante_ID serial primary key,
	nombre_estudiante varchar(30) not null
); 
create table cursos(
	Curso_ID serial primary key,
	nombre_curso varchar(30) not null
);
create table Inscipciones(
	Estudiante_ID int references estudiante(Estudiante_ID),
	Curso_ID int references cursos(Curso_ID),
	Fecha_Incripcion date
);
/*Una clave compuesta es la combinacion de dos o mas columnas(atributos) que juntos, identifican
de manera unica a cada fila
Es decir que ninguna de esas columnas por separado identifican unicamente la fila, pero juntas si
En el ejemplo de arriba separadas significan nada, pero juntas representan a un estudiante
por eso mismo
**/

--Ejemplo
create table ventas_productos(
	venta_id int,
	producto_id int,
	nombre_producto varchar(30),
	precio numeric(6,3),
	cantidad int,
	fecha_venta date
);
/*Como podemos ver, esta tabla no esta ni de lejos en la 2NF, porque?, porque hay datos que tienen
 * dependencia parcial de una sola parte de la clave compuesta y unicamente hay una columna que depend
 * de la compuesta, lo arreglaremos as, desglosando la tabla
 */
create table productos(
	Producto_ID serial primary key,
	nombre_producto varchar(30),
	precio numeric(6,2)
);
create table venta(
	venta_ID serial primary key,
	fecha_venta date
);

create table detalle_venta(
	/*Aqui la peticion se hace uno
	 * es decir se ingresa el producto y el id
	 * asiendo que */
	Producto_ID int references productos(Producto_ID),
	venta_ID int references venta(venta_ID),
	-- Estos dos de abajo son parte de el evento de la transaccion, no viven mas alla de este objetivo
	cantidad int,
	precio numeric(6,2)
);