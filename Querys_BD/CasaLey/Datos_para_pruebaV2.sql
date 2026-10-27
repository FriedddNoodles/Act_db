
USE CasaLeyV2;
GO

-----------------
--DEPARTAMENTOS--
-----------------

INSERT INTO Departamentos (Nombre_departamento, Sueldo)
VALUES
('Cajas', 9500.00),
('Abarrotes', 10200.00),
('Carniceria', 11500.00),
('Frutas y verduras', 9800.00),
('Limpieza', 10000.00),
('Gerencia', 18000.00);

-------------
--EMPLEADOS--
-------------

INSERT INTO Empleados
(Nombre, Numero_telefono, RFC, ID_Departamento)
VALUES
('Carlos Mendoza', '6621234567', 'MECJ950315ABC', 10),
('Ana Lopez', '6622345678', 'LOAA010622DEF', 10),
('Roberto Garcia', '6623456789', 'GARR880412GHI', 11),
('Maria Torres', '6624567890', 'TOMM920725JKL', 11),
('Luis Hernandez', '6625678901', 'HEGL990118MNO', 12),
('Fernanda Ruiz', '6626789012', 'RURF030930PQR', 13),
('Jorge Castillo', '6627890123', 'CAJJ850506STU', 14),
('Sofia Ramirez', '6628901234', 'RARS000214VWX', 15),
('Miguel Flores', '6629012345', 'FOMM970831YZA', 10),
('Daniela Perez', '6620123456', 'PEDD041109BCD', 11),
('Eduardo Sanchez', '6621122334', 'SAEE910421EFG', 12),
('Patricia Morales', '6622233445', 'MOPP860712HIJ', 15);

---------------
--PROVEEDORES--
---------------

INSERT INTO Proveedores
(Nombre_proveedor, Num_telefono, Direccion)
VALUES
('Distribuidora del Norte', '6621111111', 'Centro, Hermosillo'),
('Alimentos del Pacifico', '6622222222', 'Parque Industrial, Hermosillo'),
('Carnes Selectas', '6623333333', 'San Benito, Hermosillo'),
('AgroSonora', '6624444444', 'Salida a Guaymas, Hermosillo'),
('Limpieza Industrial MX', '6625555555', 'Zona Industrial, Hermosillo'),
('Bebidas del Desierto', '6626666666', 'Colonia Modelo, Hermosillo');

----------------------
--UNIDADES DE MEDIDA--
----------------------

INSERT INTO Unidad_medida (Nombre_unidad_medida)
VALUES
('Pieza'),
('Kilogramo'),
('Litro'),
('Paquete'),
('Caja'),
('Gramo');

------------------------
--CATALOGO (Productos)--
------------------------

INSERT INTO Catalogo
(Nombre_producto, Stock, Precio, Cantidad_medida,
 ID_unidad_medida, ID_proveedor)
VALUES
('Arroz', 120, 32.50, 1, 31, 20),
('Frijol', 85, 38.00, 1, 31, 20),
('Azucar', 100, 29.90, 1, 31, 20),
('Aceite vegetal', 60, 42.50, 1, 32, 21),
('Leche entera', 90, 28.00, 1, 32, 21),
('Pasta para sopa', 150, 12.50, 1, 33, 20),
('Pollo', 45, 89.00, 1, 31, 22),
('Carne de res', 30, 185.00, 1, 31, 22),
('Carne molida', 35, 145.00, 1, 31, 22),
('Manzana', 70, 42.00, 1, 31, 23),
('Platano', 65, 25.00, 1, 31, 23),
('Tomate', 80, 32.00, 1, 31, 23),
('Detergente', 55, 48.50, 1, 30, 24),
('Cloro', 75, 22.00, 1, 32, 24),
('Jabon de trastes', 50, 19.50, 1, 30, 24),
('Agua embotellada', 200, 15.00, 1, 30, 25),
('Refresco', 110, 24.00, 1, 30, 25),
('Galletas', 95, 18.50, 1, 33, 21),
('Cafe', 40, 76.00, 1, 33, 20),
('Huevo', 60, 58.00, 1, 34, 21);

