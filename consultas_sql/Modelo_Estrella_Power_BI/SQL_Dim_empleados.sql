-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
-------------------------------------------------------------------------------------------------
-- Script: Dim_Empleados.sql
-- Objetivo: Crear la tabla Dim_Empleados
-- Autor: César Saavedra
-- Fecha: 2025-07-19
-------------------------------------------------------------------------------------------------
-- Creamos la tabla en SQL
CREATE TABLE Dim_empleados (
	Id_Empleado INT PRIMARY KEY,
	Nombre NVARCHAR (225),
	Cargo NVARCHAR (225),
	Ciudad NVARCHAR (225)
);

--Insertamos los satos de la tabla original Empleados
INSERT INTO Dim_empleados (Id_empleado, Nombre, Cargo, Ciudad)
SELECT 
	Id_empleado,
	Nombre,
	Cargo,
	Ciudad
FROM Empleados;

-- Validamos que tabla Dim_empleados este correcta. 
Select * from Dim_empleados;