/*----------------------- TABLA PROVEEDORES -----------------------*/
drop table proveedores

create table proveedores(
	id_proveedor serial not null,
	Nombre_Compania character varying(40) not null,
	Nombre_Contacto character varying(40) not null,
	Cargo_Contacto character varying(40) not null,
	Direccion character varying(50) not null,
	Ciudad character varying(30) not null,
	Region character varying(10) not null,
	CodPostal character varying(8) not null,
	Pais character varying(30) not null,
	Telefono character varying(10) not null,
	Fax integer not null,
	paginaPrincipal character varying(40) not null,
	
	CONSTRAINT pk_idproveedor PRIMARY KEY (id_proveedor)
);

INSERT INTO proveedores(Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax, paginaPrincipal)
VALUES ('La Favorita', 'John Smith', 'Gerente de Ventas', 'Av. General Enríquez vía Cotogchoa', 'Quit', 'Sierra', '091401', 'Ecuador', '02-2236688', 31342231, 'https://www.corporacionvavorita.com');
INSERT INTO proveedores(Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax, paginaPrincipal)
VALUES ('El Rosado', 'Maria Garcia', 'Comprado', 'Av. 9 de Octubre', 'Guayaquil', 'Costa', '090101', 'Ecuador', '0993424114', 23216577, 'https://www.elrosado.com');
INSERT INTO proveedores(Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax, paginaPrincipal)
VALUES ('Nestle', 'Robert Johnson', 'Gerente de Compras', 'Av. Simón Bolívar', 'Quito', 'Sierra', '091401', 'Ecuador', '0934256643', 23433167, 'https://www.nestle.com.ec');
INSERT INTO proveedores(Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax, paginaPrincipal)
VALUES('Indulac','Cristian David','Repartidor',' Vía a Daule', 'Guayaquil', 'Costa', '090150', 'Ecuador','0958643900', 24342453, 'https://www.Indulac.com');
INSERT INTO proveedores(Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax, paginaPrincipal)
VALUES('Almacenes la Ganga', 'Carlos Cavanilla', 'Vendedor', '17 y portete', 'Guayaquil', 'Costa', '090150', 'Ecuador', '0979898989', 24958370, 'https://www.almaceneslaganga.com');

select * from proveedores

/*----------------------- TABLA CATEGORIAS -----------------------*/
drop table categorias

create table categorias(
	id_categoria serial not null,
	Nombre_Categoria character varying(20) not null,
	Descripcion character varying(50) not null,
	
	CONSTRAINT pk_idcategoria PRIMARY KEY (id_categoria)
);

INSERT INTO categorias(Nombre_Categoria,Descripcion)
VALUES ('Aceites','Apropiado para ensaladas y frituras');
INSERT INTO categorias (Nombre_Categoria,Descripcion)
VALUES ('Hogar','Todo el ambiente Domestico');
INSERT INTO categorias (Nombre_Categoria,Descripcion)
VALUES ('Galletas','galleta wafer rellena con crema sabor a vainilla');
INSERT INTO categorias(Nombre_Categoria,Descripcion)
VALUES ('Lacteos','Fortalece tu sistema inmune');
INSERT INTO categorias (Nombre_Categoria,Descripcion)
VALUES ('Electrodomesticos','Dispositivos electricos para el hogar');

select * from categorias

/*----------------------- TABLA PRODUCTOS -----------------------*/

create table productos(
	id_producto serial not null,
	Nombre_Producto character varying(25) not null,
	cod_idproveedor integer not null,
	cod_idcategoria integer not null,
	Cantidad_Por_Unidad integer not null,
	Precio_Unidad real not null,
	Unidades_En_Existencia integer not null,
	Unidades_En_Pedido integer not null,
	Nivel_Nuevo_Pedido integer not null,
	Suspendido character varying(15) not null,
	
	CONSTRAINT pk_idproducto PRIMARY KEY (id_producto),
	CONSTRAINT fk_idproveedor FOREIGN KEY (cod_idproveedor) REFERENCES proveedores(id_proveedor),
	CONSTRAINT fk_idcategoria FOREIGN KEY (cod_idcategoria) REFERENCES categorias(id_categoria)
);

