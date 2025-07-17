--Creamos la base de datos Tienda Tecnologia 
CREATE DATABASE TiendaTecnologia;
GO
--Indicamos la BD sobre la que trabajaremos
USE TiendaTecnologia;
GO
--Creamos las tabas del M.E.R
CREATE TABLE Clientes (
Id_cliente INT PRIMARY KEY IDENTITY (1,1),
Nombre NVARCHAR (225),
Email NVARCHAR (225) UNIQUE NOT NULL,
Pais NVARCHAR (225) NOT NULL,
Ciudad NVARCHAR (225) NOT NULL,
Fecha_Cumpleaños DATETIME NOT NULL,
);

CREATE TABLE Empleados (
Id_Empleado INT PRIMARY KEY IDENTITY (1,1),
Nombre NVARCHAR (225),
Cargo NVARCHAR (225) NOT NULL,
Ciudad Nvarchar (225) NOT NULL,
);

CREATE TABLE Categoria (
Id_categoria INT PRIMARY KEY IDENTITY (1,1),
Nombre_categoria NVARCHAR (225) NOT NULL
);

CREATE TABLE Productos (
Id_productos INT PRIMARY KEY IDENTITY (1,1),
Nombre_producto NVARCHAR (225) NOT NULL,
Precio_unitario INT NOT NULL,
Id_categoria INT NOT NULL,
FOREIGN KEY (Id_categoria) REFERENCES Categoria(Id_categoria)
);


CREATE TABLE Metodos_pago (
Id_Metodo INT PRIMARY KEY, 
Nombre_metodo NVARCHAR (225) NOT NULL,
);

CREATE TABLE Ordenes (
Id_orden INT PRIMARY KEY,
Id_cliente INT NOT NULL,
Id_empleado INT NOT NULL,
Fecha_orden DATETIME NOT NULL,
Id_metodo INT NOT NULL,
TOTAL INT NOT NULL,
FOREIGN KEY (Id_cliente) REFERENCES Clientes(Id_cliente),
FOREIGN KEY (Id_Empleado) REFERENCES Empleados(Id_Empleado),
FOREIGN KEY (Id_Metodo) REFERENCES Metodos_pago(Id_Metodo)
);

CREATE TABLE Detalles_orden (
Id_detalle INT PRIMARY KEY IDENTITY (1,1),
Id_orden INT NOT NULL,
Id_productos INT NOT NULL,
Cantidad INT NOT NULL,
Subtotal INT NOT NULL,
FOREIGN KEY (Id_orden) REFERENCES Ordenes(Id_orden),
FOREIGN KEY (Id_productos) REFERENCES Productos(Id_productos)
);

CREATE TABLE Envios_Clientes (
  Id_envio INT PRIMARY KEY,
  Id_orden INT NOT NULL,
  Direccion_envio NVARCHAR(255) NOT NULL,
  Ciudad NVARCHAR(100) NOT NULL,
  Fecha_envio DATETIME NOT NULL
);
ALTER TABLE Envios_Clientes
ADD CONSTRAINT FK_Envios_Clientes_Ordenes
FOREIGN KEY (Id_orden) REFERENCES Ordenes (Id_orden);

/*CREATE TABLE Envios (
Id_envio INT PRIMARY KEY,
Id_orden INT NOT NULL,
Fecha_envio DATETIME NOT NULL,
Fecha_entrega DATETIME NOT NULL,
Estado_envio NVARCHAR (225) NOT NULL,
FOREIGN KEY (Id_orden) REFERENCES Ordenes (Id_orden)
);*/
