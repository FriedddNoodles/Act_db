USE master
GO

--Condicional para actualizar la base de datos ante cualquier cambio--
IF exists (SELECT * FROM sysdatabases WHERE NAME = 'BibliotecaUES')
BEGIN
ALTER DATABASE BibliotecaUES SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE BibliotecaUES
END
GO

-----------------------------------------
--Creacion completa de la base de datos--
-----------------------------------------

CREATE DATABASE BibliotecaUES

ON PRIMARY 
(
NAME = 'BibliotecaUES_dat',
FILENAME = 'C:\MisBD\BibliotecaUES.mdf',
SIZE = 100mb,
MAXSIZE = 200mb,
FILEGROWTH = 0mb
)

LOG ON
(
NAME = 'BibliotecaUES_log',
FILENAME = 'C:\MisBD\BibliotecaUES.ldf',
SIZE = 50mb,
MAXSIZE = 100mb,
FILEGROWTH = 5%
)
GO

USE BibliotecaUES
GO

CREATE TABLE Cubiculo (
Id_cubiculo int PRIMARY KEY CHECK (Id_cubiculo > 0) IDENTITY (1,1),
Dia date NOT NULL

--Notas de la tabla
--Cubiculo representa el registro diario de un cubiculo en la biblioteca
--NO REPRESENTA EL ESPACIO FISICO, se complementa con su tabla hermana, la cual se crea a continuacion

)


CREATE TABLE Desglose_cubiculo(
Id_desglose int PRIMARY KEY CHECK (Id_desglose > 0) IDENTITY (1,1),
Titular varchar(100) NOT NULL,
Carrera int NOT NULL,
Horario_inicio time NOT NULL,
Horario_termino time NOT NULL,
Id_cubiculo int NOT NULL

CONSTRAINT FK_DesgloseCubiculo_Cubiculo FOREIGN KEY (Id_cubiculo) REFERENCES Cubiculo(Id_cubiculo) ON DELETE CASCADE

--Notas de la tabla
--Desglose contiene toda la informacion necesaria para apartar y usar un cubiculo
--Contiene una FK con Cubiculo porque un cubiculo en una fecha puede tener diferentes desgloses en el dia
--Esto debido a que los cubiculos se usan por diferentes personas durante el dia

)

CREATE TABLE Programas_Educativos(
Id_programa tinyint PRIMARY KEY IDENTITY (1,1),
Nombre_programa varchar(100)

--Notas sobre la tabla
--Esta es una tablade diccionario, contiene los nombres de todos los programas educativos de la universidad
--La carreras, pues. Esto para que cuando un alumno quiera pedir un prestamo, puedan referenciar directamente a la carrera al registrarlo

)

CREATE TABLE Alumno (
Matricula char(11) PRIMARY KEY CHECK (Matricula LIKE REPLICATE ('[0-9]',11)),
Nombre varchar(150) NOT NULL,
Carrera tinyint NOT NULL

CONSTRAINT FK_Alumno_carrera FOREIGN KEY (Carrera) REFERENCES Programas_educativos(Id_programa)

--Notas de la tabla
--Matricula usa un check con la funcion replicate para poder aceptar unicamente numeros (como esta construida la matricula)
--Hay una FK con Programas educativos, aqui se usa el diccionario que mencione antes, jeje
)

CREATE TABLE Metodos_prestamo(
Id_metodo tinyint PRIMARY KEY CHECK (Id_metodo>0) IDENTITY (1,1),
Metodo varchar(50) NOT NULL

--Notas de la tabla
--Parecido a la tabla de programas educativos, esta solo sirve como diccionario para los metodos de prestamo
)

CREATE TABLE Departamentos (
Id_departamento tinyint PRIMARY KEY IDENTITY (1,1),
Nombre varchar(50) NOT NULL

--Notas de la tabla
--Al igual que viene siendo costumbre, esta tabla sirve como diccionario para otra, en este caso, para empleado
--Contiene los diferentes roles que pueden tener los miembros de la biblioteca, por ahora no nos meteremos con cosas de sueldo
)

CREATE TABLE Empleados(
Id_empleado smallint PRIMARY KEY IDENTITY (1,1),
Nombre varchar(100) NOT NULL,
RFC char(13) NOT NULL CHECK (RFC LIKE REPLICATE ('[A-Z0-9]',13)),
Num_contacto char(10) NOT NULL CHECK (Num_contacto LIKE REPLICATE ('[0-9]',10)),
Departamento tinyint NOT NULL

CONSTRAINT FK_Empleados_departamentos FOREIGN KEY (Departamento) REFERENCES Departamentos(Id_departamento)

--Notas de la tabla
--Esta tabla representa la informacion base del empleado, ya que este ademas de ejercer su cargo operativo se involucra con los prestamos
--Por el momento no nos meteremos con cosas de sueldos x2

)