INSERT INTO productos(Nombre_producto,cod_idproveedor,cod_idcategoria,Cantidad_Por_Unidad,Precio_Unidad,Unidades_En_Existencia,Unidades_En_Pedido,Nivel_Nuevo_Pedido,Suspendido)
VALUES ('Aceite Girasol',1 ,1 ,7 ,2.75 ,0 ,10 ,20,'SI');
INSERT INTO productos(Nombre_producto,cod_idproveedor,cod_idcategoria,Cantidad_Por_Unidad,Precio_Unidad,Unidades_En_Existencia,Unidades_En_Pedido,Nivel_Nuevo_Pedido,Suspendido)
VALUES ('Vajillas',2 ,2 ,20 ,1.25 ,40 ,10 ,30 ,'NO');
INSERT INTO productos(Nombre_producto,cod_idproveedor,cod_idcategoria,Cantidad_Por_Unidad,Precio_Unidad,Unidades_En_Existencia,Unidades_En_Pedido,Nivel_Nuevo_Pedido,Suspendido)
VALUES('Waffer Vainilla',3 ,3 ,7 ,1.25 ,13 ,20 ,20 ,'NO');
INSERT INTO productos(Nombre_producto,cod_idproveedor,cod_idcategoria,Cantidad_Por_Unidad,Precio_Unidad,Unidades_En_Existencia,Unidades_En_Pedido,Nivel_Nuevo_Pedido,Suspendido)
VALUES('Leche en polvo',4 ,4 ,15 ,2.60 ,0 ,10 ,20 ,'SI');
INSERT INTO productos(Nombre_producto,cod_idproveedor,cod_idcategoria,Cantidad_Por_Unidad,Precio_Unidad,Unidades_En_Existencia,Unidades_En_Pedido,Nivel_Nuevo_Pedido,Suspendido)
VALUES('Refrigeradora Whirlpool',5 ,5 ,2 ,1.25 ,8 ,4 ,2 ,'NO');

select * from productos

/*----------------------- TABLA CLIENTES -----------------------*/

create table clientes (
	id_cliente serial not null,
	Nombre_Compania character varying(40) not null,
	Nombre_Contacto character varying(40) not null,
	Cargo_Contacto character varying(40) not null,
	Direccion character varying(50) not null,
	Ciudad character varying(30) not null,
	Region character varying(10) not null,
	CodPostal character varying(8) not null,
	Pais character varying(30) not null,
	Telefono character varying(10) not null,
	Fax integer not null,
	
	CONSTRAINT pk_idcliente PRIMARY KEY (id_cliente)
);

INSERT INTO clientes (Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax)
VALUES('Almacenes Tia','Mauricio Aguilar','Supervisor',' Avda. Pedro Vicente Maldonado', 'Quito','Sierra', '090101', 'Ecuador', '0999405075', 2346543);
INSERT INTO clientes (Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax)
VALUES('Tuti', 'Ruth Tumbaco', 'Jefe de Compras', 'Av Venezuela 230 Mts. Plaza G', 'Quito', 'Sierra', '091401', 'Ecuador', '0993750711', 5434612);
INSERT INTO clientes (Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax)
VALUES('Gran AKI','Jorge Lopez', 'Jefe de Compras', 'Av Domingo Comin', 'Guayaquil', 'Costa', '090101', 'Ecuador', '0999405075', 2346543);
INSERT INTO clientes (Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax)
VALUES('El Coral', 'Guillermo Baltan', 'Gerente general', 'Av. Pdte. Carlos Julio Arosemena', 'Guayaquil', 'Costa', '090101', 'Ecuador', '0986329988', 6421976);
INSERT INTO clientes (Nombre_Compania, Nombre_Contacto, Cargo_Contacto, Direccion, Ciudad, Region, CodPostal, Pais, Telefono, Fax)
VALUES('Supermaxi','Gabriel Salvador','Gerente General','Av. Agustín Freire', 'Guayaquil', 'Costa', '090101', 'Ecuador', '0924824721', 345166);

select * from clientes

/*----------------------- TABLA EMPLEADOS -----------------------*/

