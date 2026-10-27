USE CasaLey
GO


USE CasaLey;
GO


-- 1. DEPARTAMENTOS

INSERT INTO Departamentos
    (Nombre_departamento, Sueldo)
VALUES
    ('Direccion', 18000.00),
    ('Administracion', 14500.00),
    ('Recursos Humanos', 12500.00),
    ('Cajas', 9500.00),
    ('Abarrotes', 10000.00),
    ('Carniceria', 11500.00),
    ('Frutas y Verduras', 9800.00),
    ('Panaderia', 10500.00),
    ('Almacen', 10200.00),
    ('Limpieza', 9000.00);
GO

-- 2. PROVEEDORES

INSERT INTO Proveedores
    (Nombre_proveedor, Num_telefono, Direccion)
VALUES
    ('Distribuidora del Noroeste', '6621234501',
     'Blvd. Solidaridad 120, Hermosillo'),
    ('Alimentos del Pacifico', '6621234502',
     'Calle Reforma 245, Hermosillo'),
    ('Lacteos del Valle', '6621234503',
     'Carretera a Ures km 8, Hermosillo'),
    ('Bebidas Sonorenses', '6621234504',
     'Blvd. Garcia Morales 500, Hermosillo'),
    ('Carnes Selectas del Norte', '6621234505',
     'Calle Ganaderos 32, Hermosillo'),
    ('Frutas y Verduras La Huerta', '6621234506',
     'Mercado de Abastos, Hermosillo'),
    ('Panificadora La Espiga', '6621234507',
     'Av. Veracruz 88, Hermosillo'),
    ('Limpieza Industrial del Yaqui', '6621234508',
     'Blvd. Quiroga 150, Hermosillo'),
    ('Granos y Semillas del Desierto', '6621234509',
     'Calle del Maiz 45, Hermosillo'),
    ('Embotelladora Regional', '6621234510',
     'Parque Industrial, Hermosillo'),
    ('Congelados del Norte', '6621234511',
     'Calle Frio 17, Hermosillo'),
    ('Dulces y Chocolates del Sol', '6621234512',
     'Av. Cultura 220, Hermosillo'),
    ('Papel y Desechables del Pacifico', '6621234513',
     'Calle Papelera 60, Hermosillo'),
    ('Abarrotes La Frontera', '6621234514',
     'Blvd. Progreso 310, Hermosillo'),
    ('Productos de Higiene del Norte', '6621234515',
     'Av. Solidaridad 725, Hermosillo');
GO


-- 3. UNIDADES DE MEDIDA

INSERT INTO Unidad_medida
    (Nombre_unidad_medida)
VALUES
    ('Pieza'),
    ('Kilogramo'),
    ('Gramo'),
    ('Litro'),
    ('Mililitro'),
    ('Paquete'),
    ('Caja'),
    ('Botella'),
    ('Bolsa'),
    ('Lata');
GO

-- 4. EMPLEADOS


INSERT INTO Empleados
    (Nombre, Numero_telefono, RFC, ID_Departamento)
VALUES
    ('Roberto Salazar Vega', '6622000001', 'SAVR850101AB1', 10),
    ('Mariana Lopez Castro', '6622000002', 'LOCM900215CD2', 11),
    ('Carlos Mendoza Ruiz', '6622000003', 'MERC880320EF3', 12),
    ('Daniela Torres Leon', '6622000004', 'TOLD950412GH4', 13),
    ('Jorge Ramirez Soto', '6622000005', 'RASJ920605JK5', 13),
    ('Fernanda Ruiz Acosta', '6622000006', 'RUAF990718LM6', 14),
    ('Luis Alberto Navarro', '6622000007', 'NALU870923NP7', 14),
    ('Karla Gutierrez Mora', '6622000008', 'GUMK010114QR8', 14),
    ('Miguel Angel Flores', '6622000009', 'FOMM930226ST9', 15),
    ('Andrea Valenzuela Cruz', '6622000010', 'VACA960309UV1', 15),
    ('Oscar Hernandez Diaz', '6622000011', 'HEDO890421WX2', 16),
    ('Patricia Moreno Gil', '6622000012', 'MOGP940512YZ3', 16),
    ('Ricardo Cardenas Soto', '6622000013', 'CASR910623AB4', 17),
    ('Sofia Castillo Rios', '6622000014', 'CARS000734CD5', 17),
    ('Eduardo Pineda Luna', '6622000015', 'PILE860815EF6', 18),
    ('Valeria Acosta Reyes', '6622000016', 'AORV980926GH7', 18),
    ('Francisco Ochoa Ruiz', '6622000017', 'OORF900107JK8', 19),
    ('Gabriela Ibarra Soto', '6622000018', 'IASG970218LM9', 19),
    ('Hector Dominguez Paz', '6622000019', 'DOPH850329NP1', 19),
    ('Monica Beltran Vega', '6622000020', 'BEVM920430QR2', 19);
