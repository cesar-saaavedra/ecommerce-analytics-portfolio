-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
--------------------------------------------------------------------------------------------------
/* Objetivo del KPI 4

¿Qué categorías se venden más y en qué zonas?
Esto aporta directamente a decisiones clave como:

1. Optimización de inventario
2. Segmentación de campañas de marketing
3. Estrategias de distribución

(REGLA DE NEGOCIO)
Identificar las categorías de productos con mayor volumen de ventas 
(puede ser por cantidad o por ingreso) mensualmente.
*/
--------------------------------------------------------------------------------------------------

-- KPI 4: Categorías más vendidas por ingreso mensualSelect
Select 
	YEAR (O.Fecha_orden) As Año,
	MONTH (O.Fecha_orden) Mes_numero,
	DATENAME(MONTH, O.Fecha_orden) As Mes,
	C.Nombre_categoria,
	SUM(DO.Cantidad * DO.Precio_unitario) As Ingreso_total
FROM Ordenes O
JOIN Detalles_orden DO ON O.Id_orden = DO.Id_orden
JOIN Productos P ON DO.Id_productos = P.Id_productos
JOIN Categoria C ON P.Id_categoria = C.Id_categoria
GROUP BY YEAR(O.Fecha_orden), MONTH(O.Fecha_orden), DATENAME(MONTH,O.Fecha_orden), C.Nombre_categoria
ORDER BY Año, Mes_numero, Ingreso_total DESC;