drop table empleados

create table empleados(
	id_empleado serial not null,
	Apellidos character varying(20) not null,
	Nombre character varying(20) not null,
	Cargo character varying(20) not null,
	Fecha_Nacimiento date not null,
	Fecha_Contratacion date not null,
	Direccion character varying(25) not null,
	Ciudad character varying(20) not null,
	Region character varying(20) not null,
	CodPostal character varying(8) not null,
	Pais character varying(20) not null,
	Tel_Domicilio integer not null,
	Extension character varying(6) not null,
	Notas character varying(30) not null,
	Jefe character varying(30) not null,
	
	CONSTRAINT pk_idempleado PRIMARY KEY (id_empleado)
);

INSERT INTO empleados (Apellidos, Nombre, Cargo, Fecha_Nacimiento, Fecha_Contratacion, Direccion, Ciudad, Region, CodPostal, Pais, Tel_Domicilio, Extension, Notas, Jefe)
VALUES('Aviles','Nayeli','Recepcionista','09-07-2003', '01-11-2022', 'Valdivias', 'Guayaquil', 'Costa', 090101, 'Ecuador', '254512', '042', 'Es una buena trabajadora', 'John Smith');
INSERT INTO empleados (Apellidos, Nombre, Cargo, Fecha_Nacimiento, Fecha_Contratacion, Direccion, Ciudad, Region, CodPostal, Pais, Tel_Domicilio, Extension, Notas, Jefe)
VALUES('López','Ana', 'Asistente','1990-02-15', '2019-05-01', 'Calle Junín', 'Quito', 'Sierra', 170102, 'Ecuador', '466211', '02', 'Excelente trabajadora', 'José Pérez');
INSERT INTO empleados (Apellidos, Nombre, Cargo, Fecha_Nacimiento, Fecha_Contratacion, Direccion, Ciudad, Region, CodPostal, Pais, Tel_Domicilio, Extension, Notas, Jefe)
VALUES('Pérez', 'José', 'Gerente de Ventas', '1980-07-20', '2010-01-01', 'Gomes Rendon', 'Guayaquil', 'Costa', 090101, 'Ecuador', '425678', '042', 'Muy buen líder', 'German Barcos');
INSERT INTO empleados (Apellidos, Nombre, Cargo, Fecha_Nacimiento, Fecha_Contratacion, Direccion, Ciudad, Region, CodPostal, Pais, Tel_Domicilio, Extension, Notas, Jefe)
VALUES('García', 'Luis', 'Vendedor', '1995-11-30', '2020-10-01', 'Av. Domingo Comin', 'Guayaquil', 'Costa', 090101, 'Ecuador', '242268', '042', 'Se adapta rápido', 'José Pérez');
INSERT INTO empleados (Apellidos, Nombre, Cargo, Fecha_Nacimiento, Fecha_Contratacion, Direccion, Ciudad, Region, CodPostal, Pais, Tel_Domicilio, Extension, Notas, Jefe)
VALUES('Rodríguez', 'Sofia', 'Secretaria', '1988-04-10', '2012-06-01', 'Calle la Viictoria 2', 'Pichinca', 'Sierra', 170308, 'Ecuador', '249876', '02', 'Excelente atención al cliente', 'José Pérez');

select * from empleados

/*----------------------- TABLA PEDIDOS -----------------------*/
create table pedidos(
	id_pedido serial not null,
	cod_idcliente integer not null,
	cod_idempleado integer not null,
	Fecha_Pedido date not null,
	Fecha_Entrega date not null,
	Fecha_Envio date not null,
	Forma_Envio character varying(30) not null,
	Cargo character varying(30) not null,
	Destinatario character varying(30) not null,
	Direccion_Destinataro character varying(40) not null,
	Ciudad_Destinatario character varying(20) not null,
	Region_Destinatario character varying(20) not null,
	Cod_Postal_Destinatario character varying(8) not null,
	Pais_Destinatario character varying(20) not null,
	
	CONSTRAINT pk_idpedido PRIMARY KEY (id_pedido),
	CONSTRAINT fk_idcliente FOREIGN KEY (cod_idcliente) REFERENCES clientes(id_cliente),
	CONSTRAINT fk_idempleado FOREIGN KEY (cod_idempleado) REFERENCES empleados(id_empleado)
);