GO

-- 5. CATALOGO DE PRODUCTOS

INSERT INTO Catalogo
    (Nombre_producto, Stock, Precio, Cantidad_medida,
     ID_unidad_medida, ID_proveedor)
VALUES
    ('Arroz blanco', 120, 32.50, 1000, 32, 28),
    ('Frijol pinto', 90, 38.00, 1000, 32, 28),
    ('Azucar refinada', 100, 29.90, 1000, 32, 28),
    ('Harina de trigo', 80, 24.50, 1000, 32, 34),
    ('Aceite vegetal', 75, 42.00, 1000, 33, 20),
    ('Leche entera', 100, 28.50, 1000, 33, 22),
    ('Yogur natural', 60, 19.00, 500, 33, 22),
    ('Queso fresco', 35, 95.00, 1000, 31, 22),
    ('Agua embotellada', 200, 12.00, 1000, 37, 23),
    ('Refresco de cola', 150, 21.50, 2000, 33, 29),
    ('Jugo de naranja', 70, 25.00, 1000, 33, 29),
    ('Cafe molido', 45, 68.00, 250, 35, 33),
    ('Pasta para sopa', 110, 14.50, 200, 35, 20),
    ('Atun en lata', 95, 19.90, 140, 39, 33),
    ('Galletas de vainilla', 85, 18.00, 250, 35, 31),
    ('Chocolate en barra', 60, 22.00, 100, 30, 31),
    ('Pan de caja', 50, 45.00, 680, 35, 26),
    ('Huevo blanco', 80, 58.00, 30, 36, 24),
    ('Manzana roja', 65, 42.00, 1000, 31, 25),
    ('Platano', 75, 26.00, 1000, 31, 25),
    ('Tomate', 90, 32.00, 1000, 31, 25),
    ('Cebolla blanca', 85, 28.00, 1000, 31, 25),
    ('Papa blanca', 100, 30.00, 1000, 31, 25),
    ('Pollo entero', 40, 68.00, 1000, 31, 24),
    ('Carne molida', 35, 145.00, 1000, 31, 24),
    ('Detergente en polvo', 55, 48.00, 1000, 38, 27),
    ('Cloro', 70, 22.50, 1000, 33, 27),
    ('Jabon de tocador', 120, 16.00, 150, 30, 34),
    ('Papel higienico', 90, 39.00, 4, 35, 32),
    ('Servilletas', 100, 18.50, 250, 35, 32);
GO


-- 6. CLIENTES

INSERT INTO Clientes
    (Nombre, Num_telefono, Direccion)
VALUES
    ('Alejandro Chavez Ruiz', '6623000001',
     'Col. Centro, Hermosillo'),
    ('Laura Martinez Soto', '6623000002',
     'Col. San Benito, Hermosillo'),
    ('Pedro Gutierrez Leon', '6623000003',
     'Col. Olivares, Hermosillo'),
    ('Isabel Romero Diaz', '6623000004',
     'Col. Modelo, Hermosillo'),
    ('Raul Espinoza Vega', '6623000005',
     'Col. Las Quintas, Hermosillo'),
    ('Cecilia Navarro Gil', '6623000006',
     'Col. Palo Verde, Hermosillo'),
    ('Fernando Acosta Ruiz', '6623000007',
     'Col. Pueblitos, Hermosillo'),
    ('Natalia Castro Mora', '6623000008',
     'Col. Villa de Seris, Hermosillo'),
    ('Manuel Valenzuela Paz', '6623000009',
     'Col. San Benito, Hermosillo'),
    ('Rosa Beltran Cruz', '6623000010',
     'Col. Ley 57, Hermosillo'),
    ('Arturo Flores Luna', '6623000011',
     'Col. Las Lomas, Hermosillo'),
    ('Diana Cardenas Rios', '6623000012',
     'Col. Centro, Hermosillo'),
    ('Sergio Ochoa Reyes', '6623000013',
     'Col. Nuevo Hermosillo, Hermosillo'),
    ('Elena Pineda Torres', '6623000014',
     'Col. Pitic, Hermosillo'),
    ('Javier Moreno Acosta', '6623000015',
     'Col. Solidaridad, Hermosillo');
