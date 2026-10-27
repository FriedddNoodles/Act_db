USE master
GO

--Condicional para actualizar la base de datos ante cualquier cambio--
IF exists (SELECT * FROM sysdatabases WHERE NAME = 'CasaLeyV2')
BEGIN
ALTER DATABASE CasaLeyV2 SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE CasaLeyV2
END
GO

-----------------------------------------
--Creacion completa de la base de datos--
-----------------------------------------

CREATE DATABASE CasaLeyV2

ON PRIMARY 
(
NAME = 'CasaLeyV2_dat',
FILENAME = 'C:\MisBD\CasaLeyV2.mdf',
SIZE = 100mb,
MAXSIZE = 200mb,
FILEGROWTH = 0mb
)

LOG ON
(
NAME = 'CasaLeyV2_log',
FILENAME = 'C:\MisBD\CasaLeyV2.ldf',
SIZE = 50mb,
MAXSIZE = 100mb,
FILEGROWTH = 5%
)
GO

USE CasaLeyV2
GO


----------------------
--Creacion de tablas--
----------------------

CREATE TABLE Departamentos (
ID_departamento tinyint PRIMARY KEY IDENTITY (10,1) NOT NULL ,
Nombre_departamento varchar(100) NOT NULL UNIQUE,
Sueldo Money NOT NULL
)
--Creacion de la tabla de departamentos--
--La tabla de departamentos solo cuenta con el nombre del departamento y su sueldo fijo--
--La decision de dejar los sueldos fijos vienen de entrevistar a varias personas que trabajaron en CasaLey--

CREATE TABLE Empleados (
ID_empleado tinyint PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre varchar(100) NOT NULL,
Numero_telefono char(10) NOT NULL,
RFC char(13) NOT NULL UNIQUE,
ID_Departamento tinyint
CONSTRAINT FK_Empleados_Departamenos FOREIGN KEY (ID_departamento) REFERENCES Departamentos(ID_departamento)
CONSTRAINT Check_rfc CHECK (RFC NOT LIKE '%[A-Z0-9]%' AND LEN (RFC) = 13)
)

--Creacion de la tabla de Empleados--
--Contiene la informacion basica de todos los empleados y un constraint de FK con departamentos--

CREATE TABLE Proveedores (
ID_Proveedor tinyint PRIMARY KEY IDENTITY (20,1) NOT NULL,
Nombre_proveedor varchar(100) NOT NULL UNIQUE,
Num_telefono char(10) NOT NULL,
Direccion varchar(200) NOT NULL
)

--Creacion de la tabla de proveedores--
--Contiene la informacion basica de todos los proveedores, los productos se referencian en la tabla de catalogo--

CREATE TABLE Unidad_medida (
ID_unidad_medida tinyint PRIMARY KEY IDENTITY (30,1) NOT NULL,
Nombre_unidad_medida varchar(50) NOT NULL UNIQUE
)

--Creacion de la tabla de Unidades de medida--
--Contiene las unidades de medidas de los productos del catalogo--
--Este es un dato que se repite mucho, asi que hemos optado por aislarlo--

CREATE TABLE Catalogo (
ID_Catalogo smallint PRIMARY KEY IDENTITY (1000,1) NOT NULL,
Nombre_producto varchar(100) NOT NULL,
Stock int NOT NULL,
Precio money NOT NULL,
Cantidad_medida decimal NOT NULL,
ID_unidad_medida tinyint NOT NULL,
ID_proveedor tinyint NOT NULL

CONSTRAINT FK_Catalogo_unidades FOREIGN KEY (ID_unidad_medida) REFERENCES Unidad_medida(ID_unidad_medida),
CONSTRAINT FK_Catalogo_proveedor FOREIGN KEY (ID_proveedor) REFERENCES Proveedores (ID_proveedor)
)

--Creacion de la tabla de catalogo (productos)--
--Contiene toda la infrmacion basica de los productos (la parte mas importante del diseno)--
--Contiene 2 constraints, uno referencia a la tabla de unidades y otro a la de proveedores)--

CREATE TABLE Clientes(
ID_cliente int PRIMARY KEY IDENTITY(2000,1) NOT NULL,
Nombre varchar (100) NOT NULL,
Num_telefono char (10) NOT NULL,
Direccion varchar(200)
)

--Creacion de la tabla de clientes--
--esta tabla esta mas puesta por seguir el formato que por que quisieramos--
--Normalmente en este tipo de locales, las compras son anonimas--
--Sin embargo, existen las tarjetas de puntos, por lo que la informacion del cliente debe de poder guardarse--
--No sera obligatorio que a cada venta se le asocie un cliente--

CREATE TABLE Desgloses (
ID_desglose int PRIMARY KEY IDENTITY (5000,1) NOT NULL,
ID_catalogo smallint NOT NULL,
Cantidad tinyint NOT NULL

CONSTRAINT FK_desglose_catalogo FOREIGN KEY (ID_catalogo) REFERENCES Catalogo(ID_catalogo)
)

--Creacion de la tabla de desgloses--
--esta tabla contiene el desglose de cada compra--
--referencia al producto con un constraint de fk y contiene la cantidad de dicho producto--
--tal vez en una version posterio incluyamos precio unitario en esta tabla--


CREATE TABLE Venta(
ID_venta int PRIMARY KEY IDENTITY (3000,1) NOT NULL,
ID_desglose int NOT NULL,
Monto_total money NOT NULL,
Fecha date NOT NULL,
ID_empleado tinyint NOT NULL,
ID_cliente int

CONSTRAINT FK_venta_empleado FOREIGN KEY (ID_empleado) REFERENCES Empleados(ID_empleado),
CONSTRAINT FK_venta_cliente FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),
CONSTRAINT FK_venta_desglose FOREIGN KEY (ID_desglose) REFERENCES Desgloses(ID_desglose)

)

--Creacion de la tabla de ventas--
--Contiene la informacion general de cada venta--
--Contiene 3 FK: uno con la tabla de desgloses, otro con la de empleados y un ultimo con la de cliente--
--NO todos son obliatorios--

GO