------------
--CLIENTES--
------------

INSERT INTO Clientes (Nombre, Num_telefono, Direccion)
VALUES
('Alejandro Vega', '6621000001', 'Centro'),
('Laura Jimenez', '6621000002', 'Las Quintas'),
('Pedro Navarro', '6621000003', 'Pueblitos'),
('Gabriela Soto', '6621000004', 'Villa de Seris'),
('Ricardo Acosta', '6621000005', 'San Benito'),
('Monica Valenzuela', '6621000006', 'Modelo'),
('Fernando Ortega', '6621000007', 'Solidaridad'),
('Karla Dominguez', '6621000008', 'Pitic'),
('Andres Molina', '6621000009', 'Nuevo Hermosillo'),
('Diana Chavez', '6621000010', 'Altares'),
('Oscar Beltran', '6621000011', 'Olivares'),
('Natalia Campos', '6621000012', 'Ley 57');

-----------------------------------------------------
--VENTAS---------------------------------------------
--Monto_total corresponde a la suma de sus detalles--
-----------------------------------------------------

INSERT INTO Venta
(Monto_total, Fecha, ID_empleado, ID_cliente)
VALUES
(143.00,  '2026-10-01', 1, 2000),  -- 3000
(143.90,  '2026-10-01', 2, 2001),  -- 3001
(135.00,  '2026-10-02', 3, NULL),  -- 3002
(242.00,  '2026-10-03', 5, 2003),  -- 3003
(330.00,  '2026-10-04', 11, 2004), -- 3004
(218.00,  '2026-10-05', 6, 2005),  -- 3005
(131.50,  '2026-10-06', 8, NULL),  -- 3006
(162.00,  '2026-10-07', 9, 2006),  -- 3007
(150.00,  '2026-10-08', 4, NULL),  -- 3008
(172.00,  '2026-10-09', 10, 2007), -- 3009
(238.50,  '2026-10-10', 1, 2008),  -- 3010
(281.00,  '2026-10-11', 2, NULL);  -- 3011

--------------------------------------------------
--DESGLOSES---------------------------------------
--ID_venta referencia a la venta correspondiente--
--------------------------------------------------

INSERT INTO Desgloses
(ID_venta, ID_catalogo, Cantidad, Precio_unitario)
VALUES
-- Venta 3000: arroz, leche y platano = 143.00
(3000, 1000, 2, 32.50),
(3000, 1004, 1, 28.00),
(3000, 1010, 2, 25.00),

-- Venta 3001: frijol y azucar = 143.90
(3001, 1001, 3, 38.00),
(3001, 1002, 1, 29.90),

-- Venta 3002: aceite y pasta = 135.00
(3002, 1003, 2, 42.50),
(3002, 1005, 4, 12.50),

-- Venta 3003: pollo y tomate = 242.00
(3003, 1006, 2, 89.00),
(3003, 1011, 2, 32.00),

-- Venta 3004: res y carne molida = 330.00
(3004, 1007, 1, 185.00),
(3004, 1008, 1, 145.00),

-- Venta 3005: manzanas y platanos = 218.00
(3005, 1009, 4, 42.00),
(3005, 1010, 2, 25.00),

-- Venta 3006: productos de limpieza = 131.50
(3006, 1012, 1, 48.50),
(3006, 1013, 2, 22.00),
(3006, 1014, 2, 19.50),

-- Venta 3007: agua y refrescos = 162.00
(3007, 1015, 6, 15.00),
(3007, 1016, 3, 24.00),

-- Venta 3008: galletas y cafe = 150.00
(3008, 1017, 4, 18.50),
(3008, 1018, 1, 76.00),

-- Venta 3009: huevos y leche = 172.00
(3009, 1019, 2, 58.00),
(3009, 1004, 2, 28.00),

-- Venta 3010: arroz y frijol = 238.50
(3010, 1000, 5, 32.50),
(3010, 1001, 2, 38.00),

-- Venta 3011: pollo y refrescos = 281.00
(3011, 1006, 1, 89.00),
(3011, 1016, 8, 24.00);

GO