CREATE TABLE Prestamo(
Id_prestamo int PRIMARY KEY IDENTITY (1,1),
Fecha_prestamo date NOT NULL,
Limite_prestamo date NOT NULL,
Renovaciones tinyint NOT NULL CHECK (Renovaciones>0 AND Renovaciones<3),
Matricula char(11) NOT NULL,
Id_metodo tinyint NOT NULL,
Responsable smallint NOT NULL

CONSTRAINT FK_Prestamo_alumno FOREIGN KEY (Matricula) REFERENCES Alumno(Matricula),
CONSTRAINT FK_Prestamo_metodo FOREIGN KEY (Id_metodo) REFERENCES Metodos_prestamo(Id_metodo),
CONSTRAINT FK_Prestamo_empleado FOREIGN KEY (Responsable) REFERENCES Empleados(Id_empleado)

--Notas de la tabla
--Esta tabla representa a la entidad general de prestamo, contiene fechas de inicio, termino, renovaciones y todas essas cosas
--Referencia a tablas como alumno, metodos de prestamo y responsable, el cual viene a ser empleado
--Al momento en que escribo esto no he escrito el constraint de empleado, asi que dejare esto como nota para hacerlo luego
--Ya lo escribi
)

create table Series (
    Id_serie int PRIMARY KEY IDENTITY (1,1),
    Titulo varchar(200),
    CDD int,
    Descripcion varchar(1000),
    Editorial varchar(100)

    --Notas de la tabla
    --Esta tala es una tabla que representa las distintas colecciones a las que pueden pertenecer ciertos libros
    --Fue hecha mas por formato que por otra cosa
)

CREATE TABLE Libros (
    Codigo_registro int PRIMARY KEY IDENTITY (1,1),
    Titulo varchar(200),
    Autor varchar(150),
    Sinopsis varchar(1000),
    ISBN int,
    CDD int,
    Edicion char(10),
    Editorial varchar(100),
    Origen varchar(100),
    Fecha_publicacion date,
    Mencion_serie int,
    Extension_paginas varchar(10),
    Alto decimal(10,2),
    Ancho decimal(10,2),
    Descripcion_fisica varchar(500),
    Coautor varchar(150),
    Disponibilidad varchar(40)

    CONSTRAINT FK_Libros_series FOREIGN KEY (Mencion_serie) REFERENCES Series (Id_serie)

    --Notas de la tabla
    --Esta tabla representa a la entidad de libros, y es la mas grande de la base de datos, fun fact.
    --Nos basamos en el formato marc que usa la biblioteca real de la universidad para registrar los libros y asi definir los atributos de la entidad
    --Tiene un constraint con serie, el cual es una tabl que aun no creo jaja, otro recordatorio
)

CREATE TABLE Desglose_prestamo(
Id_desglose int PRIMARY KEY IDENTITY (1,1),
Libro1 int NOT NULL,
Libro2 int,
Libro3 int,

CONSTRAINT Comprobacion_libros CHECK ((Libro2 IS NULL OR Libro1 <> Libro2) AND (Libro3 IS NULL OR Libro1 <> Libro3) AND (Libro2 IS NULL OR Libro3 IS NULL OR Libro2 <> Libro3)),
CONSTRAINT FK_Libro1 FOREIGN KEY (Libro1) REFERENCES Libros (Codigo_registro),
CONSTRAINT FK_Libro2 FOREIGN KEY (Libro2) REFERENCES Libros (Codigo_registro),
CONSTRAINT FK_Libro3 FOREIGN KEY (Libro3) REFERENCES Libros (Codigo_registro)

--Notas de la tabla
--Esta tabla contiene el desglose de los prestamos de libros, unicamente de libros
--Contiene 3 campos de libros porque el limite fijo de prestamos es 3, y solo una es not null porque como minimo debes de llevarte uno, maximo 3
--Pudo modelarse mejor, pero esto safa
--Contiene constraints que referencian a la tabl libro y uno con check que se asegura que no se repitan
--En esta tabla hubo un error con el campo de libro3 que daba error, el problema era una coma
--gg
)

