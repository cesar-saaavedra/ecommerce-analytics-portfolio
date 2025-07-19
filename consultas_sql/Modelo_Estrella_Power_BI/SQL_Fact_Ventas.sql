-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
-------------------------------------------------------------------------------------------------
-- *Nota: Apartir de este momento se conocerá la tabla de Detalles ordenes como Ventas.
-- Script: Fact_ventas.sql
-- Objetivo: Crear la tabla Fact_ventas
-- Autor: César Saavedra
-- Fecha: 2025-07-19
-------------------------------------------------------------------------------------------------
-- Creamos la Fact_Ventas en SQL

CREATE TABLE Fact_ventas (
	Id_detalle INT PRIMARY KEY,
	Id_orden INT,
	Id_productos INT,
	Id_cliente INT,
	Id_empleado INT,
	Fecha_orden DATE,
	Cantidad INT,
	Precio_unitario DECIMAL (10,2),
	Total As (Cantidad * Precio_unitario) PERSISTED
);
-- Insertamos los datos en la fact table.
INSERT INTO Fact_ventas ( Id_detalle, Id_orden, Id_productos, Id_cliente, Id_empleado, Fecha_orden, Cantidad, Precio_unitario)
SELECT 
	D.Id_detalle, 
	D.Id_orden, 
	D.Id_productos, 
	O.Id_cliente, 
	O.Id_empleado, 
	O.Fecha_orden, 
	D.Cantidad, 
	D.Precio_unitario
FROM Detalles_orden D
JOIN Ordenes O on D.Id_orden = O.Id_orden;

-- Validar que el la Fact table esta correcta.
Select * from Fact_ventas; 
