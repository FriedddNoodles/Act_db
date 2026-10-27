USE BibliotecaUES
GO

---------------------------------------------------------
-- 1. CATÁLOGOS / DICCIONARIOS (Sin dependencias)
---------------------------------------------------------

-- Programas Educativos (Carreras)
INSERT INTO Programas_Educativos (Nombre_programa) VALUES 
('Ingeniería en Software'),
('Ingeniería Industrial En Manofactura'),
('Licenciatura en Administración'),
('Enfermería');

-- Métodos de Préstamo
INSERT INTO Metodos_prestamo (Metodo) VALUES 
('Credencial'),
('Identificacion'),
('Horario');

-- Departamentos
INSERT INTO Departamentos (Nombre) VALUES 
('Bibliotecario Operativo'),
('Procesos Internos'),
('Administración')

---------------------------------------------------------
-- 2. ENTIDADES PRINCIPALES (Con dependencias de catálogos)
---------------------------------------------------------

-- Alumnos (Matricula de 11 dígitos numéricos)
INSERT INTO Alumno (Matricula, Nombre, Carrera) VALUES 
('21921001234', 'Carlos Alberto Ruiz', 1),
('22031005678', 'María Fernanda Gómez', 2),
('21811009012', 'José Luis Hernández', 3),
('22141003456', 'Ana Sofía Martínez', 4);

-- Empleados (RFC de 13 alfanuméricos, Num_contacto de 10 dígitos)
INSERT INTO Empleados (Nombre, RFC, Num_contacto, Departamento) VALUES 
('Roberto Sánchez Pérez', 'SAPR850112HSR', '6621234567', 1),
('Laura Elena Torres', 'TOEL900524MSR', '6629876543', 2);

-- Series (Colecciones de libros)
INSERT INTO Series (Titulo, CDD, Descripcion, Editorial) VALUES 
('Biblioteca de Ingeniería de Software', 005, 'Colección enfocada en desarrollo y arquitectura.', 'Pearson'),
('Colección Ciencias Económico Administrativas', 330, 'Libros de economía, finanzas y administración.', 'McGraw-Hill');

---------------------------------------------------------
-- 3. LIBROS (Dependen de Series)
---------------------------------------------------------

INSERT INTO Libros (Titulo, Autor, Sinopsis, ISBN, CDD, Edicion, Editorial, Origen, Fecha_publicacion, Mencion_serie, Extension_paginas, Alto, Ancho, Descripcion_fisica, Coautor, Disponibilidad) VALUES 
('Clean Code: A Handbook of Agile Software Craftsmanship', 'Robert C. Martin', 'Guía de buenas prácticas para escribir código legible y mantenible.', 132350882, 005, '1ra', 'Prentice Hall', 'Nacional', '2008-08-01', 1, '464', 23.50, 17.50, 'Libro impreso con pasta blanda', NULL, 'Disponible'),
('Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma', 'Catálogo de patrones de diseño de software.', 201633612, 005, '1ra', 'Addison-Wesley', 'Internacional', '1994-10-31', 1, '395', 24.00, 18.00, 'Pasta dura', 'Richard Helm', 'Disponible'),
('Administración de Empresas', 'Idalberto Chiavenato', 'Fundamentos generales de la administración moderna.', 970107005, 330, '8va', 'McGraw-Hill', 'Nacional', '2014-02-15', 2, '672', 27.00, 21.00, 'Pasta blanda', NULL, 'Disponible');

---------------------------------------------------------
-- 4. CUBÍCULOS Y DESGLOSES (Espacios)
---------------------------------------------------------

-- Registro diario de cubículos
INSERT INTO Cubiculo (Dia) VALUES 
('2026-06-06'),
('2026-06-06');

-- Desglose del uso de los cubículos a lo largo del día
INSERT INTO Desglose_cubiculo (Titular, Carrera, Horario_inicio, Horario_termino, Id_cubiculo) VALUES 
('Carlos Alberto Ruiz', 1, '09:00:00', '11:00:00', 1),
('María Fernanda Gómez', 2, '11:00:00', '13:00:00', 1),
('José Luis Hernández', 3, '10:00:00', '12:00:00', 2);

---------------------------------------------------------
-- 5. PRÉSTAMOS Y DESGLOSE DE LIBROS
---------------------------------------------------------

-- Primero creamos los registros de desglose de libros (de 1 a 3 libros por préstamo)
INSERT INTO Desglose_prestamo (Libro1, Libro2, Libro3) VALUES 
(1, 2, NULL), -- Préstamo con 2 libros
(3, NULL, NULL), -- Préstamo con 1 solo libro
(1, 2, 3); -- Préstamo con el máximo de 3 libros

-- Después registramos los préstamos generales (el Id_prestamo se relaciona de manera lógica con el desglose)
INSERT INTO Prestamo (Fecha_prestamo, Limite_prestamo, Renovaciones, Matricula, Id_metodo, Responsable) VALUES 
('2026-06-01', '2026-06-08', 1, '21921001234', 1, 1),
('2026-06-02', '2026-06-09', 1, '22031005678', 2, 2),
('2026-06-03', '2026-06-10', 2, '21811009012', 1, 1);