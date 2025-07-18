-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
--------------------------------------------------------------------------------------------------
/* Objetivo del KPI 4

�Qu� categor�as se venden m�s y en qu� zonas?
Esto aporta directamente a decisiones clave como:

1. Optimizaci�n de inventario
2. Segmentaci�n de campa�as de marketing
3. Estrategias de distribuci�n

(REGLA DE NEGOCIO)
Identificar las categor�as de productos con mayor volumen de ventas 
(puede ser por cantidad o por ingreso) mensualmente.
*/
--------------------------------------------------------------------------------------------------

-- KPI 4: Categor�as m�s vendidas por ingreso mensualSelect
Select 
	YEAR (O.Fecha_orden) As A�o,
	MONTH (O.Fecha_orden) Mes_numero,
	DATENAME(MONTH, O.Fecha_orden) As Mes,
	C.Nombre_categoria,
	SUM(DO.Cantidad * DO.Precio_unitario) As Ingreso_total
FROM Ordenes O
JOIN Detalles_orden DO ON O.Id_orden = DO.Id_orden
JOIN Productos P ON DO.Id_productos = P.Id_productos
JOIN Categoria C ON P.Id_categoria = C.Id_categoria
GROUP BY YEAR(O.Fecha_orden), MONTH(O.Fecha_orden), DATENAME(MONTH,O.Fecha_orden), C.Nombre_categoria
ORDER BY A�o, Mes_numero, Ingreso_total DESC;
