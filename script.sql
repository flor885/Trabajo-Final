create database PapeleriaVioleta

use PapeleriaVioleta


CREATE TABLE [Departamentos] (
    [ID_Departamento] INT IDENTITY(1,1) PRIMARY KEY,
    [Nombre_Departamento] VARCHAR(50) NOT NULL,
    [Ubicación] VARCHAR(50) NOT NULL
)
GO


INSERT INTO [Departamentos] ([Nombre_Departamento], [Ubicación]) VALUES
('Gestión de Proyectos', 'Edificio Principal, 2do piso'),
('Ventas', 'Edificio Principal, 1er piso'),
('Marketing', 'Edificio Principal, 3er piso'),
('Recursos Humanos', 'Edificio Anexo, 1er piso'),
('Contabilidad', 'Edificio Anexo, 2do piso'),
('Finanzas', 'Edificio Principal, 4to piso'),
('Tecnología de la Información', 'Edificio Anexo, 3er piso'),
('Operaciones', 'Edificio Principal, 5to piso'),
('Logística', 'Edificio Anexo, 4to piso'),
('Mantenimiento', 'Edificio Principal, Sótano');


CREATE TABLE [Empleados] (
    [ID_Empleado] INT IDENTITY(1,1) PRIMARY KEY,
    [Nombre_Empleado] VARCHAR(50) NOT NULL,
    [ID_Departamento] INT NOT NULL,
    [Cargo] VARCHAR(50) NOT NULL,
    [Fecha_Contratación] DATE NOT NULL,
    CONSTRAINT [FK_Empleados_Departamentos] FOREIGN KEY ([ID_Departamento]) REFERENCES [Departamentos]([ID_Departamento])
)
GO


INSERT INTO [Empleados] ([Nombre_Empleado], [ID_Departamento], [Cargo], [Fecha_Contratación]) VALUES
('Jose Angel', 1, 'Gerente de Proyectos', '2020-01-01'),
('Sonia López', 2, 'Vendedora', '2021-03-05'),
('Americo Jimenez', 3, 'Publicista', '2022-07-10'),
('Alex Rodríguez', 4, 'Reclutadora', '2023-11-15'),
('Carlos Clemente', 5, 'Contador', '2019-02-20'),
('Luis Figueroa', 6, 'Analista Financiero', '2022-05-12'),
('Ricardo Almanzar', 7, 'Administrador de Redes', '2021-09-08'),
('Rosandy Peña', 8, 'Gerente de Operaciones', '2020-04-15'),
('Julio Perez', 9, 'Supervisor de Logística', '2023-02-03'),
('Jose Fernández', 10, 'Técnico de Mantenimiento', '2018-10-22');


CREATE TABLE [Facturas] (
    [ID_Factura] INT IDENTITY(1,1) PRIMARY KEY,
    [Fecha_Factura] DATE NOT NULL,
    [ID_Pedido] INT NOT NULL,
    [Monto_Total] DECIMAL(10, 2) NOT NULL,
    CONSTRAINT [FK_Facturas_Pedidos] FOREIGN KEY ([ID_Pedido]) REFERENCES [Pedidos]([ID_Pedido])
)
GO


INSERT INTO [Facturas] ([Fecha_Factura], [ID_Pedido], [Monto_Total]) VALUES
('2023-03-01', 11, 3500.00),
('2023-04-05', 12, 500.00),
('2023-05-10', 13, 225.00),
('2023-06-15', 14, 150.00),
('2023-07-20', 15, 3000.00),
('2023-08-01', 16, 40.00),
('2023-09-05', 17, 36.00),
('2023-10-10', 18, 60.00),
('2023-11-15', 19, 75.00),
('2023-12-20', 20, 90.00);


CREATE TABLE [Pedidos] (
    [ID_Pedido] INT IDENTITY(1,1) PRIMARY KEY,
    [Fecha_Pedido] DATE NOT NULL,
    [ID_Empleado] INT NOT NULL,
    [ID_Producto] INT NOT NULL,
    [Cantidad] INT NOT NULL,
    CONSTRAINT [FK_Pedidos_Empleados] FOREIGN KEY ([ID_Empleado]) REFERENCES [Empleados]([ID_Empleado]),
    CONSTRAINT [FK_Pedidos_Productos] FOREIGN KEY ([ID_Producto]) REFERENCES [Productos]([ID_Producto])
)
GO


INSERT INTO [Pedidos] ([Fecha_Pedido], [ID_Empleado], [ID_Producto], [Cantidad]) VALUES
('2023-03-01', 1, 1, 10),
('2023-04-05', 2, 2, 20),
('2023-05-10', 3, 3, 15),
('2023-06-15', 4, 4, 5),
('2023-07-20', 5, 5, 30),
('2023-08-01', 6, 6, 2),
('2023-09-05', 7, 7, 3),
('2023-10-10', 8, 8, 4),
('2023-11-15', 9, 9, 5),
('2023-12-20', 10, 10, 6);


CREATE TABLE [Productos] (
    [ID_Producto] INT IDENTITY(1,1) PRIMARY KEY,
    [Nombre_Producto] VARCHAR(50) NOT NULL,
    [Descripción] VARCHAR(200) NOT NULL,
    [Precio_Unitario] DECIMAL(10, 2) NOT NULL,
    [Stock] INT NOT NULL
)
GO


INSERT INTO [Productos] ([Nombre_Producto], [Descripción], [Precio_Unitario], [Stock]) VALUES
('Resma de papel bond A4', '500 hojas, 75 gr/m²', 350.00, 100),
('Bolígrafo azul', 'Punta fina, tinta permanente', 25.00, 50),
('Lápiz HB', 'Borrador y sacapuntas incluidos', 15.00, 75),
('Marcador negro', 'Punta gruesa, tinta permanente', 30.00, 25),
('Cuaderno espiral', '100 hojas, tamaño carta', 100.00, 80),
('Carpeta con elástico', 'Tamaño carta, color azul', 20.00, 60),
('Tijeras de punta roma', '10 cm de largo', 12.00, 45),
('Clips de papel', 'Caja de 100 unidades', 5.00, 80),
('Cinta adhesiva transparente', 'Rollo de 50 metros', 18.00, 70),
('Cuaderno Cuadriculado', '122 hojas', 67.00, 70);