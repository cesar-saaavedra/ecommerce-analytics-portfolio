-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
-------------------------------------------------------------------------------------------------
-- Script: Dim_clientes.sql
-- Objetivo: Crear la tabla Dim_clientes
-- Autor: C�sar Saavedra
-- Fecha: 2025-07-19
-------------------------------------------------------------------------------------------------
-- Creamos la tabla en SQL
CREATE TABLE Dim_Clientes (
	Id_cliente INT PRIMARY KEY,   
	Nombre NVARCHAR (225),
	Pais NVARCHAR (225),
	Ciudad NVARCHAR (225),
	Fecha_cumplea�os DATETIME,
	Edad INT
);
-- Insertamos datos de la tabla original Clientes
INSERT INTO Dim_Clientes (Id_cliente, Nombre, Pais, Ciudad, Fecha_cumplea�os, Edad)
	SELECT 
		Id_cliente, 
		Nombre, 
		Pais, 
		Ciudad, 
		Fecha_cumplea�os, 
		DATEDIFF( YEAR, Fecha_cumplea�os,GETDATE())
			- CASE
				WHEN MONTH (Fecha_cumplea�os) > MONTH (GETDATE())
				OR (MONTH(Fecha_cumplea�os) = MONTH(GETDATE()) AND DAY(Fecha_cumplea�os) > DAY(GETDATE()))
				THEN 1
				ELSE 0
			END As Edad
	FROM Clientes;

-- validamos el estado de la tabla
Select * from Dim_Clientes;


