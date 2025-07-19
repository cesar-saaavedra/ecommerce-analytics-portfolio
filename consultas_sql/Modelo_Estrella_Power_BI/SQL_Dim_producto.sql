-- llamamos a BD Tienda tecnologi.
USE TiendaTecnologia;
Go

-------------------------------------------------------------------------------------------------
-- Script: Dim_producto.sql
-- Objetivo: Crear la tabla Dim_producto
-- Autor: César Saavedra
-- Fecha: 2025-07-18
-------------------------------------------------------------------------------------------------

-- Creamos la tabla en SQL
CREATE TABLE Dim_producto (
	Id_producto INT PRIMARY KEY,
	Nombre_producto NVARCHAR (225),
	Categoria NVARCHAR (225),
	Nombre_categoria NVARCHAR (225),
	Precio_unitario INT,
	Stock INT
	);
-- Creamos una tabla auxiliar para unificar la infomación en una sola tabla. 
SELECT DISTINCT 
	P.Id_productos,
	P.Nombre_producto,
	P.Id_categoria,
	C.Nombre_categoria,
	P.Precio_unitario,
	P.Stock
INTO Temp_producto
FROM Categoria C
INNER JOIN Productos P ON C.Id_categoria = P.Id_categoria;

-- Insertamos los datos en la nueva tabla Temp_producto

INSERT INTO Dim_producto (Id_producto, Nombre_producto, Nombre_categoria,Precio_unitario,Stock)
	SELECT Id_productos, Nombre_producto, Nombre_categoria, Precio_unitario, Stock
	FROM Temp_producto;

-- Validamos la creación de la tabla temporal
Select * from Temp_producto;

--Insertamos datos unicos de la tabla de dos tablas Porductos y Categoria.
INSERT INTO Dim_producto(Id_producto, Nombre_producto, Categoria, Precio_unitario, Stock)
	SELECT DISTINCT 
		Id_productos, Nombre_producto, Nombre_categoria, Precio_unitario, Stock
	FROM Temp_producto;

-- Validamos Dim_producto
Select * from Dim_producto;