INSERT INTO pedidos (cod_idcliente, cod_idempleado, Fecha_Pedido, Fecha_Entrega, Fecha_Envio, Forma_Envio, Cargo, Destinatario, Direccion_Destinataro, Ciudad_Destinatario, Region_Destinatario, Cod_Postal_Destinatario, Pais_Destinatario)
VALUES (1, 2, '2022-05-15', '2022-05-20', '2022-05-18', 'Express', 'Electrónicos', 'Juan Pérez', '9 de Octubre Este', 'Quito', 'Costa', '091101', 'Ecuador');
INSERT INTO pedidos (cod_idcliente, cod_idempleado, Fecha_Pedido, Fecha_Entrega, Fecha_Envio, Forma_Envio, Cargo, Destinatario, Direccion_Destinataro, Ciudad_Destinatario, Region_Destinatario, Cod_Postal_Destinatario, Pais_Destinatario)
VALUES (2, 1, '2022-06-01', '2022-06-07', '2022-06-05', 'Estándar', 'Viveres', 'María Gómez', 'Av Las Aguas', 'Guayaquil', 'Costa', '090101', 'Ecuador');
INSERT INTO pedidos (cod_idcliente, cod_idempleado, Fecha_Pedido, Fecha_Entrega, Fecha_Envio, Forma_Envio, Cargo, Destinatario, Direccion_Destinataro, Ciudad_Destinatario, Region_Destinatario, Cod_Postal_Destinatario, Pais_Destinatario)
VALUES (4, 3, '2022-06-15', '2022-06-25', '2022-06-20', 'Express', 'Cocina', 'Pedro Torres', 'Av. Pano', 'Tena', 'Oriente', '174534', 'Ecuador');
INSERT INTO pedidos ( cod_idcliente, cod_idempleado, Fecha_Pedido, Fecha_Entrega, Fecha_Envio, Forma_Envio, Cargo, Destinatario, Direccion_Destinataro, Ciudad_Destinatario, Region_Destinatario, Cod_Postal_Destinatario, Pais_Destinatario)
VALUES (5,4,'12-02-2023','05-03-2023','14-06-2023','Envio a domicilio','Camara Web','Mucho lote 1','Av.Frsco Orellana','Guayaquil','Costa','090101','Ecuador');
INSERT INTO pedidos ( cod_idcliente, cod_idempleado, Fecha_Pedido, Fecha_Entrega, Fecha_Envio, Forma_Envio, Cargo, Destinatario, Direccion_Destinataro, Ciudad_Destinatario, Region_Destinatario, Cod_Postal_Destinatario, Pais_Destinatario)
VALUES (3, 5 , '07-03-2023 ', '08-03-2023', '09-03-2023', 'Envio a domicilio','Yogures', 'Nayeli', 'Valdivias', 'Guayaquil', 'Costa', '090108', 'Ecuador');

select * from pedidos

/*----------------------- TABLA DETALLES DE PEDIDO -----------------------*/

create table detalles_Pedidos(
	id_detallePedido serial not null,
	cod_idpedido integer not null,
	cod_idproducto integer not null,
	Precio_Unidad real not null,
	Cantidad integer not null,
	Descuento real not null,
	
	CONSTRAINT pk_iddetallePedido PRIMARY KEY (id_detallePedido),
	CONSTRAINT fk_idpedido FOREIGN KEY (cod_idpedido) REFERENCES pedidos(id_pedido),
	CONSTRAINT fk_idproducto FOREIGN KEY (cod_idproducto) REFERENCES productos(id_producto)
);

