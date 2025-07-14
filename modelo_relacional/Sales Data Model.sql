CREATE TABLE [Clientes] (
  [Id_cliente] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [Nombre] nvarchar(255),
  [Email] nvarchar(255) UNIQUE NOT NULL,
  [País] nvarchar(255) NOT NULL,
  [Ciudad] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Empleados] (
  [Id_empleado] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [Nombre] nvarchar(255),
  [Cargo] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Categoria] (
  [Id_categoria] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [Nombre_categoria] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Productos] (
  [Id_producto] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [Nombre_producto] nvarchar(255) NOT NULL,
  [Precio_unitario] int NOT NULL,
  [Id_categoria] int NOT NULL
)
GO

CREATE TABLE [Ordenes] (
  [Id_orden] int PRIMARY KEY NOT NULL,
  [Id_cliente] int NOT NULL,
  [Id_empleado] int NOT NULL,
  [Fecha_orden] datetime NOT NULL,
  [Id_Metodo] nvarchar(255) NOT NULL,
  [Total] int NOT NULL
)
GO

CREATE TABLE [Detalles_orden] (
  [Id_detalle] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [Id_orden] int NOT NULL,
  [Id_producto] int NOT NULL,
  [Cantidad] int NOT NULL,
  [Subtotal] int NOT NULL
)
GO

CREATE TABLE [Envios] (
  [id_envio] int PRIMARY KEY NOT NULL,
  [id_orden] int NOT NULL,
  [fecha_envio] datetime NOT NULL,
  [fecha_entrega] datetime NOT NULL,
  [estado_envio] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Metodos_pago] (
  [Id_Metodo] int PRIMARY KEY NOT NULL,
  [nombre_metodo] nvarchar(255) NOT NULL
)
GO

ALTER TABLE [Productos] ADD FOREIGN KEY ([Id_categoria]) REFERENCES [Categoria] ([Id_categoria])
GO

ALTER TABLE [Ordenes] ADD FOREIGN KEY ([Id_cliente]) REFERENCES [Clientes] ([Id_cliente])
GO

ALTER TABLE [Ordenes] ADD FOREIGN KEY ([Id_empleado]) REFERENCES [Empleados] ([Id_empleado])
GO

ALTER TABLE [Ordenes] ADD FOREIGN KEY ([Id_Metodo]) REFERENCES [Metodos_pago] ([Id_Metodo])
GO

ALTER TABLE [Detalles_orden] ADD FOREIGN KEY ([Id_orden]) REFERENCES [Ordenes] ([Id_orden])
GO

ALTER TABLE [Detalles_orden] ADD FOREIGN KEY ([Id_producto]) REFERENCES [Productos] ([Id_producto])
GO

ALTER TABLE [Envios] ADD FOREIGN KEY ([id_orden]) REFERENCES [Ordenes] ([Id_orden])
GO
