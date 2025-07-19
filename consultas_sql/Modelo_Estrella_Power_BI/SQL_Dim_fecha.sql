-- llamamos a BD Tienda tecnologi.
USE TiendaTecnologia;
Go

-------------------------------------------------------------------------------------------------
-- Script: Dim_fecha.sql
-- Objetivo: Crear la tabla Dim_fecha
-- Autor: César Saavedra
-- Fecha: 2025-07-18
-------------------------------------------------------------------------------------------------

/* 
Creamos la Dim_Fecha para nuestro modelo estrella en Power BI.
primero Validamos en esta bala fecha minima y fecha maxima con el objetivo de establecer el rango
para la Dim_fecha.
*/
Select
	MIN(Fecha_orden) As Fecha_minima,
	MAX(Fecha_orden) As Fecha_Maxima
FROM Ordenes;

-- Creamos Dim_fecha
CREATE TABLE Dim_fecha (
	Id_fecha INT PRIMARY KEY,
	Fecha DATE, 
	Año INT,
	Mes INT,
	Nombre_mes Nvarchar (20),
	Trimestre INT
);
-- Rellenamos la tabla con fechas desde 2025-01-01 hasta 2025-12-31
DECLARE @fecha_inicio DATE = '2025-01-01';
DECLARE @fecha_fin DATE = '2025-12-31';

WHILE @fecha_inicio <= @fecha_fin
BEGIN
    INSERT INTO dim_fecha (
        Id_fecha,
        Fecha,
        Año,
        Mes,
        Nombre_mes,
        Trimestre
    )
    VALUES (
        CAST(FORMAT(@fecha_inicio, 'yyyyMMdd') AS INT),
        @fecha_inicio,
        YEAR(@fecha_inicio),
        MONTH(@fecha_inicio),
        DATENAME(MONTH, @fecha_inicio),
        DATEPART(QUARTER, @fecha_inicio)
    );

    SET @fecha_inicio = DATEADD(DAY, 1, @fecha_inicio);
END;
		
Select *from Dim_fecha;