INSERT INTO detalles_Pedidos(cod_idpedido, cod_idproducto, Precio_Unidad, Cantidad, Descuento)
VALUES(1, 5, 297.99, 2, 9.99);
INSERT INTO detalles_Pedidos(cod_idpedido, cod_idproducto, Precio_Unidad, Cantidad, Descuento)
VALUES(2, 4, 2.60, 15, 0.25);
INSERT INTO detalles_Pedidos(cod_idpedido, cod_idproducto, Precio_Unidad, Cantidad, Descuento)
VALUES(4, 3, 1.25, 13, 0.15);
INSERT INTO detalles_Pedidos(cod_idpedido, cod_idproducto, Precio_Unidad, Cantidad, Descuento)
VALUES(5, 2, 1.25, 10, 0.15);
INSERT INTO detalles_Pedidos(cod_idpedido, cod_idproducto, Precio_Unidad, Cantidad, Descuento)
VALUES(3, 1, 2.75, 15, 0.27);

select * from detalles_Pedidos

/*----------------------- TABLA COMPAÑIAS DE ENVIOS -----------------------*/

create table companiaEnvios (
	id_companiaEnvios serial not null,
	Nombre_Compania character varying(30) not null,
	Telefono character varying(10) not null,
	
	CONSTRAINT pk_idcompaniaEnvios PRIMARY KEY (id_companiaEnvios)
);

INSERT INTO companiaEnvios(Nombre_Compania, Telefono)
VALUES('Servientrega', '0985524299');
INSERT INTO companiaEnvios(Nombre_Compania, Telefono)
VALUES('EcuaEntregaService S.A', '0967728960');
INSERT INTO companiaEnvios(Nombre_Compania, Telefono)
VALUES('Multientrega S.A', '04-2130510');

select * from companiaEnvios;


/****************Sentencias*************************/
/*Obtener por productos la suma del precio de cada unidad*/

select "nombre_producto", sum("precio_unidad")
from "productos"
Group by "nombre_producto"

/*Mostrar los  nombres  y apellidos de la tabla empleados 
ordenados de manera ascendente*/

select "apellidos","nombre"
from empleados 
order by apellidos,nombre ASC

/*Presentar por medio del inner join las tablas de detalles pedidos y la tabla de pedidos*/
Select id_detallepedido,id_pedido
from detalles_pedidos
Inner Join  pedidos
On detalles_pedidos.id_detallepedido = pedidos.id_pedido

/*Mostrar  la informacion con el encabezado "nombre_contacto" por el campo 
"nombre" y el encabezado "cargo_contacto" por el campo"cargo"*/

Select nombre_contacto as Nombre,
       cargo_contacto as cargo 
from clientes

/*Presentar las tablas donde el nombre de la compañía de envío, el nombre del contacto de
proveedores y el país de los proveedores  contengan un numero de telefono que 
comienze por el 09*/

Select ce.nombre_compania,p.nombre_contacto,p.pais 
from companiaenvios ce
Inner Join proveedores p on ce.id_companiaenvios = p.id_proveedor
Where p.telefono Like '09%' ;


/*Presentar el grupo de destinatario y la fecha de entrega
de los pedidos de cada cliente  usando el inner join y odernandolos
de manera descendentes*/

SELECT  Destinatario, pedidos.Fecha_entrega
FROM pedidos
INNER JOIN clientes ON pedidos.cod_idcliente = clientes.id_cliente
ORDER BY pedidos.Fecha_entrega desc;

/*Realizar una subconsulta de  los productos que contengan un 
precio menor a $2.00 y que se relacione a la categoría "Aceites"*/

SELECT * FROM productos
WHERE precio_unidad < 2.00
AND cod_idcategoria = (SELECT cod_idcategoria FROM categorias WHERE
nombre_categoria = 'Aceites');

/*Presentar el nombre de la compañia que comienze por la letra L*/

SELECT nombre_compania FROM proveedores
WHERE nombre_compania LIKE '%L%';

/*Presentar todos los nombres de las categorias y su respectiva 
cantidad de producto que tiene dicha categoria*/ 

SELECT nombre_categoria, (SELECT COUNT(*) FROM productos
WHERE productos.cod_idcategoria = categorias.id_categoria) AS num_productos
FROM categorias;

/*Obtener el nombre de cada proveedor que tienen al menos de un producto
en la tabla productos.*/

SELECT nombre_compania
FROM proveedores
WHERE EXISTS (SELECT * FROM productos WHERE productos.cod_idproveedor =
proveedores.id_proveedor);