GO


-- 7. DESGLOSES DE COMPRAS


INSERT INTO Desgloses (ID_catalogo, Cantidad)
VALUES
    (1000, 2),
    (1001, 1),
    (1002, 3),
    (1003, 2),
    (1004, 1),
    (1005, 2),
    (1006, 4),
    (1007, 1),
    (1008, 3),
    (1009, 2),
    (1010, 1),
    (1011, 1),
    (1012, 5),
    (1013, 4),
    (1014, 2),
    (1015, 3),
    (1016, 1),
    (1017, 1),
    (1018, 2),
    (1019, 3),
    (1020, 2),
    (1021, 1),
    (1022, 4),
    (1023, 2),
    (1024, 1),
    (1025, 2),
    (1026, 3),
    (1027, 4),
    (1028, 1),
    (1029, 2),
    (1000, 1),
    (1005, 3),
    (1008, 2),
    (1013, 5),
    (1017, 2),
    (1018, 3),
    (1023, 1),
    (1024, 2),
    (1026, 1),
    (1028, 3);
GO

-- 8. VENTAS
-- Los montos corresponden al precio del
-- producto multiplicado por su cantidad.

INSERT INTO Venta
    (ID_desglose, Monto_total, Fecha, ID_empleado, ID_cliente)
VALUES
    (5000, 65.00, '2026-09-01', 6, 2000),
    (5001, 38.00, '2026-09-01', 7, 2001),
    (5002, 89.70, '2026-09-02', 8, NULL),
    (5003, 49.00, '2026-09-02', 6, 2002),
    (5004, 42.00, '2026-09-03', 7, 2003),
    (5005, 57.00, '2026-09-03', 8, NULL),
    (5006, 76.00, '2026-09-04', 6, 2004),
    (5007, 95.00, '2026-09-04', 7, 2005),
    (5008, 36.00, '2026-09-05', 8, 2006),
    (5009, 43.00, '2026-09-05', 6, NULL),
    (5010, 25.00, '2026-09-06', 7, 2007),
    (5011, 68.00, '2026-09-06', 8, 2008),
    (5012, 72.50, '2026-09-07', 6, 2009),
    (5013, 79.60, '2026-09-07', 7, 2010),
    (5014, 36.00, '2026-09-08', 8, NULL),
    (5015, 66.00, '2026-09-08', 6, 2011),
    (5016, 45.00, '2026-09-09', 7, 2012),
    (5017, 58.00, '2026-09-09', 8, 2013),
    (5018, 84.00, '2026-09-10', 6, 2014),
    (5019, 78.00, '2026-09-10', 7, NULL),
    (5020, 64.00, '2026-09-11', 8, 2000),
    (5021, 28.00, '2026-09-11', 6, 2001),
    (5022, 120.00, '2026-09-12', 7, 2002),
    (5023, 136.00, '2026-09-12', 8, 2003),
    (5024, 145.00, '2026-09-13', 6, NULL),
    (5025, 96.00, '2026-09-13', 7, 2004),
    (5026, 67.50, '2026-09-14', 8, 2005),
    (5027, 64.00, '2026-09-14', 6, 2006),
    (5028, 39.00, '2026-09-15', 7, 2007),
    (5029, 37.00, '2026-09-15', 8, NULL),
    (5030, 32.50, '2026-09-16', 6, 2008),
    (5031, 85.50, '2026-09-16', 7, 2009),
    (5032, 24.00, '2026-09-17', 8, 2010),
    (5033, 99.50, '2026-09-17', 6, 2011),
    (5034, 116.00, '2026-09-18', 7, 2012),
    (5035, 126.00, '2026-09-18', 8, NULL),
    (5036, 68.00, '2026-09-19', 6, 2013),
    (5037, 290.00, '2026-09-19', 7, 2014),
    (5038, 22.50, '2026-09-20', 8, 2000),
    (5039, 117.00, '2026-09-20', 6, NULL);
GO
