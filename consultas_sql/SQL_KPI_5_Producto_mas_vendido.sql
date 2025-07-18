-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
--------------------------------------------------------------------------------------------------
/* Objetivo del KPI 5

¿Qué Productos se venden más y en qué zonas?
Esto aporta directamente a decisiones clave como:

1. Optimización de inventario
2. Segmentación de campañas de marketing
3. Estrategias de distribución

(REGLA DE NEGOCIO)
Conocer los productos más populares y su distribución geográfica para optimizar
el inventario y personalizar campañas.

*/
--------------------------------------------------------------------------------------------------

--  KPI 5: Productos más vendidos por ciudad.

Select
	P.Nombre_producto,
	CL.Ciudad,
	COUNT(DISTINCT O.Id_orden) As Numero_Orden,
	SUM(DO.Cantidad) As Unidades_Ventidades,
	SUM(DO.Cantidad * DO.precio_unitario) As Ingreso_total
FROM Ordenes O
JOIN Detalles_orden DO ON O.Id_orden = DO.Id_orden
JOIN Productos P ON DO.Id_productos = P.Id_productos
JOIN Clientes CL ON O.Id_cliente = CL.Id_cliente
GROUP BY P.Nombre_producto, CL.Ciudad
ORDER BY Ingreso_total DESC; 